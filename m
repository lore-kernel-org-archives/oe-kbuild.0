Content-Type: multipart/mixed; boundary="===============7313400145441520868=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mchehab-media-next:master 63/171] drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stored to 'isc_clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 29 Jan 2022 12:12:56 +0800
Message-ID: <202201291253.In8GLX03-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7313400145441520868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eugen Hristev <eugen.hristev@microchip.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Jacopo Mondi <jacopo+renesas@jmondi.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/mchehab/media-next.git master
head:   68a99f6a0ebfe9101ea79ba5af1c407a5ad4f629
commit: 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0 [63/171] media: atmel: atm=
el-isc: split the clock code into separate source file
:::::: branch date: 10 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20220125 (https://download.01.org/0day-ci/arc=
hive/20220129/202201291253.In8GLX03-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add mchehab-media-next git://linuxtv.org/mchehab/media-n=
ext.git
        git fetch --no-tags mchehab-media-next master
        git checkout 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:564:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/drm_syncobj.c:564:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/drm_syncobj.c:567:8: note: Calling 'drm_syncobj_get_hand=
le'
           ret =3D drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:547:6: note: Assuming 'ret' is < 0
           if (ret < 0) {
               ^~~~~~~
   drivers/gpu/drm/drm_syncobj.c:547:2: note: Taking true branch
           if (ret < 0) {
           ^
   drivers/gpu/drm/drm_syncobj.c:548:3: note: Calling 'drm_syncobj_put'
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Calling 'kref_put'
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'drm_syncobj_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:475:2: note: Memory is released
           kfree(syncobj);
           ^~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Returning; memory was released
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:548:3: note: Returning; memory was release=
d via 1st parameter
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:567:8: note: Returning; memory was release=
d via 2nd parameter
           ret =3D drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:568:2: note: Use of memory after it is fre=
ed
           drm_syncobj_put(syncobj);
           ^               ~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/tiny/cirrus.c:564:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret =3D -ENOMEM;
           ^     ~~~~~~~
   drivers/gpu/drm/tiny/cirrus.c:564:2: note: Value stored to 'ret' is neve=
r read
           ret =3D -ENOMEM;
           ^     ~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stor=
ed to 'isc_clk' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   drivers/media/platform/atmel/atmel-isc-clk.c:125:18: note: Value stored =
to 'isc_clk' during its initialization is never read
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/watchdog/mlx_wdt.c:124:14: warning: The result of the left shift=
 is undefined due to shifting by '32', which is greater or equal to the wid=
th of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResu=
lt]
                   set_time =3D BIT(hw_timeout) / MLXREG_WDT_CLOCK_SCALE;
                              ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   drivers/watchdog/mlx_wdt.c:287:6: note: Assuming 'pdata' is non-null
           if (!pdata) {
               ^~~~~~
   drivers/watchdog/mlx_wdt.c:287:2: note: Taking false branch
           if (!pdata) {
           ^
   drivers/watchdog/mlx_wdt.c:292:6: note: Assuming 'wdt' is non-null
           if (!wdt)
               ^~~~
   drivers/watchdog/mlx_wdt.c:292:2: note: Taking false branch
           if (!wdt)
           ^
   drivers/watchdog/mlx_wdt.c:298:6: note: Assuming 'rc' is >=3D 0
           if (rc < 0)
               ^~~~~~
   drivers/watchdog/mlx_wdt.c:298:2: note: Taking false branch
           if (rc < 0)
           ^
   drivers/watchdog/mlx_wdt.c:304:7: note: Assuming the condition is false
           if ((pdata->features & MLXREG_CORE_WD_FEATURE_NOWAYOUT))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/mlx_wdt.c:304:2: note: Taking false branch
           if ((pdata->features & MLXREG_CORE_WD_FEATURE_NOWAYOUT))
           ^
   drivers/watchdog/mlx_wdt.c:308:2: note: Calling 'watchdog_set_drvdata'
           watchdog_set_drvdata(&wdt->wdd, wdt);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/watchdog.h:197:1: note: Returning without writing to 'data=
->wdt_type', which participates in a condition later
   }
   ^
   drivers/watchdog/mlx_wdt.c:308:2: note: Returning from 'watchdog_set_drv=
data'
           watchdog_set_drvdata(&wdt->wdd, wdt);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/mlx_wdt.c:309:7: note: Calling 'mlxreg_wdt_init_timeout'
           rc =3D mlxreg_wdt_init_timeout(wdt, pdata);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/mlx_wdt.c:276:9: note: Calling 'mlxreg_wdt_set_timeout'
           return mlxreg_wdt_set_timeout(&wdt->wdd, timeout);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/mlx_wdt.c:115:2: note: Control jumps to 'case MLX_WDT_T=
YPE1:'  at line 116
           switch (wdt->wdt_type) {
           ^
   drivers/watchdog/mlx_wdt.c:118:7: note: Assuming 'rc' is 0
                   if (rc)
                       ^~
   drivers/watchdog/mlx_wdt.c:118:3: note: Taking false branch
                   if (rc)
                   ^
   drivers/watchdog/mlx_wdt.c:121:16: note: '?' condition is false
                   hw_timeout =3D order_base_2(timeout * MLXREG_WDT_CLOCK_S=
CALE);
                                ^
   include/linux/log2.h:219:2: note: expanded from macro 'order_base_2'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/watchdog/mlx_wdt.c:121:16: note: Calling '__order_base_2'
                   hw_timeout =3D order_base_2(timeout * MLXREG_WDT_CLOCK_S=
CALE);
                                ^
   include/linux/log2.h:222:2: note: expanded from macro 'order_base_2'
           __order_base_2(n)                       \
           ^~~~~~~~~~~~~~~~~
   include/linux/log2.h:201:9: note: Assuming 'n' is > 1
           return n > 1 ? ilog2(n - 1) + 1 : 0;
                  ^~~~~
   include/linux/log2.h:201:9: note: '?' condition is true
   include/linux/log2.h:201:17: note: '?' condition is false

vim +/isc_clk +125 drivers/media/platform/atmel/atmel-isc-clk.c

118bf76a35bc2e Eugen Hristev 2021-12-13  121  =

118bf76a35bc2e Eugen Hristev 2021-12-13  122  static int isc_clk_determine_=
rate(struct clk_hw *hw,
118bf76a35bc2e Eugen Hristev 2021-12-13  123  				  struct clk_rate_request=
 *req)
118bf76a35bc2e Eugen Hristev 2021-12-13  124  {
118bf76a35bc2e Eugen Hristev 2021-12-13 @125  	struct isc_clk *isc_clk =3D =
to_isc_clk(hw);
118bf76a35bc2e Eugen Hristev 2021-12-13  126  	long best_rate =3D -EINVAL;
118bf76a35bc2e Eugen Hristev 2021-12-13  127  	int best_diff =3D -1;
118bf76a35bc2e Eugen Hristev 2021-12-13  128  	unsigned int i, div;
118bf76a35bc2e Eugen Hristev 2021-12-13  129  =

118bf76a35bc2e Eugen Hristev 2021-12-13  130  	for (i =3D 0; i < clk_hw_get=
_num_parents(hw); i++) {
118bf76a35bc2e Eugen Hristev 2021-12-13  131  		struct clk_hw *parent;
118bf76a35bc2e Eugen Hristev 2021-12-13  132  		unsigned long parent_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  133  =

118bf76a35bc2e Eugen Hristev 2021-12-13  134  		parent =3D clk_hw_get_paren=
t_by_index(hw, i);
118bf76a35bc2e Eugen Hristev 2021-12-13  135  		if (!parent)
118bf76a35bc2e Eugen Hristev 2021-12-13  136  			continue;
118bf76a35bc2e Eugen Hristev 2021-12-13  137  =

118bf76a35bc2e Eugen Hristev 2021-12-13  138  		parent_rate =3D clk_hw_get_=
rate(parent);
118bf76a35bc2e Eugen Hristev 2021-12-13  139  		if (!parent_rate)
118bf76a35bc2e Eugen Hristev 2021-12-13  140  			continue;
118bf76a35bc2e Eugen Hristev 2021-12-13  141  =

118bf76a35bc2e Eugen Hristev 2021-12-13  142  		for (div =3D 1; div < ISC_C=
LK_MAX_DIV + 2; div++) {
118bf76a35bc2e Eugen Hristev 2021-12-13  143  			unsigned long rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  144  			int diff;
118bf76a35bc2e Eugen Hristev 2021-12-13  145  =

118bf76a35bc2e Eugen Hristev 2021-12-13  146  			rate =3D DIV_ROUND_CLOSEST=
(parent_rate, div);
118bf76a35bc2e Eugen Hristev 2021-12-13  147  			diff =3D abs(req->rate - r=
ate);
118bf76a35bc2e Eugen Hristev 2021-12-13  148  =

118bf76a35bc2e Eugen Hristev 2021-12-13  149  			if (best_diff < 0 || best_=
diff > diff) {
118bf76a35bc2e Eugen Hristev 2021-12-13  150  				best_rate =3D rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  151  				best_diff =3D diff;
118bf76a35bc2e Eugen Hristev 2021-12-13  152  				req->best_parent_rate =3D=
 parent_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  153  				req->best_parent_hw =3D p=
arent;
118bf76a35bc2e Eugen Hristev 2021-12-13  154  			}
118bf76a35bc2e Eugen Hristev 2021-12-13  155  =

118bf76a35bc2e Eugen Hristev 2021-12-13  156  			if (!best_diff || rate < r=
eq->rate)
118bf76a35bc2e Eugen Hristev 2021-12-13  157  				break;
118bf76a35bc2e Eugen Hristev 2021-12-13  158  		}
118bf76a35bc2e Eugen Hristev 2021-12-13  159  =

118bf76a35bc2e Eugen Hristev 2021-12-13  160  		if (!best_diff)
118bf76a35bc2e Eugen Hristev 2021-12-13  161  			break;
118bf76a35bc2e Eugen Hristev 2021-12-13  162  	}
118bf76a35bc2e Eugen Hristev 2021-12-13  163  =

118bf76a35bc2e Eugen Hristev 2021-12-13  164  	dev_dbg(isc_clk->dev,
118bf76a35bc2e Eugen Hristev 2021-12-13  165  		"ISC CLK: %s, best_rate =3D=
 %ld, parent clk: %s @ %ld\n",
118bf76a35bc2e Eugen Hristev 2021-12-13  166  		__func__, best_rate,
118bf76a35bc2e Eugen Hristev 2021-12-13  167  		__clk_get_name((req->best_p=
arent_hw)->clk),
118bf76a35bc2e Eugen Hristev 2021-12-13  168  		req->best_parent_rate);
118bf76a35bc2e Eugen Hristev 2021-12-13  169  =

118bf76a35bc2e Eugen Hristev 2021-12-13  170  	if (best_rate < 0)
118bf76a35bc2e Eugen Hristev 2021-12-13  171  		return best_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  172  =

118bf76a35bc2e Eugen Hristev 2021-12-13  173  	req->rate =3D best_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  174  =

118bf76a35bc2e Eugen Hristev 2021-12-13  175  	return 0;
118bf76a35bc2e Eugen Hristev 2021-12-13  176  }
118bf76a35bc2e Eugen Hristev 2021-12-13  177  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7313400145441520868==--

