Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4F528F1
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 04:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731038454; cv=none; b=hmnuJD2VqRljdYYmmZfHkZYPjGSCmKNbRih5QSnxbo09EjwSUJSzYhtVotaxdNtNkV4TTf+uGjirB65fxElzJMmJLfdy/oCFTR0/goe0lX8B01XfpVfMWhdHVVU+kCmV5jzi3upSEiBtRbq1Rm/EKktIvyriUije89QEohTqtpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731038454; c=relaxed/simple;
	bh=6JeHFweXTKn1wCZnJfl5ewPdVBC2xchCSw9f2RZ7CRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rjOskzwMph4tVDG0s2Av2ushIGCtgVx4J/rmVFTiC9/9s6xLSiom1ucLJMcZGrsimP+zZWbiMjZBJpBUgu6KRlKCTdRI1AarUhBfAbEVX245ZkenQCw6t5QYi0xTd/PMJyx+2enkDWgHdxiE07JjSElqWLSSszppsKxCYuhmBsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KChvWCSI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KChvWCSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731038451; x=1762574451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6JeHFweXTKn1wCZnJfl5ewPdVBC2xchCSw9f2RZ7CRw=;
  b=KChvWCSIQutOfDrlryN8dch9FZ7gVej+RTU111N2L+AxpzHTh4PATtJI
   HV1KYZMA64pI3qbx8mHZTw2Cs8Q69qHcMHGNOV3KE+IwfjqqbQ+dFvyFx
   1EZl+7boOUP3v6OOBQC3xFv8GLSAfR6bprucdoLDH9yxHQU0Yh+IIijII
   LV3maNeoEQORVXAfKdEWjvE5aM4raAhzv6GYqP3LiByuZMDwiordp3U+M
   KoOxK8Fmr7Pqy71RgLaUfD9JJDxih/PxcR3dtyOCkMAT+BU5ymrEDmirS
   Me8rhsffKTJOCtTJv2boF9R6b6xfScX2c13D07Kk5+kw+eMlaHnvIxXGd
   A==;
X-CSE-ConnectionGUID: uk+UIWgZRQSf3O1iaGAwRQ==
X-CSE-MsgGUID: is2g6/wdSMij3udQDCSk4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31079888"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31079888"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 20:00:50 -0800
X-CSE-ConnectionGUID: rNHNl97FSICRV+Xjda35UQ==
X-CSE-MsgGUID: Vk0Xb9GLQICdZNkAqRhIIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="90489602"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2024 20:00:48 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9GAv-000qze-1s;
	Fri, 08 Nov 2024 04:00:45 +0000
Date: Fri, 8 Nov 2024 12:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/soc/apple/mailbox.c:292 apple_mbox_get() warn: passing zero
 to 'ERR_PTR'
Message-ID: <202411081103.7IiOcvUp-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   906bd684e4b1e517dd424a354744c5b0aebef8af
commit: c84292d9d253706267889cf2614400712f15d689 soc: apple: mailbox: Rename config symbol to APPLE_MAILBOX
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: sparc-randconfig-r072-20241107 (https://download.01.org/0day-ci/archive/20241108/202411081103.7IiOcvUp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411081103.7IiOcvUp-lkp@intel.com/

smatch warnings:
drivers/soc/apple/mailbox.c:292 apple_mbox_get() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +292 drivers/soc/apple/mailbox.c

6e1457fcad3ff6 Hector Martin 2023-03-14  281  
6e1457fcad3ff6 Hector Martin 2023-03-14  282  struct apple_mbox *apple_mbox_get(struct device *dev, int index)
6e1457fcad3ff6 Hector Martin 2023-03-14  283  {
6e1457fcad3ff6 Hector Martin 2023-03-14  284  	struct of_phandle_args args;
6e1457fcad3ff6 Hector Martin 2023-03-14  285  	struct platform_device *pdev;
6e1457fcad3ff6 Hector Martin 2023-03-14  286  	struct apple_mbox *mbox;
6e1457fcad3ff6 Hector Martin 2023-03-14  287  	int ret;
6e1457fcad3ff6 Hector Martin 2023-03-14  288  
6e1457fcad3ff6 Hector Martin 2023-03-14  289  	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
6e1457fcad3ff6 Hector Martin 2023-03-14  290  					 index, &args);
6e1457fcad3ff6 Hector Martin 2023-03-14  291  	if (ret || !args.np)
6e1457fcad3ff6 Hector Martin 2023-03-14 @292  		return ERR_PTR(ret);
6e1457fcad3ff6 Hector Martin 2023-03-14  293  
6e1457fcad3ff6 Hector Martin 2023-03-14  294  	pdev = of_find_device_by_node(args.np);
6e1457fcad3ff6 Hector Martin 2023-03-14  295  	of_node_put(args.np);
6e1457fcad3ff6 Hector Martin 2023-03-14  296  
6e1457fcad3ff6 Hector Martin 2023-03-14  297  	if (!pdev)
6e1457fcad3ff6 Hector Martin 2023-03-14  298  		return ERR_PTR(EPROBE_DEFER);
6e1457fcad3ff6 Hector Martin 2023-03-14  299  
6e1457fcad3ff6 Hector Martin 2023-03-14  300  	mbox = platform_get_drvdata(pdev);
6e1457fcad3ff6 Hector Martin 2023-03-14  301  	if (!mbox)
6e1457fcad3ff6 Hector Martin 2023-03-14  302  		return ERR_PTR(EPROBE_DEFER);
6e1457fcad3ff6 Hector Martin 2023-03-14  303  
6e1457fcad3ff6 Hector Martin 2023-03-14  304  	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
6e1457fcad3ff6 Hector Martin 2023-03-14  305  		return ERR_PTR(ENODEV);
6e1457fcad3ff6 Hector Martin 2023-03-14  306  
6e1457fcad3ff6 Hector Martin 2023-03-14  307  	return mbox;
6e1457fcad3ff6 Hector Martin 2023-03-14  308  }
6e1457fcad3ff6 Hector Martin 2023-03-14  309  EXPORT_SYMBOL(apple_mbox_get);
6e1457fcad3ff6 Hector Martin 2023-03-14  310  

:::::: The code at line 292 was first introduced by commit
:::::: 6e1457fcad3ff6b1885e64f5e393db5ff5ec2a42 soc: apple: mailbox: Add ASC/M3 mailbox driver

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
