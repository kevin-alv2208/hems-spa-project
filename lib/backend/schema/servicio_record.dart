import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicioRecord extends FirestoreRecord {
  ServicioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _imagen = snapshotData['imagen'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('servicio');

  static Stream<ServicioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicioRecord.fromSnapshot(s));

  static Future<ServicioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicioRecord.fromSnapshot(s));

  static ServicioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicioRecordData({
  String? name,
  String? imagen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'imagen': imagen,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicioRecordDocumentEquality implements Equality<ServicioRecord> {
  const ServicioRecordDocumentEquality();

  @override
  bool equals(ServicioRecord? e1, ServicioRecord? e2) {
    return e1?.name == e2?.name && e1?.imagen == e2?.imagen;
  }

  @override
  int hash(ServicioRecord? e) =>
      const ListEquality().hash([e?.name, e?.imagen]);

  @override
  bool isValidKey(Object? o) => o is ServicioRecord;
}
