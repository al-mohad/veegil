import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/app/data/enums/view_state.dart';

import '../modules/home/controllers/home_controller.dart';

class CustomButtomSheet extends GetView<HomeController> {
  const CustomButtomSheet({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.swformKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'Account Number',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.phoneNumberController,
                style: const TextStyle(color: Colors.black),
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  prefixIcon: const Icon(
                    Icons.recent_actors,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Amount',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextFormField(
                controller: controller.amountController,
                autofocus: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  prefixIcon: const Icon(
                    Icons.recent_actors,
                    color: Colors.black,
                  ),
                  hintText: '5000',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (v) {
                  if (v!.trim().isEmpty) {
                    return 'Please enter amount';
                  }
                  if (v.trim().length < 3 ||
                      v.trim().startsWith('0') ||
                      v.trim().startsWith('00') ||
                      v.trim().startsWith('000')) {
                    return 'Minimum amount for transfer is 100 ';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  text.split(' ').first == 'Transfer'
                      ? controller.transfer()
                      : controller.withdraw();
                },
                child: Obx(() => controller.viewState.value == ViewState.busy
                    ? const Center(child: LinearProgressIndicator())
                    : Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            text.split(' ').first,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
