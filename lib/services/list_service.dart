// ignore_for_file: non_constant_identifier_names

class Service {
  late String name;
  late String pics;

  Service({
    required this.name,
    required this.pics,
  });
}

List<Service> Categorylist = [
  Service(
    name: 'Repair',
    pics: 'images/repair.png',
  ),
  Service(
    name: 'Service',
    pics: 'images/services.png',
  ),
  Service(
    name: 'Truckcarrier',
    pics: 'images/tow.png',
  ),
];
