# Rainbow-eta

This repository contains a fork of the Rainbow implementation submitted to
NIST's Post-Quantum cryptosystems competition. This is a proof-of-concept
implementation of the proposal published in [Africacrypt
2019](https://link.springer.com/chapter/10.1007%2F978-3-030-23696-0_20). Note
that this implementation does not make use of the full potential of the
framework, as it does not substitute vinegar variables in the second layer.

Each of the subfolders contains the code for one parameter set:

* Ia    - Rainbow(GF(16),32,32,32)
* Ib    - Rainbow(GF(31),36,28,28)
* Ic    - Rainbow(GF(256),40,24,24)
* IIIb  - Rainbow(GF(31),64,32,48)
* IIIc  - Rainbow(GF(256),68,36,36)
* IVa   - Rainbow(GF(16),56,48,48)
* Vc    - Rainbow(GF(256),92,48,48)
* VIa   - Rainbow(GF(16),76,64,64)
* VIb   - Rainbow(GF(31),84,56,56)


Type 'make'. It will generate an executable using source files from the
directory specified in PROJ.

The default value of PROJ is Ia. To generate executable files
rainbow-genkey, rainbow-sign, and rainbow-verify from other directories, please
type "make PROJ=Ib" or replace Ib with any other directory.

For explanation of files under these directories, please refer to the
README.txt in each directory.

other files under this directory are:
rainbow-{genkey,sign,verify}.c - source file for testing programs

The single algorithms rainbow-genkey, rainbow-sign and rainbow-verify are used
as follows.

```
$ ./rainbow-genkey pk.txt sk.txt [seed]
```
rainbow-genkey generates a Rainbow key pair and stores it in the files pk.txt
and sk.txt.  If seed_file is set, the algorithm uses the content of seed_file
as seed for the PRNG and outputs the used randomness in the terminal.

```
$ ./rainbow-sign sk.txt file [seed] > signature.txt
```
rainbow-sign reads in the secret key from sk.txt and the message from
file_to_be_signed.  If seed_file is set, rainbow-sign uses the content of
seed_file as seed for the PRNG and outputs the used randomness in the terminal.

```
$ ./rainbow-verify pk.txt signature.txt file
```
The algorithm reads in the public key, the signed document and the signature
and outputs TRUE or FALSE.

Remark: The length of the seed is fixed to 48 byte (=384 bit).
