import 'package:flutter/material.dart';
import 'package:provider_demo/provider/my_change_notifier_provider.dart';
import 'package:provider_demo/provider/my_inherited_provider.dart';
import 'package:provider_demo/sample_model.dart';

main() {
  runApp(const MaterialApp(
    home: SamplePage(),
  ));
}

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SamplePage"),
      ),
      body: MyChangeNotifierProvider<SampleModel>(_buildBody(), SampleModel()),
    );
  }

  _buildBody() {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Builder(builder: (context) {
            return Text(
                "CountA is ${(MyInheritedProvider.of(context, listen: true).model as SampleModel).count.toString()}");
          }),
          Builder(builder: (context) {
            return Text(
                "CountB is ${(MyInheritedProvider.of(context, listen: false).model as SampleModel).count.toString()}");
          }),
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                (MyInheritedProvider.of(context, listen: false).model
                        as SampleModel)
                    .countIncrease();
              },
              child: const Text("click to increase"),
            );
          })
        ],
      ),
    );
  }
}
