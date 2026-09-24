Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B5745C715
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244145; cv=none; b=LkD4BVxVMgEuQD/6ZuwemcJxbJ1PJvj/oGdZnE9GeD1/DyRj9VJO7H/pWWhOuV1JD6CFCTUChQHNO39q8DPi13UM4MV3kjFlp2lYpRnalrfZsboee/Z3k895m/GtLta8s43ZtHMKn4feJjKDzRMeyaEgXDmKNcko4N4p5ez0piQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244145; c=relaxed/simple;
	bh=vmJ5skbp/wsJA2K01p4eP0a/IvmUCuMAGygOeooRi5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FU2TRDynAYrBnp9TcUvEdl7UtinEWH4MlmdLhhrZXSp+9VZKN2fY10jvaYaRhIaF5PYY8CLAo4y9O9MANlPBgtztqclrSTIG8MQ+bQtCb3TTUZzufbJ4jfHlg3+osnuTqVrlae4FhcL53d0qzh9btVEm8eW+I2j38j27zuokR4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFvkLBsK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFvkLBsK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790244136; x=1821780136;
  h=date:from:to:cc:subject:message-id;
  bh=vmJ5skbp/wsJA2K01p4eP0a/IvmUCuMAGygOeooRi5o=;
  b=PFvkLBsKJjCOmZHddVULr5B0ULjPHhrTZ10/wm3HuBhXQlgiu70LboFi
   g5mzfwVz0fBa06InMlF5kGC5lgxWR4ipWGTRIP+FYjfrMLeM92O9OFFaz
   EtXixb7JgYvCZG7LQa90gjS6tKxVb/i3ERyjYNv8Yj8qFT+kYISiw83Nq
   v8Qd2hEZtSmYczqy52vk/bMIq2bqZgMbpRkQRxxREv0SqogVMdFK80qQ/
   VXTFy051hq810PocAg4xcBM0WUFUp+5peXkKifGpFxv9Ik05Ukm4d/TQc
   RWhEm3DoKtHXIi6fK70wKb7zf0fdOSPzZAY0NIcC2041PIIGu3QYUXyNv
   A==;
X-CSE-ConnectionGUID: TrV/LEKwRP6QEpCUUvkeDg==
X-CSE-MsgGUID: nHd//p7TQxGIUC7iWE7zzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="108505539"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="108505539"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 03:02:11 -0700
X-CSE-ConnectionGUID: fIkJlLSKSqSAw6M4QfLAYQ==
X-CSE-MsgGUID: iC2OGT1JToGkZ+/+XcPGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="311885158"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2026 03:02:10 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9gHI-00000000Ibe-06pJ;
	Thu, 24 Sep 2026 10:02:08 +0000
Date: Thu, 24 Sep 2026 18:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/soc/cdns/cdns-i2s-mc.c:221:21: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202609241721.uJFTHsRL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/joakim-zhang-cixtech-com/ASoC-dt-bindings-Add-Cadence-I2S-SC-controller/20260922-192131, commit: dc6b48e1eafbce3d63c74ad72cc99e76d3318cc1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Joakim Zhang <joakim.zhang@cixtech.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/joakim-zhang-cixtech-com/ASoC-dt-bindings-Add-Cadence-I2S-SC-controller/20260922-192131
head:   dc6b48e1eafbce3d63c74ad72cc99e76d3318cc1
commit: dc6b48e1eafbce3d63c74ad72cc99e76d3318cc1 ASoC: cdns: Add Cadence I2S-MC controller driver
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260924/202609241721.uJFTHsRL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241721.uJFTHsRL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609241721.uJFTHsRL-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/cdns/cdns-i2s-mc.c: In function 'cdns_i2s_mc_tx_config':
>> sound/soc/cdns/cdns-i2s-mc.c:221:21: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     221 |         irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK,
         |                     ^~~~~~~~~~


vim +/FIELD_PREP +221 sound/soc/cdns/cdns-i2s-mc.c

dc6b48e1eafbce Joakim Zhang 2026-09-22  216  
dc6b48e1eafbce Joakim Zhang 2026-09-22  217  static void cdns_i2s_mc_tx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on)
dc6b48e1eafbce Joakim Zhang 2026-09-22  218  {
dc6b48e1eafbce Joakim Zhang 2026-09-22  219  	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
dc6b48e1eafbce Joakim Zhang 2026-09-22  220  
dc6b48e1eafbce Joakim Zhang 2026-09-22 @221  	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK,
dc6b48e1eafbce Joakim Zhang 2026-09-22  222  			       i2s_mc_priv->pin_tx_mask_adjust);
dc6b48e1eafbce Joakim Zhang 2026-09-22  223  
dc6b48e1eafbce Joakim Zhang 2026-09-22  224  	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE,
dc6b48e1eafbce Joakim Zhang 2026-09-22  225  			       i2s_mc_priv->pin_tx_mask_adjust) |
dc6b48e1eafbce Joakim Zhang 2026-09-22  226  		    I2S_CID_CTRL_STROBE_TS;
dc6b48e1eafbce Joakim Zhang 2026-09-22  227  
dc6b48e1eafbce Joakim Zhang 2026-09-22  228  	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, i2s_mc_priv->pin_tx_mask_adjust);
dc6b48e1eafbce Joakim Zhang 2026-09-22  229  
dc6b48e1eafbce Joakim Zhang 2026-09-22  230  	if (on) {
dc6b48e1eafbce Joakim Zhang 2026-09-22  231  		/* Transmitter data underrun interrupt unmask */
dc6b48e1eafbce Joakim Zhang 2026-09-22  232  		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, irq_mask);
dc6b48e1eafbce Joakim Zhang 2026-09-22  233  
dc6b48e1eafbce Joakim Zhang 2026-09-22  234  		/* Transmitter clock enable */
dc6b48e1eafbce Joakim Zhang 2026-09-22  235  		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, 0);
dc6b48e1eafbce Joakim Zhang 2026-09-22  236  
dc6b48e1eafbce Joakim Zhang 2026-09-22  237  		/*
dc6b48e1eafbce Joakim Zhang 2026-09-22  238  		 * Transmitter enable
dc6b48e1eafbce Joakim Zhang 2026-09-22  239  		 * Transmitter synchronizing unit out of reset
dc6b48e1eafbce Joakim Zhang 2026-09-22  240  		 */
dc6b48e1eafbce Joakim Zhang 2026-09-22  241  		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
dc6b48e1eafbce Joakim Zhang 2026-09-22  242  				   i2s_mask | I2S_CTRL_TSYNC_RST,
dc6b48e1eafbce Joakim Zhang 2026-09-22  243  				   i2s_mask | I2S_CTRL_TSYNC_RST);
dc6b48e1eafbce Joakim Zhang 2026-09-22  244  	} else {
dc6b48e1eafbce Joakim Zhang 2026-09-22  245  		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
dc6b48e1eafbce Joakim Zhang 2026-09-22  246  				   i2s_mask | I2S_CTRL_TSYNC_RST, 0);
dc6b48e1eafbce Joakim Zhang 2026-09-22  247  
dc6b48e1eafbce Joakim Zhang 2026-09-22  248  		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, clk_mask);
dc6b48e1eafbce Joakim Zhang 2026-09-22  249  
dc6b48e1eafbce Joakim Zhang 2026-09-22  250  		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, 0);
dc6b48e1eafbce Joakim Zhang 2026-09-22  251  	}
dc6b48e1eafbce Joakim Zhang 2026-09-22  252  }
dc6b48e1eafbce Joakim Zhang 2026-09-22  253  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
