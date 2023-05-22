class ValorantModel {
  String ? uuid;
  String ? displayName;
  String ? displayIcon;
  String ? description;
  String ? displayIconSmall;
  String ? bustPortrait;
  String ? killfeedPortrait;
  String ? background;

  ValorantModel({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.description,
    this.displayIconSmall,
    this.bustPortrait,
    this.killfeedPortrait,
    this.background,
  });

  factory ValorantModel.fromMap(Map<String, dynamic> map){
    return ValorantModel(
      uuid: map['uuid'],
      displayName: map['displayName'],
      displayIcon: map['displayIcon'],
      description: map['description'],
      displayIconSmall: map['displayIconSmall'],
      bustPortrait: map['bustPortrait'],
      killfeedPortrait: map['killfeedPortrait'],
      background: map['background'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'displayName': displayName,
      'displayIcon': displayIcon,
      'description': description,
      'displayIconSmall': displayIconSmall,
      'bustPortrait': bustPortrait,
      'killfeedPortrait': killfeedPortrait,
      'background': background,
    };
  }
}
