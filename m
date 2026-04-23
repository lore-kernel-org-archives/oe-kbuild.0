Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5CA28DC4
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Apr 2026 04:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776917848; cv=none; b=Q4FTf0fmXpYTwxEqNo2etuKJ8VnxTROuIqO+W1rm4y6r2so4L3+p3UL9JISmxrDBwB0FyCZj9NqSC/Xo47dLLwkMT9ZAxQtB4Bjw5sQFNaBkwh6MTQjQXV8/iUpOhHGpdt8P/0thl5QJw4BTrqYL+MKaVwnczFD1zb/BPItHqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776917848; c=relaxed/simple;
	bh=p07b9ckQFISv0estsrA18eXs2vGcnw7ghAJf8q3qSLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V+HQGYnTQQzrslkd6MWeCNSz6DyohDQliYMplz7o1guA9iDYSOhWVJ4NlKzgFGqPjFaoSfArhw0vkZ2a5wCCL/tbAhKRUfHK3TzOx2wgSnH71F/3U2t2lDiUgb2HnAFhU6bL3JjARz7mWPm6xOcHI3yM+g4YWE+ezRtsWvHul3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bONiXmI8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bONiXmI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776917845; x=1808453845;
  h=date:from:to:cc:subject:message-id;
  bh=p07b9ckQFISv0estsrA18eXs2vGcnw7ghAJf8q3qSLM=;
  b=bONiXmI84ntUCuhMWwvp51BOCfhmGXdvC1u9nOfOb73ZCZFW5SbaXDzz
   gO7+4QLwR7HENy0DqZbrcy2oseZbJ8ygcrKU5aEXcr/HPrOWk+cvOfoOY
   EpW2GuKTrNRAMV1Wv7XAl7eCGcanKwpBQtqR4r0OZOTSCYbuh9IDpR2+K
   bVgoijiltDAIZcNBV5LE83DKnM60QKcqMPO3UEiLUwxdCpPRNMUGuI5uR
   MN1hpRAzH/UzVm+FeOmxte1lH5AdJ7M/zEZmkPB6BDySNbHZ82yltcMHY
   RbrrHkEystfxQ4XMAFo1HGEnvfd3sSy6IkXB6Dxq7/G09xtxvBBatM15Z
   A==;
X-CSE-ConnectionGUID: SCj0Eaf6TAu8EOhFJDuYSA==
X-CSE-MsgGUID: YY0iizPpTsuCfcXe5WMmag==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88960193"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="88960193"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 21:17:24 -0700
X-CSE-ConnectionGUID: iG24dfDERoq3jFskP/Ke3A==
X-CSE-MsgGUID: wMd/PAnSQEqtOGb54zuAQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="228201720"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Apr 2026 21:17:23 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFlVA-000000001SH-1j12;
	Thu, 23 Apr 2026 04:17:20 +0000
Date: Thu, 23 Apr 2026 12:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6-2026-01 28/28]
 drivers/dma/idxd/device.c:495 idxd_cmd_exec() warn: mixing irqsave and irq
Message-ID: <202604231234.LuWmruJd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-01
head:   53e6e091166efc1ea0348a6aee2b12cc133ad102
commit: c0409dd3d151f661e7e57b901a81a02565df163c [28/28] dmaengine: idxd: use spin_lock_irqsave before wait_event_lock_irq
:::::: branch date: 3 hours ago
:::::: commit date: 2 years, 7 months ago
config: x86_64-randconfig-r071-20260421 (https://download.01.org/0day-ci/archive/20260423/202604231234.LuWmruJd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c0409dd3d151 ("dmaengine: idxd: use spin_lock_irqsave before wait_event_lock_irq")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604231234.LuWmruJd-lkp@intel.com/

smatch warnings:
drivers/dma/idxd/device.c:495 idxd_cmd_exec() warn: mixing irqsave and irq

vim +495 drivers/dma/idxd/device.c

bfe1d56091c1a40 Dave Jiang     2020-01-21  473  
0d5c10b4c84d6ae Dave Jiang     2020-06-26  474  static void idxd_cmd_exec(struct idxd_device *idxd, int cmd_code, u32 operand,
0d5c10b4c84d6ae Dave Jiang     2020-06-26  475  			  u32 *status)
bfe1d56091c1a40 Dave Jiang     2020-01-21  476  {
bfe1d56091c1a40 Dave Jiang     2020-01-21  477  	union idxd_command_reg cmd;
0d5c10b4c84d6ae Dave Jiang     2020-06-26  478  	DECLARE_COMPLETION_ONSTACK(done);
53499d1fc11267e Dave Jiang     2021-06-03  479  	u32 stat;
c0409dd3d151f66 Rex Zhang      2023-09-16  480  	unsigned long flags;
bfe1d56091c1a40 Dave Jiang     2020-01-21  481  
89e3becd8f821e5 Dave Jiang     2021-02-01  482  	if (idxd_device_is_halted(idxd)) {
89e3becd8f821e5 Dave Jiang     2021-02-01  483  		dev_warn(&idxd->pdev->dev, "Device is HALTED!\n");
28ac8e03c43dfc6 Colin Ian King 2021-04-15  484  		if (status)
89e3becd8f821e5 Dave Jiang     2021-02-01  485  			*status = IDXD_CMDSTS_HW_ERR;
89e3becd8f821e5 Dave Jiang     2021-02-01  486  		return;
89e3becd8f821e5 Dave Jiang     2021-02-01  487  	}
89e3becd8f821e5 Dave Jiang     2021-02-01  488  
bfe1d56091c1a40 Dave Jiang     2020-01-21  489  	memset(&cmd, 0, sizeof(cmd));
bfe1d56091c1a40 Dave Jiang     2020-01-21  490  	cmd.cmd = cmd_code;
bfe1d56091c1a40 Dave Jiang     2020-01-21  491  	cmd.operand = operand;
0d5c10b4c84d6ae Dave Jiang     2020-06-26  492  	cmd.int_req = 1;
0d5c10b4c84d6ae Dave Jiang     2020-06-26  493  
c0409dd3d151f66 Rex Zhang      2023-09-16  494  	spin_lock_irqsave(&idxd->cmd_lock, flags);
0d5c10b4c84d6ae Dave Jiang     2020-06-26 @495  	wait_event_lock_irq(idxd->cmd_waitq,
0d5c10b4c84d6ae Dave Jiang     2020-06-26  496  			    !test_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags),
53b2ee7f637c4f1 Dave Jiang     2021-04-20  497  			    idxd->cmd_lock);
0d5c10b4c84d6ae Dave Jiang     2020-06-26  498  
bfe1d56091c1a40 Dave Jiang     2020-01-21  499  	dev_dbg(&idxd->pdev->dev, "%s: sending cmd: %#x op: %#x\n",
bfe1d56091c1a40 Dave Jiang     2020-01-21  500  		__func__, cmd_code, operand);
0d5c10b4c84d6ae Dave Jiang     2020-06-26  501  
ff18de55a62f0e8 Dave Jiang     2020-08-28  502  	idxd->cmd_status = 0;
0d5c10b4c84d6ae Dave Jiang     2020-06-26  503  	__set_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
0d5c10b4c84d6ae Dave Jiang     2020-06-26  504  	idxd->cmd_done = &done;
bfe1d56091c1a40 Dave Jiang     2020-01-21  505  	iowrite32(cmd.bits, idxd->reg_base + IDXD_CMD_OFFSET);
bfe1d56091c1a40 Dave Jiang     2020-01-21  506  
0d5c10b4c84d6ae Dave Jiang     2020-06-26  507  	/*
0d5c10b4c84d6ae Dave Jiang     2020-06-26  508  	 * After command submitted, release lock and go to sleep until
0d5c10b4c84d6ae Dave Jiang     2020-06-26  509  	 * the command completes via interrupt.
0d5c10b4c84d6ae Dave Jiang     2020-06-26  510  	 */
c0409dd3d151f66 Rex Zhang      2023-09-16  511  	spin_unlock_irqrestore(&idxd->cmd_lock, flags);
0d5c10b4c84d6ae Dave Jiang     2020-06-26  512  	wait_for_completion(&done);
53499d1fc11267e Dave Jiang     2021-06-03  513  	stat = ioread32(idxd->reg_base + IDXD_CMDSTS_OFFSET);
f9f4082dbc56c40 Dave Jiang     2021-08-24  514  	spin_lock(&idxd->cmd_lock);
53499d1fc11267e Dave Jiang     2021-06-03  515  	if (status)
53499d1fc11267e Dave Jiang     2021-06-03  516  		*status = stat;
53499d1fc11267e Dave Jiang     2021-06-03  517  	idxd->cmd_status = stat & GENMASK(7, 0);
ff18de55a62f0e8 Dave Jiang     2020-08-28  518  
0d5c10b4c84d6ae Dave Jiang     2020-06-26  519  	__clear_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
0d5c10b4c84d6ae Dave Jiang     2020-06-26  520  	/* Wake up other pending commands */
0d5c10b4c84d6ae Dave Jiang     2020-06-26  521  	wake_up(&idxd->cmd_waitq);
f9f4082dbc56c40 Dave Jiang     2021-08-24  522  	spin_unlock(&idxd->cmd_lock);
bfe1d56091c1a40 Dave Jiang     2020-01-21  523  }
bfe1d56091c1a40 Dave Jiang     2020-01-21  524  

:::::: The code at line 495 was first introduced by commit
:::::: 0d5c10b4c84d6ae6255129e5f16a0d2119c74334 dmaengine: idxd: add work queue drain support

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
