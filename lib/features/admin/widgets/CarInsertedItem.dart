import 'package:carrental/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CarInsertedItem extends StatelessWidget {
  const CarInsertedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 60, child: Image.asset(AssetsData.logo)),
                      const Text(
                        'Audi',
                        style: TextStyle(fontSize: 26),
                      ),
                      const Text(
                        '2020',
                        style: TextStyle(fontSize: 26),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        r'2000$',
                        style: TextStyle(fontSize: 26),
                      ),
                      Text(
                        'grey',
                        style: TextStyle(fontSize: 26),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 40),
            Column(
              children: [
                const SizedBox(height: 40),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 36,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.dangerous,
                    color: Colors.red,
                    size: 36,
                  ),
                ),
                const SizedBox(width: 70),
              ],
            )
          ],
        ),
        const Divider(
          height: 8,
          indent: 30,
          endIndent: 30,
          thickness: 2,
        ),
      ],
    );
  }
}
