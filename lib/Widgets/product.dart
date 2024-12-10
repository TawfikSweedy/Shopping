import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Models/product_model.dart';
import 'package:shopping/Modules/Details/product_details.dart';
import 'package:shopping/Provider/cart_provider.dart';
import 'package:shopping/Provider/product_provider.dart';

import '../Utilities/theme_helper.dart';

class Product extends StatefulWidget {
  final ProductModel product;
  const Product({super.key, required this.product});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: SizedBox(
        width: size.width * 0.40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white60,
                          spreadRadius: 0.5,
                          offset: Offset(5, 5),
                        )
                      ]),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => ProductDetails(product: widget.product),
                      ),
                      );
                    },
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.contain,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Positioned(
                    right: 8,
                    top: 8,
                    child: widget.product.isAvailable
                        ? GestureDetector(
                            onTap: () {
                              productProvider.toggleFavorite(widget.product);
                            },
                            child: Icon(
                              widget.product.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: size.width * 0.05,
                              color: widget.product.isFavorite
                                  ? Colors.redAccent
                                  : Colors.black,
                            ),
                          )
                        : SizedBox())
              ],
            ),
            SizedBox(height: size.height * 0.20),
            Text(
              widget.product.name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: size.width * 0.033,
              ),
            ),
            SizedBox(height: size.height * 0.005),
            SizedBox(
                child: widget.product.isAvailable
                    ? Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: ThemeClass.color0xFF03B680,
                            radius: 4,
                          ),
                          SizedBox(width: size.height * 0.020),
                          Text(
                            'Available',
                            style: GoogleFonts.poppins(
                              color: ThemeClass.color0xFF03B680,
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.031,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.redAccent,
                            radius: 4,
                          ),
                          SizedBox(width: size.height * 0.020),
                          Text(
                            'Out of Stock',
                            style: GoogleFonts.poppins(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.031,
                            ),
                          ),
                        ],
                      )),
            SizedBox(width: size.height * 0.020),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${widget.product.price}",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.040,
                  ),
                ),
                widget.product.isAvailable
                    ? GestureDetector(
                        onTap: () {
                          context
                              .read<CartProvider>()
                              .addToCart(widget.product);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              'Item Added!',
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 13,
                          child: Icon(
                            CupertinoIcons.cart_fill_badge_plus,
                            size: size.width * 0.065,
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
