Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF13721A04
	for <oe-kbuild@lists.linux.dev>; Thu, 30 May 2024 18:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717092918; cv=none; b=d5t2jVUd6K5mWBXb6Laeh+c8K10BiPixAPKV+iFuI7luBA5IM9Vcm7ucVfp+zhWmflRvYd14GCfOeUhpdWdAQrCrgOr96d9yPyxAA2yk36Sz8UOcQm8p8D2wLYnLA3acW1hdMDP6HomDSkuXPF6uJLCYN1dShYrZvEZ5zsttinY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717092918; c=relaxed/simple;
	bh=5DKV0l1mXE1yYzOs73OGmRkjd0RuLUf48RYeFaUtiuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=boavwpallAghQDqtbsPzs6zYpzRdoiXFOGOZhM+5GHhxoBukSWv0WlxVOJCJArzcbI6twA7yIQWlp1AIHw4EaFWMuj6w6JYUbPh9zBI76xduvHQiLN1hNF0SFs1xEuGb/klyH5fqemwKRgCJagEbfOm9FYuOh5D7B9s6i+PDL74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHWozgl3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHWozgl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717092917; x=1748628917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5DKV0l1mXE1yYzOs73OGmRkjd0RuLUf48RYeFaUtiuE=;
  b=iHWozgl3/UFMS4/w+YclrT983yULGrez0V2OAOsJ8D66atQI8arMdtKb
   QNDlrn3rbJeSXIjf887JfCBz7s+fU6qgrGAfbfaRS2V8uKm9jUUc3FjlK
   cNQwVLa0Oz2HBmiN6GAaWK3pmxID9mixMOrvzx35uoSSBrL4hoEpFCKNR
   42tlDS436+sSGluhmSz5CgzeHnFnwJw2t3QJcbaiJZyfLgB7eUuLIEGLQ
   eEceUv6fS36NWln9Hb2Qr6EX9lrhhLrdI5aSRMJf42s67lumpiVS2RODP
   I/iQo9c22l3pnzZJgFA96ay8VqlAQkzKlKJNEdotLHO0uVTr1THwazj5N
   w==;
X-CSE-ConnectionGUID: CJS8lHHYRpKt1h7OaITGNQ==
X-CSE-MsgGUID: Fyd1GLqCTASr37vxrG3VQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13446748"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13446748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 11:15:16 -0700
X-CSE-ConnectionGUID: k29foPtjTvaKPfb1Eo97Rw==
X-CSE-MsgGUID: 3pouxjrlSPGIvhram9ld9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="35994561"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 May 2024 11:15:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCkIq-000FpZ-2h;
	Thu, 30 May 2024 18:15:05 +0000
Date: Fri, 31 May 2024 02:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V1 5/5] Add support for Awinic sar sensor.
Message-ID: <202405310138.ry5jf9hL-lkp@intel.com>
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
In-Reply-To: <20240529130608.783624-6-wangshuaijie@awinic.com>
References: <20240529130608.783624-6-wangshuaijie@awinic.com>
TO: wangshuaijie@awinic.com
TO: dmitry.torokhov@gmail.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: jeff@labundy.com
TO: linux-input@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: wangshuaijie@awinic.com
CC: liweilei@awinic.com
CC: kangjiajun@awinic.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc]

url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-input-Add-YAML-to-Awinic-sar-sensor/20240529-211303
base:   e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc
patch link:    https://lore.kernel.org/r/20240529130608.783624-6-wangshuaijie%40awinic.com
patch subject: [PATCH V1 5/5] Add support for Awinic sar sensor.
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: riscv-randconfig-r071-20240530 (https://download.01.org/0day-ci/archive/20240531/202405310138.ry5jf9hL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405310138.ry5jf9hL-lkp@intel.com/

New smatch warnings:
drivers/input/misc/aw_sar/aw_sar.c:221 aw_sar_load_bin_comm() warn: 'fw' from request_firmware() not released on lines: 217.
drivers/input/misc/aw_sar/aw_sar.c:283 aw_sar_irq() error: uninitialized symbol 'irq_status'.
drivers/input/misc/aw_sar/./aw9610x/aw9610x.c:479 aw9610x_get_chip_version() error: __builtin_memcpy() 'aw9610x->chip_name[__builtin_choose_expr((4 == 1), __builtin_strlen(aw9610x->chip_name), __fortify_strlen(aw9610x->chip_name))]' too small (1 vs 2)
drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:227 aw963xx_sram_data_write() error: uninitialized symbol 'ret'.
drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:522 aw963xx_get_cap_offset() warn: inconsistent indenting

Old smatch warnings:
drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:557 aw963xx_get_cap_offset() warn: inconsistent indenting

vim +/fw +221 drivers/input/misc/aw_sar/aw_sar.c

e5df082e247559 shuaijie wang 2024-05-29  202  
e5df082e247559 shuaijie wang 2024-05-29  203  static int32_t aw_sar_load_bin_comm(struct aw_sar *p_sar)
e5df082e247559 shuaijie wang 2024-05-29  204  {
e5df082e247559 shuaijie wang 2024-05-29  205  	const struct firmware *fw;
e5df082e247559 shuaijie wang 2024-05-29  206  	int32_t ret;
e5df082e247559 shuaijie wang 2024-05-29  207  
e5df082e247559 shuaijie wang 2024-05-29  208  	ret = request_firmware(&fw, p_sar->load_bin.bin_name, p_sar->dev);
e5df082e247559 shuaijie wang 2024-05-29  209  	if (ret != 0) {
e5df082e247559 shuaijie wang 2024-05-29  210  		dev_err(p_sar->dev, "parse %s error!", p_sar->load_bin.bin_name);
e5df082e247559 shuaijie wang 2024-05-29  211  		return ret;
e5df082e247559 shuaijie wang 2024-05-29  212  	}
e5df082e247559 shuaijie wang 2024-05-29  213  
e5df082e247559 shuaijie wang 2024-05-29  214  	ret = aw_sar_parse_bin(fw, p_sar);
e5df082e247559 shuaijie wang 2024-05-29  215  	if (ret != 0) {
e5df082e247559 shuaijie wang 2024-05-29  216  		dev_err(p_sar->dev, "reg_bin %s load error!", p_sar->load_bin.bin_name);
e5df082e247559 shuaijie wang 2024-05-29  217  		return ret;
e5df082e247559 shuaijie wang 2024-05-29  218  	}
e5df082e247559 shuaijie wang 2024-05-29  219  	release_firmware(fw);
e5df082e247559 shuaijie wang 2024-05-29  220  
e5df082e247559 shuaijie wang 2024-05-29 @221  	return 0;
e5df082e247559 shuaijie wang 2024-05-29  222  }
e5df082e247559 shuaijie wang 2024-05-29  223  
e5df082e247559 shuaijie wang 2024-05-29  224  static int32_t aw_sar_parse_dts_comm(struct device *dev, struct device_node *np,
e5df082e247559 shuaijie wang 2024-05-29  225  		struct aw_sar_dts_info *p_dts_info)
e5df082e247559 shuaijie wang 2024-05-29  226  {
e5df082e247559 shuaijie wang 2024-05-29  227  	int32_t val;
e5df082e247559 shuaijie wang 2024-05-29  228  
e5df082e247559 shuaijie wang 2024-05-29  229  	val = of_property_read_u32(np, "sar-num", &p_dts_info->sar_num);
e5df082e247559 shuaijie wang 2024-05-29  230  	dev_info(dev, "sar num = %d", p_dts_info->sar_num);
e5df082e247559 shuaijie wang 2024-05-29  231  	if (val != 0) {
e5df082e247559 shuaijie wang 2024-05-29  232  		dev_err(dev, "multiple sar failed!");
e5df082e247559 shuaijie wang 2024-05-29  233  		return -EINVAL;
e5df082e247559 shuaijie wang 2024-05-29  234  	}
e5df082e247559 shuaijie wang 2024-05-29  235  
e5df082e247559 shuaijie wang 2024-05-29  236  	p_dts_info->irq_gpio = of_get_named_gpio(np, "irq-gpio", 0);
e5df082e247559 shuaijie wang 2024-05-29  237  	if (p_dts_info->irq_gpio < 0) {
e5df082e247559 shuaijie wang 2024-05-29  238  		p_dts_info->irq_gpio = -1;
e5df082e247559 shuaijie wang 2024-05-29  239  		dev_err(dev, "no irq gpio provided.");
e5df082e247559 shuaijie wang 2024-05-29  240  		return -EINVAL;
e5df082e247559 shuaijie wang 2024-05-29  241  	}
e5df082e247559 shuaijie wang 2024-05-29  242  
e5df082e247559 shuaijie wang 2024-05-29  243  	val = of_property_read_u32(np, "channel_use_flag", &p_dts_info->channel_use_flag);
e5df082e247559 shuaijie wang 2024-05-29  244  	if (val != 0) {
e5df082e247559 shuaijie wang 2024-05-29  245  		dev_err(dev, "channel_use_flag failed!");
e5df082e247559 shuaijie wang 2024-05-29  246  		return -EINVAL;
e5df082e247559 shuaijie wang 2024-05-29  247  	}
e5df082e247559 shuaijie wang 2024-05-29  248  
e5df082e247559 shuaijie wang 2024-05-29  249  	//GPIO is set as internal pull-up input
e5df082e247559 shuaijie wang 2024-05-29  250  	p_dts_info->use_inter_pull_up = of_property_read_bool(np, "aw_sar,pin_set_inter_pull-up");
e5df082e247559 shuaijie wang 2024-05-29  251  	p_dts_info->use_pm = of_property_read_bool(np, "aw_sar,using_pm_ops");
e5df082e247559 shuaijie wang 2024-05-29  252  	p_dts_info->update_fw_flag = of_property_read_bool(np, "aw_sar,update_fw");
e5df082e247559 shuaijie wang 2024-05-29  253  	p_dts_info->use_plug_cail_flag = of_property_read_bool(np, "aw_sar,use_plug_cail");
e5df082e247559 shuaijie wang 2024-05-29  254  	p_dts_info->monitor_esd_flag = of_property_read_bool(np, "aw_sar,monitor_esd");
e5df082e247559 shuaijie wang 2024-05-29  255  
e5df082e247559 shuaijie wang 2024-05-29  256  	return 0;
e5df082e247559 shuaijie wang 2024-05-29  257  }
e5df082e247559 shuaijie wang 2024-05-29  258  
e5df082e247559 shuaijie wang 2024-05-29  259  static int32_t aw_sar_parse_dts(struct aw_sar *p_sar)
e5df082e247559 shuaijie wang 2024-05-29  260  {
e5df082e247559 shuaijie wang 2024-05-29  261  	int32_t ret;
e5df082e247559 shuaijie wang 2024-05-29  262  
e5df082e247559 shuaijie wang 2024-05-29  263  	ret = aw_sar_parse_dts_comm(p_sar->dev, p_sar->i2c->dev.of_node, &p_sar->dts_info);
e5df082e247559 shuaijie wang 2024-05-29  264  
e5df082e247559 shuaijie wang 2024-05-29  265  	//Special requirements of SAR chip
e5df082e247559 shuaijie wang 2024-05-29  266  	if (p_sar->p_sar_para->p_platform_config->p_add_parse_dts_fn != NULL)
e5df082e247559 shuaijie wang 2024-05-29  267  		ret |= p_sar->p_sar_para->p_platform_config->p_add_parse_dts_fn(p_sar);
e5df082e247559 shuaijie wang 2024-05-29  268  
e5df082e247559 shuaijie wang 2024-05-29  269  	return ret;
e5df082e247559 shuaijie wang 2024-05-29  270  }
e5df082e247559 shuaijie wang 2024-05-29  271  
e5df082e247559 shuaijie wang 2024-05-29  272  static irqreturn_t aw_sar_irq(int32_t irq, void *data)
e5df082e247559 shuaijie wang 2024-05-29  273  {
e5df082e247559 shuaijie wang 2024-05-29  274  	struct aw_sar *p_sar = (struct aw_sar *)data;
e5df082e247559 shuaijie wang 2024-05-29  275  	uint32_t irq_status;
e5df082e247559 shuaijie wang 2024-05-29  276  
e5df082e247559 shuaijie wang 2024-05-29  277  	//step1: read clear interrupt
e5df082e247559 shuaijie wang 2024-05-29  278  	if (p_sar->p_sar_para->p_platform_config->p_irq_init->rc_irq_fn != NULL)
e5df082e247559 shuaijie wang 2024-05-29  279  		irq_status = p_sar->p_sar_para->p_platform_config->p_irq_init->rc_irq_fn(p_sar->i2c);
e5df082e247559 shuaijie wang 2024-05-29  280  
e5df082e247559 shuaijie wang 2024-05-29  281  	//step2: Read the status register for status reporting
e5df082e247559 shuaijie wang 2024-05-29  282  	if (p_sar->p_sar_para->p_platform_config->p_irq_init->irq_spec_handler_fn != NULL)
e5df082e247559 shuaijie wang 2024-05-29 @283  		p_sar->p_sar_para->p_platform_config->p_irq_init->irq_spec_handler_fn(irq_status,
e5df082e247559 shuaijie wang 2024-05-29  284  				p_sar);
e5df082e247559 shuaijie wang 2024-05-29  285  
e5df082e247559 shuaijie wang 2024-05-29  286  	//step3: The chip
e5df082e247559 shuaijie wang 2024-05-29  287  
e5df082e247559 shuaijie wang 2024-05-29  288  	if ((!p_sar->dts_info.monitor_esd_flag) && (p_sar->fault_flag == AW_SAR_UNHEALTHY)) {
e5df082e247559 shuaijie wang 2024-05-29  289  		p_sar->fault_flag = AW_SAR_HEALTHY;
e5df082e247559 shuaijie wang 2024-05-29  290  		disable_irq_nosync(p_sar->irq_init.to_irq);
e5df082e247559 shuaijie wang 2024-05-29  291  		p_sar->irq_init.host_irq_stat = IRQ_DISABLE;
e5df082e247559 shuaijie wang 2024-05-29  292  		//aw_sar_soft_reset(p_sar);
e5df082e247559 shuaijie wang 2024-05-29  293  		schedule_delayed_work(&p_sar->update_work, msecs_to_jiffies(500));
e5df082e247559 shuaijie wang 2024-05-29  294  	}
e5df082e247559 shuaijie wang 2024-05-29  295  
e5df082e247559 shuaijie wang 2024-05-29  296  	return IRQ_HANDLED;
e5df082e247559 shuaijie wang 2024-05-29  297  }
e5df082e247559 shuaijie wang 2024-05-29  298  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
