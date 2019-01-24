import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:intl/number_symbols.dart';

Widget precio(actual, regular){
  numberFormatSymbols['zz'] = new NumberSymbols(
    NAME: "zz",
    DECIMAL_SEP: ',',
    GROUP_SEP: '.',
    PERCENT: '%',
    ZERO_DIGIT: '0',
    PLUS_SIGN: '+',
    MINUS_SIGN: '-',
    EXP_SYMBOL: 'e',
    PERMILL: '\u2030',
    INFINITY: '\u221E',
    NAN: 'NaN',
    DECIMAL_PATTERN: '#,##0.###',
    SCIENTIFIC_PATTERN: '#E0',
    PERCENT_PATTERN: '#,##0%',
    CURRENCY_PATTERN: '\u00A4#,##0.00',
    DEF_CURRENCY_CODE: 'CLP',
  );

  if(actual == regular){
    return Padding(
      padding: EdgeInsets.all(11.0),
      child: Text(
        'Precio: \$${NumberFormat('###,000', 'zz').format(int.parse(regular))} CLP',
        style: TextStyle(
            fontSize: 24.0
        ),
      ),
    );
  }else{
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Precio: \$${NumberFormat('###,000', 'zz').format(int.parse(regular))} CLP',
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 18.0,
                color: Colors.red
            ),
          ),
          Text(
            'Precio Oferta: \$${NumberFormat('###,000', 'zz').format(int.parse(actual))} CLP',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}