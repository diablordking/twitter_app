class TwitModel {
  var id;
  String text;

  TwitModel({required this.id,required this.text});


  factory TwitModel.fromJson(Map<String, dynamic> json) {
    return TwitModel(
      id: json['id'],
      text: json['text'],
    );
  }

}