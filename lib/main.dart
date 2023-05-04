import 'package:boxer/cubit/boxer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => BoxerCubit(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boxer'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _Board(),
              const SizedBox(height: 16),
              _Lamination(),
              const SizedBox(height: 16),
              _Printing(),
              const SizedBox(height: 16),
              _Pasting(),
              const SizedBox(height: 16),
              _DieCutting(),
              const SizedBox(height: 16),
              _Stitching(),
              const SizedBox(height: 16),
              _Conversion(),
              const SizedBox(height: 16),
              FloatingActionButton.extended(
                onPressed: () {
                  context.read<BoxerCubit>().calculate();
                },
                label: const Text('Calculate Final'),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.yellowAccent,
                child: Text(context
                    .watch<BoxerCubit>()
                    .state
                    .finalCalculation
                    .toString()),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class _Lamination extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final length = useTextEditingController();
    final width = useTextEditingController();
    final rate = useTextEditingController();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lamination',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _InPutBox(
              controller: length,
              label: 'Length',
            ),
            _InPutBox(
              controller: width,
              label: 'Width',
            ),
            _InPutBox(
              controller: rate,
              label: 'Rate',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    var calculation = (double.parse(length.text) *
                            double.parse(width.text) *
                            double.parse(rate.text)) /
                        1000;

                    context
                        .read<BoxerCubit>()
                        .addLaminationCalculation(calculation);
                  },
                  label: const Text('Calculate Lamination'),
                ),
                Text(context
                    .watch<BoxerCubit>()
                    .state
                    .laminationCalculation
                    .toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _DieCutting extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final dieCutting = useTextEditingController();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Die Cutting',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _InPutBox(
              controller: dieCutting,
              label: 'Die Cutting',
              onChanged: (value) => context
                  .read<BoxerCubit>()
                  .addDieCuttingCalculation(double.parse(value)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stitching extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final stitching = useTextEditingController();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stitching',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _InPutBox(
              controller: stitching,
              label: 'Stitching',
              onChanged: (value) => context
                  .read<BoxerCubit>()
                  .addStitchingCalculation(double.parse(value)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Conversion extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final conversion = useTextEditingController();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Conversion',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _InPutBox(
              controller: conversion,
              label: 'Conversion',
              onChanged: (value) => context
                  .read<BoxerCubit>()
                  .addConversionCalculation(double.parse(value)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(context
                    .watch<BoxerCubit>()
                    .state
                    .profitCalculation
                    .toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Pasting extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final length = useTextEditingController();
    final width = useTextEditingController();
    final rate = useTextEditingController();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pasting',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _InPutBox(
              controller: length,
              label: 'Length',
            ),
            _InPutBox(
              controller: width,
              label: 'Width',
            ),
            _InPutBox(
              controller: rate,
              label: 'Rate',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    var calculation = (double.parse(length.text) *
                            double.parse(width.text) *
                            double.parse(rate.text)) /
                        1307;

                    context
                        .read<BoxerCubit>()
                        .addPastingCalculation(calculation);
                  },
                  label: const Text('Calculate'),
                ),
                Text(context
                    .watch<BoxerCubit>()
                    .state
                    .pastingCalculation
                    .toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Printing extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final rate = useTextEditingController();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Printing',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _InPutBox(
              controller: rate,
              label: 'Rate',
              onChanged: (value) => context
                  .read<BoxerCubit>()
                  .addPrintingCalculation(double.parse(value)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Board extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final length = useTextEditingController();
    final width = useTextEditingController();
    final gram = useTextEditingController();
    final rate = useTextEditingController();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Board',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _InPutBox(
              controller: length,
              label: 'Length',
            ),
            _InPutBox(
              controller: width,
              label: 'Width',
            ),
            _InPutBox(
              controller: gram,
              label: 'Gram',
            ),
            _InPutBox(
              controller: rate,
              label: 'Rate',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    var calculation = ((double.parse(length.text) *
                                double.parse(width.text) *
                                double.parse(gram.text)) /
                            1521) *
                        double.parse(rate.text);

                    context.read<BoxerCubit>().addBoardCalculation(calculation);
                  },
                  label: const Text('Calculate'),
                ),
                Text(context
                    .watch<BoxerCubit>()
                    .state
                    .boardCalculation
                    .toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InPutBox extends StatelessWidget {
  const _InPutBox({
    required this.controller,
    required this.label,
    this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text(label),
          hintText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
