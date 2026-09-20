import 'package:flutter/material.dart';

import '../data/event_data.dart';
import '../widgets/category_chip.dart';
import '../widgets/event_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String categoriaSeleccionada = 'Todos';

  @override
  Widget build(BuildContext context) {
    // TODO:
    // Actualmente se muestran TODOS los eventos.
    //
    // El alumno debe modificar esta parte para que:
    //
    // - Si categoriaSeleccionada == 'Todos':
    //     se muestren todos los eventos.
    //
    // - Si se selecciona otra categoría:
    //     solamente aparezcan los eventos de esa categoría.
    //
    // Pista:
    // List.where(...).toList();

    // final eventosMostrados = eventos;
    final eventosMostrados = categoriaSeleccionada == 'Todos'
        ? eventos
        : eventos
              .where((evento) => evento['categoria'] == categoriaSeleccionada)
              .toList();
    // NOTE:
    // Antes mostraba todos los eventos sin importar nada, ahora pregunta si quiere mostrarlos todos o si solo quiere los de determinada categoría

    return Scaffold(
      appBar: AppBar(title: const Text('Campus Eventos de Valeria Paola')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '⋆˚࿔♫⋆˚࿔ Campus Festival ⋆˚࿔♫⋆˚࿔',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFD85B72),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Conciertos, música y noches inolvidables en tu campus con tus estrellas favoritas!!!',
              ),
              const SizedBox(height: 20),

              SizedBox(
                height: 42,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorias.length,
                  itemBuilder: (context, index) {
                    final categoria = categorias[index];

                    return CategoryChip(
                      texto: categoria,
                      seleccionado: categoriaSeleccionada == categoria,
                      onTap: () {
                        setState(() {
                          categoriaSeleccionada = categoria;
                        });
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Eventos encontrados: ${eventosMostrados.length}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Base responsiva sencilla.
                    // El alumno puede modificar estos valores y mejorar
                    // la adaptación a distintos tamaños de pantalla.
                    final columnas = constraints.maxWidth >= 900
                        ? 4
                        : constraints.maxWidth >= 600
                        ? 3
                        : 2;

                    return GridView.builder(
                      itemCount: eventosMostrados.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columnas,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) {
                        final evento = eventosMostrados[index];

                        return EventCard(
                          evento: evento,
                          onPressed: () {
                            // TODO:
                            // Mostrar un SnackBar indicando el evento
                            // seleccionado.

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Evento seleccionado: ${evento['titulo']}",
                                ),
                              ),
                            );
                            // NOTE: Para mostrar un mensaje con el nombre del evento seleccionado
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
