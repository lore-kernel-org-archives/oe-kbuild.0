Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936CE33D6D2
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 00:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769128911; cv=none; b=a75UuVqzEZFcVLq68S+sa+9cbXTCiN3sVm+7GSTPhASwLZOu1pVRHYeh1u3p2sQjo5vlh8Y/F6ru7md70ekEGEuzXb46xzr3dgd57WEGDFcvDwa38qM+9WJZn7zIb7JHvtCcNFtFL2dHs7mqai1dEO3YU3dAV1L4o5Xg/w7qgR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769128911; c=relaxed/simple;
	bh=GErFpHyTgUe9i5gbRnZOZ2VrqmpZpvkGWvo1L8PxD/8=;
	h=Date:From:To:Subject:Message-ID; b=IwkhWTmwiUZPcG+5t3pRrWbloNx1L0JelaJBM5Q/uBQGgV43Y9MmUA/M1900WGiXaD7F7OZTlZiB3i0CZy2yjqw/E4ExlKUEVo+8DVnWIKDGhxA8r+rTX/pm0rg5uginv9/SsT/jHCvvoHMNvrTrlctsbC2vQP2U6kjgE3IGH+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2s3RanN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2s3RanN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769128902; x=1800664902;
  h=date:from:to:subject:message-id;
  bh=GErFpHyTgUe9i5gbRnZOZ2VrqmpZpvkGWvo1L8PxD/8=;
  b=O2s3RanNTCq2Mg7agVODrAfk0Lx4yovyn1UnrlLSdjj/FkDcy1ZtliSb
   omkG4Sm+jw+hzENl51UgQEtLayhK+9KoF8PhRyza1kLBzVvdpOOCkgIkV
   KGHuGpa+55Rq8gyHsufOyGRGPQIGP6Qw5xF9aKXgkasH8fbNeZCvVhsWz
   V8ycO4jFIGfmuTHSPKW1Z6eEdKolKhWVPlA8b1f5ZlC1177HyYRVonFR8
   2Sowoe4Zzjov+F1Bwyj8P6jzhTRTr4wm05aKE5LCKqVmjD0zvk1wv/O6m
   f/nKLNcMW0r6WWdgDpsJh7qyE74dUFrBzmTFPjqLGdfdAR97LVnXC1IJ9
   g==;
X-CSE-ConnectionGUID: EcTFrS14SVadXU3nI9S7hg==
X-CSE-MsgGUID: ouL+At3DQtyBkp4H+VdyJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81098693"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81098693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 16:41:39 -0800
X-CSE-ConnectionGUID: XnQFFginRxaNyhF8Z/gj5Q==
X-CSE-MsgGUID: cPmWmgrzTESIqpVxlUca0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="244485885"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Jan 2026 16:41:39 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj5F2-000000000ZN-0Ojd
	for oe-kbuild@lists.linux.dev;
	Fri, 23 Jan 2026 00:41:36 +0000
Date: Fri, 23 Jan 2026 01:40:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:timers/clocksource 6/6] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202601230133.Bo3UUqS5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/clocksource
head:   20cbd3a60db9b092529461651973cb0ba8533758
commit: 20cbd3a60db9b092529461651973cb0ba8533758 [6/6] clocksource: Rewrite watchdog code completely
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260123/202601230133.Bo3UUqS5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#820: FILE: kernel/time/clocksource.c:283:
+	for(int cnt = 0; atomic_read(&wd->seq) < seq; cnt++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
