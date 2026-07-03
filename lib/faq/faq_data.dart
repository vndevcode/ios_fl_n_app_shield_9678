import 'package:ios_fl_n_app_shield_9678/models/faq_item_model.dart';

abstract final class FaqData {
  static const List<FaqItemModel> items = [
    FaqItemModel(
      id: 'faq_01',
      question: 'How do I start my visit?',
      answer:
          'Open your visitor pass, check the main resort places, and use the Services tab if you need help with directions, dining, lounge access, or event requests.',
    ),
    FaqItemModel(
      id: 'faq_02',
      question: 'Where should I go first after entering the building?',
      answer:
          'The Main Lobby is the best first point. From there, you can reach guest services, dining areas, lounges, and event spaces more easily.',
    ),
    FaqItemModel(
      id: 'faq_03',
      question: 'Do I need to show my visitor pass at the entrance?',
      answer:
          'You may be asked to show your visitor pass during your visit. Keep it ready so staff can assist you faster.',
    ),
    FaqItemModel(
      id: 'faq_04',
      question: 'How is the pass code activated?',
      answer:
          'The pass code can be activated by staff during your on-site visit. This helps unlock the full guest-service experience inside the venue.',
    ),
    FaqItemModel(
      id: 'faq_05',
      question: 'What should I do if my pass code is not active yet?',
      answer:
          'Visit the Guest Services Desk or ask a staff member on-site. They can help confirm your visit and activate the pass if available.',
    ),
    FaqItemModel(
      id: 'faq_06',
      question: 'Can I use the app before arriving?',
      answer:
          'Yes. You can review resort places, check events, read service details, and prepare your visit before entering the building.',
    ),
    FaqItemModel(
      id: 'faq_07',
      question: 'Can I request a service while already inside the venue?',
      answer:
          'Yes. Open the Services tab, choose the service you need, fill in the request form, and submit it for review.',
    ),
    FaqItemModel(
      id: 'faq_08',
      question: 'Can I share a resort place with a friend?',
      answer:
          'Yes. Tap the Share button on a place card or detail screen to share that resort location.',
    ),
    FaqItemModel(
      id: 'faq_09',
      question: 'Where can I wait if I arrive early?',
      answer:
          'You can use the Arrival Waiting Zone or Main Lobby. These areas are suitable for short waiting, meeting friends, or preparing your visit.',
    ),
    FaqItemModel(
      id: 'faq_10',
      question: 'Is there a quieter place to rest?',
      answer:
          'Yes. The Quiet Comfort Lounge and Indoor Relaxation Corner are designed for calmer breaks and short rest moments.',
    ),
    FaqItemModel(
      id: 'faq_11',
      question: 'Can I request access to a lounge area?',
      answer:
          'Yes. Open Services and choose Quiet Comfort Lounge or Lounge Booking Request. Submit your request with your preferred time.',
    ),
    FaqItemModel(
      id: 'faq_12',
      question: 'How do I check today’s events?',
      answer:
          'Open the Events tab and select today from the weekly calendar. Event cards will show available details and request options.',
    ),
    FaqItemModel(
      id: 'faq_13',
      question: 'Can I request access to an event?',
      answer:
          'Yes. Open an event detail screen and tap “Send Event Request.” Fill in your guest details and submit the request.',
    ),
    FaqItemModel(
      id: 'faq_14',
      question: 'Can I use the app without speaking to staff?',
      answer:
          'You can explore places, view events, save locations, and submit requests in the app. Some features may still require staff confirmation during your visit.',
    ),
    FaqItemModel(
      id: 'faq_15',
      question: 'What is the best screen to use during my visit?',
      answer:
          'Use Pass for quick access, Services for support requests, Resort for places to visit, and Events for today’s schedule.',
    ),
  ];
}
