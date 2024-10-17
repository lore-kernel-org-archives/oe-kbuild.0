Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B3E29A5
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 05:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729143378; cv=none; b=mXOgWl2ofvw6R2819Em1UpvFtanVTk2hhLdCJQuFqUsxMupUde74Gw1wDN1SOBrDoT5AkadwCpiFuUzRnlWVNYTS/Yt7aDXtW6DGwlyx3ma4gLh/YUMKJ3jbNmFa6Nv5r0j5xfOWmPAtJul8EA1G39Md+HhQ5XVUm4FwbbBU3jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729143378; c=relaxed/simple;
	bh=Fxgp9jPO3GdC3aMK/VOgqTvzfOAz3+d9myOZuZfzQvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jrr4Udu/eJIeHYtokITkqfyzemB8J/XfHm/AzH69iQ+ks9VCcbxVNEHWu6bXJEImzIXu0FD2iQfnhG6SPcxAa09aHgGCsGvTvFEQfdEkz51H3Rapu6gH4enoUFBi2XANrPPK9TzUo25y783vODkzzYWM+kEnv8BIpyporpYTbCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/2NAWbo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/2NAWbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729143375; x=1760679375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fxgp9jPO3GdC3aMK/VOgqTvzfOAz3+d9myOZuZfzQvo=;
  b=n/2NAWbo43Kn4C2DjDrU8CQEeA0J9qWalzPF1QndmYvP5o7VFeQ1dM01
   viOrsiUOQRedQqUZ+xg2VwiAy0PLQ+Mx1OZtjUuIauxBvMmKwdMxvAvQh
   d5WrSmKGixl7FL0vCekqDqUPPL8tiTjcBpS7mKswqybyhzUMa0VcS/Qeo
   8IPQ7PKApZEOnbd9+DljQ/mmfKTWzdoRgBNBkn4RVX351I1LAx7I/ksAV
   Q55GihT4L5KDXuVGU4WL76iwx5cmlzUck3WIsEkEKXDqRkcDJwxjl+MjF
   0B/4HB65RVS2s6JbIRQXM/v7iYUUN5HTy8o0Bj3M6dqIgCh2BQkRdxq49
   g==;
X-CSE-ConnectionGUID: fKYmDX8UTbio3nXvk3u/YA==
X-CSE-MsgGUID: uc6HtLtIRiqBcTcsfm0nVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="46108838"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="46108838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 22:36:00 -0700
X-CSE-ConnectionGUID: +lC9HMx7Sh6VQWn0IIKbzw==
X-CSE-MsgGUID: PiTjrdGGR8WkKptvL/s6VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78594604"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2024 22:35:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1JAx-000Llv-2q;
	Thu, 17 Oct 2024 05:35:55 +0000
Date: Thu, 17 Oct 2024 13:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error:
 uninitialized symbol 'stat'.
Message-ID: <202410171321.CqpaIHgq-lkp@intel.com>
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
head:   c964ced7726294d40913f2127c3f185a92cb4a41
commit: 12658af54f2ed10d812dcd0a769d62cb9e9291e5 mmc: mxcmmc: Use sg_miter for PIO
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241017/202410171321.CqpaIHgq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410171321.CqpaIHgq-lkp@intel.com/

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
