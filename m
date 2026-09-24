Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E296E35F5EA
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 03:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219724; cv=none; b=PV1zqJ5YhViQGXYYE4w/YGoWo+Ikrdn9WCboAI0yEOVUovSf17S1lmqJoSkSEKlorqgmx8AkTDKxM/UphDg4HI3Xy7IpsjTMny7gEqHnvbFw1fAj4cAV9Oflk+NaCI6j+ve62okqgMMnbzrv/hVmefgZpF85LviZS7adwzdJW98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219724; c=relaxed/simple;
	bh=GKfdZxYk7lUtBItJTzma8eN6fpzLbFzmLv12fSoDNLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uQKzt9mcn8ZJH8Qa76TT4/A8QOgzJKG6dpO8SHBCii8wNa12RKqh9cdM3eWqlmusxJ7JaRF4nxn0ucGS0TfOucgf9UDnxjpOtIG4a8Jufy0nu3JaAKKnwJyn4utMyV43IV7TnNzR/9EXlG6jPNp4rJWyijiMn9JUx4QeUFsvFoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jF1xxIAj; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jF1xxIAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790219722; x=1821755722;
  h=date:from:to:cc:subject:message-id;
  bh=GKfdZxYk7lUtBItJTzma8eN6fpzLbFzmLv12fSoDNLk=;
  b=jF1xxIAjvKk4gf5BTxtdDzMXh9FMftVjLBoQ+1tQkMzVl7pDjxD8s4JB
   Lltl8F4GQ+0KgKrRLVjt5QNtYPEBAb00HbBPGdYfnpgJL4q2762LSEOcd
   MYWp7dZrXpuRZxnJM0p2UABj6St+R/b04StTXpD24hm7uz26nn4ZpmKNi
   eXM5vh0CBMB3SSq0XAB/GuL5O38BL6ff5TltbAxhCkrKb5Bpj78eZ1rZq
   DXPq4/nQm7Kg4wxKplIwWDY48d5SNtbqcX9kwuzg+GFMb6h8aYDyjOr+8
   oZg7d9ibnme5NdZ2qiAoyN3L1Y3y1qKhrtnK2SXBlm21DugiocJn37a3Z
   A==;
X-CSE-ConnectionGUID: D2k44i8qTxqRqFi501Ucsg==
X-CSE-MsgGUID: oCFNx0DvRc6cQdIaTUrcgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1491013"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1491013"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 20:15:21 -0700
X-CSE-ConnectionGUID: VfO0FF4KTAm3jdB5+VyzGA==
X-CSE-MsgGUID: GwgPBKuPQim3ocU0A+WxEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="272480295"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 20:15:20 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Zva-00000000I8y-0MJS;
	Thu, 24 Sep 2026 03:15:18 +0000
Date: Thu, 24 Sep 2026 11:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/soc/cdns/cdns-i2s-sc.c:232:44: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202609241121.qc7qwq6u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/joakim-zhang-cixtech-com/ASoC-dt-bindings-Add-Cadence-I2S-SC-controller/20260922-192131, commit: ceb4920112712870b0dd31d742dface1b1c8b338"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Joakim Zhang <joakim.zhang@cixtech.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/joakim-zhang-cixtech-com/ASoC-dt-bindings-Add-Cadence-I2S-SC-controller/20260922-192131
head:   dc6b48e1eafbce3d63c74ad72cc99e76d3318cc1
commit: ceb4920112712870b0dd31d742dface1b1c8b338 ASoC: cdns: Add Cadence I2S-SC controller driver
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260924/202609241121.qc7qwq6u-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241121.qc7qwq6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609241121.qc7qwq6u-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/cdns/cdns-i2s-sc.c: In function 'cdns_i2s_sc_rxtx_common_config':
>> sound/soc/cdns/cdns-i2s-sc.c:232:44: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     232 |                                            FIELD_PREP(I2S_TDM_CTRL_CHN_NO,
         |                                            ^~~~~~~~~~


vim +/FIELD_PREP +232 sound/soc/cdns/cdns-i2s-sc.c

ceb49201127128 Joakim Zhang 2026-09-22  216  
ceb49201127128 Joakim Zhang 2026-09-22  217  static void cdns_i2s_sc_rxtx_common_config(struct cdns_i2s_sc_priv *i2s_sc_priv, bool on)
ceb49201127128 Joakim Zhang 2026-09-22  218  {
ceb49201127128 Joakim Zhang 2026-09-22  219  	if (on) {
ceb49201127128 Joakim Zhang 2026-09-22  220  		/* Full-duplex mode enable */
ceb49201127128 Joakim Zhang 2026-09-22  221  		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL_FDX,
ceb49201127128 Joakim Zhang 2026-09-22  222  				   I2S_CTRL_FDX_FULL_DUPLEX, I2S_CTRL_FDX_FULL_DUPLEX);
ceb49201127128 Joakim Zhang 2026-09-22  223  
ceb49201127128 Joakim Zhang 2026-09-22  224  		if (i2s_sc_priv->is_tdm_mode) {
ceb49201127128 Joakim Zhang 2026-09-22  225  			/* TDM mode enable */
ceb49201127128 Joakim Zhang 2026-09-22  226  			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL,
ceb49201127128 Joakim Zhang 2026-09-22  227  					   I2S_TDM_CTRL_TDM_EN, I2S_TDM_CTRL_TDM_EN);
ceb49201127128 Joakim Zhang 2026-09-22  228  
ceb49201127128 Joakim Zhang 2026-09-22  229  			/* Number of supported audio channels in TDM mode */
ceb49201127128 Joakim Zhang 2026-09-22  230  			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL,
ceb49201127128 Joakim Zhang 2026-09-22  231  					   I2S_TDM_CTRL_CHN_NO,
ceb49201127128 Joakim Zhang 2026-09-22 @232  					   FIELD_PREP(I2S_TDM_CTRL_CHN_NO,
ceb49201127128 Joakim Zhang 2026-09-22  233  						      i2s_sc_priv->tdm_config.slots - 1));
ceb49201127128 Joakim Zhang 2026-09-22  234  
ceb49201127128 Joakim Zhang 2026-09-22  235  			/* TDM mode channels enable */
ceb49201127128 Joakim Zhang 2026-09-22  236  			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL, I2S_TDM_CTRL_CHN_EN,
ceb49201127128 Joakim Zhang 2026-09-22  237  					   FIELD_PREP(I2S_TDM_CTRL_CHN_EN,
ceb49201127128 Joakim Zhang 2026-09-22  238  						      i2s_sc_priv->tdm_config.rx_mask |
ceb49201127128 Joakim Zhang 2026-09-22  239  						      i2s_sc_priv->tdm_config.tx_mask));
ceb49201127128 Joakim Zhang 2026-09-22  240  		}
ceb49201127128 Joakim Zhang 2026-09-22  241  
ceb49201127128 Joakim Zhang 2026-09-22  242  		/* Transceiver clock enable */
ceb49201127128 Joakim Zhang 2026-09-22  243  		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL,
ceb49201127128 Joakim Zhang 2026-09-22  244  				   I2S_CTRL_I2S_STB, 0);
ceb49201127128 Joakim Zhang 2026-09-22  245  
ceb49201127128 Joakim Zhang 2026-09-22  246  		/* All interrupt requests unmask */
ceb49201127128 Joakim Zhang 2026-09-22  247  		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL,
ceb49201127128 Joakim Zhang 2026-09-22  248  				   I2S_CTRL_INTREQ_MASK, I2S_CTRL_INTREQ_MASK);
ceb49201127128 Joakim Zhang 2026-09-22  249  	} else {
ceb49201127128 Joakim Zhang 2026-09-22  250  		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL,
ceb49201127128 Joakim Zhang 2026-09-22  251  				   I2S_CTRL_INTREQ_MASK, 0);
ceb49201127128 Joakim Zhang 2026-09-22  252  
ceb49201127128 Joakim Zhang 2026-09-22  253  		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL,
ceb49201127128 Joakim Zhang 2026-09-22  254  				   I2S_CTRL_I2S_STB, I2S_CTRL_I2S_STB);
ceb49201127128 Joakim Zhang 2026-09-22  255  
ceb49201127128 Joakim Zhang 2026-09-22  256  		if (i2s_sc_priv->is_tdm_mode) {
ceb49201127128 Joakim Zhang 2026-09-22  257  			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL,
ceb49201127128 Joakim Zhang 2026-09-22  258  					   I2S_TDM_CTRL_TDM_EN, 0);
ceb49201127128 Joakim Zhang 2026-09-22  259  
ceb49201127128 Joakim Zhang 2026-09-22  260  			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL,
ceb49201127128 Joakim Zhang 2026-09-22  261  					   I2S_TDM_CTRL_CHN_NO, 0);
ceb49201127128 Joakim Zhang 2026-09-22  262  
ceb49201127128 Joakim Zhang 2026-09-22  263  			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL,
ceb49201127128 Joakim Zhang 2026-09-22  264  					   I2S_TDM_CTRL_CHN_EN, 0);
ceb49201127128 Joakim Zhang 2026-09-22  265  		}
ceb49201127128 Joakim Zhang 2026-09-22  266  
ceb49201127128 Joakim Zhang 2026-09-22  267  		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL_FDX,
ceb49201127128 Joakim Zhang 2026-09-22  268  				   I2S_CTRL_FDX_FULL_DUPLEX, 0);
ceb49201127128 Joakim Zhang 2026-09-22  269  		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL,
ceb49201127128 Joakim Zhang 2026-09-22  270  				   I2S_CTRL_I2S_EN, 0);
ceb49201127128 Joakim Zhang 2026-09-22  271  	}
ceb49201127128 Joakim Zhang 2026-09-22  272  }
ceb49201127128 Joakim Zhang 2026-09-22  273  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
