class ValorantModel {
  String uuid;
  String displayName;
  String displayIcon;
  String description;
  String displayIconSmall;
  String bustPortrait;
  String killfeedPortrait;
  String background;

  ValorantModel({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
    required this.description,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.killfeedPortrait,
    required this.background,
  });

  factory ValorantModel.fromJson(Map<String, dynamic> json){
    return ValorantModel(
      uuid: json['uuid'],
      displayName: json['display_name'],
      displayIcon: json['display_icon'],
      description: json['description'],
      displayIconSmall: json['display_icon_small'],
      bustPortrait: json['bust_portrait'],
      killfeedPortrait: json['killfeed_portrait'],
      background: json['background'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return {
      data['uuid']: uuid,
      data['display_name']: displayName,
      data['display_icon']: displayIcon,
      data['description']: description,
      data['display_icon_small']: displayIconSmall,
      data['bust_portrait']: bustPortrait,
      data['killfeed_portrait']: killfeedPortrait,
      data['background']: background,
    };
  }
}
