Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264223BB48
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffNp/Eb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700078301; x=1731614301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xOBySuH6p3idJdkIr3ckSkKgTi4aloDSjz2rkMoVkBo=;
  b=ffNp/Eb+IWBQeBvEvDIYpELyHHch4p/ObTc7KGdxB2atJQdlXlNoAtAn
   mgJ8Rf0hXRZudnOn9ZBT1Tyi2qMf5VwKLLrJIYwltmPhqTmV0McX4HDEN
   eOoSvZg4TJ9mcQi8tL+tNlG+Nw1pk1vo9Jb6ZpGMShi3Jp1LytZcTYcrL
   obvIZOWSxgCKcv4BOg8gYAAkoPq/bs3mwROR7oDwvFu723Uou200/JHua
   wLqgkZfvyI+bA7lgXt3I5EUwzAlsaiDM97u+RlqIvDdmcVsphiwohp+Qh
   uDf5bDjTQHn1OV7uLLAlIYL3/Uy63SfQsWkYWd+SQL5e01HNMqRxuyZ+H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370294320"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="370294320"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 11:58:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096542633"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="1096542633"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2023 11:58:18 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3M1g-0000m0-1u;
	Wed, 15 Nov 2023 19:58:16 +0000
Date: Thu, 16 Nov 2023 03:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/bus/sunxi-rsb.c:286 _sunxi_rsb_run_xfer() warn: assigning
 (-110) to unsigned variable 'timeout'
Message-ID: <202311160359.ESyP1zHj-lkp@intel.com>
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
TO: Samuel Holland <samuel@sholland.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Guo Ren <guoren@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 6f5178acf63614f2ee27450b2ab4d4980a698161 riscv: Add the Allwinner SoC family Kconfig option
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r071-20231112 (https://download.01.org/0day-ci/archive/20231116/202311160359.ESyP1zHj-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160359.ESyP1zHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311160359.ESyP1zHj-lkp@intel.com/

New smatch warnings:
drivers/bus/sunxi-rsb.c:286 _sunxi_rsb_run_xfer() warn: assigning (-110) to unsigned variable 'timeout'

Old smatch warnings:
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/timeout +286 drivers/bus/sunxi-rsb.c

d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  266  
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  267  /* common code that starts a transfer */
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  268  static int _sunxi_rsb_run_xfer(struct sunxi_rsb *rsb)
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  269  {
077686da0e2162 Samuel Holland 2022-11-13  270  	u32 int_mask, status;
077686da0e2162 Samuel Holland 2022-11-13  271  	bool timeout;
077686da0e2162 Samuel Holland 2022-11-13  272  
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  273  	if (readl(rsb->regs + RSB_CTRL) & RSB_CTRL_START_TRANS) {
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  274  		dev_dbg(rsb->dev, "RSB transfer still in progress\n");
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  275  		return -EBUSY;
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  276  	}
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  277  
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  278  	reinit_completion(&rsb->complete);
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  279  
077686da0e2162 Samuel Holland 2022-11-13  280  	int_mask = RSB_INTS_LOAD_BSY | RSB_INTS_TRANS_ERR | RSB_INTS_TRANS_OVER;
077686da0e2162 Samuel Holland 2022-11-13  281  	writel(int_mask, rsb->regs + RSB_INTE);
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  282  	writel(RSB_CTRL_START_TRANS | RSB_CTRL_GLOBAL_INT_ENB,
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  283  	       rsb->regs + RSB_CTRL);
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  284  
077686da0e2162 Samuel Holland 2022-11-13  285  	if (irqs_disabled()) {
077686da0e2162 Samuel Holland 2022-11-13 @286  		timeout = readl_poll_timeout_atomic(rsb->regs + RSB_INTS,
077686da0e2162 Samuel Holland 2022-11-13  287  						    status, (status & int_mask),
077686da0e2162 Samuel Holland 2022-11-13  288  						    10, 100000);
077686da0e2162 Samuel Holland 2022-11-13  289  		writel(status, rsb->regs + RSB_INTS);
077686da0e2162 Samuel Holland 2022-11-13  290  	} else {
077686da0e2162 Samuel Holland 2022-11-13  291  		timeout = !wait_for_completion_io_timeout(&rsb->complete,
077686da0e2162 Samuel Holland 2022-11-13  292  							  msecs_to_jiffies(100));
077686da0e2162 Samuel Holland 2022-11-13  293  		status = rsb->status;
077686da0e2162 Samuel Holland 2022-11-13  294  	}
077686da0e2162 Samuel Holland 2022-11-13  295  
077686da0e2162 Samuel Holland 2022-11-13  296  	if (timeout) {
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  297  		dev_dbg(rsb->dev, "RSB timeout\n");
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  298  
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  299  		/* abort the transfer */
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  300  		writel(RSB_CTRL_ABORT_TRANS, rsb->regs + RSB_CTRL);
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  301  
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  302  		/* clear any interrupt flags */
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  303  		writel(readl(rsb->regs + RSB_INTS), rsb->regs + RSB_INTS);
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  304  
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  305  		return -ETIMEDOUT;
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  306  	}
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  307  
077686da0e2162 Samuel Holland 2022-11-13  308  	if (status & RSB_INTS_LOAD_BSY) {
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  309  		dev_dbg(rsb->dev, "RSB busy\n");
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  310  		return -EBUSY;
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  311  	}
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  312  
077686da0e2162 Samuel Holland 2022-11-13  313  	if (status & RSB_INTS_TRANS_ERR) {
077686da0e2162 Samuel Holland 2022-11-13  314  		if (status & RSB_INTS_TRANS_ERR_ACK) {
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  315  			dev_dbg(rsb->dev, "RSB slave nack\n");
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  316  			return -EINVAL;
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  317  		}
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  318  
077686da0e2162 Samuel Holland 2022-11-13  319  		if (status & RSB_INTS_TRANS_ERR_DATA) {
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  320  			dev_dbg(rsb->dev, "RSB transfer data error\n");
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  321  			return -EIO;
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  322  		}
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  323  	}
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  324  
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  325  	return 0;
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  326  }
d787dcdb9c8f41 Chen-Yu Tsai   2015-10-23  327  

:::::: The code at line 286 was first introduced by commit
:::::: 077686da0e2162c4ea5ae0df205849c2a7a84479 bus: sunxi-rsb: Support atomic transfers

:::::: TO: Samuel Holland <samuel@sholland.org>
:::::: CC: Jernej Skrabec <jernej.skrabec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
