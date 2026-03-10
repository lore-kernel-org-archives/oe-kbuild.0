Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588EB36493E
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178646; cv=none; b=KFdQag5BAwXiJ/oN6v8mtc8ZDB4L2xp81p2E4S7mzMBwj+9Xec4/D0/D3ILXE5ZDypdphW8yoIE7fNEIj2RNw6H0e+OCNQbG+91BJe0LZqHpcpEzW9+GAMmrat2Njnv7EmHZVqOuh5gsCds04/JLWfpRJZ1WhIr/TPzFG5TlQzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178646; c=relaxed/simple;
	bh=KJaVpRIPw/cCP/IOeRHSBEEsFqTJY/0hrOr6l4MVdbQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fJ05ge1ko2UZCzjSTYQJ2kqq5Q1hhpcrsTPPjVOU7LmcoNJE4UdIA3aTkIu2+tOuAIVox6GBRikTCbKYlMnwqvZlUnFC3Ro1AUAlys7HHpsuCyaM/+RPI9cZUshxkeNV3cxJVuoHUxD/3T3gxKia6WwBhrfW+tLE7sgoL3nmIRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHjlJzVO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHjlJzVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773178645; x=1804714645;
  h=date:from:to:cc:subject:message-id;
  bh=KJaVpRIPw/cCP/IOeRHSBEEsFqTJY/0hrOr6l4MVdbQ=;
  b=ZHjlJzVOgxh6IKrqY7eb+jX8KUOU/rdQKEBBcX7pDjesnggkThwel6RN
   qODtb2FTW8ZwGsGN4qPYGUBehehY5AjNPRKZg0TMo932fqIs2pifvMFOO
   JggGGvO9Q37h0bUwjITpR4Mf6VwxRoElWYzO4Lq2ImA/jvHwQxUPFA+Uz
   Bx0YYNBdrt9uRYVJ/ZLLEmRU7H03A3Zgz8SRU/flWSMCK7/ZuKQQZ99ZM
   TevlU5gHsdzsEM0X8kSWJIENRM2O2QqpzFjnk1k1WpTKPGbYcD7n7aLJy
   EZOGfzMcAfzb8t3yEHUJLGRwDU0EyFJ+Zec9LDDCHE+DWQuv7EkRAMguI
   g==;
X-CSE-ConnectionGUID: nUhR/KYWR1qRZf+WddSriQ==
X-CSE-MsgGUID: Suq/VsOSQDey75qPbRs3VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74153552"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74153552"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:37:25 -0700
X-CSE-ConnectionGUID: /acFdgm2RR6O3FUKqmkIaA==
X-CSE-MsgGUID: GnARO+pcRmG7OpC5zVsgBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="222816298"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Mar 2026 14:37:24 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w04lV-000000000J0-0e6A;
	Tue, 10 Mar 2026 21:37:21 +0000
Date: Wed, 11 Mar 2026 05:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpib/ni_usb/ni_usb_gpib.c:414
 ni_usb_parse_termination_block() warn: was && intended here instead of ||?
Message-ID: <202603110500.0S00AZF2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dave Penkler <dpenkler@gmail.com>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-r071-20260310 (https://download.01.org/0day-ci/archive/20260311/202603110500.0S00AZF2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603110500.0S00AZF2-lkp@intel.com/

smatch warnings:
drivers/gpib/ni_usb/ni_usb_gpib.c:414 ni_usb_parse_termination_block() warn: was && intended here instead of ||?

vim +414 drivers/gpib/ni_usb/ni_usb_gpib.c

4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  409  
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  410  static int ni_usb_parse_termination_block(const u8 *buffer)
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  411  {
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  412  	int i = 0;
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  413  
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18 @414  	if (buffer[i++] != NIUSB_TERM_ID ||
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  415  	    buffer[i++] != 0x0 ||
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  416  	    buffer[i++] != 0x0 ||
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  417  	    buffer[i++] != 0x0) {
18ce5b5d9167bff drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2025-02-14  418  		pr_err("received unexpected termination block\n");
18ce5b5d9167bff drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2025-02-14  419  		pr_err(" expected: 0x%x 0x%x 0x%x 0x%x\n", NIUSB_TERM_ID, 0x0, 0x0, 0x0);
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  420  		pr_err(" received: 0x%x 0x%x 0x%x 0x%x\n",
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  421  		       buffer[i - 4], buffer[i - 3], buffer[i - 2], buffer[i - 1]);
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  422  	}
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  423  	return i;
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  424  };
4e127de14fa78bc drivers/staging/gpib/ni_usb/ni_usb_gpib.c Dave Penkler 2024-09-18  425  

:::::: The code at line 414 was first introduced by commit
:::::: 4e127de14fa78bcd98c6459b0b984b8266cd0203 staging: gpib: Add National Instruments USB GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
