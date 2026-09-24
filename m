Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A9C3BCD16
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 05:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790228973; cv=none; b=QH+17SufvV1DKZ8stWj2OFiGgfxYAlD9tK3kLcmU5il+PkVVwbDmS1qhcTNvl2m6d6gQY850Yj7+BvgffhB7aTCKbULCUoEpQgIxVkIQrOvjJgMY5R1YhU54vgGilFbcwEmLsR7AsBUxS52tHSb3yNYXIK1+knqpIKboV1J6FR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790228973; c=relaxed/simple;
	bh=sF5P3DqAyTvvtf/qy5Lr+qGaCx11V4Bmfxn4rLjxFw0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tSNxPho+r/xQWbZXqdTr3niOqg1EVUefXfxcjR/BLxHOXSzE89rebcyasbxyBpy4fHmPEdH6oZbfky9PTfw2avEAbQAZz9xIjgyuxnKu9zeub97Nx4F0ZhZfvbrS9wRPV/mdGkcY0mzxqarifG80/w0FmJfvNWz4QwIUu1GpQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jw3K6QOm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jw3K6QOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790228973; x=1821764973;
  h=date:from:to:cc:subject:message-id;
  bh=sF5P3DqAyTvvtf/qy5Lr+qGaCx11V4Bmfxn4rLjxFw0=;
  b=Jw3K6QOmMeCdDSKi2f2vHl67D1AkLJhzxbxvrxEeGrLv/f+RhMvPvM2O
   wJdIosDc9Swap7i3hNUjPx7lGsqp965F7Sav/CU05LjDXL2Jfwrmn0IQI
   cOQ5cHUonWQmBF3pPo1LK9XQ7udvNvThJBo96hLEq6izipofZyxEBASRs
   E9eloabQ1MkvAm0t5JhBO7kol/I9/yytJC6MMSv6LaKHZV387P6652DN+
   jiGKNOFA7+kohc/tCmjvKFLAYyg/ErhEUmxDtJZynl8RMNy3hd6QN+7Oy
   6bUPEx94XjnPipLiL9jU4p4s88QBM7p9TsBCZmCg2UNauVkB+ku18zpvp
   Q==;
X-CSE-ConnectionGUID: C+RPUwHrSp+1EhDuiXMvGQ==
X-CSE-MsgGUID: exG5N7OiQQCo1g+kmi7oeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="108482730"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="108482730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 22:49:32 -0700
X-CSE-ConnectionGUID: 3aqn2QArTy+gqHldwIFZSQ==
X-CSE-MsgGUID: Pwv+ocgzQx6GG+toSFu6yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273415468"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2026 22:49:30 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9cKl-00000000IGA-0H9x;
	Thu, 24 Sep 2026 05:49:27 +0000
Date: Thu, 24 Sep 2026 13:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/soc/cdns/cdns-i2s-sc.c:232:9: error: call to
 undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202609241324.MzjC9b4E-lkp@intel.com>
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
config: um-randconfig-r1305-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241324.MzjC9b4E-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241324.MzjC9b4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609241324.MzjC9b4E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/cdns/cdns-i2s-sc.c:10:
   In file included from include/linux/regmap.h:18:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> sound/soc/cdns/cdns-i2s-sc.c:232:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     232 |                                            FIELD_PREP(I2S_TDM_CTRL_CHN_NO,
         |                                            ^
   sound/soc/cdns/cdns-i2s-sc.c:290:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     290 |                                            FIELD_PREP(I2S_TDM_FD_DIR_CHN_TXEN,
         |                                            ^
   sound/soc/cdns/cdns-i2s-sc.c:346:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     346 |                                            FIELD_PREP(I2S_TDM_FD_DIR_CHN_RXEN,
         |                                            ^
   sound/soc/cdns/cdns-i2s-sc.c:457:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     457 |                 ctrl |= FIELD_PREP(I2S_CTRL_WS_MODE, 1) |
         |                         ^
   sound/soc/cdns/cdns-i2s-sc.c:675:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     675 |                            FIELD_PREP(I2S_CTRL_CHN_WIDTH, val));
         |                            ^
   1 warning and 5 errors generated.


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
