Content-Type: multipart/mixed; boundary="===============7510876797254712830=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 20/28] cxl/region: Allocate HPA capacity to regions
Date: Sun, 17 Jul 2022 01:53:02 +0800
Message-ID: <202207170105.VdsjG4YU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7510876797254712830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <165784335630.1758207.420216490941955417.stgit@dwillia2-xfh.=
jf.intel.com>
References: <165784335630.1758207.420216490941955417.stgit@dwillia2-xfh.j=
f.intel.com>
TO: Dan Williams <dan.j.williams@intel.com>

Hi Dan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on b060edfd8cdd52bc8648392500bf152a8dd6d4c5]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/CXL-PME=
M-Region-Provisioning/20220715-080748
base:   b060edfd8cdd52bc8648392500bf152a8dd6d4c5
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
717/202207170105.VdsjG4YU-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cxl/core/port.c:327 cxl_root_decoder_visible() error: we previously=
 assumed 'a' could be null (see line 324)

vim +/a +327 drivers/cxl/core/port.c

ab57dfd9fe879b Ben Widawsky 2022-07-14  315  =

ab57dfd9fe879b Ben Widawsky 2022-07-14  316  static umode_t cxl_root_decode=
r_visible(struct kobject *kobj, struct attribute *a, int n)
ab57dfd9fe879b Ben Widawsky 2022-07-14  317  {
ab57dfd9fe879b Ben Widawsky 2022-07-14  318  	struct device *dev =3D kobj_t=
o_dev(kobj);
ab57dfd9fe879b Ben Widawsky 2022-07-14  319  	struct cxl_root_decoder *cxlr=
d =3D to_cxl_root_decoder(dev);
ab57dfd9fe879b Ben Widawsky 2022-07-14  320  =

ab57dfd9fe879b Ben Widawsky 2022-07-14  321  	if (a =3D=3D CXL_REGION_ATTR(=
create_pmem_region) && !can_create_pmem(cxlrd))
ab57dfd9fe879b Ben Widawsky 2022-07-14  322  		return 0;
ab57dfd9fe879b Ben Widawsky 2022-07-14  323  =

ab57dfd9fe879b Ben Widawsky 2022-07-14 @324  	if (a =3D=3D CXL_REGION_ATTR(=
delete_region) && !can_create_pmem(cxlrd))
ab57dfd9fe879b Ben Widawsky 2022-07-14  325  		return 0;
ab57dfd9fe879b Ben Widawsky 2022-07-14  326  =

ab57dfd9fe879b Ben Widawsky 2022-07-14 @327  	return a->mode;
ab57dfd9fe879b Ben Widawsky 2022-07-14  328  }
ab57dfd9fe879b Ben Widawsky 2022-07-14  329  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7510876797254712830==--

