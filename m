Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CEC35973
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753561; cv=none; b=PYP6hCp7/z+PQN35hsD8hWWxk9mFkpo3vCUrIbKBbcUZXW9BTh+bLC6S6I+nWNi6DEhQw+ZLY3KrNwSo7k00iBu6zMXfftn9jcGQgsWqCtNNRiiCwFXM9yHP1h4SI8ljP0hy1MUwM6BU72/rk6p67h5oacCc4ygG4JizavZKwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753561; c=relaxed/simple;
	bh=mgrmXZ9sTGQfgQNR3vxX1ig3Jq/5RWvSSLf8brOylbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cvkV6PEZ55EVM+6M3KAqmjvbhE1S54z18MsTuVR5PG5hkwmHrrOnGxWhSu3SnHyLizMoGe0HSKwWp9SVewgYxH967sc3rxWsGnn9Nl4mIXIGUVWMjqDNfh9Cfh7GgCkJRlCcm5aGtvkb7xZOQi5hHebo+DMFgV7nETy0oMzVtDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRr0quM5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRr0quM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733753560; x=1765289560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mgrmXZ9sTGQfgQNR3vxX1ig3Jq/5RWvSSLf8brOylbY=;
  b=KRr0quM5dn9duV9PlBdTAie8rdChLc6t71hnQEnt085gM5ah6T0F+DFP
   /WuIakH2DoGms7zVWJMT7Wlqle+nIq3Bglz0CnBtuUiUkwlzfEwLZTg6D
   jTqpPVmnsVUNLUWu67KD2wPfWps63TIk1Y3p36tDLOKi54nv/e/eG+MYu
   EOJ31WTo78qGkWxt0S/MoluECfOKlIWUSQCEH4noo4w7fDVffiuzP1Ch6
   LozIdNdBmXeJLqFIv1kW8qe4G+YNFdkBFNDRC0moQgT7w5zV5fA8Ql5W1
   nRHiMohodtQAWa7ZKmdgvDj+BMLCDNI2FIeYeKozV74XK0CK0lvbDZ3rd
   Q==;
X-CSE-ConnectionGUID: U5RlY4+uS9aZ6/+IELyGsA==
X-CSE-MsgGUID: O7HyHL+mS3+6W5cIOhw9eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34187020"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="34187020"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 06:12:39 -0800
X-CSE-ConnectionGUID: OfcqrqsUSnm72O0Pi4yjgw==
X-CSE-MsgGUID: SrxQ9EAQT32h2gVOjnoUcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="95543588"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Dec 2024 06:12:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKeV1-0004Qt-0F;
	Mon, 09 Dec 2024 14:12:35 +0000
Date: Mon, 9 Dec 2024 22:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/idxd/device.c:370 idxd_cmd_exec() warn: mixing irqsave
 and irq
Message-ID: <202412092216.beBsxXQC-lkp@intel.com>
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
head:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
commit: 0d5c10b4c84d6ae6255129e5f16a0d2119c74334 dmaengine: idxd: add work queue drain support
date:   4 years, 5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 years, 5 months ago
config: x86_64-randconfig-161-20241112 (https://download.01.org/0day-ci/archive/20241209/202412092216.beBsxXQC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412092216.beBsxXQC-lkp@intel.com/

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
