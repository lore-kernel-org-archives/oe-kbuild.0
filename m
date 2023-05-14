Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29032137B
	for <oe-kbuild@lists.linux.dev>; Sun, 14 May 2023 03:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684035862; x=1715571862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XOv91yGeieIYZNapSEzqTvzXlFVqD8cyu5wjo2bFnuQ=;
  b=SJlMk0+r84rIcCgqRDxXGREQUN8E/AKpctbE6N2zwnqAFi+Z7FT7XucD
   YdJJeWOciiMM+ksaDL8YJrdxPXvfdI8cJlLILnSLTGCuOd5XqezYmw7U7
   ieXPmM/wliuVISTbjgm8zrgth0gfFEH5Uwt75osXs8lBzsiB51j9M3nIC
   qRn4uY9SSzIBSKxJfq/XZTrPu5G+BTJDDQfTBOSMpcdimSRmrRsKmxHvU
   RPW/Y6zZHAPblL1kiflG7VaDtwvRtY05FtFOT6AJmcxZPcLNuSBSCj7va
   m6kZVERTgCqK0afBGl1sNHlkRSF2V7uuBLLVHZ2eClYIQEkRt5OVk0TJa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="349850219"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="349850219"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 20:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="1030495286"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="1030495286"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 May 2023 20:44:20 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1py2eh-0005o8-2Q;
	Sun, 14 May 2023 03:44:19 +0000
Date: Sun, 14 May 2023 11:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [avpatel:riscv_aia_v3 10/11]
 drivers/irqchip/irq-riscv-aplic.c:331:47: warning: right shift count >=
 width of type
Message-ID: <202305141107.sy78Helj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/irqchip/irq-riscv-aplic.c:331:47: warning: right shift count >= width of type [-Wshift-count-overflow]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anup Patel <apatel@ventanamicro.com>

Hi Anup,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/avpatel/linux.git riscv_aia_v3
head:   0ee3245397a8c6ebaa36179fabea9d64b69c1ea5
commit: a81f5ab22e765fe40a903c46531ada8da1eb0b8c [10/11] RISC-V: Select APLIC and IMSIC drivers
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: riscv-randconfig-s033-20230509 (https://download.01.org/0day-ci/archive/20230514/202305141107.sy78Helj-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/avpatel/linux/commit/a81f5ab22e765fe40a903c46531ada8da1eb0b8c
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_aia_v3
        git checkout a81f5ab22e765fe40a903c46531ada8da1eb0b8c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305141107.sy78Helj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-riscv-aplic.c: In function 'aplic_init_hw_global':
>> drivers/irqchip/irq-riscv-aplic.c:331:47: warning: right shift count >= width of type [-Wshift-count-overflow]
     331 |                 valH = (priv->msicfg.base_ppn >> 32) &
         |                                               ^~

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> drivers/irqchip/irq-riscv-aplic.c:331:50: sparse: sparse: shift too big (32) for type unsigned int

vim +331 drivers/irqchip/irq-riscv-aplic.c

f5e62553412fff Anup Patel 2022-01-18  322  
f5e62553412fff Anup Patel 2022-01-18  323  static void aplic_init_hw_global(struct aplic_priv *priv)
f5e62553412fff Anup Patel 2022-01-18  324  {
f5e62553412fff Anup Patel 2022-01-18  325  	u32 val;
f5e62553412fff Anup Patel 2022-01-18  326  #ifdef CONFIG_RISCV_M_MODE
f5e62553412fff Anup Patel 2022-01-18  327  	u32 valH;
f5e62553412fff Anup Patel 2022-01-18  328  
f5e62553412fff Anup Patel 2022-01-18  329  	if (!priv->nr_idcs) {
f5e62553412fff Anup Patel 2022-01-18  330  		val = priv->msicfg.base_ppn;
f5e62553412fff Anup Patel 2022-01-18 @331  		valH = (priv->msicfg.base_ppn >> 32) &
f5e62553412fff Anup Patel 2022-01-18  332  			APLIC_xMSICFGADDRH_BAPPN_MASK;
f5e62553412fff Anup Patel 2022-01-18  333  		valH |= (priv->msicfg.lhxw & APLIC_xMSICFGADDRH_LHXW_MASK)
f5e62553412fff Anup Patel 2022-01-18  334  			<< APLIC_xMSICFGADDRH_LHXW_SHIFT;
f5e62553412fff Anup Patel 2022-01-18  335  		valH |= (priv->msicfg.hhxw & APLIC_xMSICFGADDRH_HHXW_MASK)
f5e62553412fff Anup Patel 2022-01-18  336  			<< APLIC_xMSICFGADDRH_HHXW_SHIFT;
f5e62553412fff Anup Patel 2022-01-18  337  		valH |= (priv->msicfg.lhxs & APLIC_xMSICFGADDRH_LHXS_MASK)
f5e62553412fff Anup Patel 2022-01-18  338  			<< APLIC_xMSICFGADDRH_LHXS_SHIFT;
f5e62553412fff Anup Patel 2022-01-18  339  		valH |= (priv->msicfg.hhxs & APLIC_xMSICFGADDRH_HHXS_MASK)
f5e62553412fff Anup Patel 2022-01-18  340  			<< APLIC_xMSICFGADDRH_HHXS_SHIFT;
f5e62553412fff Anup Patel 2022-01-18  341  		writel(val, priv->regs + APLIC_xMSICFGADDR);
f5e62553412fff Anup Patel 2022-01-18  342  		writel(valH, priv->regs + APLIC_xMSICFGADDRH);
f5e62553412fff Anup Patel 2022-01-18  343  	}
f5e62553412fff Anup Patel 2022-01-18  344  #endif
f5e62553412fff Anup Patel 2022-01-18  345  
f5e62553412fff Anup Patel 2022-01-18  346  	/* Setup APLIC domaincfg register */
f5e62553412fff Anup Patel 2022-01-18  347  	val = readl(priv->regs + APLIC_DOMAINCFG);
f5e62553412fff Anup Patel 2022-01-18  348  	val |= APLIC_DOMAINCFG_IE;
f5e62553412fff Anup Patel 2022-01-18  349  	if (!priv->nr_idcs)
f5e62553412fff Anup Patel 2022-01-18  350  		val |= APLIC_DOMAINCFG_DM;
f5e62553412fff Anup Patel 2022-01-18  351  	writel(val, priv->regs + APLIC_DOMAINCFG);
f5e62553412fff Anup Patel 2022-01-18  352  	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
f5e62553412fff Anup Patel 2022-01-18  353  		pr_warn("%pfwP: unable to write 0x%x in domaincfg\n",
f5e62553412fff Anup Patel 2022-01-18  354  			priv->fwnode, val);
f5e62553412fff Anup Patel 2022-01-18  355  }
f5e62553412fff Anup Patel 2022-01-18  356  

:::::: The code at line 331 was first introduced by commit
:::::: f5e62553412fff47a0babd7b77b4a4285ac3fa5c irqchip: Add RISC-V advanced PLIC driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
