Content-Type: multipart/mixed; boundary="===============1802822855822458854=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v8 1/5] bpf: Add "live packet" mode for XDP in BPF_PROG_RUN
Date: Mon, 21 Feb 2022 21:18:10 +0800
Message-ID: <202202212120.trwvhyio-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1802822855822458854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220218175029.330224-2-toke@redhat.com>
References: <20220218175029.330224-2-toke@redhat.com>
TO: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>

Hi "Toke,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Toke-H-iland-J-rgensen/Add=
-support-for-transmitting-packets-using-XDP-in-bpf_prog_run/20220220-174340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-m021-20220221 (https://download.01.org/0day-ci/arch=
ive/20220221/202202212120.trwvhyio-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/bpf/test_run.c:171 xdp_test_run_setup() warn: ignoring unreachable code.

Old smatch warnings:
net/bpf/test_run.c:1316 bpf_prog_test_run_xdp() error: uninitialized symbol=
 'retval'.

vim +171 net/bpf/test_run.c

b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  148  =

b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  149  static int=
 xdp_test_run_setup(struct xdp_test_data *xdp, struct xdp_buff *orig_ctx)
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  150  {
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  151  	struct xd=
p_mem_info mem =3D {};
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  152  	struct pa=
ge_pool *pp;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  153  	int err =
=3D ENOMEM;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  154  	struct pa=
ge_pool_params pp_params =3D {
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  155  		.order =
=3D 0,
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  156  		.flags =
=3D 0,
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  157  		.pool_si=
ze =3D xdp->batch_size,
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  158  		.nid =3D=
 NUMA_NO_NODE,
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  159  		.max_len=
 =3D TEST_XDP_FRAME_SIZE,
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  160  		.init_ca=
llback =3D xdp_test_run_init_page,
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  161  		.init_ar=
g =3D xdp,
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  162  	};
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  163  =

b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  164  	xdp->fram=
es =3D kvmalloc_array(xdp->batch_size, sizeof(void *), GFP_KERNEL);
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  165  	if (!xdp-=
>frames)
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  166  		return -=
ENOMEM;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  167  =

b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  168  	xdp->skbs=
 =3D kvmalloc_array(xdp->batch_size, sizeof(void *), GFP_KERNEL);
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  169  	if (!xdp-=
>skbs) {
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  170  		goto err=
_skbs;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18 @171  		return -=
ENOMEM;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  172  	}
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  173  =

b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  174  	pp =3D pa=
ge_pool_create(&pp_params);
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  175  	if (IS_ER=
R(pp)) {
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  176  		err =3D =
PTR_ERR(pp);
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  177  		goto err=
_pp;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  178  	}
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  179  =

b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  180  	/* will c=
opy 'mem.id' into pp->xdp_mem_id */
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  181  	err =3D x=
dp_reg_mem_model(&mem, MEM_TYPE_PAGE_POOL, pp);
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  182  	if (err)
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  183  		goto err=
_mmodel;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  184  =

b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  185  	xdp->pp =
=3D pp;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  186  =

b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  187  	/* We cre=
ate a 'fake' RXQ referencing the original dev, but with an
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  188  	 * xdp_me=
m_info pointing to our page_pool
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  189  	 */
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  190  	xdp_rxq_i=
nfo_reg(&xdp->rxq, orig_ctx->rxq->dev, 0, 0);
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  191  	xdp->rxq.=
mem.type =3D MEM_TYPE_PAGE_POOL;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  192  	xdp->rxq.=
mem.id =3D pp->xdp_mem_id;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  193  	xdp->dev =
=3D orig_ctx->rxq->dev;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  194  	xdp->orig=
_ctx =3D orig_ctx;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  195  =

b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  196  	return 0;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  197  =

b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  198  err_mmodel:
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  199  	page_pool=
_destroy(pp);
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  200  err_pp:
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  201  	kfree(xdp=
->skbs);
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  202  err_skbs:
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  203  	kfree(xdp=
->frames);
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  204  	return er=
r;
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  205  }
b361b4c1773c38 Toke H=C3=B8iland-J=C3=B8rgensen 2022-02-18  206  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1802822855822458854==--

