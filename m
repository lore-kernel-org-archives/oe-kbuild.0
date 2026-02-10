Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD21F2E282B
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770712174; cv=none; b=o0pfCVqmX/Y0ql9Xmy1uRUpi2rm8cpS7V86v+xlE9EPLHIossS/opr8tthTSmIAHwXpx3w2t2U7mCFHi9ZFhC9ea7qWXWWRwY/OgBtOHohEYr0ADPVRpX+BQMxwqlw8cM3hHVvN3W/8oAwGtO8djroQiG2atq2d/7aVT/x5pL60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770712174; c=relaxed/simple;
	bh=cFJ90aazEFA1yhxFjRs6xW1OjJiPbhZVuDMVlfE6Gmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NrP9FnsP/aeZFivtGHNWHJ2r9Hdf/tQkjtZ9ygLXFvCDxlui6x2+dISh5fHYYlsrqXiE0yK1dkS3lSUrol9Cb+AiI4G4W79j7bPWEUc/NwKF7ADNSug4ncQvVlk1u/e9IusRhdWNo4IrsUWEb1Cv4Dd3Qj3UbXVZXYMTQnfL9mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ldr7z+qb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ldr7z+qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770712173; x=1802248173;
  h=date:from:to:cc:subject:message-id;
  bh=cFJ90aazEFA1yhxFjRs6xW1OjJiPbhZVuDMVlfE6Gmw=;
  b=Ldr7z+qbRD0E8vMXB7aA/OfEHfLXOBL3SUtsKhP/VAD0ZBH2QVGYcaso
   sAbugwpNLh7gXExQBbgjlqW0NeaV63B6x7C/BEPwz4A9x9Yp7XEwWBSb4
   Hl4uzoTLpGluG0EVlsXYso/hOp1T38OQK5+3+jR8pxiP2oaXnSm3likFR
   cBWsG9hUw/u5V+AYhk2NNgAxf8MLK8TqKbmO5x1sk1I24DjoLXB732cLo
   Hpxk1tAoBGs5aOF2ZHBlYm0VsbALMkhvOOG0RT5nIWThuPalTnMyIQRYJ
   v2oECjA28xLVortDco8zr3LCCbSafVlEbmfYVtoQtWGAOpRGC8fizgkLz
   Q==;
X-CSE-ConnectionGUID: ky85U0i3QG+VHBiQLhtbSg==
X-CSE-MsgGUID: 0bVCAds+RDuRoVrJnZ9vsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82157417"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82157417"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:29:33 -0800
X-CSE-ConnectionGUID: pSagIJt0TLOmunMSZdHqSA==
X-CSE-MsgGUID: 1aHKa2NwQO6oU5A7cfD2vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211380529"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 00:29:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpj7g-00000000oom-2DTU;
	Tue, 10 Feb 2026 08:29:28 +0000
Date: Tue, 10 Feb 2026 16:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rafael-pm:bleeding-edge 310/334]
 drivers/platform/x86/classmate-laptop.c:1025 cmpc_ipml_probe() warn:
 'ipml->rf' is an error pointer or valid
Message-ID: <202602101600.KhGfxuWT-lkp@intel.com>
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
head:   8711f3ee7e5efcf1b795c80496b0fb68713e153a
commit: ccfa4340eacb8b6c4845695707151a26c5b73f0e [310/334] platform/x86: classmate-laptop: Convert ipml driver to a platform one
:::::: branch date: 12 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-161-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101600.KhGfxuWT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602101600.KhGfxuWT-lkp@intel.com/

smatch warnings:
drivers/platform/x86/classmate-laptop.c:1025 cmpc_ipml_probe() warn: 'ipml->rf' is an error pointer or valid

vim +1025 drivers/platform/x86/classmate-laptop.c

d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27   995  
ccfa4340eacb8b6 Rafael J. Wysocki             2026-02-09   996  static int cmpc_ipml_probe(struct platform_device *pdev)
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27   997  {
ccfa4340eacb8b6 Rafael J. Wysocki             2026-02-09   998  	acpi_handle handle = ACPI_HANDLE(&pdev->dev);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27   999  	struct ipml200_dev *ipml;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1000  	struct backlight_properties props;
ccfa4340eacb8b6 Rafael J. Wysocki             2026-02-09  1001  	int retval;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1002  
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1003  	ipml = kmalloc(sizeof(*ipml), GFP_KERNEL);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1004  	if (ipml == NULL)
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1005  		return -ENOMEM;
529aa8cb0a59367 Thadeu Lima de Souza Cascardo 2009-12-21  1006  
a19a6ee6cad2b20 Matthew Garrett               2010-02-17  1007  	memset(&props, 0, sizeof(struct backlight_properties));
bb7ca747f8d6243 Matthew Garrett               2011-03-22  1008  	props.type = BACKLIGHT_PLATFORM;
a19a6ee6cad2b20 Matthew Garrett               2010-02-17  1009  	props.max_brightness = 7;
ccfa4340eacb8b6 Rafael J. Wysocki             2026-02-09  1010  	ipml->bd = backlight_device_register("cmpc_bl", &pdev->dev,
ccfa4340eacb8b6 Rafael J. Wysocki             2026-02-09  1011  					     handle, &cmpc_bl_ops,
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1012  					     &props);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1013  	if (IS_ERR(ipml->bd)) {
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1014  		retval = PTR_ERR(ipml->bd);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1015  		goto out_bd;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1016  	}
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1017  
ccfa4340eacb8b6 Rafael J. Wysocki             2026-02-09  1018  	ipml->rf = rfkill_alloc("cmpc_rfkill", &pdev->dev, RFKILL_TYPE_WLAN,
ccfa4340eacb8b6 Rafael J. Wysocki             2026-02-09  1019  				&cmpc_rfkill_ops, handle);
b95d13eaf3d4ea0 Thadeu Lima de Souza Cascardo 2010-06-09  1020  	/*
b95d13eaf3d4ea0 Thadeu Lima de Souza Cascardo 2010-06-09  1021  	 * If RFKILL is disabled, rfkill_alloc will return ERR_PTR(-ENODEV).
b95d13eaf3d4ea0 Thadeu Lima de Souza Cascardo 2010-06-09  1022  	 * This is OK, however, since all other uses of the device will not
3b329cfec7522b5 Bhaskar Chowdhury             2021-03-17  1023  	 * dereference it.
b95d13eaf3d4ea0 Thadeu Lima de Souza Cascardo 2010-06-09  1024  	 */
b95d13eaf3d4ea0 Thadeu Lima de Souza Cascardo 2010-06-09 @1025  	if (ipml->rf) {
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1026  		retval = rfkill_register(ipml->rf);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1027  		if (retval) {
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1028  			rfkill_destroy(ipml->rf);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1029  			ipml->rf = NULL;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1030  		}
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1031  	}
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1032  
ccfa4340eacb8b6 Rafael J. Wysocki             2026-02-09  1033  	platform_set_drvdata(pdev, ipml);
529aa8cb0a59367 Thadeu Lima de Souza Cascardo 2009-12-21  1034  	return 0;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1035  
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1036  out_bd:
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1037  	kfree(ipml);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1038  	return retval;
529aa8cb0a59367 Thadeu Lima de Souza Cascardo 2009-12-21  1039  }
529aa8cb0a59367 Thadeu Lima de Souza Cascardo 2009-12-21  1040  

:::::: The code at line 1025 was first introduced by commit
:::::: b95d13eaf3d4ea093aba95c7f615f3b10708a2c4 classmate-laptop: should check for NULL as retval for rfkill_alloc

:::::: TO: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
:::::: CC: Matthew Garrett <mjg@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
