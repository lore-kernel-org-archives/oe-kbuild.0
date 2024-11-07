Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114AA1DE2B5
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730969708; cv=none; b=i3Sfq/ci823efrM+ED0M9BMB/O7s93Zoo6+t4FdM0YXaQKvd6wqMdW7rwosUn4uhWHIqm6Tig0c4izGjirglHcEWq3a++gkT7At9N5+LGDmB6QhZmEK6zV3iJ0VRVfeNg3wO/5Ir/x5oA3AYx4rVgCyovoTQ5u6XAk7Ci8QQNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730969708; c=relaxed/simple;
	bh=qtiK4p4NB+/TSCJRg1uQGnSkiv/kDwHzLCj6JEwwP0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXHbBP5tgPTNwE5B+i92QCaEj95eGhFAkUgis4wd4xgX1QFbi85gQ2fMT5VyRccTCo7s2i99Wpyj3rM4GQVqQYki5TFdfUdvzk4mHnLAY9sM098RFjND9+2ZpCaHyY7P7/P62vkQNx8dLneTLdxvD+qKZ5mMu9aXPcTb6qUmjJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mb4ilqFX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mb4ilqFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730969707; x=1762505707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qtiK4p4NB+/TSCJRg1uQGnSkiv/kDwHzLCj6JEwwP0M=;
  b=mb4ilqFXQt3VzCV+MUPZMmQf93azCpdj80Zoq+O+UwsLzUIntGm7wFmB
   7A+G37O2Wi7FPOi9ccR6YLibJJyebNyeENExpqnyy23PQI/LhfXlaeCo1
   3p6ZHxrrCj0ptYg4jxUjHJVhM2NKEd3LbB1yY+7VCdxwSTODbWl2IROfX
   111EnyJIOMLNCVdXs19YRSY9Yed4T8LDbKodZ5gX+abfVXn3lLvSfOxh5
   bWF6JMgiLQwAAFEBDeKChGD9vRqqIxMoLr6Q+hl2Jekm2/aLZmB+PwNKw
   +sry1C0CdiqG2mQdH9YBqZd7cBsp2iG1GOrzhK0+QKkdgz1J2UA2kZsaU
   A==;
X-CSE-ConnectionGUID: 6UgYtqrvQWiX8+CBQI7/EQ==
X-CSE-MsgGUID: fsXdpYC5Rqajoca0cGu2yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30658550"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30658550"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:55:06 -0800
X-CSE-ConnectionGUID: FE5cje3GTwiWyc50Z97zkQ==
X-CSE-MsgGUID: xYMPa3PZRC6KJdFNIOTF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="90113314"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2024 00:55:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8yI9-000q1O-1r;
	Thu, 07 Nov 2024 08:55:01 +0000
Date: Thu, 7 Nov 2024 16:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [conor:gpio-irq-regmap 2/18] drivers/mailbox/mailbox-mpfs.c:255
 mpfs_mbox_syscon_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <202411071659.wRgcOIQB-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq-regmap
head:   d1b7c5558fb6dded2dee2cfebe358de0d93f022e
commit: 6692ff5a8ee2df1c83af1c1d1a0dce7bc947d2a2 [2/18] mailbox: mpfs: support new, syscon based, devicetree configuration
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r072-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071659.wRgcOIQB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411071659.wRgcOIQB-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox-mpfs.c:255 mpfs_mbox_syscon_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +255 drivers/mailbox/mailbox-mpfs.c

83d7b1560810e0 Conor Dooley 2021-06-24  242  
6692ff5a8ee2df Conor Dooley 2024-08-07  243  static inline int mpfs_mbox_syscon_probe(struct mpfs_mbox *mbox, struct platform_device *pdev)
83d7b1560810e0 Conor Dooley 2021-06-24  244  {
6692ff5a8ee2df Conor Dooley 2024-08-07  245  	mbox->control_scb = syscon_regmap_lookup_by_compatible("microchip,mpfs-control-scb");
6692ff5a8ee2df Conor Dooley 2024-08-07  246  	if (IS_ERR(mbox->control_scb))
6692ff5a8ee2df Conor Dooley 2024-08-07  247  		return PTR_ERR(mbox->control_scb);
83d7b1560810e0 Conor Dooley 2021-06-24  248  
6692ff5a8ee2df Conor Dooley 2024-08-07  249  	mbox->sysreg_scb = syscon_regmap_lookup_by_compatible("microchip,mpfs-sysreg-scb");
6692ff5a8ee2df Conor Dooley 2024-08-07  250  	if (IS_ERR(mbox->sysreg_scb))
6692ff5a8ee2df Conor Dooley 2024-08-07  251  		return PTR_ERR(mbox->sysreg_scb);
83d7b1560810e0 Conor Dooley 2021-06-24  252  
6692ff5a8ee2df Conor Dooley 2024-08-07  253  	mbox->mbox_base = devm_platform_ioremap_resource(pdev, 0);
6692ff5a8ee2df Conor Dooley 2024-08-07  254  	if (IS_ERR(mbox->ctrl_base))
6692ff5a8ee2df Conor Dooley 2024-08-07 @255  		return PTR_ERR(mbox->mbox_base);
6692ff5a8ee2df Conor Dooley 2024-08-07  256  
6692ff5a8ee2df Conor Dooley 2024-08-07  257  	return 0;
6692ff5a8ee2df Conor Dooley 2024-08-07  258  }
6692ff5a8ee2df Conor Dooley 2024-08-07  259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
