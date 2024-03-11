import 'package:buyingmedicines1/core/services/myservicees.dart';
import 'package:buyingmedicines1/models/profileinformations.dart';

//Function To  Save User Information Is Local DateBase
savePref(
    {required String idUser,
    required String name,
    required String email,
    required String phone,
    required String address,
    required String createdAt}) {
  MyServices.sharedPreferences.setString(PrefProfile.idUSer, idUser);
  MyServices.sharedPreferences.setString(PrefProfile.name, name);
  MyServices.sharedPreferences.setString(PrefProfile.email, email);
  MyServices.sharedPreferences.setString(PrefProfile.phone, phone);
  MyServices.sharedPreferences.setString(PrefProfile.address, address);
  MyServices.sharedPreferences.setString(PrefProfile.cretedAt, createdAt);
}
