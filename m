Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FF22D1911
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037341; cv=none; b=lnODorFsp0L/DdLYi6oPqKRdec0WacBdulAq4uyEZgVW0iYlYaieeGCw5kjyTG061k1QawPv1Pzx/UbrTiOnFVhz+rk64gejOf8Wwc115Ba1pm2fkrG8MveCpPNuCtJ2/i1F4GvIZAIZqy5T4lirWY+PWSbwqAHwHowIYwlQGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037341; c=relaxed/simple;
	bh=McT6aRJWaIe4+t69wmGpir7ngooTTD19GOpx9n42kK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eSFydZ8LaVJ8av7SL9HFSVIGDNC/UjDJiWmznNpS3f9/MPc8Ysw8O+sV9tVS2ZlVh91SnfzEgaMH9cgXPqZ47H/GjPUcGvQxUNK5Pkhwtv2y1dqSn9iNGrOFD1gKkh+rayFyYQttivIzZWN9/zaJqxEHwok3Ry8yo+3H3Yfn7BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxMB+vzV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxMB+vzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789037340; x=1820573340;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=McT6aRJWaIe4+t69wmGpir7ngooTTD19GOpx9n42kK4=;
  b=KxMB+vzVfJugWeiAqBe/VkMg0qP0f6Mbq4LR5SzoFCYO5ZS1iu4QXaSo
   YRPVNfADIrUVdzXu/IBPe3lZKDtIWCQl+7S9gTs25Wj0OXCRNYdaoq5M0
   1q7S8DT1hHVXPkKw5pdUouNrSTfLcCxs1ED+HvO5p6/+Sx8stKVDjW8zr
   wFJf8u6fBOc5bLraLSBSPgWp6b2eWU3XHeJxwi+MtPZ5udQTFdtyj/VjZ
   W+bVA3vnIQ79CIBOz3CejciaAhji/0h8y+XL1Iqfd7MHXehbl+xtxLiVI
   QTfLfv1j2Om1ZtyYAu9gzzUsgmhqIZ28R8w8x9lIIB/scz0v51R1qdVlh
   w==;
X-CSE-ConnectionGUID: noSZuDAHROeaslEz3aKmnQ==
X-CSE-MsgGUID: uJzGxisSTzWSxV69h0p2yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100648679"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100648679"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 03:48:59 -0700
X-CSE-ConnectionGUID: K3TfPCMtTcuyc03LMAOHwA==
X-CSE-MsgGUID: OPhJ61l2SJO4v5sS2tdlTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="275119188"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 03:48:58 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4cKt-000000001iD-3yqk;
	Thu, 10 Sep 2026 10:48:55 +0000
Date: Thu, 10 Sep 2026 18:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline 12/12]
 drivers/clocksource/timer-pxa.c:174 pxa_timer_common_init() warn: 'irq' from
 request_irq() not released on lines: 168.
Message-ID: <202609101837.SNai98DF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   c9692a371ad73c176aa0f66e06dddd0cec6c20f9
commit: 29df31ae3e8a0152dd8e8c2376816aad2f233473 [12/12] pinctrl: renesas: =
rzg2l: Add SR register cache for PM suspend/resume
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-r071-20260910 (https://download.01.org/0day-ci/arc=
hive/20260910/202609101837.SNai98DF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 29df31ae3e8a ("pinctrl: renesas: rzg2l: Add SR register cache for =
PM suspend/resume")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609101837.SNai98DF-lkp@intel.com/

smatch warnings:
drivers/clocksource/timer-pxa.c:174 pxa_timer_common_init() warn: 'irq' fro=
m request_irq() not released on lines: 168.
drivers/clocksource/timer-pxa.c:208 pxa_timer_dt_init() warn: 'clk' from cl=
k_prepare_enable() not released on lines: 205.

vim +/irq +174 drivers/clocksource/timer-pxa.c

^1da177e4c3f41 arch/arm/mach-pxa/time.c        Linus Torvalds 2005-04-16  1=
45 =20
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
46  static int __init pxa_timer_common_init(int irq, unsigned long clock_ti=
ck_rate)
^1da177e4c3f41 arch/arm/mach-pxa/time.c        Linus Torvalds 2005-04-16  1=
47  {
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
48  	int ret;
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
49 =20
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
50  	timer_writel(0, OIER);
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
51  	timer_writel(OSSR_M0 | OSSR_M1 | OSSR_M2 | OSSR_M3, OSSR);
c80204e5d67d14 arch/arm/mach-pxa/time.c        Sascha Hauer   2006-12-12  1=
52 =20
364ed1e0ab019d arch/arm/mach-pxa/time.c        Stephen Boyd   2013-11-15  1=
53  	sched_clock_register(pxa_read_sched_clock, 32, clock_tick_rate);
6c3a158316598b arch/arm/mach-pxa/time.c        Nicolas Pitre  2007-08-17  1=
54 =20
320ab2b0b1e08e arch/arm/mach-pxa/time.c        Rusty Russell  2008-12-13  1=
55  	ckevt_pxa_osmr0.cpumask =3D cpumask_of(0);
^1da177e4c3f41 arch/arm/mach-pxa/time.c        Linus Torvalds 2005-04-16  1=
56 =20
cc2550b421aa30 drivers/clocksource/timer-pxa.c afzal mohammed 2020-02-27  1=
57  	ret =3D request_irq(irq, pxa_ost0_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
cc2550b421aa30 drivers/clocksource/timer-pxa.c afzal mohammed 2020-02-27  1=
58  			  "ost0", &ckevt_pxa_osmr0);
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
59  	if (ret) {
ac9ce6d1a0cc29 drivers/clocksource/pxa_timer.c Rafa=C5=82 Mi=C5=82ecki  201=
7-03-09  160  		pr_err("Failed to setup irq\n");
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
61  		return ret;
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
62  	}
5c53ff088cb76d arch/arm/mach-pxa/time.c        Nicolas Pitre  2005-09-01  1=
63 =20
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
64  	ret =3D clocksource_mmio_init(timer_base + OSCR, "oscr0", clock_tick_r=
ate, 200,
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
65  				    32, clocksource_mmio_readl_up);
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
66  	if (ret) {
ac9ce6d1a0cc29 drivers/clocksource/pxa_timer.c Rafa=C5=82 Mi=C5=82ecki  201=
7-03-09  167  		pr_err("Failed to init clocksource\n");
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
68  		return ret;
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
69  	}
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
70 =20
8d84981e395850 arch/arm/mach-pxa/time.c        Olof Johansson 2013-01-14  1=
71  	clockevents_config_and_register(&ckevt_pxa_osmr0, clock_tick_rate,
8d84981e395850 arch/arm/mach-pxa/time.c        Olof Johansson 2013-01-14  1=
72  					MIN_OSCR_DELTA * 2, 0x7fffffff);
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
73 =20
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06 @1=
74  	return 0;
5c53ff088cb76d arch/arm/mach-pxa/time.c        Nicolas Pitre  2005-09-01  1=
75  }
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
76 =20
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
77  static int __init pxa_timer_dt_init(struct device_node *np)
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
78  {
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
79  	struct clk *clk;
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
80  	int irq, ret;
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
81 =20
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
82  	/* timer registers are shared with watchdog timer */
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
83  	timer_base =3D of_iomap(np, 0);
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
84  	if (!timer_base) {
2a4849d2674b96 drivers/clocksource/pxa_timer.c Rob Herring    2018-08-27  1=
85  		pr_err("%pOFn: unable to map resource\n", np);
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
86  		return -ENXIO;
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
87  	}
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
88 =20
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
89  	clk =3D of_clk_get(np, 0);
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
90  	if (IS_ERR(clk)) {
2a4849d2674b96 drivers/clocksource/pxa_timer.c Rob Herring    2018-08-27  1=
91  		pr_crit("%pOFn: unable to get clk\n", np);
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
92  		return PTR_ERR(clk);
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
93  	}
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
94 =20
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
95  	ret =3D clk_prepare_enable(clk);
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
96  	if (ret) {
ac9ce6d1a0cc29 drivers/clocksource/pxa_timer.c Rafa=C5=82 Mi=C5=82ecki  201=
7-03-09  197  		pr_crit("Failed to prepare clock\n");
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  1=
98  		return ret;
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  1=
99  	}
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  2=
00 =20
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  2=
01  	/* we are only interested in OS-timer0 irq */
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  2=
02  	irq =3D irq_of_parse_and_map(np, 0);
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  2=
03  	if (irq <=3D 0) {
2a4849d2674b96 drivers/clocksource/pxa_timer.c Rob Herring    2018-08-27  2=
04  		pr_crit("%pOFn: unable to parse OS-timer0 irq\n", np);
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06  2=
05  		return -EINVAL;
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  2=
06  	}
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  2=
07 =20
be3aff842d646f drivers/clocksource/pxa_timer.c Daniel Lezcano 2016-06-06 @2=
08  	return pxa_timer_common_init(irq, clk_get_rate(clk));
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  2=
09  }
1727339590fdb5 drivers/clocksource/pxa_timer.c Daniel Lezcano 2017-05-26  2=
10  TIMER_OF_DECLARE(pxa_timer, "marvell,pxa-timer", pxa_timer_dt_init);
ab5354c48d58a6 drivers/clocksource/pxa_timer.c Robert Jarzmik 2014-07-14  2=
11 =20

:::::: The code at line 174 was first introduced by commit
:::::: be3aff842d646f64c1c82e3ee8a0ba14c0319a30 clocksource/drivers/pxa: Co=
nvert init function to return error

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
