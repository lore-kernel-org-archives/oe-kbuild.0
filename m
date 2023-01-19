Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDB5179
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 00:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674087323; x=1705623323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPaMpUXZd0raldEWPXgsnSBxSc7D0cJ1zF4U9BAUncI=;
  b=bB228N4pSzH9gyh0+aRamhpkFkkhThKTUcjJ9SpzXOYS8aZpp5yz+mwf
   iea/Yp0TCDc2qyrHtMb47ouoG/OEIw6meeJXTQHCsTpOXE5NTbyQNRMiE
   Bfo6W/mQOHhEjvoWvmmMc7qKf4CUSxIFA85Id+Jr8bbiXAEfwUbJqZAfj
   DI3NMZntOH+QCG7utFAX3zMrsVeuyTbrkE7XTYBYVgLhVlej6jhnIkHW3
   OBXDHxgrZsvdSMe8tYycplH6ZWmndlEYrIX0pWM7bJ8qRsyvrQp4QIoii
   cCUv+NVXTN/bG2eW43RYrUMBrImItNtBXuVQEzY1VLVZJR8MH1Jd8a9yq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="325193285"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="325193285"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 16:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661932787"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661932787"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 16:15:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIIaO-0000rB-30;
	Thu, 19 Jan 2023 00:15:20 +0000
Date: Thu, 19 Jan 2023 08:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/dma/dw-edma/dw-edma-v0-core.c:192:19: warning: unused
 function 'readq_ch'
Message-ID: <202301190830.KA2m7fiH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
CC: Vinod Koul <vkoul@kernel.org>

Hi Gustavo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: e0c1d53891c43a70c9fa85ddb3174ab5afd7e2ec dmaengine: dw-edma: Add support for the HDMA feature
date:   1 year, 10 months ago
:::::: branch date: 84 minutes ago
:::::: commit date: 1 year, 10 months ago
config: x86_64-randconfig-a002-20230116 (https://download.01.org/0day-ci/archive/20230119/202301190830.KA2m7fiH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e0c1d53891c43a70c9fa85ddb3174ab5afd7e2ec
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e0c1d53891c43a70c9fa85ddb3174ab5afd7e2ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dma/dw-edma/ drivers/hid/intel-ish-hid/ drivers/scsi/ufs/ drivers/staging/ fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/dw-edma/dw-edma-v0-core.c:192:19: warning: unused function 'readq_ch' [-Wunused-function]
   static inline u64 readq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
                     ^
   1 warning generated.


vim +/readq_ch +192 drivers/dma/dw-edma/dw-edma-v0-core.c

04e0a39fc10f82a Gustavo Pimentel 2021-02-18  191  
04e0a39fc10f82a Gustavo Pimentel 2021-02-18 @192  static inline u64 readq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  193  			   const void __iomem *addr)
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  194  {
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  195  	u32 value;
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  196  
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  197  	if (dw->mf == EDMA_MF_EDMA_LEGACY) {
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  198  		u32 viewport_sel;
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  199  		unsigned long flags;
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  200  
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  201  		raw_spin_lock_irqsave(&dw->lock, flags);
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  202  
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  203  		viewport_sel = FIELD_PREP(EDMA_V0_VIEWPORT_MASK, ch);
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  204  		if (dir == EDMA_DIR_READ)
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  205  			viewport_sel |= BIT(31);
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  206  
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  207  		writel(viewport_sel,
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  208  		       &(__dw_regs(dw)->type.legacy.viewport_sel));
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  209  		value = readq(addr);
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  210  
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  211  		raw_spin_unlock_irqrestore(&dw->lock, flags);
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  212  	} else {
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  213  		value = readq(addr);
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  214  	}
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  215  
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  216  	return value;
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  217  }
04e0a39fc10f82a Gustavo Pimentel 2021-02-18  218  

:::::: The code at line 192 was first introduced by commit
:::::: 04e0a39fc10f82a71b84af73351333b184cee578 dmaengine: dw-edma: Add writeq() and readq() for 64 bits architectures

:::::: TO: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
