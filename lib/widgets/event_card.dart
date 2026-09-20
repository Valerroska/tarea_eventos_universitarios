import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> evento;
  final VoidCallback onPressed;

  const EventCard({super.key, required this.evento, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              evento['imagen'],
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.image_not_supported, size: 48),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              evento['titulo'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              evento['categoria'],
              style: const TextStyle(
                color: Color(0xFFD85B72),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
            child: Text(
              '⌯⌲ 🗓️⋆ ｡˚ ${evento['fecha']}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          // TODO 1:
          // Agregar al diseño la hora, el lugar y el cupo del evento.
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text('⊹ ࣪ ˖🕑 ୭˚. ᵎ ${evento['hora']}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '📍${evento['lugar']}',
                    overflow: TextOverflow.ellipsis,
                  ),
                  //overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${evento['cupo']} lugares',
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          // NOTE: Para mostrar la hora, lugar y cupos del evento

          // TODO 2:
          // Agregar un botón que permita registrarse o marcar
          // el evento como "Me interesa".
          //
          // El botón deberá ejecutar:
          // onPressed();
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8FA3),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Me interesa'),
              ),
            ),
          ),
          // NOTE: Botón

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
