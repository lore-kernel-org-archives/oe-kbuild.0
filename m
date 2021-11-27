Content-Type: multipart/mixed; boundary="===============5309373160046515343=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/of/unittest.c:2959 unittest_unflatten_overlay_base() warn: should '1 << (((__builtin_constant_p((((((7 * 4) + 4) + 4) + 4)) - 1)) ?((((((((7 * 4) + 4) + 4) + 4)) - 1) < 2) ?0:63 - __builtin_clzll((((((7 * 4) + 4) + 4) + 4)) - 1)):((4 <= 4)) ?__ilo...
Date: Sat, 27 Nov 2021 22:38:56 +0800
Message-ID: <202111272211.MQw54jB7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5309373160046515343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Jelinek <jakub@redhat.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   12 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 12 months ago
config: microblaze-randconfig-m031-20211011 (https://download.01.org/0day-c=
i/archive/20211127/202111272211.MQw54jB7-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/of/unittest.c:2959 unittest_unflatten_overlay_base() warn: should '=
1 << (((__builtin_constant_p((((((7 * 4) + 4) + 4) + 4)) - 1)) ?((((((((7 *=
 4) + 4) + 4) + 4)) - 1) < 2) ?0:63 - __builtin_clzll((((((7 * 4) + 4) + 4)=
 + 4)) - 1)):((4 <=3D 4)) ?__ilog2_u32((((((7 * 4) + 4) + 4) + 4)) - 1):__i=
log2_u64((((((7 * 4) + 4) + 4) + 4)) - 1)) + 1)' be a 64 bit type?

Old smatch warnings:
drivers/of/unittest.c:829 of_unittest_changeset() error: potential null der=
eference 'n1'.  (__of_node_dup returns null)
drivers/of/unittest.c:830 of_unittest_changeset() error: potential null der=
eference 'n2'.  (__of_node_dup returns null)
drivers/of/unittest.c:831 of_unittest_changeset() error: potential null der=
eference 'n21'.  (__of_node_dup returns null)
drivers/of/unittest.c:3122 of_unittest_overlay_high_level() error: potentia=
lly dereferencing uninitialized 'overlay_base_symbols'.

vim +2959 drivers/of/unittest.c

0fa1c579349fdd9 Rob Herring  2018-01-05  2905  =

81d0848fc8d2058 Frank Rowand 2017-04-25  2906  /*
81d0848fc8d2058 Frank Rowand 2017-04-25  2907   * Create base device tree f=
or the overlay unittest.
81d0848fc8d2058 Frank Rowand 2017-04-25  2908   *
81d0848fc8d2058 Frank Rowand 2017-04-25  2909   * This is called from very =
early boot code.
81d0848fc8d2058 Frank Rowand 2017-04-25  2910   *
81d0848fc8d2058 Frank Rowand 2017-04-25  2911   * Do as much as possible th=
e same way as done in __unflatten_device_tree
81d0848fc8d2058 Frank Rowand 2017-04-25  2912   * and other early boot step=
s for the normal FDT so that the overlay base
81d0848fc8d2058 Frank Rowand 2017-04-25  2913   * unflattened tree will hav=
e the same characteristics as the real tree
81d0848fc8d2058 Frank Rowand 2017-04-25  2914   * (such as having memory al=
located by the early allocator).  The goal
81d0848fc8d2058 Frank Rowand 2017-04-25  2915   * is to test "the real thin=
g" as much as possible, and test "test setup
81d0848fc8d2058 Frank Rowand 2017-04-25  2916   * code" as little as possib=
le.
81d0848fc8d2058 Frank Rowand 2017-04-25  2917   *
81d0848fc8d2058 Frank Rowand 2017-04-25  2918   * Have to stop before resol=
ving phandles, because that uses kmalloc.
81d0848fc8d2058 Frank Rowand 2017-04-25  2919   */
81d0848fc8d2058 Frank Rowand 2017-04-25  2920  void __init unittest_unflatt=
en_overlay_base(void)
81d0848fc8d2058 Frank Rowand 2017-04-25  2921  {
81d0848fc8d2058 Frank Rowand 2017-04-25  2922  	struct overlay_info *info;
81d0848fc8d2058 Frank Rowand 2017-04-25  2923  	u32 data_size;
39a751a4cb7e479 Frank Rowand 2018-02-12  2924  	void *new_fdt;
81d0848fc8d2058 Frank Rowand 2017-04-25  2925  	u32 size;
160b1d4e4127f0e Frank Rowand 2018-10-04  2926  	int found =3D 0;
160b1d4e4127f0e Frank Rowand 2018-10-04  2927  	const char *overlay_name =
=3D "overlay_base";
160b1d4e4127f0e Frank Rowand 2018-10-04  2928  =

160b1d4e4127f0e Frank Rowand 2018-10-04  2929  	for (info =3D overlays; inf=
o && info->name; info++) {
160b1d4e4127f0e Frank Rowand 2018-10-04  2930  		if (!strcmp(overlay_name, =
info->name)) {
160b1d4e4127f0e Frank Rowand 2018-10-04  2931  			found =3D 1;
160b1d4e4127f0e Frank Rowand 2018-10-04  2932  			break;
160b1d4e4127f0e Frank Rowand 2018-10-04  2933  		}
160b1d4e4127f0e Frank Rowand 2018-10-04  2934  	}
160b1d4e4127f0e Frank Rowand 2018-10-04  2935  	if (!found) {
160b1d4e4127f0e Frank Rowand 2018-10-04  2936  		pr_err("no overlay data fo=
r %s\n", overlay_name);
160b1d4e4127f0e Frank Rowand 2018-10-04  2937  		return;
160b1d4e4127f0e Frank Rowand 2018-10-04  2938  	}
81d0848fc8d2058 Frank Rowand 2017-04-25  2939  =

81d0848fc8d2058 Frank Rowand 2017-04-25  2940  	info =3D &overlays[0];
81d0848fc8d2058 Frank Rowand 2017-04-25  2941  =

81d0848fc8d2058 Frank Rowand 2017-04-25  2942  	if (info->expected_result !=
=3D -9999) {
81d0848fc8d2058 Frank Rowand 2017-04-25  2943  		pr_err("No dtb 'overlay_ba=
se' to attach\n");
81d0848fc8d2058 Frank Rowand 2017-04-25  2944  		return;
81d0848fc8d2058 Frank Rowand 2017-04-25  2945  	}
81d0848fc8d2058 Frank Rowand 2017-04-25  2946  =

81d0848fc8d2058 Frank Rowand 2017-04-25  2947  	data_size =3D info->dtb_end=
 - info->dtb_begin;
81d0848fc8d2058 Frank Rowand 2017-04-25  2948  	if (!data_size) {
81d0848fc8d2058 Frank Rowand 2017-04-25  2949  		pr_err("No dtb 'overlay_ba=
se' to attach\n");
81d0848fc8d2058 Frank Rowand 2017-04-25  2950  		return;
81d0848fc8d2058 Frank Rowand 2017-04-25  2951  	}
81d0848fc8d2058 Frank Rowand 2017-04-25  2952  =

81d0848fc8d2058 Frank Rowand 2017-04-25  2953  	size =3D fdt_totalsize(info=
->dtb_begin);
81d0848fc8d2058 Frank Rowand 2017-04-25  2954  	if (size !=3D data_size) {
81d0848fc8d2058 Frank Rowand 2017-04-25  2955  		pr_err("dtb 'overlay_base'=
 header totalsize !=3D actual size");
81d0848fc8d2058 Frank Rowand 2017-04-25  2956  		return;
81d0848fc8d2058 Frank Rowand 2017-04-25  2957  	}
81d0848fc8d2058 Frank Rowand 2017-04-25  2958  =

39a751a4cb7e479 Frank Rowand 2018-02-12 @2959  	new_fdt =3D dt_alloc_memory=
(size, roundup_pow_of_two(FDT_V17_SIZE));
39a751a4cb7e479 Frank Rowand 2018-02-12  2960  	if (!new_fdt) {
81d0848fc8d2058 Frank Rowand 2017-04-25  2961  		pr_err("alloc for dtb 'ove=
rlay_base' failed");
81d0848fc8d2058 Frank Rowand 2017-04-25  2962  		return;
81d0848fc8d2058 Frank Rowand 2017-04-25  2963  	}
81d0848fc8d2058 Frank Rowand 2017-04-25  2964  =

39a751a4cb7e479 Frank Rowand 2018-02-12  2965  	memcpy(new_fdt, info->dtb_b=
egin, size);
81d0848fc8d2058 Frank Rowand 2017-04-25  2966  =

39a751a4cb7e479 Frank Rowand 2018-02-12  2967  	__unflatten_device_tree(new=
_fdt, NULL, &overlay_base_root,
0fa1c579349fdd9 Rob Herring  2018-01-05  2968  				dt_alloc_memory, true);
81d0848fc8d2058 Frank Rowand 2017-04-25  2969  }
81d0848fc8d2058 Frank Rowand 2017-04-25  2970  =


:::::: The code at line 2959 was first introduced by commit
:::::: 39a751a4cb7e4798f0ce1169ec92de4a1aae39e3 of: change overlay apply in=
put data from unflattened to FDT

:::::: TO: Frank Rowand <frank.rowand@sony.com>
:::::: CC: Frank Rowand <frowand.list@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5309373160046515343==--

