import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_posresto_app/data/datasources/product_local_datasource.dart';
import 'package:flutter_posresto_app/presentation/setting/bloc/sync_product/sync_product_bloc.dart';


class SyncDataPage extends StatefulWidget {
  const SyncDataPage({super.key});

  @override
  State<SyncDataPage> createState() => _SyncDataPageState();
}

class _SyncDataPageState extends State<SyncDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sync Data'),
        ),
        body: Column(
          children: [
            BlocConsumer<SyncProductBloc, SyncProductState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  loaded: (productResponseModel) {
                    ProductLocalDatasource.instance.deleteAllProducts();
                    ProductLocalDatasource.instance.insertProducts(productResponseModel.data!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Loaded ${productResponseModel.data!.length} products'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => ElevatedButton(
                    onPressed: () {
                      context
                          .read<SyncProductBloc>()
                          .add(const SyncProductEvent.syncProduct());
                    },
                    child: const Text('Sync Product'),
                  ),
                  loading: () => const CircularProgressIndicator(),
                  error: (message) => Text(message),
                  success: () => const Text('Success'),
                );
              },
            ),
          ],
        ));
  }
}
