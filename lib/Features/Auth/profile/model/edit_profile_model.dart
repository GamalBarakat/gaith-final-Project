class EditProfile{
  int? status;
  String? message;



  EditProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }



}

