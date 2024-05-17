Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB632F30
	for <oe-kbuild@lists.linux.dev>; Fri, 17 May 2024 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715979741; cv=none; b=Qm+XMiRE8BwFrb+trsupMCJY6U0N+H56mJS33J669TI+VFSXB9UAvpf99HNwD0rFygfdFHUZtjUXg+BHNx5z8yz1LvnoEqqiqXQi0/cDJZqOfBaEAdhvJpzSmmoEh2oiAfv6ydFRn5jHvMZVV9vLEmCVjgU9b+4f7IWecgJgNAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715979741; c=relaxed/simple;
	bh=dIAS0CXn9eIEfGUQ20+ZR1ZoQvvU4pzQIIHAsizOf7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HEsVH2hqinamEGqTaSc/guLhZKcUbDzvrzKzDOG9um4OHNPrWu7p5xONIzS3GX9JtwcCrS1EWm+RUDDQgdMPsSFxpQMxYvILx/U26cHWxR4JSgkFURN8JcMCZmsNJcKGs0MmsHBu2kApZSkg4LkWmZmIPn/4B44A1008FpqSdxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1hrRk/q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1hrRk/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715979738; x=1747515738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dIAS0CXn9eIEfGUQ20+ZR1ZoQvvU4pzQIIHAsizOf7w=;
  b=b1hrRk/qH2nWIzrsGL5inOWpCisJLy17baZDDkOGsqbaZWGaf7Mzpu3b
   IfUMZ2vMbxZbZFU6kLjfvl+lxrbfm1fQ2BKBigF53v3/cgA6PZtak4xbt
   aJP6ju+OAU7fZmaG/ImOkLF9eLb244cBlh4bzBlulhmR95yh9zO3xjQIY
   rMLoO5e3j4aB9oDLXM40czFHBzZAyUStCwoClgEQgt4eLYoS5jSWzTfl2
   l0ktzbKhw8FfVc/URm/gtxqB6cDnm/u9geUR4pkmPsf5ebi4YdF2z6T9R
   T+6KNH6gpTDnTDsv9aPyvt+AAZ7Y4/5oiRosK8smcKQblDxa47sugFU09
   A==;
X-CSE-ConnectionGUID: 77WAvsz+RXWCzsnkNHm4Vg==
X-CSE-MsgGUID: aAMHY6/6SqCHIR17bpiY6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="23321245"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="23321245"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 14:01:55 -0700
X-CSE-ConnectionGUID: gN13IiyFQZCAZKoRGW37yg==
X-CSE-MsgGUID: ESt/NPZ2QC+pW2lbgYr33w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="36649521"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 May 2024 14:01:55 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s84i8-00017w-2l;
	Fri, 17 May 2024 21:01:52 +0000
Date: Sat, 18 May 2024 05:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/usb/musb/musb_dsps.c:850:9-34: WARNING: Threaded IRQ with no
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202405180425.PLk75x8W-lkp@intel.com>
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
TO: Grant B Adams <nemith592@gmail.com>
CC: Tony Lindgren <tony@atomide.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ee332c9f12bc5b380e36919cd7d056592a7073f
commit: 2f07592c30e1db498fe198a80e9d36f9d7cce441 usb: musb: dsps: Fix vbus vs tps65217-charger irq conflict
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: mips-randconfig-r052-20240517 (https://download.01.org/0day-ci/archive/20240518/202405180425.PLk75x8W-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405180425.PLk75x8W-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/musb/musb_dsps.c:850:9-34: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +850 drivers/usb/musb/musb_dsps.c

369469a92393d8 Tony Lindgren 2017-02-01  835  
369469a92393d8 Tony Lindgren 2017-02-01  836  static int dsps_setup_optional_vbus_irq(struct platform_device *pdev,
369469a92393d8 Tony Lindgren 2017-02-01  837  					struct dsps_glue *glue)
369469a92393d8 Tony Lindgren 2017-02-01  838  {
369469a92393d8 Tony Lindgren 2017-02-01  839  	int error;
369469a92393d8 Tony Lindgren 2017-02-01  840  
369469a92393d8 Tony Lindgren 2017-02-01  841  	glue->vbus_irq = platform_get_irq_byname(pdev, "vbus");
369469a92393d8 Tony Lindgren 2017-02-01  842  	if (glue->vbus_irq == -EPROBE_DEFER)
369469a92393d8 Tony Lindgren 2017-02-01  843  		return -EPROBE_DEFER;
369469a92393d8 Tony Lindgren 2017-02-01  844  
369469a92393d8 Tony Lindgren 2017-02-01  845  	if (glue->vbus_irq <= 0) {
369469a92393d8 Tony Lindgren 2017-02-01  846  		glue->vbus_irq = 0;
369469a92393d8 Tony Lindgren 2017-02-01  847  		return 0;
369469a92393d8 Tony Lindgren 2017-02-01  848  	}
369469a92393d8 Tony Lindgren 2017-02-01  849  
369469a92393d8 Tony Lindgren 2017-02-01 @850  	error = devm_request_threaded_irq(glue->dev, glue->vbus_irq,
369469a92393d8 Tony Lindgren 2017-02-01  851  					  NULL, dsps_vbus_threaded_irq,
2f07592c30e1db Grant B Adams 2023-08-23  852  					  IRQF_SHARED,
369469a92393d8 Tony Lindgren 2017-02-01  853  					  "vbus", glue);
369469a92393d8 Tony Lindgren 2017-02-01  854  	if (error) {
369469a92393d8 Tony Lindgren 2017-02-01  855  		glue->vbus_irq = 0;
369469a92393d8 Tony Lindgren 2017-02-01  856  		return error;
369469a92393d8 Tony Lindgren 2017-02-01  857  	}
369469a92393d8 Tony Lindgren 2017-02-01  858  	dev_dbg(glue->dev, "VBUS irq %i configured\n", glue->vbus_irq);
369469a92393d8 Tony Lindgren 2017-02-01  859  
369469a92393d8 Tony Lindgren 2017-02-01  860  	return 0;
369469a92393d8 Tony Lindgren 2017-02-01  861  }
369469a92393d8 Tony Lindgren 2017-02-01  862  

:::::: The code at line 850 was first introduced by commit
:::::: 369469a92393d8e365093d44c0df7a7b6430bc8b usb: musb: Add support for optional VBUS irq to dsps glue layer

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
