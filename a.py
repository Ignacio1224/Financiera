#!/usr/bin/env python
# -*- coding: utf-8 -*-

filepath = 'currencys.txt'
money = open('datos_moneda.sql', "w")

with open(filepath) as fp:
   for cnt, line in enumerate(fp):
       currency = line.split("'", )[3]
       symbol = line.split("'", )[7]
       money.write(r"INSERT INTO Moneda (IdMoneda, DscMoneda, SimboloMoneda) VALUES ('{}', '{}', '{}');".format(cnt + 1, currency, symbol) + "\n")

money.close()
