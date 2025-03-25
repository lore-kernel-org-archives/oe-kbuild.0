Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953EF136358
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Mar 2025 04:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742878122; cv=none; b=JnXK2sd1COx1x+E9mz3vOg8Oq4DdMult5mJ6NQhlCSTMEYV9ujMXpD3i5NqwbhejDWdc1gyIA5xVKxn3YCwiSVrALLpK2pkSedzjI3ac89B8sEETt7zWkfER5pmqAzzDhvtUImulUF5TCv43V2eUKxG7QOL9te8U4PDX32ZCdTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742878122; c=relaxed/simple;
	bh=eZo0Xekq6V32tPcVXrCTdZfySuQDokYR42LPsb3eyfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=azj/1ax9W1GqmzHCRAfpuYpE/5BWLD3to4crmO7r9BtfU3sJ6xq69z9C42imQgCmnLTXYOuertmBXPcFXdqYLpbfBAdYqx4TxdmjK74mu+wrMzqo67ZkmRjIHIRKMI4a+c28dFKPN1mXovs0ka7NCDATUpRhQW+L3ESzeux4kw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLPUD0P7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLPUD0P7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742878120; x=1774414120;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eZo0Xekq6V32tPcVXrCTdZfySuQDokYR42LPsb3eyfM=;
  b=YLPUD0P7gsH1G0nnBHYeSDskwi2yzTzSz/CuzDHVjH+IQX/EkSue02uK
   lRzyIQNorZDLdHecbwESiB+eWeVmOLGpg0efO+MLG5T3QhyVHNCNbslYX
   MJ/QsLfn4q8xfPpzLmwl5pN0V5aZOQD8YUrwElyGTwOi/is5ZeIPX8qCO
   YJfU0DOS7t6ng6QN7+1uuKwHu8UPH2/Hbz/NSJ9SPGxplX4Ps2P0+Ope0
   AEutQ3UGJB0mm6pjlt/sWfAbTktlLQzJAFtIpLwSizF0gqTt6yN0ewMl/
   glBI2yXIP7AEFm6XadvNOE8lzFXYaNEEQ4X/PUNYeStonInVF72WX7rcS
   w==;
X-CSE-ConnectionGUID: +vx3eJ8QRLKB7//C7mrY9w==
X-CSE-MsgGUID: 6hdehk0ZSImgAEjAHnQrcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="69467980"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="69467980"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 21:48:40 -0700
X-CSE-ConnectionGUID: a+Jxxqg/QQu00dtbo8SNXQ==
X-CSE-MsgGUID: iVReOQqYRKSur/r938KS1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="128942356"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2025 21:48:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twwDM-00049B-27;
	Tue, 25 Mar 2025 04:48:36 +0000
Date: Tue, 25 Mar 2025 12:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/cpufreq/armada-37xx-cpufreq.c:272:23-24: WARNING opportunity
 for max()
Message-ID: <202503251256.rrl65HgY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcb044256d3f5d9f5bb61d1eac6492f77883bd60
commit: 81746019b9fbb9fbf7c522dcbeefb572ac0f9458 cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-r063-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251256.rrl65HgY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503251256.rrl65HgY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/cpufreq/armada-37xx-cpufreq.c:272:23-24: WARNING opportunity for max()
   drivers/cpufreq/armada-37xx-cpufreq.c:280:23-24: WARNING opportunity for max()

vim +272 drivers/cpufreq/armada-37xx-cpufreq.c

1c3528232f4ba6 Gregory CLEMENT 2018-06-19  207  
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  208  /*
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  209   * For Armada 37xx soc, L0(VSET0) VDD AVS value is set to SVC revision
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  210   * value or a default value when SVC is not supported.
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  211   * - L0 can be read out from the register of AVS_CTRL_0 and L0 voltage
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  212   *   can be got from the mapping table of avs_map.
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  213   * - L1 voltage should be about 100mv smaller than L0 voltage
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  214   * - L2 & L3 voltage should be about 150mv smaller than L0 voltage.
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  215   * This function calculates L1 & L2 & L3 AVS values dynamically based
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  216   * on L0 voltage and fill all AVS values to the AVS value table.
d118ac2062b5b8 Pali Rohár      2021-04-08  217   * When base CPU frequency is 1000 or 1200 MHz then there is additional
d118ac2062b5b8 Pali Rohár      2021-04-08  218   * minimal avs value for load L1.
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  219   */
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  220  static void __init armada37xx_cpufreq_avs_configure(struct regmap *base,
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  221  						struct armada_37xx_dvfs *dvfs)
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  222  {
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  223  	unsigned int target_vm;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  224  	int load_level = 0;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  225  	u32 l0_vdd_min;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  226  
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  227  	if (base == NULL)
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  228  		return;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  229  
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  230  	/* Get L0 VDD min value */
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  231  	regmap_read(base, ARMADA_37XX_AVS_CTL0, &l0_vdd_min);
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  232  	l0_vdd_min = (l0_vdd_min >> ARMADA_37XX_AVS_LOW_VDD_LIMIT) &
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  233  		ARMADA_37XX_AVS_VDD_MASK;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  234  	if (l0_vdd_min >= ARRAY_SIZE(avs_map))  {
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  235  		pr_err("L0 VDD MIN %d is not correct.\n", l0_vdd_min);
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  236  		return;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  237  	}
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  238  	dvfs->avs[0] = l0_vdd_min;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  239  
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  240  	if (avs_map[l0_vdd_min] <= MIN_VOLT_MV) {
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  241  		/*
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  242  		 * If L0 voltage is smaller than 1000mv, then all VDD sets
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  243  		 * use L0 voltage;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  244  		 */
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  245  		u32 avs_min = armada_37xx_avs_val_match(MIN_VOLT_MV);
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  246  
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  247  		for (load_level = 1; load_level < LOAD_LEVEL_NR; load_level++)
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  248  			dvfs->avs[load_level] = avs_min;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  249  
d118ac2062b5b8 Pali Rohár      2021-04-08  250  		/*
d118ac2062b5b8 Pali Rohár      2021-04-08  251  		 * Set the avs values for load L0 and L1 when base CPU frequency
d118ac2062b5b8 Pali Rohár      2021-04-08  252  		 * is 1000/1200 MHz to its typical initial values according to
d118ac2062b5b8 Pali Rohár      2021-04-08  253  		 * the Armada 3700 Hardware Specifications.
d118ac2062b5b8 Pali Rohár      2021-04-08  254  		 */
d118ac2062b5b8 Pali Rohár      2021-04-08  255  		if (dvfs->cpu_freq_max >= 1000*1000*1000) {
d118ac2062b5b8 Pali Rohár      2021-04-08  256  			if (dvfs->cpu_freq_max >= 1200*1000*1000)
d118ac2062b5b8 Pali Rohár      2021-04-08  257  				avs_min = armada_37xx_avs_val_match(MIN_VOLT_MV_FOR_L1_1200MHZ);
d118ac2062b5b8 Pali Rohár      2021-04-08  258  			else
d118ac2062b5b8 Pali Rohár      2021-04-08  259  				avs_min = armada_37xx_avs_val_match(MIN_VOLT_MV_FOR_L1_1000MHZ);
d118ac2062b5b8 Pali Rohár      2021-04-08  260  			dvfs->avs[0] = dvfs->avs[1] = avs_min;
d118ac2062b5b8 Pali Rohár      2021-04-08  261  		}
d118ac2062b5b8 Pali Rohár      2021-04-08  262  
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  263  		return;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  264  	}
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  265  
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  266  	/*
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  267  	 * L1 voltage is equal to L0 voltage - 100mv and it must be
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  268  	 * larger than 1000mv
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  269  	 */
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  270  
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  271  	target_vm = avs_map[l0_vdd_min] - 100;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19 @272  	target_vm = target_vm > MIN_VOLT_MV ? target_vm : MIN_VOLT_MV;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  273  	dvfs->avs[1] = armada_37xx_avs_val_match(target_vm);
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  274  
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  275  	/*
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  276  	 * L2 & L3 voltage is equal to L0 voltage - 150mv and it must
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  277  	 * be larger than 1000mv
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  278  	 */
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  279  	target_vm = avs_map[l0_vdd_min] - 150;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  280  	target_vm = target_vm > MIN_VOLT_MV ? target_vm : MIN_VOLT_MV;
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  281  	dvfs->avs[2] = dvfs->avs[3] = armada_37xx_avs_val_match(target_vm);
d118ac2062b5b8 Pali Rohár      2021-04-08  282  
d118ac2062b5b8 Pali Rohár      2021-04-08  283  	/*
d118ac2062b5b8 Pali Rohár      2021-04-08  284  	 * Fix the avs value for load L1 when base CPU frequency is 1000/1200 MHz,
d118ac2062b5b8 Pali Rohár      2021-04-08  285  	 * otherwise the CPU gets stuck when switching from load L1 to load L0.
d118ac2062b5b8 Pali Rohár      2021-04-08  286  	 * Also ensure that avs value for load L1 is not higher than for L0.
d118ac2062b5b8 Pali Rohár      2021-04-08  287  	 */
d118ac2062b5b8 Pali Rohár      2021-04-08  288  	if (dvfs->cpu_freq_max >= 1000*1000*1000) {
d118ac2062b5b8 Pali Rohár      2021-04-08  289  		u32 avs_min_l1;
d118ac2062b5b8 Pali Rohár      2021-04-08  290  
d118ac2062b5b8 Pali Rohár      2021-04-08  291  		if (dvfs->cpu_freq_max >= 1200*1000*1000)
d118ac2062b5b8 Pali Rohár      2021-04-08  292  			avs_min_l1 = armada_37xx_avs_val_match(MIN_VOLT_MV_FOR_L1_1200MHZ);
d118ac2062b5b8 Pali Rohár      2021-04-08  293  		else
d118ac2062b5b8 Pali Rohár      2021-04-08  294  			avs_min_l1 = armada_37xx_avs_val_match(MIN_VOLT_MV_FOR_L1_1000MHZ);
d118ac2062b5b8 Pali Rohár      2021-04-08  295  
d118ac2062b5b8 Pali Rohár      2021-04-08  296  		if (avs_min_l1 > dvfs->avs[0])
d118ac2062b5b8 Pali Rohár      2021-04-08  297  			avs_min_l1 = dvfs->avs[0];
d118ac2062b5b8 Pali Rohár      2021-04-08  298  
d118ac2062b5b8 Pali Rohár      2021-04-08  299  		if (dvfs->avs[1] < avs_min_l1)
d118ac2062b5b8 Pali Rohár      2021-04-08  300  			dvfs->avs[1] = avs_min_l1;
d118ac2062b5b8 Pali Rohár      2021-04-08  301  	}
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  302  }
1c3528232f4ba6 Gregory CLEMENT 2018-06-19  303  

:::::: The code at line 272 was first introduced by commit
:::::: 1c3528232f4ba608cc2c31c7a8a55e0dbd6cb200 cpufreq: armada-37xx: Add AVS support

:::::: TO: Gregory CLEMENT <gregory.clement@bootlin.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
