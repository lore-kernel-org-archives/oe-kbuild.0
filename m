Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3171A1862
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Dec 2024 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733444600; cv=none; b=tJL/oAxEPabQrVfqDGxQR7jMnZF7FMjN6ocJXouWUGChYIUQ9ePCRBMRL0ScAHwoKxws3ht4WOjWODQT4Sr2prtPdoTuj7ZberR9x909Ve8eJz2YH4Dy93wSLwj7lpIXeU7nl/rLCI9jb5fFCrNMD/HbWrVtOmNNIi+d3lJoGF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733444600; c=relaxed/simple;
	bh=CjAa+wFmxEp5qkQkO1L3RZtHLqKAsJX2jQiB+daBm5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQaOIkGrPJsq/fmsRZpRp/RALIvpUx5hogCEPNVYNC5qUOVxgVgTipqwZVH7aNsPemBTBMHbjyHMkd3A94UQ8mHgtgljEc2Fn9MaJNoflMNWG2atCnofY8qpXoBOZrBPKdAh7P9xT6Rc/oES77siMdfLctTYjmkCPu83h46zCj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsDs9k87; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsDs9k87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733444599; x=1764980599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CjAa+wFmxEp5qkQkO1L3RZtHLqKAsJX2jQiB+daBm5c=;
  b=gsDs9k87e2DKN1+JlM+U0DPqIuGMF163ql/0a8uebHNXW5fi0vv0fBsI
   i67XhGIwJ5Xgb1+RWfO1tQaHRfib33ktuHW8FZkGC056/Q/0DKcv8Qd3f
   uyvuSzx3/zqNjBeXzagWytmFab/pOWi/HS7JT3bWSVF2rhxL+Hr1BMgi3
   nlaQaINhdYLHabkZw/scMlQE594n7VBmPX2nlp3DNq32RgAGYHaqYoh8V
   V8/8wGQrSsTcIWM0aSaRSfCdlXbhd9mbAJnBT+iIBgu855D3GHu5FIuVX
   J5TsimJwDhsqVjnK1Bo9p8OUuTYFFk9Ikx0kuGcvHoYMI1Lz1Ytz8/ns6
   g==;
X-CSE-ConnectionGUID: cqsp71qgQuKbetu4zE6ybg==
X-CSE-MsgGUID: QkDPgfqzTu6JNH2Tw4dwCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33705864"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="33705864"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 16:23:19 -0800
X-CSE-ConnectionGUID: 4jT+9WOoQxuHX5aJI1NfBQ==
X-CSE-MsgGUID: dogBUpxHRxKF8xPylXFPGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="99328145"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Dec 2024 16:23:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJM7m-0000WW-1j;
	Fri, 06 Dec 2024 00:23:14 +0000
Date: Fri, 6 Dec 2024 08:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/gpib/ni_usb/ni_usb_gpib.c:418
 ni_usb_parse_termination_block() warn: was && intended here instead of ||?
Message-ID: <202412060842.p5N14Q1A-lkp@intel.com>
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
TO: Dave Penkler <dpenkler@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   896d8946da97332d4dc80fa1937d8dd6b1c35ad4
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   8 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-161-20241206 (https://download.01.org/0day-ci/archive/20241206/202412060842.p5N14Q1A-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412060842.p5N14Q1A-lkp@intel.com/

New smatch warnings:
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:418 ni_usb_parse_termination_block() warn: was && intended here instead of ||?

Old smatch warnings:
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:697 ni_usb_read() warn: passing freed memory 'in_data' (line 693)

vim +418 drivers/staging/gpib/ni_usb/ni_usb_gpib.c

4e127de14fa78bc Dave Penkler 2024-09-18  413  
4e127de14fa78bc Dave Penkler 2024-09-18  414  static int ni_usb_parse_termination_block(const u8 *buffer)
4e127de14fa78bc Dave Penkler 2024-09-18  415  {
4e127de14fa78bc Dave Penkler 2024-09-18  416  	int i = 0;
4e127de14fa78bc Dave Penkler 2024-09-18  417  
4e127de14fa78bc Dave Penkler 2024-09-18 @418  	if (buffer[i++] != NIUSB_TERM_ID ||
4e127de14fa78bc Dave Penkler 2024-09-18  419  	    buffer[i++] != 0x0 ||
4e127de14fa78bc Dave Penkler 2024-09-18  420  	    buffer[i++] != 0x0 ||
4e127de14fa78bc Dave Penkler 2024-09-18  421  	    buffer[i++] != 0x0) {
4e127de14fa78bc Dave Penkler 2024-09-18  422  		pr_err("%s: received unexpected termination block\n", __func__);
4e127de14fa78bc Dave Penkler 2024-09-18  423  		pr_err(" expected: 0x%x 0x%x 0x%x 0x%x\n",
4e127de14fa78bc Dave Penkler 2024-09-18  424  		       NIUSB_TERM_ID, 0x0, 0x0, 0x0);
4e127de14fa78bc Dave Penkler 2024-09-18  425  		pr_err(" received: 0x%x 0x%x 0x%x 0x%x\n",
4e127de14fa78bc Dave Penkler 2024-09-18  426  		       buffer[i - 4], buffer[i - 3], buffer[i - 2], buffer[i - 1]);
4e127de14fa78bc Dave Penkler 2024-09-18  427  	}
4e127de14fa78bc Dave Penkler 2024-09-18  428  	return i;
4e127de14fa78bc Dave Penkler 2024-09-18  429  };
4e127de14fa78bc Dave Penkler 2024-09-18  430  

:::::: The code at line 418 was first introduced by commit
:::::: 4e127de14fa78bcd98c6459b0b984b8266cd0203 staging: gpib: Add National Instruments USB GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
