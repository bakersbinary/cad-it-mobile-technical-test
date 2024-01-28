import 'package:cad_it_mobile_technical_test/core/widgets/fill_button.dart';
import 'package:cad_it_mobile_technical_test/core/widgets/form_input.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlgorithmScreen extends StatefulWidget {
  const AlgorithmScreen({super.key});

  @override
  State<AlgorithmScreen> createState() => _AlgorithmScreenState();
}

class _AlgorithmScreenState extends State<AlgorithmScreen> {
  final TextEditingController _targetPositionController =
  TextEditingController();
  final TextEditingController _targetSizeController = TextEditingController();
  String message = "Your answer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormInput(
              title: "Masukkan Panjang Angka",
              textEditingController: _targetSizeController,
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormInput(
              title: "Masukkan Posisi Angka (mis: 15)",
              textEditingController: _targetPositionController,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              "Hasilnya",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.green.withOpacity(0.35),
              ),
              child: Center(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FillButton(
              title: "Cari Data",
              onPressed: () {
                if (_targetSizeController.text.isEmpty &&
                    _targetPositionController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Anda belum melengkapi data");
                  return;
                }

                final targetSize = int.parse(_targetSizeController.text);
                final targetPosition = _targetPositionController.text.isEmpty
                    ? 0
                    : int.parse(_targetPositionController.text);

                if (targetSize <= 0) {
                  Fluttertoast.showToast(msg: "Ukuran data harus lebih dari 0");
                  return;
                }

                if (targetPosition <= 0) {
                  Fluttertoast.showToast(
                      msg: "Posisi angka yang dicari harus lebih dari 0");
                  return;
                }

                if (targetPosition > targetSize) {
                  Fluttertoast.showToast(
                      msg: "Posisi angka yang dicari melebihi ukuran data");
                  return;
                }

                var numbers = "";
                for (var i = 1; i <= targetSize; i++) {
                  numbers += i.toString();
                }

                var numbersAsCharArray = numbers.characters;
                var maps = <int, int>{};
                var infixTitle = "";
                switch (targetPosition) {
                  case 1:
                    infixTitle = "1st";
                  case 2:
                    infixTitle = "2nd";
                  case 3:
                    infixTitle = "3rd";
                  default:
                    infixTitle = "${targetPosition}th";
                }

                var index = 0;
                for (var element in numbersAsCharArray) {
                  var newIndex = index + 1;
                  if (newIndex < 10) {
                    maps[newIndex] = int.parse(element.toString());
                  } else {
                    maps[newIndex] = int.parse(element.toString());
                    maps[newIndex + 1] = int.parse(element.toString()) + 1;
                  }

                  if (newIndex == numbersAsCharArray.length) {
                    maps.remove(newIndex + 1);
                  }

                  index++;
                }

                var targetValue = maps[targetPosition] ?? 0;
                var realValue = "";
                var left = maps[targetPosition - 1] ?? 0;

                if (targetValue <= left || left == 0) {
                  var pair = maps[targetPosition + 1];
                  realValue = "$targetValue$pair";
                } else {
                  realValue = "$left$targetValue";
                }

                if (targetPosition < 10) {
                  print(
                      "$infixTitle digit number is $targetValue lies on number $targetValue");
                  setState(() {
                    message =
                    "$infixTitle digit number is $targetValue lies on number $targetValue";
                  });
                  return;
                }

                print(
                    "$infixTitle digit number is $targetValue lies on number $realValue");
                setState(() {
                  message = "$infixTitle digit number is $targetValue lies on number $realValue";
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
