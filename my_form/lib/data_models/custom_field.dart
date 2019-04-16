
import 'dart:core';

class CustomField {
  final String fieldType;
  final String id;
  final String label;
  final List<String> options;
  final bool mandatory;

  CustomField(this.fieldType,
  this.id,
  this.label,
  this.options,
  this.mandatory);

  CustomField.fromJSON(Map<String, dynamic> json)
      : fieldType = json["field_type"],
        id  = json["id"],
        label = json["label"],
        options = json["options"],
        mandatory = json["mandatory"];
}