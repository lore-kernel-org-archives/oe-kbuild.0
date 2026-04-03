Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC53626A08F
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205962; cv=none; b=N8CJsfZzGS4A2d4miH1i2+Mh9j3AaNY44hFeiqcIQabOhRnIkDdNY1RTg5ULHEfsDV4V9WBf/Qi9FImuE+v1cvAazsIuEvfBS2tNl1iCL9KG2GSMxfp3u7zlpfEuCEjPS3SfjNjUAlkJ4QD+ZXHernoPA40ewXoEwzq+sOgf8T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205962; c=relaxed/simple;
	bh=yHJsNyOrv3re05OBs4eZ3ES0iJ8N1h7YFxtJbzpofx0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AqDMWFJ1jr+UTR4sDx+4hiKvnorIG5exAcevRHXLaBy7tseIzrvfdrWhODnowKo4q0WhPETUj4p/uO2NvDCWgE0mNiA+bgDbtDkkmQLR+oRzfHToxZPDuPSRf378xIDpJaXcAzgtM/S/8LRIsgQXeh6xMA5WFZuzh3kOJLHKIf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9YTpeWM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9YTpeWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205961; x=1806741961;
  h=date:from:to:cc:subject:message-id;
  bh=yHJsNyOrv3re05OBs4eZ3ES0iJ8N1h7YFxtJbzpofx0=;
  b=M9YTpeWMQ3dV3x6GRl9BP7vI/8Cu+0BtDz9oswuGOPgu4TbR+AEZHjWJ
   jzm1/PwP87GOMaBHCv8H/680/TI0ZzaYd9cOXnDKLTQy0AK3tWVSbHNF7
   O7yVH2ql6NinDGoMryqUCJAqIJ/XEKnTFK6bgF3mA6ei6s8irLSQNgqb/
   OCRFIEarLH+8obHm7EOFQ2/vgbLXUJiJeNLDgTyf+jGZTz6FmcrUVhEVj
   yrqGsYeEoYSDbO7Isruv5G87q836n6naJxSc3/cIoQfEcQTkM70SM7s0z
   i4NP3zA4wY0wUv2c6JXbOwd90+czSLA+aQuYbjnn8zoeLYBhAFYcvJU8D
   Q==;
X-CSE-ConnectionGUID: m7n4PiZwQVK9fiSvb9ud4A==
X-CSE-MsgGUID: psZ2WsMhQyOpM0nsGd9XFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889027"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889027"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:00 -0700
X-CSE-ConnectionGUID: yPIxRAVISkCLSm6pApH+fQ==
X-CSE-MsgGUID: RDGx9nXFSneHT08vNBTaBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368996"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-00000000167-2EpF;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 03 Apr 2026 16:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 8/8] drivers/mtd/mtdcore.c:955
 mtd_otp_nvmem_add() warn: missing unwind goto?
Message-ID: <202604031047.U9XDWZqI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b5e515a3e6a73395e13127a3a8172e77da3d9b30
commit: 534fd7770b6ddedc6c6ef6fa724987d3397f9b3b [8/8] mtd: core: Report error if first mtd_otp_size() call fails in mtd_otp_nvmem_add()
:::::: branch date: 28 hours ago
:::::: commit date: 1 year, 10 months ago
config: i386-randconfig-141-20260402 (https://download.01.org/0day-ci/archive/20260403/202604031047.U9XDWZqI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604031047.U9XDWZqI-lkp@intel.com/

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
