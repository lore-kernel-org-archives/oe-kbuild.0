Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DAF8831
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 20:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732653123; cv=none; b=FGPlQfInxDHW42YfeBBdr3qzbX22E8dFvANevr+9rx5SUXYTCnxp1eJCeNFhL3CgGxzMOLfTE090RF+8v58xsvf7pfxRi2SvcN3j7TeZ8aaNxI79DImZu0DOWiVRXdUosfC6wzLn4KB39CtR9WxA3aiy087FlgSDSliUdQ+8hkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732653123; c=relaxed/simple;
	bh=kwlee8Ruq0ovHbcQ28MaX7sbzndkyjdsAWPykkpbHvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cTaEmeWAtAnwxFFNXwt5G/fnf1XMPL6xEZBb8V92+A/2LEkS4DkpeMZmPtHw5HlBUwJoc2AQElDEUfRMO7mUkMqRtgHfLp8OPudPTZZaZdLFOB0yGpWHOIqkk5LxbZKUJ8gMyMp0ckvvNGwmhdtO/83BX+aO2McpEyDbVYRFkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzTUQjpN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzTUQjpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732653121; x=1764189121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kwlee8Ruq0ovHbcQ28MaX7sbzndkyjdsAWPykkpbHvE=;
  b=hzTUQjpNNgSYHaR2srVbab6Rg2fk4KD3KHFCZU/bTSu5P3wNGO2/B7zP
   280gk8J+z/jgB34hfPbosGeWUs6zOjidegDimvL8KNGWCVfsBg8p9yIcl
   loNemm9c+m09/A2tisKgvtqqUb+cx8cZhx2k4ANHtHUCg2ESOMiVA0+u8
   rsl6PdmuoIb1Olq6a7IYDpsrb89J5Xk5c6oqa7DHK9rqwxpJDsNeJoC/O
   FsnzdZOt4zeoVmZm6hCuk4uTvPCAq7S+u5Pwxh3QRyvi6m1OKXeW3eXWa
   8qJzcuooXBAwDx07dMmW+lzY5GstJEGzr2VkvRx4gIT/LzkvyBWEPMX9M
   Q==;
X-CSE-ConnectionGUID: 5ppO50umRA2eRBjt1m5NDw==
X-CSE-MsgGUID: Z3hdh+LxRwGbDelUH+a5hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36626721"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="36626721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 12:32:01 -0800
X-CSE-ConnectionGUID: Escx72T/SrirZQR2J/GnYg==
X-CSE-MsgGUID: mGwUIS7FT5W+/u+KPfHxtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="122562905"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2024 12:31:59 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG2E1-0007Wx-0J;
	Tue, 26 Nov 2024 20:31:57 +0000
Date: Wed, 27 Nov 2024 04:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mailbox/mailbox-mpfs.c:255 mpfs_mbox_syscon_probe() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202411270409.cWyrOSWm-lkp@intel.com>
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
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: a4123ffab9ece0c2d3d5c460724d49c4051fd279 mailbox: mpfs: support new, syscon based, devicetree configuration
date:   2 days ago
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-r072-20241125 (https://download.01.org/0day-ci/archive/20241127/202411270409.cWyrOSWm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411270409.cWyrOSWm-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox-mpfs.c:255 mpfs_mbox_syscon_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +255 drivers/mailbox/mailbox-mpfs.c

83d7b1560810e0 Conor Dooley 2021-06-24  242  
a4123ffab9ece0 Conor Dooley 2024-10-02  243  static inline int mpfs_mbox_syscon_probe(struct mpfs_mbox *mbox, struct platform_device *pdev)
83d7b1560810e0 Conor Dooley 2021-06-24  244  {
a4123ffab9ece0 Conor Dooley 2024-10-02  245  	mbox->control_scb = syscon_regmap_lookup_by_compatible("microchip,mpfs-control-scb");
a4123ffab9ece0 Conor Dooley 2024-10-02  246  	if (IS_ERR(mbox->control_scb))
a4123ffab9ece0 Conor Dooley 2024-10-02  247  		return PTR_ERR(mbox->control_scb);
83d7b1560810e0 Conor Dooley 2021-06-24  248  
a4123ffab9ece0 Conor Dooley 2024-10-02  249  	mbox->sysreg_scb = syscon_regmap_lookup_by_compatible("microchip,mpfs-sysreg-scb");
a4123ffab9ece0 Conor Dooley 2024-10-02  250  	if (IS_ERR(mbox->sysreg_scb))
a4123ffab9ece0 Conor Dooley 2024-10-02  251  		return PTR_ERR(mbox->sysreg_scb);
83d7b1560810e0 Conor Dooley 2021-06-24  252  
a4123ffab9ece0 Conor Dooley 2024-10-02  253  	mbox->mbox_base = devm_platform_ioremap_resource(pdev, 0);
a4123ffab9ece0 Conor Dooley 2024-10-02  254  	if (IS_ERR(mbox->ctrl_base))
a4123ffab9ece0 Conor Dooley 2024-10-02 @255  		return PTR_ERR(mbox->mbox_base);
a4123ffab9ece0 Conor Dooley 2024-10-02  256  
a4123ffab9ece0 Conor Dooley 2024-10-02  257  	return 0;
a4123ffab9ece0 Conor Dooley 2024-10-02  258  }
a4123ffab9ece0 Conor Dooley 2024-10-02  259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
