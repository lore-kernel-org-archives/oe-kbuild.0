Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111841849
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Aug 2023 05:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691816588; x=1723352588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/4DlNMHwQEZYBWmr+4W+JnaJ+opBjv3dlJ9LqAKGH2g=;
  b=oGVEZDb11lJZV4jpzMFIn9GmpAZ5cnmAtFQXuZH7/iGBiOtg+V1ggHpy
   +q7rHZgBq+9T9QuDYNtXjBtwb3n07j012CYPwC/BCTKLCFIRnDYDlaGDI
   N/ZJ2K7SHOpRLPMQd96rqE4kSJ9tEqoHcbUBOABFJxMmVmURxEh6lJBqJ
   +rmMk1wWf8mVmL4N+bnzeKR3JYLeBbN9KoMTLCo7HxbXXAu+M4PBedz3N
   XN1kHWpWGlko0rDRF+OZShl/+46LT4cDf9AjEAs1X43UiWqhvzYpcYroj
   SRbYeY9nBGgjN6mLo204J2zJ2UbjwErjdXHxDpxUr3jtw9xH7i7SWcSJQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="352130191"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="352130191"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 22:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682741472"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="682741472"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 22:03:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUgmE-0008H8-16;
	Sat, 12 Aug 2023 05:03:02 +0000
Date: Sat, 12 Aug 2023 13:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v18 1/1] clk: npcm8xx: add clock controller
Message-ID: <202308121204.0vblViWk-lkp@intel.com>
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
In-Reply-To: <20230727074328.34144-2-tmaimon77@gmail.com>
References: <20230727074328.34144-2-tmaimon77@gmail.com>
TO: Tomer Maimon <tmaimon77@gmail.com>

Hi Tomer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.5-rc3]
[also build test WARNING on linus/master next-20230809]
[cannot apply to clk/clk-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/clk-npcm8xx-add-clock-controller/20230727-161149
base:   v6.5-rc3
patch link:    https://lore.kernel.org/r/20230727074328.34144-2-tmaimon77%40gmail.com
patch subject: [PATCH v18 1/1] clk: npcm8xx: add clock controller
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: nios2-randconfig-m031-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121204.0vblViWk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121204.0vblViWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308121204.0vblViWk-lkp@intel.com/

smatch warnings:
drivers/clk/clk-npcm8xx.c:375 npcm8xx_clk_register_pll() warn: passing devm_ allocated variable to kfree. 'pll'

vim +/pll +375 drivers/clk/clk-npcm8xx.c

43dcec6ce04c61 Tomer Maimon 2023-07-27  350  
43dcec6ce04c61 Tomer Maimon 2023-07-27  351  static struct clk_hw *
43dcec6ce04c61 Tomer Maimon 2023-07-27  352  npcm8xx_clk_register_pll(struct device *dev, void __iomem *pllcon,
43dcec6ce04c61 Tomer Maimon 2023-07-27  353  			 const char *name, const struct clk_parent_data *parent,
43dcec6ce04c61 Tomer Maimon 2023-07-27  354  			 unsigned long flags)
43dcec6ce04c61 Tomer Maimon 2023-07-27  355  {
43dcec6ce04c61 Tomer Maimon 2023-07-27  356  	struct npcm8xx_clk_pll *pll;
43dcec6ce04c61 Tomer Maimon 2023-07-27  357  	struct clk_init_data init = {};
43dcec6ce04c61 Tomer Maimon 2023-07-27  358  	int ret;
43dcec6ce04c61 Tomer Maimon 2023-07-27  359  
43dcec6ce04c61 Tomer Maimon 2023-07-27  360  	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
43dcec6ce04c61 Tomer Maimon 2023-07-27  361  	if (!pll)
43dcec6ce04c61 Tomer Maimon 2023-07-27  362  		return ERR_PTR(-ENOMEM);
43dcec6ce04c61 Tomer Maimon 2023-07-27  363  
43dcec6ce04c61 Tomer Maimon 2023-07-27  364  	init.name = name;
43dcec6ce04c61 Tomer Maimon 2023-07-27  365  	init.ops = &npcm8xx_clk_pll_ops;
43dcec6ce04c61 Tomer Maimon 2023-07-27  366  	init.parent_data = parent;
43dcec6ce04c61 Tomer Maimon 2023-07-27  367  	init.num_parents = 1;
43dcec6ce04c61 Tomer Maimon 2023-07-27  368  	init.flags = flags;
43dcec6ce04c61 Tomer Maimon 2023-07-27  369  
43dcec6ce04c61 Tomer Maimon 2023-07-27  370  	pll->pllcon = pllcon;
43dcec6ce04c61 Tomer Maimon 2023-07-27  371  	pll->hw.init = &init;
43dcec6ce04c61 Tomer Maimon 2023-07-27  372  
43dcec6ce04c61 Tomer Maimon 2023-07-27  373  	ret = devm_clk_hw_register(dev, &pll->hw);
43dcec6ce04c61 Tomer Maimon 2023-07-27  374  	if (ret) {
43dcec6ce04c61 Tomer Maimon 2023-07-27 @375  		kfree(pll);
43dcec6ce04c61 Tomer Maimon 2023-07-27  376  		return ERR_PTR(ret);
43dcec6ce04c61 Tomer Maimon 2023-07-27  377  	}
43dcec6ce04c61 Tomer Maimon 2023-07-27  378  
43dcec6ce04c61 Tomer Maimon 2023-07-27  379  	return &pll->hw;
43dcec6ce04c61 Tomer Maimon 2023-07-27  380  }
43dcec6ce04c61 Tomer Maimon 2023-07-27  381  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
