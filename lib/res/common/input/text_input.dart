import 'package:benmore/res/common/input/email_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

Widget emailInput({
  required TextEditingController controller,
  bool enable = true,
  required String hint,
  dynamic icon,
  dynamic suffixIcon,
  required String label,
  int maxLength = 50,
  required BuildContext context,
  required Function(String val) validate,
  FocusNode? focusNode,
}) {
  return TextFormField(
    style: TextStyle(fontSize: 18.sp),
    validator: (val) {
      if (val != null && val.isNotEmpty) {
        return validate(val);
      }
      return null;
    },
    enabled: enable,
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    maxLength: maxLength,
    focusNode: focusNode,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    inputFormatters: [
      EmailInputFormatter(),
      LengthLimitingTextInputFormatter(maxLength),
    ],
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(48.r),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(48.r),
        borderSide: const BorderSide(color: Color(0xFF027F4D), width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(48.r),
        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
      ),
      counter: const Offstage(),
      prefixIcon: icon,
      suffixIcon: suffixIcon,
      hintText: hint,
    ),
  );
}

textInput(
    {required TextEditingController controller,
    bool enable = true,
    required String hint,
    dynamic icon,
    dynamic suffixIcon,
    formatter = false,
    required String label,
    dynamic regex,
    String? initialValue,
    int maxLength = 15,
    int? maxLines,
    TextInputType type = TextInputType.text,
    required BuildContext context,
    required Function(String val) validate,
    FocusNode? focusNode}) {
  return TextFormField(
    style: TextStyle(fontSize: 18.sp),
    validator: (val) => validate(val!),
    enabled: enable,
    controller: controller,
    maxLines: maxLines,
    keyboardType: type,
    maxLength: maxLength,
    focusNode: focusNode,
    initialValue: initialValue,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    inputFormatters: formatter == true
        ? [FilteringTextInputFormatter.digitsOnly]
        : [
            FilteringTextInputFormatter.allow(
                regex != null ? regex : RegExp(r'[a-zA-Z0-9]'))
          ],
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.r),
          borderSide: const BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(48.r),
        borderSide: const BorderSide(color: Color(0xFF027F4D)),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.r),
          borderSide: BorderSide(color: Colors.grey, width: 1.5)),
      counter: const Offstage(),
      prefixIcon: icon,
      suffixIcon: suffixIcon,
      hintText: hint,
    ),
  );
}

textAreaInput(
    {required TextEditingController controller,
    bool enable = true,
    required String hint,
    dynamic icon,
    dynamic suffixIcon,
    formatter = false,
    required String label,
    dynamic regex,
    String? initialValue,
    int maxLength = 15,
    int? maxLines,
    TextInputType type = TextInputType.text,
    required BuildContext context,
    required Function(String val) validate,
    FocusNode? focusNode}) {
  return TextFormField(
    style: TextStyle(fontSize: 18.sp),
    validator: (val) => validate(val!),
    enabled: enable,
    controller: controller,
    maxLines: maxLines,
    keyboardType: type,
    maxLength: maxLength,
    focusNode: focusNode,
    initialValue: initialValue,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    inputFormatters: [
      FilteringTextInputFormatter.allow(
          regex != null ? regex : RegExp(r'[a-zA-Z0-9 ]'))
    ],
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.r),
          borderSide: const BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(48.r),
        borderSide: const BorderSide(color: Color(0xFF027F4D)),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.r),
          borderSide: BorderSide(color: Colors.grey, width: 1.5)),
      counter: const Offstage(),
      prefixIcon: icon,
      suffixIcon: suffixIcon,
      hintText: hint,
    ),
  );
}

passwordInput(
    {required TextEditingController controller,
    bool enable = true,
    bool obscureText = true,
    required String hint,
    VoidCallback? onHideText,
    dynamic icon,
    formatter = false,
    required String label,
    dynamic regex,
    int maxLength = 15,
    TextInputType type = TextInputType.text,
    required BuildContext context,
    required Function(String val) validate,
    FocusNode? focusNode}) {
  return TextFormField(
    style: TextStyle(fontSize: 18.sp),
    validator: (val) => validate(val!),
    enabled: enable,
    controller: controller,
    keyboardType: type,
    maxLength: maxLength,
    focusNode: focusNode,
    obscureText: obscureText,
    obscuringCharacter: "*",
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.r),
          borderSide: const BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(48.r),
        borderSide: const BorderSide(color: Color(0xFF027F4D)),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.r),
          borderSide: BorderSide(color: Colors.grey, width: 1.5)),
      counter: const Offstage(),
      prefixIcon: icon,
      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: onHideText,
      ),
      hintText: hint,
    ),
  );
}

Widget phoneNumberInput(
    {required TextEditingController controller,
    bool enable = true,
    bool disableLengthCheck = false,
    required String hint,
    int maxLength = 15,
    required String countryCode,
    TextInputType type = TextInputType.text,
    required BuildContext context,
    required Function(String val) validate,
    required Function(String val) changeCountryCode,
    FocusNode? focusNode}) {
  return IntlPhoneField(
    style: TextStyle(fontSize: 18.r),
    validator: (val) => validate(val as String),
    initialCountryCode: "NG",
    enabled: enable,
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    focusNode: focusNode,
    onCountryChanged: (val) {
      changeCountryCode(val.dialCode);
    },
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(maxLength)
    ],
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.r),
          borderSide: const BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(48.r),
        borderSide: const BorderSide(color: Color(0xFF027F4D)),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.r),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5)),
      counter: const Offstage(),
      hintText: hint,
    ),
  );
}

Widget datePickerInput(
    {required BuildContext context,
    String hint = "Enter your Retirement Date",
    String label = "Enter your Retirement Date",
    bool enable = true,
    required Function(dynamic val) function,
    required TextEditingController dateController,
    TextInputType type = TextInputType.text,
    FocusNode? focusNode}) {
  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(1960, 10, 1),
        firstDate: DateTime(1960),
        lastDate: DateTime(DateTime.now().year + 1),
        fieldHintText: "Enter you date of retirement");
    function(pickedDate);
  }

  return TextFormField(
    style: TextStyle(fontSize: 18.sp),
    validator: (val) {
      if (val == null || val.isEmpty) return "⛔ Retirement date is required";
      return null;
    },
    onTap: () {
      selectDate();
    },
    enabled: enable,
    readOnly: true,
    controller: dateController,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.r),
          borderSide: const BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(48.r),
        borderSide: const BorderSide(color: Color(0xFF027F4D)),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.r),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5)),
      counter: const Offstage(),
      hintText: hint,
      filled: true,
      suffixIcon: const Icon(Icons.calendar_today, color: Colors.green),
    ),
  );
}
