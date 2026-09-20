import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String texto;
  final bool seleccionado;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.texto,
    required this.seleccionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(texto),
        selected: seleccionado,
        onSelected: (_) => onTap(),
        //
        selectedColor: const Color(0xFFFF8FA3),
        backgroundColor: Colors.white,
        labelStyle: TextStyle(
          color: seleccionado ? Colors.white : const Color(0xFFD85B72),
          fontWeight: FontWeight.w600,
        ),
        // NOTE: ..
      ),
    );
  }
}
