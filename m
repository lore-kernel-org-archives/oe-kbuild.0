Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF441CAB4
	for <oe-kbuild@lists.linux.dev>; Sat, 25 May 2024 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716626704; cv=none; b=YJmMXCJO6f1bXPcvl/QSQ6olKEQQp3ZK+dpaNTWL//ZjFsPg1fNYWOm9aiD6912Wu9WE0Fbd9BzK7BVc37is5iNKcsPunkUeONUTpFxR0VmHS6ePmNlC+Ff9/IpObRKBWY9YHJ36K4G0LEEBb8nkAcMPlkB/x/lAOBqmGWjz4JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716626704; c=relaxed/simple;
	bh=1gjXNMDDBhAqFL1hrOYSDA0dOqvwxAagrFl4VFVyHoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PoAr5B5bYOYnbUSEOZq7qy766ct0c6Tf6EPrKKAlpEG/JqbdKZOvxV1531n3wX1KfFWLOv2IXm61aqTFT3fXit3fVsHrAeVlqJiQ33qOHkMA7giBbIEByqUKihBXWwBLm38np1x1HHyk+XY6+ge/97sGNIrBA3qNNlxC6Ne40OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nd6hs9mW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nd6hs9mW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716626703; x=1748162703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1gjXNMDDBhAqFL1hrOYSDA0dOqvwxAagrFl4VFVyHoY=;
  b=Nd6hs9mWqDwTCDP4Yr1OZIoas2wCI+o1ECLn+3Z7cf9B8JZdTnlN5XaV
   JUGxqYAeZB7tv51FPDy5mZLylT8NABwaxWrA6EhhgFXSg/XqGKKhDkR5X
   H/e+ef1PvKJsO1hEWVfyDfo1imLrTJ+Upb2HGV4mJyF4ahEE4ftMEUWCL
   vsBlOsOpZw3JZdkZ8UyBK13ApR42yc/hWjQTnC6MKHVmPZ1Cz12Nd8SCf
   Fh6fOA5ZNdItFXZW9ctvgJ6GdWw1o6EGSja3JxCb5v+zExvhEEtNo6WmR
   bhj4qeqaTjo6ssSLgHwyb1HCMMJkwBw2HYhw0hgUTxnaJkKA6Ixx8iT2u
   w==;
X-CSE-ConnectionGUID: u2fRnViuRXSJYQx+ECva9Q==
X-CSE-MsgGUID: 0GtVJJCETJmX/GtixL3Uvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12941950"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="12941950"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 01:45:02 -0700
X-CSE-ConnectionGUID: IU699lpET5SGLlOjfkJ+9g==
X-CSE-MsgGUID: BDmkTJVeQ+GrU2aLibSAoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="34261878"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 May 2024 01:45:00 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAn1O-0006j1-2a;
	Sat, 25 May 2024 08:44:58 +0000
Date: Sat, 25 May 2024 16:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error:
 uninitialized symbol 'stat'.
Message-ID: <202405251637.rFM6Hl3B-lkp@intel.com>
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
head:   56fb6f92854f29dcb6c3dc3ba92eeda1b615e88c
commit: 12658af54f2ed10d812dcd0a769d62cb9e9291e5 mmc: mxcmmc: Use sg_miter for PIO
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-r071-20240524 (https://download.01.org/0day-ci/archive/20240525/202405251637.rFM6Hl3B-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405251637.rFM6Hl3B-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error: uninitialized symbol 'stat'.

Old smatch warnings:
drivers/mmc/host/mxcmmc.c:558 mxcmci_pull() error: __builtin_memcpy() '&tmp' too small (4 vs u32max)
drivers/mmc/host/mxcmmc.c:584 mxcmci_push() error: __builtin_memcpy() '&tmp' too small (4 vs u32max)

vim +/stat +626 drivers/mmc/host/mxcmmc.c

d96be879ff46975 Sascha Hauer  2009-01-06  590  
d96be879ff46975 Sascha Hauer  2009-01-06  591  static int mxcmci_transfer_data(struct mxcmci_host *host)
d96be879ff46975 Sascha Hauer  2009-01-06  592  {
d96be879ff46975 Sascha Hauer  2009-01-06  593  	struct mmc_data *data = host->req->data;
12658af54f2ed10 Linus Walleij 2024-01-27  594  	struct sg_mapping_iter sgm;
12658af54f2ed10 Linus Walleij 2024-01-27  595  	int stat;
12658af54f2ed10 Linus Walleij 2024-01-27  596  	u32 *buf;
d96be879ff46975 Sascha Hauer  2009-01-06  597  
d96be879ff46975 Sascha Hauer  2009-01-06  598  	host->data = data;
d96be879ff46975 Sascha Hauer  2009-01-06  599  	host->datasize = 0;
12658af54f2ed10 Linus Walleij 2024-01-27  600  	sg_miter_start(&sgm, data->sg, data->sg_len,
12658af54f2ed10 Linus Walleij 2024-01-27  601  		       (data->flags & MMC_DATA_READ) ? SG_MITER_TO_SG : SG_MITER_FROM_SG);
d96be879ff46975 Sascha Hauer  2009-01-06  602  
d96be879ff46975 Sascha Hauer  2009-01-06  603  	if (data->flags & MMC_DATA_READ) {
12658af54f2ed10 Linus Walleij 2024-01-27  604  		while (sg_miter_next(&sgm)) {
12658af54f2ed10 Linus Walleij 2024-01-27  605  			buf = sgm.addr;
12658af54f2ed10 Linus Walleij 2024-01-27  606  			stat = mxcmci_pull(host, buf, sgm.length);
d96be879ff46975 Sascha Hauer  2009-01-06  607  			if (stat)
12658af54f2ed10 Linus Walleij 2024-01-27  608  				goto transfer_error;
12658af54f2ed10 Linus Walleij 2024-01-27  609  			host->datasize += sgm.length;
d96be879ff46975 Sascha Hauer  2009-01-06  610  		}
d96be879ff46975 Sascha Hauer  2009-01-06  611  	} else {
12658af54f2ed10 Linus Walleij 2024-01-27  612  		while (sg_miter_next(&sgm)) {
12658af54f2ed10 Linus Walleij 2024-01-27  613  			buf = sgm.addr;
12658af54f2ed10 Linus Walleij 2024-01-27  614  			stat = mxcmci_push(host, buf, sgm.length);
d96be879ff46975 Sascha Hauer  2009-01-06  615  			if (stat)
12658af54f2ed10 Linus Walleij 2024-01-27  616  				goto transfer_error;
12658af54f2ed10 Linus Walleij 2024-01-27  617  			host->datasize += sgm.length;
d96be879ff46975 Sascha Hauer  2009-01-06  618  		}
d96be879ff46975 Sascha Hauer  2009-01-06  619  		stat = mxcmci_poll_status(host, STATUS_WRITE_OP_DONE);
d96be879ff46975 Sascha Hauer  2009-01-06  620  		if (stat)
12658af54f2ed10 Linus Walleij 2024-01-27  621  			goto transfer_error;
d96be879ff46975 Sascha Hauer  2009-01-06  622  	}
12658af54f2ed10 Linus Walleij 2024-01-27  623  
12658af54f2ed10 Linus Walleij 2024-01-27  624  transfer_error:
12658af54f2ed10 Linus Walleij 2024-01-27  625  	sg_miter_stop(&sgm);
12658af54f2ed10 Linus Walleij 2024-01-27 @626  	return stat;
d96be879ff46975 Sascha Hauer  2009-01-06  627  }
d96be879ff46975 Sascha Hauer  2009-01-06  628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
