Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FED10EC
	for <oe-kbuild@lists.linux.dev>; Thu,  4 May 2023 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683193521; x=1714729521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ERiQ8+oZT9Kn23AGP6pa8TmyAzyl8mcIvyFjfHapJcI=;
  b=kTV9QmgYUOqw6tGCLQ4T8vYJ2BQj3Vu3pnLlqOYdpkrSRQFiOz0bp9jV
   9l7iIRUoK3RwMsi7/ECRnBS+LhyzgjTcHcO0x9g8yowyO14kwaiAMeoZi
   oTv3d11auT6/umI/rL+JfdGD3Afnm5tN4vpd2ci8oj5AzXlDaoUpMcPRd
   +M8RbJFNejoPFWbNdJ4lJJ1a3OSf8qC2x0pnj+K0Vg1M6IzfkTil5UQdI
   ONRNLQPTPnALCC3UZMHxe2Y5cS87vXYbnFtmHn0BbFvIZb8yOjixlzFdf
   /Z9taTu1cENf+KYSLf7tIakrK9lrG+PcyDifCKt10xaR7fJgowLqoH8v1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="350976153"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="350976153"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 02:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="943269731"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="943269731"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 May 2023 02:45:19 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puVWY-0002oW-2V;
	Thu, 04 May 2023 09:45:18 +0000
Date: Thu, 4 May 2023 17:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/bus/sunxi-rsb.c:286 _sunxi_rsb_run_xfer() warn: assigning
 (-110) to unsigned variable 'timeout'
Message-ID: <202305041714.yy6fC4eJ-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1a5304fecee523060f26e2778d9d8e33c0562df3
commit: 077686da0e2162c4ea5ae0df205849c2a7a84479 bus: sunxi-rsb: Support atomic transfers
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230504/202305041714.yy6fC4eJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305041714.yy6fC4eJ-lkp@intel.com/

smatch warnings:
drivers/bus/sunxi-rsb.c:286 _sunxi_rsb_run_xfer() warn: assigning (-110) to unsigned variable 'timeout'

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
