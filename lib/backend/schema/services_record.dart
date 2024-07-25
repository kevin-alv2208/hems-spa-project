import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "serviceName" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  bool hasServiceName() => _serviceName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "appointmentDate" field.
  DateTime? _appointmentDate;
  DateTime? get appointmentDate => _appointmentDate;
  bool hasAppointmentDate() => _appointmentDate != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "confirmationStatus" field.
  bool? _confirmationStatus;
  bool get confirmationStatus => _confirmationStatus ?? false;
  bool hasConfirmationStatus() => _confirmationStatus != null;

  void _initializeFields() {
    _serviceName = snapshotData['serviceName'] as String?;
    _description = snapshotData['description'] as String?;
    _appointmentDate = snapshotData['appointmentDate'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _confirmationStatus = snapshotData['confirmationStatus'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
  String? serviceName,
  String? description,
  DateTime? appointmentDate,
  String? location,
  bool? confirmationStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'serviceName': serviceName,
      'description': description,
      'appointmentDate': appointmentDate,
      'location': location,
      'confirmationStatus': confirmationStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
    return e1?.serviceName == e2?.serviceName &&
        e1?.description == e2?.description &&
        e1?.appointmentDate == e2?.appointmentDate &&
        e1?.location == e2?.location &&
        e1?.confirmationStatus == e2?.confirmationStatus;
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality().hash([
        e?.serviceName,
        e?.description,
        e?.appointmentDate,
        e?.location,
        e?.confirmationStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
