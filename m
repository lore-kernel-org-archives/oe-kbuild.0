Content-Type: multipart/mixed; boundary="===============3151453274745714858=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [km13park-linux-1:master 2/7] drivers/iommu/intel-iommu.c:3328:14: sparse: sparse: shift too big (60) for type unsigned long
Date: Tue, 12 May 2020 22:37:11 +0800
Message-ID: <202005122208.RWYSPsmS%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3151453274745714858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Kyung Min Park <kyung.min.park@intel.com>

tree:   https://github.com/km13park/linux-1.git master
head:   07dc08eb4a1a211cc00bcde7d9c6b2145e82ee53
commit: a38881160c1d11c31db3922737879467c39e77cb [2/7] iommu/vt-d: Disable =
IOMMUs when the capabilities are incompatible
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout a38881160c1d11c31db3922737879467c39e77cb
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/iommu/intel-iommu.c:386:5: sparse: sparse: symbol 'audit_strict'=
 was not declared. Should it be static?
   drivers/iommu/intel-iommu.c:404:5: sparse: sparse: symbol 'intel_iommu_g=
fx_mapped' was not declared. Should it be static?
>> drivers/iommu/intel-iommu.c:3328:14: sparse: sparse: shift too big (60) =
for type unsigned long
   drivers/iommu/intel-iommu.c:3328:14: sparse: sparse: shift too big (56) =
for type unsigned long
   drivers/iommu/intel-iommu.c:3329:14: sparse: sparse: shift too big (47) =
for type unsigned long
   drivers/iommu/intel-iommu.c:3329:14: sparse: sparse: shift too big (44) =
for type unsigned long
   drivers/iommu/intel-iommu.c:3329:14: sparse: sparse: shift too big (43) =
for type unsigned long

# https://github.com/km13park/linux-1/commit/a38881160c1d11c31db39227378794=
67c39e77cb
git remote add km13park-linux-1 https://github.com/km13park/linux-1.git
git remote update km13park-linux-1
git checkout a38881160c1d11c31db3922737879467c39e77cb
vim +3328 drivers/iommu/intel-iommu.c

a38881160c1d11 Kyung Min Park 2020-03-24  3324  =

a38881160c1d11 Kyung Min Park 2020-03-24  3325  static inline void check_dm=
ar_capabilities(struct intel_iommu *a,
a38881160c1d11 Kyung Min Park 2020-03-24  3326  					   struct intel_iommu =
*b)
a38881160c1d11 Kyung Min Park 2020-03-24  3327  {
a38881160c1d11 Kyung Min Park 2020-03-24 @3328  	if ((MINIMAL_IOMMU_CAP & (=
a->cap ^ b->cap)) ||
a38881160c1d11 Kyung Min Park 2020-03-24  3329  	    (MINIMAL_IOMMU_ECAP & =
(a->ecap ^ b->ecap)))
a38881160c1d11 Kyung Min Park 2020-03-24  3330  		dmar_sanity_check[IOMMUS_=
SANE] =3D false;
a38881160c1d11 Kyung Min Park 2020-03-24  3331  }
a38881160c1d11 Kyung Min Park 2020-03-24  3332  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3151453274745714858==--

