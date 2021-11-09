import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImage);
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.removeListener(updateImage);
    _imageUrlFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  void _submitForm() {
    _formKey.currentState?.save();
    final newProduct = Product(
      id: Random().nextDouble().toString(),
      name: _formData['name'] as String,
      description: _formData['description'] as String,
      price: _formData['price'] as double,
      imageUrl: _formData['imageUrl'] as String,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Formulário de Produto'),
          actions: [
            IconButton(
              onPressed: () => _submitForm(),
              icon: Icon(Icons.save),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocus);
                  },
                  onSaved: (name) => _formData['name'] = name ?? '',
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Preço'),
                  focusNode: _priceFocus,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocus);
                  },
                  onSaved: (price) =>
                      _formData['price'] = double.parse(price ?? '0'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                  textInputAction: TextInputAction.next,
                  focusNode: _descriptionFocus,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onSaved: (description) =>
                      _formData['description'] = description ?? '',
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'URL da Imagem'),
                        focusNode: _imageUrlFocus,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        onSaved: (imageUrl) =>
                            _formData['imageUrl'] = imageUrl ?? '',
                        onFieldSubmitted: (_) => _submitForm(),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 12,
                        left: 12,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: _imageUrlController.text.isEmpty
                          ? Text(
                              'Informe a URL',
                              textAlign: TextAlign.center,
                            )
                          : FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(_imageUrlController.text),
                            ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
