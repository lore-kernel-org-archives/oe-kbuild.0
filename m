Content-Type: multipart/mixed; boundary="===============4006760095199739390=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gem/i915_gem_ttm.c:898 i915_gem_ttm_system_setup() warn: should 'totalram_pages() << 12' be a 64 bit type?
Date: Wed, 04 May 2022 10:53:48 +0800
Message-ID: <202205041036.DmkusTeb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4006760095199739390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef8e4d3c2ab1f47f63b6c7e578266b7e5cc9cd1b
commit: 32b7cf51a441270c62ebaa146c9431e6f155d901 drm/i915/ttm: Use TTM for =
system memory
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-m021-20220502 (https://download.01.org/0day-ci/arch=
ive/20220504/202205041036.DmkusTeb-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_ttm.c:898 i915_gem_ttm_system_setup() war=
n: should 'totalram_pages() << 12' be a 64 bit type?

vim +898 drivers/gpu/drm/i915/gem/i915_gem_ttm.c

32b7cf51a441270 Thomas Hellstr=C3=B6m 2021-06-24  890  =

32b7cf51a441270 Thomas Hellstr=C3=B6m 2021-06-24  891  struct intel_memory_=
region *
32b7cf51a441270 Thomas Hellstr=C3=B6m 2021-06-24  892  i915_gem_ttm_system_=
setup(struct drm_i915_private *i915,
32b7cf51a441270 Thomas Hellstr=C3=B6m 2021-06-24  893  			  u16 type, u16 i=
nstance)
32b7cf51a441270 Thomas Hellstr=C3=B6m 2021-06-24  894  {
32b7cf51a441270 Thomas Hellstr=C3=B6m 2021-06-24  895  	struct intel_memory=
_region *mr;
32b7cf51a441270 Thomas Hellstr=C3=B6m 2021-06-24  896  =

32b7cf51a441270 Thomas Hellstr=C3=B6m 2021-06-24  897  	mr =3D intel_memory=
_region_create(i915, 0,
32b7cf51a441270 Thomas Hellstr=C3=B6m 2021-06-24 @898  					totalram_pages(=
) << PAGE_SHIFT,

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4006760095199739390==--

