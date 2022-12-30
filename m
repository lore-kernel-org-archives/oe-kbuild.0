Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B9728F7
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Dec 2022 17:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672422107; x=1703958107;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=25seQWRMxPDifKsq08ce2hrJG95U3cTbjbY46H0CnXc=;
  b=k2FY9lb06NCCMJ+ooabHJ5E/rRyLWADBUym2soM48x2MfWILvFaqrvyK
   xaIt5hctEnhmTH6enZm3lXyQsFNPyJJSPBey4u+Bdu4tEwMCzzVzofOlN
   Dck/bvGeyxDxxmzd2gyoWDDI6SLtl32g5r8HNzUkpmjoAJq8youJVu/0B
   mRitIo90/1UIkEQQxN+Rg2JZVumChLIGx2Wby0Y4u3MnjKZJpNvQa9obK
   TvQlDMeWcXurR0Ul7Ywl1FQVh5Kyfzd38XmabspgPFwCnZVkDt66nEGlD
   vFLoRZ1O6BuoNeHkHH/lo78bB4IWU1cPmE15c0d8lk7ZbOpbftgQ/jrkt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="301607537"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; 
   d="scan'208";a="301607537"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 09:41:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="686312897"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; 
   d="scan'208";a="686312897"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Dec 2022 09:41:44 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBJO3-000IEr-38;
	Fri, 30 Dec 2022 17:41:43 +0000
Date: Sat, 31 Dec 2022 01:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:drm-misc-next 3/3]
 drivers/gpu/drm/imx/ipuv3/imx-tve.c:189:34: warning: Operator '|' with one
 operand equal to zero is redundant. [badBitmaskCheck]
Message-ID: <202212310154.ybNNYHEf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/imx/ipuv3/imx-tve.c:189:34: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: dri-devel@lists.freedesktop.org
TO: Lucas Stach <l.stach@pengutronix.de>
CC: Philipp Zabel <p.zabel@pengutronix.de>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   12cf36c7125e5313249230e6235b4bfb2c4f765f
commit: 4b6cb2b67da883bc5095ee6d77f951f1cd7a1c24 [3/3] drm/imx: move IPUv3 driver into separate subdirectory
:::::: branch date: 20 hours ago
:::::: commit date: 2 weeks ago
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4b6cb2b67da883bc5095ee6d77f951f1cd7a1c24
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/imx/ipuv3/imx-tve.c:189:34: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
    val  |= TVE_TV_STAND_HD_1080P30 | 0;
                                    ^
>> drivers/gpu/drm/imx/ipuv3/imx-tve.c:368:22: warning: Parameter 'prate' can be declared as pointer to const [constParameter]
         unsigned long *prate)
                        ^

vim +189 drivers/gpu/drm/imx/ipuv3/imx-tve.c

fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  162  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  163  static int tve_setup_vga(struct imx_tve *tve)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  164  {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  165  	unsigned int mask;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  166  	unsigned int val;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  167  	int ret;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  168  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  169  	/* set gain to (1 + 10/128) to provide 0.7V peak-to-peak amplitude */
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  170  	ret = regmap_update_bits(tve->regmap, TVE_TVDAC0_CONT_REG,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  171  				 TVE_TVDAC_GAIN_MASK, 0x0a);
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  172  	if (ret)
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  173  		return ret;
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  174  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  175  	ret = regmap_update_bits(tve->regmap, TVE_TVDAC1_CONT_REG,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  176  				 TVE_TVDAC_GAIN_MASK, 0x0a);
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  177  	if (ret)
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  178  		return ret;
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  179  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  180  	ret = regmap_update_bits(tve->regmap, TVE_TVDAC2_CONT_REG,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  181  				 TVE_TVDAC_GAIN_MASK, 0x0a);
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  182  	if (ret)
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  183  		return ret;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  184  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  185  	/* set configuration register */
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  186  	mask = TVE_DATA_SOURCE_MASK | TVE_INP_VIDEO_FORM;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  187  	val  = TVE_DATA_SOURCE_BUS2 | TVE_INP_YCBCR_444;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  188  	mask |= TVE_TV_STAND_MASK       | TVE_P2I_CONV_EN;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08 @189  	val  |= TVE_TV_STAND_HD_1080P30 | 0;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  190  	mask |= TVE_TV_OUT_MODE_MASK | TVE_SYNC_CH_0_EN;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  191  	val  |= TVE_TV_OUT_RGB       | TVE_SYNC_CH_0_EN;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  192  	ret = regmap_update_bits(tve->regmap, TVE_COM_CONF_REG, mask, val);
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  193  	if (ret)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  194  		return ret;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  195  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  196  	/* set test mode (as documented) */
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  197  	return regmap_update_bits(tve->regmap, TVE_TST_MODE_REG,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  198  				 TVE_TVDAC_TEST_MODE_MASK, 1);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  199  }
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  200  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  201  static int imx_tve_connector_get_modes(struct drm_connector *connector)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  202  {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  203  	struct imx_tve *tve = con_to_tve(connector);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  204  	struct edid *edid;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  205  	int ret = 0;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  206  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  207  	if (!tve->ddc)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  208  		return 0;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  209  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  210  	edid = drm_get_edid(connector, tve->ddc);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  211  	if (edid) {
c555f02371c338 drivers/gpu/drm/imx/imx-tve.c     Daniel Vetter      2018-07-09  212  		drm_connector_update_edid_property(connector, edid);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  213  		ret = drm_add_edid_modes(connector, edid);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  214  		kfree(edid);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  215  	}
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  216  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  217  	return ret;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  218  }
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  219  
fc007fb815ab53 drivers/gpu/drm/imx/imx-tve.c     Nathan Huckleberry 2022-09-13  220  static enum drm_mode_status
fc007fb815ab53 drivers/gpu/drm/imx/imx-tve.c     Nathan Huckleberry 2022-09-13  221  imx_tve_connector_mode_valid(struct drm_connector *connector,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  222  			     struct drm_display_mode *mode)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  223  {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  224  	struct imx_tve *tve = con_to_tve(connector);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  225  	unsigned long rate;
baa68c4bfd9f85 drivers/staging/imx-drm/imx-tve.c Russell King       2013-11-09  226  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  227  	/* pixel clock with 2x oversampling */
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  228  	rate = clk_round_rate(tve->clk, 2000UL * mode->clock) / 2000;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  229  	if (rate == mode->clock)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  230  		return MODE_OK;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  231  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  232  	/* pixel clock without oversampling */
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  233  	rate = clk_round_rate(tve->clk, 1000UL * mode->clock) / 1000;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  234  	if (rate == mode->clock)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  235  		return MODE_OK;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  236  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  237  	dev_warn(tve->dev, "ignoring mode %dx%d\n",
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  238  		 mode->hdisplay, mode->vdisplay);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  239  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  240  	return MODE_BAD;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  241  }
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  242  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  243  static void imx_tve_encoder_mode_set(struct drm_encoder *encoder,
eb10d6355532de drivers/gpu/drm/imx/imx-tve.c     Steve Longerbeam   2014-12-18  244  				     struct drm_display_mode *orig_mode,
eb10d6355532de drivers/gpu/drm/imx/imx-tve.c     Steve Longerbeam   2014-12-18  245  				     struct drm_display_mode *mode)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  246  {
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  247  	struct imx_tve *tve = enc_to_tve(encoder);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  248  	unsigned long rounded_rate;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  249  	unsigned long rate;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  250  	int div = 1;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  251  	int ret;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  252  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  253  	/*
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  254  	 * FIXME
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  255  	 * we should try 4k * mode->clock first,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  256  	 * and enable 4x oversampling for lower resolutions
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  257  	 */
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  258  	rate = 2000UL * mode->clock;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  259  	clk_set_rate(tve->clk, rate);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  260  	rounded_rate = clk_get_rate(tve->clk);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  261  	if (rounded_rate >= rate)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  262  		div = 2;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  263  	clk_set_rate(tve->di_clk, rounded_rate / div);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  264  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  265  	ret = clk_set_parent(tve->di_sel_clk, tve->di_clk);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  266  	if (ret < 0) {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  267  		dev_err(tve->dev, "failed to set di_sel parent to tve_di: %d\n",
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  268  			ret);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  269  	}
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  270  
f6e396e5096dec drivers/gpu/drm/imx/imx-tve.c     Liu Ying           2016-07-08  271  	regmap_update_bits(tve->regmap, TVE_COM_CONF_REG,
f6e396e5096dec drivers/gpu/drm/imx/imx-tve.c     Liu Ying           2016-07-08  272  			   TVE_IPU_CLK_EN, TVE_IPU_CLK_EN);
f6e396e5096dec drivers/gpu/drm/imx/imx-tve.c     Liu Ying           2016-07-08  273  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  274  	if (tve->mode == TVE_MODE_VGA)
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  275  		ret = tve_setup_vga(tve);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  276  	else
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  277  		ret = tve_setup_tvout(tve);
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  278  	if (ret)
f555e7ea03205e drivers/gpu/drm/imx/imx-tve.c     Fabio Estevam      2015-01-20  279  		dev_err(tve->dev, "failed to set configuration: %d\n", ret);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  280  }
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  281  
f6e396e5096dec drivers/gpu/drm/imx/imx-tve.c     Liu Ying           2016-07-08  282  static void imx_tve_encoder_enable(struct drm_encoder *encoder)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  283  {
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  284  	struct imx_tve *tve = enc_to_tve(encoder);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  285  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  286  	tve_enable(tve);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  287  }
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  288  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  289  static void imx_tve_encoder_disable(struct drm_encoder *encoder)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  290  {
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  291  	struct imx_tve *tve = enc_to_tve(encoder);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  292  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  293  	tve_disable(tve);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  294  }
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  295  
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  296  static int imx_tve_atomic_check(struct drm_encoder *encoder,
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  297  				struct drm_crtc_state *crtc_state,
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  298  				struct drm_connector_state *conn_state)
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  299  {
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  300  	struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  301  	struct imx_tve *tve = enc_to_tve(encoder);
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  302  
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  303  	imx_crtc_state->bus_format = MEDIA_BUS_FMT_GBR888_1X24;
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  304  	imx_crtc_state->di_hsync_pin = tve->di_hsync_pin;
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  305  	imx_crtc_state->di_vsync_pin = tve->di_vsync_pin;
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  306  
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  307  	return 0;
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  308  }
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  309  
7ae847dd379af6 drivers/gpu/drm/imx/imx-tve.c     Ville Syrjälä      2015-12-15  310  static const struct drm_connector_funcs imx_tve_connector_funcs = {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  311  	.fill_modes = drm_helper_probe_single_connector_modes,
1b3f7675663384 drivers/staging/imx-drm/imx-tve.c Russell King       2013-11-03  312  	.destroy = imx_drm_connector_destroy,
255c35f8fe6a9c drivers/gpu/drm/imx/imx-tve.c     Liu Ying           2016-07-08  313  	.reset = drm_atomic_helper_connector_reset,
255c35f8fe6a9c drivers/gpu/drm/imx/imx-tve.c     Liu Ying           2016-07-08  314  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
255c35f8fe6a9c drivers/gpu/drm/imx/imx-tve.c     Liu Ying           2016-07-08  315  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  316  };
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  317  
7ae847dd379af6 drivers/gpu/drm/imx/imx-tve.c     Ville Syrjälä      2015-12-15  318  static const struct drm_connector_helper_funcs imx_tve_connector_helper_funcs = {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  319  	.get_modes = imx_tve_connector_get_modes,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  320  	.mode_valid = imx_tve_connector_mode_valid,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  321  };
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  322  
7ae847dd379af6 drivers/gpu/drm/imx/imx-tve.c     Ville Syrjälä      2015-12-15  323  static const struct drm_encoder_helper_funcs imx_tve_encoder_helper_funcs = {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  324  	.mode_set = imx_tve_encoder_mode_set,
f6e396e5096dec drivers/gpu/drm/imx/imx-tve.c     Liu Ying           2016-07-08  325  	.enable = imx_tve_encoder_enable,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  326  	.disable = imx_tve_encoder_disable,
49f98bc4d44a4e drivers/gpu/drm/imx/imx-tve.c     Philipp Zabel      2016-07-06  327  	.atomic_check = imx_tve_atomic_check,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  328  };
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  329  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  330  static irqreturn_t imx_tve_irq_handler(int irq, void *data)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  331  {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  332  	struct imx_tve *tve = data;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  333  	unsigned int val;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  334  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  335  	regmap_read(tve->regmap, TVE_STAT_REG, &val);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  336  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  337  	/* clear interrupt status register */
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  338  	regmap_write(tve->regmap, TVE_STAT_REG, 0xffffffff);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  339  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  340  	return IRQ_HANDLED;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  341  }
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  342  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  343  static unsigned long clk_tve_di_recalc_rate(struct clk_hw *hw,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  344  					    unsigned long parent_rate)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  345  {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  346  	struct imx_tve *tve = container_of(hw, struct imx_tve, clk_hw_di);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  347  	unsigned int val;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  348  	int ret;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  349  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  350  	ret = regmap_read(tve->regmap, TVE_COM_CONF_REG, &val);
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  351  	if (ret < 0)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  352  		return 0;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  353  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  354  	switch (val & TVE_DAC_SAMP_RATE_MASK) {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  355  	case TVE_DAC_DIV4_RATE:
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  356  		return parent_rate / 4;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  357  	case TVE_DAC_DIV2_RATE:
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  358  		return parent_rate / 2;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  359  	case TVE_DAC_FULL_RATE:
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  360  	default:
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  361  		return parent_rate;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  362  	}
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  363  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  364  	return 0;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  365  }
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  366  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  367  static long clk_tve_di_round_rate(struct clk_hw *hw, unsigned long rate,
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08 @368  				  unsigned long *prate)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  369  {
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  370  	unsigned long div;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  371  
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  372  	div = *prate / rate;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  373  	if (div >= 4)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  374  		return *prate / 4;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  375  	else if (div >= 2)
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  376  		return *prate / 2;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  377  	return *prate;
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  378  }
fcbc51e54d2aa9 drivers/staging/imx-drm/imx-tve.c Philipp Zabel      2013-04-08  379  

:::::: The code at line 189 was first introduced by commit
:::::: fcbc51e54d2aa9d402206601f4894251049e5d77 staging: drm/imx: Add support for Television Encoder (TVEv2)

:::::: TO: Philipp Zabel <p.zabel@pengutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
