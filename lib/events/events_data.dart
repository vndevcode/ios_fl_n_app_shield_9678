import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/constants/app_assets.dart';
import 'package:ios_fl_n_app_shield_9678/models/resort_event_model.dart';

abstract final class EventsData {
  static const List<ResortEventModel> events = [
    ResortEventModel(
      id: 'event_01',
      title: 'Evening Lounge Music',
      date: 'Monday, This Week',
      time: '7:30 PM – 9:30 PM',
      location: 'Evening Lounge Area',
      status: EventStatus.upcoming,
      shortDescription:
          'A relaxed live music evening with soft lounge sounds, comfortable seating, and a calm resort atmosphere.',
      fullDescription:
          'Evening Lounge Music is designed for guests who want to enjoy a slower part of the visit. The event features gentle live music in a comfortable lounge setting, making it suitable before dinner, after a restaurant visit, or between other resort activities.',
      guestNotes:
          'Best for guests who prefer a quieter evening mood and comfortable seating.',
      requestButtonLabel: 'Send Event Request',
      imageAsset: AppAssets.eveningLoungeArea,
    ),
    ResortEventModel(
      id: 'event_02',
      title: "Chef's Tasting Hour",
      date: 'Tuesday, This Week',
      time: '6:00 PM – 7:30 PM',
      location: 'Restaurant Floor',
      status: EventStatus.upcoming,
      shortDescription:
          'A curated tasting moment where guests can discover selected dishes and seasonal restaurant flavors.',
      fullDescription:
          "Chef's Tasting Hour gives visitors a chance to explore a small selection of dishes prepared for the evening. The event is focused on flavor, presentation, and a relaxed restaurant experience rather than a full formal dinner.",
      guestNotes:
          'Recommended for guests who want to explore the restaurant before choosing a full meal.',
      requestButtonLabel: 'Request Dining Access',
      imageAsset: AppAssets.restaurantFloor,
    ),
    ResortEventModel(
      id: 'event_03',
      title: 'Welcome Lobby Performance',
      date: 'Wednesday, This Week',
      time: '5:30 PM – 6:30 PM',
      location: 'Main Lobby',
      status: EventStatus.today,
      shortDescription:
          'A short live performance in the lobby area created to welcome visitors and add atmosphere to the start of the evening.',
      fullDescription:
          'Welcome Lobby Performance brings a warm first impression to the resort visit. Guests can pause in the main lobby, enjoy a short artistic performance, and continue toward dining, lounge, or event areas afterward.',
      guestNotes:
          'A good event for first-time visitors or guests arriving early.',
      requestButtonLabel: 'Send Event Request',
      imageAsset: AppAssets.mainLobby,
    ),
    ResortEventModel(
      id: 'event_04',
      title: 'Quiet Piano Session',
      date: 'Wednesday, This Week',
      time: '8:00 PM – 9:00 PM',
      location: 'Quiet Comfort Lounge',
      status: EventStatus.upcoming,
      shortDescription:
          'A calm piano session for guests who want a softer and more relaxed evening experience.',
      fullDescription:
          'Quiet Piano Session creates a peaceful atmosphere inside the comfort lounge. The event is centered around soft instrumental music, low-volume ambiance, and a slower rhythm for guests who want to take a break from busier spaces.',
      guestNotes:
          'Limited seating may be available. Request access in advance for better planning.',
      requestButtonLabel: 'Request Lounge Seat',
      imageAsset: AppAssets.quietComfortLounge,
    ),
    ResortEventModel(
      id: 'event_05',
      title: 'Restaurant Social Night',
      date: 'Thursday, This Week',
      time: '7:00 PM – 10:00 PM',
      location: 'Dining Lounge',
      status: EventStatus.upcoming,
      shortDescription:
          'A social dining evening with warm lighting, shared tables, and a relaxed restaurant atmosphere.',
      fullDescription:
          'Restaurant Social Night is created for guests who enjoy a more lively dining environment. Visitors can spend time in the dining lounge, meet others, enjoy the room atmosphere, and request seating support through the app.',
      guestNotes:
          'Best for small groups, couples, or guests who want a more active restaurant setting.',
      requestButtonLabel: 'Request Table Support',
      imageAsset: AppAssets.diningLounge,
    ),
    ResortEventModel(
      id: 'event_06',
      title: 'Scenic View Gathering',
      date: 'Thursday, This Week',
      time: '6:30 PM – 7:15 PM',
      location: 'Scenic View Area',
      status: EventStatus.upcoming,
      shortDescription:
          'A short guided gathering near the scenic area, ideal for photos and a calm Niagara-inspired moment.',
      fullDescription:
          'Scenic View Gathering gives guests a chance to pause near one of the quieter visual areas of the resort. The event is simple and atmospheric, with time for photos, short conversations, and a slower transition into the evening.',
      guestNotes:
          'Recommended before dinner or before attending a lounge event.',
      requestButtonLabel: 'Send Event Request',
      imageAsset: AppAssets.scenicViewArea,
    ),
    ResortEventModel(
      id: 'event_07',
      title: 'Weekend Lobby DJ Set',
      date: 'Friday, This Week',
      time: '9:00 PM – 11:30 PM',
      location: 'Main Lobby Stage Area',
      status: EventStatus.upcoming,
      shortDescription:
          'A stylish weekend music set with a more energetic evening mood inside the central resort area.',
      fullDescription:
          'Weekend Lobby DJ Set brings a more active night atmosphere to the resort. The event is designed for guests who want music, movement, and a social environment without needing to attend a large concert hall event.',
      guestNotes:
          'This event may be louder than lounge sessions. Good for guests looking for a weekend atmosphere.',
      requestButtonLabel: 'Request Event Access',
      icon: FontAwesomeIcons.compactDisc,
    ),
    ResortEventModel(
      id: 'event_08',
      title: 'Jazz Dinner Evening',
      date: 'Friday, This Week',
      time: '7:00 PM – 9:30 PM',
      location: 'Restaurant Floor',
      status: EventStatus.upcoming,
      shortDescription:
          'A restaurant evening with live jazz atmosphere, dining tables, and a warm interior setting.',
      fullDescription:
          'Jazz Dinner Evening combines a refined dining environment with live jazz-inspired music. Guests can request table assistance, plan a meal around the event, and enjoy a more memorable restaurant visit.',
      guestNotes:
          'Table requests are recommended because restaurant seating may be limited during this event.',
      requestButtonLabel: 'Request Table',
      imageAsset: AppAssets.restaurantFloor,
    ),
    ResortEventModel(
      id: 'event_09',
      title: 'Resort Comfort Tour',
      date: 'Saturday, This Week',
      time: '4:00 PM – 4:45 PM',
      location: 'Main Lobby',
      status: EventStatus.upcoming,
      shortDescription:
          'A short guided introduction to useful resort areas, comfort spaces, dining locations, and guest service points.',
      fullDescription:
          'Resort Comfort Tour helps visitors understand where to go inside the building. The tour highlights guest services, lounge areas, dining zones, event spaces, and quiet corners that may be useful during the visit.',
      guestNotes:
          'A practical event for new visitors who want to feel more confident moving through the resort.',
      requestButtonLabel: 'Join Tour Request',
      imageAsset: AppAssets.mainLobby,
    ),
    ResortEventModel(
      id: 'event_10',
      title: 'Conference Welcome Brief',
      date: 'Saturday, This Week',
      time: '10:30 AM – 11:15 AM',
      location: 'Conference Area',
      status: EventStatus.upcoming,
      shortDescription:
          'A professional welcome session for guests attending meetings, private sessions, or group events.',
      fullDescription:
          'Conference Welcome Brief is designed for business visitors and group guests. The session explains meeting-room locations, timing, seating guidance, support options, and how to request help through the app.',
      guestNotes:
          'Recommended for guests visiting the conference area for the first time.',
      requestButtonLabel: 'Request Attendance',
      imageAsset: AppAssets.conferenceArea,
    ),
    ResortEventModel(
      id: 'event_11',
      title: 'Dessert & Coffee Moment',
      date: 'Saturday, This Week',
      time: '3:00 PM – 5:00 PM',
      location: 'Dining Lounge',
      status: EventStatus.upcoming,
      shortDescription:
          'A relaxed afternoon restaurant moment focused on desserts, coffee, and comfortable conversation.',
      fullDescription:
          'Dessert & Coffee Moment is a lighter dining event for guests who want something simple between activities. It works well as an afternoon pause before an evening event or after visiting resort places.',
      guestNotes:
          'Good for guests who want a calm restaurant experience without a full dinner.',
      requestButtonLabel: 'Request Dining Seat',
      imageAsset: AppAssets.diningLounge,
    ),
    ResortEventModel(
      id: 'event_12',
      title: 'Evening Guest Mixer',
      date: 'Saturday, This Week',
      time: '8:30 PM – 10:30 PM',
      location: 'Evening Lounge Area',
      status: EventStatus.upcoming,
      shortDescription:
          'A social evening event with lounge seating, music, and a warm resort atmosphere.',
      fullDescription:
          'Evening Guest Mixer is created for visitors who want a more social lounge experience. The event includes soft music, comfortable seating, and an open setting for relaxed conversations during the evening.',
      guestNotes:
          'Best for guests who enjoy a social but not overly loud environment.',
      requestButtonLabel: 'Request Lounge Access',
      imageAsset: AppAssets.eveningLoungeArea,
    ),
    ResortEventModel(
      id: 'event_13',
      title: 'Acoustic Sunday Session',
      date: 'Sunday, This Week',
      time: '6:00 PM – 7:30 PM',
      location: 'Quiet Comfort Lounge',
      status: EventStatus.upcoming,
      shortDescription:
          'A soft acoustic music session designed for a calm Sunday evening inside the resort.',
      fullDescription:
          'Acoustic Sunday Session brings a gentle close to the week. Guests can enjoy live acoustic music in a comfortable lounge setting with softer lighting and a slower pace.',
      guestNotes:
          'Suitable for guests who prefer a calm event instead of a high-energy performance.',
      requestButtonLabel: 'Send Event Request',
      imageAsset: AppAssets.quietComfortLounge,
    ),
    ResortEventModel(
      id: 'event_14',
      title: 'Interior Art Walk',
      date: 'Sunday, This Week',
      time: '2:00 PM – 3:00 PM',
      location: 'Main Lobby and Scenic View Area',
      status: EventStatus.upcoming,
      shortDescription:
          'A short self-guided style event focused on interior design details, visual corners, and photo-friendly resort spaces.',
      fullDescription:
          'Interior Art Walk highlights selected areas of the resort where guests can notice design details, lighting, seating arrangements, and scenic views. It is a simple visit experience for those who enjoy interiors, photography, and atmosphere.',
      guestNotes:
          'Good for guests who want to explore the building slowly and save places in the app.',
      requestButtonLabel: 'Request Walk Details',
      icon: FontAwesomeIcons.palette,
    ),
    ResortEventModel(
      id: 'event_15',
      title: 'Private Group Dining Preview',
      date: 'Friday, Next Week',
      time: '6:30 PM – 8:00 PM',
      location: 'Private Dining Area',
      status: EventStatus.upcoming,
      shortDescription:
          'A preview-style dining event for small groups interested in a quieter and more arranged restaurant experience.',
      fullDescription:
          'Private Group Dining Preview introduces guests to a more personal dining arrangement. The event is suitable for small groups who want to understand private seating options, timing, and dining support before making a request.',
      guestNotes:
          'Best for guests planning a group meal, celebration, or more private dining moment.',
      requestButtonLabel: 'Request Private Dining',
      icon: FontAwesomeIcons.champagneGlasses,
    ),
    ResortEventModel(
      id: 'event_16',
      title: 'Night View Pause',
      date: 'Sunday, This Week',
      time: '9:00 PM – 9:45 PM',
      location: 'Scenic View Area',
      status: EventStatus.upcoming,
      shortDescription:
          'A calm evening pause near the scenic area with soft lighting and a quiet resort atmosphere.',
      fullDescription:
          'Night View Pause is a simple event for guests who want a slower end to the evening. Visitors can spend a short time near the scenic area, enjoy the atmosphere, and take a break after dining or lounge activities.',
      guestNotes:
          'Recommended after dinner or before leaving the resort.',
      requestButtonLabel: 'Send Event Request',
      imageAsset: AppAssets.scenicViewArea,
    ),
  ];
}
