Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E721330BF70
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 20:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571972; cv=none; b=CskZ8zd4uBnP1mk31YGxGZYJBjzRr+ZG9/gyhlzJ+o2vh13+hA44F3yKHg5W7GQ3HRCbIdyzSM4pXKIptfAPBBc7fZMEpFXQWTJ+iWJqcGUtWnU08wlSU+vraUzgoQIKRZXyVBOm68sqUdU3erWiv+RRrPLaxcXFW+cN62vKhJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571972; c=relaxed/simple;
	bh=MNAnOvO5nPIIx8pS0b+J6BSqd966Y76IpcZKvKJUP24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fNrC3P/KPf3mWP4SZbKGdqoUexBeUR6HjyHGKGriul35ChH1aZHl9MQvIzi/R2/nCUPEIwyKwEYrW5J2k/DqQeoPKRPzVJdNLoX86kaWvQ4CHEeEbThpgGc0B7LfNrg/rKEKtBcXPMy5YKhmT4z5A8wSJyWEzyy4cCy7TBbSdjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+Lie7XK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+Lie7XK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765571971; x=1797107971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MNAnOvO5nPIIx8pS0b+J6BSqd966Y76IpcZKvKJUP24=;
  b=M+Lie7XKo65KZC4P++uEVIrCELVEIPMbBEz5FQ5X2zNDUiLmJuq7FVgQ
   cwi8bBzqKoRU3wm+6PXQnai93sP5wZmGHw2+NWQo0AamHIIkP7XVKjJC9
   VlE/XbKGGRE4wSFSW1hZ4nPzA9IX2O9OIG3DsHNMS6geKecONANlRhaF7
   i40CLWJTJ/vpkykAgn3oLVFBD8unN28QUWZrK6gnjamePE5YOdj0VDCwK
   xWJu5hmPxXWfUJG9DTN3JWip5yM3vxSieJ0mdAfwEFLIpPGlXFJKCbLZQ
   0aQgKPoej0bLgvXfk8iDiQWoH+Q/9V4ZnLpNRTNzWNa8IU7BWCPVIq2tP
   Q==;
X-CSE-ConnectionGUID: cW3deb5/S1K+IxixUuiqsg==
X-CSE-MsgGUID: vIdStonhReW0z8iOBjFT3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77896164"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="77896164"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:39:29 -0800
X-CSE-ConnectionGUID: bGAjMKRESqW07XH4IBc3HQ==
X-CSE-MsgGUID: GG6LDuaKSQ20V+Zrj2zP0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201666552"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 12:39:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9vB-000000006aj-1Xnf;
	Fri, 12 Dec 2025 20:39:25 +0000
Date: Sat, 13 Dec 2025 04:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error:
 uninitialized symbol 'stat'.
Message-ID: <202512130401.H7CHsjQ8-lkp@intel.com>
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
TO: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 7cd8db0fb0b2bf309163d56fec585c0f9e0964d1 mmc: add COMPILE_TEST to multiple drivers
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: csky-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130401.H7CHsjQ8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130401.H7CHsjQ8-lkp@intel.com/

smatch warnings:
drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error: uninitialized symbol 'stat'.

vim +/stat +626 drivers/mmc/host/mxcmmc.c

d96be879ff4697 Sascha Hauer  2009-01-06  590  
d96be879ff4697 Sascha Hauer  2009-01-06  591  static int mxcmci_transfer_data(struct mxcmci_host *host)
d96be879ff4697 Sascha Hauer  2009-01-06  592  {
d96be879ff4697 Sascha Hauer  2009-01-06  593  	struct mmc_data *data = host->req->data;
12658af54f2ed1 Linus Walleij 2024-01-27  594  	struct sg_mapping_iter sgm;
12658af54f2ed1 Linus Walleij 2024-01-27  595  	int stat;
12658af54f2ed1 Linus Walleij 2024-01-27  596  	u32 *buf;
d96be879ff4697 Sascha Hauer  2009-01-06  597  
d96be879ff4697 Sascha Hauer  2009-01-06  598  	host->data = data;
d96be879ff4697 Sascha Hauer  2009-01-06  599  	host->datasize = 0;
12658af54f2ed1 Linus Walleij 2024-01-27  600  	sg_miter_start(&sgm, data->sg, data->sg_len,
12658af54f2ed1 Linus Walleij 2024-01-27  601  		       (data->flags & MMC_DATA_READ) ? SG_MITER_TO_SG : SG_MITER_FROM_SG);
d96be879ff4697 Sascha Hauer  2009-01-06  602  
d96be879ff4697 Sascha Hauer  2009-01-06  603  	if (data->flags & MMC_DATA_READ) {
12658af54f2ed1 Linus Walleij 2024-01-27  604  		while (sg_miter_next(&sgm)) {
12658af54f2ed1 Linus Walleij 2024-01-27  605  			buf = sgm.addr;
12658af54f2ed1 Linus Walleij 2024-01-27  606  			stat = mxcmci_pull(host, buf, sgm.length);
d96be879ff4697 Sascha Hauer  2009-01-06  607  			if (stat)
12658af54f2ed1 Linus Walleij 2024-01-27  608  				goto transfer_error;
12658af54f2ed1 Linus Walleij 2024-01-27  609  			host->datasize += sgm.length;
d96be879ff4697 Sascha Hauer  2009-01-06  610  		}
d96be879ff4697 Sascha Hauer  2009-01-06  611  	} else {
12658af54f2ed1 Linus Walleij 2024-01-27  612  		while (sg_miter_next(&sgm)) {
12658af54f2ed1 Linus Walleij 2024-01-27  613  			buf = sgm.addr;
12658af54f2ed1 Linus Walleij 2024-01-27  614  			stat = mxcmci_push(host, buf, sgm.length);
d96be879ff4697 Sascha Hauer  2009-01-06  615  			if (stat)
12658af54f2ed1 Linus Walleij 2024-01-27  616  				goto transfer_error;
12658af54f2ed1 Linus Walleij 2024-01-27  617  			host->datasize += sgm.length;
d96be879ff4697 Sascha Hauer  2009-01-06  618  		}
d96be879ff4697 Sascha Hauer  2009-01-06  619  		stat = mxcmci_poll_status(host, STATUS_WRITE_OP_DONE);
d96be879ff4697 Sascha Hauer  2009-01-06  620  		if (stat)
12658af54f2ed1 Linus Walleij 2024-01-27  621  			goto transfer_error;
d96be879ff4697 Sascha Hauer  2009-01-06  622  	}
12658af54f2ed1 Linus Walleij 2024-01-27  623  
12658af54f2ed1 Linus Walleij 2024-01-27  624  transfer_error:
12658af54f2ed1 Linus Walleij 2024-01-27  625  	sg_miter_stop(&sgm);
12658af54f2ed1 Linus Walleij 2024-01-27 @626  	return stat;
d96be879ff4697 Sascha Hauer  2009-01-06  627  }
d96be879ff4697 Sascha Hauer  2009-01-06  628  

:::::: The code at line 626 was first introduced by commit
:::::: 12658af54f2ed10d812dcd0a769d62cb9e9291e5 mmc: mxcmmc: Use sg_miter for PIO

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
