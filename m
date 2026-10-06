Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B4D2D3ED1
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 03:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258445; cv=none; b=iwZnYDkEhCuV9r4bxVwl20shPhikh9TKpYVH7C5UZBfd5bw/b0A+4fUrviobyRH/rpIddfDJOkVPxppxY2zJndZyJ/8zCc2t8RYH10ZFc2z1aXPQJqSjrijF2DzZiC0VkRsRPKJNgEUbyote+qYQu1Hpkix7KPQwFTNFzRpu4No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258445; c=relaxed/simple;
	bh=MofLGUzpZcOcol+h5AThVAfJ+UnMX5TGHQHHCj8nlYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DcSa01NhQdvMZ4/3WYKSAYD3F54WroTkCP6WDmCw3hLiPqvnyhB2EjLcpe4sDm+N4F+VDdG8dSWgA8x8YN7NqZfvradVGnjDPk3QUaJNdrwxXg3rGbXBMUN8E9W7t4MGo31b2iAmZhehZAuWBnLr7n0KUBLkZ8eRa12RhlCd6LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+y6V/+b; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+y6V/+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791258443; x=1822794443;
  h=date:from:to:cc:subject:message-id;
  bh=MofLGUzpZcOcol+h5AThVAfJ+UnMX5TGHQHHCj8nlYo=;
  b=F+y6V/+bIX+wmSTZV/F1sSDk5Si9j7fDlp6Q9FgLFixC+flsn+dT9+Qd
   DRhpqkAWOnR5JGkfWf9cohywIcTkOXRBFO1TVu1xZY1p5fuEAEoWA/Ej2
   aLgqVkpXiSXXFjTySshXwy+Lr3DgZ3M7qhN+IuR/KZTLCj44Gk1OVax07
   cLdmr0eYX5J1CwAa6OUMg3XxLsfUmoaYpLujqyIqKf8n617Elsb/ouAb2
   3ryhgAIslVe7QtI83quLap4SK9V2CvIos0WPX1z64ReMAYtbdnTre8e1o
   D5Jm+Bo4E8oFWCO/guWb6PZKO49OM+DLyb6TwODD03zomXTthas+Li82z
   Q==;
X-CSE-ConnectionGUID: Yi6zy42AR5ys+CiKXn7vtg==
X-CSE-MsgGUID: j68Yz3OQSLG/UTsdNunKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="103308412"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="103308412"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 20:47:23 -0700
X-CSE-ConnectionGUID: Khyzpa9HRciYrdNfkyDsTw==
X-CSE-MsgGUID: kyXLodxoRq+WEijM7SNXdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303283867"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Oct 2026 20:47:21 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDw99-000000000fn-1bU1;
	Tue, 06 Oct 2026 03:47:19 +0000
Date: Tue, 06 Oct 2026 05:47:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/macsmc-power.c:322:20-21: WARNING
 opportunity for min()
Message-ID: <202610060538.UmT4sXA7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hector Martin <marcan@marcan.st>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Joey Gouly <joey.gouly@arm.com>
CC: Janne Grunau <j@jannau.net>
CC: Neal Gompa <neal@gompa.dev>
CC: Sven Peter <sven@kernel.org>
CC: Michael Reeves <michael.reeves077@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67f0943b394d920b6c142aad8c6af94340342ae7
commit: 0ebf821cf6c75de2d95d3db277617ec685498e7c power: supply: Add macsmc-power driver for Apple Silicon
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: sparc64-randconfig-r2106-20261005 (https://download.01.org/0day-ci/archive/20261006/202610060538.UmT4sXA7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0ebf821cf6c7 ("power: supply: Add macsmc-power driver for Apple Silicon")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610060538.UmT4sXA7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/power/supply/macsmc-power.c:322:20-21: WARNING opportunity for min()
   drivers/power/supply/macsmc-power.c:329:20-21: WARNING opportunity for min()
   drivers/power/supply/macsmc-power.c:345:20-21: WARNING opportunity for min()

vim +322 drivers/power/supply/macsmc-power.c

0ebf821cf6c75d Hector Martin 2026-02-17  305  
0ebf821cf6c75d Hector Martin 2026-02-17  306  static int macsmc_battery_get_property(struct power_supply *psy,
0ebf821cf6c75d Hector Martin 2026-02-17  307  				       enum power_supply_property psp,
0ebf821cf6c75d Hector Martin 2026-02-17  308  				       union power_supply_propval *val)
0ebf821cf6c75d Hector Martin 2026-02-17  309  {
0ebf821cf6c75d Hector Martin 2026-02-17  310  	struct macsmc_power *power = power_supply_get_drvdata(psy);
0ebf821cf6c75d Hector Martin 2026-02-17  311  	int ret = 0;
0ebf821cf6c75d Hector Martin 2026-02-17  312  	u8 vu8;
0ebf821cf6c75d Hector Martin 2026-02-17  313  	u16 vu16;
0ebf821cf6c75d Hector Martin 2026-02-17  314  	s16 vs16;
0ebf821cf6c75d Hector Martin 2026-02-17  315  	s32 vs32;
0ebf821cf6c75d Hector Martin 2026-02-17  316  	s64 vs64;
0ebf821cf6c75d Hector Martin 2026-02-17  317  	bool flag;
0ebf821cf6c75d Hector Martin 2026-02-17  318  
0ebf821cf6c75d Hector Martin 2026-02-17  319  	switch (psp) {
0ebf821cf6c75d Hector Martin 2026-02-17  320  	case POWER_SUPPLY_PROP_STATUS:
0ebf821cf6c75d Hector Martin 2026-02-17  321  		val->intval = macsmc_battery_get_status(power);
0ebf821cf6c75d Hector Martin 2026-02-17 @322  		ret = val->intval < 0 ? val->intval : 0;
0ebf821cf6c75d Hector Martin 2026-02-17  323  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  324  	case POWER_SUPPLY_PROP_PRESENT:
0ebf821cf6c75d Hector Martin 2026-02-17  325  		val->intval = 1;
0ebf821cf6c75d Hector Martin 2026-02-17  326  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  327  	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
0ebf821cf6c75d Hector Martin 2026-02-17  328  		val->intval = macsmc_battery_get_charge_behaviour(power);
0ebf821cf6c75d Hector Martin 2026-02-17  329  		ret = val->intval < 0 ? val->intval : 0;
0ebf821cf6c75d Hector Martin 2026-02-17  330  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  331  	case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
0ebf821cf6c75d Hector Martin 2026-02-17  332  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0TE), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  333  		val->intval = vu16 == 0xffff ? 0 : vu16 * 60;
0ebf821cf6c75d Hector Martin 2026-02-17  334  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  335  	case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
0ebf821cf6c75d Hector Martin 2026-02-17  336  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0TF), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  337  		val->intval = vu16 == 0xffff ? 0 : vu16 * 60;
0ebf821cf6c75d Hector Martin 2026-02-17  338  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  339  	case POWER_SUPPLY_PROP_CAPACITY:
0ebf821cf6c75d Hector Martin 2026-02-17  340  		ret = apple_smc_read_u8(power->smc, SMC_KEY(BUIC), &vu8);
0ebf821cf6c75d Hector Martin 2026-02-17  341  		val->intval = vu8;
0ebf821cf6c75d Hector Martin 2026-02-17  342  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  343  	case POWER_SUPPLY_PROP_CAPACITY_LEVEL:
0ebf821cf6c75d Hector Martin 2026-02-17  344  		val->intval = macsmc_battery_get_capacity_level(power);
0ebf821cf6c75d Hector Martin 2026-02-17  345  		ret = val->intval < 0 ? val->intval : 0;
0ebf821cf6c75d Hector Martin 2026-02-17  346  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  347  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
0ebf821cf6c75d Hector Martin 2026-02-17  348  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0AV), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  349  		val->intval = vu16 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  350  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  351  	case POWER_SUPPLY_PROP_CURRENT_NOW:
0ebf821cf6c75d Hector Martin 2026-02-17  352  		ret = apple_smc_read_s16(power->smc, SMC_KEY(B0AC), &vs16);
0ebf821cf6c75d Hector Martin 2026-02-17  353  		val->intval = vs16 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  354  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  355  	case POWER_SUPPLY_PROP_POWER_NOW:
0ebf821cf6c75d Hector Martin 2026-02-17  356  		ret = apple_smc_read_s32(power->smc, SMC_KEY(B0AP), &vs32);
0ebf821cf6c75d Hector Martin 2026-02-17  357  		val->intval = vs32 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  358  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  359  	case POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN:
0ebf821cf6c75d Hector Martin 2026-02-17  360  		ret = apple_smc_read_u16(power->smc, SMC_KEY(BITV), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  361  		val->intval = vu16 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  362  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  363  	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
0ebf821cf6c75d Hector Martin 2026-02-17  364  		/* Calculate total max design voltage from per-cell maximum voltage */
0ebf821cf6c75d Hector Martin 2026-02-17  365  		ret = apple_smc_read_u16(power->smc, SMC_KEY(BVVN), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  366  		val->intval = vu16 * 1000 * power->num_cells;
0ebf821cf6c75d Hector Martin 2026-02-17  367  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  368  	case POWER_SUPPLY_PROP_VOLTAGE_MIN:
0ebf821cf6c75d Hector Martin 2026-02-17  369  		/* Lifetime min */
0ebf821cf6c75d Hector Martin 2026-02-17  370  		ret = apple_smc_read_s16(power->smc, SMC_KEY(BLPM), &vs16);
0ebf821cf6c75d Hector Martin 2026-02-17  371  		val->intval = vs16 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  372  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  373  	case POWER_SUPPLY_PROP_VOLTAGE_MAX:
0ebf821cf6c75d Hector Martin 2026-02-17  374  		/* Lifetime max */
0ebf821cf6c75d Hector Martin 2026-02-17  375  		ret = apple_smc_read_s16(power->smc, SMC_KEY(BLPX), &vs16);
0ebf821cf6c75d Hector Martin 2026-02-17  376  		val->intval = vs16 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  377  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  378  	case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
0ebf821cf6c75d Hector Martin 2026-02-17  379  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0RC), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  380  		val->intval = vu16 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  381  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  382  	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
0ebf821cf6c75d Hector Martin 2026-02-17  383  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0RI), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  384  		val->intval = vu16 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  385  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  386  	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
0ebf821cf6c75d Hector Martin 2026-02-17  387  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0RV), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  388  		val->intval = vu16 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  389  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  390  	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
0ebf821cf6c75d Hector Martin 2026-02-17  391  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0DC), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  392  		val->intval = vu16 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  393  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  394  	case POWER_SUPPLY_PROP_CHARGE_FULL:
0ebf821cf6c75d Hector Martin 2026-02-17  395  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0FC), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  396  		val->intval = vu16 * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  397  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  398  	case POWER_SUPPLY_PROP_CHARGE_NOW:
0ebf821cf6c75d Hector Martin 2026-02-17  399  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0RM), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  400  		/* B0RM is Big Endian, likely pass through from TI gas gauge */
0ebf821cf6c75d Hector Martin 2026-02-17  401  		val->intval = (s16)swab16(vu16) * 1000;
0ebf821cf6c75d Hector Martin 2026-02-17  402  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  403  	case POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN:
0ebf821cf6c75d Hector Martin 2026-02-17  404  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0DC), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  405  		val->intval = vu16 * power->nominal_voltage_mv;
0ebf821cf6c75d Hector Martin 2026-02-17  406  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  407  	case POWER_SUPPLY_PROP_ENERGY_FULL:
0ebf821cf6c75d Hector Martin 2026-02-17  408  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0FC), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  409  		val->intval = vu16 * power->nominal_voltage_mv;
0ebf821cf6c75d Hector Martin 2026-02-17  410  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  411  	case POWER_SUPPLY_PROP_ENERGY_NOW:
0ebf821cf6c75d Hector Martin 2026-02-17  412  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0RM), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  413  		/* B0RM is Big Endian, likely pass through from TI gas gauge */
0ebf821cf6c75d Hector Martin 2026-02-17  414  		val->intval = (s16)swab16(vu16) * power->nominal_voltage_mv;
0ebf821cf6c75d Hector Martin 2026-02-17  415  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  416  	case POWER_SUPPLY_PROP_TEMP:
0ebf821cf6c75d Hector Martin 2026-02-17  417  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0AT), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  418  		val->intval = vu16 - 2732; /* Kelvin x10 to Celsius x10 */
0ebf821cf6c75d Hector Martin 2026-02-17  419  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  420  	case POWER_SUPPLY_PROP_CHARGE_COUNTER:
0ebf821cf6c75d Hector Martin 2026-02-17  421  		ret = apple_smc_read_s64(power->smc, SMC_KEY(BAAC), &vs64);
0ebf821cf6c75d Hector Martin 2026-02-17  422  		val->intval = vs64;
0ebf821cf6c75d Hector Martin 2026-02-17  423  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  424  	case POWER_SUPPLY_PROP_CYCLE_COUNT:
0ebf821cf6c75d Hector Martin 2026-02-17  425  		ret = apple_smc_read_u16(power->smc, SMC_KEY(B0CT), &vu16);
0ebf821cf6c75d Hector Martin 2026-02-17  426  		val->intval = vu16;
0ebf821cf6c75d Hector Martin 2026-02-17  427  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  428  	case POWER_SUPPLY_PROP_SCOPE:
0ebf821cf6c75d Hector Martin 2026-02-17  429  		val->intval = POWER_SUPPLY_SCOPE_SYSTEM;
0ebf821cf6c75d Hector Martin 2026-02-17  430  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  431  	case POWER_SUPPLY_PROP_HEALTH:
0ebf821cf6c75d Hector Martin 2026-02-17  432  		flag = false;
0ebf821cf6c75d Hector Martin 2026-02-17  433  		ret = apple_smc_read_flag(power->smc, SMC_KEY(BBAD), &flag);
0ebf821cf6c75d Hector Martin 2026-02-17  434  		val->intval = flag ? POWER_SUPPLY_HEALTH_DEAD : POWER_SUPPLY_HEALTH_GOOD;
0ebf821cf6c75d Hector Martin 2026-02-17  435  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  436  	case POWER_SUPPLY_PROP_MODEL_NAME:
0ebf821cf6c75d Hector Martin 2026-02-17  437  		val->strval = power->model_name;
0ebf821cf6c75d Hector Martin 2026-02-17  438  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  439  	case POWER_SUPPLY_PROP_SERIAL_NUMBER:
0ebf821cf6c75d Hector Martin 2026-02-17  440  		val->strval = power->serial_number;
0ebf821cf6c75d Hector Martin 2026-02-17  441  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  442  	case POWER_SUPPLY_PROP_MANUFACTURE_YEAR:
0ebf821cf6c75d Hector Martin 2026-02-17  443  		ret = macsmc_battery_get_date(&power->mfg_date[0], &val->intval);
0ebf821cf6c75d Hector Martin 2026-02-17  444  		/* The SMC reports the manufacture year as an offset from 1992. */
0ebf821cf6c75d Hector Martin 2026-02-17  445  		val->intval += 1992;
0ebf821cf6c75d Hector Martin 2026-02-17  446  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  447  	case POWER_SUPPLY_PROP_MANUFACTURE_MONTH:
0ebf821cf6c75d Hector Martin 2026-02-17  448  		ret = macsmc_battery_get_date(&power->mfg_date[2], &val->intval);
0ebf821cf6c75d Hector Martin 2026-02-17  449  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  450  	case POWER_SUPPLY_PROP_MANUFACTURE_DAY:
0ebf821cf6c75d Hector Martin 2026-02-17  451  		ret = macsmc_battery_get_date(&power->mfg_date[4], &val->intval);
0ebf821cf6c75d Hector Martin 2026-02-17  452  		break;
0ebf821cf6c75d Hector Martin 2026-02-17  453  	default:
0ebf821cf6c75d Hector Martin 2026-02-17  454  		return -EINVAL;
0ebf821cf6c75d Hector Martin 2026-02-17  455  	}
0ebf821cf6c75d Hector Martin 2026-02-17  456  
0ebf821cf6c75d Hector Martin 2026-02-17  457  	return ret;
0ebf821cf6c75d Hector Martin 2026-02-17  458  }
0ebf821cf6c75d Hector Martin 2026-02-17  459  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
