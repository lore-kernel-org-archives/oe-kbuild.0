Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDBE37DAA9
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 03:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431898; cv=none; b=RN9ASq+X4QjNvwJ9loRj5OZ+EYc818kYDWPoTdYIUEOs+06rEe3iokwzSiL7NIQWIxCvzVDF5myJDCwd309s6Y4MKi7xkeErtcLWx6PvgCnysF31sjWJZ/crSjQlKR4acbnwYowOynClqZGkXm0lKPRN+kuMRXvb8qGrk4DITjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431898; c=relaxed/simple;
	bh=UOYwHIwTyutQk4dM2RYehycTzape2EvWKhe7VZBnvcg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ju3Yi2l/rhZVNd9bFNLUCwE6vjk7txbRaKEdQXcYpnq1u3846VgEiuoGKYnFDvRuA9W0Y+rHn/+n0JsFzFo4MmR/KHUvKjJdEZzV7prHlPe1VcOOI6U4sQBMUIrLHUL+LTABHL9SXSBcyVRHwdFurYNScldmmrV3aLjVXjQD3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZChISIPn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZChISIPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791431897; x=1822967897;
  h=date:from:to:cc:subject:message-id;
  bh=UOYwHIwTyutQk4dM2RYehycTzape2EvWKhe7VZBnvcg=;
  b=ZChISIPnTR5QZLAWMbzmeTPZr8brSP87BWgg2kGmJUqAhzUJnHFEuXBK
   e1Kqv6QZG1Pt05lpk0hkIF08mFcMooX/1v2zag2ypjgaAf0+2g36S+GRY
   bamLRHBKwHapFNDBuuGs9wbunQMsIuBlGqfii9dkp5SWGfFMn0KcuO4W/
   mJEhmvpPDn7gA5dj8t8oIL0UCdgS395Ob1KZ/wp4HhyX+KqXIYrv/TdOo
   vUZokdhamU3X4/gY2+OuTXYmc2/0Oy+9XndNeKFFEX10ue8SSOpVrJ40C
   JKN2LwEmsg+CR20zjpOeXv32An0g2cI7nPhqd/pn8DCFbE5NN8JSZAGAk
   Q==;
X-CSE-ConnectionGUID: 9kda2UTaR1eT/N6A9lL7wg==
X-CSE-MsgGUID: 3DX8LJFcTKG2Dg+rOy/p9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="202031"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="202031"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 20:58:16 -0700
X-CSE-ConnectionGUID: 7gU9kWMrTX6KwMU8HN6ICg==
X-CSE-MsgGUID: 37LV2hXFQKCODPJ+d/DQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="281384152"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 07 Oct 2026 20:58:14 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEfGm-000000004jD-0Aor;
	Thu, 08 Oct 2026 03:58:12 +0000
Date: Thu, 08 Oct 2026 05:57:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 13327/15025]
 drivers/dma/dw-edma/dw-edma-core.c:1086:4-31: opportunity for
 str_write_read(chan -> dir == EDMA_DIR_WRITE)
Message-ID: <202610080554.KfhFfNqT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Koichiro Den <den@valinux.co.jp>
CC: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b018686719706a781c45a874ed51374a2dc4b767
commit: 9d31ad3b331d5d78bd6a247a9d35f35a6a9bbd59 [13327/15025] dmaengine: dw-edma: Configure remote interrupt routing
:::::: branch date: 14 hours ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r2105-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080554.KfhFfNqT-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610080554.KfhFfNqT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/dw-edma/dw-edma-core.c:1086:4-31: opportunity for str_write_read(chan -> dir == EDMA_DIR_WRITE)

vim +1086 drivers/dma/dw-edma/dw-edma-core.c

9d31ad3b331d5d Koichiro Den      2026-09-13  1066  
99109a51efd28c Koichiro Den      2026-07-18  1067  static void dw_edma_device_synchronize(struct dma_chan *dchan)
99109a51efd28c Koichiro Den      2026-07-18  1068  {
99109a51efd28c Koichiro Den      2026-07-18  1069  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
9d31ad3b331d5d Koichiro Den      2026-09-13  1070  	bool remote;
9d31ad3b331d5d Koichiro Den      2026-09-13  1071  
9d31ad3b331d5d Koichiro Den      2026-09-13  1072  	/*
9d31ad3b331d5d Koichiro Den      2026-09-13  1073  	 * irq_mode is fixed after initial configuration. The free path
9d31ad3b331d5d Koichiro Den      2026-09-13  1074  	 * restores it only after synchronization.
9d31ad3b331d5d Koichiro Den      2026-09-13  1075  	 */
9d31ad3b331d5d Koichiro Den      2026-09-13  1076  	remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
9d31ad3b331d5d Koichiro Den      2026-09-13  1077  		 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
9d31ad3b331d5d Koichiro Den      2026-09-13  1078  
9d31ad3b331d5d Koichiro Den      2026-09-13  1079  	/*
9d31ad3b331d5d Koichiro Den      2026-09-13  1080  	 * Peer-driven transfers bypass local descriptor tracking, so quiesce
9d31ad3b331d5d Koichiro Den      2026-09-13  1081  	 * the hardware explicitly.
9d31ad3b331d5d Koichiro Den      2026-09-13  1082  	 */
9d31ad3b331d5d Koichiro Den      2026-09-13  1083  	if (remote && dw_edma_core_ch_quiesce(chan))
9d31ad3b331d5d Koichiro Den      2026-09-13  1084  		dev_warn(chan->dw->chip->dev,
9d31ad3b331d5d Koichiro Den      2026-09-13  1085  			 "failed to quiesce remote-routed %s channel %u\n",
9d31ad3b331d5d Koichiro Den      2026-09-13 @1086  			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
9d31ad3b331d5d Koichiro Den      2026-09-13  1087  			 chan->id);
99109a51efd28c Koichiro Den      2026-07-18  1088  
99109a51efd28c Koichiro Den      2026-07-18  1089  	dw_edma_wait_termination(dchan);
9d31ad3b331d5d Koichiro Den      2026-09-13  1090  	if (remote)
9d31ad3b331d5d Koichiro Den      2026-09-13  1091  		dw_edma_synchronize_chan_irq(chan);
35de39e4511f00 Koichiro Den      2026-07-18  1092  	cancel_work_sync(&chan->irq_work);
35de39e4511f00 Koichiro Den      2026-07-18  1093  	atomic_set(&chan->irq_pending, 0);
99109a51efd28c Koichiro Den      2026-07-18  1094  	vchan_synchronize(&chan->vc);
2b651ecfc39fb6 kbuild test robot 2019-06-16  1095  }
99109a51efd28c Koichiro Den      2026-07-18  1096  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
