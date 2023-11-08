Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976F1D267
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Nov 2023 06:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EM5f1IhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699426084; x=1730962084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0GxPXH+yAn3siaywnEEUJXhzoDZau22HPrxsObznZ4=;
  b=EM5f1IhY8cJ/eQsMOQtwIrLjp9RwNGywBpkjNex9quqms66G+hiErjta
   oGWGjKNXu+ovlspGS5Ay5SumHp/bg9e0BR8nZIaB1azbUEkN81F5xt8TZ
   HACHb20dCYfzwkpj7PuZeezcgplS9zI6Hlv3aqEObS0RG9aV3+EHikZ2+
   uPfY+fr9OxdTrxWjOe/RXcKys7/zMUAAF7KrFKRtjYaxBTTq+K2a+VaGK
   uvpHiT1CJd71MOWL+24g987EqiquSLKA902F1i7DqUfTJeh2KV+hRAMyr
   qfAeThozBVoOU67/821M+q2YTRP4vQyD8wNuCqq7Nh0zK13B0MBN+WKMi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456198763"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="456198763"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 22:48:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1010171462"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="1010171462"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Nov 2023 22:48:02 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0cM4-0007k8-0Q;
	Wed, 08 Nov 2023 06:48:00 +0000
Date: Wed, 8 Nov 2023 14:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/codecs/aw88399.c:963 aw_dev_check_sram() error:
 uninitialized symbol 'reg_val'.
Message-ID: <202311081422.RH1UPwXx-lkp@intel.com>
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
TO: Weidong Wang <wangweidong.a@awinic.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   305230142ae0637213bf6e04f6d9f10bbcb74af8
commit: 8ade6cc7e26175529474690fdbc1965901ec2024 ASoC: codecs: Add aw88399 amplifier driver
date:   2 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20231108 (https://download.01.org/0day-ci/archive/20231108/202311081422.RH1UPwXx-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311081422.RH1UPwXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311081422.RH1UPwXx-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/aw88399.c:963 aw_dev_check_sram() error: uninitialized symbol 'reg_val'.

Old smatch warnings:
sound/soc/codecs/aw88399.c:441 aw_dev_set_vcalb() error: uninitialized symbol 'vsense_select'.

vim +/reg_val +963 sound/soc/codecs/aw88399.c

8ade6cc7e26175 Weidong Wang 2023-10-25  955  
8ade6cc7e26175 Weidong Wang 2023-10-25  956  static int aw_dev_check_sram(struct aw_device *aw_dev)
8ade6cc7e26175 Weidong Wang 2023-10-25  957  {
8ade6cc7e26175 Weidong Wang 2023-10-25  958  	unsigned int reg_val;
8ade6cc7e26175 Weidong Wang 2023-10-25  959  
8ade6cc7e26175 Weidong Wang 2023-10-25  960  	mutex_lock(&aw_dev->dsp_lock);
8ade6cc7e26175 Weidong Wang 2023-10-25  961  	/* read dsp_rom_check_reg */
8ade6cc7e26175 Weidong Wang 2023-10-25  962  	aw_dev_dsp_read_16bit(aw_dev, AW88399_DSP_ROM_CHECK_ADDR, &reg_val);
8ade6cc7e26175 Weidong Wang 2023-10-25 @963  	if (reg_val != AW88399_DSP_ROM_CHECK_DATA) {
8ade6cc7e26175 Weidong Wang 2023-10-25  964  		dev_err(aw_dev->dev, "check dsp rom failed, read[0x%x] != check[0x%x]",
8ade6cc7e26175 Weidong Wang 2023-10-25  965  						reg_val, AW88399_DSP_ROM_CHECK_DATA);
8ade6cc7e26175 Weidong Wang 2023-10-25  966  		goto error;
8ade6cc7e26175 Weidong Wang 2023-10-25  967  	}
8ade6cc7e26175 Weidong Wang 2023-10-25  968  
8ade6cc7e26175 Weidong Wang 2023-10-25  969  	/* check dsp_cfg_base_addr */
8ade6cc7e26175 Weidong Wang 2023-10-25  970  	aw_dev_dsp_write_16bit(aw_dev, AW88399_DSP_CFG_ADDR, AW88399_DSP_ODD_NUM_BIT_TEST);
8ade6cc7e26175 Weidong Wang 2023-10-25  971  	aw_dev_dsp_read_16bit(aw_dev, AW88399_DSP_CFG_ADDR, &reg_val);
8ade6cc7e26175 Weidong Wang 2023-10-25  972  	if (reg_val != AW88399_DSP_ODD_NUM_BIT_TEST) {
8ade6cc7e26175 Weidong Wang 2023-10-25  973  		dev_err(aw_dev->dev, "check dsp cfg failed, read[0x%x] != write[0x%x]",
8ade6cc7e26175 Weidong Wang 2023-10-25  974  						reg_val, AW88399_DSP_ODD_NUM_BIT_TEST);
8ade6cc7e26175 Weidong Wang 2023-10-25  975  		goto error;
8ade6cc7e26175 Weidong Wang 2023-10-25  976  	}
8ade6cc7e26175 Weidong Wang 2023-10-25  977  	mutex_unlock(&aw_dev->dsp_lock);
8ade6cc7e26175 Weidong Wang 2023-10-25  978  
8ade6cc7e26175 Weidong Wang 2023-10-25  979  	return 0;
8ade6cc7e26175 Weidong Wang 2023-10-25  980  error:
8ade6cc7e26175 Weidong Wang 2023-10-25  981  	mutex_unlock(&aw_dev->dsp_lock);
8ade6cc7e26175 Weidong Wang 2023-10-25  982  	return -EPERM;
8ade6cc7e26175 Weidong Wang 2023-10-25  983  }
8ade6cc7e26175 Weidong Wang 2023-10-25  984  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
