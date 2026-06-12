abstract class Authevent {}

class Loginevent extends Authevent {
  final String email;
  final String password;
  Loginevent(this.email, this.password);
}

class Signupevent extends Authevent {
  final String email;
  final String password;
  Signupevent(this.email, this.password);
}
