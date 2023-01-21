Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7632119
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jan 2023 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674306327; x=1705842327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yhNr/Dcws8IqkBD+zMQoqgPmNF2kblG8boHJqcmmNdM=;
  b=NGZrjECGsqPJM/PeODs1oWZFbrS5NWkS7pOYnjQTrps4TQZQRplBU9iA
   0ml1aoRnlI1elcRECjaqyDlqyEyizTAYsaHtbhpBhHaucm0cdBW5KmM0U
   RKkfZHfTc4KtBjk5l/R9wh3RF9KVnG4tnQUydBxzunEaOWU26fe1TMu7C
   AZZxTLuN+wjIgoKhUSTTkw1ILTYpHxDykJ1XOw4FPtNFvZ1t+h6iTcdHY
   3v3wOxNVWbPxbJrwWXHYl1enuD3rj1NxyhTRtvMwCNWqr7Q1fUmzAlzxA
   VN5034z5/aQmOUXEFoXznnt8nChJBHgttABBZPlCOfQbPi8c3l6lfgRBW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="306141756"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="306141756"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 05:05:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="724267904"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="724267904"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jan 2023 05:05:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJDYf-00045K-1F;
	Sat, 21 Jan 2023 13:05:21 +0000
Date: Sat, 21 Jan 2023 21:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jsarha:topic/cros-sof-v4.14 6753/9354]
 drivers/soc/qcom/qcom-geni-se.c:214:9: sparse: sparse: cast truncates bits
 from constant value (7fffffffff becomes ffffffff)
Message-ID: <202301212114.wbQUIPGO-lkp@intel.com>
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
TO: Guenter Roeck <groeck@chromium.org>
CC: Evan Green <evgreen@chromium.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Douglas Anderson <dianders@chromium.org>

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: 80e8d09cd0f256102ef7ce60150b3cf708e9c2e1 [6753/9354] FROMLIST: soc: Unconditionally include qcom Makefile
:::::: branch date: 4 years, 5 months ago
:::::: commit date: 4 years, 9 months ago
config: parisc-randconfig-s032-20230120 (https://download.01.org/0day-ci/archive/20230121/202301212114.wbQUIPGO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/80e8d09cd0f256102ef7ce60150b3cf708e9c2e1
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14
        git checkout 80e8d09cd0f256102ef7ce60150b3cf708e9c2e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/phy/ drivers/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/soc/qcom/qcom-geni-se.c: note: in included file (through include/linux/scatterlist.h, include/linux/dma-mapping.h):
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
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
>> drivers/soc/qcom/qcom-geni-se.c:214:9: sparse: sparse: cast truncates bits from constant value (7fffffffff becomes ffffffff)
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
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
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
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
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:207:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int b @@     got restricted __le32 [usertype] @@
   arch/parisc/include/asm/io.h:207:22: sparse:     expected unsigned int b
   arch/parisc/include/asm/io.h:207:22: sparse:     got restricted __le32 [usertype]
   arch/parisc/include/asm/io.h:190:16: sparse: sparse: cast to restricted __le32

vim +214 drivers/soc/qcom/qcom-geni-se.c

4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  200  
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  201  static void geni_se_io_init(void __iomem *base)
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  202  {
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  203  	u32 val;
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  204  
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  205  	val = readl_relaxed(base + GENI_CGC_CTRL);
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  206  	val |= DEFAULT_CGC_EN;
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  207  	writel_relaxed(val, base + GENI_CGC_CTRL);
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  208  
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  209  	val = readl_relaxed(base + SE_DMA_GENERAL_CFG);
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  210  	val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CFG_ON;
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  211  	val |= DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  212  	writel_relaxed(val, base + SE_DMA_GENERAL_CFG);
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  213  
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30 @214  	writel_relaxed(DEFAULT_IO_OUTPUT_CTRL_MSK, base + GENI_OUTPUT_CTRL);
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  215  	writel_relaxed(FORCE_DEFAULT, base + GENI_FORCE_DEFAULT_REG);
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  216  }
4ebc20231be2ec Karthikeyan Ramasubramanian 2018-03-30  217  

:::::: The code at line 214 was first introduced by commit
:::::: 4ebc20231be2ec4ca0b9cdb3dbf9015ea0966bd3 FROMLIST: soc: qcom: Add GENI based QUP Wrapper driver

:::::: TO: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
:::::: CC: chrome-bot <chrome-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
