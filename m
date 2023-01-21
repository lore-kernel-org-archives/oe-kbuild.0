Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAC2913
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jan 2023 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674309986; x=1705845986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04uOZXyoYWFG8tC/Ql2y/CEoCuG2XpJSmIH5mxsQ0iE=;
  b=QW8FyrJYLtUaQHKxV9LJjYmfyNcCWmXCvXJECE6sUne+FXS5tz07n+HX
   6tj+Ntr7tC8fw8UgW2i0OI4RzqW+mfSRaV2zs3HmRm0Qg6U7E0xB1bOPo
   /Ue3mAnYkbPWaJzWAniWrUgmAwLJrn5J+77zyNnDlU1Te+3IM5g0iDgQH
   UHtNdx+g1GHk5KyXErcGfv9b6OfoFegwXKHpXxFoP7RBqQLATltcgRka5
   heIvMidAv9iqFhbXzWeQVSGTQcPEf9bJ7KJ1hP2jTQcjjEhPEBGDkTAKA
   8WkbHrPY9F/EpYld8Y4+haiBhiXHmFB9nTfroQ+YC0x9o/wkSax+VGdE+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="353041289"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="353041289"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 06:06:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="729442620"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="729442620"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2023 06:06:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJEVk-00048s-0I;
	Sat, 21 Jan 2023 14:06:24 +0000
Date: Sat, 21 Jan 2023 22:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jsarha:topic/cros-sof-v4.14 7561/9354]
 drivers/phy/qualcomm/phy-qcom-qusb2.c:363:30: sparse: sparse: cast truncates
 bits from constant value (3fffffffff becomes ffffffff)
Message-ID: <202301212239.zAxyhTzU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Manu Gautam <mgautam@codeaurora.org>
CC: Douglas Anderson <dianders@chromium.org>
CC: Evan Green <evgreen@chromium.org>

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: 2b4bb749e774cffa7dd5fada6d181932a465b704 [7561/9354] FROMLIST: phy: qcom-qusb2: Add QUSB2 PHYs support for sdm845
:::::: branch date: 4 years, 5 months ago
:::::: commit date: 4 years, 8 months ago
config: parisc-randconfig-s032-20230120 (https://download.01.org/0day-ci/archive/20230121/202301212239.zAxyhTzU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/2b4bb749e774cffa7dd5fada6d181932a465b704
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14
        git checkout 2b4bb749e774cffa7dd5fada6d181932a465b704
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/phy/qualcomm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/qualcomm/phy-qcom-qusb2.c:363:30: sparse: sparse: cast truncates bits from constant value (3fffffffff becomes ffffffff)
   drivers/phy/qualcomm/phy-qcom-qusb2.c: note: in included file (through include/linux/io.h):
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
>> drivers/phy/qualcomm/phy-qcom-qusb2.c:368:34: sparse: sparse: cast truncates bits from constant value (fffffffff0 becomes fffffff0)
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
>> drivers/phy/qualcomm/phy-qcom-qusb2.c:373:33: sparse: sparse: cast truncates bits from constant value (3ffffffff becomes ffffffff)
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: too many warnings

vim +363 drivers/phy/qualcomm/phy-qcom-qusb2.c

ca04d9d3e1b141 drivers/phy/phy-qcom-qusb2.c          Vivek Gautam 2017-04-06  351  
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  352  /*
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  353   * Update board specific PHY tuning override values if specified from
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  354   * device tree.
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  355   */
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  356  static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  357  {
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  358  	const struct qusb2_phy_cfg *cfg = qphy->cfg;
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  359  
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  360  	if (qphy->override_imp_res_offset)
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  361  		qusb2_write_mask(qphy->base, QUSB2PHY_IMP_CTRL1,
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  362  			     qphy->imp_res_offset_value << IMP_RES_OFFSET_SHIFT,
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03 @363  			     IMP_RES_OFFSET_MASK);
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  364  
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  365  	if (qphy->override_hstx_trim)
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  366  		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  367  				 qphy->hstx_trim_value << HSTX_TRIM_SHIFT,
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03 @368  				 HSTX_TRIM_MASK);
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  369  
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  370  	if (qphy->override_preemphasis)
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  371  		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  372  				qphy->preemphasis_level << PREEMPHASIS_EN_SHIFT,
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03 @373  				PREEMPHASIS_EN_MASK);
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  374  
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  375  	if (qphy->override_preemphasis_width) {
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  376  		if (qphy->preemphasis_width ==
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  377  		    QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT)
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  378  			qusb2_setbits(qphy->base,
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  379  				      cfg->regs[QUSB2PHY_PORT_TUNE1],
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  380  				      PREEMPH_WIDTH_HALF_BIT);
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  381  		else
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  382  			qusb2_clrbits(qphy->base,
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  383  				      cfg->regs[QUSB2PHY_PORT_TUNE1],
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  384  				      PREEMPH_WIDTH_HALF_BIT);
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  385  	}
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  386  }
2b4bb749e774cf drivers/phy/qualcomm/phy-qcom-qusb2.c Manu Gautam  2018-05-03  387  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
