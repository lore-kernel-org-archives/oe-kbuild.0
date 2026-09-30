Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71EB411F83
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 21:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790805404; cv=none; b=VPybAJWbkuqJgGZuCSIuivrm+4pSJ7880AaCBVq+QGV7MUtIdtkVrxUQzhzz51TquRFitFgFd2h/2jAwSKRfNvy79X3JtSdllVdy0ClcIVdybNym5j9Pp8R7PncZZ5GGPTB3Y8xbChLUflXZz9YoULiS52kkEE5W/3b+OjjitO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790805404; c=relaxed/simple;
	bh=zhcASCEMhIoc69B9BKkiBl2NCN1O6ZqZtdFL932sNVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fw7X/AMbxa64G2Dp9wDySqWUt1B3jLWVkp4ih4bglVslaUcO4yB1NJgOFHeLK8ERYTUTYT2OHw4DvUSCTOFEKlyG6hdOdF3Nr4nvNLLNtcGOaN2ZNeRQxcgBsViSD09R8a49qBraIRLWn2GfoTljn06XjGBNV+k/2Bt/ReYDezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KK9jREcm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KK9jREcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790805402; x=1822341402;
  h=date:from:to:cc:subject:message-id;
  bh=zhcASCEMhIoc69B9BKkiBl2NCN1O6ZqZtdFL932sNVA=;
  b=KK9jREcm7nnztfNtlMf1ZOV2XqP6EwScQkOibGgr5I/Ctg5+FgJREBrT
   NxpjBixsu8VfLB0zjccfh5vRlH3Bo8nCrWZw0CMLI9uFR31VQwW1AVT3y
   9VWBF6HNOoChMv77Nv88B9Eqm3Q3L7fX09Jh3vj5/D/5a6iyjEoP0D/1F
   8jMypJllVFtZA1n/Wy/ig4HtyciNyLHQa/Io19dovXdsEbolWVrnvIedU
   2MQ83W6cMwY69gI1+gGVR2eL12hLiJvyAx12fXRKxeQzkc2hpQCntmiI/
   i0R226bkYjd+geHj+M6VYJ8ziXnTmwzeMDWM/lqobEgBGamxYRXdHLndS
   g==;
X-CSE-ConnectionGUID: 0l3yFWVnStO7dBsjWS409w==
X-CSE-MsgGUID: d99ETx9xQKqjVxqwtsLQCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="95363910"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="95363910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 14:56:41 -0700
X-CSE-ConnectionGUID: PJZ6PGSQQm6KgfRfI0URbw==
X-CSE-MsgGUID: ZdAr2lZ0Q5uoyIXiOXrxQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="272258069"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Sep 2026 14:56:39 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC2Hz-0000000021f-3TH5;
	Wed, 30 Sep 2026 21:56:35 +0000
Date: Wed, 30 Sep 2026 23:56:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10545/12559]
 drivers/iio/dac/mcp47feb02-core.c:833 mcp47feb02_init_ctrl_regs() warn:
 subtract is higher precedence than shift
Message-ID: <202609302354.kv3fnDbV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ariana Lazar <ariana.lazar@microchip.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
commit: ddaf34392ce717d0edd7b0b0fafce1b4e0386321 [10545/12559] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C driver into two modules
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-r2201-20260930 (https://download.01.org/0day-ci/archive/20260930/202609302354.kv3fnDbV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609302354.kv3fnDbV-lkp@intel.com/

New smatch warnings:
drivers/iio/dac/mcp47feb02-core.c:833 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02-core.c:833 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02-core.c:833 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02-core.c:833 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/iio/dac/mcp47feb02-core.c:877 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02-core.c:877 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02-core.c:877 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift
drivers/iio/dac/mcp47feb02-core.c:877 mcp47feb02_init_ctrl_regs() warn: subtract is higher precedence than shift

vim +833 drivers/iio/dac/mcp47feb02-core.c

bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  806  
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  807  static int mcp47feb02_init_ctrl_regs(struct mcp47feb02_data *data)
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  808  {
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  809  	unsigned int i, vref_ch, gain_ch, pd_ch;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  810  	int ret;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  811  
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  812  	ret = regmap_read(data->regmap, MCP47FEB02_VREF_REG_ADDR, &vref_ch);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  813  	if (ret)
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  814  		return ret;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  815  
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  816  	ret = regmap_read(data->regmap, MCP47FEB02_GAIN_CTRL_STATUS_REG_ADDR, &gain_ch);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  817  	if (ret)
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  818  		return ret;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  819  
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  820  	ret = regmap_read(data->regmap, MCP47FEB02_POWER_DOWN_REG_ADDR, &pd_ch);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  821  	if (ret)
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  822  		return ret;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  823  
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  824  	for_each_set_bit(i, &data->active_channels_mask, data->phys_channels) {
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  825  		struct device *dev = regmap_get_device(data->regmap);
fc8d14d75345cb drivers/iio/dac/mcp47feb02.c Ariana Lazar 2026-09-18  826  		unsigned int pd_tmp, dac_val;
fc8d14d75345cb drivers/iio/dac/mcp47feb02.c Ariana Lazar 2026-09-18  827  
fc8d14d75345cb drivers/iio/dac/mcp47feb02.c Ariana Lazar 2026-09-18  828  		ret = regmap_read(data->regmap, REG_ADDR(i), &dac_val);
fc8d14d75345cb drivers/iio/dac/mcp47feb02.c Ariana Lazar 2026-09-18  829  		if (ret)
fc8d14d75345cb drivers/iio/dac/mcp47feb02.c Ariana Lazar 2026-09-18  830  			return ret;
fc8d14d75345cb drivers/iio/dac/mcp47feb02.c Ariana Lazar 2026-09-18  831  		data->chdata[i].dac_data = dac_val;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  832  
b23f1a7ecdb5da drivers/iio/dac/mcp47feb02.c Ariana Lazar 2026-09-18 @833  		data->chdata[i].ref_mode = field_get(MCP47FEB02_VREF_PD_MASK(i), vref_ch);
29491c675c2bab drivers/iio/dac/mcp47feb02.c Ariana Lazar 2026-09-18  834  		data->chdata[i].use_2x_gain = field_get(DAC_GAIN_MASK(i), gain_ch);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  835  
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  836  		/*
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  837  		 * Inform the user that the current voltage reference read from the volatile
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  838  		 * register of the chip is different from the one specified in the device tree.
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  839  		 * Considering that the user cannot have an external voltage reference connected
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  840  		 * to the pin and select the internal Band Gap at the same time, in order to avoid
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  841  		 * miscofiguring the reference voltage, the volatile register will not be written.
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  842  		 * In order to overwrite the setting from volatile register with the one from the
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  843  		 * device tree, the user needs to write the chosen scale.
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  844  		 */
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  845  		switch (data->chdata[i].ref_mode) {
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  846  		case MCP47FEB02_INTERNAL_BAND_GAP:
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  847  			if (data->phys_channels >= 4 && (i % 2) && data->use_vref1) {
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  848  				dev_dbg(dev, "ch[%u]: was configured to use internal band gap", i);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  849  				dev_dbg(dev, "ch[%u]: reference voltage set to VREF1", i);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  850  				break;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  851  			}
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  852  			if ((data->phys_channels < 4 || (data->phys_channels >= 4 && !(i % 2))) &&
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  853  			    data->use_vref) {
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  854  				dev_dbg(dev, "ch[%u]: was configured to use internal band gap", i);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  855  				dev_dbg(dev, "ch[%u]: reference voltage set to VREF", i);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  856  				break;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  857  			}
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  858  			break;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  859  		case MCP47FEB02_EXTERNAL_VREF_UNBUFFERED:
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  860  		case MCP47FEB02_EXTERNAL_VREF_BUFFERED:
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  861  			if (data->phys_channels >= 4 && (i % 2) && !data->use_vref1) {
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  862  				dev_dbg(dev, "ch[%u]: was configured to use VREF1", i);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  863  				dev_dbg(dev,
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  864  					"ch[%u]: reference voltage set to internal band gap", i);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  865  				break;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  866  			}
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  867  			if ((data->phys_channels < 4 || (data->phys_channels >= 4 && !(i % 2))) &&
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  868  			    !data->use_vref) {
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  869  				dev_dbg(dev, "ch[%u]: was configured to use VREF", i);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  870  				dev_dbg(dev,
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  871  					"ch[%u]: reference voltage set to internal band gap", i);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  872  				break;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  873  			}
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  874  			break;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  875  		}
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  876  
b23f1a7ecdb5da drivers/iio/dac/mcp47feb02.c Ariana Lazar 2026-09-18  877  		pd_tmp = field_get(MCP47FEB02_VREF_PD_MASK(i), pd_ch);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  878  		data->chdata[i].powerdown_mode = pd_tmp ? (pd_tmp - 1) : pd_tmp;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  879  		data->chdata[i].powerdown = !!(data->chdata[i].powerdown_mode);
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  880  	}
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  881  
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  882  	return 0;
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  883  }
bf394cc8036989 drivers/iio/dac/mcp47feb02.c Ariana Lazar 2025-12-16  884  

:::::: The code at line 833 was first introduced by commit
:::::: b23f1a7ecdb5da9ea0c19f70d67146eab84a2268 iio: dac: mcp47feb02: use field_prep() instead of custom dynamic macros

:::::: TO: Ariana Lazar <ariana.lazar@microchip.com>
:::::: CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
