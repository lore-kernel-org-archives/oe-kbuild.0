Content-Type: multipart/mixed; boundary="===============4187840122546319715=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 6/6] hw_random: credit entropy for low quality sources of randomness
Date: Tue, 25 Jan 2022 21:52:25 +0800
Message-ID: <202201252124.ZlTUIMTI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4187840122546319715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220124202951.28579-6-linux@dominikbrodowski.net>
References: <20220124202951.28579-6-linux@dominikbrodowski.net>
TO: Dominik Brodowski <linux@dominikbrodowski.net>

Hi Dominik,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on v5.17-rc1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dominik-Brodowski/hw_rando=
m-explicit-ordering-of-initcalls/20220125-051254
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t 515a2f507491e7c3818e74ef4f4e088c1fecb190
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-c006-20220124 (https://download.01.org/0day-ci/arc=
hive/20220125/202201252124.ZlTUIMTI-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/a0f46724fe340bab80dd4a8bf=
4a9f413c6a294f1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dominik-Brodowski/hw_random-explic=
it-ordering-of-initcalls/20220125-051254
        git checkout a0f46724fe340bab80dd4a8bf4a9f413c6a294f1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:26:26: note: expanded from macro =
'node'
   #define node(root, dir) ((root)->nl_entry.dir =3D=3D &mm->nodes) ? NULL =
:          \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:207:10: note: '?' condition is fa=
lse
                   next =3D node(this, next);
                          ^
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:26:25: note: expanded from macro =
'node'
   #define node(root, dir) ((root)->nl_entry.dir =3D=3D &mm->nodes) ? NULL =
:          \
                           ^
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:208:7: note: Assuming 'next' is n=
ull
                   if (next && next->type !=3D type) {
                       ^~~~
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:208:12: note: Left side of '&&' i=
s false
                   if (next && next->type !=3D type) {
                            ^
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:215:7: note: Assuming 's' is <=3D=
 'e'
                   if (s > e || a < size_min)
                       ^~~~~
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:215:7: note: Left side of '||' is=
 false
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:215:16: note: Assuming 'a' is >=
=3D 'size_min'
                   if (s > e || a < size_min)
                                ^~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:215:3: note: Taking false branch
                   if (s > e || a < size_min)
                   ^
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:218:8: note: Assuming '__UNIQUE_I=
D___x265' is >=3D '__UNIQUE_ID___y266'
                   a  =3D min(a, size_max);
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
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:218:8: note: '?' condition is fal=
se
                   a  =3D min(a, size_max);
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
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:222:7: note: Assuming 'c' is 0
                   if (c && !region_tail(mm, this, c))
                       ^
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:222:9: note: Left side of '&&' is=
 false
                   if (c && !region_tail(mm, this, c))
                         ^
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:225:10: note: Calling 'region_tai=
l'
                   this =3D region_tail(mm, this, a);
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:165:6: note: Assuming 'size' is n=
ot equal to field 'length'
           if (a->length =3D=3D size)
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:165:2: note: Taking false branch
           if (a->length =3D=3D size)
           ^
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:169:15: note: Assuming 'b' is not=
 equal to null
           if (unlikely(b =3D=3D NULL))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:169:2: note: Taking false branch
           if (unlikely(b =3D=3D NULL))
           ^
   drivers/gpu/drm/nouveau/nvkm/core/mm.c:178:2: note: Calling 'list_add'
           list_add(&b->nl_entry, &a->nl_entry);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:88:24: note: Passing null pointer value via 3rd par=
ameter 'next'
           __list_add(new, head, head->next);
                                 ^~~~~~~~~~
   include/linux/list.h:88:2: note: Calling '__list_add'
           __list_add(new, head, head->next);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:69:6: note: Assuming the condition is false
           if (!__list_add_valid(new, prev, next))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:69:2: note: Taking false branch
           if (!__list_add_valid(new, prev, next))
           ^
   include/linux/list.h:72:13: note: Access to field 'prev' results in a de=
reference of a null pointer (loaded from variable 'next')
           next->prev =3D new;
           ~~~~       ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/char/hw_random/core.c:455:4: warning: Value stored to 'entropy_c=
redit' is never read [clang-analyzer-deadcode.DeadStores]
                           entropy_credit =3D entropy;
                           ^                ~~~~~~~
   drivers/char/hw_random/core.c:455:4: note: Value stored to 'entropy_cred=
it' is never read
                           entropy_credit =3D entropy;
                           ^                ~~~~~~~
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
   4 warnings generated.
   drivers/char/hw_random/ixp4xx-rng.c:44:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   drivers/char/hw_random/ixp4xx-rng.c:44:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/radeon/r100.c:2557:2: warning: Value stored to 'tmp' is =
never read [clang-analyzer-deadcode.DeadStores]
           tmp =3D RREG32(RADEON_BUS_CNTL);
           ^
   drivers/gpu/drm/radeon/r100.c:2557:2: note: Value stored to 'tmp' is nev=
er read
   drivers/gpu/drm/radeon/r100.c:2881:3: warning: Value stored to 'tmp' is =
never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(RADEON_CLOCK_CNTL_DATA);
                   ^
   drivers/gpu/drm/radeon/r100.c:2881:3: note: Value stored to 'tmp' is nev=
er read
   drivers/gpu/drm/radeon/r100.c:3821:3: warning: 3rd function call argumen=
t is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   WREG32(R_0003F8_CRTC2_GEN_CNTL, save->CRTC2_GEN_CNTL);
                   ^
   drivers/gpu/drm/radeon/radeon.h:2549:24: note: expanded from macro 'WREG=
32'
   #define WREG32(reg, v) r100_mm_wreg(rdev, (reg), (v), false)
                          ^
   drivers/gpu/drm/radeon/r100.c:3937:6: note: Assuming the condition is fa=
lse
           if (rdev->flags & RADEON_IS_PCI)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/entropy_credit +455 drivers/char/hw_random/core.c

844dd05fec172d Michael Buesch    2006-06-26  424  =

be4000bc4644d0 Torsten Duwe      2014-06-14  425  static int hwrng_fillfn(v=
oid *unused)
be4000bc4644d0 Torsten Duwe      2014-06-14  426  {
be4000bc4644d0 Torsten Duwe      2014-06-14  427  	long rc;
be4000bc4644d0 Torsten Duwe      2014-06-14  428  =

08e97aec700aef Herbert Xu        2019-11-17  429  	while (!kthread_should_s=
top()) {
a0f46724fe340b Dominik Brodowski 2022-01-24  430  		size_t entropy, entropy=
_credit =3D 0; /* in 1/1024 of a bit */
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  431  		struct hwrng *rng;
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  432  =

502e9986132b25 Dominik Brodowski 2022-01-24  433  		if (!current_quality)
502e9986132b25 Dominik Brodowski 2022-01-24  434  			break;
502e9986132b25 Dominik Brodowski 2022-01-24  435  =

3a2c0ba5ad00c0 Rusty Russell     2014-12-08  436  		rng =3D get_current_rng=
();
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  437  		if (IS_ERR(rng) || !rng)
be4000bc4644d0 Torsten Duwe      2014-06-14  438  			break;
9372b35e11149c Rusty Russell     2014-12-08  439  		mutex_lock(&reading_mut=
ex);
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  440  		rc =3D rng_get_data(rng=
, rng_fillbuf,
be4000bc4644d0 Torsten Duwe      2014-06-14  441  				  rng_buffer_size(), =
1);
9372b35e11149c Rusty Russell     2014-12-08  442  		mutex_unlock(&reading_m=
utex);
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  443  		put_rng(rng);
be4000bc4644d0 Torsten Duwe      2014-06-14  444  		if (rc <=3D 0) {
be4000bc4644d0 Torsten Duwe      2014-06-14  445  			pr_warn("hwrng: no dat=
a available\n");
be4000bc4644d0 Torsten Duwe      2014-06-14  446  			msleep_interruptible(1=
0000);
be4000bc4644d0 Torsten Duwe      2014-06-14  447  			continue;
be4000bc4644d0 Torsten Duwe      2014-06-14  448  		}
a0f46724fe340b Dominik Brodowski 2022-01-24  449  =

a0f46724fe340b Dominik Brodowski 2022-01-24  450  		/* If we cannot credit =
at least one bit of entropy,
a0f46724fe340b Dominik Brodowski 2022-01-24  451  		 * keep track of the re=
mainder for the next iteration
a0f46724fe340b Dominik Brodowski 2022-01-24  452  		 */
a0f46724fe340b Dominik Brodowski 2022-01-24  453  		entropy =3D rc * curren=
t_quality * 8 + entropy_credit;
a0f46724fe340b Dominik Brodowski 2022-01-24  454  		if ((entropy >> 10) =3D=
=3D 0)
a0f46724fe340b Dominik Brodowski 2022-01-24 @455  			entropy_credit =3D ent=
ropy;
a0f46724fe340b Dominik Brodowski 2022-01-24  456  =

9372b35e11149c Rusty Russell     2014-12-08  457  		/* Outside lock, sure, =
but y'know: randomness. */
be4000bc4644d0 Torsten Duwe      2014-06-14  458  		add_hwgenerator_randomn=
ess((void *)rng_fillbuf, rc,
a0f46724fe340b Dominik Brodowski 2022-01-24  459  					   entropy >> 10);
be4000bc4644d0 Torsten Duwe      2014-06-14  460  	}
9dda727d37ff6c Torsten Duwe      2014-06-16  461  	hwrng_fill =3D NULL;
be4000bc4644d0 Torsten Duwe      2014-06-14  462  	return 0;
be4000bc4644d0 Torsten Duwe      2014-06-14  463  }
be4000bc4644d0 Torsten Duwe      2014-06-14  464  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4187840122546319715==--

