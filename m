Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6727880C0C
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 10:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729419222; cv=none; b=WpHI2/aY7idw8pqnC+x2gHVDxdp0XUiuz5pxvayXpMG8Um2tqnmkSOW1bFzlnSe9TqvflcWNxA2AaGkY+V5yuH4zSCFCqRQOyxDMkeIu4oL9j0wyBXk5b1UJaLbYrjmJljdCb1xbHVEkNHpaFB6xZdSkF/1vPYdNgOdPgUkyVZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729419222; c=relaxed/simple;
	bh=6wuv34qsJUM322bGIVVeqhMzf12hZCi7zZUxNCQOrYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHmX7j3Z0Qyncx4nMK3b/nh/cMAbHUxS8MGTncsTr6R7re5sDZxgna68NFDuyy/0fhDlSaSsNdGC+RvzzxF/kI4nJqH6GRUHAr5Cs9voTvv2IKSPlaid2U8fDVm6l46fMG4BOM2jq3xIgqk5wiXYyS7nVicBZD9tpj+HEBJ/Av8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heothRhj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heothRhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729419219; x=1760955219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6wuv34qsJUM322bGIVVeqhMzf12hZCi7zZUxNCQOrYw=;
  b=heothRhjAAl4ACNShw+Xv9Ox+VAzVN+8WyIfBVhFbrKkZSaFQJ3f7+DG
   xTljxkSsGbxf03b8hPaWtGiZO/pkwA3bHcsAhZjtuzB8v6jn1xlcDYVN1
   Yi4QtOkvH1sBEQ0AkltGuioLdaGBvv1YnukjpzkRgd+GOiB5OKHIzZVuG
   /GP3qILsEVFnIdLJT2efdj5I9vPZBRGGKR3OTSoXUWV9E2tTVCNzst+YL
   A2wEjnNhshMEzJJ/4RFDzBEpN3OD9BRSn4DJMfB2kJthXlVN6+O9vs/3p
   z8xYgd0+lalFBzqgcmqmUga3I1HDCMOdgKR6CNgYyBR7AmkEg94usmmoL
   w==;
X-CSE-ConnectionGUID: AbWMgtQ1TLKyNkJkFO+lCg==
X-CSE-MsgGUID: sP9xMcE/SGalEc6Xh8OSpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="40303414"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="40303414"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 03:13:39 -0700
X-CSE-ConnectionGUID: wtwVSTTZSumsVVgjRYZ7iQ==
X-CSE-MsgGUID: Z9aQx93hTUOXmVj/lgwJwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="79598095"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2024 03:13:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2SwJ-000QC1-0y;
	Sun, 20 Oct 2024 10:13:35 +0000
Date: Sun, 20 Oct 2024 18:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error:
 uninitialized symbol 'stat'.
Message-ID: <202410202011.8EvvFh8V-lkp@intel.com>
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
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: 12658af54f2ed10d812dcd0a769d62cb9e9291e5 mmc: mxcmmc: Use sg_miter for PIO
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241020/202410202011.8EvvFh8V-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410202011.8EvvFh8V-lkp@intel.com/

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
