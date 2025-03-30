<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# moeda_brasil

Um pacote Dart para manipulação e formatação de valores monetários no formato da moeda brasileira (Real - BRL).

## Features

- Formatação de números para o formato de moeda brasileira (R$)
- Conversão de valores textuais em formato monetário para números
- Remoção de formatação para processamento de valores
- Conversão de strings formatadas para valores double
- Tratamento adequado de zeros à esquerda

## Getting started

Adicione `moeda_brasil` como uma dependência no seu arquivo `pubspec.yaml`:

```yaml
dependencies:
  moeda_brasil: ^1.1.0
```

Depois execute:

```bash
dart pub get
```

Ou com Flutter:

```bash
flutter pub get
```

## Usage

```dart
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
```

## API Reference

### `formatarParaReal(String valor)`

Formata uma string contendo números para o formato de moeda brasileira (R$).

### `limparFormatacao(String valor)`

Remove a formatação de moeda e retorna apenas os números, sem zeros à esquerda.

### `converterParaDouble(String valor)`

Converte uma string formatada como moeda para um valor double.

## Autor

- [Victor Silva](https://github.com/victorprsilva)

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.
