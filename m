Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123D420DD72
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764184224; cv=none; b=RFrCexBWH5hfeg7xL49Cqi5hWwJiZIDD0AEZZk6j7T1aNrJZGtyeDpsS59woCWrwY9oW8mfFKIgva5X9jpk6KXb26aG9tOtQsxTyzJhkzUilgm1WeZsoouGQdcvF/hd678LVxHpKD2ta0ztjXjZ8RM121uZqgWtOb83HS9wkvdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764184224; c=relaxed/simple;
	bh=Rdpq7rqqeqSvBWFOfTSXsuqzn4IvtW936FbslsTGLsQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JFjM0IrKNY+9FMiZUubtVD6SvE73h4rx0Zbw8NAj70tJkvNTBa/S1WDSB/7BmtAjZRUuAkB47YUmnovbaYM6E6Up8a74p7c/QfJmdex5DW7cKp73VE+DHMKiLwszhA80cIar7SSlVZcf5B09fxk0IgBaMHAY4TPpeS3EF+yG4hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccFmOfKv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccFmOfKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764184223; x=1795720223;
  h=date:from:to:subject:message-id:mime-version;
  bh=Rdpq7rqqeqSvBWFOfTSXsuqzn4IvtW936FbslsTGLsQ=;
  b=ccFmOfKvEesulG+mGLbAUwQ/xEV8FjZTev3AK/VGRnBuOK4NF9k1uO2m
   iUwdNDKCXvCGwM3qSjUR4PrEr8+D8JYZD0IEfQ/v0JRglbHRLFiiLi3Mc
   RCGY/0lwt/fp2rlXMAd7ft4/u58HjX3paNIN7IMKZDJK0mP9nXDKkZ5PA
   7nUa652SRi3BZ91jmVi3oHkmUYbq4eIrPlaQU1BLAWZHcdKErIOVo/wAv
   j7sjqryRgcfj7lX2Ez5a3GrcCHKeRe7SmqUySywMK4TTLuNxZoirEb9qF
   ZnMAj8DWcTbCM2dt1/fTxcmGyQ7Qf5jTDiD/QBO9Rl/1OYcECG1xgoAuJ
   Q==;
X-CSE-ConnectionGUID: DkslmmxARL+BfcU0Y2beGw==
X-CSE-MsgGUID: vewSjnowTtWImFcT0M754Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66270635"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66270635"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:10:22 -0800
X-CSE-ConnectionGUID: yt7lkDUQQqCVLgNfXLAMbA==
X-CSE-MsgGUID: 8FG6Zp9KR66nhdAW7xjlOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193124172"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2025 11:10:21 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOKuB-000000001J3-0wEI
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:10:19 +0000
Date: Wed, 26 Nov 2025 20:10:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 2/999] checkpatch: ERROR:SPACING: space required
 after that ',' (ctx:VxV)
Message-ID: <202511262036.wfRDNjYM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: 41d65618647653deddf789cd23b78cdfe77562bc [2/999] bcachefs: compat code for pre 6.17
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262036.wfRDNjYM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#23: FILE: fs/bcachefs/fs-io-buffered.c:678:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#23: FILE: fs/bcachefs/fs-io-buffered.c:678:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#38: FILE: fs/bcachefs/fs-io-buffered.c:767:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#38: FILE: fs/bcachefs/fs-io-buffered.c:767:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#63: FILE: fs/bcachefs/fs-io-buffered.h:15:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#63: FILE: fs/bcachefs/fs-io-buffered.h:15:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#93: FILE: fs/bcachefs/fs.c:1555:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#93: FILE: fs/bcachefs/fs.c:1555:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#117: FILE: fs/bcachefs/fs.c:1630:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,17,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#117: FILE: fs/bcachefs/fs.c:1630:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,17,0)
                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#128: FILE: fs/bcachefs/fs.c:1757:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#128: FILE: fs/bcachefs/fs.c:1757:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                              ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
