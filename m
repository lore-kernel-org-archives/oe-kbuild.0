Content-Type: multipart/mixed; boundary="===============0262597283547098029=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/vc4/vc4_crtc.c:671:34: warning: Value stored to 'mode' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 27 Jan 2022 21:40:07 +0800
Message-ID: <202201272128.DIJ3q9rg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0262597283547098029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maxime Ripard <maxime@cerno.tech>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 16e101051f329f5f3f2dd810f3687d166580aa3a drm/vc4: Increase the core=
 clock based on HVS load
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220125 (https://download.01.org/0day-ci/archi=
ve/20220127/202201272128.DIJ3q9rg-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D16e101051f329f5f3f2dd810f3687d166580aa3a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 16e101051f329f5f3f2dd810f3687d166580aa3a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/mailbox/mtk-cmdq-mailbox.c:430:2: note: Taking false branch
           list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/mailbox/mtk-cmdq-mailbox.c:430:2: note: Loop condition is false.=
  Exiting loop
           list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/mailbox/mtk-cmdq-mailbox.c:430:2: note: Use of memory after it i=
s freed
           list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/v3d/v3d_debugfs.c:139:2: warning: Value stored to 'ident=
0' is never read [clang-analyzer-deadcode.DeadStores]
           ident0 =3D V3D_READ(V3D_HUB_IDENT0);
           ^
   drivers/gpu/drm/v3d/v3d_debugfs.c:139:2: note: Value stored to 'ident0' =
is never read
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/vc4/vc4_bo.c:358:2: warning: Value stored to 'size' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           size =3D roundup(size, PAGE_SIZE);
           ^
   drivers/gpu/drm/vc4/vc4_bo.c:358:2: note: Value stored to 'size' is neve=
r read
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/gpu/drm/vc4/vc4_crtc.c:671:34: warning: Value stored to 'mode' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   const struct drm_display_mode *mode =3D &crtc_state->adj=
usted_mode;
                                                  ^~~~   ~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/gpu/drm/vc4/vc4_crtc.c:671:34: note: Value stored to 'mode' duri=
ng its initialization is never read
                   const struct drm_display_mode *mode =3D &crtc_state->adj=
usted_mode;
                                                  ^~~~   ~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/spi/spi-cadence-quadspi.c:1401:22: warning: Value stored to 'np'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:1401:22: note: Value stored to 'np' du=
ring its initialization is never read
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/spi/spi-dw-core.c:334:13: warning: Division by zero [clang-analy=
zer-core.DivideZero]
           clk_div =3D (DIV_ROUND_UP(dws->max_freq, cfg->freq) + 1) & 0xfff=
e;
                      ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/spi/spi-dw-core.c:666:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/spi/spi-dw-core.c:666:2: note: Taking false branch
           if (ret)
           ^
   drivers/spi/spi-dw-core.c:674:13: note: Assuming '__UNIQUE_ID___x300' is=
 <=3D '__UNIQUE_ID___y301'
           cfg.freq =3D clamp(mem->spi->max_speed_hz, 0U, dws->max_mem_freq=
);
                      ^
   include/linux/minmax.h:89:45: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:45:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/spi/spi-dw-core.c:674:13: note: '?' condition is false
           cfg.freq =3D clamp(mem->spi->max_speed_hz, 0U, dws->max_mem_freq=
);
                      ^
   include/linux/minmax.h:89:45: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                                               ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
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
   drivers/spi/spi-dw-core.c:674:13: note: Assuming '__UNIQUE_ID___x302' is=
 >=3D '__UNIQUE_ID___y303'
           cfg.freq =3D clamp(mem->spi->max_speed_hz, 0U, dws->max_mem_freq=
);
                      ^
   include/linux/minmax.h:89:28: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'

vim +/mode +671 drivers/gpu/drm/vc4/vc4_crtc.c

666e73587f90f4 Boris Brezillon 2018-12-06  653  =

c8b75bca92cbf0 Eric Anholt     2015-03-02  654  static int vc4_crtc_atomic_=
check(struct drm_crtc *crtc,
29b77ad7b9ca8c Maxime Ripard   2020-10-28  655  				 struct drm_atomic_stat=
e *state)
c8b75bca92cbf0 Eric Anholt     2015-03-02  656  {
29b77ad7b9ca8c Maxime Ripard   2020-10-28  657  	struct drm_crtc_state *crt=
c_state =3D drm_atomic_get_new_crtc_state(state,
29b77ad7b9ca8c Maxime Ripard   2020-10-28  658  									  crtc);
29b77ad7b9ca8c Maxime Ripard   2020-10-28  659  	struct vc4_crtc_state *vc4=
_state =3D to_vc4_crtc_state(crtc_state);
008095e065a85a Boris Brezillon 2018-07-03  660  	struct drm_connector *conn;
008095e065a85a Boris Brezillon 2018-07-03  661  	struct drm_connector_state=
 *conn_state;
16e101051f329f Maxime Ripard   2021-10-25  662  	struct drm_encoder *encode=
r;
008095e065a85a Boris Brezillon 2018-07-03  663  	int ret, i;
c8b75bca92cbf0 Eric Anholt     2015-03-02  664  =

ee6965c864e3f5 Maxime Ripard   2020-12-15  665  	ret =3D vc4_hvs_atomic_che=
ck(crtc, state);
d8dbf44f13b911 Eric Anholt     2015-12-28  666  	if (ret)
d8dbf44f13b911 Eric Anholt     2015-12-28  667  		return ret;
c8b75bca92cbf0 Eric Anholt     2015-03-02  668  =

16e101051f329f Maxime Ripard   2021-10-25  669  	encoder =3D vc4_get_crtc_e=
ncoder(crtc, crtc_state);
16e101051f329f Maxime Ripard   2021-10-25  670  	if (encoder) {
16e101051f329f Maxime Ripard   2021-10-25 @671  		const struct drm_display_=
mode *mode =3D &crtc_state->adjusted_mode;
16e101051f329f Maxime Ripard   2021-10-25  672  		struct vc4_encoder *vc4_e=
ncoder =3D to_vc4_encoder(encoder);
16e101051f329f Maxime Ripard   2021-10-25  673  =

16e101051f329f Maxime Ripard   2021-10-25  674  		mode =3D &crtc_state->adj=
usted_mode;
16e101051f329f Maxime Ripard   2021-10-25  675  		if (vc4_encoder->type =3D=
=3D VC4_ENCODER_TYPE_HDMI0) {
16e101051f329f Maxime Ripard   2021-10-25  676  			vc4_state->hvs_load =3D =
max(mode->clock * mode->hdisplay / mode->htotal + 1000,
16e101051f329f Maxime Ripard   2021-10-25  677  						  mode->clock * 9 / 1=
0) * 1000;
16e101051f329f Maxime Ripard   2021-10-25  678  		} else {
16e101051f329f Maxime Ripard   2021-10-25  679  			vc4_state->hvs_load =3D =
mode->clock * 1000;
16e101051f329f Maxime Ripard   2021-10-25  680  		}
16e101051f329f Maxime Ripard   2021-10-25  681  	}
16e101051f329f Maxime Ripard   2021-10-25  682  =

d74252bb8f0e38 Maxime Ripard   2020-11-02  683  	for_each_new_connector_in_=
state(state, conn, conn_state,
29b77ad7b9ca8c Maxime Ripard   2020-10-28  684  					i) {
008095e065a85a Boris Brezillon 2018-07-03  685  		if (conn_state->crtc !=3D=
 crtc)
008095e065a85a Boris Brezillon 2018-07-03  686  			continue;
008095e065a85a Boris Brezillon 2018-07-03  687  =

666e73587f90f4 Boris Brezillon 2018-12-06  688  		vc4_state->margins.left =
=3D conn_state->tv.margins.left;
666e73587f90f4 Boris Brezillon 2018-12-06  689  		vc4_state->margins.right =
=3D conn_state->tv.margins.right;
666e73587f90f4 Boris Brezillon 2018-12-06  690  		vc4_state->margins.top =
=3D conn_state->tv.margins.top;
666e73587f90f4 Boris Brezillon 2018-12-06  691  		vc4_state->margins.bottom=
 =3D conn_state->tv.margins.bottom;
008095e065a85a Boris Brezillon 2018-07-03  692  		break;
008095e065a85a Boris Brezillon 2018-07-03  693  	}
008095e065a85a Boris Brezillon 2018-07-03  694  =

c8b75bca92cbf0 Eric Anholt     2015-03-02  695  	return 0;
c8b75bca92cbf0 Eric Anholt     2015-03-02  696  }
c8b75bca92cbf0 Eric Anholt     2015-03-02  697  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0262597283547098029==--

