Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451A2C189
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Apr 2024 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713002395; cv=none; b=nL8yJSjz+4w9dHRUr6EdMNr7NZ+QG3EzgAOMDji0dWATB+J+lWg5c/uujvdk4uBZNYlFLIFYH2dDs77MWOCI8kkzsVJWT/yWDiatb2cpgvG2bdBM9FEJWMUqqpLIACseDE/WrVAdMrcW17pK+7ptIn2n1zUOWooccRRqqZ9rpCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713002395; c=relaxed/simple;
	bh=KI6uPQleGXA6mdsk+FCGhPdT8LBKEixLtIvalg9Z9Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cKeKy++Ap7ylazAzKGjXa803TyPMiKVLDaq0YPdemPFEQQKA2vu+Vdi4MnT4fky1dmwLxxRkGAVB1nvs04xRxw60w4Rv+id8S/la5cyAWJBG1ScLYZKo6VW2zxOu65CGb3gHSvibJv8IJTaX6yt9ZBusrc+tSIAaQVdExNHSPAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQIb2es/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQIb2es/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713002392; x=1744538392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KI6uPQleGXA6mdsk+FCGhPdT8LBKEixLtIvalg9Z9Ko=;
  b=MQIb2es/CQE9uwoYe22TVx6VVe3RXUdb1JqSXMvwhKjPHDi4rmowhg7W
   jY2nbdSNBARDELHOxRFX3nc27RStg1xDh7sXkrezUt2AVf/ZGvBzqMHdX
   9szWO4KcCjNlVmRjR4/aWyzV7hgsRbIOLyYFJo4rGUbnW47KVzBn+OBY9
   00XZQh85amrM3ndpHUIu6cZP0NiFmsamr+p7frYk0tdP3WgxQk+t4FNmJ
   42XbZIQVZASdyq+B3ODVn0OuF5NfPC2dGDiZ6blFs4MYvQ9h+GtCsWlFn
   /p4PZb0sg8GeT+QR+eZSZ/uU+juh1ZoLQpagiZmvgr0iTjTIF6BmGxBuA
   A==;
X-CSE-ConnectionGUID: UfkByBKUSJC4X7tcWDgz0A==
X-CSE-MsgGUID: ZhWrGC6kRcC6CaQ7CMmImQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19848186"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="19848186"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 02:59:51 -0700
X-CSE-ConnectionGUID: JdfsOYMHQ0KOpI9NWkI1hw==
X-CSE-MsgGUID: L8Mr0wfxRpy2rgNyv1hBmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="26146174"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Apr 2024 02:59:50 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvaAl-0002DW-21;
	Sat, 13 Apr 2024 09:59:47 +0000
Date: Sat, 13 Apr 2024 17:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-sound:for-next 12/13] sound/soc/codecs/cs35l41.c:1129
 cs35l41_dsp_init() warn: missing error code 'ret'
Message-ID: <202404131743.unitkCiT-lkp@intel.com>
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
TO: Stefan Binding <sbinding@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   47c44619b51cb0367249a1f5c53afd28cfd9dd82
commit: eefb831d2e4dd58d58002a2ef75ff989e073230d [12/13] ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP config
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: mips-randconfig-r071-20240413 (https://download.01.org/0day-ci/archive/20240413/202404131743.unitkCiT-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404131743.unitkCiT-lkp@intel.com/

smatch warnings:
sound/soc/codecs/cs35l41.c:1129 cs35l41_dsp_init() warn: missing error code 'ret'

vim +/ret +1129 sound/soc/codecs/cs35l41.c

6450ef55905688 David Rhodes   2021-09-07  1093  
bae9e13fc55cbc David Rhodes   2021-10-29  1094  static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
bae9e13fc55cbc David Rhodes   2021-10-29  1095  {
bae9e13fc55cbc David Rhodes   2021-10-29  1096  	struct wm_adsp *dsp;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1097  	uint32_t dsp1rx5_src;
bae9e13fc55cbc David Rhodes   2021-10-29  1098  	int ret;
bae9e13fc55cbc David Rhodes   2021-10-29  1099  
bae9e13fc55cbc David Rhodes   2021-10-29  1100  	dsp = &cs35l41->dsp;
bae9e13fc55cbc David Rhodes   2021-10-29  1101  	dsp->part = "cs35l41";
bae9e13fc55cbc David Rhodes   2021-10-29  1102  	dsp->fw = 9; /* 9 is WM_ADSP_FW_SPK_PROT in wm_adsp.c */
f517ba4924ad02 Charles Keepax 2022-01-07  1103  	dsp->toggle_preload = true;
0db99577c4cddc Stefan Binding 2022-05-09  1104  
0db99577c4cddc Stefan Binding 2022-05-09  1105  	cs35l41_configure_cs_dsp(cs35l41->dev, cs35l41->regmap, &dsp->cs_dsp);
bae9e13fc55cbc David Rhodes   2021-10-29  1106  
ff8aad072e6388 Stefan Binding 2022-05-09  1107  	ret = cs35l41_write_fs_errata(cs35l41->dev, cs35l41->regmap);
ff8aad072e6388 Stefan Binding 2022-05-09  1108  	if (ret < 0)
bae9e13fc55cbc David Rhodes   2021-10-29  1109  		return ret;
bae9e13fc55cbc David Rhodes   2021-10-29  1110  
bae9e13fc55cbc David Rhodes   2021-10-29  1111  	ret = wm_halo_init(dsp);
bae9e13fc55cbc David Rhodes   2021-10-29  1112  	if (ret) {
bae9e13fc55cbc David Rhodes   2021-10-29  1113  		dev_err(cs35l41->dev, "wm_halo_init failed: %d\n", ret);
bae9e13fc55cbc David Rhodes   2021-10-29  1114  		return ret;
bae9e13fc55cbc David Rhodes   2021-10-29  1115  	}
bae9e13fc55cbc David Rhodes   2021-10-29  1116  
eefb831d2e4dd5 Stefan Binding 2024-04-11  1117  	switch (cs35l41->hw_cfg.bst_type) {
eefb831d2e4dd5 Stefan Binding 2024-04-11  1118  	case CS35L41_INT_BOOST:
eefb831d2e4dd5 Stefan Binding 2024-04-11  1119  	case CS35L41_SHD_BOOST_ACTV:
eefb831d2e4dd5 Stefan Binding 2024-04-11  1120  		dsp1rx5_src = CS35L41_INPUT_SRC_VPMON;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1121  		break;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1122  	case CS35L41_EXT_BOOST:
eefb831d2e4dd5 Stefan Binding 2024-04-11  1123  	case CS35L41_SHD_BOOST_PASS:
eefb831d2e4dd5 Stefan Binding 2024-04-11  1124  		dsp1rx5_src = CS35L41_INPUT_SRC_VBSTMON;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1125  		break;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1126  	default:
eefb831d2e4dd5 Stefan Binding 2024-04-11  1127  		dev_err(cs35l41->dev, "wm_halo_init failed - Invalid Boost Type: %d\n",
eefb831d2e4dd5 Stefan Binding 2024-04-11  1128  			cs35l41->hw_cfg.bst_type);
eefb831d2e4dd5 Stefan Binding 2024-04-11 @1129  		goto err_dsp;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1130  	}
eefb831d2e4dd5 Stefan Binding 2024-04-11  1131  
eefb831d2e4dd5 Stefan Binding 2024-04-11  1132  	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX5_SRC, dsp1rx5_src);
bae9e13fc55cbc David Rhodes   2021-10-29  1133  	if (ret < 0) {
eefb831d2e4dd5 Stefan Binding 2024-04-11  1134  		dev_err(cs35l41->dev, "Write DSP1RX5_SRC: %d failed: %d\n", dsp1rx5_src, ret);
bae9e13fc55cbc David Rhodes   2021-10-29  1135  		goto err_dsp;
bae9e13fc55cbc David Rhodes   2021-10-29  1136  	}
eefb831d2e4dd5 Stefan Binding 2024-04-11  1137  	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX6_SRC, CS35L41_INPUT_SRC_VBSTMON);
bae9e13fc55cbc David Rhodes   2021-10-29  1138  	if (ret < 0) {
eefb831d2e4dd5 Stefan Binding 2024-04-11  1139  		dev_err(cs35l41->dev, "Write CS35L41_INPUT_SRC_VBSTMON failed: %d\n", ret);
bae9e13fc55cbc David Rhodes   2021-10-29  1140  		goto err_dsp;
bae9e13fc55cbc David Rhodes   2021-10-29  1141  	}
bae9e13fc55cbc David Rhodes   2021-10-29  1142  	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX7_SRC,
bae9e13fc55cbc David Rhodes   2021-10-29  1143  			   CS35L41_INPUT_SRC_TEMPMON);
bae9e13fc55cbc David Rhodes   2021-10-29  1144  	if (ret < 0) {
bae9e13fc55cbc David Rhodes   2021-10-29  1145  		dev_err(cs35l41->dev, "Write INPUT_SRC_TEMPMON failed: %d\n", ret);
bae9e13fc55cbc David Rhodes   2021-10-29  1146  		goto err_dsp;
bae9e13fc55cbc David Rhodes   2021-10-29  1147  	}
bae9e13fc55cbc David Rhodes   2021-10-29  1148  	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX8_SRC,
bae9e13fc55cbc David Rhodes   2021-10-29  1149  			   CS35L41_INPUT_SRC_RSVD);
bae9e13fc55cbc David Rhodes   2021-10-29  1150  	if (ret < 0) {
bae9e13fc55cbc David Rhodes   2021-10-29  1151  		dev_err(cs35l41->dev, "Write INPUT_SRC_RSVD failed: %d\n", ret);
bae9e13fc55cbc David Rhodes   2021-10-29  1152  		goto err_dsp;
bae9e13fc55cbc David Rhodes   2021-10-29  1153  	}
bae9e13fc55cbc David Rhodes   2021-10-29  1154  
bae9e13fc55cbc David Rhodes   2021-10-29  1155  	return 0;
bae9e13fc55cbc David Rhodes   2021-10-29  1156  
bae9e13fc55cbc David Rhodes   2021-10-29  1157  err_dsp:
bae9e13fc55cbc David Rhodes   2021-10-29  1158  	wm_adsp2_remove(dsp);
bae9e13fc55cbc David Rhodes   2021-10-29  1159  
bae9e13fc55cbc David Rhodes   2021-10-29  1160  	return ret;
bae9e13fc55cbc David Rhodes   2021-10-29  1161  }
bae9e13fc55cbc David Rhodes   2021-10-29  1162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
