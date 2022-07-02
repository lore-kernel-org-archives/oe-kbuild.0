Content-Type: multipart/mixed; boundary="===============1031047409455697547=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 42/51] drivers/cxl/core/port.c:327 cxl_root_decoder_visible() error: we previously assumed 'a' could be null (see line 324)
Date: Sat, 02 Jul 2022 12:57:01 +0800
Message-ID: <202207021249.iEwcCm6l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1031047409455697547==
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
:::::: branch date: 7 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
702/202207021249.iEwcCm6l-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/core/port.c:327 cxl_root_decoder_visible() error: we previously=
 assumed 'a' could be null (see line 324)

Old smatch warnings:
drivers/cxl/core/port.c:1498 cxl_decoder_alloc() error: potentially derefer=
encing uninitialized 'cxld'.

vim +/a +327 drivers/cxl/core/port.c

c852150450ee6c Ben Widawsky 2021-06-08  315  =

c852150450ee6c Ben Widawsky 2021-06-08  316  static umode_t cxl_root_decode=
r_visible(struct kobject *kobj, struct attribute *a, int n)
c852150450ee6c Ben Widawsky 2021-06-08  317  {
c852150450ee6c Ben Widawsky 2021-06-08  318  	struct device *dev =3D kobj_t=
o_dev(kobj);
c852150450ee6c Ben Widawsky 2021-06-08  319  	struct cxl_root_decoder *cxlr=
d =3D to_cxl_root_decoder(dev);
c852150450ee6c Ben Widawsky 2021-06-08  320  =

c852150450ee6c Ben Widawsky 2021-06-08  321  	if (a =3D=3D CXL_REGION_ATTR(=
create_pmem_region) && !can_create_pmem(cxlrd))
c852150450ee6c Ben Widawsky 2021-06-08  322  		return 0;
c852150450ee6c Ben Widawsky 2021-06-08  323  =

c852150450ee6c Ben Widawsky 2021-06-08 @324  	if (a =3D=3D CXL_REGION_ATTR(=
delete_region) && !can_create_pmem(cxlrd))
c852150450ee6c Ben Widawsky 2021-06-08  325  		return 0;
c852150450ee6c Ben Widawsky 2021-06-08  326  =

c852150450ee6c Ben Widawsky 2021-06-08 @327  	return a->mode;
c852150450ee6c Ben Widawsky 2021-06-08  328  }
c852150450ee6c Ben Widawsky 2021-06-08  329  =


:::::: The code at line 327 was first introduced by commit
:::::: c852150450ee6ceb082faad5d41fa8632389ffee cxl/region: Add region crea=
tion support

:::::: TO: Ben Widawsky <bwidawsk@kernel.org>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1031047409455697547==--

