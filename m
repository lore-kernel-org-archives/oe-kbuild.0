Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B3CA4B
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Aug 2023 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692044132; x=1723580132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d/w1d2k7SXS92KYiST5F9pWVRrTSQ7zuK1BpBNouwtE=;
  b=Wq97TsHk/cPJ8HxwhHjmTlhOyQkXuye3AMDxNVVUuCEZY190j3McPMuG
   apPPrzoGdgHULP6mSqaP0kn1MbALe9FDIBSAbjf0HuJvO4IU39o7wX17Y
   6Z3MFqT5ufY+wZm2A0E6fiHtqU1c19AZkERcPG84VJ+LILm+Ym00FUEa9
   MXGaIjalBVu7oSOxujov9A6/rVeQf15DPxd3HY2sOeuBTUxch/f4mUQAx
   p+BpO0N0yWD11lBt9STzOY6prdIzEnSfeNoerNO2FDrJ2PuXBpzlXKivE
   9u138obYMFULlwZgWyKD4cIqELEVioic1c9pMzR0LNNn9Pjeizt+8s93t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="351717690"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="351717690"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 13:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="768573679"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="768573679"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Aug 2023 13:15:30 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVdyH-0000Od-09;
	Mon, 14 Aug 2023 20:15:26 +0000
Date: Tue, 15 Aug 2023 04:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [shenki:dev-6.5 63/93] drivers/clk/clk-npcm8xx.c:70:1-7: WARNING:
 do_div() does a 64-by-32 division, please consider using div64_ul instead.
Message-ID: <202308150409.rbhBIGlr-lkp@intel.com>
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
TO: Joel Stanley <joel@jms.id.au>

tree:   https://github.com/shenki/linux dev-6.5
head:   e874a83263bd783e23411cf6ab12622ac36362f5
commit: 3ee0ccee782341bcffbaf9afbe476e2bc8ad0cfb [63/93] clk: npcm8xx: add clock controller
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r053-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150409.rbhBIGlr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150409.rbhBIGlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308150409.rbhBIGlr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-npcm8xx.c:70:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +70 drivers/clk/clk-npcm8xx.c

3ee0ccee782341 Tomer Maimon 2022-10-02  48  
3ee0ccee782341 Tomer Maimon 2022-10-02  49  static unsigned long npcm8xx_clk_pll_recalc_rate(struct clk_hw *hw,
3ee0ccee782341 Tomer Maimon 2022-10-02  50  						 unsigned long parent_rate)
3ee0ccee782341 Tomer Maimon 2022-10-02  51  {
3ee0ccee782341 Tomer Maimon 2022-10-02  52  	struct npcm8xx_clk_pll *pll = to_npcm8xx_clk_pll(hw);
3ee0ccee782341 Tomer Maimon 2022-10-02  53  	unsigned long fbdv, indv, otdv1, otdv2;
3ee0ccee782341 Tomer Maimon 2022-10-02  54  	unsigned int val;
3ee0ccee782341 Tomer Maimon 2022-10-02  55  	u64 ret;
3ee0ccee782341 Tomer Maimon 2022-10-02  56  
3ee0ccee782341 Tomer Maimon 2022-10-02  57  	if (parent_rate == 0) {
3ee0ccee782341 Tomer Maimon 2022-10-02  58  		pr_debug("%s: parent rate is zero\n", __func__);
3ee0ccee782341 Tomer Maimon 2022-10-02  59  		return 0;
3ee0ccee782341 Tomer Maimon 2022-10-02  60  	}
3ee0ccee782341 Tomer Maimon 2022-10-02  61  
3ee0ccee782341 Tomer Maimon 2022-10-02  62  	val = readl_relaxed(pll->pllcon + pll->pll.reg);
3ee0ccee782341 Tomer Maimon 2022-10-02  63  
3ee0ccee782341 Tomer Maimon 2022-10-02  64  	indv = FIELD_GET(PLLCON_INDV, val);
3ee0ccee782341 Tomer Maimon 2022-10-02  65  	fbdv = FIELD_GET(PLLCON_FBDV, val);
3ee0ccee782341 Tomer Maimon 2022-10-02  66  	otdv1 = FIELD_GET(PLLCON_OTDV1, val);
3ee0ccee782341 Tomer Maimon 2022-10-02  67  	otdv2 = FIELD_GET(PLLCON_OTDV2, val);
3ee0ccee782341 Tomer Maimon 2022-10-02  68  
3ee0ccee782341 Tomer Maimon 2022-10-02  69  	ret = (u64)parent_rate * fbdv;
3ee0ccee782341 Tomer Maimon 2022-10-02 @70  	do_div(ret, indv * otdv1 * otdv2);
3ee0ccee782341 Tomer Maimon 2022-10-02  71  
3ee0ccee782341 Tomer Maimon 2022-10-02  72  	return ret;
3ee0ccee782341 Tomer Maimon 2022-10-02  73  }
3ee0ccee782341 Tomer Maimon 2022-10-02  74  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
