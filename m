Content-Type: multipart/mixed; boundary="===============2385892431168717202=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1117/4328] drivers/bus/ti-sysc.c:2362:2-8: ERROR: missing clk_put; clk_get on line 2354 and execution via conditional on line 2361
Date: Fri, 15 Apr 2022 20:18:50 +0800
Message-ID: <202204152033.mFxczw9F-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2385892431168717202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   40354149f4d738dc3492d9998e45b3f02950369a
commit: 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8 [1117/4328] ARM: dove: mul=
tiplatform support
:::::: branch date: 31 hours ago
:::::: commit date: 11 days ago
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20220415/=
202204152033.mFxczw9F-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/bus/ti-sysc.c:2362:2-8: ERROR: missing clk_put; clk_get on line =
2354 and execution via conditional on line 2361

vim +2362 drivers/bus/ti-sysc.c

c5a2de97fbd2979 Tony Lindgren  2017-12-15  2338  =

2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2339  /*
8b2830ba170356a Tony Lindgren  2018-04-16  2340   * Many child device drive=
rs need to have fck and opt clocks available
8b2830ba170356a Tony Lindgren  2018-04-16  2341   * to get the clock rate f=
or device internal configuration etc.
2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2342   */
8b2830ba170356a Tony Lindgren  2018-04-16  2343  static int sysc_child_add_=
named_clock(struct sysc *ddata,
8b2830ba170356a Tony Lindgren  2018-04-16  2344  				      struct device *c=
hild,
8b2830ba170356a Tony Lindgren  2018-04-16  2345  				      const char *name)
2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2346  {
8b2830ba170356a Tony Lindgren  2018-04-16  2347  	struct clk *clk;
2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2348  	struct clk_lookup *l;
8b2830ba170356a Tony Lindgren  2018-04-16  2349  	int error =3D 0;
2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2350  =

8b2830ba170356a Tony Lindgren  2018-04-16  2351  	if (!name)
2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2352  		return 0;
2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2353  =

8b2830ba170356a Tony Lindgren  2018-04-16 @2354  	clk =3D clk_get(child, na=
me);
8b2830ba170356a Tony Lindgren  2018-04-16  2355  	if (!IS_ERR(clk)) {
cb6cfe2eaed171b Markus Elfring 2019-11-06  2356  		error =3D -EEXIST;
cb6cfe2eaed171b Markus Elfring 2019-11-06  2357  		goto put_clk;
2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2358  	}
2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2359  =

8b2830ba170356a Tony Lindgren  2018-04-16  2360  	clk =3D clk_get(ddata->de=
v, name);
8b2830ba170356a Tony Lindgren  2018-04-16 @2361  	if (IS_ERR(clk))
8b2830ba170356a Tony Lindgren  2018-04-16 @2362  		return -ENODEV;
8b2830ba170356a Tony Lindgren  2018-04-16  2363  =

8b2830ba170356a Tony Lindgren  2018-04-16  2364  	l =3D clkdev_create(clk, =
name, dev_name(child));
8b2830ba170356a Tony Lindgren  2018-04-16  2365  	if (!l)
8b2830ba170356a Tony Lindgren  2018-04-16  2366  		error =3D -ENOMEM;
cb6cfe2eaed171b Markus Elfring 2019-11-06  2367  put_clk:
8b2830ba170356a Tony Lindgren  2018-04-16  2368  	clk_put(clk);
8b2830ba170356a Tony Lindgren  2018-04-16  2369  =

8b2830ba170356a Tony Lindgren  2018-04-16  2370  	return error;
2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2371  }
2c355ff6b6ca6e0 Tony Lindgren  2018-02-22  2372  =


:::::: The code at line 2362 was first introduced by commit
:::::: 8b2830ba170356aed364ae145ca86120f510ec41 bus: ti-sysc: Make child cl=
ock alias handling more generic

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2385892431168717202==--

