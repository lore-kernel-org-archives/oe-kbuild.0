Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134682EAB8E
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 08:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973689; cv=none; b=MT1MOWVhpjuLZTttU4tvBKjyqtEHkMEfpG2ilWUfiGtRN5lpL2T3wMUS1rYOhipxAJ7TlS5tNowhF28vtD+3A+RHq3g6yqTLKl2BsYSNYzWxdEWvJgHd49bLm1UGGDIlyiTt6YET8Jn2P4UIHINyqCtkam5/qgmYBmGCbTy4V5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973689; c=relaxed/simple;
	bh=F/B0+An/47Yj/5xSvea5EqnTjxeu+EFV+YLI5NlnuLk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQ3dj2Zqz5HWAkTD+5jZvxFwuf2PrDTdC5Qp2ymI9fbn3unaPrfFD3kxgsYqXEShEX+yofq+J6iUw9UVcjlkNH7/Dh0yFCFKTG3YrsKVLUPorc+z2UWw93WpgAXT6Eqa5I42ChDV6Heev7BybbvMaz/I8RYfl96bGbo3J20Vhus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqE7dD5P; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqE7dD5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763973688; x=1795509688;
  h=date:from:to:subject:message-id:mime-version;
  bh=F/B0+An/47Yj/5xSvea5EqnTjxeu+EFV+YLI5NlnuLk=;
  b=YqE7dD5P323XqKBeR6TA96QTKa1gqwwEj/xSy9SeO3w4u83pMufd4XM/
   NvOQZ8DUdA2o2cuq4rJBhHdCym873lwyYll8xJgbrsdFkZrCz7j5rqFJ8
   qkYV6uybaOLEo41FgByeuIxqWKwYMyd40lck1kOswkNtjJzmYussw4qmb
   lbE84AnQz9Li7ocWEmpqHEro/qu/Kz9N6KfYyY8B9OgN0A/S4Aw4S87Of
   ULwqAqJVDmniuKkZHAYiM77vdU63xZv11iBhFT7EKxjxfATz5d+N0NlvJ
   H8cgunnhhgrodnB3UT67yRaiohxyLD3aweUJwh8AHmZ3WDn0DzWSRPZzH
   w==;
X-CSE-ConnectionGUID: hwJp5+5JTY+SWods8M1GLQ==
X-CSE-MsgGUID: rCWcIxAwSWi6cV+gQ6T/qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65917213"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65917213"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 00:41:26 -0800
X-CSE-ConnectionGUID: ariuAcdaQsWYEZkp4j/oIw==
X-CSE-MsgGUID: pKGKhVWZQ2O6gPx+LuIH3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196728018"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 24 Nov 2025 00:41:26 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNS8R-000000000BD-0Krf
	for oe-kbuild@lists.linux.dev;
	Mon, 24 Nov 2025 08:41:23 +0000
Date: Mon, 24 Nov 2025 09:40:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [paragon-software-group-ntfs3:devel 3/22] checkpatch:
 WARNING:BRACES: braces {} are not necessary for any arm of this statement
Message-ID: <202511240915.a1ZIlniq-lkp@intel.com>
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
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git devel
head:   2469f2e78d074bf2d416ea82c32b154f5632effe
commit: 801f614ba263cb37624982b27b4c82f3c3c597a9 [3/22] fs/ntfs3: fix mount failure for sparse runs in run_unpack()
:::::: branch date: 7 days ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251124/202511240915.a1ZIlniq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#31: FILE: fs/ntfs3/run.c:988:
+			if (!prev_lcn && dlcn == SPARSE_LCN64) {
[...]
+			} else if (check_add_overflow(prev_lcn, dlcn, &lcn)) {
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
