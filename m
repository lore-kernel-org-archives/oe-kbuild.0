Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238E4179A6
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 19:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AL3MByir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701633372; x=1733169372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0kvZpHjhV0X2XNiaC6BLazq9h8t9YsMrJ6IdEbK9I0=;
  b=AL3MByirITyeC2wcTPjx8kmeAHNVKXtgTblsjcoCOrgTp+XJzs/UYk4p
   xEZUU/6C5674E1a/5YVf0XXEdEyPR5cAo7nElFYA9jIJwnQXrsc+iiT0T
   NBYVpDQubzImDnVZj6SsZNG8Li8nh1atoX9xEvyevg1bBbtpCAfDBU+PF
   2SRK7V6SphXzcUJd+1hmyN8onqLIGbzjm4dKR8mn/dMvZv39CBUbyyI/v
   CBN1Fm6tw1nBwrZEWMU2zqeOx3avJK2s3hKqD0I0fkObans3yU0/9+LNf
   hanOCLAqdHs31dQFQRaDMY3m/acuu5zIei+YxDyP0LsMgjHIYXsxkDjsg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373090501"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="373090501"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 11:56:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="746605029"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="746605029"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Dec 2023 11:56:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9sZT-00072h-0n;
	Sun, 03 Dec 2023 19:56:07 +0000
Date: Mon, 4 Dec 2023 03:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/nios2/kernel/time.c:223 nios2_timer_get_base_and_freq() warn:
 '*base' from of_iomap() not released on lines: 220.
Message-ID: <202312040334.l78lahzX-lkp@intel.com>
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
TO: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: dd1364a7439be4d20f87637a72eb7bd4553827f0 clocksource/drivers/nios2: Convert init function to return error
date:   7 years ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 years ago
config: nios2-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231204/202312040334.l78lahzX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312040334.l78lahzX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312040334.l78lahzX-lkp@intel.com/

New smatch warnings:
arch/nios2/kernel/time.c:223 nios2_timer_get_base_and_freq() warn: '*base' from of_iomap() not released on lines: 220.

Old smatch warnings:
internal error: arch/nios2/include/asm/irqflags.h:25 SQL error #2: near "and": syntax error
internal error: arch/nios2/include/asm/irqflags.h:25 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'
arch/nios2/kernel/time.c:139 nios2_timer_config() warn: inconsistent indenting

vim +223 arch/nios2/kernel/time.c

4182de9e6356c0 Ley Foon Tan   2014-11-06  208  
dd1364a7439be4 Daniel Lezcano 2016-06-07  209  static int __init nios2_timer_get_base_and_freq(struct device_node *np,
4182de9e6356c0 Ley Foon Tan   2014-11-06  210  				void __iomem **base, u32 *freq)
4182de9e6356c0 Ley Foon Tan   2014-11-06  211  {
4182de9e6356c0 Ley Foon Tan   2014-11-06  212  	*base = of_iomap(np, 0);
dd1364a7439be4 Daniel Lezcano 2016-06-07  213  	if (!*base) {
dd1364a7439be4 Daniel Lezcano 2016-06-07  214  		pr_crit("Unable to map reg for %s\n", np->name);
dd1364a7439be4 Daniel Lezcano 2016-06-07  215  		return -ENXIO;
dd1364a7439be4 Daniel Lezcano 2016-06-07  216  	}
dd1364a7439be4 Daniel Lezcano 2016-06-07  217  
dd1364a7439be4 Daniel Lezcano 2016-06-07  218  	if (of_property_read_u32(np, "clock-frequency", freq)) {
dd1364a7439be4 Daniel Lezcano 2016-06-07  219  		pr_crit("Unable to get %s clock frequency\n", np->name);
dd1364a7439be4 Daniel Lezcano 2016-06-07  220  		return -EINVAL;
dd1364a7439be4 Daniel Lezcano 2016-06-07  221  	}
4182de9e6356c0 Ley Foon Tan   2014-11-06  222  
dd1364a7439be4 Daniel Lezcano 2016-06-07 @223  	return 0;
4182de9e6356c0 Ley Foon Tan   2014-11-06  224  }
4182de9e6356c0 Ley Foon Tan   2014-11-06  225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
