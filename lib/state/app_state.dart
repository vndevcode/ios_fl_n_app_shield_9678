import 'package:flutter/foundation.dart';
import 'package:ios_fl_n_app_shield_9678/faq/assistant_data.dart';
import 'package:ios_fl_n_app_shield_9678/models/chat_message.dart';
import 'package:ios_fl_n_app_shield_9678/models/event_request.dart';
import 'package:ios_fl_n_app_shield_9678/models/request_status.dart';
import 'package:ios_fl_n_app_shield_9678/models/service_request.dart';

/// The single source of local state for the whole app.
///
/// Holds onboarding progress, submitted service and event requests, saved
/// resort places, the visitor pass brightness mode and the assistant chat
/// history. Persistence is in-memory for the prototype session; the app is
/// structured so a storage layer could be dropped in behind the same API.
class AppState extends ChangeNotifier {
  // ---- Onboarding ---------------------------------------------------------
  bool _onboardingCompleted = false;
  bool get onboardingCompleted => _onboardingCompleted;

  void completeOnboarding() {
    if (_onboardingCompleted) return;
    _onboardingCompleted = true;
    notifyListeners();
  }

  // ---- Service requests ---------------------------------------------------
  final List<ServiceRequest> _serviceRequests = [];
  List<ServiceRequest> get serviceRequests =>
      List.unmodifiable(_serviceRequests.reversed);

  int _seq = 0;
  String _nextId(String prefix) => '${prefix}_${_seq++}';

  void addServiceRequest({
    required String serviceName,
    required String guestName,
    required String preferredTime,
    required int? guestCount,
    required String note,
  }) {
    _serviceRequests.add(
      ServiceRequest(
        id: _nextId('sr'),
        serviceName: serviceName,
        guestName: guestName,
        preferredTime: preferredTime,
        guestCount: guestCount,
        note: note,
        status: RequestStatus.pending,
        submittedOn: _today(),
      ),
    );
    notifyListeners();
  }

  // ---- Event requests -----------------------------------------------------
  final List<EventRequest> _eventRequests = [];
  List<EventRequest> get eventRequests =>
      List.unmodifiable(_eventRequests.reversed);

  void addEventRequest({
    required String eventTitle,
    required String eventDate,
    required String eventTime,
    required String guestName,
    required int guestCount,
    required String contactNote,
  }) {
    _eventRequests.add(
      EventRequest(
        id: _nextId('er'),
        eventTitle: eventTitle,
        eventDate: eventDate,
        eventTime: eventTime,
        guestName: guestName,
        guestCount: guestCount,
        contactNote: contactNote,
        status: RequestStatus.pending,
        submittedOn: _today(),
      ),
    );
    notifyListeners();
  }

  // ---- Saved resort places ------------------------------------------------
  final Set<String> _savedPlaceIds = {};
  Set<String> get savedPlaceIds => Set.unmodifiable(_savedPlaceIds);
  bool isSaved(String placeId) => _savedPlaceIds.contains(placeId);

  void toggleSaved(String placeId) {
    if (!_savedPlaceIds.add(placeId)) {
      _savedPlaceIds.remove(placeId);
    }
    notifyListeners();
  }

  // ---- Visitor pass brightness --------------------------------------------
  bool _passBright = false;
  bool get passBright => _passBright;

  void togglePassBright() {
    _passBright = !_passBright;
    notifyListeners();
  }

  void setPassBright(bool value) {
    if (_passBright == value) return;
    _passBright = value;
    notifyListeners();
  }

  // ---- Assistant chat -----------------------------------------------------
  final List<ChatMessage> _chat = [
    const ChatMessage(text: AssistantData.greeting, fromUser: false),
  ];
  List<ChatMessage> get chat => List.unmodifiable(_chat);

  /// Adds the user's chosen question and the assistant's prepared reply.
  void askAssistant(String question, String answer) {
    _chat.add(ChatMessage(text: question, fromUser: true));
    _chat.add(ChatMessage(text: answer, fromUser: false));
    notifyListeners();
  }

  // ---- Helpers ------------------------------------------------------------
  static const List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  String _today() {
    final now = DateTime.now();
    return '${_months[now.month - 1]} ${now.day}, ${now.year}';
  }
}
