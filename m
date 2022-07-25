Content-Type: multipart/mixed; boundary="===============2552295071103567364=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djiang:cxl-security 14/16] drivers/cxl/security.c:174:59-60: disable: first occurrence line 177, second occurrence line 181
Date: Mon, 25 Jul 2022 16:58:24 +0000
Message-ID: <202207231241.SmvofeIK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2552295071103567364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cx=
l-security
head:   a9e386b59eef5db739f0706d734daa39759dab96
commit: dd8bf96f3460deaf322b580b58df9f59d33ea99f [14/16] nvdimm/cxl/pmem: A=
dd support for master passphrase disable security command
:::::: branch date: 29 hours ago
:::::: commit date: 34 hours ago
config: ia64-randconfig-c031-20220721 (https://download.01.org/0day-ci/arch=
ive/20220723/202207231241.SmvofeIK-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/cxl/security.c:174:59-60: disable: first occurrence line 177, se=
cond occurrence line 181

vim +174 drivers/cxl/security.c

6d0464a727cb70c Dave Jiang 2022-07-12  173  =

fcbefd0f597c3ba Dave Jiang 2022-07-06 @174  static const struct nvdimm_secu=
rity_ops __cxl_security_ops =3D {
fcbefd0f597c3ba Dave Jiang 2022-07-06  175  	.get_flags =3D cxl_pmem_get_se=
curity_flags,
5dce760e11e79cb Dave Jiang 2022-07-11  176  	.change_key =3D cxl_pmem_secur=
ity_change_key,
6a299141fd67c72 Dave Jiang 2022-07-12 @177  	.disable =3D cxl_pmem_security=
_disable,
4aac0070d1a6c80 Dave Jiang 2022-07-12  178  	.freeze =3D cxl_pmem_security_=
freeze,
abef64ac4e6fcd4 Dave Jiang 2022-07-12  179  	.unlock =3D cxl_pmem_security_=
unlock,
6d0464a727cb70c Dave Jiang 2022-07-12  180  	.erase =3D cxl_pmem_security_p=
assphrase_erase,
dd8bf96f3460dea Dave Jiang 2022-07-13 @181  	.disable =3D cxl_pmem_security=
_disable_master,
fcbefd0f597c3ba Dave Jiang 2022-07-06  182  };
fcbefd0f597c3ba Dave Jiang 2022-07-06  183  =


:::::: The code at line 174 was first introduced by commit
:::::: fcbefd0f597c3baeb916aca4f94bcbfca3571763 cxl/pmem: Introduce nvdimm_=
security_ops with ->get_flags() operation

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2552295071103567364==--

