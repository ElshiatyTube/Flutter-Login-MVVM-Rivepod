import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) => false,
);

void popAndNavigateByName({context,String name,String arguments}){
  Navigator.popAndPushNamed(context, name, arguments: arguments);
}


Widget sharedFormField({
  @required TextEditingController controller,
  @required TextInputType textInputType,
  Function onSubmit,
  Function onChanged,
  String hint='',
  bool isPassword = false,
  @required Function validator,
  @required String label,
  @required IconData prefixIcon,
  IconData suffixIcon,
  Function suffixIconPressed,
  Function onTap,
  bool isClickable = true,
  bool readOnly = false,
}) =>
    TextFormField(
      readOnly: readOnly ,
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          labelText: label, //hintText
          prefixIcon: Icon(
            prefixIcon,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
            icon: Icon(
              suffixIcon,
            ),
            onPressed: suffixIcon != null ? suffixIconPressed : null,
          )
              : null,
          border: const OutlineInputBorder()),
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validator,
      keyboardType: textInputType,
      obscureText: isPassword,
      onTap: onTap,
      enabled: isClickable,
    );

Widget defaultButton({
  double width = double.infinity,
  double height = 45.0,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text.toLowerCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
    );


Widget defaultTextButton(
    {@required Function function, @required String text, TextStyle textStyle}) {
  return TextButton(
    onPressed: function,
    child: Text(
      text,
      style: textStyle,
    ),
  );
}


