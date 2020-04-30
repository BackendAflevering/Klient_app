

class Project{
  String projektnavn;
  int projekttid;
  List<String> medlemmer;
  Project(this.projektnavn,this.projekttid,this.medlemmer);

 factory Project.fromJson(Map<String, dynamic> parsedJson) {
    // parsedJson er altså vores indkommende Map<String, dynamic>, som skal blive til en user.
    Project project = new Project(
      parsedJson['projektnavn'],
      parsedJson['projekttid'] as int,
        List<String>.from(parsedJson["medlemmer"].map((x) => x))
    );
    return project;
  }
  Map<String, dynamic> toJson() => {
    'projektnavn': projektnavn,
    'projekttid': projekttid.toString(),
    'medlemmer':medlemmer.toString()
    //'medlemmer' : medlemmer.toString()
  };

  @override
  String toString() {
    return 'Project{projektnavn: $projektnavn, projekttid: $projekttid, medlemmer: $medlemmer}';
  }
  String getProjektnavn(){
    return projektnavn;
  }
  int getProjekttid(){
    return projekttid;
  }
  List<String> getMedlemmer(){
    return medlemmer;
  }


}