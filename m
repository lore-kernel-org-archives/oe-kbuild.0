Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121582;
	b=4Dhg0y6LmI3EmOM/unWw98hSiUuimlCbKlRqhVhES5X08wiHYuO/exr6X3VZCgbLj8Wh
	 lI2U+e8+CBd1HLE2wZq+lYTlw36IcBOOJrpem4pXPdOXn0lGXNHtsB9jxbyg4b/moxq/H
	 SamlcuQxi89utNwUfAeK5TIXi1gWyym8d9h7Y7UmB7Ew2XFvVrbpLeTHG0TL/mNOpF/Hh
	 blIqmK9/PCdpTs3fk8SzUIhOzCwBwKsFYvO00tXnsquvmzfA5+hY0AFH8axfG9MsR9X0u
	 LuKSFkdecEHKghqSiQvXw2U0vmfY0x4bR15X5T0ZEKzV6qce04G2o+PigPd95u0D5TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121582;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cSBHBMB7wUAn2cgHlnv9eILrdNmEdRfeeD8UN8rvP04=;
	b=zSnnC4ERHjGpsJi3f1S3AailBUzztZIJkAtOigLz8K/tfx3Jx75odaGiTe+l+w1nxxdJ
	 c4QcYSxyP3D2aVkF1DQnIXVilPpMltIBhqFnpJAoAJbGDsRVwMoWrMtozB6a6aHAFJukG
	 zmD4FF7wwtTI7h78Xcno5lQBJmV+SXJMBqDXvbvmpEBguxljnYC0lnv+hSKeeLRVcyNsZ
	 3PO7uzEM177OhS7bAKu3Lj/h4PHeM7IbDqnUS5thIZIsM3vofJOTKqfQAZtPnYWorF+lH
	 DSF1kOwb4h9f2peXgAjvskKqMTq3p62eaGHmn7sffYdeqb+7HbiYcbGGu8HVQ1fDGsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UKaZYPS3;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2BF606A902
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 20:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A2BF606A902
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UKaZYPS3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795121583; x=1826657583;
  h=date:from:to:cc:subject:message-id;
  bh=unBx9IJ/RMuDkhJruyj3PaquyXJdYXxyoqmT8n7mV+o=;
  b=UKaZYPS3h7fKEn1+tXmAz55VStORvIgbDv79vpf7FmYpqQlmSw8gpAS7
   znHTA+XeeBnnID1JzYtx1J/yS8lpNZuCj/pTPY+cGQQ95sIR6O2+S19nn
   NCgCwpGDt9Ktw9iWPvq81VbKlk8u6flV6ZOr1TUW/GW9iselvAYyphYlE
   9kh5SN0urCXWEKIwGVEbU/AKLiJhxQZuAFQB4pQsmSI8gCmS4zaK8R0Uw
   pP55/ULX7VzjugLEnh1ydmBzD/+FI51eBVcz6w3sw9pGfS/eQ2OOdRzLd
   rd/OwGMCnfCdwMGO69sq7QXzAfvFyxM2s9J9Je1mYhCMUJUP9fRGrX2ZC
   g==;
X-CSE-ConnectionGUID: tsq2IgB2SoWRbl/hKml7wA==
X-CSE-MsgGUID: i78rIyGBTHKWe+sfXS2/fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3872799"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3872799"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:53:02 -0800
X-CSE-ConnectionGUID: 5c2awDF2SX2EhQN4tKakEw==
X-CSE-MsgGUID: kKkofoldQJWV5OHv+l//0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10817763"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2026 12:53:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU97q-000000003qP-2Byr;
	Thu, 19 Nov 2026 20:52:58 +0000
Date: Thu, 19 Nov 2026 21:52:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-ci:regmap-7.5 15/17]
 drivers/base/regmap/regmap.c:701 regmap_set_lock() warn: 'map->hwlock' is an
 error pointer or valid
Message-ID: <20261119214200.a2XkRRXp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peng Fan <peng.fan@nxp.com>
CC: Mark Brown <broonie@kernel.org>

Hi Peng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regmap-7.5
head:   7ba85f2e968103ae0e96cbf502ef8423110ef678
commit: 25203a86e6c39e5cca7edf107988e0ffcaadfaad [15/17] regmap: factor out regmap_set_lock()
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arm64-randconfig-2200-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119214200.a2XkRRXp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119214200.a2XkRRXp-lkp@intel.com/

smatch warnings:
drivers/base/regmap/regmap.c:701 regmap_set_lock() warn: 'map->hwlock' is an error pointer or valid

vim +701 drivers/base/regmap/regmap.c

d647c199510c2c Xiubo Li            2014-07-15  675  
25203a86e6c39e Peng Fan            2026-11-13  676  /*
25203a86e6c39e Peng Fan            2026-11-13  677   * Select the locking scheme for the map. The fast_io argument tells whether
25203a86e6c39e Peng Fan            2026-11-13  678   * the map has to be usable from atomic context.
25203a86e6c39e Peng Fan            2026-11-13  679   */
25203a86e6c39e Peng Fan            2026-11-13  680  static int regmap_set_lock(struct regmap *map, const struct regmap_config *config,
25203a86e6c39e Peng Fan            2026-11-13  681  			   bool fast_io, struct lock_class_key *lock_key,
3cfe7a74d42b7e Nicolas Boichat     2015-07-08  682  			   const char *lock_name)
b83a313bf25201 Mark Brown          2011-05-11  683  {
c9b41fcf272b49 Bartosz Golaszewski 2017-12-06  684  	if (config->disable_locking) {
81e30b189f593a Bartosz Golaszewski 2017-12-13  685  		map->lock = map->unlock = regmap_lock_unlock_none;
21f8e4828c44da Dmitry Osipenko     2020-09-02  686  		map->can_sleep = config->can_sleep;
72465736adf2aa Mark Brown          2017-12-12  687  		regmap_debugfs_disable(map);
25203a86e6c39e Peng Fan            2026-11-13  688  		return 0;
25203a86e6c39e Peng Fan            2026-11-13  689  	}
25203a86e6c39e Peng Fan            2026-11-13  690  
25203a86e6c39e Peng Fan            2026-11-13  691  	if (config->lock && config->unlock) {
0d4529c534c1c6 Davide Ciminaghi    2012-10-16  692  		map->lock = config->lock;
0d4529c534c1c6 Davide Ciminaghi    2012-10-16  693  		map->unlock = config->unlock;
0d4529c534c1c6 Davide Ciminaghi    2012-10-16  694  		map->lock_arg = config->lock_arg;
21f8e4828c44da Dmitry Osipenko     2020-09-02  695  		map->can_sleep = config->can_sleep;
25203a86e6c39e Peng Fan            2026-11-13  696  		return 0;
8698b9364710e7 Baolin Wang         2017-11-01  697  	}
8698b9364710e7 Baolin Wang         2017-11-01  698  
25203a86e6c39e Peng Fan            2026-11-13  699  	if (config->use_hwlock) {
25203a86e6c39e Peng Fan            2026-11-13  700  		map->hwlock = hwspin_lock_request_specific(config->hwlock_id);
25203a86e6c39e Peng Fan            2026-11-13 @701  		if (!map->hwlock)
25203a86e6c39e Peng Fan            2026-11-13  702  			return -ENXIO;
25203a86e6c39e Peng Fan            2026-11-13  703  
8698b9364710e7 Baolin Wang         2017-11-01  704  		switch (config->hwlock_mode) {
8698b9364710e7 Baolin Wang         2017-11-01  705  		case HWLOCK_IRQSTATE:
8698b9364710e7 Baolin Wang         2017-11-01  706  			map->lock = regmap_lock_hwlock_irqsave;
8698b9364710e7 Baolin Wang         2017-11-01  707  			map->unlock = regmap_unlock_hwlock_irqrestore;
8698b9364710e7 Baolin Wang         2017-11-01  708  			break;
8698b9364710e7 Baolin Wang         2017-11-01  709  		case HWLOCK_IRQ:
8698b9364710e7 Baolin Wang         2017-11-01  710  			map->lock = regmap_lock_hwlock_irq;
8698b9364710e7 Baolin Wang         2017-11-01  711  			map->unlock = regmap_unlock_hwlock_irq;
8698b9364710e7 Baolin Wang         2017-11-01  712  			break;
8698b9364710e7 Baolin Wang         2017-11-01  713  		default:
8698b9364710e7 Baolin Wang         2017-11-01  714  			map->lock = regmap_lock_hwlock;
8698b9364710e7 Baolin Wang         2017-11-01  715  			map->unlock = regmap_unlock_hwlock;
8698b9364710e7 Baolin Wang         2017-11-01  716  			break;
8698b9364710e7 Baolin Wang         2017-11-01  717  		}
8698b9364710e7 Baolin Wang         2017-11-01  718  
8698b9364710e7 Baolin Wang         2017-11-01  719  		map->lock_arg = map;
25203a86e6c39e Peng Fan            2026-11-13  720  		return 0;
25203a86e6c39e Peng Fan            2026-11-13  721  	}
25203a86e6c39e Peng Fan            2026-11-13  722  
edcc17880bf525 Peng Fan            2026-11-13  723  	if (fast_io) {
67021f25d95292 Vladimir Oltean     2021-08-25  724  		if (config->use_raw_spinlock) {
67021f25d95292 Vladimir Oltean     2021-08-25  725  			raw_spin_lock_init(&map->raw_spinlock);
67021f25d95292 Vladimir Oltean     2021-08-25  726  			map->lock = regmap_lock_raw_spinlock;
67021f25d95292 Vladimir Oltean     2021-08-25  727  			map->unlock = regmap_unlock_raw_spinlock;
67021f25d95292 Vladimir Oltean     2021-08-25  728  			lockdep_set_class_and_name(&map->raw_spinlock,
67021f25d95292 Vladimir Oltean     2021-08-25  729  						   lock_key, lock_name);
67021f25d95292 Vladimir Oltean     2021-08-25  730  		} else {
bacdbe077342ec Stephen Warren      2012-04-04  731  			spin_lock_init(&map->spinlock);
bacdbe077342ec Stephen Warren      2012-04-04  732  			map->lock = regmap_lock_spinlock;
bacdbe077342ec Stephen Warren      2012-04-04  733  			map->unlock = regmap_unlock_spinlock;
3cfe7a74d42b7e Nicolas Boichat     2015-07-08  734  			lockdep_set_class_and_name(&map->spinlock,
3cfe7a74d42b7e Nicolas Boichat     2015-07-08  735  						   lock_key, lock_name);
67021f25d95292 Vladimir Oltean     2021-08-25  736  		}
bacdbe077342ec Stephen Warren      2012-04-04  737  	} else {
bacdbe077342ec Stephen Warren      2012-04-04  738  		mutex_init(&map->mutex);
bacdbe077342ec Stephen Warren      2012-04-04  739  		map->lock = regmap_lock_mutex;
bacdbe077342ec Stephen Warren      2012-04-04  740  		map->unlock = regmap_unlock_mutex;
21f8e4828c44da Dmitry Osipenko     2020-09-02  741  		map->can_sleep = true;
25203a86e6c39e Peng Fan            2026-11-13  742  		lockdep_set_class_and_name(&map->mutex, lock_key, lock_name);
bacdbe077342ec Stephen Warren      2012-04-04  743  	}
25203a86e6c39e Peng Fan            2026-11-13  744  
0d4529c534c1c6 Davide Ciminaghi    2012-10-16  745  	map->lock_arg = map;
1ed9b927e7dd8b Cristian Ciocaltea  2024-10-31  746  	map->lock_key = lock_key;
25203a86e6c39e Peng Fan            2026-11-13  747  
25203a86e6c39e Peng Fan            2026-11-13  748  	return 0;
0d4529c534c1c6 Davide Ciminaghi    2012-10-16  749  }
b4a21fc275e99f Stephen Boyd        2015-09-11  750  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
