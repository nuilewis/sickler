class MedsLog {

  String name;
  double? mgPerPill;
  List<DateTime> time;
  double dose;
  int? daysLeft;
  bool? taken;
  String? medsType;

  MedsLog({required this.name, required this.dose, required this.daysLeft, this.mgPerPill, required this.time, this.taken, this.medsType});
  
  

}