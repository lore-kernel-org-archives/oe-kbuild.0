Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5738837C
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224836; cv=none; b=NhW6keqGeaumK5anfxWZ68IrSJWzjW8Y8iOMxg2o72anjUrEyaBuv+wJzRksCYUfqXXfcrHmcEPU4ibEgg/yET46RITsJTI2dD1WXZcI7EviONKMZS8drXOyFICqi0FgYGzGyGwDbR/sT8eF6jYztEHl8ovPWi+c346GAT+ICTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224836; c=relaxed/simple;
	bh=ElN90FhSNp36ZMxpkiVRQj5XH4w0cR+jPxjYfnO8344=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hslVp2ACsNbKW7xiTS8NwAffxVsNLJh4YPQ/tWp9T8xjh0D0kaDeEVc1tpwlUiKU8qGMOLSOnRbQByQoTHW4+TB7ACBAVPFtgT/mQ1H9IGExXbslqS7exl2pnXEvV8uT+tPlDb9HfIyrU079+ur7yAtmMxfqEOyygClVPG9D8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYst7RCm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYst7RCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789224835; x=1820760835;
  h=date:from:to:cc:subject:message-id;
  bh=ElN90FhSNp36ZMxpkiVRQj5XH4w0cR+jPxjYfnO8344=;
  b=GYst7RCmZ5/PRdeaW4oOT3Oyyno35aosfj69jqjIgQ7bxUIdjOEspEj/
   Hq8+CSPQo9qEdZ0a6XFmJtwWuQQtK3W8Fph8jHymc8Co0JpxxytbOiyH9
   c1ZIzPsshC4sh25yue+MU095wZQPJqL13eqJMHq9CfXoqpuIT06o/CloB
   GEGdj4Iwc61iVtgyxvGD4hjbkXcQ3o6yCYYVH0nJG2GX7n5DNfBShI+v8
   M2NU5qpF1X7E/jZ17PYD16OpOaHeTY0RLUK6YHwVSebP5MZB+i3N0RQq2
   3Pftv5OqoerVVS2GCnA35tKuvE3NP5E6NocaX4WMSYwMbv6MWTcNHojNZ
   g==;
X-CSE-ConnectionGUID: BLaEBaXTQpKl91AOdOx83Q==
X-CSE-MsgGUID: ToplR12LRXy3GMRq/4QpZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="92169157"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="92169157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 07:53:54 -0700
X-CSE-ConnectionGUID: JPzhFLFIQZSZBCU8Lu9FXA==
X-CSE-MsgGUID: q+fd6/6tTP+ybW6aekP5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="276347099"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2026 07:53:53 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5P6z-0000000019P-2Aop;
	Sat, 12 Sep 2026 14:53:49 +0000
Date: Sat, 12 Sep 2026 16:52:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5126/5916]
 drivers/hwmon/axiado-tsadc.c:142 axiado_tsadc_raw_to_mc() error: buffer
 overflow 'axiado_tsadc_table' 34 <= 34
Message-ID: <202609121642.l9tp42kr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Petar Stepanovic <pstepanovic@axiado.com>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   68142f986ff04b2b70b31db00f719bf690f64a9a
commit: 94761a45a7544d0d694767898327b2f797a47fe7 [5126/5916] hwmon: axiado-tsadc: Add AX3000/AX3005 TSADC support
:::::: branch date: 23 hours ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r072-20260911 (https://download.01.org/0day-ci/archive/20260912/202609121642.l9tp42kr-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 707c032dae3bee24eae29c6f4c459a6d6dc6556d)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609121642.l9tp42kr-lkp@intel.com/

New smatch warnings:
drivers/hwmon/axiado-tsadc.c:142 axiado_tsadc_raw_to_mc() error: buffer overflow 'axiado_tsadc_table' 34 <= 34

Old smatch warnings:
drivers/hwmon/axiado-tsadc.c:144 axiado_tsadc_raw_to_mc() error: buffer overflow 'axiado_tsadc_table' 34 <= 34

vim +/axiado_tsadc_table +142 drivers/hwmon/axiado-tsadc.c

94761a45a7544d Petar Stepanovic 2026-09-03  113  
94761a45a7544d Petar Stepanovic 2026-09-03  114  /* Convert raw ADC code to millidegrees Celsius with linear interpolation. */
94761a45a7544d Petar Stepanovic 2026-09-03  115  static int axiado_tsadc_raw_to_mc(u32 raw, long *val)
94761a45a7544d Petar Stepanovic 2026-09-03  116  {
94761a45a7544d Petar Stepanovic 2026-09-03  117  	int i, n = ARRAY_SIZE(axiado_tsadc_table);
94761a45a7544d Petar Stepanovic 2026-09-03  118  	long num, denom;
94761a45a7544d Petar Stepanovic 2026-09-03  119  
94761a45a7544d Petar Stepanovic 2026-09-03  120  	if (raw >= axiado_tsadc_table[0].raw) {
94761a45a7544d Petar Stepanovic 2026-09-03  121  		*val = axiado_tsadc_table[0].temp_mc;
94761a45a7544d Petar Stepanovic 2026-09-03  122  		return 0;
94761a45a7544d Petar Stepanovic 2026-09-03  123  	}
94761a45a7544d Petar Stepanovic 2026-09-03  124  
94761a45a7544d Petar Stepanovic 2026-09-03  125  	if (raw <= axiado_tsadc_table[n - 1].raw) {
94761a45a7544d Petar Stepanovic 2026-09-03  126  		*val = axiado_tsadc_table[n - 1].temp_mc;
94761a45a7544d Petar Stepanovic 2026-09-03  127  		return 0;
94761a45a7544d Petar Stepanovic 2026-09-03  128  	}
94761a45a7544d Petar Stepanovic 2026-09-03  129  
94761a45a7544d Petar Stepanovic 2026-09-03  130  	/* Find i such that axiado_tsadc_table[i].raw >= raw > axiado_tsadc_table[i+1].raw */
94761a45a7544d Petar Stepanovic 2026-09-03  131  	for (i = 0; i < n - 1; i++) {
94761a45a7544d Petar Stepanovic 2026-09-03  132  		if (raw >= axiado_tsadc_table[i + 1].raw)
94761a45a7544d Petar Stepanovic 2026-09-03  133  			break;
94761a45a7544d Petar Stepanovic 2026-09-03  134  	}
94761a45a7544d Petar Stepanovic 2026-09-03  135  
94761a45a7544d Petar Stepanovic 2026-09-03  136  	if (raw == axiado_tsadc_table[i].raw) {
94761a45a7544d Petar Stepanovic 2026-09-03  137  		*val = axiado_tsadc_table[i].temp_mc;
94761a45a7544d Petar Stepanovic 2026-09-03  138  		return 0;
94761a45a7544d Petar Stepanovic 2026-09-03  139  	}
94761a45a7544d Petar Stepanovic 2026-09-03  140  
94761a45a7544d Petar Stepanovic 2026-09-03  141  	/* Linear interpolation within the interval */
94761a45a7544d Petar Stepanovic 2026-09-03 @142  	num = (long)(axiado_tsadc_table[i + 1].temp_mc - axiado_tsadc_table[i].temp_mc) *
94761a45a7544d Petar Stepanovic 2026-09-03  143  	      (axiado_tsadc_table[i].raw - raw);
94761a45a7544d Petar Stepanovic 2026-09-03  144  	denom = axiado_tsadc_table[i].raw - axiado_tsadc_table[i + 1].raw;
94761a45a7544d Petar Stepanovic 2026-09-03  145  	*val = axiado_tsadc_table[i].temp_mc + num / denom;
94761a45a7544d Petar Stepanovic 2026-09-03  146  	return 0;
94761a45a7544d Petar Stepanovic 2026-09-03  147  }
94761a45a7544d Petar Stepanovic 2026-09-03  148  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
