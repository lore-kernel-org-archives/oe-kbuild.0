Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C18A27127
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 19:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690484474; x=1722020474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jqp5PdIYfIKuH1OhJR+u/6MK2gNfSi3EAKqN9IyEoUA=;
  b=HPjJvDFBGgIN982/kzdmS9gv9RPFXvz+2TuFl+Q+nH3gqa2h+Vr2w86Y
   5BihCK46JqMdmqgv8ub7AkZd3/XeeLC7aSV2aaerw4Br1kqJCrFfpHh4Y
   3+I+9ZcZvw98Y5edG6dh0It2DM85eBCjGn8h6zyOxi3Nfz92PJ94y0PBK
   zKwzg+5DQEnfM4GBdSjopQTNloPFk6nm6iLeGdzekXxDPmaypFjfSxpnb
   h/0N7vVVHeTSlSBBp2iMb9TyvJHg6IYWA2vd/x4Wg8RsK7aRt4mefWnG8
   XcpX6sv/hcwpSrAmAQVhiRJEcr5rncudOxrCK2c2z3bPpoS8FrYgSJoYn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="367280115"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="367280115"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 12:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="756806698"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="756806698"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Jul 2023 12:01:11 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP6EY-0002XP-0Y;
	Thu, 27 Jul 2023 19:01:10 +0000
Date: Fri, 28 Jul 2023 03:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1844/5027] drivers/media/i2c/ds90ub953.c:642
 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
Message-ID: <202307280242.N5Gd0EzO-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
commit: 6363db1c9d45a54ddc1582423b74b5f9935b5958 [1844/5027] media: i2c: add DS90UB953 driver
:::::: branch date: 14 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-m001-20230726 (https://download.01.org/0day-ci/archive/20230728/202307280242.N5Gd0EzO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280242.N5Gd0EzO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307280242.N5Gd0EzO-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.

vim +/gpio_local_data +642 drivers/media/i2c/ds90ub953.c

6363db1c9d45a5 Tomi Valkeinen 2023-06-19  588  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  589  static int ub953_log_status(struct v4l2_subdev *sd)
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  590  {
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  591  	struct ub953_data *priv = sd_to_ub953(sd);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  592  	struct device *dev = &priv->client->dev;
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  593  	u8 v = 0, v1 = 0, v2 = 0;
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  594  	unsigned int i;
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  595  	char id[UB953_REG_FPD3_RX_ID_LEN];
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  596  	u8 gpio_local_data;
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  597  	u8 gpio_input_ctrl;
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  598  	u8 gpio_pin_sts;
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  599  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  600  	for (i = 0; i < sizeof(id); i++)
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  601  		ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i]);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  602  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  603  	dev_info(dev, "ID '%.*s'\n", (int)sizeof(id), id);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  604  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  605  	ub953_read(priv, UB953_REG_GENERAL_STATUS, &v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  606  	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  607  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  608  	ub953_read(priv, UB953_REG_CRC_ERR_CNT1, &v1);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  609  	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  610  	dev_info(dev, "CRC error count %u\n", v1 | (v2 << 8));
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  611  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  612  	ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  613  	dev_info(dev, "CSI error count %u\n", v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  614  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  615  	ub953_read(priv, UB953_REG_CSI_ERR_STATUS, &v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  616  	dev_info(dev, "CSI_ERR_STATUS %#02x\n", v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  617  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  618  	ub953_read(priv, UB953_REG_CSI_ERR_DLANE01, &v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  619  	dev_info(dev, "CSI_ERR_DLANE01 %#02x\n", v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  620  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  621  	ub953_read(priv, UB953_REG_CSI_ERR_DLANE23, &v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  622  	dev_info(dev, "CSI_ERR_DLANE23 %#02x\n", v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  623  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  624  	ub953_read(priv, UB953_REG_CSI_ERR_CLK_LANE, &v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  625  	dev_info(dev, "CSI_ERR_CLK_LANE %#02x\n", v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  626  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  627  	ub953_read(priv, UB953_REG_CSI_PKT_HDR_VC_ID, &v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  628  	dev_info(dev, "CSI packet header VC %u ID %u\n", v >> 6, v & 0x3f);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  629  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  630  	ub953_read(priv, UB953_REG_PKT_HDR_WC_LSB, &v1);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  631  	ub953_read(priv, UB953_REG_PKT_HDR_WC_MSB, &v2);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  632  	dev_info(dev, "CSI packet header WC %u\n", (v2 << 8) | v1);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  633  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  634  	ub953_read(priv, UB953_REG_CSI_ECC, &v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  635  	dev_info(dev, "CSI ECC %#02x\n", v);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  636  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  637  	ub953_read(priv, UB953_REG_LOCAL_GPIO_DATA, &gpio_local_data);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  638  	ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  639  	ub953_read(priv, UB953_REG_GPIO_PIN_STS, &gpio_pin_sts);
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  640  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  641  	for (i = 0; i < UB953_NUM_GPIOS; i++) {
6363db1c9d45a5 Tomi Valkeinen 2023-06-19 @642  		dev_info(dev,
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  643  			 "GPIO%u: remote: %u is_input: %u is_output: %u val: %u sts: %u\n",
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  644  			 i,
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  645  			 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(i)),
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  646  			 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(i)),
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  647  			 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_OUT_EN(i)),
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  648  			 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(i)),
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  649  			 !!(gpio_pin_sts & UB953_REG_GPIO_PIN_STS_GPIO_STS(i)));
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  650  	}
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  651  
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  652  	return 0;
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  653  }
6363db1c9d45a5 Tomi Valkeinen 2023-06-19  654  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
