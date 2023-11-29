// we can not create instance we can not use InternetEvent() like this.
abstract class InternetEvent {}

class InternetLostEvent extends InternetEvent {}

class InternetGainedEvent extends InternetEvent {}