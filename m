Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942717;
	b=ypTZVIUK2sE6uYqp6MBK/kD0Ldp8lJVjQPojBENRk2glnZ4ig7Y4fS4F3lxgSOM4kMiL
	 2NPrJdyphjQsKCpGwCKFSknd32WPCy5NB3OTHI4EnUdIi2cWeefsIdNLg4D62GC164o+o
	 DWf+iEjGCiz7WkhKntE1jZkVQnQI4YiBJCz2kIjW1KKyTdP2DVcTA723l58e8o8TLObwy
	 ILFbBHRbRHaziQbn7U+zkkAuJ6q7C1qeW2Ce5tmMQr7DzOil4AjE7PGH2LF47Rlrq4h+S
	 8JVrsWWUn86x2P98to8Mfn7eg1obksOZDzGpJaKw+nS+Ac5mv/XbBytrjkgbw+VUzLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942717;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7F6y/OPqqkOuA7eDEdeRRwDMmenlvI3oikSjSmiQoZA=;
	b=IU/4hFpL8Oldwd8MoWtWkGM2UKT5YLv+mqubXbIecs4dqG0VRCdgppOgJnQaXVyXhjt1
	 TL01FeqfeeNDaA4O54Kl+SYV1G8psKLLkLdBNvH+fi66GbXosOc1EAa8lxehQ+X/bWyzx
	 PSq9fY6CEireUYwJyrPlZRjjsZLWQp2KqV2BYEe+uL7L/LNGCgXC/eA3MCGl2tJ9y6It+
	 NXxdPpfj58mvR3b1h7XLODd6FeSWt1mhh3uwtjmp1nQtVFi2ZcDKirqqIynyOG3yj7Twu
	 +3YjE6cnXK2iq2yvkq3OMGlwcaUPIwjAZusXiJNn6nApU4d+c3vwW5+4bGe6iRkeCeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmynTXG9;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CA3606A328
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 05:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CA3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmynTXG9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793942714; x=1825478714;
  h=date:from:to:cc:subject:message-id;
  bh=mhax5/5SJmhhDjOHgKkdR8NTZZcgPyc2pSWjfkFmdoc=;
  b=jmynTXG9FSYNHr8H2N71jo4ZbLLbAlvJ08NDY1cOAS07WAXsOyHyu74O
   1mrmlB27+BLPA8Nd1G85uJkA6fHZWvC0Ug0nqijYHasMq/11H5JaoMvu4
   aCnUnRDAP9aw9eSTtIj0FTi8TH3qEF+AxHJD9eB9uDHF6SvIQ6qeQ7CI4
   i8SeNckSSw+MjSZ9+3sFAr+zeucojZk9GY5SswQY7BBKZhXXXBudRgDFV
   kXS4mTrVcDL8TJ3ZuMNCRTSyZcci1hz9qEoezB5pB68cAy1APyyQoQX9J
   9zKeQajMpUy6S5m5HA7K6VvhVgzqsgQ8nI//uRFMY+4jNu8yKG/nPU8ov
   Q==;
X-CSE-ConnectionGUID: 9UdHrdSMRcS49Rbag4wybg==
X-CSE-MsgGUID: z9XkoJEDRsewg4QWI0Q+RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2788820"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2788820"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 21:25:14 -0800
X-CSE-ConnectionGUID: rMNhOOGjTXm0jhs3jPJUIQ==
X-CSE-MsgGUID: lMqH9fEJS6mTUnOBhT2Cpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7534161"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2026 21:25:12 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPCRq-00000000A2x-1JFI;
	Fri, 06 Nov 2026 05:25:10 +0000
Date: Fri, 06 Nov 2026 06:24:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 390/390]
 drivers/mtd/mtdcore.c:955 mtd_otp_nvmem_add() warn: missing unwind goto?
Message-ID: <202611060606.xbU3zu11-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   900d46d1c904d34d7c3eeb0ef2119cffc5a8ab3d
commit: 534fd7770b6ddedc6c6ef6fa724987d3397f9b3b [390/390] mtd: core: Report error if first mtd_otp_size() call fails in mtd_otp_nvmem_add()
:::::: branch date: 31 hours ago
:::::: commit date: 2 years, 5 months ago
config: arm-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060606.xbU3zu11-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060606.xbU3zu11-lkp@intel.com/

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
