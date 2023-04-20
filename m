Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8345717FF
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Apr 2023 03:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681961839; x=1713497839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9BUKryWbezi1XVFwxBdsSbA7BcjDHVEcKk8kOpAdnMU=;
  b=IKTR28zhuzXBAUpaJbQ5k9l7wkkHcak5QJP92kUJUiAolG0kfdP87Fps
   hy5A4600owF/TqPG0jwgZTwh+f6wlssnk7FMYRTCQPvWxYpcnDWeoIGXZ
   OBLDCwb8Nt1iUGiR4OaG36pAYBM+coFYDOooMLyxT8f63hAnOVUD+cD27
   VP+VcY9ET71XZDv+luSe17h4bsCJ673tqVBilHvXxx8Mw5k5v/Q4bI7Vd
   xlvVHxX1ESmpK14NIDfpmLRqRfYuMqKRsMcyWRKKZahLpuh8dMWL6qaDn
   Y+rnCOdRQiQLoHa3ALbbmMhYSz0l41tkyweEvg7NbJfdsp0YaE+88X99x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334444176"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="334444176"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 20:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="866066099"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="866066099"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Apr 2023 20:37:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppL6f-000fQA-2J;
	Thu, 20 Apr 2023 03:37:13 +0000
Date: Thu, 20 Apr 2023 11:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10668/13075]
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298 mtk_hdmi_pll_calc() error:
 uninitialized symbol 'ret'.
Message-ID: <202304201145.DNZ7akEE-lkp@intel.com>
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
TO: Guillaume Ranquet <granquet@baylibre.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cdbc01c40e34c57697f8934f2727a88551696be
commit: 45810d486bb44bd60213d5f09a713df81b987972 [10668/13075] phy: mediatek: add support for phy-mtk-hdmi-mt8195
:::::: branch date: 8 hours ago
:::::: commit date: 7 days ago
config: csky-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230420/202304201145.DNZ7akEE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304201145.DNZ7akEE-lkp@intel.com/

New smatch warnings:
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298 mtk_hdmi_pll_calc() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240 mtk_hdmi_pll_calc() warn: impossible condition '(tmds_clk < 1.483500e+02 * 1000000) => (0.000000e+00-1.844674e+19 < -1.786711e-113)'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:242 mtk_hdmi_pll_calc() warn: always true condition '(tmds_clk >= 1.483500e+02 * 1000000) => (0-u64max >= -1.786711e-113)'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:242 mtk_hdmi_pll_calc() warn: impossible condition '(tmds_clk < 2.967000e+02 * 1000000) => (0.000000e+00-1.844674e+19 < -4.419080e+60)'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:244 mtk_hdmi_pll_calc() warn: always true condition '(tmds_clk >= 2.967000e+02 * 1000000) => (0-u64max >= -4.419080e+60)'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:331 mtk_hdmi_pll_drv_setting() warn: always true condition '(pixel_clk >= 7.417500e+01 * 1000000) => (0-u32max >= -7.223985e-287)'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:336 mtk_hdmi_pll_drv_setting() warn: impossible condition '(pixel_clk < 7.417500e+01 * 1000000) => (0.000000e+00-4.294967e+09 < -7.223985e-287)'

vim +/ret +298 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c

45810d486bb44b Guillaume Ranquet 2023-02-16  208  
45810d486bb44b Guillaume Ranquet 2023-02-16  209  static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
45810d486bb44b Guillaume Ranquet 2023-02-16  210  			     unsigned long rate, unsigned long parent_rate)
45810d486bb44b Guillaume Ranquet 2023-02-16  211  {
45810d486bb44b Guillaume Ranquet 2023-02-16  212  	u8 digital_div, txprediv, txposdiv, fbkdiv_high, posdiv1, posdiv2;
45810d486bb44b Guillaume Ranquet 2023-02-16  213  	u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
45810d486bb44b Guillaume Ranquet 2023-02-16  214  	u8 txpredivs[4] = { 2, 4, 6, 12 };
45810d486bb44b Guillaume Ranquet 2023-02-16  215  	u32 fbkdiv_low;
45810d486bb44b Guillaume Ranquet 2023-02-16  216  	int i, ret;
45810d486bb44b Guillaume Ranquet 2023-02-16  217  
45810d486bb44b Guillaume Ranquet 2023-02-16  218  	pixel_clk = rate;
45810d486bb44b Guillaume Ranquet 2023-02-16  219  	tmds_clk = pixel_clk;
45810d486bb44b Guillaume Ranquet 2023-02-16  220  
45810d486bb44b Guillaume Ranquet 2023-02-16  221  	if (tmds_clk < 25 * MEGA || tmds_clk > 594 * MEGA)
45810d486bb44b Guillaume Ranquet 2023-02-16  222  		return -EINVAL;
45810d486bb44b Guillaume Ranquet 2023-02-16  223  
45810d486bb44b Guillaume Ranquet 2023-02-16  224  	if (tmds_clk >= 340 * MEGA)
45810d486bb44b Guillaume Ranquet 2023-02-16  225  		hdmi_phy->tmds_over_340M = true;
45810d486bb44b Guillaume Ranquet 2023-02-16  226  	else
45810d486bb44b Guillaume Ranquet 2023-02-16  227  		hdmi_phy->tmds_over_340M = false;
45810d486bb44b Guillaume Ranquet 2023-02-16  228  
45810d486bb44b Guillaume Ranquet 2023-02-16  229  	/* in Hz */
45810d486bb44b Guillaume Ranquet 2023-02-16  230  	da_hdmitx21_ref_ck = 26 * MEGA;
45810d486bb44b Guillaume Ranquet 2023-02-16  231  
45810d486bb44b Guillaume Ranquet 2023-02-16  232  	/*  TXPOSDIV stage treatment:
45810d486bb44b Guillaume Ranquet 2023-02-16  233  	 *	0M  <  TMDS clk  < 54M		  /8
45810d486bb44b Guillaume Ranquet 2023-02-16  234  	 *	54M <= TMDS clk  < 148.35M    /4
45810d486bb44b Guillaume Ranquet 2023-02-16  235  	 *	148.35M <=TMDS clk < 296.7M   /2
45810d486bb44b Guillaume Ranquet 2023-02-16  236  	 *	296.7 <=TMDS clk <= 594M	  /1
45810d486bb44b Guillaume Ranquet 2023-02-16  237  	 */
45810d486bb44b Guillaume Ranquet 2023-02-16  238  	if (tmds_clk < 54 * MEGA)
45810d486bb44b Guillaume Ranquet 2023-02-16  239  		txposdiv = 8;
45810d486bb44b Guillaume Ranquet 2023-02-16  240  	else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
45810d486bb44b Guillaume Ranquet 2023-02-16  241  		txposdiv = 4;
45810d486bb44b Guillaume Ranquet 2023-02-16  242  	else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
45810d486bb44b Guillaume Ranquet 2023-02-16  243  		txposdiv = 2;
45810d486bb44b Guillaume Ranquet 2023-02-16  244  	else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
45810d486bb44b Guillaume Ranquet 2023-02-16  245  		txposdiv = 1;
45810d486bb44b Guillaume Ranquet 2023-02-16  246  	else
45810d486bb44b Guillaume Ranquet 2023-02-16  247  		return -EINVAL;
45810d486bb44b Guillaume Ranquet 2023-02-16  248  
45810d486bb44b Guillaume Ranquet 2023-02-16  249  	/* calculate txprediv: can be 2, 4, 6, 12
45810d486bb44b Guillaume Ranquet 2023-02-16  250  	 * ICO clk = 5*TMDS_CLK*TXPOSDIV*TXPREDIV
45810d486bb44b Guillaume Ranquet 2023-02-16  251  	 * ICO clk constraint: 5G =< ICO clk <= 12G
45810d486bb44b Guillaume Ranquet 2023-02-16  252  	 */
45810d486bb44b Guillaume Ranquet 2023-02-16  253  	for (i = 0; i < ARRAY_SIZE(txpredivs); i++) {
45810d486bb44b Guillaume Ranquet 2023-02-16  254  		ns_hdmipll_ck = 5 * tmds_clk * txposdiv * txpredivs[i];
45810d486bb44b Guillaume Ranquet 2023-02-16  255  		if (ns_hdmipll_ck >= 5 * GIGA &&
45810d486bb44b Guillaume Ranquet 2023-02-16  256  		    ns_hdmipll_ck <= 1 * GIGA)
45810d486bb44b Guillaume Ranquet 2023-02-16  257  			break;
45810d486bb44b Guillaume Ranquet 2023-02-16  258  	}
45810d486bb44b Guillaume Ranquet 2023-02-16  259  	if (i == (ARRAY_SIZE(txpredivs) - 1) &&
45810d486bb44b Guillaume Ranquet 2023-02-16  260  	    (ns_hdmipll_ck < 5 * GIGA || ns_hdmipll_ck > 12 * GIGA)) {
45810d486bb44b Guillaume Ranquet 2023-02-16  261  		return -EINVAL;
45810d486bb44b Guillaume Ranquet 2023-02-16  262  	}
45810d486bb44b Guillaume Ranquet 2023-02-16  263  	if (i == ARRAY_SIZE(txpredivs))
45810d486bb44b Guillaume Ranquet 2023-02-16  264  		return -EINVAL;
45810d486bb44b Guillaume Ranquet 2023-02-16  265  
45810d486bb44b Guillaume Ranquet 2023-02-16  266  	txprediv = txpredivs[i];
45810d486bb44b Guillaume Ranquet 2023-02-16  267  
45810d486bb44b Guillaume Ranquet 2023-02-16  268  	/* PCW calculation: FBKDIV
45810d486bb44b Guillaume Ranquet 2023-02-16  269  	 * formula: pcw=(frequency_out*2^pcw_bit) / frequency_in / FBKDIV_HS3;
45810d486bb44b Guillaume Ranquet 2023-02-16  270  	 * RG_HDMITXPLL_FBKDIV[32:0]:
45810d486bb44b Guillaume Ranquet 2023-02-16  271  	 * [32,24] 9bit integer, [23,0]:24bit fraction
45810d486bb44b Guillaume Ranquet 2023-02-16  272  	 */
45810d486bb44b Guillaume Ranquet 2023-02-16  273  	pcw = div_u64(((u64)ns_hdmipll_ck) << PCW_DECIMAL_WIDTH,
45810d486bb44b Guillaume Ranquet 2023-02-16  274  		      da_hdmitx21_ref_ck / PLL_FBKDIV_HS3);
45810d486bb44b Guillaume Ranquet 2023-02-16  275  
45810d486bb44b Guillaume Ranquet 2023-02-16  276  	if (pcw > GENMASK_ULL(32, 0))
45810d486bb44b Guillaume Ranquet 2023-02-16  277  		return -EINVAL;
45810d486bb44b Guillaume Ranquet 2023-02-16  278  
45810d486bb44b Guillaume Ranquet 2023-02-16  279  	fbkdiv_high = FIELD_GET(GENMASK_ULL(63, 32), pcw);
45810d486bb44b Guillaume Ranquet 2023-02-16  280  	fbkdiv_low = FIELD_GET(GENMASK(31, 0), pcw);
45810d486bb44b Guillaume Ranquet 2023-02-16  281  
45810d486bb44b Guillaume Ranquet 2023-02-16  282  	/* posdiv1:
45810d486bb44b Guillaume Ranquet 2023-02-16  283  	 * posdiv1 stage treatment according to color_depth:
45810d486bb44b Guillaume Ranquet 2023-02-16  284  	 * 24bit -> posdiv1 /10, 30bit -> posdiv1 /12.5,
45810d486bb44b Guillaume Ranquet 2023-02-16  285  	 * 36bit -> posdiv1 /15, 48bit -> posdiv1 /10
45810d486bb44b Guillaume Ranquet 2023-02-16  286  	 */
45810d486bb44b Guillaume Ranquet 2023-02-16  287  	posdiv1 = 10;
45810d486bb44b Guillaume Ranquet 2023-02-16  288  	posdiv2 = 1;
45810d486bb44b Guillaume Ranquet 2023-02-16  289  
45810d486bb44b Guillaume Ranquet 2023-02-16  290  	/* Digital clk divider, max /32 */
45810d486bb44b Guillaume Ranquet 2023-02-16  291  	digital_div = div_u64((u64)ns_hdmipll_ck, posdiv1 / posdiv2 / pixel_clk);
45810d486bb44b Guillaume Ranquet 2023-02-16  292  	if (!(digital_div <= 32 && digital_div >= 1))
45810d486bb44b Guillaume Ranquet 2023-02-16  293  		return -EINVAL;
45810d486bb44b Guillaume Ranquet 2023-02-16  294  
45810d486bb44b Guillaume Ranquet 2023-02-16  295  	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
45810d486bb44b Guillaume Ranquet 2023-02-16  296  			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
45810d486bb44b Guillaume Ranquet 2023-02-16  297  			    txposdiv, digital_div);
45810d486bb44b Guillaume Ranquet 2023-02-16 @298  	if (ret)
45810d486bb44b Guillaume Ranquet 2023-02-16  299  		return -EINVAL;
45810d486bb44b Guillaume Ranquet 2023-02-16  300  
45810d486bb44b Guillaume Ranquet 2023-02-16  301  	return 0;
45810d486bb44b Guillaume Ranquet 2023-02-16  302  }
45810d486bb44b Guillaume Ranquet 2023-02-16  303  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
