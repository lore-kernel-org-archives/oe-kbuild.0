Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D157C
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 00:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690419098; x=1721955098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mtOsWQlZaIMDPgKeYgo+w2JajmAfsPVWgvVnCJbXvnQ=;
  b=SR+Wf8iL7Yffz6fHwUtDjV78KAoD8H91EEfZM9XfyjLPbFGtcTjvE64Q
   2YPrKbICUbAr44qf2ASCpnwPIELnUUASUZyNMySD6CbdMQ5cdfZ3GQSwL
   GM4Evpkcp78OOtZind3X5x015m9LINXxRDEnB+VYoHQl0ymB+RExhzx+m
   A3e0FWv/ATc20tqYjRvFNBW3aMDvoeO7lEw8sDvM7sfjUW5jYBl9tUOGI
   99g8wxBAs+cY7LPOw1LozfrvkwWmZfyotWZjnuIkfe5A4djTK0nFJeNzc
   rOYUkFxa+tV0x8ax9BDZ/GHJLgeZwRvkQb/yblrPYMA7sRSeDuGMLCud2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="431970387"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="431970387"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 17:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="792104330"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="792104330"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2023 17:51:36 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOpE7-0001UZ-1k;
	Thu, 27 Jul 2023 00:51:35 +0000
Date: Thu, 27 Jul 2023 08:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2742/4710] drivers/clk/clk-versaclock3.c:404:2-8:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_ul
 instead.
Message-ID: <202307270841.yr5HxYIl-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ba5d07205771c50789fd9063950aa75e7f1183f
commit: 6e9aff555db7b6816076121ac3feebc3006de9ad [2742/4710] clk: Add support for versa3 clock driver
:::::: branch date: 19 hours ago
:::::: commit date: 7 days ago
config: sparc64-randconfig-r061-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270841.yr5HxYIl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270841.yr5HxYIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307270841.yr5HxYIl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +404 drivers/clk/clk-versaclock3.c

6e9aff555db7b6 Biju Das 2023-07-05  382  
6e9aff555db7b6 Biju Das 2023-07-05  383  static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
6e9aff555db7b6 Biju Das 2023-07-05  384  			       unsigned long *parent_rate)
6e9aff555db7b6 Biju Das 2023-07-05  385  {
6e9aff555db7b6 Biju Das 2023-07-05  386  	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
6e9aff555db7b6 Biju Das 2023-07-05  387  	const struct vc3_pll_data *pll = vc3->data;
6e9aff555db7b6 Biju Das 2023-07-05  388  	u64 div_frc;
6e9aff555db7b6 Biju Das 2023-07-05  389  
6e9aff555db7b6 Biju Das 2023-07-05  390  	if (rate < pll->vco_min)
6e9aff555db7b6 Biju Das 2023-07-05  391  		rate = pll->vco_min;
6e9aff555db7b6 Biju Das 2023-07-05  392  	if (rate > pll->vco_max)
6e9aff555db7b6 Biju Das 2023-07-05  393  		rate = pll->vco_max;
6e9aff555db7b6 Biju Das 2023-07-05  394  
6e9aff555db7b6 Biju Das 2023-07-05  395  	vc3->div_int = rate / *parent_rate;
6e9aff555db7b6 Biju Das 2023-07-05  396  
6e9aff555db7b6 Biju Das 2023-07-05  397  	if (pll->num == VC3_PLL2) {
6e9aff555db7b6 Biju Das 2023-07-05  398  		if (vc3->div_int > 0x7ff)
6e9aff555db7b6 Biju Das 2023-07-05  399  			rate = *parent_rate * 0x7ff;
6e9aff555db7b6 Biju Das 2023-07-05  400  
6e9aff555db7b6 Biju Das 2023-07-05  401  		/* Determine best fractional part, which is 16 bit wide */
6e9aff555db7b6 Biju Das 2023-07-05  402  		div_frc = rate % *parent_rate;
6e9aff555db7b6 Biju Das 2023-07-05  403  		div_frc *= BIT(16) - 1;
6e9aff555db7b6 Biju Das 2023-07-05 @404  		do_div(div_frc, *parent_rate);
6e9aff555db7b6 Biju Das 2023-07-05  405  
6e9aff555db7b6 Biju Das 2023-07-05  406  		vc3->div_frc = (u32)div_frc;
6e9aff555db7b6 Biju Das 2023-07-05  407  		rate = (*parent_rate *
6e9aff555db7b6 Biju Das 2023-07-05  408  			(vc3->div_int * VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
6e9aff555db7b6 Biju Das 2023-07-05  409  	} else {
6e9aff555db7b6 Biju Das 2023-07-05  410  		rate = *parent_rate * vc3->div_int;
6e9aff555db7b6 Biju Das 2023-07-05  411  	}
6e9aff555db7b6 Biju Das 2023-07-05  412  
6e9aff555db7b6 Biju Das 2023-07-05  413  	return rate;
6e9aff555db7b6 Biju Das 2023-07-05  414  }
6e9aff555db7b6 Biju Das 2023-07-05  415  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
