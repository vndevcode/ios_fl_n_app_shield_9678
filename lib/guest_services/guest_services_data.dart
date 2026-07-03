import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/models/guest_service_model.dart';

abstract final class GuestServicesData {
  static const List<GuestServiceModel> services = [
    GuestServiceModel(
      id: 'service_01',
      title: 'Guest Services Desk',
      iconIdea: 'Info desk / support bell',
      icon: FontAwesomeIcons.bellConcierge,
      status: 'Available Today',
      shortDescription:
          'Get help with visit details, resort directions, booking questions, and general guest support during your stay.',
      requestButtonLabel: 'Request Support',
      requestNote:
          'Use this service if you need assistance with navigation, reservations, timing, or general visit information.',
    ),
    GuestServiceModel(
      id: 'service_02',
      title: 'Quiet Comfort Lounge',
      iconIdea: 'Lounge chair / moon',
      icon: FontAwesomeIcons.couch,
      status: 'Limited Seats',
      shortDescription:
          'Request access to a calm seating area designed for short breaks, quiet waiting, and comfortable relaxation.',
      requestButtonLabel: 'Book Lounge',
      requestNote:
          'Best for guests who want a softer atmosphere away from active resort areas.',
    ),
    GuestServiceModel(
      id: 'service_03',
      title: 'Dining Reservation',
      iconIdea: 'Fork and plate',
      icon: FontAwesomeIcons.utensils,
      status: 'Open',
      shortDescription:
          'Send a request for dining time, table assistance, restaurant guidance, or availability information.',
      requestButtonLabel: 'Request Table',
      requestNote:
          'Use this service to organize a dining moment before or during your visit.',
    ),
    GuestServiceModel(
      id: 'service_04',
      title: 'Room Comfort Support',
      iconIdea: 'Bed / temperature control',
      icon: FontAwesomeIcons.bed,
      status: 'Available',
      shortDescription:
          'Request help with room comfort details such as temperature, lighting, seating setup, or basic guest-room support.',
      requestButtonLabel: 'Request Comfort Help',
      requestNote:
          'Useful for guests who want a more comfortable and personalized stay experience.',
    ),
    GuestServiceModel(
      id: 'service_05',
      title: 'Parking Assistance',
      iconIdea: 'Parking sign / car',
      icon: FontAwesomeIcons.squareParking,
      status: 'Active',
      shortDescription:
          'Ask for arrival guidance, parking information, accessible parking help, or direction support near the venue.',
      requestButtonLabel: 'Request Parking Help',
      requestNote:
          'Recommended before arrival or when you need help finding the right parking area.',
    ),
    GuestServiceModel(
      id: 'service_06',
      title: 'Event Seat Request',
      iconIdea: 'Ticket / calendar seat',
      icon: FontAwesomeIcons.ticket,
      status: 'In Review',
      shortDescription:
          'Request guest seating or access assistance for selected resort events happening inside the building.',
      requestButtonLabel: 'Send Seat Request',
      requestNote:
          'Use this when you want staff to review availability for an event you plan to attend.',
    ),
    GuestServiceModel(
      id: 'service_07',
      title: 'Private Dining Help',
      iconIdea: 'Table with star',
      icon: FontAwesomeIcons.star,
      status: 'Available by Request',
      shortDescription:
          'Ask for a more personal dining arrangement, special table guidance, or support for a small guest group.',
      requestButtonLabel: 'Request Private Dining',
      requestNote:
          'Best for guests planning a quieter or more arranged dining experience.',
    ),
    GuestServiceModel(
      id: 'service_08',
      title: 'Accessibility Support',
      iconIdea: 'Accessibility symbol / path',
      icon: FontAwesomeIcons.wheelchair,
      status: 'Available',
      shortDescription:
          'Request assistance for easier movement through the resort, seating support, entrance guidance, or accessible route help.',
      requestButtonLabel: 'Request Accessibility Help',
      requestNote:
          'Designed to help guests move through the building with more comfort and confidence.',
    ),
    GuestServiceModel(
      id: 'service_09',
      title: 'Resort Direction Help',
      iconIdea: 'Map pin / arrow',
      icon: FontAwesomeIcons.locationDot,
      status: 'Available Today',
      shortDescription:
          'Get guidance to resort places such as lounges, restaurants, event halls, service desks, and relaxation zones.',
      requestButtonLabel: 'Ask for Directions',
      requestNote:
          'Useful when you are already inside the venue and want to find the next place quickly.',
    ),
    GuestServiceModel(
      id: 'service_10',
      title: 'Conference Room Support',
      iconIdea: 'Meeting table / screen',
      icon: FontAwesomeIcons.chalkboardUser,
      status: 'Scheduled Support',
      shortDescription:
          'Request help with conference room location, seating arrangement, meeting preparation, or basic event-room guidance.',
      requestButtonLabel: 'Request Meeting Support',
      requestNote:
          'Ideal for guests visiting a business meeting, private group session, or resort conference area.',
    ),
    GuestServiceModel(
      id: 'service_11',
      title: 'Restaurant Floor Assistance',
      iconIdea: 'Restaurant floor / waiter bell',
      icon: FontAwesomeIcons.bellConcierge,
      status: 'Open Now',
      shortDescription:
          'Ask for help with restaurant floor navigation, menu guidance, waiting area information, or dining space availability.',
      requestButtonLabel: 'Request Dining Help',
      requestNote:
          'Helpful when you want quick support before choosing where to sit or dine.',
    ),
    GuestServiceModel(
      id: 'service_12',
      title: 'Scenic View Guidance',
      iconIdea: 'Waterfall / view marker',
      icon: FontAwesomeIcons.water,
      status: 'Available',
      shortDescription:
          'Request information about scenic view areas, photo-friendly spots, quiet viewpoints, and comfortable places to pause.',
      requestButtonLabel: 'Request View Guidance',
      requestNote:
          'Use this service to discover calm resort areas inspired by the Niagara atmosphere.',
    ),
    GuestServiceModel(
      id: 'service_13',
      title: 'Guest Arrival Support',
      iconIdea: 'Door / welcome sign',
      icon: FontAwesomeIcons.doorOpen,
      status: 'Available Today',
      shortDescription:
          'Request help for arrival timing, entrance guidance, pass-code questions, and first-step support inside the resort.',
      requestButtonLabel: 'Request Arrival Help',
      requestNote:
          'Best for first-time visitors who want a smoother start to their visit.',
    ),
    GuestServiceModel(
      id: 'service_14',
      title: 'Lounge Booking Request',
      iconIdea: 'Sofa / reservation mark',
      icon: FontAwesomeIcons.calendarCheck,
      status: 'Limited Availability',
      shortDescription:
          'Send a request for a lounge area where guests can wait, relax, talk, or plan the next part of their visit.',
      requestButtonLabel: 'Book Lounge Area',
      requestNote:
          'Recommended for guests who want a comfortable place between dining, events, or service appointments.',
    ),
  ];
}
