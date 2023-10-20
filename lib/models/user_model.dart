// class UserModel {
//   String? Token;
//   String? username;

//   UserModel({this.Token,this.username})

//   UserModel.fromJson(Map<String, dynamic>json){
//     //token=json['token'];
//     username=json['username'];
//   }

//   Map<String,dynamic>toJson(){
//     final Map<String,dynamic>data=new Map<String,dynamic>();
//     data['token']=this.token;
//     data['username']=this.Token;

//     return data;
//   }
// }
//

////json to dart yaha paste karna hai usermodal mein
///'
class SignupModel {
  String? username;
  String? email;
  String? password;
 // String? accessToken; // Add this property

  SignupModel({this.username, this.email, this.password, 
  //this.accessToken
  });

  SignupModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
  //  accessToken = json['accessToken']; // Update this line
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
   // data['accessToken'] = this.accessToken; // Update this line
    return data;
  }
}
