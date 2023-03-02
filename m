Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E1A4C
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Mar 2023 02:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677724378; x=1709260378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZzOIGmKa6xyhiinEeOiCjrmSZYxntsRKScwMLumxXXE=;
  b=KRR+/6HzyGzBcV93mK5dQRraIL4jIZCV8JbfFTHqjALC6Em6tM/J7mMk
   uLsMc8ZyzMr5Fd58S2qzwbQOqtRfj66tl+WPRsC8GxV11pgR4OcNiUSMM
   anZsDS5FkOdNp98uC3cfiaR+085cBuwcu+z0wATHMLO0MsBLmFXJudU4O
   HUAmBqhhshhJ5SOxsiq0ZhEWM27xHgd+LNUNAkgsj2lvbI8hw+GYtt4cV
   AiXKyD2AeCTeMvEojUqjsvKQ1ZIJ3fSZKnn9wkXcxU9X6d+Wl1rTJovji
   8I+ejBnz0sNFU/i26Hl0Dia5OPMl66rGzVya3RcH4B5a6YmXDqVMC7w0p
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397160080"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="397160080"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 18:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="652241337"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="652241337"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Mar 2023 18:32:56 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXYkZ-00005d-2F;
	Thu, 02 Mar 2023 02:32:55 +0000
Date: Thu, 2 Mar 2023 10:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mediatek/mtk_wed_debugfs.c:73 dump_wed_regs()
 error: uninitialized symbol 'val'.
Message-ID: <202303021039.3mOkuyAl-lkp@intel.com>
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
TO: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ee3f96b164688dae21e2466a57f2e806b64e8a37
commit: 804775dfc2885e93a0a4b35db1914c2cc25172b5 net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-m031-20230228 (https://download.01.org/0day-ci/archive/20230302/202303021039.3mOkuyAl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303021039.3mOkuyAl-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mediatek/mtk_wed_debugfs.c:73 dump_wed_regs() error: uninitialized symbol 'val'.

vim +/val +73 drivers/net/ethernet/mediatek/mtk_wed_debugfs.c

804775dfc2885e Felix Fietkau 2022-04-05  45  
804775dfc2885e Felix Fietkau 2022-04-05  46  static void
804775dfc2885e Felix Fietkau 2022-04-05  47  dump_wed_regs(struct seq_file *s, struct mtk_wed_device *dev,
804775dfc2885e Felix Fietkau 2022-04-05  48  	      const struct reg_dump *regs, int n_regs)
804775dfc2885e Felix Fietkau 2022-04-05  49  {
804775dfc2885e Felix Fietkau 2022-04-05  50  	const struct reg_dump *cur;
804775dfc2885e Felix Fietkau 2022-04-05  51  	u32 val;
804775dfc2885e Felix Fietkau 2022-04-05  52  
804775dfc2885e Felix Fietkau 2022-04-05  53  	for (cur = regs; cur < &regs[n_regs]; cur++) {
804775dfc2885e Felix Fietkau 2022-04-05  54  		switch (cur->type) {
804775dfc2885e Felix Fietkau 2022-04-05  55  		case DUMP_TYPE_STRING:
804775dfc2885e Felix Fietkau 2022-04-05  56  			seq_printf(s, "%s======== %s:\n",
804775dfc2885e Felix Fietkau 2022-04-05  57  				   cur > regs ? "\n" : "",
804775dfc2885e Felix Fietkau 2022-04-05  58  				   cur->name);
804775dfc2885e Felix Fietkau 2022-04-05  59  			continue;
804775dfc2885e Felix Fietkau 2022-04-05  60  		case DUMP_TYPE_WED:
804775dfc2885e Felix Fietkau 2022-04-05  61  			val = wed_r32(dev, cur->offset);
804775dfc2885e Felix Fietkau 2022-04-05  62  			break;
804775dfc2885e Felix Fietkau 2022-04-05  63  		case DUMP_TYPE_WDMA:
804775dfc2885e Felix Fietkau 2022-04-05  64  			val = wdma_r32(dev, cur->offset);
804775dfc2885e Felix Fietkau 2022-04-05  65  			break;
804775dfc2885e Felix Fietkau 2022-04-05  66  		case DUMP_TYPE_WPDMA_TX:
804775dfc2885e Felix Fietkau 2022-04-05  67  			val = wpdma_tx_r32(dev, cur->base, cur->offset);
804775dfc2885e Felix Fietkau 2022-04-05  68  			break;
804775dfc2885e Felix Fietkau 2022-04-05  69  		case DUMP_TYPE_WPDMA_TXFREE:
804775dfc2885e Felix Fietkau 2022-04-05  70  			val = wpdma_txfree_r32(dev, cur->offset);
804775dfc2885e Felix Fietkau 2022-04-05  71  			break;
804775dfc2885e Felix Fietkau 2022-04-05  72  		}
804775dfc2885e Felix Fietkau 2022-04-05 @73  		print_reg_val(s, cur->name, val);
804775dfc2885e Felix Fietkau 2022-04-05  74  	}
804775dfc2885e Felix Fietkau 2022-04-05  75  }
804775dfc2885e Felix Fietkau 2022-04-05  76  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
