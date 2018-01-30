#!/usr/bin/python

from decimal import *
getcontext().prec = 7 

a = Decimal('1')
b = Decimal('3')
c = Decimal('4')
em = b*(c/b-a)-a
##em = 3*(4/3.-1)-1
print('em = %e' % em)
