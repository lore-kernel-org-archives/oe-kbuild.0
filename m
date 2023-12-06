Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D76637156
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0U+Y9Qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701869261; x=1733405261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WkcojOSFwC+QnLJ2ST00wmSaEotssK+H41AHThh5zZk=;
  b=F0U+Y9Qhfl1l4l5WnXNLpZRMLPe38JQK5B+mEGZn2nJOJt/8kR/gdXoP
   8+fMmMNHgdOvhVbs9ToknGD9HLsoelzGI2kt2iV5J0B2ih8XEQ0Bzb+Qk
   qc3kzxaCZEOKR/ApNSzhsqCedYMMdiOtWxXu3QAYMtx8/KUHyojsPmapP
   BRz7eUefB4oK3224L0L5N+YU5N+abEIJtw/Q41+ZRs5Jg0p2YHRYtwz3o
   7BJrvKngXof5LOoJb/2a9vhQT8iAhjxl292QkqYCjl5A4Dnt0p+X4rmuB
   6yXjiu87bSfTrWSNG0BfUcqIprGNbICYE8Vx3SqR4lpFHNaEAnAAZReCC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="480256035"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="480256035"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 05:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="805645195"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="805645195"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 06 Dec 2023 05:27:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rArw8-000Apm-2N;
	Wed, 06 Dec 2023 13:27:36 +0000
Date: Wed, 6 Dec 2023 21:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/bus/ti-sysc.c:2345:2-8: ERROR: missing clk_put; clk_get on
 line 2337 and execution via conditional on line 2344
Message-ID: <202312062124.SQ4Lx1JK-lkp@intel.com>
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
TO: Tony Lindgren <tony@atomide.com>
CC: Dhruva Gole <d-gole@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 063dc0622705623b3a70739b9f33d5ea019882e6 bus: ti-sysc: Build driver for TI K3 SoCs
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r051-20231201 (https://download.01.org/0day-ci/archive/20231206/202312062124.SQ4Lx1JK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312062124.SQ4Lx1JK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312062124.SQ4Lx1JK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/bus/ti-sysc.c:2345:2-8: ERROR: missing clk_put; clk_get on line 2337 and execution via conditional on line 2344

vim +2345 drivers/bus/ti-sysc.c

c5a2de97fbd297 Tony Lindgren  2017-12-15  2321  
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2322  /*
8b2830ba170356 Tony Lindgren  2018-04-16  2323   * Many child device drivers need to have fck and opt clocks available
8b2830ba170356 Tony Lindgren  2018-04-16  2324   * to get the clock rate for device internal configuration etc.
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2325   */
8b2830ba170356 Tony Lindgren  2018-04-16  2326  static int sysc_child_add_named_clock(struct sysc *ddata,
8b2830ba170356 Tony Lindgren  2018-04-16  2327  				      struct device *child,
8b2830ba170356 Tony Lindgren  2018-04-16  2328  				      const char *name)
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2329  {
8b2830ba170356 Tony Lindgren  2018-04-16  2330  	struct clk *clk;
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2331  	struct clk_lookup *l;
8b2830ba170356 Tony Lindgren  2018-04-16  2332  	int error = 0;
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2333  
8b2830ba170356 Tony Lindgren  2018-04-16  2334  	if (!name)
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2335  		return 0;
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2336  
8b2830ba170356 Tony Lindgren  2018-04-16 @2337  	clk = clk_get(child, name);
8b2830ba170356 Tony Lindgren  2018-04-16  2338  	if (!IS_ERR(clk)) {
cb6cfe2eaed171 Markus Elfring 2019-11-06  2339  		error = -EEXIST;
cb6cfe2eaed171 Markus Elfring 2019-11-06  2340  		goto put_clk;
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2341  	}
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2342  
8b2830ba170356 Tony Lindgren  2018-04-16  2343  	clk = clk_get(ddata->dev, name);
8b2830ba170356 Tony Lindgren  2018-04-16 @2344  	if (IS_ERR(clk))
8b2830ba170356 Tony Lindgren  2018-04-16 @2345  		return -ENODEV;
8b2830ba170356 Tony Lindgren  2018-04-16  2346  
8b2830ba170356 Tony Lindgren  2018-04-16  2347  	l = clkdev_create(clk, name, dev_name(child));
8b2830ba170356 Tony Lindgren  2018-04-16  2348  	if (!l)
8b2830ba170356 Tony Lindgren  2018-04-16  2349  		error = -ENOMEM;
cb6cfe2eaed171 Markus Elfring 2019-11-06  2350  put_clk:
8b2830ba170356 Tony Lindgren  2018-04-16  2351  	clk_put(clk);
8b2830ba170356 Tony Lindgren  2018-04-16  2352  
8b2830ba170356 Tony Lindgren  2018-04-16  2353  	return error;
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2354  }
2c355ff6b6ca6e Tony Lindgren  2018-02-22  2355  

:::::: The code at line 2345 was first introduced by commit
:::::: 8b2830ba170356aed364ae145ca86120f510ec41 bus: ti-sysc: Make child clock alias handling more generic

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
