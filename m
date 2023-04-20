Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1072223CC
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Apr 2023 06:25:40 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id eo4-20020a05600c82c400b003f05a99a841so555725wmb.3
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Apr 2023 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681971939; x=1684563939;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NFhHDF1psdDMQg2re0gGckai+LsKOgT2vLsJBqkEfU=;
        b=sb91LTJoIgpg0PtCq1XUN7xQxL1U2RQiJ7yupu0+jMrgZijUlDNY0op9XAu/QPsxsy
         /qH/VUfNPrnubc0t52AOvdRWBWn3Eb3Njs2lKWPsUVH6QHvDDCQYGoIxNmzvs+U4l0X8
         fMw2v3KCixitgMf//yVGPMcYnp0iwTGETe9HQIFVcDAcGlNKZqcZGhP8Psulxc2BJwuE
         NnlSnSR96Qsu1v3+Sg72b8xTAogdrMqAkLoolPOjjTMCUFTMsXFbVnF1188UZljjUauo
         VSmLo+WV/CteEMR7dzHOgE2tGo58rVfcCyfXjIr8zkurFA/iZKKVe+cmsxEh4OwFCXmg
         BUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681971939; x=1684563939;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NFhHDF1psdDMQg2re0gGckai+LsKOgT2vLsJBqkEfU=;
        b=RKOpwGa5jlj467ecUFGzTYw/ebtB98WW9sQm2ULImvhOKUMFPZ98w1PgYC4xaGoyDI
         P7lnhMrSbxBYHZ5ZtrzeirIUMhlWJVXCj9D5KG83HbdMIIUsWbhXxpZtc0KKnkIoiVc4
         8lRw7u9OSsy9CL9yZorW0dJITCIZ073E+WzSbDPRiDMEaWAHe3E8KFXCWv/sCs3S2SAC
         oEXqPAtZD+nIfej/YcagUwAERa5CxZ+h5NV7jbpyPqyrqH0EF3f293ZCGuXqfLSk2XF2
         19/pZek1UrVHzmoOE7e/KF5vtSL2GlQGNrAsvVZ2T9FSQTC3kVhnY6vlGEVFF3GIQBd8
         buCg==
X-Gm-Message-State: AAQBX9cahTHbpkEkz/+uIHrbw2dpTi6ApQTH0WCKrTCfHxuNr5IeGOlr
	gJ9edTNUH5I83a5cM7LjMAbEwdTGkMgPDmzASd+DRIvs
X-Google-Smtp-Source: AKy350YT5RsqT1MzowmqSyvfYNK3mDI1joAa6sPD2jyDs3z8vFFjPy4JLSFkwe0OoIPRTWBlcJox6Q==
X-Received: by 2002:a1c:ed18:0:b0:3ed:88f5:160a with SMTP id l24-20020a1ced18000000b003ed88f5160amr273315wmh.11.1681971938906;
        Wed, 19 Apr 2023 23:25:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q16-20020a7bce90000000b003f09d7b6e20sm990258wmj.2.2023.04.19.23.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 23:25:38 -0700 (PDT)
Date: Thu, 20 Apr 2023 09:25:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Guillaume Ranquet <granquet@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 10668/13075]
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298 mtk_hdmi_pll_calc() error:
 uninitialized symbol 'ret'.
Message-ID: <2f12282f-8fac-4f89-8aa9-65ae6d499827@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cdbc01c40e34c57697f8934f2727a88551696be
commit: 45810d486bb44bd60213d5f09a713df81b987972 [10668/13075] phy: mediatek: add support for phy-mtk-hdmi-mt8195
config: csky-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230420/202304201145.DNZ7akEE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304201145.DNZ7akEE-lkp@intel.com/

New smatch warnings:
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298 mtk_hdmi_pll_calc() error: uninitialized symbol 'ret'.

vim +/ret +298 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c

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

ret isn't initialized.

45810d486bb44b Guillaume Ranquet 2023-02-16  299  		return -EINVAL;
45810d486bb44b Guillaume Ranquet 2023-02-16  300  
45810d486bb44b Guillaume Ranquet 2023-02-16  301  	return 0;
45810d486bb44b Guillaume Ranquet 2023-02-16  302  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

