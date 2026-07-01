Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65C5126C03
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jul 2026 00:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782867188; cv=none; b=pAJ9re50JQ8BsiremA5mQ7Vc3YANy51+aGCGN/DGh8xUmCiNMymmkSjYV2Jsj6PbdlhX4pQC/A+7I710yav+WFbbSxwXoVO5cBXH2XM2DZirKv74IcA1MdEtCI/eSmuctMQz59MPU8sIlSeuALwVS8B5vCM0ceftf0kG+/Fwg2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782867188; c=relaxed/simple;
	bh=rvoSernRvv24b2y0/GZiurtmCuf73+/8oxacdIgGD0Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ptHkI3IjUmmi5p2VJ10MUWdKneFGYbxTTbywkTqufCARPloU29itpTVgn9kh6VcxA8UCh30AWepGkoJl2M//TL5KfwrRaoQ96rgfqI7s4jotPUFRQaAEUwB3QAW43yKOgaAT1MChIV8b4KQC1pjD1l0pe8UCS+XBP4pfYaR+qAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LF5bhNjd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LF5bhNjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782867187; x=1814403187;
  h=date:from:to:cc:subject:message-id;
  bh=rvoSernRvv24b2y0/GZiurtmCuf73+/8oxacdIgGD0Y=;
  b=LF5bhNjdpL+knXX/m1sUrWSBaABu8twuUUH+qviDDLAmNjcol6uH1uwF
   Gfb2sntngL+Ju6LgaaCs6m/axCzUeADD+p2PAt8Sg54+FxRecOHdaNvqO
   ghjWg0XMf73BKEnaWu/dZHrQkoOG9ubVo1tM7Z9g1F+/ZYAaFlVGJV8yw
   Cme6WpblCJ4LKwaAvHwGg9+fFEuffWYHJ9OUUEgBK9KUwjFJzmIxQ4ZvZ
   9pnfiX/VFXGO90TbMKI1yJc3OC/vFNMnbIaX+ydy2VzIZElFe53Gi3OSz
   0WQbCkNUasA2Ossr9urJBNR2Q39BxQRKS3WZjxNX+fxhyCQqrv10pLWxL
   Q==;
X-CSE-ConnectionGUID: 1f0UuA+sQnqK43z2dOkR1A==
X-CSE-MsgGUID: jU3GrdD/QdaiWqM+SO++nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="82707121"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="82707121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 17:53:06 -0700
X-CSE-ConnectionGUID: d8aWazCdTfSVAiZUfnFeUw==
X-CSE-MsgGUID: GjbtKImuTg6dcAX8TYirmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="251984340"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Jun 2026 17:53:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wejCH-000000008p5-07Dy;
	Wed, 01 Jul 2026 00:53:01 +0000
Date: Wed, 01 Jul 2026 08:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 330/1356] drivers/rpmsg/rpmsg_char.c:236
 rpmsg_eptdev_read_iter() error: calling 'spin_unlock_irqrestore()' with bogus
 flags
Message-ID: <202607010826.2wLg1q08-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c93fa674f0fc3c8f359c2143abce6bbb422e6
commit: e07d10ed0f238d3f4a8276932a36fe1f74775621 [330/1356] lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20260701 (https://download.01.org/0day-ci/archive/20260701/202607010826.2wLg1q08-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607010826.2wLg1q08-lkp@intel.com/

New smatch warnings:
drivers/rpmsg/rpmsg_char.c:236 rpmsg_eptdev_read_iter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/virtio/virtio_input.c:56 virtinput_recv_events() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/virtio/virtio_input.c:333 virtinput_probe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hid/hid-asus.c:620 asus_kbd_backlight_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/i2c/busses/i2c-rk3x.c:1131 rk3x_i2c_xfer_common() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:691 ehci_hub_status_data() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:1080 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-sched.c:1290 itd_urb_transaction() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-sched.c:2093 sitd_urb_transaction() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/usb/host/ehci-hub.c:1161 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:1182 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-sched.c:239 reserve_release_intr_bandwidth() error: buffer overflow 'ehci->bandwidth' 64 <= 65
drivers/usb/host/ehci-sched.c:1338 reserve_release_iso_bandwidth() error: buffer overflow 'ehci->bandwidth' 64 <= 70
drivers/usb/host/ehci-sched.c:1340 reserve_release_iso_bandwidth() error: buffer overflow 'ehci->bandwidth' 64 <= 70

vim +236 drivers/rpmsg/rpmsg_char.c

c0cdc19f84a4712 Bjorn Andersson 2017-01-11  201  
ccf45b18ce89f59 Bjorn Andersson 2018-08-07  202  static ssize_t rpmsg_eptdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  203  {
ccf45b18ce89f59 Bjorn Andersson 2018-08-07  204  	struct file *filp = iocb->ki_filp;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  205  	struct rpmsg_eptdev *eptdev = filp->private_data;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  206  	unsigned long flags;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  207  	struct sk_buff *skb;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  208  	int use;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  209  
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  210  	if (!eptdev->ept)
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  211  		return -EPIPE;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  212  
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  213  	spin_lock_irqsave(&eptdev->queue_lock, flags);
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  214  
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  215  	/* Wait for data in the queue */
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  216  	if (skb_queue_empty(&eptdev->queue)) {
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  217  		spin_unlock_irqrestore(&eptdev->queue_lock, flags);
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  218  
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  219  		if (filp->f_flags & O_NONBLOCK)
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  220  			return -EAGAIN;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  221  
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  222  		/* Wait until we get data or the endpoint goes away */
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  223  		if (wait_event_interruptible(eptdev->readq,
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  224  					     !skb_queue_empty(&eptdev->queue) ||
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  225  					     !eptdev->ept))
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  226  			return -ERESTARTSYS;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  227  
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  228  		/* We lost the endpoint while waiting */
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  229  		if (!eptdev->ept)
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  230  			return -EPIPE;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  231  
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  232  		spin_lock_irqsave(&eptdev->queue_lock, flags);
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  233  	}
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  234  
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  235  	skb = skb_dequeue(&eptdev->queue);
0abd6bdde04f3f7 Dan Carpenter   2017-01-21 @236  	spin_unlock_irqrestore(&eptdev->queue_lock, flags);
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  237  	if (!skb)
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  238  		return -EFAULT;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  239  
ccf45b18ce89f59 Bjorn Andersson 2018-08-07  240  	use = min_t(size_t, iov_iter_count(to), skb->len);
ccf45b18ce89f59 Bjorn Andersson 2018-08-07  241  	if (copy_to_iter(skb->data, use, to) != use)
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  242  		use = -EFAULT;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  243  
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  244  	kfree_skb(skb);
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  245  
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  246  	return use;
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  247  }
c0cdc19f84a4712 Bjorn Andersson 2017-01-11  248  

:::::: The code at line 236 was first introduced by commit
:::::: 0abd6bdde04f3f7e9a1b76d474f3d9e804ef1867 rpmsg: unlock on error in rpmsg_eptdev_read()

:::::: TO: Dan Carpenter <dan.carpenter@oracle.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
