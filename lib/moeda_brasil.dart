library moeda_brasil;

import 'package:intl/intl.dart';

/// Classe responsável por formatar valores monetários no padrão brasileiro (BRL).
class MoedaBrasil {
  /// Formata uma string contendo números para o formato de moeda brasileira (R$).
  ///
  /// - [valor] deve conter apenas números.
  /// - Retorna uma string formatada no padrão `R$ 1.234,56`.
  /// 
  /// Exemplo:
  /// ```dart
  /// MoedaBrasil.formatarParaReal('123456') // Retorna 'R$ 1.234,56'
  /// ```
  static String formatarParaReal(String valor) {
    // Remove todos os caracteres que não são números
    String apenasNumeros = valor.replaceAll(RegExp(r'[^0-9]'), '');

    if (apenasNumeros.isEmpty) {
      return 'R\$ 0,00';
    }

    // Garante pelo menos 3 dígitos (para incluir centavos)
    apenasNumeros = apenasNumeros.padLeft(3, '0');

    // Obtém os centavos (últimos 2 dígitos) e os reais (restante)
    String centavos = apenasNumeros.substring(apenasNumeros.length - 2);
    String reais = apenasNumeros.substring(0, apenasNumeros.length - 2);

    double valorNumerico = double.parse('$reais.$centavos');

    // Formata o valor para o padrão brasileiro
    final formatador = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );

    return formatador.format(valorNumerico).replaceAll('\u00A0', ' ').trim(); // 🔹 Remove espaços invisíveis
  }

  /// Remove a formatação de moeda e retorna apenas os números.
  /// 
  /// - [valor] string formatada como moeda (ex: "R$ 1.234,56").
  /// - Retorna uma string contendo apenas números (ex: "123456").
  /// 
  /// Exemplo:
  /// ```dart
  /// MoedaBrasil.limparFormatacao('R$ 1.234,56') // Retorna '123456'
  /// ```
  static String limparFormatacao(String valor) {
    String resultado = valor.replaceAll(RegExp(r'[^0-9]'), '');
    
    // Remove zeros à esquerda, mas mantém um zero se o resultado for "000"
    return resultado.replaceAll(RegExp(r'^0+$'), '0')  // Substitui múltiplos zeros por um único zero
                   .replaceAll(RegExp(r'^0+(?=\d)'), ''); // Remove zeros à esquerda se houver outros dígitos
  }

  /// Converte uma string formatada como moeda para um valor double.
  /// 
  /// - [valor] string formatada como moeda (ex: "R$ 1.234,56").
  /// - Retorna um double (ex: 1234.56).
  /// 
  /// Exemplo:
  /// ```dart
  /// MoedaBrasil.converterParaDouble('R$ 1.234,56') // Retorna 1234.56
  /// ```
  static double converterParaDouble(String valor) {
    String apenasNumeros = limparFormatacao(valor);
    
    if (apenasNumeros.isEmpty) {
      return 0.0;
    }

    // Garante pelo menos 3 dígitos (para incluir centavos)
    apenasNumeros = apenasNumeros.padLeft(3, '0');

    // Obtém os centavos (últimos 2 dígitos) e os reais (restante)
    String centavos = apenasNumeros.substring(apenasNumeros.length - 2);
    String reais = apenasNumeros.substring(0, apenasNumeros.length - 2);

    return double.parse('$reais.$centavos');
  }
}
