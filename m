Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5E91D6AA
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 04:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771217845; cv=none; b=W+ZauauxWckrti3aAbRA5NdskyJHC1JIYkBe9jcJuJpdeDmToqbWoCTYQgKF4Vi2vTb4CY4TBtLTfG+eXrQ5K9g5MsjTgWXpQO04U6e76cCehZ0/J1WdNdTYothZsqU9CDCjWqjURGGE7aFUYBKlykFFK8IAuAlADuVke5ZelhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771217845; c=relaxed/simple;
	bh=frPiDO4+y4GedFT9rw7lXMQvsEvN12aZzJMLr3odD4Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M5GzfZ08PVSHPmjxYoeKWeqKHKOmUEIrcZpjkydS809L+3HqRZCB5zyz0Jd+E3NShAAe/NZ99VKER0kR37t4V8tZIjkR7NNfo4lNiRggpwn0ijrKWMvCfbhIyV1A773LC7monOw/Vr28V2o4RkV2gHxR6zzoSJGMBg0uGj4zK9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JudSgljp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JudSgljp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771217843; x=1802753843;
  h=date:from:to:cc:subject:message-id;
  bh=frPiDO4+y4GedFT9rw7lXMQvsEvN12aZzJMLr3odD4Y=;
  b=JudSgljppOkDQGO9XvNSaWxXB1SwLi9guIX8vnv2CkJtV5Edr6ZwB46k
   KCoNw//x89bCD6uY4yRgdJlqBwg5CgNZ4RWkMTDtzGr/C1IAYTX/AFdLw
   bfT7obM3WwID7fMROkSNhwZQZujiAdK1MBsHggXdR9/G87b1XqFqGNNhR
   ASarA6ByFkOvKAYKNv/r1xjyBJREWktaaeavePj48WPD2DXnFct6MkYC6
   WywQUmp04XwrhHte+Mstcr1+mYR6FNM849UDxeyMx5g7VB9SjtQrCz3ka
   3QuxZJ0S0dq+ns+RPcR2TK/9pDTg2pcIH+92TK0pdSGdza2GeiujKdwUP
   Q==;
X-CSE-ConnectionGUID: +EVmo1VMRbSeQk4EBbtT0Q==
X-CSE-MsgGUID: jovBTdJdSnWnMa53nJmT7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="82628335"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="82628335"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 20:57:23 -0800
X-CSE-ConnectionGUID: 8+Qq7vd/TxKy4WjMCCMacw==
X-CSE-MsgGUID: oe1bogduRYe4Re7H5Iqd/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="213592841"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Feb 2026 20:57:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrqff-00000000zPY-1UJb;
	Mon, 16 Feb 2026 04:57:19 +0000
Date: Mon, 16 Feb 2026 12:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rafael-pm:bleeding-edge 78/113]
 drivers/platform/x86/toshiba_acpi.c:3574 toshiba_acpi_probe() warn:
 '&dev->miscdev' from misc_register() not released on lines: 3574.
Message-ID: <202602161229.GSpFNx88-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-acpi@vger.kernel.org
CC: linux-pm@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   3cf2b08de92fc53cbd5632a8d47194932da78534
commit: d5d26ca09253be8ea790d4926e727caaad8c5b81 [78/113] platform/x86: toshiba_acpi: Convert ACPI driver to a platform one
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-r072-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161229.GSpFNx88-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602161229.GSpFNx88-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/toshiba_acpi.c:3574 toshiba_acpi_probe() warn: '&dev->miscdev' from misc_register() not released on lines: 3574.

Old smatch warnings:
drivers/platform/x86/toshiba_acpi.c:2707 toshiba_acpi_setup_wwan_rfkill() warn: 'dev->wwan_rfk' is an error pointer or valid

vim +3574 drivers/platform/x86/toshiba_acpi.c

c727ba4cd95a12 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-09-02  3532  
6873f46a630c48 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-11-23  3533  	toshiba_wwan_available(dev);
2fdde83443aa84 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-11-23  3534  	if (dev->wwan_supported)
2fdde83443aa84 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-11-23  3535  		toshiba_acpi_setup_wwan_rfkill(dev);
6873f46a630c48 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-11-23  3536  
763ff32f19442b drivers/platform/x86/toshiba_acpi.c Azael Avalos      2016-01-25  3537  	toshiba_cooling_method_available(dev);
763ff32f19442b drivers/platform/x86/toshiba_acpi.c Azael Avalos      2016-01-25  3538  
89655fbb396aff drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-09-02  3539  	toshiba_battery_charge_mode_available(dev);
89655fbb396aff drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-09-02  3540  
0409cbced3c9ab drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-07-31  3541  	print_supported_features(dev);
0409cbced3c9ab drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-07-31  3542  
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-03-25  3543  	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-03-25  3544  				 &toshiba_attr_group);
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-03-25  3545  	if (ret) {
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-03-25  3546  		dev->sysfs_created = 0;
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-03-25  3547  		goto error;
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-03-25  3548  	}
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-03-25  3549  	dev->sysfs_created = !ret;
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-03-25  3550  
6b0b03b1b10252 drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-02-09  3551  	ret = acpi_dev_install_notify_handler(acpi_dev, ACPI_DEVICE_NOTIFY,
6b0b03b1b10252 drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-02-09  3552  					      toshiba_acpi_notify, dev);
6b0b03b1b10252 drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-02-09  3553  	if (ret) {
6b0b03b1b10252 drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-02-09  3554  		dev->notify_handler_installed = 0;
6b0b03b1b10252 drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-02-09  3555  		goto error;
6b0b03b1b10252 drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-02-09  3556  	}
6b0b03b1b10252 drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-02-09  3557  	dev->notify_handler_installed = 1;
6b0b03b1b10252 drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-02-09  3558  
36d03f93558c66 drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-09-20  3559  	create_toshiba_proc_entries(dev);
36d03f93558c66 drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-09-20  3560  
29cd293f9f8cd7 drivers/platform/x86/toshiba_acpi.c Seth Forshee      2012-01-18  3561  	toshiba_acpi = dev;
29cd293f9f8cd7 drivers/platform/x86/toshiba_acpi.c Seth Forshee      2012-01-18  3562  
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-09-02  3563  	/*
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-09-02  3564  	 * As the battery hook relies on the static variable toshiba_acpi being
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-09-02  3565  	 * set, this must be done after toshiba_acpi is assigned.
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-09-02  3566  	 */
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-09-02  3567  	if (dev->battery_charge_mode_supported)
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-09-02  3568  		battery_hook_register(&battery_hook);
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-09-02  3569  
c41a40c58b623f drivers/acpi/toshiba_acpi.c         philipl@overt.org 2008-08-30  3570  	return 0;
135740de77641b drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-09-20  3571  
135740de77641b drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-09-20  3572  error:
d5d26ca09253be drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-02-09  3573  	toshiba_acpi_remove(pdev);
135740de77641b drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-09-20 @3574  	return ret;
135740de77641b drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-09-20  3575  }
135740de77641b drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-09-20  3576  

:::::: The code at line 3574 was first introduced by commit
:::::: 135740de77641b4180c8a1f19abcfcd5e4351b15 toshiba_acpi: Convert to use acpi_driver

:::::: TO: Seth Forshee <seth.forshee@canonical.com>
:::::: CC: Matthew Garrett <mjg@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
