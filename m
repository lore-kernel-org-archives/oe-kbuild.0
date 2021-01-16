Content-Type: multipart/mixed; boundary="===============4743678005210777097=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/keembay/ocs-aes.c:833:13: warning: Possible null pointer dereference: iv32
Date: Sat, 16 Jan 2021 11:29:55 +0800
Message-ID: <202101161142.WAFQ5W3v-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4743678005210777097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mike Healy <mikex.healy@intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Daniele Alessandrelli <daniele.alessandrelli@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b45e2da6e444280f8661dca439c1e377761b2877
commit: 88574332451380f4b51f6ca88ab9810e714bfb9b crypto: keembay - Add supp=
ort for Keem Bay OCS AES/SM4
date:   5 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/crypto/keembay/ocs-aes.c:833:13: warning: Possible null pointer =
dereference: iv32 [nullPointer]
     iowrite32(iv32[0], aes_dev->base_reg + AES_IV_0_OFFSET);
               ^
   drivers/crypto/keembay/ocs-aes.h:93:44: note: Calling function 'ocs_aes_=
op', 8th argument 'NULL' value is 0
        dst_dma_list, src_dma_list, src_size, NULL, 0);
                                              ^
   drivers/crypto/keembay/ocs-aes.c:822:9: note: Assignment 'iv32=3D(u32*)i=
v', assigned value is 0
    iv32 =3D (u32 *)iv;
           ^
   drivers/crypto/keembay/ocs-aes.c:833:13: note: Null pointer dereference
     iowrite32(iv32[0], aes_dev->base_reg + AES_IV_0_OFFSET);
               ^
   drivers/crypto/keembay/ocs-aes.c:834:13: warning: Possible null pointer =
dereference: iv32 [nullPointer]
     iowrite32(iv32[1], aes_dev->base_reg + AES_IV_1_OFFSET);
               ^
   drivers/crypto/keembay/ocs-aes.h:93:44: note: Calling function 'ocs_aes_=
op', 8th argument 'NULL' value is 0
        dst_dma_list, src_dma_list, src_size, NULL, 0);
                                              ^
   drivers/crypto/keembay/ocs-aes.c:822:9: note: Assignment 'iv32=3D(u32*)i=
v', assigned value is 0
    iv32 =3D (u32 *)iv;
           ^
   drivers/crypto/keembay/ocs-aes.c:834:13: note: Null pointer dereference
     iowrite32(iv32[1], aes_dev->base_reg + AES_IV_1_OFFSET);
               ^
   drivers/crypto/keembay/ocs-aes.c:835:13: warning: Possible null pointer =
dereference: iv32 [nullPointer]
     iowrite32(iv32[2], aes_dev->base_reg + AES_IV_2_OFFSET);
               ^
   drivers/crypto/keembay/ocs-aes.h:93:44: note: Calling function 'ocs_aes_=
op', 8th argument 'NULL' value is 0
        dst_dma_list, src_dma_list, src_size, NULL, 0);
                                              ^
   drivers/crypto/keembay/ocs-aes.c:822:9: note: Assignment 'iv32=3D(u32*)i=
v', assigned value is 0
    iv32 =3D (u32 *)iv;
           ^
   drivers/crypto/keembay/ocs-aes.c:835:13: note: Null pointer dereference
     iowrite32(iv32[2], aes_dev->base_reg + AES_IV_2_OFFSET);
               ^
   drivers/crypto/keembay/ocs-aes.c:836:13: warning: Possible null pointer =
dereference: iv32 [nullPointer]
     iowrite32(iv32[3], aes_dev->base_reg + AES_IV_3_OFFSET);
               ^
   drivers/crypto/keembay/ocs-aes.h:93:44: note: Calling function 'ocs_aes_=
op', 8th argument 'NULL' value is 0
        dst_dma_list, src_dma_list, src_size, NULL, 0);
                                              ^
   drivers/crypto/keembay/ocs-aes.c:822:9: note: Assignment 'iv32=3D(u32*)i=
v', assigned value is 0
    iv32 =3D (u32 *)iv;
           ^
   drivers/crypto/keembay/ocs-aes.c:836:13: note: Null pointer dereference
     iowrite32(iv32[3], aes_dev->base_reg + AES_IV_3_OFFSET);
               ^

vim +833 drivers/crypto/keembay/ocs-aes.c

88574332451380f4 Mike Healy 2020-11-26  781  =

88574332451380f4 Mike Healy 2020-11-26  782  /**
88574332451380f4 Mike Healy 2020-11-26  783   * ocs_aes_op() - Perform AES/=
SM4 operation.
88574332451380f4 Mike Healy 2020-11-26  784   * @aes_dev:		The OCS AES devi=
ce to use.
88574332451380f4 Mike Healy 2020-11-26  785   * @mode:		The mode to use (EC=
B, CBC, CTR, or CTS).
88574332451380f4 Mike Healy 2020-11-26  786   * @cipher:		The cipher to use=
 (AES or SM4).
88574332451380f4 Mike Healy 2020-11-26  787   * @instruction:	The instructi=
on to perform (encrypt or decrypt).
88574332451380f4 Mike Healy 2020-11-26  788   * @dst_dma_list:	The OCS DMA =
list mapping output memory.
88574332451380f4 Mike Healy 2020-11-26  789   * @src_dma_list:	The OCS DMA =
list mapping input payload data.
88574332451380f4 Mike Healy 2020-11-26  790   * @src_size:		The amount of d=
ata mapped by @src_dma_list.
88574332451380f4 Mike Healy 2020-11-26  791   * @iv:			The IV vector.
88574332451380f4 Mike Healy 2020-11-26  792   * @iv_size:		The size (in byt=
es) of @iv.
88574332451380f4 Mike Healy 2020-11-26  793   *
88574332451380f4 Mike Healy 2020-11-26  794   * Return: 0 on success, negat=
ive error code otherwise.
88574332451380f4 Mike Healy 2020-11-26  795   */
88574332451380f4 Mike Healy 2020-11-26  796  int ocs_aes_op(struct ocs_aes_=
dev *aes_dev,
88574332451380f4 Mike Healy 2020-11-26  797  	       enum ocs_mode mode,
88574332451380f4 Mike Healy 2020-11-26  798  	       enum ocs_cipher cipher,
88574332451380f4 Mike Healy 2020-11-26  799  	       enum ocs_instruction i=
nstruction,
88574332451380f4 Mike Healy 2020-11-26  800  	       dma_addr_t dst_dma_lis=
t,
88574332451380f4 Mike Healy 2020-11-26  801  	       dma_addr_t src_dma_lis=
t,
88574332451380f4 Mike Healy 2020-11-26  802  	       u32 src_size,
88574332451380f4 Mike Healy 2020-11-26  803  	       u8 *iv,
88574332451380f4 Mike Healy 2020-11-26  804  	       u32 iv_size)
88574332451380f4 Mike Healy 2020-11-26  805  {
88574332451380f4 Mike Healy 2020-11-26  806  	u32 *iv32;
88574332451380f4 Mike Healy 2020-11-26  807  	int rc;
88574332451380f4 Mike Healy 2020-11-26  808  =

88574332451380f4 Mike Healy 2020-11-26  809  	rc =3D ocs_aes_validate_input=
s(src_dma_list, src_size, iv, iv_size, 0, 0,
88574332451380f4 Mike Healy 2020-11-26  810  				     NULL, 0, cipher, mode=
, instruction,
88574332451380f4 Mike Healy 2020-11-26  811  				     dst_dma_list);
88574332451380f4 Mike Healy 2020-11-26  812  	if (rc)
88574332451380f4 Mike Healy 2020-11-26  813  		return rc;
88574332451380f4 Mike Healy 2020-11-26  814  	/*
88574332451380f4 Mike Healy 2020-11-26  815  	 * ocs_aes_validate_inputs() =
is a generic check, now ensure mode is not
88574332451380f4 Mike Healy 2020-11-26  816  	 * GCM or CCM.
88574332451380f4 Mike Healy 2020-11-26  817  	 */
88574332451380f4 Mike Healy 2020-11-26  818  	if (mode =3D=3D OCS_MODE_GCM =
|| mode =3D=3D OCS_MODE_CCM)
88574332451380f4 Mike Healy 2020-11-26  819  		return -EINVAL;
88574332451380f4 Mike Healy 2020-11-26  820  =

88574332451380f4 Mike Healy 2020-11-26  821  	/* Cast IV to u32 array. */
88574332451380f4 Mike Healy 2020-11-26  822  	iv32 =3D (u32 *)iv;
88574332451380f4 Mike Healy 2020-11-26  823  =

88574332451380f4 Mike Healy 2020-11-26  824  	ocs_aes_init(aes_dev, mode, c=
ipher, instruction);
88574332451380f4 Mike Healy 2020-11-26  825  =

88574332451380f4 Mike Healy 2020-11-26  826  	if (mode =3D=3D OCS_MODE_CTS)=
 {
88574332451380f4 Mike Healy 2020-11-26  827  		/* Write the byte length of =
the last data block to engine. */
88574332451380f4 Mike Healy 2020-11-26  828  		ocs_aes_write_last_data_blk_=
len(aes_dev, src_size);
88574332451380f4 Mike Healy 2020-11-26  829  	}
88574332451380f4 Mike Healy 2020-11-26  830  =

88574332451380f4 Mike Healy 2020-11-26  831  	/* ECB is the only mode that =
doesn't use IV. */
88574332451380f4 Mike Healy 2020-11-26  832  	if (mode !=3D OCS_MODE_ECB) {
88574332451380f4 Mike Healy 2020-11-26 @833  		iowrite32(iv32[0], aes_dev->=
base_reg + AES_IV_0_OFFSET);
88574332451380f4 Mike Healy 2020-11-26  834  		iowrite32(iv32[1], aes_dev->=
base_reg + AES_IV_1_OFFSET);
88574332451380f4 Mike Healy 2020-11-26  835  		iowrite32(iv32[2], aes_dev->=
base_reg + AES_IV_2_OFFSET);
88574332451380f4 Mike Healy 2020-11-26  836  		iowrite32(iv32[3], aes_dev->=
base_reg + AES_IV_3_OFFSET);
88574332451380f4 Mike Healy 2020-11-26  837  	}
88574332451380f4 Mike Healy 2020-11-26  838  =

88574332451380f4 Mike Healy 2020-11-26  839  	/* Set AES_ACTIVE.TRIGGER to =
start the operation. */
88574332451380f4 Mike Healy 2020-11-26  840  	aes_a_op_trigger(aes_dev);
88574332451380f4 Mike Healy 2020-11-26  841  =

88574332451380f4 Mike Healy 2020-11-26  842  	/* Configure and activate inp=
ut / output DMA. */
88574332451380f4 Mike Healy 2020-11-26  843  	dma_to_ocs_aes_ll(aes_dev, sr=
c_dma_list);
88574332451380f4 Mike Healy 2020-11-26  844  	dma_from_ocs_aes_ll(aes_dev, =
dst_dma_list);
88574332451380f4 Mike Healy 2020-11-26  845  	aes_a_dma_active_src_dst_ll_e=
n(aes_dev);
88574332451380f4 Mike Healy 2020-11-26  846  =

88574332451380f4 Mike Healy 2020-11-26  847  	if (mode =3D=3D OCS_MODE_CTS)=
 {
88574332451380f4 Mike Healy 2020-11-26  848  		/*
88574332451380f4 Mike Healy 2020-11-26  849  		 * For CTS mode, instruct en=
gine to activate ciphertext
88574332451380f4 Mike Healy 2020-11-26  850  		 * stealing if last block of=
 data is incomplete.
88574332451380f4 Mike Healy 2020-11-26  851  		 */
88574332451380f4 Mike Healy 2020-11-26  852  		aes_a_set_last_gcx(aes_dev);
88574332451380f4 Mike Healy 2020-11-26  853  	} else {
88574332451380f4 Mike Healy 2020-11-26  854  		/* For all other modes, just=
 write the 'termination' bit. */
88574332451380f4 Mike Healy 2020-11-26  855  		aes_a_op_termination(aes_dev=
);
88574332451380f4 Mike Healy 2020-11-26  856  	}
88574332451380f4 Mike Healy 2020-11-26  857  =

88574332451380f4 Mike Healy 2020-11-26  858  	/* Wait for engine to complet=
e processing. */
88574332451380f4 Mike Healy 2020-11-26  859  	rc =3D ocs_aes_irq_enable_and=
_wait(aes_dev, AES_COMPLETE_INT);
88574332451380f4 Mike Healy 2020-11-26  860  	if (rc)
88574332451380f4 Mike Healy 2020-11-26  861  		return rc;
88574332451380f4 Mike Healy 2020-11-26  862  =

88574332451380f4 Mike Healy 2020-11-26  863  	if (mode =3D=3D OCS_MODE_CTR)=
 {
88574332451380f4 Mike Healy 2020-11-26  864  		/* Read back IV for streamin=
g mode */
88574332451380f4 Mike Healy 2020-11-26  865  		iv32[0] =3D ioread32(aes_dev=
->base_reg + AES_IV_0_OFFSET);
88574332451380f4 Mike Healy 2020-11-26  866  		iv32[1] =3D ioread32(aes_dev=
->base_reg + AES_IV_1_OFFSET);
88574332451380f4 Mike Healy 2020-11-26  867  		iv32[2] =3D ioread32(aes_dev=
->base_reg + AES_IV_2_OFFSET);
88574332451380f4 Mike Healy 2020-11-26  868  		iv32[3] =3D ioread32(aes_dev=
->base_reg + AES_IV_3_OFFSET);
88574332451380f4 Mike Healy 2020-11-26  869  	}
88574332451380f4 Mike Healy 2020-11-26  870  =

88574332451380f4 Mike Healy 2020-11-26  871  	return 0;
88574332451380f4 Mike Healy 2020-11-26  872  }
88574332451380f4 Mike Healy 2020-11-26  873  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4743678005210777097==--

