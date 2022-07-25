Content-Type: multipart/mixed; boundary="===============0977578890769062044=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 51/59] drivers/cxl/core/region.c:283 alloc_hpa() error: uninitialized symbol 'res'.
Date: Mon, 25 Jul 2022 16:58:24 +0000
Message-ID: <202207241907.SgcX2FVD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0977578890769062044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   b282b26d11c50d48b336fedb5f74b2eca3f7b94c
commit: c27d4f09f61590000d4d3b7ffc30a892e5e9ed9a [51/59] cxl/region: Alloca=
te HPA capacity to regions
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-m041-20220722 (https://download.01.org/0day-ci/arc=
hive/20220724/202207241907.SgcX2FVD-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/core/region.c:283 alloc_hpa() error: uninitialized symbol 'res'.

Old smatch warnings:
drivers/cxl/core/region.c:552 create_pmem_region_store() warn: unsigned 'rc=
' is never less than zero.

vim +/res +283 drivers/cxl/core/region.c

c27d4f09f61590 Dan Williams 2022-04-25  272  =

c27d4f09f61590 Dan Williams 2022-04-25  273  static int alloc_hpa(struct cx=
l_region *cxlr, resource_size_t size)
c27d4f09f61590 Dan Williams 2022-04-25  274  {
c27d4f09f61590 Dan Williams 2022-04-25  275  	struct cxl_root_decoder *cxlr=
d =3D to_cxl_root_decoder(cxlr->dev.parent);
c27d4f09f61590 Dan Williams 2022-04-25  276  	struct cxl_region_params *p =
=3D &cxlr->params;
c27d4f09f61590 Dan Williams 2022-04-25  277  	struct resource *res;
c27d4f09f61590 Dan Williams 2022-04-25  278  	u32 remainder =3D 0;
c27d4f09f61590 Dan Williams 2022-04-25  279  =

c27d4f09f61590 Dan Williams 2022-04-25  280  	lockdep_assert_held_write(&cx=
l_region_rwsem);
c27d4f09f61590 Dan Williams 2022-04-25  281  =

c27d4f09f61590 Dan Williams 2022-04-25  282  	/* Nothing to do... */
c27d4f09f61590 Dan Williams 2022-04-25 @283  	if (p->res && resource_size(r=
es) =3D=3D size)
c27d4f09f61590 Dan Williams 2022-04-25  284  		return 0;
c27d4f09f61590 Dan Williams 2022-04-25  285  =

c27d4f09f61590 Dan Williams 2022-04-25  286  	/* To change size the old siz=
e must be freed first */
c27d4f09f61590 Dan Williams 2022-04-25  287  	if (p->res)
c27d4f09f61590 Dan Williams 2022-04-25  288  		return -EBUSY;
c27d4f09f61590 Dan Williams 2022-04-25  289  =

c27d4f09f61590 Dan Williams 2022-04-25  290  	if (p->state >=3D CXL_CONFIG_=
INTERLEAVE_ACTIVE)
c27d4f09f61590 Dan Williams 2022-04-25  291  		return -EBUSY;
c27d4f09f61590 Dan Williams 2022-04-25  292  =

c27d4f09f61590 Dan Williams 2022-04-25  293  	/* ways, granularity and uuid=
 (if PMEM) need to be set before HPA */
c27d4f09f61590 Dan Williams 2022-04-25  294  	if (!p->interleave_ways || !p=
->interleave_granularity ||
c27d4f09f61590 Dan Williams 2022-04-25  295  	    (cxlr->mode =3D=3D CXL_DE=
CODER_PMEM && uuid_is_null(&p->uuid)))
c27d4f09f61590 Dan Williams 2022-04-25  296  		return -ENXIO;
c27d4f09f61590 Dan Williams 2022-04-25  297  =

c27d4f09f61590 Dan Williams 2022-04-25  298  	div_u64_rem(size, SZ_256M * p=
->interleave_ways, &remainder);
c27d4f09f61590 Dan Williams 2022-04-25  299  	if (remainder)
c27d4f09f61590 Dan Williams 2022-04-25  300  		return -EINVAL;
c27d4f09f61590 Dan Williams 2022-04-25  301  =

c27d4f09f61590 Dan Williams 2022-04-25  302  	res =3D alloc_free_mem_region=
(cxlrd->res, size, SZ_256M,
c27d4f09f61590 Dan Williams 2022-04-25  303  				    dev_name(&cxlr->dev));
c27d4f09f61590 Dan Williams 2022-04-25  304  	if (IS_ERR(res)) {
c27d4f09f61590 Dan Williams 2022-04-25  305  		dev_dbg(&cxlr->dev, "failed =
to allocate HPA: %ld\n",
c27d4f09f61590 Dan Williams 2022-04-25  306  			PTR_ERR(res));
c27d4f09f61590 Dan Williams 2022-04-25  307  		return PTR_ERR(res);
c27d4f09f61590 Dan Williams 2022-04-25  308  	}
c27d4f09f61590 Dan Williams 2022-04-25  309  =

c27d4f09f61590 Dan Williams 2022-04-25  310  	p->res =3D res;
c27d4f09f61590 Dan Williams 2022-04-25  311  	p->state =3D CXL_CONFIG_INTER=
LEAVE_ACTIVE;
c27d4f09f61590 Dan Williams 2022-04-25  312  =

c27d4f09f61590 Dan Williams 2022-04-25  313  	return 0;
c27d4f09f61590 Dan Williams 2022-04-25  314  }
c27d4f09f61590 Dan Williams 2022-04-25  315  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0977578890769062044==--

