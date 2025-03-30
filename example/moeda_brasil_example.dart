import 'package:moeda_brasil/moeda_brasil.dart';

void main() {
  // Exemplo de formatação para Real (R$)
  String valorFormatado = MoedaBrasil.formatarParaReal('123456');
  print(valorFormatado); // Saída: R$ 1.234,56

  // Exemplo com valor decimal
  String valorComCentavos = MoedaBrasil.formatarParaReal('123456789');
  print(valorComCentavos); // Saída: R$ 1.234.567,89

  // Exemplo de limpeza de formatação
  String valorLimpo = MoedaBrasil.limparFormatacao('R\$ 1.234,56');
  print(valorLimpo); // Saída: 123456

  // Exemplo de conversão para double
  double valorDouble = MoedaBrasil.converterParaDouble('R\$ 250,00');
  print(valorDouble); // Saída: 250.0
}
