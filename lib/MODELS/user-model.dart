class User_Model
{
  String? name;
  String? email;
  String? phone;
  String? image;
  String? cover;
  String? pio;
  String? uId;

  User_Model({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.cover,
    required this.pio,
    required this.uId,
  });


  User_Model.fromJson(Map<String,dynamic>?json)
  {
    email=json?['email'];
    name=json?['name'];
    phone=json?['phone'];
    image=json?['image'];
    cover=json?['cover'];
    pio=json?['pio'];
    uId=json?['uId'];
  }

  Map<String,dynamic>toMap()
  {
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'image':image,
      'cover':cover,
      'pio':pio,
      'uId':uId,
    };
  }
}