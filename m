Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174FE1D27BE
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 05:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729316309; cv=none; b=sUFp0A65VUS9lWv4sLMndfelGgnS3Muh5KjvzojTWQ9kInKoTK8J6vk7ZQLf/1GBu6lb4zxE2GU5t0A97UYpNE6XKZ4M+HwzFyYUaREAxwgfNyMgPelulZkI9Qey+Lw0ueC1hImaE//FknfmzDMzZM5q6lPLvGNtq1QlgVIVBzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729316309; c=relaxed/simple;
	bh=Wa9KLiBXVzjxi1xJNFQD2wm1nT6rskzQnWOT43GKRdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpMbXTQjKCHr1xwXZDXTx5ms5mttp7wNApForLs923txIg1/fmGwTsRsKUVRgZHLvv3njwa/A7FYpNFHxQjfT9X/DrSfNbCw8hUPMVglFLizvFtPMqITA9oRQ6SKc4NGZBNGdXIrGc/uUfP0Nzdr4Q91HWee0lBuDfTMBQQMHyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIOGJr14; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIOGJr14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729316307; x=1760852307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wa9KLiBXVzjxi1xJNFQD2wm1nT6rskzQnWOT43GKRdc=;
  b=KIOGJr146/TfSwHJjkOZOAoKAN2631yUCKn8lSXyTLU65TqHuZxuljPI
   oRp1S+69ATyGO6VUWqDW4RzC73VTE0bais28ALg9j9DGwMSNBv3OHGA8u
   KVFPPnj5msKBXOx/2lh5WzKox7D4/A6RBV5H6fc1ovAlyFIm/ygA1uhuy
   F2Aym1+iyDFClCMQJ0SjTsXodB2sLBwLH+Xk3z5ztfuHcUL53ZqWveyJ2
   4thfb5jB4yvzhyCjZKfZJAayLJrCqAbf65qevLcqKRnUS/upVXnvYip5X
   zJI0JFIia5URB1h9v2c8AN/ctMxUoqwFJxn/GnrtWnG/72QIIHZxYTwjc
   Q==;
X-CSE-ConnectionGUID: ZoIBXQWrSMWJZZnRfTenjg==
X-CSE-MsgGUID: 2Hwyr52iShKkmhL5OzyGqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51402091"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51402091"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 22:38:24 -0700
X-CSE-ConnectionGUID: e9t7SvbhT525h5IX5Zh/mg==
X-CSE-MsgGUID: Q2qxwJZcTdSav3cl1l0Z4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="78640524"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2024 22:38:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t22AO-000Oit-1M;
	Sat, 19 Oct 2024 05:38:20 +0000
Date: Sat, 19 Oct 2024 13:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error:
 uninitialized symbol 'stat'.
Message-ID: <202410191318.Y0N7pTlf-lkp@intel.com>
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
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: 12658af54f2ed10d812dcd0a769d62cb9e9291e5 mmc: mxcmmc: Use sg_miter for PIO
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241019/202410191318.Y0N7pTlf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410191318.Y0N7pTlf-lkp@intel.com/

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
