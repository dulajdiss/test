import 'package:ebbf/configs/images.dart';
import 'package:flutter/material.dart';

class SponsorsCard extends StatelessWidget {
  final controler;
  final entries;
  const SponsorsCard({super.key,this.entries, this.controler});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: (MediaQuery.of(context).size.width) * 0.9,
        height: (MediaQuery.of(context).size.height) * 0.232,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            controller: controler,
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Transform.scale(
                  scale: 1,
                  child: Card(
                    // elevation: 6,
                    child: Center(
                      child: Image.network(
                        entries[index].pic.toString(),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ));
            }
        )
      ),
    );
  }
}
