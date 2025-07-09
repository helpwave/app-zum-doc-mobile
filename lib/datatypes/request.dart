enum RequestStatus { accepted, pending, declined }

enum RequestType { recipe, appointment, transfer }

class Request {
  final RequestType type;
  final RequestStatus status;
  final String name;
  final String doctorName;

  Request({required this.type, required this.status, required this.name, required this.doctorName});
}
