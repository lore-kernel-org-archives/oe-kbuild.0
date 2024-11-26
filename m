Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1821653
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 05:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732598660; cv=none; b=O/7p0vAB2Mul+0b9q4XqO6wtJbnqZJ2dKuA+UsuWn3MiUBtGNkfHFD+T3vWgQuHBsK+MxbENG+CDq4OQwwlY9oO01y1QhDrbnPguxVuEPxrHa7viK8cvlx1uPiBLw6OvV4/PD3k7yxOab/G0wLu3gAyg8KpwsvzqSIoxq+e/Nxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732598660; c=relaxed/simple;
	bh=jYbq2AO3zXnIx64IH4gXYG+UIEjIcQ/1xFyB7dQpJnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nGn2ajJW57B+RlmhKNqRJLJzLr9o912FzAWznufEn8D0trJIYyBP+O8V0Fcz7WrR9fpdq/VHaa6UcN3nUD5cSHwNDyyjZgDYLaCse1k9c0lYsJONNXHMc3IlxNczlq6tWStEmw5oMD/dluvtapKUSogk++UNn+cOCBxBt230RGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULI8Jxgy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULI8Jxgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732598659; x=1764134659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jYbq2AO3zXnIx64IH4gXYG+UIEjIcQ/1xFyB7dQpJnQ=;
  b=ULI8JxgyADyF3rWQW4K5PctX0J3tMNuPJ4vGzpIkDZPMXObmo2nZ1x6E
   Tfz13okXZpNJXSJuw33OEePvb5JuHpHF0oU6Zm2VGcHhVDod7shZcPS/o
   QZiZ2MdfACXD8EUAWbIs37ZWs8ZFkT65/eqcJuiemH/bXkPsc4QtoPQIM
   MqL7/VcAOouUvhdaRXZRIHpTW6cl17CIy4DC+JEAJKwpfkRF26RQ8VRGm
   dfY0Sy2whRVG0U6KO5K2mMbuoeqdRC6O0ALlbvBOViO2Cz91OdhDubW6u
   ZC09G5VolZpMci/KqoS5mxs+ijFaZ9vf24kUtxof58Hezi8yjeqbtLS5x
   A==;
X-CSE-ConnectionGUID: MbgbVDmNTa2S+4td7N8Tjw==
X-CSE-MsgGUID: vH1DAm8WS4SSGSUq4+nKrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50147255"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="50147255"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP; 25 Nov 2024 21:23:52 -0800
X-CSE-ConnectionGUID: 1odLMO3KTSuu/QPjXxTnSg==
X-CSE-MsgGUID: DCmG0VVmQ8uVcL/3/eJkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96564300"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 21:23:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFo39-00075Z-0n;
	Tue, 26 Nov 2024 05:23:47 +0000
Date: Tue, 26 Nov 2024 13:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/phy/realtek/phy-rtk-usb2.c:744:5-40: opportunity for
 str_true_false(phy_cfg -> usb_dc_disconnect_at_page0)
Message-ID: <202411261351.0Knh6ebI-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Stanley Chang <stanley_chang@realtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: eeda494542e55b603c7b80e14bfc5ee4ab7f9814 phy: realtek: usb: add new driver for the Realtek RTD SoC USB 2.0 PHY
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: sparc64-randconfig-r061-20241126 (https://download.01.org/0day-ci/archive/20241126/202411261351.0Knh6ebI-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411261351.0Knh6ebI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/realtek/phy-rtk-usb2.c:744:5-40: opportunity for str_true_false(phy_cfg -> usb_dc_disconnect_at_page0)

vim +744 drivers/phy/realtek/phy-rtk-usb2.c

eeda494542e55b Stanley Chang 2023-12-13  721  
eeda494542e55b Stanley Chang 2023-12-13  722  static int rtk_usb2_parameter_show(struct seq_file *s, void *unused)
eeda494542e55b Stanley Chang 2023-12-13  723  {
eeda494542e55b Stanley Chang 2023-12-13  724  	struct rtk_phy *rtk_phy = s->private;
eeda494542e55b Stanley Chang 2023-12-13  725  	struct phy_cfg *phy_cfg;
eeda494542e55b Stanley Chang 2023-12-13  726  	int i, index;
eeda494542e55b Stanley Chang 2023-12-13  727  
eeda494542e55b Stanley Chang 2023-12-13  728  	phy_cfg = rtk_phy->phy_cfg;
eeda494542e55b Stanley Chang 2023-12-13  729  
eeda494542e55b Stanley Chang 2023-12-13  730  	seq_puts(s, "Property:\n");
eeda494542e55b Stanley Chang 2023-12-13  731  	seq_printf(s, "  check_efuse: %s\n",
eeda494542e55b Stanley Chang 2023-12-13  732  		   phy_cfg->check_efuse ? "Enable" : "Disable");
eeda494542e55b Stanley Chang 2023-12-13  733  	seq_printf(s, "  check_efuse_version: %d\n",
eeda494542e55b Stanley Chang 2023-12-13  734  		   phy_cfg->check_efuse_version);
eeda494542e55b Stanley Chang 2023-12-13  735  	seq_printf(s, "  efuse_dc_driving_rate: %d\n",
eeda494542e55b Stanley Chang 2023-12-13  736  		   phy_cfg->efuse_dc_driving_rate);
eeda494542e55b Stanley Chang 2023-12-13  737  	seq_printf(s, "  dc_driving_mask: 0x%x\n",
eeda494542e55b Stanley Chang 2023-12-13  738  		   phy_cfg->dc_driving_mask);
eeda494542e55b Stanley Chang 2023-12-13  739  	seq_printf(s, "  efuse_dc_disconnect_rate: %d\n",
eeda494542e55b Stanley Chang 2023-12-13  740  		   phy_cfg->efuse_dc_disconnect_rate);
eeda494542e55b Stanley Chang 2023-12-13  741  	seq_printf(s, "  dc_disconnect_mask: 0x%x\n",
eeda494542e55b Stanley Chang 2023-12-13  742  		   phy_cfg->dc_disconnect_mask);
eeda494542e55b Stanley Chang 2023-12-13  743  	seq_printf(s, "  usb_dc_disconnect_at_page0: %s\n",
eeda494542e55b Stanley Chang 2023-12-13 @744  		   phy_cfg->usb_dc_disconnect_at_page0 ? "true" : "false");
eeda494542e55b Stanley Chang 2023-12-13  745  	seq_printf(s, "  do_toggle: %s\n",
eeda494542e55b Stanley Chang 2023-12-13  746  		   phy_cfg->do_toggle ? "Enable" : "Disable");
eeda494542e55b Stanley Chang 2023-12-13  747  	seq_printf(s, "  do_toggle_driving: %s\n",
eeda494542e55b Stanley Chang 2023-12-13  748  		   phy_cfg->do_toggle_driving ? "Enable" : "Disable");
eeda494542e55b Stanley Chang 2023-12-13  749  	seq_printf(s, "  driving_updated_for_dev_dis: 0x%x\n",
eeda494542e55b Stanley Chang 2023-12-13  750  		   phy_cfg->driving_updated_for_dev_dis);
eeda494542e55b Stanley Chang 2023-12-13  751  	seq_printf(s, "  use_default_parameter: %s\n",
eeda494542e55b Stanley Chang 2023-12-13  752  		   phy_cfg->use_default_parameter ? "Enable" : "Disable");
eeda494542e55b Stanley Chang 2023-12-13  753  	seq_printf(s, "  is_double_sensitivity_mode: %s\n",
eeda494542e55b Stanley Chang 2023-12-13  754  		   phy_cfg->is_double_sensitivity_mode ? "Enable" : "Disable");
eeda494542e55b Stanley Chang 2023-12-13  755  
eeda494542e55b Stanley Chang 2023-12-13  756  	for (index = 0; index < rtk_phy->num_phy; index++) {
eeda494542e55b Stanley Chang 2023-12-13  757  		struct phy_parameter *phy_parameter;
eeda494542e55b Stanley Chang 2023-12-13  758  		struct phy_reg *phy_reg;
eeda494542e55b Stanley Chang 2023-12-13  759  		struct phy_data *phy_data_page;
eeda494542e55b Stanley Chang 2023-12-13  760  
eeda494542e55b Stanley Chang 2023-12-13  761  		phy_parameter =  &((struct phy_parameter *)rtk_phy->phy_parameter)[index];
eeda494542e55b Stanley Chang 2023-12-13  762  		phy_reg = &phy_parameter->phy_reg;
eeda494542e55b Stanley Chang 2023-12-13  763  
eeda494542e55b Stanley Chang 2023-12-13  764  		seq_printf(s, "PHY %d:\n", index);
eeda494542e55b Stanley Chang 2023-12-13  765  
eeda494542e55b Stanley Chang 2023-12-13  766  		seq_puts(s, "Page 0:\n");
eeda494542e55b Stanley Chang 2023-12-13  767  		/* Set page 0 */
eeda494542e55b Stanley Chang 2023-12-13  768  		phy_data_page = phy_cfg->page0;
eeda494542e55b Stanley Chang 2023-12-13  769  		rtk_phy_set_page(phy_reg, 0);
eeda494542e55b Stanley Chang 2023-12-13  770  
eeda494542e55b Stanley Chang 2023-12-13  771  		for (i = 0; i < phy_cfg->page0_size; i++) {
eeda494542e55b Stanley Chang 2023-12-13  772  			struct phy_data *phy_data = phy_data_page + i;
eeda494542e55b Stanley Chang 2023-12-13  773  			u8 addr = array_index_to_page_addr(i);
eeda494542e55b Stanley Chang 2023-12-13  774  			u8 data = phy_data->data;
eeda494542e55b Stanley Chang 2023-12-13  775  			u8 value = rtk_phy_read(phy_reg, addr);
eeda494542e55b Stanley Chang 2023-12-13  776  
eeda494542e55b Stanley Chang 2023-12-13  777  			if (phy_data->addr)
eeda494542e55b Stanley Chang 2023-12-13  778  				seq_printf(s, "  Page 0: addr=0x%x data=0x%02x ==> read value=0x%02x\n",
eeda494542e55b Stanley Chang 2023-12-13  779  					   addr, data, value);
eeda494542e55b Stanley Chang 2023-12-13  780  			else
eeda494542e55b Stanley Chang 2023-12-13  781  				seq_printf(s, "  Page 0: addr=0x%x data=none ==> read value=0x%02x\n",
eeda494542e55b Stanley Chang 2023-12-13  782  					   addr, value);
eeda494542e55b Stanley Chang 2023-12-13  783  		}
eeda494542e55b Stanley Chang 2023-12-13  784  
eeda494542e55b Stanley Chang 2023-12-13  785  		seq_puts(s, "Page 1:\n");
eeda494542e55b Stanley Chang 2023-12-13  786  		/* Set page 1 */
eeda494542e55b Stanley Chang 2023-12-13  787  		phy_data_page = phy_cfg->page1;
eeda494542e55b Stanley Chang 2023-12-13  788  		rtk_phy_set_page(phy_reg, 1);
eeda494542e55b Stanley Chang 2023-12-13  789  
eeda494542e55b Stanley Chang 2023-12-13  790  		for (i = 0; i < phy_cfg->page1_size; i++) {
eeda494542e55b Stanley Chang 2023-12-13  791  			struct phy_data *phy_data = phy_data_page + i;
eeda494542e55b Stanley Chang 2023-12-13  792  			u8 addr = array_index_to_page_addr(i);
eeda494542e55b Stanley Chang 2023-12-13  793  			u8 data = phy_data->data;
eeda494542e55b Stanley Chang 2023-12-13  794  			u8 value = rtk_phy_read(phy_reg, addr);
eeda494542e55b Stanley Chang 2023-12-13  795  
eeda494542e55b Stanley Chang 2023-12-13  796  			if (phy_data->addr)
eeda494542e55b Stanley Chang 2023-12-13  797  				seq_printf(s, "  Page 1: addr=0x%x data=0x%02x ==> read value=0x%02x\n",
eeda494542e55b Stanley Chang 2023-12-13  798  					   addr, data, value);
eeda494542e55b Stanley Chang 2023-12-13  799  			else
eeda494542e55b Stanley Chang 2023-12-13  800  				seq_printf(s, "  Page 1: addr=0x%x data=none ==> read value=0x%02x\n",
eeda494542e55b Stanley Chang 2023-12-13  801  					   addr, value);
eeda494542e55b Stanley Chang 2023-12-13  802  		}
eeda494542e55b Stanley Chang 2023-12-13  803  
eeda494542e55b Stanley Chang 2023-12-13  804  		if (phy_cfg->page2_size == 0)
eeda494542e55b Stanley Chang 2023-12-13  805  			goto out;
eeda494542e55b Stanley Chang 2023-12-13  806  
eeda494542e55b Stanley Chang 2023-12-13  807  		seq_puts(s, "Page 2:\n");
eeda494542e55b Stanley Chang 2023-12-13  808  		/* Set page 2 */
eeda494542e55b Stanley Chang 2023-12-13  809  		phy_data_page = phy_cfg->page2;
eeda494542e55b Stanley Chang 2023-12-13  810  		rtk_phy_set_page(phy_reg, 2);
eeda494542e55b Stanley Chang 2023-12-13  811  
eeda494542e55b Stanley Chang 2023-12-13  812  		for (i = 0; i < phy_cfg->page2_size; i++) {
eeda494542e55b Stanley Chang 2023-12-13  813  			struct phy_data *phy_data = phy_data_page + i;
eeda494542e55b Stanley Chang 2023-12-13  814  			u8 addr = array_index_to_page_addr(i);
eeda494542e55b Stanley Chang 2023-12-13  815  			u8 data = phy_data->data;
eeda494542e55b Stanley Chang 2023-12-13  816  			u8 value = rtk_phy_read(phy_reg, addr);
eeda494542e55b Stanley Chang 2023-12-13  817  
eeda494542e55b Stanley Chang 2023-12-13  818  			if (phy_data->addr)
eeda494542e55b Stanley Chang 2023-12-13  819  				seq_printf(s, "  Page 2: addr=0x%x data=0x%02x ==> read value=0x%02x\n",
eeda494542e55b Stanley Chang 2023-12-13  820  					   addr, data, value);
eeda494542e55b Stanley Chang 2023-12-13  821  			else
eeda494542e55b Stanley Chang 2023-12-13  822  				seq_printf(s, "  Page 2: addr=0x%x data=none ==> read value=0x%02x\n",
eeda494542e55b Stanley Chang 2023-12-13  823  					   addr, value);
eeda494542e55b Stanley Chang 2023-12-13  824  		}
eeda494542e55b Stanley Chang 2023-12-13  825  
eeda494542e55b Stanley Chang 2023-12-13  826  out:
eeda494542e55b Stanley Chang 2023-12-13  827  		seq_puts(s, "PHY Property:\n");
eeda494542e55b Stanley Chang 2023-12-13  828  		seq_printf(s, "  efuse_usb_dc_cal: %d\n",
eeda494542e55b Stanley Chang 2023-12-13  829  			   (int)phy_parameter->efuse_usb_dc_cal);
eeda494542e55b Stanley Chang 2023-12-13  830  		seq_printf(s, "  efuse_usb_dc_dis: %d\n",
eeda494542e55b Stanley Chang 2023-12-13  831  			   (int)phy_parameter->efuse_usb_dc_dis);
eeda494542e55b Stanley Chang 2023-12-13  832  		seq_printf(s, "  inverse_hstx_sync_clock: %s\n",
eeda494542e55b Stanley Chang 2023-12-13  833  			   phy_parameter->inverse_hstx_sync_clock ? "Enable" : "Disable");
eeda494542e55b Stanley Chang 2023-12-13  834  		seq_printf(s, "  driving_level: %d\n",
eeda494542e55b Stanley Chang 2023-12-13  835  			   phy_parameter->driving_level);
eeda494542e55b Stanley Chang 2023-12-13  836  		seq_printf(s, "  driving_level_compensate: %d\n",
eeda494542e55b Stanley Chang 2023-12-13  837  			   phy_parameter->driving_level_compensate);
eeda494542e55b Stanley Chang 2023-12-13  838  		seq_printf(s, "  disconnection_compensate: %d\n",
eeda494542e55b Stanley Chang 2023-12-13  839  			   phy_parameter->disconnection_compensate);
eeda494542e55b Stanley Chang 2023-12-13  840  	}
eeda494542e55b Stanley Chang 2023-12-13  841  
eeda494542e55b Stanley Chang 2023-12-13  842  	return 0;
eeda494542e55b Stanley Chang 2023-12-13  843  }
eeda494542e55b Stanley Chang 2023-12-13  844  DEFINE_SHOW_ATTRIBUTE(rtk_usb2_parameter);
eeda494542e55b Stanley Chang 2023-12-13  845  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
