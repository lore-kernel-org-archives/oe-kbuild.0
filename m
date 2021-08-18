Content-Type: multipart/mixed; boundary="===============8894939056250287219=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: expand clk_ignore_unused mechanism to keep only a few clks on
Date: Thu, 19 Aug 2021 07:27:47 +0800
Message-ID: <202108190752.NiMPJY1J-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8894939056250287219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210818160457.320598-1-u.kleine-koenig@pengutronix.de>
References: <20210818160457.320598-1-u.kleine-koenig@pengutronix.de>
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-clk(a)vger.kernel.org
CC: kernel(a)pengutronix.de

Hi "Uwe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linux/master linus/master v5.14-rc6 next-202108=
18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Uwe-Kleine-K-nig/clk-expan=
d-clk_ignore_unused-mechanism-to-keep-only-a-few-clks-on/20210819-000800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/clk.c:1315:12: warning: Expression is always false because '=
else if' condition matches previous condition at line 1312. [multiCondition]
    } else if (clk_ignore_unused) {
              ^

vim +1315 drivers/clk/clk.c

7ec986efed0208c Dong Aisheng     2016-06-30  1307  =

564f86d384755e3 Rasmus Villemoes 2019-10-04  1308  static int __init clk_di=
sable_unused(void)
7ec986efed0208c Dong Aisheng     2016-06-30  1309  {
7ec986efed0208c Dong Aisheng     2016-06-30  1310  	struct clk_core *core;
7ec986efed0208c Dong Aisheng     2016-06-30  1311  =

7ec986efed0208c Dong Aisheng     2016-06-30 @1312  	if (clk_ignore_unused) {
7ec986efed0208c Dong Aisheng     2016-06-30  1313  		pr_warn("clk: Not disa=
bling unused clocks\n");
7ec986efed0208c Dong Aisheng     2016-06-30  1314  		return 0;
bef2d694904f8db Uwe Kleine-K=C3=B6nig 2021-08-18 @1315  	} else if (clk_ign=
ore_unused) {
bef2d694904f8db Uwe Kleine-K=C3=B6nig 2021-08-18  1316  		pr_warn("clk: Not=
 disabling %u unused clocks\n", clk_ignore_unused);
7ec986efed0208c Dong Aisheng     2016-06-30  1317  	}
7ec986efed0208c Dong Aisheng     2016-06-30  1318  =

7ec986efed0208c Dong Aisheng     2016-06-30  1319  	clk_prepare_lock();
7ec986efed0208c Dong Aisheng     2016-06-30  1320  =

7ec986efed0208c Dong Aisheng     2016-06-30  1321  	hlist_for_each_entry(co=
re, &clk_root_list, child_node)
7ec986efed0208c Dong Aisheng     2016-06-30  1322  		clk_disable_unused_sub=
tree(core);
7ec986efed0208c Dong Aisheng     2016-06-30  1323  =

7ec986efed0208c Dong Aisheng     2016-06-30  1324  	hlist_for_each_entry(co=
re, &clk_orphan_list, child_node)
7ec986efed0208c Dong Aisheng     2016-06-30  1325  		clk_disable_unused_sub=
tree(core);
7ec986efed0208c Dong Aisheng     2016-06-30  1326  =

7ec986efed0208c Dong Aisheng     2016-06-30  1327  	hlist_for_each_entry(co=
re, &clk_root_list, child_node)
7ec986efed0208c Dong Aisheng     2016-06-30  1328  		clk_unprepare_unused_s=
ubtree(core);
7ec986efed0208c Dong Aisheng     2016-06-30  1329  =

7ec986efed0208c Dong Aisheng     2016-06-30  1330  	hlist_for_each_entry(co=
re, &clk_orphan_list, child_node)
7ec986efed0208c Dong Aisheng     2016-06-30  1331  		clk_unprepare_unused_s=
ubtree(core);
7ec986efed0208c Dong Aisheng     2016-06-30  1332  =

7ec986efed0208c Dong Aisheng     2016-06-30  1333  	clk_prepare_unlock();
7ec986efed0208c Dong Aisheng     2016-06-30  1334  =

7ec986efed0208c Dong Aisheng     2016-06-30  1335  	return 0;
7ec986efed0208c Dong Aisheng     2016-06-30  1336  }
7ec986efed0208c Dong Aisheng     2016-06-30  1337  late_initcall_sync(clk_d=
isable_unused);
7ec986efed0208c Dong Aisheng     2016-06-30  1338  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8894939056250287219==--

