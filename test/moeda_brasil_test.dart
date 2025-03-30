import 'package:moeda_brasil/moeda_brasil.dart';
import 'package:test/test.dart';

void main() {
  group('MoedaBrasil', () {
    group('formatarParaReal', () {
      test('deve formatar valores corretamente', () {
        expect(MoedaBrasil.formatarParaReal('123456').trim(), equals('R\$ 1.234,56'));
        expect(MoedaBrasil.formatarParaReal('100').trim(), equals('R\$ 1,00'));
        expect(MoedaBrasil.formatarParaReal('').trim(), equals('R\$ 0,00'));
        expect(MoedaBrasil.formatarParaReal('00000').trim(), equals('R\$ 0,00'));
        expect(MoedaBrasil.formatarParaReal('00000123').trim(), equals('R\$ 1,23'));
      });

      test('deve formatar valores grandes corretamente', () {
        expect(MoedaBrasil.formatarParaReal('1234567890').trim(), equals('R\$ 12.345.678,90'));
        expect(MoedaBrasil.formatarParaReal('1000000000').trim(), equals('R\$ 10.000.000,00'));
      });

      test('deve ignorar caracteres não numéricos na entrada', () {
        expect(MoedaBrasil.formatarParaReal('1a2b3c4d5e6f').trim(), equals('R\$ 1.234,56'));
        expect(MoedaBrasil.formatarParaReal('R\$ 1.234,56').trim(), equals('R\$ 1.234,56'));
      });
    });

    group('limparFormatacao', () {
      test('deve remover formatação corretamente', () {
        expect(MoedaBrasil.limparFormatacao('R\$ 1.234,56').trim(), equals('123456'));
        expect(MoedaBrasil.limparFormatacao('R\$ 1,00').trim(), equals('100'));
        expect(MoedaBrasil.limparFormatacao('R\$ 0,00').trim(), equals('0'));
      });

      test('deve manter apenas números e remover zeros à esquerda', () {
        expect(MoedaBrasil.limparFormatacao('abc123def456').trim(), equals('123456'));
        expect(MoedaBrasil.limparFormatacao('R\$ -1.234,56').trim(), equals('123456'));
        expect(MoedaBrasil.limparFormatacao('000'), equals('0')); // Corrigido
        expect(MoedaBrasil.limparFormatacao('000123'), equals('123')); // Garante que zeros à esquerda são removidos
      });
    });
  });
}
