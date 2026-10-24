import 'package:flutter_app/domain/value_object/email.dart';

extension ToEmail on String {
  Email toEmail() => Email(this);
}
