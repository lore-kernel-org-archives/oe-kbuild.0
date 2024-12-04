Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D741A8F9A
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 18:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733338057; cv=none; b=CjZ4WElJJ63byVg13NySVSMmBkJvPB4YRkUF5MCh+PvjONt8EXM+lAY0ZBVgp7uL2QDD/2p04cQXUvigv6Xbx65duHpwdCMksU1nOac+f0BvkvFiCcUGkF6xS0lFJLQIpGuyqKVPIj6FCIqBoS037zxdLk47PoXV5LMEH6TTOLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733338057; c=relaxed/simple;
	bh=jCubvNdvoNYBm0f21Ep9G7O0CVR3TKdfL+XazgcpaWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L85tv4epyIlERiD3BJYqpcbAzYQt9sTuH20fvLgtVAPqqRWd8nVekHvPUHnN2q8Wo6rl06ituo5oqgQWwOoUyb0OYKMhIOJz7Ca23r4z42xGjfOtmrgJTh1MDBoiYpTiHw8PBJqN/MrTKnlQ/p+PbNnbVYFYf7ccklw5elOod7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yv+AX5Bg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yv+AX5Bg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733338056; x=1764874056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jCubvNdvoNYBm0f21Ep9G7O0CVR3TKdfL+XazgcpaWM=;
  b=Yv+AX5BgtIi5HkkOdVS6eOf2FH9Ns7AirZ5s/JS59zkb6wLW8PhxfyHn
   Bggd8tuVO59ZI3a6Ri7GpDOJAgYoWME91qC3cf89FaxuV86SBAdhbIJx1
   jj96DSZxSIsAmcRsHnOqqy2QLKZBdL48p6pXRQzGrE9SSn2c5y3tSIxv6
   mybJoHs4fp0vFwfOt/s+lFkm5pga8/IpYU6cdmkPUmd7kZ/UsnGa+WRey
   y0HsmrfsxlNFwOCUqCXX23LAKCkgK5qQW3hLoFD6d7UZLnu1qXlpqvl5U
   3yVMXb2iZsJXP+mnSGL/Jv2tzHsAPr5e63c8WzYNqcbOE3UTtK+j6ADHR
   A==;
X-CSE-ConnectionGUID: LJ/LPv2xQU2i1gXpmOPjtA==
X-CSE-MsgGUID: Pl9aAg/YRsCBfRVFORIWqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45000521"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="45000521"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 10:47:35 -0800
X-CSE-ConnectionGUID: dY8TnV/EQ16MEShPRvj+qA==
X-CSE-MsgGUID: CImrpdW7SNebfX3C4wUJ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93730282"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Dec 2024 10:47:33 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIuPK-0003OZ-2h;
	Wed, 04 Dec 2024 18:47:30 +0000
Date: Thu, 5 Dec 2024 02:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/idxd/device.c:370 idxd_cmd_exec() warn: mixing irqsave
 and irq
Message-ID: <202412050237.MXIHJMPC-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Tony Luck <tony.luck@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: 0d5c10b4c84d6ae6255129e5f16a0d2119c74334 dmaengine: idxd: add work queue drain support
date:   4 years, 5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 4 years, 5 months ago
config: x86_64-randconfig-161-20241112 (https://download.01.org/0day-ci/archive/20241205/202412050237.MXIHJMPC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412050237.MXIHJMPC-lkp@intel.com/

smatch warnings:
drivers/dma/idxd/device.c:370 idxd_cmd_exec() warn: mixing irqsave and irq

vim +370 drivers/dma/idxd/device.c

bfe1d56091c1a4 Dave Jiang 2020-01-21  356  
0d5c10b4c84d6a Dave Jiang 2020-06-26  357  static void idxd_cmd_exec(struct idxd_device *idxd, int cmd_code, u32 operand,
0d5c10b4c84d6a Dave Jiang 2020-06-26  358  			  u32 *status)
bfe1d56091c1a4 Dave Jiang 2020-01-21  359  {
bfe1d56091c1a4 Dave Jiang 2020-01-21  360  	union idxd_command_reg cmd;
0d5c10b4c84d6a Dave Jiang 2020-06-26  361  	DECLARE_COMPLETION_ONSTACK(done);
0d5c10b4c84d6a Dave Jiang 2020-06-26  362  	unsigned long flags;
bfe1d56091c1a4 Dave Jiang 2020-01-21  363  
bfe1d56091c1a4 Dave Jiang 2020-01-21  364  	memset(&cmd, 0, sizeof(cmd));
bfe1d56091c1a4 Dave Jiang 2020-01-21  365  	cmd.cmd = cmd_code;
bfe1d56091c1a4 Dave Jiang 2020-01-21  366  	cmd.operand = operand;
0d5c10b4c84d6a Dave Jiang 2020-06-26  367  	cmd.int_req = 1;
0d5c10b4c84d6a Dave Jiang 2020-06-26  368  
0d5c10b4c84d6a Dave Jiang 2020-06-26  369  	spin_lock_irqsave(&idxd->dev_lock, flags);
0d5c10b4c84d6a Dave Jiang 2020-06-26 @370  	wait_event_lock_irq(idxd->cmd_waitq,
0d5c10b4c84d6a Dave Jiang 2020-06-26  371  			    !test_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags),
0d5c10b4c84d6a Dave Jiang 2020-06-26  372  			    idxd->dev_lock);
0d5c10b4c84d6a Dave Jiang 2020-06-26  373  
bfe1d56091c1a4 Dave Jiang 2020-01-21  374  	dev_dbg(&idxd->pdev->dev, "%s: sending cmd: %#x op: %#x\n",
bfe1d56091c1a4 Dave Jiang 2020-01-21  375  		__func__, cmd_code, operand);
0d5c10b4c84d6a Dave Jiang 2020-06-26  376  
0d5c10b4c84d6a Dave Jiang 2020-06-26  377  	__set_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
0d5c10b4c84d6a Dave Jiang 2020-06-26  378  	idxd->cmd_done = &done;
bfe1d56091c1a4 Dave Jiang 2020-01-21  379  	iowrite32(cmd.bits, idxd->reg_base + IDXD_CMD_OFFSET);
bfe1d56091c1a4 Dave Jiang 2020-01-21  380  
0d5c10b4c84d6a Dave Jiang 2020-06-26  381  	/*
0d5c10b4c84d6a Dave Jiang 2020-06-26  382  	 * After command submitted, release lock and go to sleep until
0d5c10b4c84d6a Dave Jiang 2020-06-26  383  	 * the command completes via interrupt.
0d5c10b4c84d6a Dave Jiang 2020-06-26  384  	 */
0d5c10b4c84d6a Dave Jiang 2020-06-26  385  	spin_unlock_irqrestore(&idxd->dev_lock, flags);
0d5c10b4c84d6a Dave Jiang 2020-06-26  386  	wait_for_completion(&done);
0d5c10b4c84d6a Dave Jiang 2020-06-26  387  	spin_lock_irqsave(&idxd->dev_lock, flags);
0d5c10b4c84d6a Dave Jiang 2020-06-26  388  	if (status)
0d5c10b4c84d6a Dave Jiang 2020-06-26  389  		*status = ioread32(idxd->reg_base + IDXD_CMDSTS_OFFSET);
0d5c10b4c84d6a Dave Jiang 2020-06-26  390  	__clear_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
0d5c10b4c84d6a Dave Jiang 2020-06-26  391  	/* Wake up other pending commands */
0d5c10b4c84d6a Dave Jiang 2020-06-26  392  	wake_up(&idxd->cmd_waitq);
0d5c10b4c84d6a Dave Jiang 2020-06-26  393  	spin_unlock_irqrestore(&idxd->dev_lock, flags);
bfe1d56091c1a4 Dave Jiang 2020-01-21  394  }
bfe1d56091c1a4 Dave Jiang 2020-01-21  395  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
