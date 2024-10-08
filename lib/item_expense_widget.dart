import 'package:flutter/material.dart';

class ItemExpenseWidget extends StatefulWidget {
  final String eDay;
  final String eWeekDay;
  final String eName;
  final String? eCategory;
  final String eValue;
  final bool eWasPaid;
  final void Function(bool?)? wasChecked;
  const ItemExpenseWidget(
      {super.key,
      required this.eDay,
      required this.eWeekDay,
      required this.eName,
      this.eCategory,
      required this.eValue,
      required this.eWasPaid,
      required this.wasChecked});

  @override
  State<ItemExpenseWidget> createState() => _ItemExpenseWidgetState();
}

class _ItemExpenseWidgetState extends State<ItemExpenseWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                              CircleAvatar(
              backgroundColor: Color.fromARGB(255, 253, 225, 206),
              child: Icon(Icons.credit_card),
                              ),
                              SizedBox(
              height: 15,
              width: 15,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.arrow_downward_rounded,
                  size: 10,
                  color: Colors.white,
                ),
              ),
                              ),
                            ]),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.eName,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    if (widget.eCategory != null)
                      Text(
                        widget.eCategory!,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                widget.eValue,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
