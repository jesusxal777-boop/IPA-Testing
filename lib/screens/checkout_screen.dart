import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_controller.dart';
import '../theme/dreambyte_theme.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'id': 'mercadopago',
      'name': 'Mercado Pago',
      'icon': '💳',
      'description': 'Paga con tu cuenta de Mercado Pago',
    },
    {
      'id': 'paypal',
      'name': 'PayPal',
      'icon': '🅿️',
      'description': 'Paga con tu cuenta de PayPal',
    },
    {
      'id': 'card',
      'name': 'Tarjeta de Crédito/Débito',
      'icon': '💰',
      'description': 'Paga con tarjeta bancaria',
    },
    {
      'id': 'transfer',
      'name': 'Transferencia Bancaria',
      'icon': '🏦',
      'description': 'Transferencia directa a banco',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        elevation: 0,
      ),
      body: Consumer<StoreController>(
        builder: (context, store, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order summary
                Text(
                  'Resumen de Orden',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        DreamByteTheme.navyMedium.withOpacity(0.7),
                        DreamByteTheme.navyMedium.withOpacity(0.4),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: DreamByteTheme.cyanNeon.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${store.totalItems} Producto(s)',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '\$${store.subtotal.toStringAsFixed(2)} MXN',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Impuesto (16%)',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '\$${store.tax.toStringAsFixed(2)} MXN',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 1,
                        color: DreamByteTheme.cyanNeon.withOpacity(0.2),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total a Pagar',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: DreamByteTheme.cyanNeon),
                          ),
                          Text(
                            '\$${store.total.toStringAsFixed(2)} MXN',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: DreamByteTheme.electricBlue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Payment methods
                Text(
                  'Método de Pago',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                ...List.generate(
                  _paymentMethods.length,
                  (index) {
                    final method = _paymentMethods[index];
                    final isSelected = store.selectedPaymentMethod == method['id'];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          store.setSelectedPaymentMethod(method['id']);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: isSelected
                                  ? [
                                      DreamByteTheme.electricBlue.withOpacity(0.6),
                                      DreamByteTheme.cyanNeon.withOpacity(0.4),
                                    ]
                                  : [
                                      DreamByteTheme.navyMedium.withOpacity(0.7),
                                      DreamByteTheme.navyMedium.withOpacity(0.4),
                                    ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(
                              color: isSelected
                                  ? DreamByteTheme.cyanNeon
                                  : DreamByteTheme.cyanNeon.withOpacity(0.2),
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Text(
                                method['icon'],
                                style: const TextStyle(fontSize: 32),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      method['name'],
                                      style:
                                          Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      method['description'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: DreamByteTheme.cyanNeon
                                                .withOpacity(0.7),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isSelected)
                                const Icon(
                                  Icons.check_circle,
                                  color: DreamByteTheme.electricBlue,
                                  size: 28,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                // Important note about card data
                if (store.selectedPaymentMethod == 'card')
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.orange.withOpacity(0.5),
                      ),
                      color: Colors.orange.withOpacity(0.1),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Icon(Icons.info, color: Colors.orange),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Los datos de tarjeta NO son almacenados ni procesados',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 24),
                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Volver'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: store.selectedPaymentMethod.isEmpty
                            ? null
                            : () {
                                _showConfirmationDialog(context, store);
                              },
                        child: const Text('Confirmar Pago'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, StoreController store) {
    final methodName = _paymentMethods
        .firstWhere((m) => m['id'] == store.selectedPaymentMethod)['name'];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Orden Confirmada'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tu orden ha sido procesada exitosamente.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Método de pago: $methodName',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Total: \$${store.total.toStringAsFixed(2)} MXN',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: DreamByteTheme.electricBlue),
            ),
            const SizedBox(height: 16),
            Text(
              'Gracias por tu compra en DreamByte Store.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              store.clearCart();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text('Volver a la tienda'),
          ),
        ],
      ),
    );
  }
}
