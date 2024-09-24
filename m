Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5415C1DDE9
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 04:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727152083; cv=none; b=SfgezLqsAQuNJtNNGwhdzkdlYZb1O4E9AWZSZM4RylkXnUAilAbkmVz+X3JqLzoGhAi4Wy0sGZcxG+N7KcysC6PJxhC/hj0WSdhCZ99hkJ/HbdeYTr4Vxte8FteKlPV6dCNjrSt0cY5yol0s8oX0fexbfyXUDDwZFMwxWo8fYco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727152083; c=relaxed/simple;
	bh=P2qU1/pJ9t83wI9OUWSLB0dIkpVMAqodpR1+VXGQqdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQxuCDKuf+70OdAK4GI3BVGvSjS4ZXPVF4iZHu9MamqT+9Ly4hzs4A9zVsv1yXsvu7G5laHKHZhXAFGOf+0eUd2O9bqHPwyrhDOjY+rcC7lwBrFX445T6MW7EgZZBYClMH58kWb6TXROc5mWS3QQDdiZ0zAYlfqSuzHOBBkeya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gt4GFpBW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gt4GFpBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727152081; x=1758688081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P2qU1/pJ9t83wI9OUWSLB0dIkpVMAqodpR1+VXGQqdk=;
  b=gt4GFpBW5AgZ8NXjT3ZEFhjfVzGIASVSwhO+t2uxnTAP68Pv+GsaypI+
   VL6u7XZ31cymMcUtX4pxk4VhO09dbR98r3QOJKd0E5V3FneS1WFLFGYwT
   jbp6cVWbgia97y8NvsC3q2MG/IMMdp7lmI7M6oSZR+TTCsbeXHyDZIPM0
   bPbgPh9SUdojdilGlQL3b26FpWcaQ26nPoE0mwT3D2P0limgdfMBrAwUH
   LEoi44hJibGPwB97RnP4tmk7xQ4zI/ZTpuDcTh7x0+9cb9cmU2NO9N0jV
   HQANMvNsSxkaU3Q7VvoQ40GDGO33QBQkElKAxgIb0Nx+MaOou0ry3xt9c
   w==;
X-CSE-ConnectionGUID: KwWe1P9dQX2HzdEnwjNnkQ==
X-CSE-MsgGUID: oBmZXiMvQFKOk5tU/V8afw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29842782"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="29842782"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 21:28:01 -0700
X-CSE-ConnectionGUID: LN0P0l9WTu2bFIEsVlQ5fQ==
X-CSE-MsgGUID: MLDl9am+R/+xwQLDFpe3cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="108728040"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Sep 2024 21:27:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssx9Z-000Hu9-1E;
	Tue, 24 Sep 2024 04:27:57 +0000
Date: Tue, 24 Sep 2024 12:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error:
 uninitialized symbol 'stat'.
Message-ID: <202409241226.icgbtiH4-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   abf2050f51fdca0fd146388f83cddd95a57a008d
commit: 12658af54f2ed10d812dcd0a769d62cb9e9291e5 mmc: mxcmmc: Use sg_miter for PIO
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-r073-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241226.icgbtiH4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409241226.icgbtiH4-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error: uninitialized symbol 'stat'.

Old smatch warnings:
drivers/mmc/host/mxcmmc.c:558 mxcmci_pull() error: __builtin_memcpy() '&tmp' too small (4 vs u32max)
drivers/mmc/host/mxcmmc.c:584 mxcmci_push() error: __builtin_memcpy() '&tmp' too small (4 vs u32max)

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
