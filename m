Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EDA3148C2
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069121; cv=none; b=hLoMxza6YNEjo5rkhfhTiHXI8Mk6QD4oXiM3QmPiXbng2aqxhz875d4d7xWA1ATVXH6Qq6rJWh547nd6GhYQsQCaLjiEwlInYMSUR0xH6T6EoN3Vzrtch54ZEE7liIEIuOd5L5GEFMbJ5Afuss5JEtJ5Yigw3eXUFRj/YndZd3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069121; c=relaxed/simple;
	bh=Lq2DxTOnPvkSYma15Yg9KDa3g6kqDhAUSo2siIkjrKk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TTVue2Ji4+E3fGW3CwvknLI/z8gi+AIJLY8TI13oJL/JrryEHAUOojHby1e9SgzGflelsGjOG8QsNKdygkXxyHPWj0wHGzxyezFN+ELpTn6IlN6LpZTQ5Xr2rcOBoFODNcxypWmylefHbUv1dU+p9KNuFDLI9vbxFToeVxZ3qgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxW75jMw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxW75jMw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069120; x=1794605120;
  h=date:from:to:subject:message-id:mime-version;
  bh=Lq2DxTOnPvkSYma15Yg9KDa3g6kqDhAUSo2siIkjrKk=;
  b=DxW75jMwFihWy7LVpfs2IVQ5igYftRe3tVd+Lr8dvlJ7iq5bnVcyeBUN
   E6fB+krGalNryhErBFdr8WaEoQtQfH8D37TPr15IkP3FC64i1ZzCncKSK
   lahca5m6H2cqb9NeoIDclOBzke5OLfC8x+gK4QKeHrt88md2JRDhElzm2
   ZbQc0187+cBZ+MXkfFx4tnUC5KAjV/YK8nXAG7Gyrsy1V0bkyYERzOSNd
   mYdj4llnBfph2PAhLQesQ8ghYQ+5VMDzykEg5QxeaPSv9moBSfmmw5TPg
   qamkvfSvS2aBiysXCojr5o7yWbTT40EyzkR21M8baNivXD1cQJXN3mZGW
   Q==;
X-CSE-ConnectionGUID: LKUyx8MWQUyImDkfrTbnMQ==
X-CSE-MsgGUID: QKviXBKjQviU44BDkxTJUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75842405"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="75842405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:25:17 -0800
X-CSE-ConnectionGUID: vAzO0a3ASUW9xbHPB+pSEQ==
X-CSE-MsgGUID: cgAjz0wzSem2aGzdWcUxgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="213008638"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 13:25:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeob-0000000018I-1yLy
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:25:13 +0000
Date: Thu, 13 Nov 2025 22:25:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 142/867] checkpatch:
 WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or
 return
Message-ID: <202511131804.NC4GEFP6-lkp@intel.com>
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

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 156600751419b2d2102a33b9384558e1d0e78b53 [142/867] bcachefs: convert buckets.c to CLASS/guards
:::::: branch date: 85 minutes ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131804.NC4GEFP6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131804.NC4GEFP6-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#447: FILE: fs/bcachefs/buckets.c:1217:
+		return 0;
+	} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
