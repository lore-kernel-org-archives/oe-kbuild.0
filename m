Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277D3219ED
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 15:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aa9pjGNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699889938; x=1731425938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FkLYlpB1L0rJedrZwjx+9musfWaLjMPAq8JAYNj4zAo=;
  b=aa9pjGNlKVVA/ruYcqCae9XR2SgdwNDsqM+tPuvRwDQTgHLgezVJpsaQ
   bte2jwOR7mpxIx/2611dAih8fQ0RMraEB3rc0irnnbYV6iXWP+nwBpI7l
   NoOJjd3iy1KFCD//mIEdm/Pb52QWvMgfjNP2iuctSL/ikcu3hmeeLIuLq
   pxlHXEjBwT2pKh5n9U2jacP4qSyk6kLLXD8WbiPckeGB4g6CY3LA06Yuv
   x+gm6r6pHK88SrR/xQMupu5fBsOCEJ6OfzQRz/qfoWolQBBqXPKvsmwMj
   MpkNiWHR03B63qmYv4NPXSyHE43YG8lzjIA8IB+AIUOemIwKAnlpNLzl3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="389318476"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="389318476"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 07:38:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="937771565"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="937771565"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Nov 2023 07:38:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2Z1Z-000CEA-1b;
	Mon, 13 Nov 2023 15:38:53 +0000
Date: Mon, 13 Nov 2023 23:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:rk3588 31/37]
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:488:6: warning: no previous
 prototype for 'dw_hdmi_qp_set_audio_infoframe'
Message-ID: <202311132319.bZOYf5Rs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Sebastian Reichel <sre@kernel.org>
CC: Algea Cao <algea.cao@rock-chips.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   f41b3e9a9d7f22bef0735b4fe0007321ce6b6d6b
commit: 171fd53717525f0f6dc56e90e6f38a9038c5c779 [31/37] drm/bridge: synopsys: Add initial support for DW HDMI QP TX Controller
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: csky-randconfig-002-20231113 (https://download.01.org/0day-ci/archive/20231113/202311132319.bZOYf5Rs-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311132319.bZOYf5Rs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311132319.bZOYf5Rs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:488:6: warning: no previous prototype for 'dw_hdmi_qp_set_audio_infoframe' [-Wmissing-prototypes]
     488 | void dw_hdmi_qp_set_audio_infoframe(struct dw_hdmi_qp *hdmi,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:566:6: warning: no previous prototype for 'dw_hdmi_qp_audio_enable' [-Wmissing-prototypes]
     566 | void dw_hdmi_qp_audio_enable(struct dw_hdmi_qp *hdmi)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:578:6: warning: no previous prototype for 'dw_hdmi_qp_audio_disable' [-Wmissing-prototypes]
     578 | void dw_hdmi_qp_audio_disable(struct dw_hdmi_qp *hdmi)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:2135:6: warning: no previous prototype for 'dw_hdmi_qp_set_cec_adap' [-Wmissing-prototypes]
    2135 | void dw_hdmi_qp_set_cec_adap(struct dw_hdmi_qp *hdmi, struct cec_adapter *adap)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:2284:6: warning: no previous prototype for 'dw_hdmi_qp_cec_set_hpd' [-Wmissing-prototypes]
    2284 | void dw_hdmi_qp_cec_set_hpd(struct dw_hdmi_qp *hdmi, bool plug_in, bool change)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/dw_hdmi_qp_set_audio_infoframe +488 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c

171fd53717525f Cristian Ciocaltea 2023-11-01  487  
171fd53717525f Cristian Ciocaltea 2023-11-01 @488  void dw_hdmi_qp_set_audio_infoframe(struct dw_hdmi_qp *hdmi,
171fd53717525f Cristian Ciocaltea 2023-11-01  489  				    struct hdmi_codec_params *hparms)
171fd53717525f Cristian Ciocaltea 2023-11-01  490  {
171fd53717525f Cristian Ciocaltea 2023-11-01  491  	u8 infoframe_buf[HDMI_INFOFRAME_SIZE(AUDIO)];
171fd53717525f Cristian Ciocaltea 2023-11-01  492  	int ret = 0;
171fd53717525f Cristian Ciocaltea 2023-11-01  493  
171fd53717525f Cristian Ciocaltea 2023-11-01  494  	ret = hdmi_audio_infoframe_pack(&hparms->cea, infoframe_buf,
171fd53717525f Cristian Ciocaltea 2023-11-01  495  					sizeof(infoframe_buf));
171fd53717525f Cristian Ciocaltea 2023-11-01  496  	if (!ret) {
171fd53717525f Cristian Ciocaltea 2023-11-01  497  		dev_err(hdmi->dev, "%s: Failed to pack audio infoframe: %d\n",
171fd53717525f Cristian Ciocaltea 2023-11-01  498  			__func__, ret);
171fd53717525f Cristian Ciocaltea 2023-11-01  499  		return;
171fd53717525f Cristian Ciocaltea 2023-11-01  500  	}
171fd53717525f Cristian Ciocaltea 2023-11-01  501  
171fd53717525f Cristian Ciocaltea 2023-11-01  502  	mutex_lock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  503  	if (!hdmi->dclk_en) {
171fd53717525f Cristian Ciocaltea 2023-11-01  504  		mutex_unlock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  505  		return;
171fd53717525f Cristian Ciocaltea 2023-11-01  506  	}
171fd53717525f Cristian Ciocaltea 2023-11-01  507  
171fd53717525f Cristian Ciocaltea 2023-11-01  508  	/*
171fd53717525f Cristian Ciocaltea 2023-11-01  509  	 * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
171fd53717525f Cristian Ciocaltea 2023-11-01  510  	 * AUDI_CONTENTS1: { PB3, PB2, PB1, PB0 }
171fd53717525f Cristian Ciocaltea 2023-11-01  511  	 * AUDI_CONTENTS2: { PB7, PB6, PB5, PB4 }
171fd53717525f Cristian Ciocaltea 2023-11-01  512  	 *
171fd53717525f Cristian Ciocaltea 2023-11-01  513  	 * PB0: CheckSum
171fd53717525f Cristian Ciocaltea 2023-11-01  514  	 * PB1: | CT3    | CT2  | CT1  | CT0  | F13  | CC2 | CC1 | CC0 |
171fd53717525f Cristian Ciocaltea 2023-11-01  515  	 * PB2: | F27    | F26  | F25  | SF2  | SF1  | SF0 | SS1 | SS0 |
171fd53717525f Cristian Ciocaltea 2023-11-01  516  	 * PB3: | F37    | F36  | F35  | F34  | F33  | F32 | F31 | F30 |
171fd53717525f Cristian Ciocaltea 2023-11-01  517  	 * PB4: | CA7    | CA6  | CA5  | CA4  | CA3  | CA2 | CA1 | CA0 |
171fd53717525f Cristian Ciocaltea 2023-11-01  518  	 * PB5: | DM_INH | LSV3 | LSV2 | LSV1 | LSV0 | F52 | F51 | F50 |
171fd53717525f Cristian Ciocaltea 2023-11-01  519  	 * PB6~PB10: Reserved
171fd53717525f Cristian Ciocaltea 2023-11-01  520  	 *
171fd53717525f Cristian Ciocaltea 2023-11-01  521  	 * AUDI_CONTENTS0 default value defined by HDMI specification,
171fd53717525f Cristian Ciocaltea 2023-11-01  522  	 * and shall only be changed for debug purposes.
171fd53717525f Cristian Ciocaltea 2023-11-01  523  	 * So, we only configure payload byte from PB0~PB7(2 word total).
171fd53717525f Cristian Ciocaltea 2023-11-01  524  	 */
171fd53717525f Cristian Ciocaltea 2023-11-01  525  	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &infoframe_buf[3], 2);
171fd53717525f Cristian Ciocaltea 2023-11-01  526  
171fd53717525f Cristian Ciocaltea 2023-11-01  527  	/* Enable ACR, AUDI, AMD */
171fd53717525f Cristian Ciocaltea 2023-11-01  528  	hdmi_modb(hdmi,
171fd53717525f Cristian Ciocaltea 2023-11-01  529  		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
171fd53717525f Cristian Ciocaltea 2023-11-01  530  		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
171fd53717525f Cristian Ciocaltea 2023-11-01  531  		  PKTSCHED_PKT_EN);
171fd53717525f Cristian Ciocaltea 2023-11-01  532  
171fd53717525f Cristian Ciocaltea 2023-11-01  533  	/* Enable AUDS */
171fd53717525f Cristian Ciocaltea 2023-11-01  534  	hdmi_modb(hdmi, PKTSCHED_AUDS_TX_EN, PKTSCHED_AUDS_TX_EN, PKTSCHED_PKT_EN);
171fd53717525f Cristian Ciocaltea 2023-11-01  535  	mutex_unlock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  536  }
171fd53717525f Cristian Ciocaltea 2023-11-01  537  EXPORT_SYMBOL_GPL(dw_hdmi_qp_set_audio_infoframe);
171fd53717525f Cristian Ciocaltea 2023-11-01  538  
171fd53717525f Cristian Ciocaltea 2023-11-01  539  static void hdmi_enable_audio_clk(struct dw_hdmi_qp *hdmi, bool enable)
171fd53717525f Cristian Ciocaltea 2023-11-01  540  {
171fd53717525f Cristian Ciocaltea 2023-11-01  541  	if (enable)
171fd53717525f Cristian Ciocaltea 2023-11-01  542  		hdmi_modb(hdmi, 0,
171fd53717525f Cristian Ciocaltea 2023-11-01  543  			  AVP_DATAPATH_PACKET_AUDIO_SWDISABLE, GLOBAL_SWDISABLE);
171fd53717525f Cristian Ciocaltea 2023-11-01  544  	else
171fd53717525f Cristian Ciocaltea 2023-11-01  545  		hdmi_modb(hdmi, AVP_DATAPATH_PACKET_AUDIO_SWDISABLE,
171fd53717525f Cristian Ciocaltea 2023-11-01  546  			  AVP_DATAPATH_PACKET_AUDIO_SWDISABLE, GLOBAL_SWDISABLE);
171fd53717525f Cristian Ciocaltea 2023-11-01  547  }
171fd53717525f Cristian Ciocaltea 2023-11-01  548  
171fd53717525f Cristian Ciocaltea 2023-11-01  549  // static void dw_hdmi_i2s_audio_enable(struct dw_hdmi_qp *hdmi)
171fd53717525f Cristian Ciocaltea 2023-11-01  550  // {
171fd53717525f Cristian Ciocaltea 2023-11-01  551  // 	hdmi_set_cts_n(hdmi, hdmi->audio_cts, hdmi->audio_n);
171fd53717525f Cristian Ciocaltea 2023-11-01  552  // 	hdmi_enable_audio_clk(hdmi, true);
171fd53717525f Cristian Ciocaltea 2023-11-01  553  // }
171fd53717525f Cristian Ciocaltea 2023-11-01  554  //
171fd53717525f Cristian Ciocaltea 2023-11-01  555  // static void dw_hdmi_i2s_audio_disable(struct dw_hdmi_qp *hdmi)
171fd53717525f Cristian Ciocaltea 2023-11-01  556  // {
171fd53717525f Cristian Ciocaltea 2023-11-01  557  // 	/* Disable AUDS, ACR, AUDI, AMD */
171fd53717525f Cristian Ciocaltea 2023-11-01  558  // 	hdmi_modb(hdmi, 0,
171fd53717525f Cristian Ciocaltea 2023-11-01  559  // 		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDS_TX_EN |
171fd53717525f Cristian Ciocaltea 2023-11-01  560  // 		  PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
171fd53717525f Cristian Ciocaltea 2023-11-01  561  // 		  PKTSCHED_PKT_EN);
171fd53717525f Cristian Ciocaltea 2023-11-01  562  //
171fd53717525f Cristian Ciocaltea 2023-11-01  563  // 	hdmi_enable_audio_clk(hdmi, false);
171fd53717525f Cristian Ciocaltea 2023-11-01  564  // }
171fd53717525f Cristian Ciocaltea 2023-11-01  565  
171fd53717525f Cristian Ciocaltea 2023-11-01 @566  void dw_hdmi_qp_audio_enable(struct dw_hdmi_qp *hdmi)
171fd53717525f Cristian Ciocaltea 2023-11-01  567  {
171fd53717525f Cristian Ciocaltea 2023-11-01  568  	mutex_lock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  569  	if (hdmi->dclk_en) {
171fd53717525f Cristian Ciocaltea 2023-11-01  570  		hdmi->audio_enable = true;
171fd53717525f Cristian Ciocaltea 2023-11-01  571  		if (hdmi->enable_audio)
171fd53717525f Cristian Ciocaltea 2023-11-01  572  			hdmi->enable_audio(hdmi);
171fd53717525f Cristian Ciocaltea 2023-11-01  573  	}
171fd53717525f Cristian Ciocaltea 2023-11-01  574  	mutex_unlock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  575  }
171fd53717525f Cristian Ciocaltea 2023-11-01  576  EXPORT_SYMBOL_GPL(dw_hdmi_qp_audio_enable);
171fd53717525f Cristian Ciocaltea 2023-11-01  577  
171fd53717525f Cristian Ciocaltea 2023-11-01 @578  void dw_hdmi_qp_audio_disable(struct dw_hdmi_qp *hdmi)
171fd53717525f Cristian Ciocaltea 2023-11-01  579  {
171fd53717525f Cristian Ciocaltea 2023-11-01  580  	mutex_lock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  581  	if (hdmi->dclk_en) {
171fd53717525f Cristian Ciocaltea 2023-11-01  582  		hdmi->audio_enable = false;
171fd53717525f Cristian Ciocaltea 2023-11-01  583  		if (hdmi->disable_audio)
171fd53717525f Cristian Ciocaltea 2023-11-01  584  			hdmi->disable_audio(hdmi);
171fd53717525f Cristian Ciocaltea 2023-11-01  585  	}
171fd53717525f Cristian Ciocaltea 2023-11-01  586  	mutex_unlock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  587  }
171fd53717525f Cristian Ciocaltea 2023-11-01  588  EXPORT_SYMBOL_GPL(dw_hdmi_qp_audio_disable);
171fd53717525f Cristian Ciocaltea 2023-11-01  589  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
