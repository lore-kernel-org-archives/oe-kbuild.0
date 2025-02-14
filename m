Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29DB264A93
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739539100; cv=none; b=WNqy4STF8p5pvu1J7ztL83nGDPFLg0+Jnk71RaQstzwPSF6+2SmL4LjESRYR3KxAagZDSm6SE9IJ5ZaZpFipIqQ/zXlCCzC9gCQVg/o7g5zuf1QSM4HtuPC9qws4aZ6KaX3q5XR4Da8D3z2YzjZd5dX061uTG8A6eyn+rUcdTdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739539100; c=relaxed/simple;
	bh=3+DEHikG5S6uyyC2FBbx6yiA3VjaqiZevwWsZ2jDywk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TGu01aFod988YKz0dro4ViQv+34BW8WSIxqtkKnkeUNqkCaIxyatbmIkylpqVWg9bL5kQQLxOqNIwJ7m/bgyEGdQFwt50RY5IHEr634M+rA3uDer+X3KPXkW1AWPRLt7unAvh4eNeWh4zN03fhlHZrf6OaXC9aO02tH4NdaD53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xg76Q5Rm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xg76Q5Rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739539098; x=1771075098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3+DEHikG5S6uyyC2FBbx6yiA3VjaqiZevwWsZ2jDywk=;
  b=Xg76Q5RmfhcA7C0n7J+aynsLYcIafhBxuk5Sn9OkfCwiTIxvilmmc3E7
   JZA2msnj0xasHtICJRKMPf7wQGggUfs6KqwHj5ld0VVPHdfHxCSUaMXfi
   EVlPJovUBRpnhe2dvchk5JSYdV/05f6/A76dq3pYoFSG/hSPV/NfZim66
   hwO/pDpjfRt3U5g+wPNc/OH/H3cbQgBXy2kqVg4ydbDrDHRp9tqUANdzp
   6VVP4RX2PaUepuuqSBI3zKA0X8kXsW+BNQpMRlEKp8Xzwc5zKAmpP8wlm
   OGbiNuuzQ8dZGnsfCcx22bWfg1UEDLx2dqQxQtb/qDV/fY9/ywM1fxp/z
   g==;
X-CSE-ConnectionGUID: fQF1c4RISmyU7I6Lx1mOqg==
X-CSE-MsgGUID: /qNl9vq6TdCTf0K6BTa6Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50914007"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="50914007"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:18:17 -0800
X-CSE-ConnectionGUID: 0btxlIU/Q2+HSVKUHcdgQQ==
X-CSE-MsgGUID: +edNZ41CTquweHK3qpAoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136679172"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Feb 2025 05:18:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiva8-0019Zl-2X;
	Fri, 14 Feb 2025 13:18:12 +0000
Date: Fri, 14 Feb 2025 21:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 26/26] drivers/usb/dwc2/hcd_queue.c:1249
 dwc2_unreserve_timer_fn() error: uninitialized symbol 'flags'.
Message-ID: <202502142117.qyurLznI-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: 9c8d14ce8aff2d38bf494f5d5436a302e3236842 [26/26] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-r071-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142117.qyurLznI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502142117.qyurLznI-lkp@intel.com/

smatch warnings:
drivers/usb/dwc2/hcd_queue.c:1249 dwc2_unreserve_timer_fn() error: uninitialized symbol 'flags'.
fs/aio.c:1823 aio_poll_wake() error: uninitialized symbol 'flags'.

vim +/flags +1249 drivers/usb/dwc2/hcd_queue.c

20f2eb9c4cf8d7 drivers/staging/dwc2/hcd_queue.c Dom Cobley       2013-09-23  1203  
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1204  /**
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1205   * dwc2_unreserve_timer_fn() - Timer function to release periodic reservation
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1206   *
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1207   * According to the kernel doc for usb_submit_urb() (specifically the part about
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1208   * "Reserved Bandwidth Transfers"), we need to keep a reservation active as
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1209   * long as a device driver keeps submitting.  Since we're using HCD_BH to give
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1210   * back the URB we need to give the driver a little bit of time before we
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1211   * release the reservation.  This worker is called after the appropriate
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1212   * delay.
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1213   *
6fb914d788133f drivers/usb/dwc2/hcd_queue.c     Grigor Tovmasyan 2018-05-16  1214   * @t: Address to a qh unreserve_work.
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1215   */
e99e88a9d2b067 drivers/usb/dwc2/hcd_queue.c     Kees Cook        2017-10-16  1216  static void dwc2_unreserve_timer_fn(struct timer_list *t)
20f2eb9c4cf8d7 drivers/staging/dwc2/hcd_queue.c Dom Cobley       2013-09-23  1217  {
e99e88a9d2b067 drivers/usb/dwc2/hcd_queue.c     Kees Cook        2017-10-16  1218  	struct dwc2_qh *qh = from_timer(qh, t, unreserve_timer);
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1219  	struct dwc2_hsotg *hsotg = qh->hsotg;
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1220  	unsigned long flags;
20f2eb9c4cf8d7 drivers/staging/dwc2/hcd_queue.c Dom Cobley       2013-09-23  1221  
20f2eb9c4cf8d7 drivers/staging/dwc2/hcd_queue.c Dom Cobley       2013-09-23  1222  	/*
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1223  	 * Wait for the lock, or for us to be scheduled again.  We
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1224  	 * could be scheduled again if:
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1225  	 * - We started executing but didn't get the lock yet.
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1226  	 * - A new reservation came in, but cancel didn't take effect
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1227  	 *   because we already started executing.
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1228  	 * - The timer has been kicked again.
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1229  	 * In that case cancel and wait for the next call.
20f2eb9c4cf8d7 drivers/staging/dwc2/hcd_queue.c Dom Cobley       2013-09-23  1230  	 */
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1231  	while (!spin_trylock_irqsave(&hsotg->lock, flags)) {
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1232  		if (timer_pending(&qh->unreserve_timer))
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1233  			return;
20f2eb9c4cf8d7 drivers/staging/dwc2/hcd_queue.c Dom Cobley       2013-09-23  1234  	}
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1235  
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1236  	/*
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1237  	 * Might be no more unreserve pending if:
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1238  	 * - We started executing but didn't get the lock yet.
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1239  	 * - A new reservation came in, but cancel didn't take effect
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1240  	 *   because we already started executing.
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1241  	 *
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1242  	 * We can't put this in the loop above because unreserve_pending needs
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1243  	 * to be accessed under lock, so we can only check it once we got the
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1244  	 * lock.
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1245  	 */
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1246  	if (qh->unreserve_pending)
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1247  		dwc2_do_unreserve(hsotg, qh);
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28  1248  
b951c6c7f875d2 drivers/usb/dwc2/hcd_queue.c     Douglas Anderson 2016-01-28 @1249  	spin_unlock_irqrestore(&hsotg->lock, flags);
20f2eb9c4cf8d7 drivers/staging/dwc2/hcd_queue.c Dom Cobley       2013-09-23  1250  }
20f2eb9c4cf8d7 drivers/staging/dwc2/hcd_queue.c Dom Cobley       2013-09-23  1251  

:::::: The code at line 1249 was first introduced by commit
:::::: b951c6c7f875d2c72c6e16a4d5fa810cbb33ae32 usb: dwc2: host: Reorder things in hcd_queue.c

:::::: TO: Douglas Anderson <dianders@chromium.org>
:::::: CC: Felipe Balbi <balbi@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
