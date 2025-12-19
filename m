Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CE4261B70
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 22:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766182043; cv=none; b=bwyBZMBQfZ46T/UCZK/7OYAVsaDOCbVEiV1hkvOhFlp2KY7RCSjt6A6eZ9QzDhbE0OU4wkVq+FNqKxHeNrVq5gtMrj/EHDHPuCwY4SZsXDoqDvjIT7rvPq62Z19PyfGaCzN7EUc/iKmaxvYfr+NcwUhpB4pfNHBQf3leVdg7MfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766182043; c=relaxed/simple;
	bh=eU98nS3e6NlPPp2RBeO1oLA8zAjIeQRBGXOxSGegh4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9mu0huGf0iZ9Zb8Qg1/ryuudUWAYJxM2rl+T+LEvQTj2lRxKZJzofy/njxCQcqAjKerQbMz08KGXlJ5o3o3Bq3/w8goS8nQL/jPNe6Lpt7/mmza4gpdqqTyOrJczRwX31sC95heImmom2rAYRhtuU/Bn86UXnrFCZep4goEGrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9IZIdDA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9IZIdDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766182041; x=1797718041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eU98nS3e6NlPPp2RBeO1oLA8zAjIeQRBGXOxSGegh4c=;
  b=K9IZIdDAsvABkd4USZ6I4VKIrW2MQGj8pS2Yw2AMWd5q3lABK3zl9QXc
   8wzy4KvpN0ZQxXbngpO5FMqVGM0phOPPdOO+ZaLYDpcjOOMHb9KHmjDfM
   elBEnXSxtU8Hz2gae3YCoqqF7iUEkD0UV1TpOfc5trru0XUguWBoN5Cyg
   IXAnLWIpNFRO9rosIlTKmiPCIqrv9bHbJjsfwF8rp8JoZIa9eWgmP/Jo+
   vyiWfrIZptePBs2xUSL6V4286D7DesN2Au9PPLp2ISQG1OTn4oQ3WG8jf
   WI+M0wrx1+2RRDE/WZ/3/M83ClRtb98LdQO/sE6/92Aa6SKHtUsPSML5Q
   g==;
X-CSE-ConnectionGUID: v92D7A4AQKaghMz3+oH1Cg==
X-CSE-MsgGUID: zDLUWAgoRr6QQWLq/XCwbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79512248"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="79512248"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 14:07:20 -0800
X-CSE-ConnectionGUID: ngj6Qh3VTr+43v5ZMvgKfQ==
X-CSE-MsgGUID: Tul1ZYwNRFGG4BiP6+5ryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="199209819"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Dec 2025 14:07:18 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWid2-0000000042f-1x95;
	Fri, 19 Dec 2025 22:07:16 +0000
Date: Sat, 20 Dec 2025 06:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 43/43] drivers/mtd/mtdcore.c:955
 mtd_otp_nvmem_add() warn: missing unwind goto?
Message-ID: <202512200534.LKFMONBG-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 534fd7770b6ddedc6c6ef6fa724987d3397f9b3b [43/43] mtd: core: Report error if first mtd_otp_size() call fails in mtd_otp_nvmem_add()
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 6 months ago
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251220/202512200534.LKFMONBG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512200534.LKFMONBG-lkp@intel.com/

smatch warnings:
drivers/mtd/mtdcore.c:955 mtd_otp_nvmem_add() warn: missing unwind goto?

vim +955 drivers/mtd/mtdcore.c

4b361cfa862479 Michael Walle 2021-04-24  935  
4b361cfa862479 Michael Walle 2021-04-24  936  static int mtd_otp_nvmem_add(struct mtd_info *mtd)
4b361cfa862479 Michael Walle 2021-04-24  937  {
26358f330405af Michael Walle 2023-03-08  938  	struct device *dev = mtd->dev.parent;
4b361cfa862479 Michael Walle 2021-04-24  939  	struct nvmem_device *nvmem;
4b361cfa862479 Michael Walle 2021-04-24  940  	ssize_t size;
4b361cfa862479 Michael Walle 2021-04-24  941  	int err;
4b361cfa862479 Michael Walle 2021-04-24  942  
4b361cfa862479 Michael Walle 2021-04-24  943  	if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
4b361cfa862479 Michael Walle 2021-04-24  944  		size = mtd_otp_size(mtd, true);
534fd7770b6dde Aapo Vienamo  2024-03-13  945  		if (size < 0) {
534fd7770b6dde Aapo Vienamo  2024-03-13  946  			err = size;
534fd7770b6dde Aapo Vienamo  2024-03-13  947  			goto err;
534fd7770b6dde Aapo Vienamo  2024-03-13  948  		}
4b361cfa862479 Michael Walle 2021-04-24  949  
4b361cfa862479 Michael Walle 2021-04-24  950  		if (size > 0) {
4b361cfa862479 Michael Walle 2021-04-24  951  			nvmem = mtd_otp_nvmem_register(mtd, "user-otp", size,
4b361cfa862479 Michael Walle 2021-04-24  952  						       mtd_nvmem_user_otp_reg_read);
4b361cfa862479 Michael Walle 2021-04-24  953  			if (IS_ERR(nvmem)) {
26358f330405af Michael Walle 2023-03-08  954  				dev_err(dev, "Failed to register OTP NVMEM device\n");
4b361cfa862479 Michael Walle 2021-04-24 @955  				return PTR_ERR(nvmem);
4b361cfa862479 Michael Walle 2021-04-24  956  			}
4b361cfa862479 Michael Walle 2021-04-24  957  			mtd->otp_user_nvmem = nvmem;
4b361cfa862479 Michael Walle 2021-04-24  958  		}
4b361cfa862479 Michael Walle 2021-04-24  959  	}
4b361cfa862479 Michael Walle 2021-04-24  960  
4b361cfa862479 Michael Walle 2021-04-24  961  	if (mtd->_get_fact_prot_info && mtd->_read_fact_prot_reg) {
4b361cfa862479 Michael Walle 2021-04-24  962  		size = mtd_otp_size(mtd, false);
4b361cfa862479 Michael Walle 2021-04-24  963  		if (size < 0) {
4b361cfa862479 Michael Walle 2021-04-24  964  			err = size;
4b361cfa862479 Michael Walle 2021-04-24  965  			goto err;
4b361cfa862479 Michael Walle 2021-04-24  966  		}
4b361cfa862479 Michael Walle 2021-04-24  967  
4b361cfa862479 Michael Walle 2021-04-24  968  		if (size > 0) {
4b361cfa862479 Michael Walle 2021-04-24  969  			nvmem = mtd_otp_nvmem_register(mtd, "factory-otp", size,
4b361cfa862479 Michael Walle 2021-04-24  970  						       mtd_nvmem_fact_otp_reg_read);
4b361cfa862479 Michael Walle 2021-04-24  971  			if (IS_ERR(nvmem)) {
26358f330405af Michael Walle 2023-03-08  972  				dev_err(dev, "Failed to register OTP NVMEM device\n");
4b361cfa862479 Michael Walle 2021-04-24  973  				err = PTR_ERR(nvmem);
4b361cfa862479 Michael Walle 2021-04-24  974  				goto err;
4b361cfa862479 Michael Walle 2021-04-24  975  			}
4b361cfa862479 Michael Walle 2021-04-24  976  			mtd->otp_factory_nvmem = nvmem;
4b361cfa862479 Michael Walle 2021-04-24  977  		}
4b361cfa862479 Michael Walle 2021-04-24  978  	}
4b361cfa862479 Michael Walle 2021-04-24  979  
4b361cfa862479 Michael Walle 2021-04-24  980  	return 0;
4b361cfa862479 Michael Walle 2021-04-24  981  
4b361cfa862479 Michael Walle 2021-04-24  982  err:
4b361cfa862479 Michael Walle 2021-04-24  983  	nvmem_unregister(mtd->otp_user_nvmem);
4b361cfa862479 Michael Walle 2021-04-24  984  	return err;
4b361cfa862479 Michael Walle 2021-04-24  985  }
4b361cfa862479 Michael Walle 2021-04-24  986  

:::::: The code at line 955 was first introduced by commit
:::::: 4b361cfa862479fbb1d14ddf01de4dbc7146dcc5 mtd: core: add OTP nvmem provider support

:::::: TO: Michael Walle <michael@walle.cc>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
