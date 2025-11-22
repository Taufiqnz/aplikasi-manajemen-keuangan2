import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String amount = "0";
  bool isIncome = false;

  void press(String value) {
    setState(() {
      if (value == "C") {
        amount = "0";
      } else if (value == "=") {
        //
      } else {
        if (amount == "0") {
          amount = value;
        } else {
          amount += value;
        }
      }
    });
  }

  Widget keyButton(String text) {
    return GestureDetector(
      onTap: () => press(text),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Add Transaction",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 18),

            // ===== INPUT AMOUNT =====
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.arrow_drop_down),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      amount,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => amount = "0"),
                    child: const Icon(Icons.close),
                  )
                ],
              ),
            ),

            const SizedBox(height: 18),

            // ===== INCOME / EXPENSE =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() => isIncome = true),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: isIncome
                          ? Colors.green[300]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text("Income",
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => setState(() => isIncome = false),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: !isIncome
                          ? Colors.red[300]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text("Expense",
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ===== KEYPAD =====
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    keyButton("1"),
                    keyButton("2"),
                    keyButton("3"),
                    keyButton("+"),
                    keyButton("4"),
                    keyButton("5"),
                    keyButton("6"),
                    keyButton("-"),
                    keyButton("7"),
                    keyButton("8"),
                    keyButton("9"),
                    keyButton("×"),
                    keyButton("."),
                    keyButton("0"),
                    keyButton("="),
                    keyButton("C"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
