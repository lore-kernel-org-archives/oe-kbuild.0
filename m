Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F362DBF75
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 23:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293562; cv=none; b=GqcvZ14aCORXhPf4SmmcYCmunQe00K+jChlfYQxkprH6Bum4ZrE7UeqG70ru+uommR4CM06rQJuWeVNJ/mmu3s4B+IOS8wmNyF3L94TbNdMJGfCSEqyTZtHRtYgmOOgJLtPrkddQ/ypYB1mOsQEXH8/zgmUbSHN5VY5kb37Jry0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293562; c=relaxed/simple;
	bh=5ANP5W1Y/ahehOSzHDbmKIXX3Am/CCiVZgj+5l/3FXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G4FeBwf1H46ZCbdSiJ7HO6qg8yxhfPCf9J0owpA+udTIfbcVQYBnwGbDbtyRUIc2+H6DeZx/szw9XnkinheNn8Z8bCXeeR5NkjP33sgHkEJRCv0Cztb5UO4Fv6S3RDwRZuKwBJRXk3Oyxfb4S4Rkf0FnAA/RDxcVNI/iKk8MYsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAfe3Z0Q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAfe3Z0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790293560; x=1821829560;
  h=date:from:to:cc:subject:message-id;
  bh=5ANP5W1Y/ahehOSzHDbmKIXX3Am/CCiVZgj+5l/3FXg=;
  b=IAfe3Z0QuC1mC+zF2E66Z7dKeatjpAF4rVVqDaFAzISVIIYVY6xmt4NY
   wSN+LvGYsZAo5xuKy8s23UmSzZ/s2yvtKwzmLSbrqpQNghZx4nzVPA31+
   IFy15+DrC9yoK+POHDjmcIGNpZU/4MqH/nFDCOFJvecaJVkodIulnNDl1
   +vAwaE3JMyJP1h9a5D9Fj53/4AGuemkw0umvcN1FzN0KeSKb9s/8tTfHG
   n3uH6bDoYvJZaSuezcrHbAToBY2YkMkIkb24uxzD/pZc2bJbDynrDpGhH
   /FE1N+G4w/1V2MtU6LPn/tllQP0zaRX8SvTWa0VtmKKXcB8w/F/e5rGzw
   Q==;
X-CSE-ConnectionGUID: ZFOsoTpjSZOcv4uc1uUcmw==
X-CSE-MsgGUID: g4JHW7GhRZmYswtFPkjXXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="107461872"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="107461872"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 16:46:00 -0700
X-CSE-ConnectionGUID: 3nmwZCY9QFOQ40ePhsTxTA==
X-CSE-MsgGUID: 91jnn5uZTKG6X8QVdRmHiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="278892067"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 24 Sep 2026 16:45:58 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9t8W-000000000Te-1upq;
	Thu, 24 Sep 2026 23:45:56 +0000
Date: Fri, 25 Sep 2026 01:44:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7223/10113]
 drivers/iio/dac/mcp47feb02.c:1027 mcp47feb02_init_ctrl_regs() warn: subtract
 is higher precedence than shift
Message-ID: <202609250145.0eqlXo26-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ariana Lazar <ariana.lazar@microchip.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: 4a0aed7e813424c8b35686da2fad5851c0c40276 [7223/10113] iio: dac: mcp47feb02: use field_get() instead of custom dynamic macros
:::::: branch date: 5 hours ago
:::::: commit date: 4 days ago
config: um-randconfig-r2201-20260924 (https://download.01.org/0day-ci/archive/20260925/202609250145.0eqlXo26-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609250145.0eqlXo26-lkp@intel.com/

New smatch warnings:
drivers/iio/dac/mcp47feb02.c:1027 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02.c:1027 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02.c:1027 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02.c:1027 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/iio/dac/mcp47feb02.c:1071 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02.c:1071 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02.c:1071 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02.c:1071 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift

vim +1027 drivers/iio/dac/mcp47feb02.c

bf394cc8036989 Ariana Lazar 2025-12-16  1000  
bf394cc8036989 Ariana Lazar 2025-12-16  1001  static int mcp47feb02_init_ctrl_regs(struct mcp47feb02_data *data)
bf394cc8036989 Ariana Lazar 2025-12-16  1002  {
bf394cc8036989 Ariana Lazar 2025-12-16  1003  	unsigned int i, vref_ch, gain_ch, pd_ch;
bf394cc8036989 Ariana Lazar 2025-12-16  1004  	int ret;
bf394cc8036989 Ariana Lazar 2025-12-16  1005  
bf394cc8036989 Ariana Lazar 2025-12-16  1006  	ret = regmap_read(data->regmap, MCP47FEB02_VREF_REG_ADDR, &vref_ch);
bf394cc8036989 Ariana Lazar 2025-12-16  1007  	if (ret)
bf394cc8036989 Ariana Lazar 2025-12-16  1008  		return ret;
bf394cc8036989 Ariana Lazar 2025-12-16  1009  
bf394cc8036989 Ariana Lazar 2025-12-16  1010  	ret = regmap_read(data->regmap, MCP47FEB02_GAIN_CTRL_STATUS_REG_ADDR, &gain_ch);
bf394cc8036989 Ariana Lazar 2025-12-16  1011  	if (ret)
bf394cc8036989 Ariana Lazar 2025-12-16  1012  		return ret;
bf394cc8036989 Ariana Lazar 2025-12-16  1013  
bf394cc8036989 Ariana Lazar 2025-12-16  1014  	ret = regmap_read(data->regmap, MCP47FEB02_POWER_DOWN_REG_ADDR, &pd_ch);
bf394cc8036989 Ariana Lazar 2025-12-16  1015  	if (ret)
bf394cc8036989 Ariana Lazar 2025-12-16  1016  		return ret;
bf394cc8036989 Ariana Lazar 2025-12-16  1017  
bf394cc8036989 Ariana Lazar 2025-12-16  1018  	for_each_set_bit(i, &data->active_channels_mask, data->phys_channels) {
bf394cc8036989 Ariana Lazar 2025-12-16  1019  		struct device *dev = regmap_get_device(data->regmap);
fc8d14d75345cb Ariana Lazar 2026-09-18  1020  		unsigned int pd_tmp, dac_val;
fc8d14d75345cb Ariana Lazar 2026-09-18  1021  
fc8d14d75345cb Ariana Lazar 2026-09-18  1022  		ret = regmap_read(data->regmap, REG_ADDR(i), &dac_val);
fc8d14d75345cb Ariana Lazar 2026-09-18  1023  		if (ret)
fc8d14d75345cb Ariana Lazar 2026-09-18  1024  			return ret;
fc8d14d75345cb Ariana Lazar 2026-09-18  1025  		data->chdata[i].dac_data = dac_val;
bf394cc8036989 Ariana Lazar 2025-12-16  1026  
4a0aed7e813424 Ariana Lazar 2026-09-18 @1027  		data->chdata[i].ref_mode = field_get(DAC_CTRL_MASK(i), vref_ch);
29491c675c2bab Ariana Lazar 2026-09-18  1028  		data->chdata[i].use_2x_gain = field_get(DAC_GAIN_MASK(i), gain_ch);
bf394cc8036989 Ariana Lazar 2025-12-16  1029  
bf394cc8036989 Ariana Lazar 2025-12-16  1030  		/*
bf394cc8036989 Ariana Lazar 2025-12-16  1031  		 * Inform the user that the current voltage reference read from the volatile
bf394cc8036989 Ariana Lazar 2025-12-16  1032  		 * register of the chip is different from the one specified in the device tree.
bf394cc8036989 Ariana Lazar 2025-12-16  1033  		 * Considering that the user cannot have an external voltage reference connected
bf394cc8036989 Ariana Lazar 2025-12-16  1034  		 * to the pin and select the internal Band Gap at the same time, in order to avoid
bf394cc8036989 Ariana Lazar 2025-12-16  1035  		 * miscofiguring the reference voltage, the volatile register will not be written.
bf394cc8036989 Ariana Lazar 2025-12-16  1036  		 * In order to overwrite the setting from volatile register with the one from the
bf394cc8036989 Ariana Lazar 2025-12-16  1037  		 * device tree, the user needs to write the chosen scale.
bf394cc8036989 Ariana Lazar 2025-12-16  1038  		 */
bf394cc8036989 Ariana Lazar 2025-12-16  1039  		switch (data->chdata[i].ref_mode) {
bf394cc8036989 Ariana Lazar 2025-12-16  1040  		case MCP47FEB02_INTERNAL_BAND_GAP:
bf394cc8036989 Ariana Lazar 2025-12-16  1041  			if (data->phys_channels >= 4 && (i % 2) && data->use_vref1) {
bf394cc8036989 Ariana Lazar 2025-12-16  1042  				dev_dbg(dev, "ch[%u]: was configured to use internal band gap", i);
bf394cc8036989 Ariana Lazar 2025-12-16  1043  				dev_dbg(dev, "ch[%u]: reference voltage set to VREF1", i);
bf394cc8036989 Ariana Lazar 2025-12-16  1044  				break;
bf394cc8036989 Ariana Lazar 2025-12-16  1045  			}
bf394cc8036989 Ariana Lazar 2025-12-16  1046  			if ((data->phys_channels < 4 || (data->phys_channels >= 4 && !(i % 2))) &&
bf394cc8036989 Ariana Lazar 2025-12-16  1047  			    data->use_vref) {
bf394cc8036989 Ariana Lazar 2025-12-16  1048  				dev_dbg(dev, "ch[%u]: was configured to use internal band gap", i);
bf394cc8036989 Ariana Lazar 2025-12-16  1049  				dev_dbg(dev, "ch[%u]: reference voltage set to VREF", i);
bf394cc8036989 Ariana Lazar 2025-12-16  1050  				break;
bf394cc8036989 Ariana Lazar 2025-12-16  1051  			}
bf394cc8036989 Ariana Lazar 2025-12-16  1052  			break;
bf394cc8036989 Ariana Lazar 2025-12-16  1053  		case MCP47FEB02_EXTERNAL_VREF_UNBUFFERED:
bf394cc8036989 Ariana Lazar 2025-12-16  1054  		case MCP47FEB02_EXTERNAL_VREF_BUFFERED:
bf394cc8036989 Ariana Lazar 2025-12-16  1055  			if (data->phys_channels >= 4 && (i % 2) && !data->use_vref1) {
bf394cc8036989 Ariana Lazar 2025-12-16  1056  				dev_dbg(dev, "ch[%u]: was configured to use VREF1", i);
bf394cc8036989 Ariana Lazar 2025-12-16  1057  				dev_dbg(dev,
bf394cc8036989 Ariana Lazar 2025-12-16  1058  					"ch[%u]: reference voltage set to internal band gap", i);
bf394cc8036989 Ariana Lazar 2025-12-16  1059  				break;
bf394cc8036989 Ariana Lazar 2025-12-16  1060  			}
bf394cc8036989 Ariana Lazar 2025-12-16  1061  			if ((data->phys_channels < 4 || (data->phys_channels >= 4 && !(i % 2))) &&
bf394cc8036989 Ariana Lazar 2025-12-16  1062  			    !data->use_vref) {
bf394cc8036989 Ariana Lazar 2025-12-16  1063  				dev_dbg(dev, "ch[%u]: was configured to use VREF", i);
bf394cc8036989 Ariana Lazar 2025-12-16  1064  				dev_dbg(dev,
bf394cc8036989 Ariana Lazar 2025-12-16  1065  					"ch[%u]: reference voltage set to internal band gap", i);
bf394cc8036989 Ariana Lazar 2025-12-16  1066  				break;
bf394cc8036989 Ariana Lazar 2025-12-16  1067  			}
bf394cc8036989 Ariana Lazar 2025-12-16  1068  			break;
bf394cc8036989 Ariana Lazar 2025-12-16  1069  		}
bf394cc8036989 Ariana Lazar 2025-12-16  1070  
4a0aed7e813424 Ariana Lazar 2026-09-18  1071  		pd_tmp = field_get(DAC_CTRL_MASK(i), pd_ch);
bf394cc8036989 Ariana Lazar 2025-12-16  1072  		data->chdata[i].powerdown_mode = pd_tmp ? (pd_tmp - 1) : pd_tmp;
bf394cc8036989 Ariana Lazar 2025-12-16  1073  		data->chdata[i].powerdown = !!(data->chdata[i].powerdown_mode);
bf394cc8036989 Ariana Lazar 2025-12-16  1074  	}
bf394cc8036989 Ariana Lazar 2025-12-16  1075  
bf394cc8036989 Ariana Lazar 2025-12-16  1076  	return 0;
bf394cc8036989 Ariana Lazar 2025-12-16  1077  }
bf394cc8036989 Ariana Lazar 2025-12-16  1078  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
