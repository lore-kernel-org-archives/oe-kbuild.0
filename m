Content-Type: multipart/mixed; boundary="===============1614863844090852201=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/marvell/cesa/tdma.c:117:40: sparse: sparse: incorrect type in assignment (different base types)
Date: Sun, 14 Jun 2020 17:16:47 +0800
Message-ID: <202006141741.m40odVb6%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1614863844090852201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: SrujanaChalla <schalla@marvell.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   96144c58abe7ff767e754b5b80995f7b8846d49b
commit: 655ff1a1a727f9b83df317c4ad3b2f4a48f6206c crypto: marvell - create c=
ommon Kconfig and Makefile for Marvell
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-s031-20200614 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-250-g42323db3-dirty
        git checkout 655ff1a1a727f9b83df317c4ad3b2f4a48f6206c
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Darm64 CF=3D'-fdiagnostic-prefix -D__CHECK_E=
NDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/crypto/marvell/cesa/tdma.c:86:37: sparse: sparse: restricted __l=
e32 degrades to integer
   drivers/crypto/marvell/cesa/tdma.c:89:37: sparse: sparse: restricted __l=
e32 degrades to integer
>> drivers/crypto/marvell/cesa/tdma.c:117:40: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected restricted __le32 [u=
sertype] next_dma @@     got unsigned long long [usertype] cur_dma @@
   drivers/crypto/marvell/cesa/tdma.c:117:40: sparse:     expected restrict=
ed __le32 [usertype] next_dma
>> drivers/crypto/marvell/cesa/tdma.c:117:40: sparse:     got unsigned long=
 long [usertype] cur_dma
>> drivers/crypto/marvell/cesa/tdma.c:240:19: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected restricted __le32 [u=
sertype] src @@     got unsigned long long [usertype] src @@
   drivers/crypto/marvell/cesa/tdma.c:240:19: sparse:     expected restrict=
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
   drivers/crypto/marvell/cesa/tdma.c:293:19: sparse:     expected restrict=
ed __le32 [usertype] dst
>> drivers/crypto/marvell/cesa/tdma.c:293:19: sparse:     got unsigned long=
 long [usertype] dst

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D655ff1a1a727f9b83df317c4ad3b2f4a48f6206c
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 655ff1a1a727f9b83df317c4ad3b2f4a48f6206c
vim +117 drivers/crypto/marvell/cesa/tdma.c

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18   95  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21   96  void mv_cesa_tdma_chain(struct mv_cesa_engine *engine,
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21   97  			struct mv_cesa_req *dreq)
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21   98  {
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21   99  	if (engine->chain.first =3D=3D NULL && engine->chain.last =3D=3D =
NULL) {
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  100  		engine->chain.first =3D dreq->chain.first;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  101  		engine->chain.last  =3D dreq->chain.last;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  102  	} else {
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  103  		struct mv_cesa_tdma_desc *last;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  104  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  105  		last =3D engine->chain.last;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  106  		last->next =3D dreq->chain.first;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  107  		engine->chain.last =3D dreq->chain.last;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  108  =

8759fec4af222f drivers/crypto/marvell/tdma.c      Romain Perier    2016-12-=
14  109  		/*
8759fec4af222f drivers/crypto/marvell/tdma.c      Romain Perier    2016-12-=
14  110  		 * Break the DMA chain if the CESA_TDMA_BREAK_CHAIN is set on
8759fec4af222f drivers/crypto/marvell/tdma.c      Romain Perier    2016-12-=
14  111  		 * the last element of the current chain, or if the request
8759fec4af222f drivers/crypto/marvell/tdma.c      Romain Perier    2016-12-=
14  112  		 * being queued needs the IV regs to be set before lauching
8759fec4af222f drivers/crypto/marvell/tdma.c      Romain Perier    2016-12-=
14  113  		 * the request.
8759fec4af222f drivers/crypto/marvell/tdma.c      Romain Perier    2016-12-=
14  114  		 */
8759fec4af222f drivers/crypto/marvell/tdma.c      Romain Perier    2016-12-=
14  115  		if (!(last->flags & CESA_TDMA_BREAK_CHAIN) &&
8759fec4af222f drivers/crypto/marvell/tdma.c      Romain Perier    2016-12-=
14  116  		    !(dreq->chain.first->flags & CESA_TDMA_SET_STATE))
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21 @117  			last->next_dma =3D dreq->chain.first->cur_dma;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  118  	}
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  119  }
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  120  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  121  int mv_cesa_tdma_process(struct mv_cesa_engine *engine, u32 status)
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  122  {
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  123  	struct crypto_async_request *req =3D NULL;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  124  	struct mv_cesa_tdma_desc *tdma =3D NULL, *next =3D NULL;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  125  	dma_addr_t tdma_cur;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  126  	int res =3D 0;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  127  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  128  	tdma_cur =3D readl(engine->regs + CESA_TDMA_CUR);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  129  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  130  	for (tdma =3D engine->chain.first; tdma; tdma =3D next) {
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  131  		spin_lock_bh(&engine->lock);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  132  		next =3D tdma->next;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  133  		spin_unlock_bh(&engine->lock);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  134  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  135  		if (tdma->flags & CESA_TDMA_END_OF_REQ) {
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  136  			struct crypto_async_request *backlog =3D NULL;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  137  			struct mv_cesa_ctx *ctx;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  138  			u32 current_status;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  139  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  140  			spin_lock_bh(&engine->lock);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  141  			/*
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  142  			 * if req is NULL, this means we're processing the
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  143  			 * request in engine->req.
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  144  			 */
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  145  			if (!req)
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  146  				req =3D engine->req;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  147  			else
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  148  				req =3D mv_cesa_dequeue_req_locked(engine,
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  149  								 &backlog);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  150  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  151  			/* Re-chaining to the next request */
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  152  			engine->chain.first =3D tdma->next;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  153  			tdma->next =3D NULL;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  154  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  155  			/* If this is the last request, clear the chain */
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  156  			if (engine->chain.first =3D=3D NULL)
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  157  				engine->chain.last  =3D NULL;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  158  			spin_unlock_bh(&engine->lock);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  159  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  160  			ctx =3D crypto_tfm_ctx(req->tfm);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  161  			current_status =3D (tdma->cur_dma =3D=3D tdma_cur) ?
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  162  					  status : CESA_SA_INT_ACC0_IDMA_DONE;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  163  			res =3D ctx->ops->process(req, current_status);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  164  			ctx->ops->complete(req);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  165  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  166  			if (res =3D=3D 0)
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  167  				mv_cesa_engine_enqueue_complete_request(engine,
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  168  									req);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  169  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  170  			if (backlog)
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  171  				backlog->complete(backlog, -EINPROGRESS);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  172  		}
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  173  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  174  		if (res || tdma->cur_dma =3D=3D tdma_cur)
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  175  			break;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  176  	}
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  177  =

655ff1a1a727f9 drivers/crypto/marvell/cesa/tdma.c SrujanaChalla    2020-03-=
13  178  	/*
655ff1a1a727f9 drivers/crypto/marvell/cesa/tdma.c SrujanaChalla    2020-03-=
13  179  	 * Save the last request in error to engine->req, so that the core
655ff1a1a727f9 drivers/crypto/marvell/cesa/tdma.c SrujanaChalla    2020-03-=
13  180  	 * knows which request was fautly
655ff1a1a727f9 drivers/crypto/marvell/cesa/tdma.c SrujanaChalla    2020-03-=
13  181  	 */
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  182  	if (res) {
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  183  		spin_lock_bh(&engine->lock);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  184  		engine->req =3D req;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  185  		spin_unlock_bh(&engine->lock);
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  186  	}
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  187  =

85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  188  	return res;
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  189  }
85030c5168f1df drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  190  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  191  static struct mv_cesa_tdma_desc *
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  192  mv_cesa_dma_add_desc(struct mv_cesa_tdma_chain *chain, gfp_t flags)
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  193  {
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  194  	struct mv_cesa_tdma_desc *new_tdma =3D NULL;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  195  	dma_addr_t dma_handle;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  196  =

472d640bd0fe5b drivers/crypto/marvell/tdma.c      Julia Lawall     2016-04-=
29  197  	new_tdma =3D dma_pool_zalloc(cesa_dev->dma->tdma_desc_pool, flags,
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  198  				   &dma_handle);
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  199  	if (!new_tdma)
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  200  		return ERR_PTR(-ENOMEM);
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  201  =

5d754137ab905a drivers/crypto/marvell/tdma.c      Russell King     2015-10-=
18  202  	new_tdma->cur_dma =3D dma_handle;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  203  	if (chain->last) {
5d754137ab905a drivers/crypto/marvell/tdma.c      Russell King     2015-10-=
18  204  		chain->last->next_dma =3D cpu_to_le32(dma_handle);
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  205  		chain->last->next =3D new_tdma;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  206  	} else {
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  207  		chain->first =3D new_tdma;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  208  	}
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  209  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  210  	chain->last =3D new_tdma;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  211  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  212  	return new_tdma;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  213  }
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  214  =

0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  215  int mv_cesa_dma_add_result_op(struct mv_cesa_tdma_chain *chain, dm=
a_addr_t src,
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  216  			  u32 size, u32 flags, gfp_t gfp_flags)
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  217  {
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  218  	struct mv_cesa_tdma_desc *tdma, *op_desc;
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  219  =

bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  220  	tdma =3D mv_cesa_dma_add_desc(chain, gfp_flags);
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  221  	if (IS_ERR(tdma))
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  222  		return PTR_ERR(tdma);
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  223  =

0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  224  	/* We re-use an existing op_desc object to retrieve the context
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  225  	 * and result instead of allocating a new one.
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  226  	 * There is at least one object of this type in a CESA crypto
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  227  	 * req, just pick the first one in the chain.
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  228  	 */
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  229  	for (op_desc =3D chain->first; op_desc; op_desc =3D op_desc->next=
) {
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  230  		u32 type =3D op_desc->flags & CESA_TDMA_TYPE_MSK;
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  231  =

0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  232  		if (type =3D=3D CESA_TDMA_OP)
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  233  			break;
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  234  	}
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  235  =

0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  236  	if (!op_desc)
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  237  		return -EIO;
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  238  =

bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  239  	tdma->byte_cnt =3D cpu_to_le32(size | BIT(31));
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21 @240  	tdma->src =3D src;
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  241  	tdma->dst =3D op_desc->src;
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  242  	tdma->op =3D op_desc->op;
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  243  =

bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  244  	flags &=3D (CESA_TDMA_DST_IN_SRAM | CESA_TDMA_SRC_IN_SRAM);
0c99620f0ac13a drivers/crypto/marvell/tdma.c      Romain Perier    2016-10-=
05  245  	tdma->flags =3D flags | CESA_TDMA_RESULT;
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  246  	return 0;
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  247  }
bac8e805a30dc2 drivers/crypto/marvell/tdma.c      Romain Perier    2016-06-=
21  248  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  249  struct mv_cesa_op_ctx *mv_cesa_dma_add_op(struct mv_cesa_tdma_chai=
n *chain,
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  250  					const struct mv_cesa_op_ctx *op_templ,
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  251  					bool skip_ctx,
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  252  					gfp_t flags)
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  253  {
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  254  	struct mv_cesa_tdma_desc *tdma;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  255  	struct mv_cesa_op_ctx *op;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  256  	dma_addr_t dma_handle;
6de59d453ae567 drivers/crypto/marvell/tdma.c      Russell King     2015-10-=
18  257  	unsigned int size;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  258  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  259  	tdma =3D mv_cesa_dma_add_desc(chain, flags);
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  260  	if (IS_ERR(tdma))
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  261  		return ERR_CAST(tdma);
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  262  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  263  	op =3D dma_pool_alloc(cesa_dev->dma->op_pool, flags, &dma_handle);
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  264  	if (!op)
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  265  		return ERR_PTR(-ENOMEM);
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  266  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  267  	*op =3D *op_templ;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  268  =

6de59d453ae567 drivers/crypto/marvell/tdma.c      Russell King     2015-10-=
18  269  	size =3D skip_ctx ? sizeof(op->desc) : sizeof(*op);
6de59d453ae567 drivers/crypto/marvell/tdma.c      Russell King     2015-10-=
18  270  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  271  	tdma =3D chain->last;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  272  	tdma->op =3D op;
6de59d453ae567 drivers/crypto/marvell/tdma.c      Russell King     2015-10-=
18  273  	tdma->byte_cnt =3D cpu_to_le32(size | BIT(31));
ea1f662bde0675 drivers/crypto/marvell/tdma.c      Russell King     2015-10-=
18  274  	tdma->src =3D cpu_to_le32(dma_handle);
36225b9170ea7b drivers/crypto/marvell/tdma.c      Thomas Petazzoni 2016-08-=
09  275  	tdma->dst =3D CESA_SA_CFG_SRAM_OFFSET;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  276  	tdma->flags =3D CESA_TDMA_DST_IN_SRAM | CESA_TDMA_OP;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  277  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  278  	return op;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  279  }
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  280  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  281  int mv_cesa_dma_add_data_transfer(struct mv_cesa_tdma_chain *chain,
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  282  				  dma_addr_t dst, dma_addr_t src, u32 size,
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  283  				  u32 flags, gfp_t gfp_flags)
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  284  {
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  285  	struct mv_cesa_tdma_desc *tdma;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  286  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  287  	tdma =3D mv_cesa_dma_add_desc(chain, gfp_flags);
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  288  	if (IS_ERR(tdma))
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  289  		return PTR_ERR(tdma);
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  290  =

6de59d453ae567 drivers/crypto/marvell/tdma.c      Russell King     2015-10-=
18  291  	tdma->byte_cnt =3D cpu_to_le32(size | BIT(31));
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  292  	tdma->src =3D src;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18 @293  	tdma->dst =3D dst;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  294  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  295  	flags &=3D (CESA_TDMA_DST_IN_SRAM | CESA_TDMA_SRC_IN_SRAM);
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  296  	tdma->flags =3D flags | CESA_TDMA_DATA;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  297  =

db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  298  	return 0;
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  299  }
db509a45339fd7 drivers/crypto/marvell/tdma.c      Boris Brezillon  2015-06-=
18  300  =


:::::: The code at line 117 was first introduced by commit
:::::: 85030c5168f1df03a164d47254cc785331f1dfe2 crypto: marvell - Add suppo=
rt for chaining crypto requests in TDMA mode

:::::: TO: Romain Perier <romain.perier@free-electrons.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1614863844090852201==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1614863844090852201==--

