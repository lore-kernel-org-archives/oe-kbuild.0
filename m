Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4AD18E35F
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 17:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725384688; cv=none; b=XVm26Tebsn5gbkR6GS+ZwVlC9q8E/795Qkaj5Tbg5Cl3k4pxUlQxB1+HM0doYFWOo590BoXLHMOYyCHdsyDPBHKNlpd5/Tt4/FoQngAX6mno3LvQ7vp/6NUKBqLFZJH+lOp937yxmG7O/E/or5CrgxLjNvVQTtN6jydM2FBrDNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725384688; c=relaxed/simple;
	bh=/jlz7+oCYl2vCz73UMM4dA8dOcn5/jHcII646fLdIok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t44Cp65DVeMWWssHC8VJwHjNTsyi927rlng7pAqdNHncLCTIpKAxjciW9K+JjnkvJtsjBzuDe9P1SHndmJy+Fbf6K48YpIMYbQxp7uC/wXQathWyCbOERfWofLSuSINQZ7NxTI+8n++ZUVsSADF1FWYc/ohXNJWnBKijIYH90UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arsunpjF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arsunpjF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725384686; x=1756920686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/jlz7+oCYl2vCz73UMM4dA8dOcn5/jHcII646fLdIok=;
  b=arsunpjF9kk7dmJ6MmGbh9GdHJ1maay/Q32o2118K2pG68HoG1DdJLAq
   Z+u1RMwgIAvsOr1UDW1W7d/hn79vKT5fvaFJcPX98M5v1sCwLFv4U+90m
   +MqX1PMDPeEeZcRfDsrte0JGSIH1vAcQf6fBgy76Ay8HaXTn31h5d2nb/
   zYVA6VyfhOYrFkhV/WVvP9gHVFngKmYRAqDviyIPUS44Z1hYpaqRyaoGo
   6uMcNr7CnEL7TutN76lbCU9dztP4Rc2j2gZcvE0i3sNL2cbs/9QosUNkC
   dFbI+MrBR3SH+R3kR7GeEwcsp4wVL96bLLv8dn/30Gy/SWs2DfXms58Ja
   w==;
X-CSE-ConnectionGUID: oYuOs3bTRX6us5L3rIjkwg==
X-CSE-MsgGUID: LyL3sU9hReKnnT3sz47WBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23865296"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23865296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 10:31:25 -0700
X-CSE-ConnectionGUID: TSQchTBqREi0mzYBNtCyQA==
X-CSE-MsgGUID: VMNNt2OzTaKipIbtJZNDkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="64966750"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Sep 2024 10:31:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slXNB-0006y4-0V;
	Tue, 03 Sep 2024 17:31:21 +0000
Date: Wed, 4 Sep 2024 01:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 268/269] drivers/iio/proximity/aw96103.c:475
 aw96103_reg_version_comp() warn: iterator 'i' not incremented
Message-ID: <202409040114.Rpkwt3gm-lkp@intel.com>
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
TO: shuaijie wang <wangshuaijie@awinic.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   fa533227a89a1d8509a1ad4e93a35d683a77aa23
commit: a369e1d1a10790f63b4b858dc74b53730146754f [268/269] iio: proximity: aw96103: Add support for aw96103/aw96105 proximity sensor
:::::: branch date: 23 hours ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r072-20240901 (https://download.01.org/0day-ci/archive/20240904/202409040114.Rpkwt3gm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409040114.Rpkwt3gm-lkp@intel.com/

smatch warnings:
drivers/iio/proximity/aw96103.c:475 aw96103_reg_version_comp() warn: iterator 'i' not incremented

vim +/i +475 drivers/iio/proximity/aw96103.c

a369e1d1a10790f shuaijie wang 2024-08-27  456  
a369e1d1a10790f shuaijie wang 2024-08-27  457  static int aw96103_reg_version_comp(struct aw96103 *aw96103,
a369e1d1a10790f shuaijie wang 2024-08-27  458  				    struct aw_bin *aw_bin)
a369e1d1a10790f shuaijie wang 2024-08-27  459  {
a369e1d1a10790f shuaijie wang 2024-08-27  460  	u32 blfilt1_data, fw_ver;
a369e1d1a10790f shuaijie wang 2024-08-27  461  	unsigned char i;
a369e1d1a10790f shuaijie wang 2024-08-27  462  	int ret;
a369e1d1a10790f shuaijie wang 2024-08-27  463  
a369e1d1a10790f shuaijie wang 2024-08-27  464  	ret = regmap_read(aw96103->regmap, AW96103_REG_FWVER2, &fw_ver);
a369e1d1a10790f shuaijie wang 2024-08-27  465  	if (ret)
a369e1d1a10790f shuaijie wang 2024-08-27  466  		return ret;
a369e1d1a10790f shuaijie wang 2024-08-27  467  	/*
a369e1d1a10790f shuaijie wang 2024-08-27  468  	 * If the chip version is AW96103A and the loaded register
a369e1d1a10790f shuaijie wang 2024-08-27  469  	 * configuration file is for AW96103, special handling of the
a369e1d1a10790f shuaijie wang 2024-08-27  470  	 * AW96103_REG_BLRSTRNG_CH0 register is required.
a369e1d1a10790f shuaijie wang 2024-08-27  471  	 */
a369e1d1a10790f shuaijie wang 2024-08-27  472  	if ((fw_ver != AW96103A) || (aw_bin->chip_type[7] != '\0'))
a369e1d1a10790f shuaijie wang 2024-08-27  473  		return 0;
a369e1d1a10790f shuaijie wang 2024-08-27  474  
a369e1d1a10790f shuaijie wang 2024-08-27 @475  	for (i = 0; i < aw96103->max_channels; i++) {
a369e1d1a10790f shuaijie wang 2024-08-27  476  		ret = regmap_read(aw96103->regmap,
a369e1d1a10790f shuaijie wang 2024-08-27  477  			AW96103_REG_BLFILT_CH0 + (AW96103_BLFILT_CH_STEP * i),
a369e1d1a10790f shuaijie wang 2024-08-27  478  			&blfilt1_data);
a369e1d1a10790f shuaijie wang 2024-08-27  479  		if (ret)
a369e1d1a10790f shuaijie wang 2024-08-27  480  			return ret;
a369e1d1a10790f shuaijie wang 2024-08-27  481  		if (FIELD_GET(AW96103_BLERRTRIG_MASK, blfilt1_data) != 1)
a369e1d1a10790f shuaijie wang 2024-08-27  482  			return 0;
a369e1d1a10790f shuaijie wang 2024-08-27  483  
a369e1d1a10790f shuaijie wang 2024-08-27  484  		return regmap_update_bits(aw96103->regmap,
a369e1d1a10790f shuaijie wang 2024-08-27  485  			AW96103_REG_BLRSTRNG_CH0 + (AW96103_BLFILT_CH_STEP * i),
a369e1d1a10790f shuaijie wang 2024-08-27  486  			AW96103_BLRSTRNG_MASK, 1 << i);
a369e1d1a10790f shuaijie wang 2024-08-27  487  	}
a369e1d1a10790f shuaijie wang 2024-08-27  488  
a369e1d1a10790f shuaijie wang 2024-08-27  489  	return 0;
a369e1d1a10790f shuaijie wang 2024-08-27  490  }
a369e1d1a10790f shuaijie wang 2024-08-27  491  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
