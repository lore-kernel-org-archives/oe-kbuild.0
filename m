Content-Type: multipart/mixed; boundary="===============5025586009477303218=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/8] crypto: hctr2 - Add HCTR2 support
Date: Wed, 13 Apr 2022 18:49:26 +0800
Message-ID: <202204131823.ySHrYlRJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5025586009477303218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220412172816.917723-4-nhuck@google.com>
References: <20220412172816.917723-4-nhuck@google.com>
TO: Nathan Huckleberry <nhuck@google.com>

Hi Nathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v5.18-rc=
2 next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Huckleberry/c=
rypto-HCTR2-support/20220413-013255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout fd9c72f4c0ff1afb75ed8303fd0dde7cd153143b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> crypto/hctr2.c:226:6: warning: Uninitialized variable: err [uninitvar]
    if (err)
        ^
   crypto/hctr2.c:217:16: note: Assuming condition is false
    for (i =3D 0; i < bulk_len; i +=3D n) {
                  ^
   crypto/hctr2.c:226:6: note: Uninitialized variable: err
    if (err)
        ^

vim +226 crypto/hctr2.c

fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  201  =

fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  202  static int hctr2_hash_me=
ssage(struct skcipher_request *req,
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  203  			      struct scatterl=
ist *sgl,
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  204  			      u8 digest[POLYV=
AL_DIGEST_SIZE])
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  205  {
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  206  	u8 padding[BLOCKCIPHER_=
BLOCK_SIZE];
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  207  	struct hctr2_request_ct=
x *rctx =3D skcipher_request_ctx(req);
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  208  	struct shash_desc *hash=
_desc =3D &rctx->u.hash_desc;
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  209  	const unsigned int bulk=
_len =3D req->cryptlen - BLOCKCIPHER_BLOCK_SIZE;
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  210  	struct sg_mapping_iter =
miter;
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  211  	unsigned int remainder =
=3D bulk_len % BLOCKCIPHER_BLOCK_SIZE;
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  212  	int err, i;
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  213  	int n =3D 0;
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  214  =

fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  215  	sg_miter_start(&miter, =
sgl, sg_nents(sgl),
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  216  		       SG_MITER_FROM_S=
G | SG_MITER_ATOMIC);
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  217  	for (i =3D 0; i < bulk_=
len; i +=3D n) {
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  218  		sg_miter_next(&miter);
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  219  		n =3D min_t(unsigned i=
nt, miter.length, bulk_len - i);
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  220  		err =3D crypto_shash_u=
pdate(hash_desc, miter.addr, n);
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  221  		if (err)
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  222  			break;
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  223  	}
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  224  	sg_miter_stop(&miter);
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  225  =

fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12 @226  	if (err)
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  227  		return err;
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  228  =

fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  229  	if (remainder) {
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  230  		memset(padding, 0, BLO=
CKCIPHER_BLOCK_SIZE);
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  231  		padding[0] =3D 0x01;
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  232  		err =3D crypto_shash_u=
pdate(hash_desc, padding,
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  233  					  BLOCKCIPHER_BLOCK=
_SIZE - remainder);
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  234  		if (err)
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  235  			return err;
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  236  	}
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  237  	return crypto_shash_fin=
al(hash_desc, digest);
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  238  }
fd9c72f4c0ff1a Nathan Huckleberry 2022-04-12  239  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5025586009477303218==--

