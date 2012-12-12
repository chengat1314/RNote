#!/usr/bin/env python2
# -*- coding: utf-8 -*-

# Last modified: <2012-12-04 19:09:06 Tuesday by richard>

# @version 0.1
# @author : Richard Wong
# Email: chao787@gmail.com
import codecs
import re
num = re.compile(r'\d\.\d+')

def trans(f):
    with codecs.open(f, "rb", "utf-8") as fin:
        a = fin.read()
        a = num.sub(a, "")

    print a
    with codecs.open(f + 'trans', 'wb', 'utf-8') as fout:
        fout.write(a)


if __name__ == '__main__':
    trans('/tmp/beta_2_lda/model-02000.twords')

# code_translate.py ended here
