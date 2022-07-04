Content-Type: multipart/mixed; boundary="===============4534734479666060317=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 42/51] drivers/cxl/core/region.c:274 alloc_hpa() error: uninitialized symbol 'res'.
Date: Tue, 05 Jul 2022 03:39:09 +0800
Message-ID: <202207050332.qR7UUX4I-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4534734479666060317==
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
head:   1985cf58850562e4b960e19d46f0d8f19d6c7cbd
commit: 00f2da5084b78ec176b8bff9d22e3bf6a0e5a821 [42/51] cxl/region: Alloca=
te host physical address (HPA) capacity to new regions
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: i386-randconfig-m021-20220704 (https://download.01.org/0day-ci/arch=
ive/20220705/202207050332.qR7UUX4I-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/core/region.c:274 alloc_hpa() error: uninitialized symbol 'res'.

Old smatch warnings:
drivers/cxl/core/region.c:541 create_pmem_region_store() warn: unsigned 'rc=
' is never less than zero.

vim +/res +274 drivers/cxl/core/region.c

00f2da5084b78e Dan Williams 2022-04-25  263  =

00f2da5084b78e Dan Williams 2022-04-25  264  static int alloc_hpa(struct cx=
l_region *cxlr, resource_size_t size)
00f2da5084b78e Dan Williams 2022-04-25  265  {
00f2da5084b78e Dan Williams 2022-04-25  266  	struct cxl_root_decoder *cxlr=
d =3D to_cxl_root_decoder(cxlr->dev.parent);
00f2da5084b78e Dan Williams 2022-04-25  267  	struct cxl_region_params *p =
=3D &cxlr->params;
00f2da5084b78e Dan Williams 2022-04-25  268  	struct resource *res;
00f2da5084b78e Dan Williams 2022-04-25  269  	u32 remainder =3D 0;
00f2da5084b78e Dan Williams 2022-04-25  270  =

00f2da5084b78e Dan Williams 2022-04-25  271  	lockdep_assert_held_write(&cx=
l_region_rwsem);
00f2da5084b78e Dan Williams 2022-04-25  272  =

00f2da5084b78e Dan Williams 2022-04-25  273  	/* Nothing to do... */
00f2da5084b78e Dan Williams 2022-04-25 @274  	if (p->res && resource_size(r=
es) =3D=3D size)
00f2da5084b78e Dan Williams 2022-04-25  275  		return 0;
00f2da5084b78e Dan Williams 2022-04-25  276  =

00f2da5084b78e Dan Williams 2022-04-25  277  	/* To change size the old siz=
e must be freed first */
00f2da5084b78e Dan Williams 2022-04-25  278  	if (p->res)
00f2da5084b78e Dan Williams 2022-04-25  279  		return -EBUSY;
00f2da5084b78e Dan Williams 2022-04-25  280  =

00f2da5084b78e Dan Williams 2022-04-25  281  	if (p->state >=3D CXL_CONFIG_=
INTERLEAVE_ACTIVE)
00f2da5084b78e Dan Williams 2022-04-25  282  		return -EBUSY;
00f2da5084b78e Dan Williams 2022-04-25  283  =

00f2da5084b78e Dan Williams 2022-04-25  284  	if (!p->interleave_ways || !p=
->interleave_granularity)
00f2da5084b78e Dan Williams 2022-04-25  285  		return -ENXIO;
00f2da5084b78e Dan Williams 2022-04-25  286  =

00f2da5084b78e Dan Williams 2022-04-25  287  	div_u64_rem(size, SZ_256M * p=
->interleave_ways, &remainder);
00f2da5084b78e Dan Williams 2022-04-25  288  	if (remainder)
00f2da5084b78e Dan Williams 2022-04-25  289  		return -EINVAL;
00f2da5084b78e Dan Williams 2022-04-25  290  =

00f2da5084b78e Dan Williams 2022-04-25  291  	res =3D alloc_free_mem_region=
(cxlrd->res, size, SZ_256M,
00f2da5084b78e Dan Williams 2022-04-25  292  				    dev_name(&cxlr->dev));
00f2da5084b78e Dan Williams 2022-04-25  293  	if (IS_ERR(res)) {
00f2da5084b78e Dan Williams 2022-04-25  294  		dev_dbg(&cxlr->dev, "failed =
to allocate HPA: %ld\n",
00f2da5084b78e Dan Williams 2022-04-25  295  			PTR_ERR(res));
00f2da5084b78e Dan Williams 2022-04-25  296  		return PTR_ERR(res);
00f2da5084b78e Dan Williams 2022-04-25  297  	}
00f2da5084b78e Dan Williams 2022-04-25  298  =

00f2da5084b78e Dan Williams 2022-04-25  299  	p->res =3D res;
00f2da5084b78e Dan Williams 2022-04-25  300  	p->state =3D CXL_CONFIG_INTER=
LEAVE_ACTIVE;
00f2da5084b78e Dan Williams 2022-04-25  301  =

00f2da5084b78e Dan Williams 2022-04-25  302  	return 0;
00f2da5084b78e Dan Williams 2022-04-25  303  }
00f2da5084b78e Dan Williams 2022-04-25  304  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4534734479666060317==--

