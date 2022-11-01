Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B92F5F
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Nov 2022 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667319674; x=1698855674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCmgcHJNq9TxIfKVnGqMH5b1G2CTvDprYzKNAumTxv8=;
  b=JVEPlAPx2SW5t70c7RY9tXF/9QtQZMw+P5ejSKINRT3RRUhKcjx80pV/
   V+xqvp2OlQcokVEZSwu3+PksNTWYgx/w2YWRTkzwj88FPTjuFMimxEhaj
   pWYCDP3TEvMALgGpW2EwSvlZrrYFP/tWptNwBg/LwCyf5YJP7bIRxf1RI
   yEtEU0hmI60R5GjH3fckJ5nLH/1PGewHr5QwPStPSL/mXR8ce06+1yJlJ
   zkCk8IEQysqmJ2Y+v0laa9gsvI7w+lrM3UHs3KR4NEa4sSMC61Tof0pT7
   BuIidABybkNEt0C/MUvDPrCsfQKDXL0LwRYIcVqOg2TBPMkrzabudsOdN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="306795188"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="306795188"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 09:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="611896372"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="611896372"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 01 Nov 2022 09:21:02 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1opu0b-000Dnt-1m;
	Tue, 01 Nov 2022 16:21:01 +0000
Date: Wed, 2 Nov 2022 00:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/renesas/r9a07g044-cpg.c:136:3: warning: Signed integer
 overflow for expression '0xBE8<<20'. [integerOverflow]
Message-ID: <202211020010.E0R1HZdJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/renesas/r9a07g044-cpg.c:136:3: warning: Signed integer overflow for expression '0xBE8<<20'. [integerOverflow]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5aaef24b5c6d4246b2cac1be949869fa36577737
commit: 60191843db7812dba4fdd2790a2d646721e13b21 clk: renesas: r9a07g044: Add M1 clock support
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 60191843db7812dba4fdd2790a2d646721e13b21
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/renesas/r9a07g044-cpg.c:136:3: warning: Signed integer overflow for expression '0xBE8<<20'. [integerOverflow]
     DEF_PLL5_4_MUX(".sel_pll5_4", CLK_SEL_PLL5_4, SEL_PLL5_4,
     ^

vim +136 drivers/clk/renesas/r9a07g044-cpg.c

70a4af3662e073 Biju Das      2021-09-22   87  
a1bcf50a99dd1e Biju Das      2022-02-05   88  static const struct {
60191843db7812 Biju Das      2022-04-30   89  	struct cpg_core_clk common[48];
a1bcf50a99dd1e Biju Das      2022-02-05   90  #ifdef CONFIG_CLK_R9A07G054
a1bcf50a99dd1e Biju Das      2022-02-05   91  	struct cpg_core_clk drp[0];
a1bcf50a99dd1e Biju Das      2022-02-05   92  #endif
a1bcf50a99dd1e Biju Das      2022-02-05   93  } core_clks __initconst = {
a1bcf50a99dd1e Biju Das      2022-02-05   94  	.common = {
17f0ff3d49ff1a Lad Prabhakar 2021-06-09   95  		/* External Clock Inputs */
17f0ff3d49ff1a Lad Prabhakar 2021-06-09   96  		DEF_INPUT("extal", CLK_EXTAL),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09   97  
17f0ff3d49ff1a Lad Prabhakar 2021-06-09   98  		/* Internal Core Clocks */
17f0ff3d49ff1a Lad Prabhakar 2021-06-09   99  		DEF_FIXED(".osc", R9A07G044_OSCCLK, CLK_EXTAL, 1, 1),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  100  		DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  101  		DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
b289cdecc7c3e2 Lad Prabhakar 2021-12-23  102  		DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
b289cdecc7c3e2 Lad Prabhakar 2021-12-23  103  		DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  104  		DEF_FIXED(".pll3_400", CLK_PLL3_400, CLK_PLL3, 1, 4),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  105  		DEF_FIXED(".pll3_533", CLK_PLL3_533, CLK_PLL3, 1, 3),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  106  
70a4af3662e073 Biju Das      2021-09-22  107  		DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
70a4af3662e073 Biju Das      2021-09-22  108  		DEF_FIXED(".pll5_fout3", CLK_PLL5_FOUT3, CLK_PLL5, 1, 6),
70a4af3662e073 Biju Das      2021-09-22  109  
70a4af3662e073 Biju Das      2021-09-22  110  		DEF_FIXED(".pll6", CLK_PLL6, CLK_EXTAL, 125, 6),
70a4af3662e073 Biju Das      2021-09-22  111  
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  112  		DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
373bd6f487562e Biju Das      2021-10-07  113  		DEF_FIXED(".clk_800", CLK_PLL2_800, CLK_PLL2, 1, 2),
373bd6f487562e Biju Das      2021-10-07  114  		DEF_FIXED(".clk_533", CLK_PLL2_SDHI_533, CLK_PLL2, 1, 3),
373bd6f487562e Biju Das      2021-10-07  115  		DEF_FIXED(".clk_400", CLK_PLL2_SDHI_400, CLK_PLL2_800, 1, 2),
373bd6f487562e Biju Das      2021-10-07  116  		DEF_FIXED(".clk_266", CLK_PLL2_SDHI_266, CLK_PLL2_SDHI_533, 1, 2),
373bd6f487562e Biju Das      2021-10-07  117  
dc446cba4301bb Biju Das      2021-11-10  118  		DEF_FIXED(".pll2_div2_8", CLK_PLL2_DIV2_8, CLK_PLL2_DIV2, 1, 8),
dc446cba4301bb Biju Das      2021-11-10  119  		DEF_FIXED(".pll2_div2_10", CLK_PLL2_DIV2_10, CLK_PLL2_DIV2, 1, 10),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  120  
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  121  		DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
98ee8b2f66ebff Biju Das      2021-12-03  122  		DEF_FIXED(".pll3_div2_2", CLK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
fd8c3f6c36eb09 Biju Das      2021-06-26  123  		DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
668756f7299d2d Biju Das      2021-06-26  124  		DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  125  		DEF_MUX(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3,
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  126  			sel_pll3_3, ARRAY_SIZE(sel_pll3_3), 0, CLK_MUX_READ_ONLY),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  127  		DEF_DIV("divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3,
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  128  			DIVPL3C, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  129  
70a4af3662e073 Biju Das      2021-09-22  130  		DEF_FIXED(".pll5_250", CLK_PLL5_250, CLK_PLL5_FOUT3, 1, 2),
70a4af3662e073 Biju Das      2021-09-22  131  		DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
7ef9c45a23a907 Biju Das      2021-12-03  132  		DEF_MUX(".sel_gpu2", CLK_SEL_GPU2, SEL_GPU2,
7ef9c45a23a907 Biju Das      2021-12-03  133  			sel_gpu2, ARRAY_SIZE(sel_gpu2), 0, CLK_MUX_READ_ONLY),
60191843db7812 Biju Das      2022-04-30  134  		DEF_PLL5_FOUTPOSTDIV(".pll5_foutpostdiv", CLK_PLL5_FOUTPOSTDIV, CLK_EXTAL),
60191843db7812 Biju Das      2022-04-30  135  		DEF_FIXED(".pll5_fout1ph0", CLK_PLL5_FOUT1PH0, CLK_PLL5_FOUTPOSTDIV, 1, 2),
60191843db7812 Biju Das      2022-04-30 @136  		DEF_PLL5_4_MUX(".sel_pll5_4", CLK_SEL_PLL5_4, SEL_PLL5_4,
60191843db7812 Biju Das      2022-04-30  137  			       sel_pll5_4, ARRAY_SIZE(sel_pll5_4)),
70a4af3662e073 Biju Das      2021-09-22  138  
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  139  		/* Core output clk */
d6dabaf6789717 Biju Das      2021-11-12  140  		DEF_DIV("I", R9A07G044_CLK_I, CLK_PLL1, DIVPL1A, dtable_1_8,
d6dabaf6789717 Biju Das      2021-11-12  141  			CLK_DIVIDER_HIWORD_MASK),
dc446cba4301bb Biju Das      2021-11-10  142  		DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV2_8, DIVPL2A,
e93c1373613fb2 Biju Das      2021-06-26  143  			dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
d28b1e03dc8d10 Lad Prabhakar 2021-07-19  144  		DEF_FIXED("P0_DIV2", R9A07G044_CLK_P0_DIV2, R9A07G044_CLK_P0, 1, 2),
dc446cba4301bb Biju Das      2021-11-10  145  		DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV2_10, 1, 1),
fd8c3f6c36eb09 Biju Das      2021-06-26  146  		DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV2_4,
e93c1373613fb2 Biju Das      2021-06-26  147  			DIVPL3B, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
eb829e549ba65e Biju Das      2021-06-26  148  		DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G044_CLK_P1, 1, 2),
668756f7299d2d Biju Das      2021-06-26  149  		DEF_DIV("P2", R9A07G044_CLK_P2, CLK_PLL3_DIV2_4_2,
668756f7299d2d Biju Das      2021-06-26  150  			DIVPL3A, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
70a4af3662e073 Biju Das      2021-09-22  151  		DEF_FIXED("M0", R9A07G044_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
70a4af3662e073 Biju Das      2021-09-22  152  		DEF_FIXED("ZT", R9A07G044_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
70a4af3662e073 Biju Das      2021-09-22  153  		DEF_MUX("HP", R9A07G044_CLK_HP, SEL_PLL6_2,
70a4af3662e073 Biju Das      2021-09-22  154  			sel_pll6_2, ARRAY_SIZE(sel_pll6_2), 0, CLK_MUX_HIWORD_MASK),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  155  		DEF_FIXED("SPI0", R9A07G044_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  156  		DEF_FIXED("SPI1", R9A07G044_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
373bd6f487562e Biju Das      2021-10-07  157  		DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0,
373bd6f487562e Biju Das      2021-10-07  158  			   sel_shdi, ARRAY_SIZE(sel_shdi)),
373bd6f487562e Biju Das      2021-10-07  159  		DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1,
373bd6f487562e Biju Das      2021-10-07  160  			   sel_shdi, ARRAY_SIZE(sel_shdi)),
373bd6f487562e Biju Das      2021-10-07  161  		DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
373bd6f487562e Biju Das      2021-10-07  162  		DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
7ef9c45a23a907 Biju Das      2021-12-03  163  		DEF_DIV("G", R9A07G044_CLK_G, CLK_SEL_GPU2, DIVGPU, dtable_1_8,
7ef9c45a23a907 Biju Das      2021-12-03  164  			CLK_DIVIDER_HIWORD_MASK),
60191843db7812 Biju Das      2022-04-30  165  		DEF_FIXED("M1", R9A07G044_CLK_M1, CLK_PLL5_FOUTPOSTDIV, 1, 1),
a1bcf50a99dd1e Biju Das      2022-02-05  166  	},
a1bcf50a99dd1e Biju Das      2022-02-05  167  #ifdef CONFIG_CLK_R9A07G054
a1bcf50a99dd1e Biju Das      2022-02-05  168  	.drp = {
a1bcf50a99dd1e Biju Das      2022-02-05  169  	},
a1bcf50a99dd1e Biju Das      2022-02-05  170  #endif
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  171  };
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  172  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
