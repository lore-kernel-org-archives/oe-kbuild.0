Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0116779F2
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Feb 2025 00:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740098347; cv=none; b=HY9Hv1FFph2hu3qiPERQazOjA5Htfb1TDWBP3+HVlzpyi7qV3niJ+yoQXzwV+9ZyWdFtOYK3ZFa35S3FbcDdIzTg6rFO4b7DgTsruDYJOpQ4qnDJN8TBFM5ptLBAjWRE7WloXTLj2ZtTU6ccXaInTNbut9qj/0+22vB0vjmpF8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740098347; c=relaxed/simple;
	bh=QCBnmKAf1OOozPfr08dWJLSsrprdCkz6R37LU2FkvXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gXFey2y0CkK31VPrCcLvndKE8lgUJ9JtKKAvN+p33vOddwy3aEL8sUDh4fErVeUFbDLVFvHEOBim10sh3BM5ap1RLv9ebMBEjdI5J731lqDSTeINyGybgz+afO9JLbVekCbepxU3XIumyPS983C9PorBLDzE6EBp2c0vPcuu1LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVF+iN8x; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVF+iN8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740098345; x=1771634345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QCBnmKAf1OOozPfr08dWJLSsrprdCkz6R37LU2FkvXw=;
  b=dVF+iN8xy8C4hFQXTozh4Elqj7MmpK6UcbL1oamdHLJqq58ZuvCFvcIL
   L0Stf81K/hIWF8LKl/Q7AXCSVrpi0f8IYewNlxZiBFBKFzoXhLQ4DLd0G
   pTJDJGshOE3FxHafHZ6YUz9dDsgy+FFb5d4Uvr5XEHeEyysM24S5p9wlP
   0XaZPC4rwy63WIaENWMDU+wIoaWW8irYzhwakgZBFY0K+BHkzWkbL+XvZ
   tiZi+Kc4B3DxRtg4dvyDkIm7CfXfodsGHdxD7EbAXvythXCVWG9IcnkeQ
   YGnIWBW+gUz3qm/JAisJOLfVGQR5RbC8qe87mZpBVS0Q2pj5iOvWcdrI3
   w==;
X-CSE-ConnectionGUID: Qs+CXDW5STmEf1oOKwteYA==
X-CSE-MsgGUID: srG0kNNlSgmQuLtLrvegTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28500569"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="28500569"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 16:39:03 -0800
X-CSE-ConnectionGUID: BGmEBuk2S1CzUjpLYAPSsQ==
X-CSE-MsgGUID: 5HdPP420TVGGjrWgIC5Q/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="115751225"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2025 16:38:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlH42-0004ux-0B;
	Fri, 21 Feb 2025 00:38:46 +0000
Date: Fri, 21 Feb 2025 08:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kernel/hw_breakpoint.c:510 arch_hw_breakpoint_init()
 warn: we never enter this loop
Message-ID: <202502210802.gxATWbUa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27eddbf3449026a73d6ed52d55b192bfcf526a03
commit: 5685d7fcb55fd729d7e0452c157a0ac8d72ca7b6 LoongArch: Give a chance to build with !CONFIG_SMP
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: loongarch-randconfig-r072-20250221 (https://download.01.org/0day-ci/archive/20250221/202502210802.gxATWbUa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502210802.gxATWbUa-lkp@intel.com/

smatch warnings:
arch/loongarch/kernel/hw_breakpoint.c:510 arch_hw_breakpoint_init() warn: we never enter this loop

vim +510 arch/loongarch/kernel/hw_breakpoint.c

edffa33c7bb5a7 Qing Zhang 2023-02-25  499  
edffa33c7bb5a7 Qing Zhang 2023-02-25  500  static int __init arch_hw_breakpoint_init(void)
edffa33c7bb5a7 Qing Zhang 2023-02-25  501  {
edffa33c7bb5a7 Qing Zhang 2023-02-25  502  	int cpu;
edffa33c7bb5a7 Qing Zhang 2023-02-25  503  
edffa33c7bb5a7 Qing Zhang 2023-02-25  504  	boot_cpu_data.watch_ireg_count = get_num_brps();
edffa33c7bb5a7 Qing Zhang 2023-02-25  505  	boot_cpu_data.watch_dreg_count = get_num_wrps();
edffa33c7bb5a7 Qing Zhang 2023-02-25  506  
edffa33c7bb5a7 Qing Zhang 2023-02-25  507  	pr_info("Found %d breakpoint and %d watchpoint registers.\n",
edffa33c7bb5a7 Qing Zhang 2023-02-25  508  		boot_cpu_data.watch_ireg_count, boot_cpu_data.watch_dreg_count);
edffa33c7bb5a7 Qing Zhang 2023-02-25  509  
edffa33c7bb5a7 Qing Zhang 2023-02-25 @510  	for (cpu = 1; cpu < NR_CPUS; cpu++) {
edffa33c7bb5a7 Qing Zhang 2023-02-25  511  		cpu_data[cpu].watch_ireg_count = boot_cpu_data.watch_ireg_count;
edffa33c7bb5a7 Qing Zhang 2023-02-25  512  		cpu_data[cpu].watch_dreg_count = boot_cpu_data.watch_dreg_count;
edffa33c7bb5a7 Qing Zhang 2023-02-25  513  	}
edffa33c7bb5a7 Qing Zhang 2023-02-25  514  
edffa33c7bb5a7 Qing Zhang 2023-02-25  515  	return 0;
edffa33c7bb5a7 Qing Zhang 2023-02-25  516  }
edffa33c7bb5a7 Qing Zhang 2023-02-25  517  arch_initcall(arch_hw_breakpoint_init);
edffa33c7bb5a7 Qing Zhang 2023-02-25  518  

:::::: The code at line 510 was first introduced by commit
:::::: edffa33c7bb5a73e90c754c7a497162b77d7c55f LoongArch: Add hardware breakpoints/watchpoints support

:::::: TO: Qing Zhang <zhangqing@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
