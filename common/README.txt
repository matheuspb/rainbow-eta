This folder contains some common files across projects

blas_config.h       -- Configure file for BLAS
gf16.h              -- GF(16) arithmetic
gf31.h              -- GF(31) arithmetic
gf31_convert.{c,h}  -- Converter for byte stream and GF(31)
hash_len_config.h   -- Configures file for the length of HASH function used
hash_utils.{c,h}    -- Library for HASH functions (adaptor for OpenSSL)
rainbow_a.{c,h}     -- Core functions for rainbow over GF(16)
rainbow_b.{c,h}     -- Core functions for rainbow over GF(31)
rainbow_c.{c,h}     -- Core functions for rainbow over GF(256)
rng.{c,h}           -- PRNG from NIST's example
utils.{c,h}         -- Small utility programs
