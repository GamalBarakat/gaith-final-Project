class VolunteerModel {
  dynamic? status;
  String? message;
  List<Volunteers>? volunteers;

  VolunteerModel({this.status, this.message, this.volunteers});

  VolunteerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['volunteers'] != null) {
      volunteers = <Volunteers>[];
      json['volunteers'].forEach((v) {
        volunteers!.add(new Volunteers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.volunteers != null) {
      data['volunteers'] = this.volunteers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Volunteers {
  int? id;
  String? img;
  String? name;
  String? dec;

  Volunteers({this.id, this.img, this.name, this.dec});

  Volunteers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    dec = json['dec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['name'] = this.name;
    data['dec'] = this.dec;
    return data;
  }
}