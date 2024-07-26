import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitaRecord extends FirestoreRecord {
  CitaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "sede" field.
  String? _sede;
  String get sede => _sede ?? '';
  bool hasSede() => _sede != null;

  // "fechayhora" field.
  DateTime? _fechayhora;
  DateTime? get fechayhora => _fechayhora;
  bool hasFechayhora() => _fechayhora != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _sede = snapshotData['sede'] as String?;
    _fechayhora = snapshotData['fechayhora'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cita');

  static Stream<CitaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitaRecord.fromSnapshot(s));

  static Future<CitaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitaRecord.fromSnapshot(s));

  static CitaRecord fromSnapshot(DocumentSnapshot snapshot) => CitaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitaRecordData({
  String? name,
  String? sede,
  DateTime? fechayhora,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'sede': sede,
      'fechayhora': fechayhora,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitaRecordDocumentEquality implements Equality<CitaRecord> {
  const CitaRecordDocumentEquality();

  @override
  bool equals(CitaRecord? e1, CitaRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.sede == e2?.sede &&
        e1?.fechayhora == e2?.fechayhora;
  }

  @override
  int hash(CitaRecord? e) =>
      const ListEquality().hash([e?.name, e?.sede, e?.fechayhora]);

  @override
  bool isValidKey(Object? o) => o is CitaRecord;
}
