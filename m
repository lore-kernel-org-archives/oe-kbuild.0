Content-Type: multipart/mixed; boundary="===============8341415426005479196=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/apple-dart.c:671:22: warning: Value stored to 'res' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 12 Dec 2021 12:44:13 +0800
Message-ID: <202112121226.jkHT0ZTU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8341415426005479196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sven Peter <sven@svenpeter.dev>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 46d1fb072e76b161b0fb1ada9e37bf7e4d1f123f iommu/dart: Add DART iommu=
 driver
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20211210 (https://download.01.org/0day-ci/arc=
hive/20211212/202112121226.jkHT0ZTU-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D46d1fb072e76b161b0fb1ada9e37bf7e4d1f123f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 46d1fb072e76b161b0fb1ada9e37bf7e4d1f123f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   mm/vmalloc.c:2015:20: note: '?' condition is false
           offset =3D (addr & (VMAP_BLOCK_SIZE - 1)) >> PAGE_SHIFT;
                             ^
   mm/vmalloc.c:1786:27: note: expanded from macro 'VMAP_BLOCK_SIZE'
   #define VMAP_BLOCK_SIZE         (VMAP_BBMAP_BITS * PAGE_SIZE)
                                    ^
   mm/vmalloc.c:1784:20: note: expanded from macro 'VMAP_BBMAP_BITS'
                           VMALLOC_PAGES / roundup_pow_of_two(NR_CPUS) / 16=
))
                                           ^
   include/linux/log2.h:178:12: note: expanded from macro 'roundup_pow_of_t=
wo'
                   (1UL << (ilog2((n) - 1) + 1))   \
                            ^
   include/linux/log2.h:159:3: note: expanded from macro 'ilog2'
           ((n) < 2 ? 0 :                  \
            ^
   mm/vmalloc.c:2015:20: note: Assuming the condition is true
           offset =3D (addr & (VMAP_BLOCK_SIZE - 1)) >> PAGE_SHIFT;
                             ^
   mm/vmalloc.c:1786:27: note: expanded from macro 'VMAP_BLOCK_SIZE'
   #define VMAP_BLOCK_SIZE         (VMAP_BBMAP_BITS * PAGE_SIZE)
                                    ^~~~~~~~~~~~~~~
   mm/vmalloc.c:1782:3: note: expanded from macro 'VMAP_BBMAP_BITS'
                   VMAP_MIN(VMAP_BBMAP_BITS_MAX,   \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:1779:26: note: expanded from macro 'VMAP_MIN'
   #define VMAP_MIN(x, y)          ((x) < (y) ? (x) : (y)) /* can't use min=
() */
                                    ^~~~~~~~~
   mm/vmalloc.c:2015:20: note: '?' condition is true
           offset =3D (addr & (VMAP_BLOCK_SIZE - 1)) >> PAGE_SHIFT;
                             ^
   mm/vmalloc.c:1786:27: note: expanded from macro 'VMAP_BLOCK_SIZE'
   #define VMAP_BLOCK_SIZE         (VMAP_BBMAP_BITS * PAGE_SIZE)
                                    ^
   mm/vmalloc.c:1782:3: note: expanded from macro 'VMAP_BBMAP_BITS'
                   VMAP_MIN(VMAP_BBMAP_BITS_MAX,   \
                   ^
   mm/vmalloc.c:1779:26: note: expanded from macro 'VMAP_MIN'
   #define VMAP_MIN(x, y)          ((x) < (y) ? (x) : (y)) /* can't use min=
() */
                                    ^
   mm/vmalloc.c:2020:2: note: Taking false branch
           if (debug_pagealloc_enabled_static())
           ^
   mm/vmalloc.c:2026:18: note: Assuming '__UNIQUE_ID___x342' is >=3D '__UNI=
QUE_ID___y343'
           vb->dirty_min =3D min(vb->dirty_min, offset);
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   mm/vmalloc.c:2026:18: note: '?' condition is false
           vb->dirty_min =3D min(vb->dirty_min, offset);
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   mm/vmalloc.c:2027:51: note: The result of the left shift is undefined du=
e to shifting by '64', which is greater or equal to the width of type 'unsi=
gned long'
           vb->dirty_max =3D max(vb->dirty_max, offset + (1UL << order));
                                                            ^
   include/linux/minmax.h:52:36: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                                            ^
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iommu/sun50i-iommu.c:511:3: warning: Value stored to 'dte' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   dte =3D old_dte;
                   ^     ~~~~~~~
   drivers/iommu/sun50i-iommu.c:511:3: note: Value stored to 'dte' is never=
 read
                   dte =3D old_dte;
                   ^     ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/iommu/apple-dart.c:671:22: warning: Value stored to 'res' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct iommu_group *res =3D ERR_PTR(-EINVAL);
                               ^~~   ~~~~~~~~~~~~~~~~
   drivers/iommu/apple-dart.c:671:22: note: Value stored to 'res' during it=
s initialization is never read
           struct iommu_group *res =3D ERR_PTR(-EINVAL);
                               ^~~   ~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/res +671 drivers/iommu/apple-dart.c

46d1fb072e76b1 Sven Peter 2021-08-03  663  =

46d1fb072e76b1 Sven Peter 2021-08-03  664  static struct iommu_group *apple=
_dart_device_group(struct device *dev)
46d1fb072e76b1 Sven Peter 2021-08-03  665  {
46d1fb072e76b1 Sven Peter 2021-08-03  666  	static DEFINE_MUTEX(lock);
46d1fb072e76b1 Sven Peter 2021-08-03  667  	int i, sid;
46d1fb072e76b1 Sven Peter 2021-08-03  668  	struct apple_dart_master_cfg *c=
fg =3D dev_iommu_priv_get(dev);
46d1fb072e76b1 Sven Peter 2021-08-03  669  	struct apple_dart_stream_map *s=
tream_map;
46d1fb072e76b1 Sven Peter 2021-08-03  670  	struct iommu_group *group =3D N=
ULL;
46d1fb072e76b1 Sven Peter 2021-08-03 @671  	struct iommu_group *res =3D ERR=
_PTR(-EINVAL);
46d1fb072e76b1 Sven Peter 2021-08-03  672  =

46d1fb072e76b1 Sven Peter 2021-08-03  673  	mutex_lock(&lock);
46d1fb072e76b1 Sven Peter 2021-08-03  674  =

46d1fb072e76b1 Sven Peter 2021-08-03  675  	for_each_stream_map(i, cfg, str=
eam_map) {
46d1fb072e76b1 Sven Peter 2021-08-03  676  		for_each_set_bit(sid, &stream_=
map->sidmap, DART_MAX_STREAMS) {
46d1fb072e76b1 Sven Peter 2021-08-03  677  			struct iommu_group *stream_gr=
oup =3D
46d1fb072e76b1 Sven Peter 2021-08-03  678  				stream_map->dart->sid2group[=
sid];
46d1fb072e76b1 Sven Peter 2021-08-03  679  =

46d1fb072e76b1 Sven Peter 2021-08-03  680  			if (group && group !=3D strea=
m_group) {
46d1fb072e76b1 Sven Peter 2021-08-03  681  				res =3D ERR_PTR(-EINVAL);
46d1fb072e76b1 Sven Peter 2021-08-03  682  				goto out;
46d1fb072e76b1 Sven Peter 2021-08-03  683  			}
46d1fb072e76b1 Sven Peter 2021-08-03  684  =

46d1fb072e76b1 Sven Peter 2021-08-03  685  			group =3D stream_group;
46d1fb072e76b1 Sven Peter 2021-08-03  686  		}
46d1fb072e76b1 Sven Peter 2021-08-03  687  	}
46d1fb072e76b1 Sven Peter 2021-08-03  688  =

46d1fb072e76b1 Sven Peter 2021-08-03  689  	if (group) {
46d1fb072e76b1 Sven Peter 2021-08-03  690  		res =3D iommu_group_ref_get(gr=
oup);
46d1fb072e76b1 Sven Peter 2021-08-03  691  		goto out;
46d1fb072e76b1 Sven Peter 2021-08-03  692  	}
46d1fb072e76b1 Sven Peter 2021-08-03  693  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8341415426005479196==--

