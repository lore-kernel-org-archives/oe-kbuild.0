Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AD649DBB9
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Sep 2026 23:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688412; cv=none; b=LsY9pU2ZLobFpv/QV1tJz3lQCtML5dJeiFUnbu1DUVdYK0k2z/rvTULpPahOHbxxwHpT66CYJqadjvWj/RVQ7biQMIsPo9GqrmvW7q+ZWJMyVzkBoDeoaRn5kj0gIj+B/rlvFmn+9Nl9she3zYiDxtJTKlVlBPAyPSC3szXzDoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688412; c=relaxed/simple;
	bh=0Z0NzYbyTwl3gspf11hishlPv7rCCXuvmB4/70uV1jU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XQI5PQzxBZhJjf9a5hRTa8McD4bZo90wb0PqFDrJPUrFzlgf6XIF/cCZFmmedZjnfvwWr+HGR5PD0sG1wfe1iLrm2r9VylXxjOkXS2vkUQYc2ijjaWNaQn6S4LDnZBOt4WdBUNeRwhQjxgHfdGbtqIgdT5RwcyjkjXQlz4RXZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEoaL/zj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEoaL/zj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789688409; x=1821224409;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0Z0NzYbyTwl3gspf11hishlPv7rCCXuvmB4/70uV1jU=;
  b=jEoaL/zjn8oSc7j96c4aSS1SPL2M3SKYN7nRdJZspQLCiSTu3iKmCi4N
   5AGNdyXrAxPTSEghFwS4yXbCgFezu2Tev+kEIUoGVvi/iq6cLBt9gOAxo
   TWiDUW8WE5v0olKgRPmwAnZurbIeECdMWUDRtnMLaZNAL/CT1ZX8ZlqLm
   GPIqy0Ce7xnw8bd3tvd1SxMRSLhEgQ0ZkVY/GKyyTk94hV80dyMHfXwIS
   PdFCJKWKwf1/pdECnzJ02FTXduLuvy9NkIKPWE2FWIC91lT4UYUuKgCya
   0yeiDDmxy0erM4i4q+g/d1OxRCH/2f5A2P6XkeoWZL93NJfEw6+xk7T8A
   A==;
X-CSE-ConnectionGUID: /CX+iw3nTpifRcCQQZtHVQ==
X-CSE-MsgGUID: YrYzpKRDTc20dcVgImh3TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100825047"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100825047"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 16:40:07 -0700
X-CSE-ConnectionGUID: BT7/AebRQ7OQuNsjQSDisQ==
X-CSE-MsgGUID: Q8xGhduzRxSAwAnFQJWCUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269799335"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2026 16:40:06 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Lhz-000000000pU-35w9;
	Thu, 17 Sep 2026 23:40:03 +0000
Date: Fri, 18 Sep 2026 01:39:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 145/442]
 drivers/clocksource/timer-atmel-pit.c:261 at91sam926x_pit_dt_init() warn:
 'data->base' from of_iomap() not released on lines: 261.
Message-ID: <202609180141.f7T3i9rI-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Dave Hansen <dave.hansen@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Suren Baghdasaryan <surenb@google.com>
CC: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unst=
able
head:   1ed9cdd724d46119dd9adf0ffba2f2daaa3335ef
commit: 0a38714e70e5538324eac0dce6dfb1b7dc87a9f2 [145/442] mm: make per-VMA=
 locks available universally
:::::: branch date: 17 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-r073-20260915 (https://download.01.org/0day-ci/arc=
hive/20260918/202609180141.f7T3i9rI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9e7=
0d8f070ba046b8e09388fa84b3a65eb2073e3)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609180141.f7T3i9rI-lkp@intel.com/

smatch warnings:
drivers/clocksource/timer-atmel-pit.c:261 at91sam926x_pit_dt_init() warn: '=
data->base' from of_iomap() not released on lines: 261.
drivers/clocksource/timer-atmel-pit.c:261 at91sam926x_pit_dt_init() warn: '=
data->mck' from clk_prepare_enable() not released on lines: 261.

vim +261 drivers/clocksource/timer-atmel-pit.c

ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  162 =20
1a0ed732afdbd4 arch/arm/mach-at91rm9200/at91sam926x_time.c Andrew Victor   =
  2006-12-01  163  /*
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  164   * Set up both clocksource and clockevent support.
1a0ed732afdbd4 arch/arm/mach-at91rm9200/at91sam926x_time.c Andrew Victor   =
  2006-12-01  165   */
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  166  static int __init at91sam926x_pit_dt_init(struct device_=
node *node)
1a0ed732afdbd4 arch/arm/mach-at91rm9200/at91sam926x_time.c Andrew Victor   =
  2006-12-01  167  {
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  168  	unsigned long   pit_rate;
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  169  	unsigned        bits;
986c265729cb79 arch/arm/mach-at91/at91sam926x_time.c       Nicolas Ferre   =
  2012-02-17  170  	int             ret;
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  171  	struct pit_data *data;
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  172 =20
bf4afc53b77aea drivers/clocksource/timer-atmel-pit.c       Linus Torvalds  =
  2026-02-21  173  	data =3D kzalloc_obj(*data);
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  174  	if (!data)
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  175  		return -ENOMEM;
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  176 =20
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  177  	data->base =3D of_iomap(node, 0);
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  178  	if (!data->base) {
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  179  		pr_err("Could not map PIT address\n");
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  180  		ret =3D -ENXIO;
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  181  		goto exit;
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  182  	}
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  183 =20
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  184  	data->mck =3D of_clk_get(node, 0);
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  185  	if (IS_ERR(data->mck)) {
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  186  		pr_err("Unable to get mck clk\n");
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  187  		ret =3D PTR_ERR(data->mck);
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  188  		goto exit;
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  189  	}
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  190 =20
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  191  	ret =3D clk_prepare_enable(data->mck);
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  192  	if (ret) {
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  193  		pr_err("Unable to enable mck\n");
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  194  		goto exit;
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  195  	}
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  196 =20
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  197  	/* Get the interrupts property */
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  198  	data->irq =3D irq_of_parse_and_map(node, 0);
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  199  	if (!data->irq) {
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  200  		pr_err("Unable to get IRQ from DT\n");
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  201  		ret =3D -EINVAL;
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  202  		goto exit;
a17686c462441a drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2016-09-09  203  	}
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  204 =20
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  205  	/*
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  206  	 * Use our actual MCK to figure out how many MCK/16 tic=
ks per
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  207  	 * 1/HZ period (instead of a compile-time constant LATC=
H).
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  208  	 */
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  209  	pit_rate =3D clk_get_rate(data->mck) / 16;
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  210  	data->cycle =3D DIV_ROUND_CLOSEST(pit_rate, HZ);
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  211  	WARN_ON(((data->cycle - 1) & ~AT91_PIT_PIV) !=3D 0);
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  212 =20
1a0ed732afdbd4 arch/arm/mach-at91rm9200/at91sam926x_time.c Andrew Victor   =
  2006-12-01  213  	/* Initialize and enable the timer */
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  214  	at91sam926x_pit_reset(data);
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  215 =20
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  216  	/*
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  217  	 * Register clocksource.  The high order bits of PIV ar=
e unused,
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  218  	 * so this isn't a 32-bit counter unless we get clockev=
ent irqs.
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  219  	 */
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  220  	bits =3D 12 /* PICNT */ + ilog2(data->cycle) /* PIV */;
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  221  	data->clksrc.mask =3D CLOCKSOURCE_MASK(bits);
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  222  	data->clksrc.name =3D "pit";
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  223  	data->clksrc.rating =3D 175;
005e56272b2819 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2015-08-04  224  	data->clksrc.read =3D read_pit_clk;
005e56272b2819 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2015-08-04  225  	data->clksrc.flags =3D CLOCK_SOURCE_IS_CONTINUOUS;
504f34c9e45cf8 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2016-06-06  226  =09
504f34c9e45cf8 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2016-06-06  227  	ret =3D clocksource_register_hz(&data->clksrc, pit_rate=
);
504f34c9e45cf8 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2016-06-06  228  	if (ret) {
ac9ce6d1a0cc29 drivers/clocksource/timer-atmel-pit.c       Rafa=C5=82 Mi=C5=
=82ecki     2017-03-09  229  		pr_err("Failed to register clocksource\n");
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  230  		goto exit;
504f34c9e45cf8 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2016-06-06  231  	}
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  232 =20
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  233  	/* Set up irq handler */
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  234  	ret =3D request_irq(data->irq, at91sam926x_pit_interrup=
t,
7f282e0137bfe7 arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  235  			  IRQF_SHARED | IRQF_TIMER | IRQF_IRQPOLL,
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  236  			  "at91_tick", data);
504f34c9e45cf8 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2016-06-06  237  	if (ret) {
504f34c9e45cf8 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2016-06-06  238  		pr_err("Unable to setup IRQ\n");
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  239  		clocksource_unregister(&data->clksrc);
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  240  		goto exit;
504f34c9e45cf8 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2016-06-06  241  	}
1a0ed732afdbd4 arch/arm/mach-at91rm9200/at91sam926x_time.c Andrew Victor   =
  2006-12-01  242 =20
ad48ce74f70a20 arch/arm/mach-at91/at91sam926x_time.c       Andrew Victor   =
  2008-04-16  243  	/* Set up and register clockevents */
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  244  	data->clkevt.name =3D "pit";
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  245  	data->clkevt.features =3D CLOCK_EVT_FEAT_PERIODIC;
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  246  	data->clkevt.shift =3D 32;
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  247  	data->clkevt.mult =3D div_sc(pit_rate, NSEC_PER_SEC, da=
ta->clkevt.shift);
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  248  	data->clkevt.rating =3D 100;
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  249  	data->clkevt.cpumask =3D cpumask_of(0);
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  250 =20
85250fb89be379 drivers/clocksource/timer-atmel-pit.c       Viresh Kumar    =
  2015-06-18  251  	data->clkevt.set_state_shutdown =3D pit_clkevt_shutdown;
85250fb89be379 drivers/clocksource/timer-atmel-pit.c       Viresh Kumar    =
  2015-06-18  252  	data->clkevt.set_state_periodic =3D pit_clkevt_set_peri=
odic;
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  253  	data->clkevt.resume =3D at91sam926x_pit_resume;
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  254  	data->clkevt.suspend =3D at91sam926x_pit_suspend;
64568d1dbd673a arch/arm/mach-at91/at91sam926x_time.c       Maxime Ripard   =
  2014-07-01  255  	clockevents_register_device(&data->clkevt);
504f34c9e45cf8 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2016-06-06  256 =20
504f34c9e45cf8 drivers/clocksource/timer-atmel-pit.c       Daniel Lezcano  =
  2016-06-06  257  	return 0;
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  258 =20
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  259  exit:
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25  260  	kfree(data);
52bf4a900d9ced drivers/clocksource/timer-atmel-pit.c       Alexandre Bellon=
i 2018-04-25 @261  	return ret;

:::::: The code at line 261 was first introduced by commit
:::::: 52bf4a900d9cede3eb14982d0f2c5e6db6d97cc3 clocksource/drivers/timer-a=
tmel-pit: Properly handle error cases

:::::: TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
