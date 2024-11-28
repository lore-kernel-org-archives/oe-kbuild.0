Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB83FD4
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732821375; cv=none; b=UMMnhO7brTxtbjfGCB39OjiB5miJQ9Le/qdEdoFfNTPMiOAagMWglaaBR538iPRjvydBsQ4N3t+uO4qvSjZchGzk2feL1MBy9EPeGmN0lDBOto5HWUZbcaI7e+I0IfsgARpGiyv9aBQGWfTXGRWSVYwRSJgGeIeiM3SQG78NOBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732821375; c=relaxed/simple;
	bh=VIdqqlj0DpPCujgssQFMTsH9KduEqPN4p63SxZdVagE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=juY8MnwSIb5B5tK/PeI3Wr7V0Cs/k0U6Dvw5rIQ8rWqW4R5QNmeM7kcxIZ0DAjGoVw606XmXGJock1Dc4GTkxk9disLyXXx/KDGj1t+fJMOU3sQoXLmTmB1rlSxkBwgL2Ct9YEDUMxJYYu7Hv1uJiJG+SYcUtxfqn6Ka7F/khGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+jfix6z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+jfix6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732821373; x=1764357373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VIdqqlj0DpPCujgssQFMTsH9KduEqPN4p63SxZdVagE=;
  b=G+jfix6zHML2VaATQzJoqbjW8MoHgknjDqYPk211oy0HZ6DdXKYoY2Qd
   7p7qWRevssT73SpcxWleXCejP59ZQTFSndiOusMHei05v63uXmi0DVQZU
   SJ+D0icZK/aH2j35G6kvAmmOzCP35egslf6Xhdew5DzKYuniJe96s4p0X
   2XOmmTj029HTs5Nx1c+VK0nychMwyfcX7tKm1SMQ9JFkWi4JC7XpJe+dW
   YIFd8dOSFve+TjubsBRi24mdyRfT3pSFeGBSJu+v8hq8xDEWPgj2LPMA4
   w3ZP2eKnQnZbC6TCSfmNOZBQtbt+nxdOPP7IN8L8WEgTG8e5RXaEuiuZL
   Q==;
X-CSE-ConnectionGUID: 7+HRGbZCTWGgtJAoZyNtdQ==
X-CSE-MsgGUID: /D/99Z5oR4W4yfNxsdlvdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32996342"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="32996342"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 11:16:13 -0800
X-CSE-ConnectionGUID: 0ZtTL9tfQnGVY8Fly2gllA==
X-CSE-MsgGUID: r1Tvj0cTReGACEXD6WGvzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="91924634"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Nov 2024 11:16:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGjzl-0009w7-1Q;
	Thu, 28 Nov 2024 19:16:09 +0000
Date: Fri, 29 Nov 2024 03:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/bus/ti-sysc.c:2345:2-8: ERROR: missing clk_put; clk_get on
 line 2337 and execution via conditional on line 2344
Message-ID: <202411290325.CC6t1Aln-lkp@intel.com>
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
head:   b86545e02e8c22fb89218f29d381fa8e8b91d815
commit: 063dc0622705623b3a70739b9f33d5ea019882e6 bus: ti-sysc: Build driver for TI K3 SoCs
date:   1 year, 4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-r052-20241121 (https://download.01.org/0day-ci/archive/20241129/202411290325.CC6t1Aln-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411290325.CC6t1Aln-lkp@intel.com/

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
