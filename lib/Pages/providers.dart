// ignore_for_file: non_constant_identifier_names

class Ourservices {
  late final String Service;
  late final String Repair;
  final List<material> serv;
  Ourservices(
      {required this.Service, required this.Repair, required this.serv});
}

class material {
  final services;
  final repairs;

  material({this.repairs, this.services});
}
