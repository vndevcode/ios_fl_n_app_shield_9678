import 'package:ios_fl_n_app_shield_9678/models/faq_item_model.dart';

/// Prepared question / answer pairs used by the Guest Assistant chat.
/// No real AI or external API is involved — the assistant replies using
/// this fixed local mapping only.
abstract final class AssistantData {
  static const String greeting =
      'Hello. Choose a question below and I’ll help with your visit.';

  static const List<FaqItemModel> questions = [
    FaqItemModel(
      id: 'q1',
      question: 'How do I activate my visitor pass?',
      answer:
          'Show your visitor pass to resort staff during your visit. Staff may activate full access on-site.',
    ),
    FaqItemModel(
      id: 'q2',
      question: 'Where can I request dining help?',
      answer:
          'Open the Services tab and choose Dining Reservation or Private Dining Help.',
    ),
    FaqItemModel(
      id: 'q3',
      question: 'Can I book a comfort lounge?',
      answer:
          'Yes. Go to Services and send a request for the Quiet Comfort Lounge.',
    ),
    FaqItemModel(
      id: 'q4',
      question: 'Where do I see my submitted requests?',
      answer:
          'Service requests are shown in My Service Requests. Event requests are shown in My Event Requests.',
    ),
    FaqItemModel(
      id: 'q5',
      question: 'How do I find event information?',
      answer:
          'Open the Events tab, choose a day from the week calendar, and tap an event card.',
    ),
    FaqItemModel(
      id: 'q6',
      question: 'Can staff help me during my visit?',
      answer:
          'Yes. Use the Guest Services Desk request or show your visitor pass to staff on-site.',
    ),
    FaqItemModel(
      id: 'q7',
      question: 'Can I save places I want to visit?',
      answer:
          'Yes. Open Resort Places, tap Save on any place card, and view it later in the Saved tab.',
    ),
    FaqItemModel(
      id: 'q8',
      question: 'What is the pass code used for?',
      answer:
          'The pass code helps staff identify your visit support requests and confirm available services.',
    ),
  ];
}
