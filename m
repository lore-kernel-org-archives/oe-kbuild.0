Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7639AD6
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 03:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724901224; cv=none; b=kJHDSlfa65/0GFFsZnF9Rs+4rc8Sf0BO71/BLyumfGmw+58hxmwJxTwFUJ/HaBRXyjsUsmGjiSib7DAB+OI8BP50tfPrRw7YDLJ3JtEg0PhBqmxaC1f68UL59MIqIqXBzXE4BRFARUz4Hp/N8hr5UAQjm7zybbxxWsPliqzNKdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724901224; c=relaxed/simple;
	bh=y7zGfjJSXujUGCoTGruqzKyqZ0nKYORDLZ8SoK/NRM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njdiI5p4DBNi7MXg2JCmQ5hnbZ/KUKKWPKzxRDPMK3OBvNhC8FmX/LSnfjw6Igf1xsBbeBK4JyOMKGqdk8zxk+ZXnQDnM96ODQyxYucxcRW9nfQt3SN/GG8HYoC7tNN5ljZ6I5ErdGAwYqPjlRRo+Sdl0C93e3VRyLLqm90I1cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7dXGecy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7dXGecy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724901223; x=1756437223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7zGfjJSXujUGCoTGruqzKyqZ0nKYORDLZ8SoK/NRM8=;
  b=D7dXGecyj1XRTyFJwBHH76+qiBDf6/1IxHr96QGBU2/jxCCzFgfJgU/H
   0ngF8BKkE6fkBJR1/BlIMKNsnj4pZCa8S1WaDWLAKr9ay1XX1peG+gdz/
   nUNgDMUWoITREroapYZpKY1cTuxp0qlC5bHDF3M4JXjHCxMqM7P0wJxzm
   15Y7Wg8Vvd3+yKQ15grlUEo8kh8EuV/oBIUBJX7UTxjBTW9c7ADgzRVpU
   XsQ8DBf0jgTdUvqhi4ThWoZ+VmJCMKEhhkC5Q6O7etl9JORY5/CD/2pcZ
   RLgwkcJjnPsnoODDV5c7ZGX9MhjNudE5z/pVbgNmECZRJSWJBWZ+I5lgr
   Q==;
X-CSE-ConnectionGUID: q/jMrgJDSyqlVfOM0mR1GA==
X-CSE-MsgGUID: i0aDqz5nTOO7Gfhexm8qEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23271670"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23271670"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 20:13:43 -0700
X-CSE-ConnectionGUID: Ukhr5/9zSMGDTN/vFp28hQ==
X-CSE-MsgGUID: fveU0Q8HSIaMwQ5lPfA1aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="86636794"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Aug 2024 20:13:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjVbO-000Lby-31;
	Thu, 29 Aug 2024 03:13:38 +0000
Date: Thu, 29 Aug 2024 11:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] clk: Delete redundant logic.
Message-ID: <202408291052.4ngp4ieh-lkp@intel.com>
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
In-Reply-To: <tencent_713186AE6290AC7B8037FD247F5BF04C0308@qq.com>
References: <tencent_713186AE6290AC7B8037FD247F5BF04C0308@qq.com>
TO: jiping huang <huangjiping95@qq.com>
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: jiping huang <huangjiping95@qq.com>

Hi jiping,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.11-rc5 next-20240828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jiping-huang/clk-Delete-redundant-logic/20240826-170900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/tencent_713186AE6290AC7B8037FD247F5BF04C0308%40qq.com
patch subject: [PATCH] clk: Delete redundant logic.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240827 (https://download.01.org/0day-ci/archive/20240829/202408291052.4ngp4ieh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408291052.4ngp4ieh-lkp@intel.com/

New smatch warnings:
drivers/clk/clk.c:2320 clk_calc_new_rates() error: uninitialized symbol 'parent'.
drivers/clk/clk.c:2332 clk_calc_new_rates() error: uninitialized symbol 'old_parent'.

Old smatch warnings:
drivers/clk/clk.c:4173 clk_hw_create_clk() warn: passing zero to 'ERR_CAST'

vim +/parent +2320 drivers/clk/clk.c

b2476490ef11134 Mike Turquette  2012-03-15  2277  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2278  /*
4dff95dc9477a34 Stephen Boyd    2015-04-30  2279   * calculate the new rates returning the topmost clock that has to be
4dff95dc9477a34 Stephen Boyd    2015-04-30  2280   * changed.
4dff95dc9477a34 Stephen Boyd    2015-04-30  2281   */
4dff95dc9477a34 Stephen Boyd    2015-04-30  2282  static struct clk_core *clk_calc_new_rates(struct clk_core *core,
4dff95dc9477a34 Stephen Boyd    2015-04-30  2283  					   unsigned long rate)
4dff95dc9477a34 Stephen Boyd    2015-04-30  2284  {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2285  	struct clk_core *top = core;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2286  	struct clk_core *old_parent, *parent;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2287  	unsigned long best_parent_rate = 0;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2288  	unsigned long new_rate;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2289  	unsigned long min_rate;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2290  	unsigned long max_rate;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2291  	int p_index = 0;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2292  	long ret;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2293  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2294  	/* sanity */
4dff95dc9477a34 Stephen Boyd    2015-04-30  2295  	if (IS_ERR_OR_NULL(core))
4dff95dc9477a34 Stephen Boyd    2015-04-30  2296  		return NULL;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2297  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2298  	clk_core_get_boundaries(core, &min_rate, &max_rate);
71472c0c06cf9a3 James Hogan     2013-07-29  2299  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2300  	/* find the closest rate and parent clk/rate */
0f6cc2b8e94da54 Jerome Brunet   2017-12-01  2301  	if (clk_core_can_round(core)) {
0817b62cc037a56 Boris Brezillon 2015-07-07  2302  		struct clk_rate_request req;
0817b62cc037a56 Boris Brezillon 2015-07-07  2303  
718af795d3fd786 Maxime Ripard   2022-08-16  2304  		clk_core_init_rate_req(core, &req, rate);
0f6cc2b8e94da54 Jerome Brunet   2017-12-01  2305  
49e62e0d96baf72 Maxime Ripard   2022-10-26  2306  		trace_clk_rate_request_start(&req);
49e62e0d96baf72 Maxime Ripard   2022-10-26  2307  
0f6cc2b8e94da54 Jerome Brunet   2017-12-01  2308  		ret = clk_core_determine_round_nolock(core, &req);
4dff95dc9477a34 Stephen Boyd    2015-04-30  2309  		if (ret < 0)
4dff95dc9477a34 Stephen Boyd    2015-04-30  2310  			return NULL;
035a61c314eb3da Tomeu Vizoso    2015-01-23  2311  
49e62e0d96baf72 Maxime Ripard   2022-10-26  2312  		trace_clk_rate_request_done(&req);
49e62e0d96baf72 Maxime Ripard   2022-10-26  2313  
0817b62cc037a56 Boris Brezillon 2015-07-07  2314  		best_parent_rate = req.best_parent_rate;
0817b62cc037a56 Boris Brezillon 2015-07-07  2315  		new_rate = req.rate;
0817b62cc037a56 Boris Brezillon 2015-07-07  2316  		parent = req.best_parent_hw ? req.best_parent_hw->core : NULL;
1c8e600440c7f50 Tomeu Vizoso    2015-01-23  2317  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2318  		if (new_rate < min_rate || new_rate > max_rate)
4dff95dc9477a34 Stephen Boyd    2015-04-30  2319  			return NULL;
4dff95dc9477a34 Stephen Boyd    2015-04-30 @2320  	} else if (!parent || !(core->flags & CLK_SET_RATE_PARENT)) {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2321  		/* pass-through clock without adjustable parent */
4dff95dc9477a34 Stephen Boyd    2015-04-30  2322  		core->new_rate = core->rate;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2323  		return NULL;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2324  	} else {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2325  		/* pass-through clock with adjustable parent */
4dff95dc9477a34 Stephen Boyd    2015-04-30  2326  		top = clk_calc_new_rates(parent, rate);
4dff95dc9477a34 Stephen Boyd    2015-04-30  2327  		new_rate = parent->new_rate;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2328  		goto out;
1c8e600440c7f50 Tomeu Vizoso    2015-01-23  2329  	}
035a61c314eb3da Tomeu Vizoso    2015-01-23  2330  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2331  	/* some clocks must be gated to change parent */
4dff95dc9477a34 Stephen Boyd    2015-04-30 @2332  	if (parent != old_parent &&
4dff95dc9477a34 Stephen Boyd    2015-04-30  2333  	    (core->flags & CLK_SET_PARENT_GATE) && core->prepare_count) {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2334  		pr_debug("%s: %s not gated but wants to reparent\n",
4dff95dc9477a34 Stephen Boyd    2015-04-30  2335  			 __func__, core->name);
4dff95dc9477a34 Stephen Boyd    2015-04-30  2336  		return NULL;
035a61c314eb3da Tomeu Vizoso    2015-01-23  2337  	}
b2476490ef11134 Mike Turquette  2012-03-15  2338  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2339  	/* try finding the new parent index */
4dff95dc9477a34 Stephen Boyd    2015-04-30  2340  	if (parent && core->num_parents > 1) {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2341  		p_index = clk_fetch_parent_index(core, parent);
4dff95dc9477a34 Stephen Boyd    2015-04-30  2342  		if (p_index < 0) {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2343  			pr_debug("%s: clk %s can not be parent of clk %s\n",
4dff95dc9477a34 Stephen Boyd    2015-04-30  2344  				 __func__, parent->name, core->name);
4dff95dc9477a34 Stephen Boyd    2015-04-30  2345  			return NULL;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2346  		}
4dff95dc9477a34 Stephen Boyd    2015-04-30  2347  	}
b2476490ef11134 Mike Turquette  2012-03-15  2348  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2349  	if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
4dff95dc9477a34 Stephen Boyd    2015-04-30  2350  	    best_parent_rate != parent->rate)
4dff95dc9477a34 Stephen Boyd    2015-04-30  2351  		top = clk_calc_new_rates(parent, best_parent_rate);
035a61c314eb3da Tomeu Vizoso    2015-01-23  2352  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2353  out:
4dff95dc9477a34 Stephen Boyd    2015-04-30  2354  	clk_calc_subtree(core, new_rate, parent, p_index);
b2476490ef11134 Mike Turquette  2012-03-15  2355  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2356  	return top;
b2476490ef11134 Mike Turquette  2012-03-15  2357  }
b2476490ef11134 Mike Turquette  2012-03-15  2358  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
