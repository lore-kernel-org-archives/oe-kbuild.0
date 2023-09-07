Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8A013FFD
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Sep 2023 19:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694113411; x=1725649411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/rYLJRZcF7Qm9xgmgch4pcIyzCrICO2Ev46FXNA4rn0=;
  b=H4sC3pjmbi3Muq3mTYvGukNciqQ8op2ZRsu5fqkMu66KdcU58gpBYr9T
   vmtnVKBQxl/Nsp3ZrrBzZOSxrn6JxtiEvkiJ54rYiZVGJlWK0qWY+jLD4
   nrOPmpimjMcKD5HCi3s6Tzlz4Og6hCO9AzUi4MIyJT42qEQOpiqYIciWt
   loCoDwM49V1vnBe0NSKURzAFrD6CE1CI55nAY9twMOSw7cWMWFSgDzmXh
   sWkp//tzY+GLTw6P+7dci5IRfEMir/FHrWEcRAbiNOgm15NEu0eveSDMr
   e+o6JpjncWvB5TgXaI5nhIOwuMndWPlHMe7dGz3II8/G3vktxdoKJiXx3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="376356726"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="376356726"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 12:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="735631634"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="735631634"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Sep 2023 12:03:29 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeKHn-0001Uf-0C;
	Thu, 07 Sep 2023 19:03:27 +0000
Date: Fri, 8 Sep 2023 03:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y 47/107] drivers/media/i2c/ds90ub953.c:642
 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
Message-ID: <202309080215.HBzgTN0m-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Jai Luthra <j-luthra@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   6c7b09058d06625c8386decb5573da65e3c4ccfc
commit: d1a221d48b45bc73a80c3e86a028dfe60f8a34b2 [47/107] media: i2c: add DS90UB953 driver
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230908/202309080215.HBzgTN0m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309080215.HBzgTN0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309080215.HBzgTN0m-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.

vim +/gpio_local_data +642 drivers/media/i2c/ds90ub953.c

d1a221d48b45bc Tomi Valkeinen 2023-05-09  588  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  589  static int ub953_log_status(struct v4l2_subdev *sd)
d1a221d48b45bc Tomi Valkeinen 2023-05-09  590  {
d1a221d48b45bc Tomi Valkeinen 2023-05-09  591  	struct ub953_data *priv = sd_to_ub953(sd);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  592  	struct device *dev = &priv->client->dev;
d1a221d48b45bc Tomi Valkeinen 2023-05-09  593  	u8 v = 0, v1 = 0, v2 = 0;
d1a221d48b45bc Tomi Valkeinen 2023-05-09  594  	unsigned int i;
d1a221d48b45bc Tomi Valkeinen 2023-05-09  595  	char id[UB953_REG_FPD3_RX_ID_LEN];
d1a221d48b45bc Tomi Valkeinen 2023-05-09  596  	u8 gpio_local_data;
d1a221d48b45bc Tomi Valkeinen 2023-05-09  597  	u8 gpio_input_ctrl;
d1a221d48b45bc Tomi Valkeinen 2023-05-09  598  	u8 gpio_pin_sts;
d1a221d48b45bc Tomi Valkeinen 2023-05-09  599  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  600  	for (i = 0; i < sizeof(id); i++)
d1a221d48b45bc Tomi Valkeinen 2023-05-09  601  		ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i]);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  602  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  603  	dev_info(dev, "ID '%.*s'\n", (int)sizeof(id), id);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  604  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  605  	ub953_read(priv, UB953_REG_GENERAL_STATUS, &v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  606  	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  607  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  608  	ub953_read(priv, UB953_REG_CRC_ERR_CNT1, &v1);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  609  	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  610  	dev_info(dev, "CRC error count %u\n", v1 | (v2 << 8));
d1a221d48b45bc Tomi Valkeinen 2023-05-09  611  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  612  	ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  613  	dev_info(dev, "CSI error count %u\n", v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  614  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  615  	ub953_read(priv, UB953_REG_CSI_ERR_STATUS, &v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  616  	dev_info(dev, "CSI_ERR_STATUS %#02x\n", v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  617  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  618  	ub953_read(priv, UB953_REG_CSI_ERR_DLANE01, &v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  619  	dev_info(dev, "CSI_ERR_DLANE01 %#02x\n", v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  620  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  621  	ub953_read(priv, UB953_REG_CSI_ERR_DLANE23, &v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  622  	dev_info(dev, "CSI_ERR_DLANE23 %#02x\n", v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  623  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  624  	ub953_read(priv, UB953_REG_CSI_ERR_CLK_LANE, &v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  625  	dev_info(dev, "CSI_ERR_CLK_LANE %#02x\n", v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  626  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  627  	ub953_read(priv, UB953_REG_CSI_PKT_HDR_VC_ID, &v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  628  	dev_info(dev, "CSI packet header VC %u ID %u\n", v >> 6, v & 0x3f);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  629  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  630  	ub953_read(priv, UB953_REG_PKT_HDR_WC_LSB, &v1);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  631  	ub953_read(priv, UB953_REG_PKT_HDR_WC_MSB, &v2);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  632  	dev_info(dev, "CSI packet header WC %u\n", (v2 << 8) | v1);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  633  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  634  	ub953_read(priv, UB953_REG_CSI_ECC, &v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  635  	dev_info(dev, "CSI ECC %#02x\n", v);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  636  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  637  	ub953_read(priv, UB953_REG_LOCAL_GPIO_DATA, &gpio_local_data);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  638  	ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  639  	ub953_read(priv, UB953_REG_GPIO_PIN_STS, &gpio_pin_sts);
d1a221d48b45bc Tomi Valkeinen 2023-05-09  640  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  641  	for (i = 0; i < UB953_NUM_GPIOS; i++) {
d1a221d48b45bc Tomi Valkeinen 2023-05-09 @642  		dev_info(dev,
d1a221d48b45bc Tomi Valkeinen 2023-05-09  643  			 "GPIO%u: remote: %u is_input: %u is_output: %u val: %u sts: %u\n",
d1a221d48b45bc Tomi Valkeinen 2023-05-09  644  			 i,
d1a221d48b45bc Tomi Valkeinen 2023-05-09  645  			 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(i)),
d1a221d48b45bc Tomi Valkeinen 2023-05-09  646  			 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(i)),
d1a221d48b45bc Tomi Valkeinen 2023-05-09  647  			 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_OUT_EN(i)),
d1a221d48b45bc Tomi Valkeinen 2023-05-09  648  			 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(i)),
d1a221d48b45bc Tomi Valkeinen 2023-05-09  649  			 !!(gpio_pin_sts & UB953_REG_GPIO_PIN_STS_GPIO_STS(i)));
d1a221d48b45bc Tomi Valkeinen 2023-05-09  650  	}
d1a221d48b45bc Tomi Valkeinen 2023-05-09  651  
d1a221d48b45bc Tomi Valkeinen 2023-05-09  652  	return 0;
d1a221d48b45bc Tomi Valkeinen 2023-05-09  653  }
d1a221d48b45bc Tomi Valkeinen 2023-05-09  654  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
