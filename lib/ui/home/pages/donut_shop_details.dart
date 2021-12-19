import 'package:donuts_minishop/models/donut_product.dart';
import 'package:donuts_minishop/state/donut_service.dart';
import 'package:donuts_minishop/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutShopDetails extends StatefulWidget {
  const DonutShopDetails({Key? key}) : super(key: key);

  @override
  _DonutShopDetailsState createState() => _DonutShopDetailsState();
}

class _DonutShopDetailsState extends State<DonutShopDetails> {
  DonutProduct? selectedDonut;

  @override
  Widget build(BuildContext context) {
    selectedDonut = Utils.donuts[0];

    var donutService = Provider.of<DonutService>(context, listen: false);
    selectedDonut = donutService.getSelectedDonut();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Utils.mainDark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          width: 120,
          child: Image.network(Utils.donutLogoRedText),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                Positioned(
                  top: -40,
                  right: -120,
                  child: Image.network(selectedDonut!.imgUrl!,
                      width: MediaQuery.of(context).size.width * 1.25,
                      fit: BoxFit.contain),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${selectedDonut!.name}',
                          style: const TextStyle(
                              color: Utils.mainDark,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline),
                        color: Utils.mainDark,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 10, top: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: Utils.mainDark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '\$${selectedDonut!.price!.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(selectedDonut!.description!),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Utils.mainDark.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.shopping_cart, color: Utils.mainDark),
                        SizedBox(width: 20),
                        Text('Add To Cart', style: TextStyle(color: Utils.mainDark)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
