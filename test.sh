#! /bin/sh

set -e

for p in Ia Ib Ic IIIb IIIc IVa Vc VIa VIb
do
	make PROJ=$p -j$(nproc)
	make clean
done
