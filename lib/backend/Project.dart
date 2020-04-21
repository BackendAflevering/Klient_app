

class Project{
  String projektnavn;
  int projekttid;
  Set<String> medlemmer;

  Project(this.projektnavn,this.projekttid,this.medlemmer);

  factory Project.fromJson(Map<String, dynamic> parsedJson) {
    // parsedJson er altså vores indkommende Map<String, dynamic>, som skal blive til en user.
    Project project = new Project(
      parsedJson['projektnavn'],
      parsedJson['projekttid'],
      parsedJson['medlemmer']
    );
    return project;
  }

  Map<String, dynamic> toJson() => {
    'projektnavn': projektnavn,
    'projekttid': projekttid,
    'medlemmer' : medlemmer
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
  Set<String> getMedlemmer(){
    return medlemmer;
  }


}