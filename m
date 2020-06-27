Content-Type: multipart/mixed; boundary="===============4970340070410480053=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/marvell/cesa/hash.c:192:77: sparse: expected void
Date: Sun, 28 Jun 2020 05:56:04 +0800
Message-ID: <202006280558.8aPCwErk%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4970340070410480053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: SrujanaChalla <schalla@marvell.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

Hi SrujanaChalla,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4e99b32169e84b4ece5a1d74eb0b7e4ef07866b3
commit: 655ff1a1a727f9b83df317c4ad3b2f4a48f6206c crypto: marvell - create c=
ommon Kconfig and Makefile for Marvell
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-s031-20200628 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-dirty
        git checkout 655ff1a1a727f9b83df317c4ad3b2f4a48f6206c
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Darm64 CF=3D'-fdiagnostic-prefix -D__CHECK_E=
NDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/crypto/marvell/cesa/hash.c:192:77: sparse: sparse: incorrect typ=
e in argument 3 (different address spaces) @@     expected void *buf @@    =
 got void [noderef] <asn:2> * @@
>> drivers/crypto/marvell/cesa/hash.c:192:77: sparse:     expected void *buf
   drivers/crypto/marvell/cesa/hash.c:192:77: sparse:     got void [noderef=
] <asn:2> *
   drivers/crypto/marvell/cesa/hash.c:226:68: sparse: sparse: incorrect typ=
e in argument 2 (different address spaces) @@     expected unsigned char [u=
sertype] *buf @@     got void [noderef] <asn:2> * @@
>> drivers/crypto/marvell/cesa/hash.c:226:68: sparse:     expected unsigned=
 char [usertype] *buf
   drivers/crypto/marvell/cesa/hash.c:226:68: sparse:     got void [noderef=
] <asn:2> *
>> drivers/crypto/marvell/cesa/hash.c:343:22: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected restricted __le32 [u=
sertype] *data @@     got unsigned int * @@
>> drivers/crypto/marvell/cesa/hash.c:343:22: sparse:     expected restrict=
ed __le32 [usertype] *data
>> drivers/crypto/marvell/cesa/hash.c:343:22: sparse:     got unsigned int *
>> drivers/crypto/marvell/cesa/hash.c:345:42: sparse: sparse: cast from res=
tricted __le32
>> drivers/crypto/marvell/cesa/hash.c:345:40: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected unsigned int @@     =
got restricted __le32 [usertype] @@
>> drivers/crypto/marvell/cesa/hash.c:345:40: sparse:     expected unsigned=
 int
>> drivers/crypto/marvell/cesa/hash.c:345:40: sparse:     got restricted __=
le32 [usertype]
>> drivers/crypto/marvell/cesa/hash.c:1265:30: sparse: sparse: cast to rest=
ricted __be32
>> drivers/crypto/marvell/cesa/hash.c:1265:30: sparse: sparse: cast to rest=
ricted __be32
>> drivers/crypto/marvell/cesa/hash.c:1265:30: sparse: sparse: cast to rest=
ricted __be32
>> drivers/crypto/marvell/cesa/hash.c:1265:30: sparse: sparse: cast to rest=
ricted __be32
>> drivers/crypto/marvell/cesa/hash.c:1265:30: sparse: sparse: cast to rest=
ricted __be32
>> drivers/crypto/marvell/cesa/hash.c:1265:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1268:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1268:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1268:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1268:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1268:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1268:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1335:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1335:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1335:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1335:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1335:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1335:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1338:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1338:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1338:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1338:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1338:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1338:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1392:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1392:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1392:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1392:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1392:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1392:30: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1395:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1395:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1395:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1395:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1395:34: sparse: sparse: cast to rest=
ricted __be32
   drivers/crypto/marvell/cesa/hash.c:1395:34: sparse: sparse: cast to rest=
ricted __be32
--
   drivers/crypto/marvell/cesa/cesa.c:384:30: sparse: sparse: incorrect typ=
e in assignment (different address spaces) @@     expected void [noderef] <=
asn:2> *sram @@     got void * @@
   drivers/crypto/marvell/cesa/cesa.c:384:30: sparse:     expected void [no=
deref] <asn:2> *sram
>> drivers/crypto/marvell/cesa/cesa.c:384:30: sparse:     got void *
--
   drivers/crypto/marvell/cesa/cipher.c:93:47: sparse: sparse: incorrect ty=
pe in argument 3 (different address spaces) @@     expected void *buf @@   =
  got void [noderef] <asn:2> * @@
>> drivers/crypto/marvell/cesa/cipher.c:93:47: sparse:     expected void *b=
uf
   drivers/crypto/marvell/cesa/cipher.c:93:47: sparse:     got void [nodere=
f] <asn:2> *
   drivers/crypto/marvell/cesa/cipher.c:123:49: sparse: sparse: incorrect t=
ype in argument 3 (different address spaces) @@     expected void const *bu=
f @@     got void [noderef] <asn:2> * @@
>> drivers/crypto/marvell/cesa/cipher.c:123:49: sparse:     expected void c=
onst *buf
   drivers/crypto/marvell/cesa/cipher.c:123:49: sparse:     got void [noder=
ef] <asn:2> *
>> drivers/crypto/marvell/cesa/cipher.c:265:41: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int @@   =
  got restricted __le32 [usertype] @@
>> drivers/crypto/marvell/cesa/cipher.c:265:41: sparse:     expected unsign=
ed int
>> drivers/crypto/marvell/cesa/cipher.c:265:41: sparse:     got restricted =
__le32 [usertype]
   drivers/crypto/marvell/cesa/cipher.c:698:43: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int @@   =
  got restricted __le32 [usertype] @@
   drivers/crypto/marvell/cesa/cipher.c:698:43: sparse:     expected unsign=
ed int
   drivers/crypto/marvell/cesa/cipher.c:698:43: sparse:     got restricted =
__le32 [usertype]
--
>> drivers/crypto/marvell/cesa/tdma.c:86:37: sparse: sparse: restricted __l=
e32 degrades to integer
   drivers/crypto/marvell/cesa/tdma.c:89:37: sparse: sparse: restricted __l=
e32 degrades to integer
>> drivers/crypto/marvell/cesa/tdma.c:117:40: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected restricted __le32 [u=
sertype] next_dma @@     got unsigned long long [usertype] cur_dma @@
>> drivers/crypto/marvell/cesa/tdma.c:117:40: sparse:     expected restrict=
ed __le32 [usertype] next_dma
>> drivers/crypto/marvell/cesa/tdma.c:117:40: sparse:     got unsigned long=
 long [usertype] cur_dma
>> drivers/crypto/marvell/cesa/tdma.c:240:19: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected restricted __le32 [u=
sertype] src @@     got unsigned long long [usertype] src @@
>> drivers/crypto/marvell/cesa/tdma.c:240:19: sparse:     expected restrict=
ed __le32 [usertype] src
>> drivers/crypto/marvell/cesa/tdma.c:240:19: sparse:     got unsigned long=
 long [usertype] src
   drivers/crypto/marvell/cesa/tdma.c:292:19: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected restricted __le32 [u=
sertype] src @@     got unsigned long long [usertype] src @@
   drivers/crypto/marvell/cesa/tdma.c:292:19: sparse:     expected restrict=
ed __le32 [usertype] src
   drivers/crypto/marvell/cesa/tdma.c:292:19: sparse:     got unsigned long=
 long [usertype] src
>> drivers/crypto/marvell/cesa/tdma.c:293:19: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected restricted __le32 [u=
sertype] dst @@     got unsigned long long [usertype] dst @@
>> drivers/crypto/marvell/cesa/tdma.c:293:19: sparse:     expected restrict=
ed __le32 [usertype] dst
>> drivers/crypto/marvell/cesa/tdma.c:293:19: sparse:     got unsigned long=
 long [usertype] dst

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D655ff1a1a727f9b83df317c4ad3b2f4a48f6206c
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 655ff1a1a727f9b83df317c4ad3b2f4a48f6206c
vim +192 drivers/crypto/marvell/cesa/hash.c

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  154  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  155  static void mv_cesa_ahash_std_step(struct ahash_request *req)
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  156  {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  157  	struct mv_cesa_ahash_req *creq =3D ahash_request_ctx(req);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  158  	struct mv_cesa_ahash_std_req *sreq =3D &creq->req.std;
53da740fed302f drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  159  	struct mv_cesa_engine *engine =3D creq->base.engine;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  160  	struct mv_cesa_op_ctx *op;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  161  	unsigned int new_cache_ptr =3D 0;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  162  	u32 frag_mode;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  163  	size_t  len;
2786cee8e50bb4 drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  164  	unsigned int digsize;
2786cee8e50bb4 drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  165  	int i;
2786cee8e50bb4 drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  166  =

2786cee8e50bb4 drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  167  	mv_cesa_adjust_op(engine, &creq->op_tmpl);
2786cee8e50bb4 drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  168  	memcpy_toio(engine->sram, &creq->op_tmpl, sizeof(creq->op_tmpl));
2786cee8e50bb4 drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  169  =

9e5f7a149e00d2 drivers/crypto/marvell/hash.c      Romain Perier   2016-12-0=
5  170  	if (!sreq->offset) {
2786cee8e50bb4 drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  171  		digsize =3D crypto_ahash_digestsize(crypto_ahash_reqtfm(req));
2786cee8e50bb4 drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  172  		for (i =3D 0; i < digsize / 4; i++)
655ff1a1a727f9 drivers/crypto/marvell/cesa/hash.c SrujanaChalla   2020-03-1=
3  173  			writel_relaxed(creq->state[i],
655ff1a1a727f9 drivers/crypto/marvell/cesa/hash.c SrujanaChalla   2020-03-1=
3  174  				       engine->regs + CESA_IVDIG(i));
9e5f7a149e00d2 drivers/crypto/marvell/hash.c      Romain Perier   2016-12-0=
5  175  	}
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  176  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  177  	if (creq->cache_ptr)
0f3304dc18b131 drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  178  		memcpy_toio(engine->sram + CESA_SA_DATA_SRAM_OFFSET,
0f3304dc18b131 drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  179  			    creq->cache, creq->cache_ptr);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  180  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  181  	len =3D min_t(size_t, req->nbytes + creq->cache_ptr - sreq->offset,
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  182  		    CESA_SA_SRAM_PAYLOAD_SIZE);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  183  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  184  	if (!creq->last_req) {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  185  		new_cache_ptr =3D len & CESA_HASH_BLOCK_SIZE_MSK;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  186  		len &=3D ~CESA_HASH_BLOCK_SIZE_MSK;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  187  	}
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  188  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  189  	if (len - creq->cache_ptr)
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  190  		sreq->offset +=3D sg_pcopy_to_buffer(req->src, creq->src_nents,
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  191  						   engine->sram +
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8 @192  						   CESA_SA_DATA_SRAM_OFFSET +
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  193  						   creq->cache_ptr,
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  194  						   len - creq->cache_ptr,
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  195  						   sreq->offset);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  196  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  197  	op =3D &creq->op_tmpl;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  198  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  199  	frag_mode =3D mv_cesa_get_op_cfg(op) & CESA_SA_DESC_CFG_FRAG_MSK;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  200  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  201  	if (creq->last_req && sreq->offset =3D=3D req->nbytes &&
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  202  	    creq->len <=3D CESA_SA_DESC_MAC_SRC_TOTAL_LEN_MAX) {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  203  		if (frag_mode =3D=3D CESA_SA_DESC_CFG_FIRST_FRAG)
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  204  			frag_mode =3D CESA_SA_DESC_CFG_NOT_FRAG;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  205  		else if (frag_mode =3D=3D CESA_SA_DESC_CFG_MID_FRAG)
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  206  			frag_mode =3D CESA_SA_DESC_CFG_LAST_FRAG;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  207  	}
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  208  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  209  	if (frag_mode =3D=3D CESA_SA_DESC_CFG_NOT_FRAG ||
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  210  	    frag_mode =3D=3D CESA_SA_DESC_CFG_LAST_FRAG) {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  211  		if (len &&
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  212  		    creq->len <=3D CESA_SA_DESC_MAC_SRC_TOTAL_LEN_MAX) {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  213  			mv_cesa_set_mac_op_total_len(op, creq->len);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  214  		} else {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  215  			int trailerlen =3D mv_cesa_ahash_pad_len(creq) + 8;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  216  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  217  			if (len + trailerlen > CESA_SA_SRAM_PAYLOAD_SIZE) {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  218  				len &=3D CESA_HASH_BLOCK_SIZE_MSK;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  219  				new_cache_ptr =3D 64 - trailerlen;
0f3304dc18b131 drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  220  				memcpy_fromio(creq->cache,
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  221  					      engine->sram +
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  222  					      CESA_SA_DATA_SRAM_OFFSET + len,
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  223  					      new_cache_ptr);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  224  			} else {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  225  				len +=3D mv_cesa_ahash_pad_req(creq,
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8 @226  						engine->sram + len +
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  227  						CESA_SA_DATA_SRAM_OFFSET);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  228  			}
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  229  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  230  			if (frag_mode =3D=3D CESA_SA_DESC_CFG_LAST_FRAG)
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  231  				frag_mode =3D CESA_SA_DESC_CFG_MID_FRAG;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  232  			else
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  233  				frag_mode =3D CESA_SA_DESC_CFG_FIRST_FRAG;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  234  		}
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  235  	}
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  236  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  237  	mv_cesa_set_mac_op_frag_len(op, len);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  238  	mv_cesa_update_op_cfg(op, frag_mode, CESA_SA_DESC_CFG_FRAG_MSK);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  239  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  240  	/* FIXME: only update enc_len field */
0f3304dc18b131 drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  241  	memcpy_toio(engine->sram, op, sizeof(*op));
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  242  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  243  	if (frag_mode =3D=3D CESA_SA_DESC_CFG_FIRST_FRAG)
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  244  		mv_cesa_update_op_cfg(op, CESA_SA_DESC_CFG_MID_FRAG,
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  245  				      CESA_SA_DESC_CFG_FRAG_MSK);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  246  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  247  	creq->cache_ptr =3D new_cache_ptr;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  248  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  249  	mv_cesa_set_int_mask(engine, CESA_SA_INT_ACCEL0_DONE);
b150856152cc44 drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  250  	writel_relaxed(CESA_SA_CFG_PARA_DIS, engine->regs + CESA_SA_CFG);
655ff1a1a727f9 drivers/crypto/marvell/cesa/hash.c SrujanaChalla   2020-03-1=
3  251  	WARN_ON(readl(engine->regs + CESA_SA_CMD) &
f62830886f6b8c drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  252  		CESA_SA_CMD_EN_CESA_SA_ACCL0);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  253  	writel(CESA_SA_CMD_EN_CESA_SA_ACCL0, engine->regs + CESA_SA_CMD);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  254  }
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  255  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  256  static int mv_cesa_ahash_std_process(struct ahash_request *req, u32=
 status)
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  257  {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  258  	struct mv_cesa_ahash_req *creq =3D ahash_request_ctx(req);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  259  	struct mv_cesa_ahash_std_req *sreq =3D &creq->req.std;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  260  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  261  	if (sreq->offset < (req->nbytes - creq->cache_ptr))
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  262  		return -EINPROGRESS;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  263  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  264  	return 0;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  265  }
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  266  =

db509a45339fd7 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  267  static inline void mv_cesa_ahash_dma_prepare(struct ahash_request *=
req)
db509a45339fd7 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  268  {
db509a45339fd7 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  269  	struct mv_cesa_ahash_req *creq =3D ahash_request_ctx(req);
53da740fed302f drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  270  	struct mv_cesa_req *basereq =3D &creq->base;
db509a45339fd7 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  271  =

53da740fed302f drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  272  	mv_cesa_dma_prepare(basereq, basereq->engine);
db509a45339fd7 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  273  }
db509a45339fd7 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  274  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  275  static void mv_cesa_ahash_std_prepare(struct ahash_request *req)
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  276  {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  277  	struct mv_cesa_ahash_req *creq =3D ahash_request_ctx(req);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  278  	struct mv_cesa_ahash_std_req *sreq =3D &creq->req.std;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  279  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  280  	sreq->offset =3D 0;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  281  }
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  282  =

8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  283  static void mv_cesa_ahash_dma_step(struct ahash_request *req)
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  284  {
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  285  	struct mv_cesa_ahash_req *creq =3D ahash_request_ctx(req);
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  286  	struct mv_cesa_req *base =3D &creq->base;
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  287  =

8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  288  	/* We must explicitly set the digest state. */
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  289  	if (base->chain.first->flags & CESA_TDMA_SET_STATE) {
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  290  		struct mv_cesa_engine *engine =3D base->engine;
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  291  		int i;
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  292  =

8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  293  		/* Set the hash state in the IVDIG regs. */
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  294  		for (i =3D 0; i < ARRAY_SIZE(creq->state); i++)
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  295  			writel_relaxed(creq->state[i], engine->regs +
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  296  				       CESA_IVDIG(i));
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  297  	}
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  298  =

8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  299  	mv_cesa_dma_step(base);
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  300  }
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  301  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  302  static void mv_cesa_ahash_step(struct crypto_async_request *req)
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  303  {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  304  	struct ahash_request *ahashreq =3D ahash_request_cast(req);
db509a45339fd7 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  305  	struct mv_cesa_ahash_req *creq =3D ahash_request_ctx(ahashreq);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  306  =

53da740fed302f drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  307  	if (mv_cesa_req_get_type(&creq->base) =3D=3D CESA_DMA_REQ)
8759fec4af222f drivers/crypto/marvell/hash.c      Romain Perier   2016-12-1=
4  308  		mv_cesa_ahash_dma_step(ahashreq);
db509a45339fd7 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  309  	else
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  310  		mv_cesa_ahash_std_step(ahashreq);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  311  }
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  312  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  313  static int mv_cesa_ahash_process(struct crypto_async_request *req, =
u32 status)
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  314  {
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  315  	struct ahash_request *ahashreq =3D ahash_request_cast(req);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  316  	struct mv_cesa_ahash_req *creq =3D ahash_request_ctx(ahashreq);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  317  =

53da740fed302f drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  318  	if (mv_cesa_req_get_type(&creq->base) =3D=3D CESA_DMA_REQ)
1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  319  		return mv_cesa_dma_process(&creq->base, status);
db509a45339fd7 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  320  =

1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  321  	return mv_cesa_ahash_std_process(ahashreq, status);
1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  322  }
1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  323  =

1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  324  static void mv_cesa_ahash_complete(struct crypto_async_request *req)
1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  325  {
1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  326  	struct ahash_request *ahashreq =3D ahash_request_cast(req);
1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  327  	struct mv_cesa_ahash_req *creq =3D ahash_request_ctx(ahashreq);
1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  328  	struct mv_cesa_engine *engine =3D creq->base.engine;
1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  329  	unsigned int digsize;
1bf6682cb31dff drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  330  	int i;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  331  =

f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  332  	digsize =3D crypto_ahash_digestsize(crypto_ahash_reqtfm(ahashreq));
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  333  =

f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  334  	if (mv_cesa_req_get_type(&creq->base) =3D=3D CESA_DMA_REQ &&
655ff1a1a727f9 drivers/crypto/marvell/cesa/hash.c SrujanaChalla   2020-03-1=
3  335  	    (creq->base.chain.last->flags & CESA_TDMA_TYPE_MSK) =3D=3D
655ff1a1a727f9 drivers/crypto/marvell/cesa/hash.c SrujanaChalla   2020-03-1=
3  336  	     CESA_TDMA_RESULT) {
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  337  		__le32 *data =3D NULL;
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  338  =

f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  339  		/*
655ff1a1a727f9 drivers/crypto/marvell/cesa/hash.c SrujanaChalla   2020-03-1=
3  340  		 * Result is already in the correct endianness when the SA is
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  341  		 * used
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  342  		 */
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5 @343  		data =3D creq->base.chain.last->op->ctx.hash.hash;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  344  		for (i =3D 0; i < digsize / 4; i++)
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5 @345  			creq->state[i] =3D cpu_to_le32(data[i]);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  346  =

f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  347  		memcpy(ahashreq->result, data, digsize);
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  348  	} else {
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  349  		for (i =3D 0; i < digsize / 4; i++)
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  350  			creq->state[i] =3D readl_relaxed(engine->regs +
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  351  						       CESA_IVDIG(i));
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  352  		if (creq->last_req) {
7aeef693d18d35 drivers/crypto/marvell/hash.c      Arnaud Ebalard  2015-06-1=
8  353  			/*
4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  354  			 * Hardware's MD5 digest is in little endian format, but
4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  355  			 * SHA in big endian format
7aeef693d18d35 drivers/crypto/marvell/hash.c      Arnaud Ebalard  2015-06-1=
8  356  			 */
a9eb678f8addc1 drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  357  			if (creq->algo_le) {
4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  358  				__le32 *result =3D (void *)ahashreq->result;
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  359  =

4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  360  				for (i =3D 0; i < digsize / 4; i++)
4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  361  					result[i] =3D cpu_to_le32(creq->state[i]);
4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  362  			} else {
4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  363  				__be32 *result =3D (void *)ahashreq->result;
4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  364  =

4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  365  				for (i =3D 0; i < digsize / 4; i++)
4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  366  					result[i] =3D cpu_to_be32(creq->state[i]);
4c2b130c8ae79a drivers/crypto/marvell/hash.c      Russell King    2015-10-1=
8  367  			}
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  368  		}
f34dad17216429 drivers/crypto/marvell/hash.c      Romain Perier   2016-10-0=
5  369  	}
bf8f91e711926c drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  370  =

bf8f91e711926c drivers/crypto/marvell/hash.c      Romain Perier   2016-06-2=
1  371  	atomic_sub(ahashreq->nbytes, &engine->load);
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  372  }
f63601fd616ab3 drivers/crypto/marvell/hash.c      Boris Brezillon 2015-06-1=
8  373  =


:::::: The code at line 192 was first introduced by commit
:::::: f63601fd616ab370774fa00ea10bcaaa9e48e84c crypto: marvell/cesa - add =
a new driver for Marvell's CESA

:::::: TO: Boris BREZILLON <boris.brezillon@free-electrons.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4970340070410480053==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
olgSAgA=
--===============4970340070410480053==--

