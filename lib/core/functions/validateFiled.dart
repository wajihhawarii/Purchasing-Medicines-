//function to validation about Entering information in authentiocation InterFaces
validatorTextFiled(String? val, String type) {
  if (val!.isEmpty) {
    return "The Filed is Empty";
  }
  if (type == "email" ||
      type == "password" ||
      type == "phone" ||
      type == "home") {
    if (val.length < 5) {
      return "The $type length is short";
    } else {
      return null;
    }
  }
}
