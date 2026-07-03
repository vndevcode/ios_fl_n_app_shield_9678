import 'package:ios_fl_n_app_shield_9678/constants/app_assets.dart';
import 'package:ios_fl_n_app_shield_9678/models/resort_place_model.dart';

abstract final class PlacesData {
  static const List<ResortPlaceModel> places = [
    ResortPlaceModel(
      id: 'place_01',
      title: 'Main Lobby',
      photoIdea:
          'Spacious modern lobby with green accent lighting and polished floors',
      shortDescription:
          'A central arrival area where guests can start their visit, check directions, and access nearby resort services.',
      openingHours: 'Open daily 10:00 AM – 2:00 AM',
      location: 'Main Level, Central Entrance Area',
      fullDescription:
          'The Main Lobby is the first point of orientation inside the resort. Guests can use this area to meet others, understand the layout, access nearby service points, and begin the visit in a calm, organized way.',
      highlights: [
        'Central meeting point',
        'Easy access to service areas',
        'Comfortable waiting space',
        'Clear resort directions',
        'Close to guest support',
      ],
      imageAsset: AppAssets.mainLobby,
    ),
    ResortPlaceModel(
      id: 'place_02',
      title: 'Guest Services Desk',
      photoIdea:
          'Elegant service counter with dark green panels and warm lighting',
      shortDescription:
          'A practical support point for visit questions, request details, directions, and general guest assistance.',
      openingHours: 'Open daily 10:00 AM – 2:00 AM',
      location: 'Main Level, Near the Lobby',
      fullDescription:
          'The Guest Services Desk is designed for guests who need help during their visit. It can be used for questions about submitted requests, event timing, service availability, resort directions, or pass-code assistance.',
      highlights: [
        'Visit support',
        'Request information',
        'Direction help',
        'Pass-code questions',
        'Service guidance',
      ],
      imageAsset: AppAssets.guestServicesDesk,
    ),
    ResortPlaceModel(
      id: 'place_03',
      title: 'Dining Lounge',
      photoIdea:
          'Refined restaurant lounge with tables, soft chairs, and warm interior lighting',
      shortDescription:
          'A comfortable dining area for guests who want to enjoy food, drinks, and a relaxed resort atmosphere.',
      openingHours: 'Open daily 11:00 AM – 12:00 AM',
      location: 'Main Level, Dining Wing',
      fullDescription:
          'The Dining Lounge offers a calm setting for meals, conversations, and breaks during a visit. It is suitable for guests who want a comfortable place to sit, review the day’s plan, or enjoy a dining moment before or after an event.',
      highlights: [
        'Comfortable dining tables',
        'Warm interior atmosphere',
        'Good for small groups',
        'Close to service support',
        'Relaxed lounge feeling',
      ],
      imageAsset: AppAssets.diningLounge,
    ),
    ResortPlaceModel(
      id: 'place_04',
      title: 'Quiet Comfort Lounge',
      photoIdea:
          'Soft seating area with darker walls, green accents, and minimal lighting',
      shortDescription:
          'A quieter lounge area created for short breaks, calm waiting, and comfortable rest.',
      openingHours: 'Open daily 12:00 PM – 11:00 PM',
      location: 'Upper Level, Comfort Zone',
      fullDescription:
          'The Quiet Comfort Lounge gives visitors a slower and more peaceful area inside the resort. It is useful for guests who want to pause between activities, wait comfortably, or spend a few minutes away from busier spaces.',
      highlights: [
        'Quiet seating',
        'Soft lighting',
        'Calm atmosphere',
        'Good waiting area',
        'Comfortable break zone',
      ],
      imageAsset: AppAssets.quietComfortLounge,
    ),
    ResortPlaceModel(
      id: 'place_05',
      title: 'Event Hall',
      photoIdea:
          'Modern event room with stage lighting, chairs, and elegant dark green details',
      shortDescription:
          'A dedicated area for resort events, guest sessions, live moments, and scheduled indoor activities.',
      openingHours: 'Available according to event schedule',
      location: 'Second Level, Event Area',
      fullDescription:
          'The Event Hall is used for organized activities inside the resort. Guests can visit this area for selected events, welcome sessions, small performances, dining presentations, or special resort gatherings.',
      highlights: [
        'Scheduled events',
        'Guest seating',
        'Indoor activities',
        'Presentation space',
        'Easy access from main areas',
      ],
      imageAsset: AppAssets.eventHall,
    ),
    ResortPlaceModel(
      id: 'place_06',
      title: 'Restaurant Floor',
      photoIdea:
          'Large dining floor with arranged tables, dark wood, green decor, and warm lamps',
      shortDescription:
          'A larger restaurant area where visitors can enjoy meals, check table options, and spend time in a refined setting.',
      openingHours: 'Open daily 12:00 PM – 1:00 AM',
      location: 'Main Level, Restaurant Area',
      fullDescription:
          'The Restaurant Floor is designed for guests who want a complete dining experience inside the resort. It offers more seating than smaller lounges and works well for planned meals, casual dining, or group visits.',
      highlights: [
        'Large dining space',
        'Group-friendly seating',
        'Warm resort atmosphere',
        'Close to dining support',
        'Good evening location',
      ],
      imageAsset: AppAssets.restaurantFloor,
    ),
    ResortPlaceModel(
      id: 'place_07',
      title: 'Scenic View Area',
      photoIdea:
          'Interior viewpoint with wide windows, waterfall-inspired view, and green seating accents',
      shortDescription:
          'A calm viewpoint area where guests can pause, take photos, and enjoy a Niagara-inspired atmosphere.',
      openingHours: 'Open daily 10:00 AM – 10:00 PM',
      location: 'Upper Level, Window Gallery',
      fullDescription:
          'The Scenic View Area is a quiet place for guests who want a slower moment during their visit. It can be used for photos, short conversations, or simply enjoying the resort’s visual atmosphere.',
      highlights: [
        'Photo-friendly spot',
        'Calm seating nearby',
        'Scenic atmosphere',
        'Good for short breaks',
        'Niagara-inspired mood',
      ],
      imageAsset: AppAssets.scenicViewArea,
    ),
    ResortPlaceModel(
      id: 'place_08',
      title: 'Conference Area',
      photoIdea:
          'Modern meeting room with long table, presentation screen, and clean business design',
      shortDescription:
          'A professional area for meetings, private sessions, small business gatherings, and scheduled group events.',
      openingHours: 'Available by schedule or request',
      location: 'Conference Level, Meeting Wing',
      fullDescription:
          'The Conference Area is suitable for guests attending business meetings, private group sessions, or organized resort gatherings. It provides a clean and focused environment with seating, presentation support, and a more private atmosphere.',
      highlights: [
        'Meeting setup',
        'Presentation area',
        'Private group space',
        'Comfortable chairs',
        'Professional atmosphere',
      ],
      imageAsset: AppAssets.conferenceArea,
    ),
    ResortPlaceModel(
      id: 'place_09',
      title: 'Guest Room Corridor',
      photoIdea:
          'Elegant hotel corridor with soft lighting, dark walls, and green details',
      shortDescription:
          'A calm passage area connecting guest rooms, comfort services, and private stay zones.',
      openingHours: 'Guest access according to stay details',
      location: 'Guest Stay Level',
      fullDescription:
          'The Guest Room Corridor helps visitors navigate between stay areas and nearby comfort services. It should feel calm, secure, and easy to understand, with clear visual direction and a quieter atmosphere than public areas.',
      highlights: [
        'Access to guest rooms',
        'Calm lighting',
        'Clear navigation',
        'Private stay atmosphere',
        'Close to comfort support',
      ],
      imageAsset: AppAssets.guestRoomCorridor,
    ),
    ResortPlaceModel(
      id: 'place_10',
      title: 'Premium Bedroom Area',
      photoIdea:
          'Realistic resort bedroom with large bed, green accents, and soft evening lighting',
      shortDescription:
          'A comfortable room area designed for rest, privacy, and a polished stay experience.',
      openingHours: 'Guest access according to booking',
      location: 'Guest Stay Level, Room Wing',
      fullDescription:
          'The Premium Bedroom Area represents the private comfort side of the resort. Guests can use this space for rest, preparation, or a quiet pause during their stay, with a design focused on calm colors and practical comfort.',
      highlights: [
        'Large comfortable bed',
        'Soft interior lighting',
        'Private rest space',
        'Modern furniture',
        'Relaxed resort mood',
      ],
      imageAsset: AppAssets.premiumBedroomArea,
    ),
    ResortPlaceModel(
      id: 'place_11',
      title: 'Arrival Waiting Zone',
      photoIdea:
          'Small seating area near entrance with plants, dark seating, and clean signs',
      shortDescription:
          'A simple waiting area for guests arriving early, meeting friends, or preparing before entering other resort spaces.',
      openingHours: 'Open daily 10:00 AM – 2:00 AM',
      location: 'Main Level, Near Entrance',
      fullDescription:
          'The Arrival Waiting Zone gives guests a practical place to sit, organize their visit, check pass details, or wait for others. It works as a useful first stop before moving deeper into the resort.',
      highlights: [
        'Good meeting point',
        'Comfortable short waiting',
        'Near entrance',
        'Easy to find',
        'Useful before service requests',
      ],
      imageAsset: AppAssets.arrivalWaitingZone,
    ),
    ResortPlaceModel(
      id: 'place_12',
      title: 'Indoor Relaxation Corner',
      photoIdea:
          'Cozy corner with lounge chairs, plants, green wall details, and soft lamps',
      shortDescription:
          'A smaller relaxation area for guests who want a short pause without entering a full lounge.',
      openingHours: 'Open daily 11:00 AM – 11:00 PM',
      location: 'Main Level, Side Lounge Area',
      fullDescription:
          'The Indoor Relaxation Corner is designed for quick comfort. It is useful when guests want to rest for a few minutes, check the app, review event details, or plan where to go next.',
      highlights: [
        'Short rest area',
        'Soft chairs',
        'Calm corner location',
        'Good for app planning',
        'Relaxed lighting',
      ],
      imageAsset: AppAssets.indoorRelaxationCorner,
    ),
    ResortPlaceModel(
      id: 'place_13',
      title: 'Service Request Point',
      photoIdea:
          'Compact digital help area with a counter, tablet stand, and green visual accents',
      shortDescription:
          'A dedicated point where guests can clarify submitted requests and ask about available resort services.',
      openingHours: 'Open daily 10:00 AM – 12:00 AM',
      location: 'Main Level, Near Guest Services',
      fullDescription:
          'The Service Request Point is useful for visitors who have already sent a service request through the app. Guests can use this area to ask about status, timing, confirmation, or next steps.',
      highlights: [
        'Request status help',
        'Service confirmation',
        'Staff guidance',
        'Pass-code support',
        'Clear next-step information',
      ],
      imageAsset: AppAssets.serviceRequestPoint,
    ),
    ResortPlaceModel(
      id: 'place_14',
      title: 'Evening Lounge Area',
      photoIdea:
          'Modern lounge with darker seating, warm lamps, and subtle green atmosphere',
      shortDescription:
          'An evening-focused lounge area for guests who want a relaxed place before or after dining or events.',
      openingHours: 'Open daily 5:00 PM – 1:00 AM',
      location: 'Main Level, Lounge Wing',
      fullDescription:
          'The Evening Lounge Area is created for guests who want a slower, more atmospheric part of their visit. It works well for conversations, waiting between events, or spending time after dinner.',
      highlights: [
        'Evening atmosphere',
        'Comfortable seating',
        'Good after dining',
        'Lounge-style setting',
        'Warm interior mood',
      ],
      imageAsset: AppAssets.eveningLoungeArea,
    ),
  ];
}
