Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECE63B0AD0
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 19:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700863; cv=none; b=WiCO0sBzdxMlnMjgQJCLGMkr7aPUM7IksOknRqZPwF5O+husFAsZZiYOKkDSMghR75Va1ZWd8nh7FRsD07nwm/7pMPpHW3FQJMgxS4gqkAHnAwOunjPCGfGCLVJtvs91QWrQBVxVFIlRaVVRzu6v00LNOBYxZ4+L/pw2xwxjubs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700863; c=relaxed/simple;
	bh=3u6cnX6RcxznhGOcHxLBGOfMhp5USSfSSAPFEEm2ZNs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PSLMRMzGXTI0xqycMk+IO0r3BbssL1Z8/2GLgtV4hf9+3NhGtoc+cNXiTKD+yZPiEff04+AA+KpoUSW4YPkuhQPVkd6SAJn5wENpqJhCjUKzgVnT/cBmSdj/vm3X20xAeqGkQPm1exmtaQ+O9wtx5/o3Bs7cCZ1QOQvGDbf7iJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECRzKjss; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECRzKjss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778700862; x=1810236862;
  h=date:from:to:cc:subject:message-id;
  bh=3u6cnX6RcxznhGOcHxLBGOfMhp5USSfSSAPFEEm2ZNs=;
  b=ECRzKjssl6KZH+lfc1fLlpHbzTelUBTix3yvXcBuGGI5kmGXSITHm+aJ
   BKCHQ33D6IhjjrLTH9Zif3U4RjV2F4gyzo9+ZpcwQaz6Ezb7hDh1b51Cx
   vd3VtU6dqvtO196ligANsSiEfij5nhFm+z4taguJ/9pRNLowWPpW6Y3T+
   1Ns7zdDHOLw9fRAe+mxqxCAPOxTrEL0QReczMm/bTie5FrnW+ugH3CzSZ
   PsDjeT30+VfoKzWIVYRgOAV5Y7vdx2VTLOb56/zaY5LA3n6MLFaDGGuCh
   P4H7W/paEyCIsn8h70AzX+6rsCcQAfO1lR+YNwRz52CRJMqUO18ht74ke
   w==;
X-CSE-ConnectionGUID: Z7Njr7uZSsG0+kitcMxgeg==
X-CSE-MsgGUID: qNMGqhvIRa+oe5TfBlqqJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="82205406"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="82205406"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 12:34:21 -0700
X-CSE-ConnectionGUID: j+EQBjj2SwyOUiO/Uu/t4g==
X-CSE-MsgGUID: Nj4dWI54QdaAkM4bmkNT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238415589"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 May 2026 12:34:18 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNFLV-000000004xZ-2cAx;
	Wed, 13 May 2026 19:34:17 +0000
Date: Thu, 14 May 2026 03:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/boot/video-vesa.c:265 vesa_store_edid() warn:
 '&boot_params.edid_info' 2249568576 can't fit into 65535 'ireg.di'
Message-ID: <202605140321.2diayJ7e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f63dd8ca0dc05a8272bb8155f643c691d29bb11
commit: 7e35fc7ab433683f95cd1e7e397772db995bebf8 video: Make CONFIG_FIRMWARE_EDID generally available
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20260513 (https://download.01.org/0day-ci/archive/20260514/202605140321.2diayJ7e-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7e35fc7ab433 ("video: Make CONFIG_FIRMWARE_EDID generally available")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605140321.2diayJ7e-lkp@intel.com/

New smatch warnings:
arch/x86/boot/video-vesa.c:265 vesa_store_edid() warn: '&boot_params.edid_info' 2249568576 can't fit into 65535 'ireg.di'

Old smatch warnings:
arch/x86/boot/video-vesa.c:43 vesa_probe() warn: '&vginfo' 1087143936 can't fit into 65535 'ireg.di'
arch/x86/boot/video-vesa.c:67 vesa_probe() warn: '&vminfo' 3069423616 can't fit into 65535 'ireg.di'
arch/x86/boot/video-vesa.c:115 vesa_set_mode() warn: '&vminfo' 3069423616 can't fit into 65535 'ireg.di'

vim +265 arch/x86/boot/video-vesa.c

5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  231  
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  232  /*
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  233   * Save EDID information for the kernel; this is invoked, separately,
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  234   * after mode-setting.
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  235   */
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  236  void vesa_store_edid(void)
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  237  {
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  238  #ifdef CONFIG_FIRMWARE_EDID
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  239  	struct biosregs ireg, oreg;
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  240  
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  241  	/* Apparently used as a nonsense token... */
0e96f31ea4249b1 arch/x86/boot/video-vesa.c  Jordan Borgner 2018-10-28  242  	memset(&boot_params.edid_info, 0x13, sizeof(boot_params.edid_info));
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  243  
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  244  	if (vginfo.version < 0x0200)
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  245  		return;		/* EDID requires VBE 2.0+ */
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  246  
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  247  	initregs(&ireg);
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  248  	ireg.ax = 0x4f15;		/* VBE DDC */
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  249  	/* ireg.bx = 0x0000; */		/* Report DDC capabilities */
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  250  	/* ireg.cx = 0;	*/		/* Controller 0 */
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  251  	ireg.es = 0;			/* ES:DI must be 0 by spec */
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  252  	intcall(0x10, &ireg, &oreg);
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  253  
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  254  	if (oreg.ax != 0x004f)
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  255  		return;		/* No EDID */
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  256  
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  257  	/* BH = time in seconds to transfer EDD information */
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  258  	/* BL = DDC level supported */
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  259  
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  260  	ireg.ax = 0x4f15;		/* VBE DDC */
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  261  	ireg.bx = 0x0001;		/* Read EDID */
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  262  	/* ireg.cx = 0; */		/* Controller 0 */
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  263  	/* ireg.dx = 0;	*/		/* EDID block number */
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  264  	ireg.es = ds();
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01 @265  	ireg.di =(size_t)&boot_params.edid_info; /* (ES:)Pointer to block */
cf06de7b9cdd3ef arch/x86/boot/video-vesa.c  H. Peter Anvin 2009-04-01  266  	intcall(0x10, &ireg, &oreg);
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  267  #endif /* CONFIG_FIRMWARE_EDID */
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  268  }
5e8ddcbe8692ca9 arch/i386/boot/video-vesa.c H. Peter Anvin 2007-07-11  269  

:::::: The code at line 265 was first introduced by commit
:::::: cf06de7b9cdd3efee7a59dced1977b3c21d43732 x86, setup: "glove box" BIOS interrupts in the video code

:::::: TO: H. Peter Anvin <hpa@linux.intel.com>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
