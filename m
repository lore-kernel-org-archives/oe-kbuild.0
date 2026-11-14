Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655130;
	b=SZ3EvLYsJ6moja6fw8WK2l9NM1CQDLqdkek+J+xOEB4ZXxkS8wyydjR1roI323Qvzx0I
	 fjx5pOVsqiKF/J7OFV2f6XHsY8a7yWoHfxru/DKRVc5HS9n7de7Q2gNUMhQTsNWn/BNag
	 4wY+v8mmVysrrHvjjHO8WcXWvaXsze/TDNCAGnaIfTMF5QY3LnNQVfbDppOybyLxGyNsD
	 W6XVMvbiTMumO9McEQZ+c/M8vLpDF9Ln2YAg3Rma5JYRNslBtkill5demlpNv21N2U0QR
	 RB93S6J5e3M3lETziev4sZjeR3c48qmV0iqTCcg5Z845d7/TJ/ugvkjqMBlBsIhd3sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655130;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ekmhta1CpWQkGXEhFQmil1PkcFafoY0FvYoqhFN5MXc=;
	b=rc5XoYo+g15m+4cHsmo8Al3/NJpi7HpwK5lT8Fvdp7JZClOFetquLaBb1QbYdiGJg4gI
	 bOaCuearCMDwzeW6quXJCO2+lrwE03lDhH0Uzfdwhyskx7CEwjMosFrFxChIhzMlwrFiY
	 /+ROE0xYc/Dyp1atW6K38SUolAKXzbEGE+NpDXNFOp0hgn0fKu8P/nDEZXYcSnLs6zxtC
	 1A7HrEgvdjVxAv4a6IL5rCp+nC04sSbUGmlrmk3l5dj7rzerfcQgBrE3/m8WJrnPOzIer
	 cBPRkG4jUGhJJTWlzv17oPiZBgt4npg4qVJAR6BZDO2xsuJUASEtg1fgBGECtBJEJyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sfo7JFZ4;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B022606A331
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 11:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B022606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sfo7JFZ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794655131; x=1826191131;
  h=date:from:to:cc:subject:message-id;
  bh=6Lene3HvioU3WTqLsryBevhtdA6/21D4Xf7uEu8beY4=;
  b=Sfo7JFZ47/jT0E2QwvJ2IjjESFha2qNRztd1DczU4KcQXTeJ3bzQsOc4
   CLiO2mVsIBWlt1RGoc4gMR7nGCKhmMXQoUjUQVhMe82kLM3C/iLuv2y6l
   BGKqT6lwvgkCfQ2QWtcDMD4wUqfi4YK6BC3y2/B4scHEdjmqRSjHqu2JU
   7dMWULF4JUX6+7eIXB3MGzx2EmAnW5f0KCzEP2q4/RyYfNKCroXvUHTt1
   mgFFA7UeDBqh0HlLQ2ils6Y7b4ngbx+t1fXsYz4D3Lt960diHXYj9uKaz
   qTASruaFdPJtfoAW/c6GF6pONEE0vHNhvRkltsfA0aITC1YTtQ0eGTPB3
   g==;
X-CSE-ConnectionGUID: n8+pd+4iT2GRW+7hLOwmig==
X-CSE-MsgGUID: nw4gFNbqSrOJ5Q8kTycKLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3531572"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3531572"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 03:18:50 -0800
X-CSE-ConnectionGUID: wX4XC8vmTwOq/Jx+oB0/pA==
X-CSE-MsgGUID: wz2QD6HJRCG9jJJIOU4vAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="10853248"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 14 Nov 2026 03:18:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSBmP-000000001YP-0zqk;
	Sat, 14 Nov 2026 11:18:45 +0000
Date: Sat, 14 Nov 2026 12:18:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broadcom-stblinux:drivers/next 9/22]
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c:1643
 vchiq_mmal_submit_buffer() warn: missing error code? 'ret'
Message-ID: <202611141218.5FZTnFtc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: Jai Luthra <jai.luthra@ideasonboard.com>

tree:   https://github.com/Broadcom/stblinux drivers/next
head:   0cab822bca7a59667774725b83e948b71462290f
commit: 67d0fbe47f8a03cdf30794ea8660a05dd54100d0 [9/22] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to support zero copy
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: powerpc-randconfig-2200-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141218.5FZTnFtc-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611141218.5FZTnFtc-lkp@intel.com/

smatch warnings:
drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c:1643 vchiq_mmal_submit_buffer() warn: missing error code? 'ret'

vim +/ret +1643 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c

7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1616  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1617  int vchiq_mmal_submit_buffer(struct vchiq_mmal_instance *instance,
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1618  			     struct vchiq_mmal_port *port,
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1619  			     struct mmal_buffer *buffer)
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1620  {
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1621  	unsigned long flags = 0;
93841670707135 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Dave Stevenson 2018-05-10  1622  	int ret;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1623  
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1624  	/*
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1625  	 * We really want to do this in mmal_vchi_buffer_init but can't as
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1626  	 * videobuf2 won't let us have the dmabuf there.
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1627  	 */
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1628  	if (port->zero_copy && buffer->dma_buf && !buffer->vcsm_handle) {
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1629  		pr_debug("%s: import dmabuf %p\n", __func__, buffer->dma_buf);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1630  		ret = vc_sm_cma_import_dmabuf(buffer->dma_buf,
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1631  					      &buffer->vcsm_handle);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1632  		if (ret) {
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1633  			pr_err("%s: vc_sm_import_dmabuf_fd failed, ret %d\n",
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1634  			       __func__, ret);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1635  			return ret;
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1636  		}
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1637  
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1638  		buffer->vc_handle = vc_sm_cma_get_vc_handle(buffer->vcsm_handle);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1639  		if (!buffer->vc_handle) {
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1640  			pr_err("%s: vc_sm_int_handle failed %d\n",
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1641  			       __func__, ret);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1642  			vc_sm_cma_free(buffer->vcsm_handle);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12 @1643  			return ret;
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1644  		}
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1645  		pr_debug("%s: import dmabuf %p - got vc handle %08X\n",
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1646  			 __func__, buffer->dma_buf, buffer->vc_handle);
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1647  	}
67d0fbe47f8a03 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c      Dave Stevenson 2026-11-12  1648  
93841670707135 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Dave Stevenson 2018-05-10  1649  	ret = buffer_from_host(instance, port, buffer);
93841670707135 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Dave Stevenson 2018-05-10  1650  	if (ret == -EINVAL) {
93841670707135 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Dave Stevenson 2018-05-10  1651  		/* Port is disabled. Queue for when it is enabled. */
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1652  		spin_lock_irqsave(&port->slock, flags);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1653  		list_add_tail(&buffer->list, &port->buffers);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1654  		spin_unlock_irqrestore(&port->slock, flags);
93841670707135 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Dave Stevenson 2018-05-10  1655  	}
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1656  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1657  	return 0;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1658  }
b18ee53ad29726 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Jacopo Mondi   2020-06-23  1659  EXPORT_SYMBOL_GPL(vchiq_mmal_submit_buffer);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt    2017-01-27  1660  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
