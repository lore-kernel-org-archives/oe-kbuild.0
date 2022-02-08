Content-Type: multipart/mixed; boundary="===============0273918997421022188=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ardb:hctr2 3/8] crypto/hctr2.c:151 hctr2_hash_message() error: uninitialized symbol 'err'.
Date: Wed, 09 Feb 2022 07:10:42 +0800
Message-ID: <202202090709.CprWuydG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0273918997421022188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nathan Huckleberry <nhuck@google.com>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git hctr2
head:   5bb01649223080b7cde5740f441eb5e758ec357f
commit: 09533ad0ea8fa56420aa6e866b11c0685e862bd1 [3/8] crypto: hctr2 - Add =
HCTR2 support
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m031-20220208 (https://download.01.org/0day-ci/=
archive/20220209/202202090709.CprWuydG-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
crypto/hctr2.c:151 hctr2_hash_message() error: uninitialized symbol 'err'.

vim +/err +151 crypto/hctr2.c

09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  130  =

09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  131  static int hctr2_hash_me=
ssage(struct skcipher_request *req,
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  132  			      struct scatterl=
ist *sgl,
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  133  			      u8 digest[POLYV=
AL_DIGEST_SIZE])
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  134  {
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  135  	u8 padding[BLOCKCIPHER_=
BLOCK_SIZE];
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  136  	struct hctr2_request_ct=
x *rctx =3D skcipher_request_ctx(req);
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  137  	struct shash_desc *hash=
_desc =3D &rctx->u.hash_desc;
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  138  	const unsigned int bulk=
_len =3D req->cryptlen - BLOCKCIPHER_BLOCK_SIZE;
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  139  	struct sg_mapping_iter =
miter;
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  140  	unsigned int remainder =
=3D bulk_len % BLOCKCIPHER_BLOCK_SIZE;
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  141  	int err;
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  142  =

09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  143  	sg_miter_start(&miter, =
sgl, sg_nents(sgl),
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  144  		       SG_MITER_FROM_S=
G | SG_MITER_ATOMIC);
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  145  	while (sg_miter_next(&m=
iter)) {
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  146  		err =3D crypto_shash_u=
pdate(hash_desc, miter.addr, miter.length);
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  147  		if (err)
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  148  			break;
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  149  	}
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  150  	sg_miter_stop(&miter);
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24 @151  	if (err)
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  152  		return err;
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  153  =

09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  154  	if (remainder) {
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  155  		memset(padding, 0, BLO=
CKCIPHER_BLOCK_SIZE);
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  156  		padding[0] =3D 0x01;
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  157  		err =3D crypto_shash_u=
pdate(hash_desc, padding, BLOCKCIPHER_BLOCK_SIZE - remainder);
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  158  		if (err)
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  159  			return err;
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  160  	}
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  161  	return crypto_shash_fin=
al(hash_desc, digest);
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  162  }
09533ad0ea8fa5 Nathan Huckleberry 2022-01-24  163  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0273918997421022188==--

