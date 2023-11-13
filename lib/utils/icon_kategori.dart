// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'color.dart';

Container IconTransportasi() {
  return Container(
    decoration: BoxDecoration(
        color: BACKGROUND_PURPLE, borderRadius: BorderRadius.circular(14)),
    padding: const EdgeInsets.all(10),
    child: const Icon(
      Icons.directions_bus_filled_outlined,
      color: PURPLE,
    ),
  );
}

Container IconPemasukan() {
  return Container(
    decoration: BoxDecoration(
        color: BACKGROUND_PRIMARY, borderRadius: BorderRadius.circular(14)),
    padding: const EdgeInsets.all(10),
    child: const Icon(
      Icons.attach_money_rounded,
      color: PRIMARY,
    ),
  );
}

Container IconKebutuhanPokok() {
  return Container(
    decoration: BoxDecoration(
        color: BACKGROUND_BROWN, borderRadius: BorderRadius.circular(14)),
    padding: const EdgeInsets.all(10),
    child: const Icon(
      Icons.fastfood_outlined,
      color: BROWN,
    ),
  );
}

Container IconKesehatan() {
  return Container(
    decoration: BoxDecoration(
        color: BACKGROUND_BLUE, borderRadius: BorderRadius.circular(14)),
    padding: const EdgeInsets.all(10),
    child: const Icon(
      Icons.health_and_safety_outlined,
      color: BLUE,
    ),
  );
}

Container IconPendidikan() {
  return Container(
    decoration: BoxDecoration(
        color: BACKGROUND_SECONDARY, borderRadius: BorderRadius.circular(14)),
    padding: const EdgeInsets.all(10),
    child: const Icon(
      Icons.school_outlined,
      color: SECONDARY,
    ),
  );
}

Container IconHiburan() {
  return Container(
    decoration: BoxDecoration(
        color: BACKGROUND_RED, borderRadius: BorderRadius.circular(14)),
    padding: const EdgeInsets.all(10),
    child: const Icon(
      Icons.luggage_rounded,
      color: RED,
    ),
  );
}

Container IconPengeluaranRumah() {
  return Container(
    decoration: BoxDecoration(
        color: BACKGROUND_BLUE_OLD, borderRadius: BorderRadius.circular(14)),
    padding: const EdgeInsets.all(10),
    child: const Icon(
      Icons.real_estate_agent_outlined,
      color: BLUE_OLD,
    ),
  );
}

Container IconTabungan() {
  return Container(
    decoration: BoxDecoration(
        color: BACKGROUND_PRIMARY, borderRadius: BorderRadius.circular(14)),
    padding: const EdgeInsets.all(10),
    child: const Icon(
      Icons.real_estate_agent_outlined,
      color: PRIMARY,
    ),
  );
}

Container IconLainLain() {
  return Container(
    decoration: BoxDecoration(
        color: BACKGROUND_GRAY, borderRadius: BorderRadius.circular(14)),
    padding: const EdgeInsets.all(10),
    child: const Icon(
      Icons.wallet,
      color: GRAY,
    ),
  );
}
