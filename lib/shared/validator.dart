class Validator {
  static String validateName(String value) {
    if(value.isEmpty){
      return "Name is Required";
    }
    return null;
  }

  static String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp =  RegExp(pattern);
    if (value.isEmpty) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  static String validatePassword(String value){
    if(value.isEmpty){
      return "Password can't be empty";
    } else if (value.length < 8){
      return "Password must be longer than 8 characters";
    }
    return null;
  }

  static String validatePhone(String value){
    if(value.isEmpty){
      return "Phone Number can't be empty";
    } else if (value.length != 11){
      return "Phone Number must be 11 number";
    }
    return null;
  }

  static String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp =  RegExp(pattern);
    if (value.isEmpty) {
      return "Email Address is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email Address";
    } else {
      return null;
    }
  }
  static String validateDate(String value){
    if(value.isEmpty){
      return "Please select your birthDate";
    }
    return null;
  }

}
