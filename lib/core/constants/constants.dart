import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyConstants {
  static const baslangicKonumu =
      CameraPosition(target: MyConstants.izmir, zoom: 9);
  static const izmir = LatLng(38.14, 27.16);
  static const String ekle = 'Ekle';
  static const String vazgec = 'Vazgeç';
  static const String bosListeMetni = 'Haritaya bir işaretçi ekle';
  static const String sorunListesiBaslik = 'Sorunlar Listesi';
  static const String haritaBaslik = 'Sorunlar Haritası';
  static const String beklenmedikHata = 'Beklenmedik bir hata oluştu';
  static const IconData deleteIcon = Icons.delete;
  static const String commentHintText = 'Açıklama giriniz';
}
