Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84203C26
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674121366; x=1705657366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DOqn5Vjp6shFjM9P2OMQQExdBUf+oAZBRcSbGfkFSlA=;
  b=d+w16jUd7ocipjj+XM2faKrZHxStEIod0z4OO4lt1BKZHyv9SlsrLDeq
   TArpeMQQ7EiwDfslQqT0eneb29Yj5czaFU5gRCxXFzOIcytunAYGq67B9
   1wDyPiuNdu7MqnNJavNxRcoCjI6bjT500OYkb0uaghdcqZ+/kEt81aj/g
   sc4b+Tbjn0fGlaZFdtmsnvifSzD+P+G/PNPXmXL8Z5Nn4quauIn6Q6HhR
   9WXCFekj5oWWwPL+mHDnndRnGg9bpnApLNYRTIzkbWrRu2I3hm/qZvGPZ
   B4fM4OyosLGdTQQsCxTZh6L0nAc7S+sSw9hFKtdFpJyx40ljgKH/bvzbn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323928483"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="323928483"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 01:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="768150843"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="768150843"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2023 01:42:45 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIRRU-0001M0-1M;
	Thu, 19 Jan 2023 09:42:44 +0000
Date: Thu, 19 Jan 2023 17:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stable:linux-5.15.y 2330/9999]
 drivers/dma/dw-edma/dw-edma-v0-core.c:169:20: warning: unused function
 'writeq_ch'
Message-ID: <202301191743.1zXVRuMW-lkp@intel.com>
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
TO: Herve Codina <herve.codina@bootlin.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   3bcc86eb3ed952c22ceecce8932dde72ea01f8cc
commit: 84e77e72367f6f2d293b80b18da84d587e86382f [2330/9999] dmaengine: dw-edma: Fix unaligned 64bit access
:::::: branch date: 23 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-a002-20230116 (https://download.01.org/0day-ci/archive/20230119/202301191743.1zXVRuMW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=84e77e72367f6f2d293b80b18da84d587e86382f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 84e77e72367f6f2d293b80b18da84d587e86382f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dma/dw-edma/ drivers/hid/intel-ish-hid/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/dw-edma/dw-edma-v0-core.c:169:20: warning: unused function 'writeq_ch' [-Wunused-function]
   static inline void writeq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
                      ^
   drivers/dma/dw-edma/dw-edma-v0-core.c:192:19: warning: unused function 'readq_ch' [-Wunused-function]
   static inline u64 readq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
                     ^
   2 warnings generated.


vim +/writeq_ch +169 drivers/dma/dw-edma/dw-edma-v0-core.c

04e0a39fc10f82 Gustavo Pimentel 2021-02-18  168  
04e0a39fc10f82 Gustavo Pimentel 2021-02-18 @169  static inline void writeq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  170  			     u64 value, void __iomem *addr)
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  171  {
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  172  	if (dw->mf == EDMA_MF_EDMA_LEGACY) {
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  173  		u32 viewport_sel;
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  174  		unsigned long flags;
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  175  
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  176  		raw_spin_lock_irqsave(&dw->lock, flags);
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  177  
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  178  		viewport_sel = FIELD_PREP(EDMA_V0_VIEWPORT_MASK, ch);
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  179  		if (dir == EDMA_DIR_READ)
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  180  			viewport_sel |= BIT(31);
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  181  
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  182  		writel(viewport_sel,
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  183  		       &(__dw_regs(dw)->type.legacy.viewport_sel));
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  184  		writeq(value, addr);
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  185  
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  186  		raw_spin_unlock_irqrestore(&dw->lock, flags);
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  187  	} else {
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  188  		writeq(value, addr);
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  189  	}
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  190  }
04e0a39fc10f82 Gustavo Pimentel 2021-02-18  191  

:::::: The code at line 169 was first introduced by commit
:::::: 04e0a39fc10f82a71b84af73351333b184cee578 dmaengine: dw-edma: Add writeq() and readq() for 64 bits architectures

:::::: TO: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
