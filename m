Content-Type: multipart/mixed; boundary="===============1714215153102175383=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.18-rc4-nesting 66/70] drivers/iommu/iommufd/hw_pagetable.c:563:5-11: inconsistent IS_ERR and PTR_ERR on line 564.
Date: Wed, 15 Jun 2022 15:59:45 +0800
Message-ID: <202206151557.PDO7zZah-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1714215153102175383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.18-rc4-nesting
head:   e642747ca46aa568063964b5b5101e35258ea0d5
commit: 09b2c01d841ce91ba98fac1eae9921d73b9e5961 [66/70] iommufd: Add IOMMU=
_PAGE_RESPONSE
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c002-20220613 (https://download.01.org/0day-ci/ar=
chive/20220615/202206151557.PDO7zZah-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/hw_pagetable.c:563:5-11: inconsistent IS_ERR and P=
TR_ERR on line 564.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1714215153102175383==--

