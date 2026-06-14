Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56239347C7
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 20:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781467247; cv=none; b=crfBSSZlE7KtZS+2wKOMAdRtq1Nv2Mk2WCAd0DQDOJ4YcSgniMwXXY7fhYpN9FT1MODQFnIOBe3wDT9OdsakK+m80sR5yQ7LT8oLIse/C+VG4i/Pi1Zx7IHFUZNwz2W8WIoORKfLPXnelbeddSuOOKuv8wx1OGbo3Rn/X1hYmiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781467247; c=relaxed/simple;
	bh=AUvY7zLlaGHUonXuxU3v0faNYDdnmm0Nkth4RpwRUm0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mTZ1iC3B6rxJeav2Or3VrHRmdNQrEuMCqMDfHjF3kXmgn9vim7zkHyzofP2puekg31mEPpcBID3J1L4TU+pF4JG4c6R5D4WDpJzbm8PME4I62wOeLM6KzZw9nk9Rn2pxen9JDX330lrhaf20bW19IgKc9+GLiNvb8xBYPjjtgq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpQmGR0M; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpQmGR0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781467245; x=1813003245;
  h=date:from:to:cc:subject:message-id;
  bh=AUvY7zLlaGHUonXuxU3v0faNYDdnmm0Nkth4RpwRUm0=;
  b=lpQmGR0MEtrbnuyeuO5gE3SqsOgPK60NX1oXIadz7iE9l7odNcQoVRFF
   tCxX3mkfNVt2SVKkSZsato/Rte2s940OoKaxRyEQfbl1CpV+JyV6R5Jbe
   DHY+BB1AVQI65XG9IjvXB4z/t2fl9Gk9CL75nV/f7pQO/cKfq1xQe8RE2
   6xedwx5vbjKsNAsMJmO0Or4Gexe03qOOitowKyS50S0HVOxBYnNAKeqC7
   N/h+XuC4rX2DX6IwXJZ2zP8zzsyXazRUa4qMgtr1rem9aJLohb8IMaYSk
   t02VSUK3wyHqmJ3bcBM3tP3LE7QNjWR3gs1Dfco6kW0wv2E8mzCdpxIMg
   A==;
X-CSE-ConnectionGUID: kWK64+OPR12zrXGo44Cemw==
X-CSE-MsgGUID: 7+EJyfjmSm6oqrebO/V9lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="99791367"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="99791367"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 13:00:44 -0700
X-CSE-ConnectionGUID: gKUM5Z+dSxC96iTsiADfHw==
X-CSE-MsgGUID: DjaH4oJ6TgOaB5KSpc419g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="277492974"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2026 13:00:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYr0a-00000000RAg-390M;
	Sun, 14 Jun 2026 20:00:40 +0000
Date: Mon, 15 Jun 2026 04:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13262/13336]
 drivers/media/pci/hws/hws_irq.c:78 hws_arm_next() error: calling
 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202606150346.JxdvX32Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 9d5387a3edc1b1a8dedce953ea495a3c95f39081 [13262/13336] Merge branch 'master' of git://git.code.sf.net/p/tomoyo/tomoyo.git
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20260613 (https://download.01.org/0day-ci/archive/20260615/202606150346.JxdvX32Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606150346.JxdvX32Q-lkp@intel.com/

smatch warnings:
drivers/media/pci/hws/hws_irq.c:78 hws_arm_next() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/pci/hws/hws_video.c:224 hws_force_no_signal_frame() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +78 drivers/media/pci/hws/hws_irq.c

ba07fd2f5742e8 Ben Hoff 2026-05-10  18  
ba07fd2f5742e8 Ben Hoff 2026-05-10  19  static bool hws_toggle_debug;
ba07fd2f5742e8 Ben Hoff 2026-05-10  20  module_param_named(toggle_debug, hws_toggle_debug, bool, 0644);
ba07fd2f5742e8 Ben Hoff 2026-05-10  21  MODULE_PARM_DESC(toggle_debug,
ba07fd2f5742e8 Ben Hoff 2026-05-10  22  		 "Read toggle registers in IRQ handler for debug logging");
ba07fd2f5742e8 Ben Hoff 2026-05-10  23  
ba07fd2f5742e8 Ben Hoff 2026-05-10  24  static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
ba07fd2f5742e8 Ben Hoff 2026-05-10  25  {
ba07fd2f5742e8 Ben Hoff 2026-05-10  26  	struct hws_video *v = &hws->video[ch];
ba07fd2f5742e8 Ben Hoff 2026-05-10  27  	unsigned long flags;
ba07fd2f5742e8 Ben Hoff 2026-05-10  28  	struct hwsvideo_buffer *buf;
ba07fd2f5742e8 Ben Hoff 2026-05-10  29  
ba07fd2f5742e8 Ben Hoff 2026-05-10  30  	dev_dbg(&hws->pdev->dev,
ba07fd2f5742e8 Ben Hoff 2026-05-10  31  		"arm_next(ch=%u): stop=%d cap=%d queued=%d\n",
ba07fd2f5742e8 Ben Hoff 2026-05-10  32  		ch, READ_ONCE(v->stop_requested), READ_ONCE(v->cap_active),
ba07fd2f5742e8 Ben Hoff 2026-05-10  33  		!list_empty(&v->capture_queue));
ba07fd2f5742e8 Ben Hoff 2026-05-10  34  
ba07fd2f5742e8 Ben Hoff 2026-05-10  35  	if (READ_ONCE(hws->suspended)) {
ba07fd2f5742e8 Ben Hoff 2026-05-10  36  		dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): suspended\n", ch);
ba07fd2f5742e8 Ben Hoff 2026-05-10  37  		return -EBUSY;
ba07fd2f5742e8 Ben Hoff 2026-05-10  38  	}
ba07fd2f5742e8 Ben Hoff 2026-05-10  39  
ba07fd2f5742e8 Ben Hoff 2026-05-10  40  	if (READ_ONCE(v->stop_requested) || !READ_ONCE(v->cap_active)) {
ba07fd2f5742e8 Ben Hoff 2026-05-10  41  		dev_dbg(&hws->pdev->dev,
ba07fd2f5742e8 Ben Hoff 2026-05-10  42  			"arm_next(ch=%u): stop=%d cap=%d -> cancel\n", ch,
ba07fd2f5742e8 Ben Hoff 2026-05-10  43  			v->stop_requested, v->cap_active);
ba07fd2f5742e8 Ben Hoff 2026-05-10  44  		return -ECANCELED;
ba07fd2f5742e8 Ben Hoff 2026-05-10  45  	}
ba07fd2f5742e8 Ben Hoff 2026-05-10  46  
ba07fd2f5742e8 Ben Hoff 2026-05-10  47  	spin_lock_irqsave(&v->irq_lock, flags);
ba07fd2f5742e8 Ben Hoff 2026-05-10  48  	if (list_empty(&v->capture_queue)) {
ba07fd2f5742e8 Ben Hoff 2026-05-10  49  		spin_unlock_irqrestore(&v->irq_lock, flags);
ba07fd2f5742e8 Ben Hoff 2026-05-10  50  		dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): queue empty\n", ch);
ba07fd2f5742e8 Ben Hoff 2026-05-10  51  		return -EAGAIN;
ba07fd2f5742e8 Ben Hoff 2026-05-10  52  	}
ba07fd2f5742e8 Ben Hoff 2026-05-10  53  
ba07fd2f5742e8 Ben Hoff 2026-05-10  54  	buf = list_first_entry(&v->capture_queue, struct hwsvideo_buffer, list);
ba07fd2f5742e8 Ben Hoff 2026-05-10  55  	list_del_init(&buf->list);	/* keep buffer safe for later cleanup */
ba07fd2f5742e8 Ben Hoff 2026-05-10  56  	if (v->queued_count)
ba07fd2f5742e8 Ben Hoff 2026-05-10  57  		v->queued_count--;
ba07fd2f5742e8 Ben Hoff 2026-05-10  58  	v->active = buf;
ba07fd2f5742e8 Ben Hoff 2026-05-10  59  	spin_unlock_irqrestore(&v->irq_lock, flags);
ba07fd2f5742e8 Ben Hoff 2026-05-10  60  	dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): picked buffer %p\n", ch,
ba07fd2f5742e8 Ben Hoff 2026-05-10  61  		buf);
ba07fd2f5742e8 Ben Hoff 2026-05-10  62  
ba07fd2f5742e8 Ben Hoff 2026-05-10  63  	/* Publish descriptor(s) before doorbell/MMIO kicks. */
ba07fd2f5742e8 Ben Hoff 2026-05-10  64  	wmb();
ba07fd2f5742e8 Ben Hoff 2026-05-10  65  
ba07fd2f5742e8 Ben Hoff 2026-05-10  66  	/* Avoid MMIO during suspend */
ba07fd2f5742e8 Ben Hoff 2026-05-10  67  	if (READ_ONCE(hws->suspended)) {
ba07fd2f5742e8 Ben Hoff 2026-05-10  68  		unsigned long f;
ba07fd2f5742e8 Ben Hoff 2026-05-10  69  
ba07fd2f5742e8 Ben Hoff 2026-05-10  70  		dev_dbg(&hws->pdev->dev,
ba07fd2f5742e8 Ben Hoff 2026-05-10  71  			"arm_next(ch=%u): suspended after pick\n", ch);
ba07fd2f5742e8 Ben Hoff 2026-05-10  72  		spin_lock_irqsave(&v->irq_lock, f);
ba07fd2f5742e8 Ben Hoff 2026-05-10  73  		if (v->active) {
ba07fd2f5742e8 Ben Hoff 2026-05-10  74  			list_add(&buf->list, &v->capture_queue);
ba07fd2f5742e8 Ben Hoff 2026-05-10  75  			v->queued_count++;
ba07fd2f5742e8 Ben Hoff 2026-05-10  76  			v->active = NULL;
ba07fd2f5742e8 Ben Hoff 2026-05-10  77  		}
ba07fd2f5742e8 Ben Hoff 2026-05-10 @78  		spin_unlock_irqrestore(&v->irq_lock, f);
ba07fd2f5742e8 Ben Hoff 2026-05-10  79  		return -EBUSY;
ba07fd2f5742e8 Ben Hoff 2026-05-10  80  	}
ba07fd2f5742e8 Ben Hoff 2026-05-10  81  
ba07fd2f5742e8 Ben Hoff 2026-05-10  82  	/* Also program the DMA address register directly */
ba07fd2f5742e8 Ben Hoff 2026-05-10  83  	{
ba07fd2f5742e8 Ben Hoff 2026-05-10  84  		dma_addr_t dma_addr =
ba07fd2f5742e8 Ben Hoff 2026-05-10  85  		    vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
ba07fd2f5742e8 Ben Hoff 2026-05-10  86  		hws_program_dma_for_addr(hws, ch, dma_addr);
ba07fd2f5742e8 Ben Hoff 2026-05-10  87  		iowrite32(lower_32_bits(dma_addr),
ba07fd2f5742e8 Ben Hoff 2026-05-10  88  			  hws->bar0_base + HWS_REG_DMA_ADDR(ch));
ba07fd2f5742e8 Ben Hoff 2026-05-10  89  	}
ba07fd2f5742e8 Ben Hoff 2026-05-10  90  
ba07fd2f5742e8 Ben Hoff 2026-05-10  91  	dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): programmed buffer %p\n", ch,
ba07fd2f5742e8 Ben Hoff 2026-05-10  92  		buf);
ba07fd2f5742e8 Ben Hoff 2026-05-10  93  	spin_lock_irqsave(&v->irq_lock, flags);
ba07fd2f5742e8 Ben Hoff 2026-05-10  94  	hws_prime_next_locked(v);
ba07fd2f5742e8 Ben Hoff 2026-05-10  95  	spin_unlock_irqrestore(&v->irq_lock, flags);
ba07fd2f5742e8 Ben Hoff 2026-05-10  96  	return 0;
ba07fd2f5742e8 Ben Hoff 2026-05-10  97  }
ba07fd2f5742e8 Ben Hoff 2026-05-10  98  

:::::: The code at line 78 was first introduced by commit
:::::: ba07fd2f5742e8b0d965003b34c7a44eb4f67e53 media: pci: add AVMatrix HWS capture driver

:::::: TO: Ben Hoff <hoff.benjamin.k@gmail.com>
:::::: CC: Hans Verkuil <hverkuil+cisco@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
