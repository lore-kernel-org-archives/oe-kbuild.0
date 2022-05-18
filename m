Content-Type: multipart/mixed; boundary="===============8030485953573881636=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 427/12343] drivers/gpu/drm/i915/gt/intel_rps.c:2298 rps_read_mmio() error: uninitialized symbol 'val'.
Date: Wed, 18 May 2022 14:45:35 +0800
Message-ID: <202205181451.tqwvLFl6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8030485953573881636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   47c1c54d1bcd0a69a56b49473bc20f17b70e5242
commit: fa68bff7cf27d83e0ca83c6388d6bc2ddc599905 [427/12343] drm/i915/gt: A=
dd sysfs throttle frequency interfaces
:::::: branch date: 21 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-m001-20220516 (https://download.01.org/0day-ci/ar=
chive/20220518/202205181451.tqwvLFl6-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gt/intel_rps.c:2298 rps_read_mmio() error: uninitializ=
ed symbol 'val'.

vim +/val +2298 drivers/gpu/drm/i915/gt/intel_rps.c

1c40d40f6835cd Vinay Belgaumkar     2021-12-16  2288  =

fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2289  static u32 rps_read_m=
mio(struct intel_rps *rps, i915_reg_t reg32)
fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2290  {
fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2291  	struct intel_gt *gt =
=3D rps_to_gt(rps);
fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2292  	intel_wakeref_t wake=
ref;
fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2293  	u32 val;
fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2294  =

fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2295  	with_intel_runtime_p=
m(gt->uncore->rpm, wakeref)
fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2296  		val =3D intel_uncor=
e_read(gt->uncore, reg32);
fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2297  =

fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19 @2298  	return val;
fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2299  }
fa68bff7cf27d8 Sujaritha Sundaresan 2022-03-19  2300  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8030485953573881636==--

