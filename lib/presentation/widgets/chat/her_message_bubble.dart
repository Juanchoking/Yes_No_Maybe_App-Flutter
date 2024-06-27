import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;


    return Column(
      //crossAxis alinea contenido a la derecha
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [

        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)      
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
            child: Text('Consectetur ea eu', style: TextStyle( color: Colors.white ), ),
          ),
        ),
        const SizedBox(height: 5,),
        _ImageBubble(),
        const SizedBox(height: 10,),

      ],
      );
  }
}

class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Saber dimensiones del dispositivo
    final size = MediaQuery.of(context).size;
    print(size);


    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/yes/8-2f93962e2ab24427df8589131da01a4d.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          // loadingProgress == null -> no hay nada en progreso, ya se cargo
          //si ya se cargo, retorna la imagen(Child)
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7, //el 70% del espacio disponible
            height: 150, //para respetar las mismas dimensiones de la linea 51(height)
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
            child: const Text('Scarlett esta enviando una imagen'),
          );

        },
      ),
      );
  }
}