Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD07A18037
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Aug 2023 19:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692301196; x=1723837196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9+Hy3uXismPteL0Ws0CDbAuiWV+fjRes645z7mc9TY=;
  b=VYWzrjHTXGWqR/KknS+1PA/SjL3KwGAVOikWoWF3dYV9K3edklaR1gvg
   GTSeY+aR/zaxk8MmvDtaR+mGnurGIVOot0Rdtf/ChjmvnuQQUKZB5GFgV
   eizr63uYIfgt6X7XrFIEtpL04a4k2Ghzmot6XGTeIS7FJejMMxycT2R0X
   ycv63WEi1vS5gXEM7pG3EwUO4dr0krG9OlE48XKAOQL9hGIx6wKeSqz7p
   4Lh6VKGZy7jRnbDi5Ujh5PTeXZuGwztABkUz0PBLm+sq1P+qhiFCjbCjP
   6XjcU5+08yGXt/GV+cEo1vN+2CvTsR8PdoOobH/wqpTaZsGcE0E6Sr4AI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="353221942"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="353221942"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 12:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="684558513"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="684558513"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Aug 2023 12:39:52 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWiqW-0001QN-0q;
	Thu, 17 Aug 2023 19:39:52 +0000
Date: Fri, 18 Aug 2023 03:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:129 tcon_ch1_calc_divider()
 error: uninitialized symbol 'is_double'.
Message-ID: <202308180347.HXHVaCzC-lkp@intel.com>
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
TO: Samuel Holland <samuel@sholland.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Guo Ren <guoren@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   16931859a6500d360b90aeacab3b505a3560a3ed
commit: 6f5178acf63614f2ee27450b2ab4d4980a698161 riscv: Add the Allwinner SoC family Kconfig option
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-m031-20230816 (https://download.01.org/0day-ci/archive/20230818/202308180347.HXHVaCzC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180347.HXHVaCzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308180347.HXHVaCzC-lkp@intel.com/

smatch warnings:
drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:129 tcon_ch1_calc_divider() error: uninitialized symbol 'is_double'.
drivers/clk/sunxi/clk-sunxi.c:1093 sunxi_divs_clk_setup() error: uninitialized symbol 'clk_name'.

vim +/is_double +129 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c

cc510c736b1b27 Maxime Ripard 2015-07-01   97  
cc510c736b1b27 Maxime Ripard 2015-07-01   98  static unsigned long tcon_ch1_calc_divider(unsigned long rate,
cc510c736b1b27 Maxime Ripard 2015-07-01   99  					   unsigned long parent_rate,
cc510c736b1b27 Maxime Ripard 2015-07-01  100  					   u8 *div,
cc510c736b1b27 Maxime Ripard 2015-07-01  101  					   bool *half)
cc510c736b1b27 Maxime Ripard 2015-07-01  102  {
cc510c736b1b27 Maxime Ripard 2015-07-01  103  	unsigned long best_rate = 0;
cc510c736b1b27 Maxime Ripard 2015-07-01  104  	u8 best_m = 0, m;
cc510c736b1b27 Maxime Ripard 2015-07-01  105  	bool is_double;
cc510c736b1b27 Maxime Ripard 2015-07-01  106  
cc510c736b1b27 Maxime Ripard 2015-07-01  107  	for (m = 1; m < 16; m++) {
cc510c736b1b27 Maxime Ripard 2015-07-01  108  		u8 d;
cc510c736b1b27 Maxime Ripard 2015-07-01  109  
cc510c736b1b27 Maxime Ripard 2015-07-01  110  		for (d = 1; d < 3; d++) {
cc510c736b1b27 Maxime Ripard 2015-07-01  111  			unsigned long tmp_rate;
cc510c736b1b27 Maxime Ripard 2015-07-01  112  
cc510c736b1b27 Maxime Ripard 2015-07-01  113  			tmp_rate = parent_rate / m / d;
cc510c736b1b27 Maxime Ripard 2015-07-01  114  
cc510c736b1b27 Maxime Ripard 2015-07-01  115  			if (tmp_rate > rate)
cc510c736b1b27 Maxime Ripard 2015-07-01  116  				continue;
cc510c736b1b27 Maxime Ripard 2015-07-01  117  
cc510c736b1b27 Maxime Ripard 2015-07-01  118  			if (!best_rate ||
cc510c736b1b27 Maxime Ripard 2015-07-01  119  			    (rate - tmp_rate) < (rate - best_rate)) {
cc510c736b1b27 Maxime Ripard 2015-07-01  120  				best_rate = tmp_rate;
cc510c736b1b27 Maxime Ripard 2015-07-01  121  				best_m = m;
cc510c736b1b27 Maxime Ripard 2015-07-01  122  				is_double = d;
cc510c736b1b27 Maxime Ripard 2015-07-01  123  			}
cc510c736b1b27 Maxime Ripard 2015-07-01  124  		}
cc510c736b1b27 Maxime Ripard 2015-07-01  125  	}
cc510c736b1b27 Maxime Ripard 2015-07-01  126  
cc510c736b1b27 Maxime Ripard 2015-07-01  127  	if (div && half) {
cc510c736b1b27 Maxime Ripard 2015-07-01  128  		*div = best_m;
cc510c736b1b27 Maxime Ripard 2015-07-01 @129  		*half = is_double;
cc510c736b1b27 Maxime Ripard 2015-07-01  130  	}
cc510c736b1b27 Maxime Ripard 2015-07-01  131  
cc510c736b1b27 Maxime Ripard 2015-07-01  132  	return best_rate;
cc510c736b1b27 Maxime Ripard 2015-07-01  133  }
cc510c736b1b27 Maxime Ripard 2015-07-01  134  

:::::: The code at line 129 was first introduced by commit
:::::: cc510c736b1b278a9925a4a051ecfa72ef8c21fc clk: sunxi: Add TCON channel1 clock

:::::: TO: Maxime Ripard <maxime.ripard@free-electrons.com>
:::::: CC: Maxime Ripard <maxime.ripard@free-electrons.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
