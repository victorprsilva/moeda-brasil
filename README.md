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
- Suporte a casas decimais
- Tratamento adequado de valores negativos
- Formatação com ou sem símbolo da moeda

## Getting started

Adicione `moeda_brasil` como uma dependência no seu arquivo `pubspec.yaml`:

```yaml
dependencies:
  moeda_brasil: ^1.0.0
```

## Usage

```dart
import 'package:moeda_brasil/moeda_brasil.dart';

void main() {
  // Formatando um número para Real brasileiro
  double valor = 1234.56;
  String valorFormatado = MoedaBrasil.formatarMoeda(valor);
  print(valorFormatado); // Saída: R$ 1.234,56
}
```

## Additional information

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.
