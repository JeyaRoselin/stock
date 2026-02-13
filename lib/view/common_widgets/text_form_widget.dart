
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock/controller/constants/constant.dart';



class TextForm extends StatelessWidget {
  final String? labelText;
  final String ?hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  final String? Function(String?)? validating;
  String? defaultValue;
final String? Function(String?)? onSaved;
IconData? iconData;
bool? readOnly;
VoidCallback? onTap;
int? maxLines;
String? type;
double? padding;
TextAlign? textAlign;
String? errorText;
bool?isDense;
int? charLength;
FocusNode? focusNode;
Color? fillColor;
String? suffix;
Widget? prefixWidget;
final String? Function(String?)? onChanged;
bool? isUndrline;

double?fontSize;
 TextForm({
    super.key,
 this.controller,
    required this.keyboardType,
     this.labelText,
  this.hintText,
  this.fillColor,
     this.validating,
     this.defaultValue,
     this.onSaved,
     this.iconData,
     this.readOnly,
     this.onTap,
     this.maxLines,
     this.type,
     this.onChanged,
     this.textAlign,
     this.isDense,
this.padding,
this.fontSize,
this.errorText,
this.charLength,
this.focusNode,
this.suffix,
this.prefixWidget,
this.isUndrline

  });

  bool _obscureText = false;

  @override
  

  @override
  Widget build(BuildContext context) {
     List<TextInputFormatter> inputFormatters = [];
  
  var isFirstTime=true;
  if(defaultValue?.isNotEmpty ==true &&  controller?.text.isEmpty == true && isFirstTime){
      controller?.text = defaultValue??"";
      isFirstTime = false;
    }
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      obscureText: _obscureText, // Use the class-level _obscureText
      textInputAction: TextInputAction.next,
      onTap: onTap,
      maxLines: maxLines??1,
       textAlign: textAlign?? TextAlign.start,
      style: TextStyle(fontSize: 18.sp,color:appColor),
    focusNode: focusNode,
      onChanged: onChanged,
       inputFormatters:inputFormatters,
      keyboardType: keyboardType,
    readOnly: readOnly??false,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: greyColor),
        errorText: errorText??null,
        isDense:isDense?? true,
        filled: true,
        
         contentPadding: EdgeInsets.all(padding??12),
       fillColor:fillColor??whiteColor,
        labelText: labelText,
        hintText: hintText,
        focusedBorder:isUndrline!=true? OutlineInputBorder(
          borderSide: BorderSide(color: appColor),
          
        ):UnderlineInputBorder(
          borderSide: BorderSide(color: appColor),
          
        ),
        prefixIcon:prefixWidget!=null?prefixWidget:  type=='ruppee' ? Icon(Icons.currency_rupee_sharp,color:blackColor ,):null,
        suffixText: suffix??null,
        labelStyle: TextStyle(
         fontSize: formTextSize,
          color:appColor ,
        ),
        hintStyle:  TextStyle(
          fontSize: formTextSize,
          color: appColor,
        ),
        disabledBorder:isUndrline!=true? OutlineInputBorder(
          borderSide: BorderSide(color:whiteColor),
        ):UnderlineInputBorder(
          borderSide: BorderSide(color:whiteColor),
        ),
        border: isUndrline!=true?  OutlineInputBorder(
          borderSide: BorderSide(color:whiteColor),
        ):UnderlineInputBorder(
          borderSide: BorderSide(color:whiteColor),
        ),
       
  enabledBorder: isUndrline!=true?  OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.5), // Border when enabled
  ):UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.5), // Border when enabled
  ),
  
  errorBorder:  isUndrline!=true? OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5), // Border on validation error
  ):UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5), // Border on validation error
  ),
  focusedErrorBorder: isUndrline!=true?  OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0), // Border when focused with error
  ):UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5), // Border on validation error
  ),
 
        // No suffix icon for other fields
      ),
      validator: validating,
    );
  }
}
// class _DateInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     String text = newValue.text;

//     // Maintain slashes at their correct positions
//     StringBuffer buffer = StringBuffer();
//     int selectionIndex = newValue.selection.baseOffset;

//     // Handle the input: format it to DD/MM/YYYY
//     for (int i = 0; i < text.length; i++) {
//       if (i == 2 || i == 5) {
//         buffer.write('/'); // Add slash after 2nd and 5th characters
//       }
//       buffer.write(text[i]); // Add the character to the buffer
//     }

//     String formattedText = buffer.toString();

//     // Limit input to 10 characters (DD/MM/YYYY)
//     if (formattedText.length > 10) {
//       formattedText = formattedText.substring(0, 10);
//     }

//     // Correct cursor positioning to skip over slashes
//     if (newValue.text.length > oldValue.text.length) {
//       if (selectionIndex == 2 || selectionIndex == 5) {
//         selectionIndex++; // Adjust the selection index if slash is inserted
//       }
//     }

//     return TextEditingValue(
//       text: formattedText,
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//   }
// }

// class _DateInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     String newText = newValue.text.replaceAll('/', ''); // Remove existing slashes

//     // Limit input length to prevent errors
//     if (newText.length > 8) {
//       newText = newText.substring(0, 8);
//     }

//     final buffer = StringBuffer();
//     int selectionIndex = newValue.selection.end;

//     // Insert slashes at correct positions
//     for (int i = 0; i < newText.length; i++) {
//       if (i == 2 || i == 4) {
//         buffer.write('/');
//         if (i < selectionIndex) selectionIndex++;
//       }
//       buffer.write(newText[i]);
//     }

//     // Pad with placeholders if input is incomplete
//     while (buffer.length < 10) {
//       if (buffer.length == 2 || buffer.length == 5) {
//         buffer.write('/');
//       } else if (buffer.length < 2) {
//         buffer.write('D');
//       } else if (buffer.length < 5) {
//         buffer.write('M');
//       } else {
//         buffer.write('Y');
//       }
//     }

//     String formattedText = buffer.toString();

//     // Validate date for future restriction
//     if (_isFutureDate(formattedText)) {
//       return oldValue; // Revert to old value if the date is in the future
//     }

//     // Return the updated text and adjusted cursor position
//     return TextEditingValue(
//       text: formattedText,
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//   }

//   bool _isFutureDate(String date) {
//     try {
//       // Parse the entered date
//       final parts = date.split('/');
//       if (parts.length < 3) return false;

//       int day = int.tryParse(parts[0].replaceAll('D', '')) ?? 0;
//       int month = int.tryParse(parts[1].replaceAll('M', '')) ?? 0;
//       int year = int.tryParse(parts[2].replaceAll('Y', '')) ?? 0;

//       if (day == 0 || month == 0 || year == 0) return false;

//       final enteredDate = DateTime(year, month, day);
//       final currentDate = DateTime.now();

//       // Compare entered date with the current date
//       return enteredDate.isAfter(currentDate);
//     } catch (e) {
//       return false; // If parsing fails, consider it invalid
//     }
//   }
// }

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll('/', ''); // Remove slashes

    // Limit input length
    if (newText.length > 8) {
      newText = newText.substring(0, 8);
    }

    final buffer = StringBuffer();
    int selectionIndex = newValue.selection.end;

    // Insert slashes at the correct positions
    for (int i = 0; i < newText.length; i++) {
      if (i == 2 || i == 4) {
        buffer.write('/');
        if (i < selectionIndex) selectionIndex++;
      }
      buffer.write(newText[i]);
    }

    // Add placeholders if input is incomplete
    while (buffer.length < 10) {
      if (buffer.length == 2 || buffer.length == 5) {
        buffer.write('/');
      } else if (buffer.length < 2) {
        buffer.write('D');
      } else if (buffer.length < 5) {
        buffer.write('M');
      } else {
        buffer.write('Y');
      }
    }

    String formattedText = buffer.toString();

    // Validate the date
    if (_isFutureDate(formattedText)) {
      return oldValue; // Revert to the previous value if the date is invalid
    }

    // Ensure the cursor stays within valid bounds
    selectionIndex = selectionIndex.clamp(0, formattedText.length);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }

  /// Validates whether the entered date is in the future
  bool _isFutureDate(String date) {
    try {
      final parts = date.split('/');
      if (parts.length != 3) return false;

      int day = int.tryParse(parts[0].replaceAll('D', '')) ?? 0;
      int month = int.tryParse(parts[1].replaceAll('M', '')) ?? 0;
      int year = int.tryParse(parts[2].replaceAll('Y', '')) ?? 0;

      if (day == 0 || month == 0 || year == 0) return false;

      final enteredDate = DateTime(year, month, day);
      final currentDate = DateTime.now();

      return enteredDate.isAfter(currentDate);
    } catch (e) {
      return false; // Treat parsing errors as invalid dates
    }
  }
}
