import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myquiz/models/user_data.dart';

class MyDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> createUser(MyUser user) async {
    String retVal = "error";
    try {
      await _firestore.collection("users").doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'name': user.name,
      }).then((value) => retVal = "Success");
    } catch (e) {
      retVal = e.toString();
    }
    return retVal;
  }

  Future<MyUser> getuserInfo(String uid) async {
    MyUser _user = MyUser(uid: "", email: "", name: "");
    try {
      DocumentReference _docRef = await _firestore.collection("users").doc(uid);
      DocumentSnapshot docSnapshot = await _docRef.get();

      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      _user.uid = uid;
      _user.name = data['name'];
      _user.email = data['email'];
    } catch (e) {
      print(e.toString());
    }
    return _user;
  }
}
