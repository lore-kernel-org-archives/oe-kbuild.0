Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9C21D591
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Jul 2026 00:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784076131; cv=none; b=rVYZeBc5JapEYdhjFyxPI1sI7rcU4KWvOJ6qZ4L+8ANijGcF5hBchFO2ZQC+FTHEWSBOxfRjtxn/yEmoXhEea/HkeDGb/R6JYm/f0w/KbGhPOwBXPKeuW0C4sAgP34/uguhz6TcSwNRGn/uCbeqyi7RNg58oFD74PjY6KDQd2sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784076131; c=relaxed/simple;
	bh=2GWb53VK+BLYzUtX6Y8xLkGkowt5fE1/ExF+cc97pKk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NY0Lhyfk2BdkoIZn/Y0IfJ7hpPwbb4z2kkx0VVLvv0X8ZbJL3WywIAlqefpIykp81b/Z6QeZG3LBOg4o2HOopjBfMEOx3qgfTe+1Njq5yn27+He4038iM6MEmC6kwpyFrU9eym+eAuCCgUXjrL8tIageoxL06+A49d8npZE+aws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7ZqgkZY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7ZqgkZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784076126; x=1815612126;
  h=date:from:to:cc:subject:message-id;
  bh=2GWb53VK+BLYzUtX6Y8xLkGkowt5fE1/ExF+cc97pKk=;
  b=G7ZqgkZYsqfLK3g7dFtStiZXvo83EKjgR50D3gnNUQF5NyvpTf61HT3i
   NE7WXxQaI7lBEBWRltvJxMoaA0FI0GxhvhOUJUvyF6Jwe15g0duyoDkGg
   T8U6fTUVHey4DHGOVlXVf8fuHru9wbkPdO3oSEUV0FSPz/fI6a2h1Iaof
   FWjgchrPErozL2eIaETrbAK8Pp8Qi6ecpU+CuTPDxFOF1EBsvqIbtuy8I
   zBYYQumcP7eBFc7R2Ab7FBve7xRxVUrKz4Q3iWofjXunQfKuYyF+eepId
   xr6NeACCSWmrBj98zvDij6D8gz2DqENjpDvoXANnhUCQA/yp47UDHCXh2
   A==;
X-CSE-ConnectionGUID: pXnZuTEOQOOXzwIW14lOpw==
X-CSE-MsgGUID: vkjsNUFNRy6kj7McaF+Yqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110253434"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="110253434"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 17:42:05 -0700
X-CSE-ConnectionGUID: OJDBr0zORZqo0gHbXxbLXA==
X-CSE-MsgGUID: SoYM4qIjTFyIirfT3PWsgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="286083853"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Jul 2026 17:42:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjnhH-00000000NAx-3Nqw;
	Wed, 15 Jul 2026 00:42:00 +0000
Date: Wed, 15 Jul 2026 08:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3984/6263] drivers/media/i2c/imx678.c:905
 imx678_write_common() error: buffer overflow 'link_freqs_reg_value' 8 <= 64
Message-ID: <202607150800.r5xDoCDS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jai Luthra <jai.luthra@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
commit: bf40cc53b1e00c312046f6dd88e9054bc91865af [3984/6263] media: i2c: imx678: Add driver for Sony IMX678
:::::: branch date: 9 hours ago
:::::: commit date: 6 days ago
config: loongarch-randconfig-r073-20260714 (https://download.01.org/0day-ci/archive/20260715/202607150800.r5xDoCDS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607150800.r5xDoCDS-lkp@intel.com/

New smatch warnings:
drivers/media/i2c/imx678.c:905 imx678_write_common() error: buffer overflow 'link_freqs_reg_value' 8 <= 64
drivers/media/i2c/imx678.c:1152 imx678_init_controls() error: buffer overflow 'min_hmax_4lane' 8 <= 64

Old smatch warnings:
arch/loongarch/include/asm/atomic.h:51 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/link_freqs_reg_value +905 drivers/media/i2c/imx678.c

bf40cc53b1e00c Jai Luthra 2026-07-03  895  
bf40cc53b1e00c Jai Luthra 2026-07-03  896  static int imx678_write_common(struct imx678 *imx678)
bf40cc53b1e00c Jai Luthra 2026-07-03  897  {
bf40cc53b1e00c Jai Luthra 2026-07-03  898  	int ret = 0;
bf40cc53b1e00c Jai Luthra 2026-07-03  899  
bf40cc53b1e00c Jai Luthra 2026-07-03  900  	cci_multi_reg_write(imx678->cci, common_regs, ARRAY_SIZE(common_regs),
bf40cc53b1e00c Jai Luthra 2026-07-03  901  			    &ret);
bf40cc53b1e00c Jai Luthra 2026-07-03  902  
bf40cc53b1e00c Jai Luthra 2026-07-03  903  	cci_write(imx678->cci, IMX678_REG_INCK_SEL, imx678->inck_sel_val, &ret);
bf40cc53b1e00c Jai Luthra 2026-07-03  904  	cci_write(imx678->cci, IMX678_REG_DATARATE_SEL,
bf40cc53b1e00c Jai Luthra 2026-07-03 @905  		  link_freqs_reg_value[__ffs(imx678->link_freq_bitmap)], &ret);
bf40cc53b1e00c Jai Luthra 2026-07-03  906  	cci_write(imx678->cci, IMX678_REG_LANEMODE, imx678->lane_mode, &ret);
bf40cc53b1e00c Jai Luthra 2026-07-03  907  
bf40cc53b1e00c Jai Luthra 2026-07-03  908  	cci_write(imx678->cci, IMX678_REG_INTERFACE_SEL, IMX678_INTERFACE_2L_4L,
bf40cc53b1e00c Jai Luthra 2026-07-03  909  		  &ret);
bf40cc53b1e00c Jai Luthra 2026-07-03  910  
bf40cc53b1e00c Jai Luthra 2026-07-03  911  	return ret;
bf40cc53b1e00c Jai Luthra 2026-07-03  912  }
bf40cc53b1e00c Jai Luthra 2026-07-03  913  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
