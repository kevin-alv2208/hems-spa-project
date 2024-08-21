import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservaRecord extends FirestoreRecord {
  ReservaRecord._(
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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "appointmentTime" field.
  DateTime? _appointmentTime;
  DateTime? get appointmentTime => _appointmentTime;
  bool hasAppointmentTime() => _appointmentTime != null;

  // "cost" field.
  int? _cost;
  int get cost => _cost ?? 0;
  bool hasCost() => _cost != null;

  // "imageBlurHash" field.
  String? _imageBlurHash;
  String get imageBlurHash => _imageBlurHash ?? '';
  bool hasImageBlurHash() => _imageBlurHash != null;

  // "idUsuario" field.
  String? _idUsuario;
  String get idUsuario => _idUsuario ?? '';
  bool hasIdUsuario() => _idUsuario != null;

  void _initializeFields() {
    _serviceName = snapshotData['serviceName'] as String?;
    _description = snapshotData['description'] as String?;
    _appointmentDate = snapshotData['appointmentDate'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _confirmationStatus = snapshotData['confirmationStatus'] as bool?;
    _image = snapshotData['image'] as String?;
    _appointmentTime = snapshotData['appointmentTime'] as DateTime?;
    _cost = castToType<int>(snapshotData['cost']);
    _imageBlurHash = snapshotData['imageBlurHash'] as String?;
    _idUsuario = snapshotData['idUsuario'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reserva');

  static Stream<ReservaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservaRecord.fromSnapshot(s));

  static Future<ReservaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservaRecord.fromSnapshot(s));

  static ReservaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservaRecordData({
  String? serviceName,
  String? description,
  DateTime? appointmentDate,
  String? location,
  bool? confirmationStatus,
  String? image,
  DateTime? appointmentTime,
  int? cost,
  String? imageBlurHash,
  String? idUsuario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'serviceName': serviceName,
      'description': description,
      'appointmentDate': appointmentDate,
      'location': location,
      'confirmationStatus': confirmationStatus,
      'image': image,
      'appointmentTime': appointmentTime,
      'cost': cost,
      'imageBlurHash': imageBlurHash,
      'idUsuario': idUsuario,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservaRecordDocumentEquality implements Equality<ReservaRecord> {
  const ReservaRecordDocumentEquality();

  @override
  bool equals(ReservaRecord? e1, ReservaRecord? e2) {
    return e1?.serviceName == e2?.serviceName &&
        e1?.description == e2?.description &&
        e1?.appointmentDate == e2?.appointmentDate &&
        e1?.location == e2?.location &&
        e1?.confirmationStatus == e2?.confirmationStatus &&
        e1?.image == e2?.image &&
        e1?.appointmentTime == e2?.appointmentTime &&
        e1?.cost == e2?.cost &&
        e1?.imageBlurHash == e2?.imageBlurHash &&
        e1?.idUsuario == e2?.idUsuario;
  }

  @override
  int hash(ReservaRecord? e) => const ListEquality().hash([
        e?.serviceName,
        e?.description,
        e?.appointmentDate,
        e?.location,
        e?.confirmationStatus,
        e?.image,
        e?.appointmentTime,
        e?.cost,
        e?.imageBlurHash,
        e?.idUsuario
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservaRecord;
}
