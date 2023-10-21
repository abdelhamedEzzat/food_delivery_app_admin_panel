import 'package:equatable/equatable.dart';

class OpeningHours extends Equatable {
  final String id;
  final String day;
  final double openAt;
  final double closeAt;
  final bool isOpen;

  const OpeningHours({
    required this.id,
    required this.day,
    required this.openAt,
    required this.closeAt,
    required this.isOpen,
  });

  OpeningHours copyWith({
    String? id,
    String? day,
    double? openAt,
    double? closeAt,
    bool? isOpen,
  }) {
    return OpeningHours(
      id: id ?? this.id,
      day: day ?? this.day,
      openAt: openAt ?? this.openAt,
      closeAt: closeAt ?? this.closeAt,
      isOpen: isOpen ?? this.isOpen,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, day, openAt, closeAt, isOpen];

  static List<OpeningHours> openingHourList = const [
    OpeningHours(id: "1", closeAt: 24, openAt: 0, isOpen: false, day: "Monday"),
    OpeningHours(
        id: "2", closeAt: 24, openAt: 0, isOpen: false, day: "Tuesday"),
    OpeningHours(
        id: "3", closeAt: 24, openAt: 0, isOpen: false, day: "Wednesday"),
    OpeningHours(
        id: "4", closeAt: 24, openAt: 0, isOpen: false, day: "tharsdat"),
    OpeningHours(id: "5", closeAt: 24, openAt: 0, isOpen: false, day: "Friday"),
    OpeningHours(
        id: "6", closeAt: 24, openAt: 0, isOpen: false, day: "saterday"),
    OpeningHours(id: "7", closeAt: 24, openAt: 0, isOpen: false, day: "Sunday"),
  ];
}
