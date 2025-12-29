Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896681B6D08
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017290; cv=none; b=B0yU2rEfCbiGcpCZztMNMFuNw9OgkhwyA9CUAbQPNnM6b0hbDfuHpjFHoQQ7BQzx5TZmFZwokoq73+ZarOUazuDN79+2RK7tXIP7mOfu9TIQ0F84KM/w0SOxZofzzU5NX2ya9EiiE/gDolz2vP7V2v0sLl84gLLHtmDkX71/VV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017290; c=relaxed/simple;
	bh=HQZXOqGeou+LZ4IS/mWzVnO9swiyukb2sH6Rs7s+MSU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uxufe+X8XcpM10mi8qt64pC9pckgmhVpTK810JK26ljmUQQz8HJCsiBeLy/JoBcrIHFUoW0NnWyF1fstRn7b4Vs0NV4qeg/3Kjq6Qp8DMd8dCGe+ONlL+OREfx8Htcc7Ge4ofHi3I0XOJXPIh6h3e/eJgnBt4P8tCpqN9NeDMFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHTSbyt7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHTSbyt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767017287; x=1798553287;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HQZXOqGeou+LZ4IS/mWzVnO9swiyukb2sH6Rs7s+MSU=;
  b=hHTSbyt7jfYRR0vMJ3ZgmkFZ6i9MD6lZfvJlgr0AwI9q0eHTmZPjBvH7
   6/bcjjnHYwI0m3mKiNKIkxE3gamQIqmwc5fivyGyFIANrb2vYODn10mDQ
   Q8Jcd4lpJsIwM0/utzVACOiF6W8U9Q9b0pdoFt+dgdgrU3VOOglJr066a
   4P6KiM8YH4BjkLHyqqzYMrOu9IP/YMdpgotgTNpF+zYU449KAzSSCmZsc
   v+l2PcHQSQ4ddPIUHSTa9U5mVC/lQZ7w1XWM9GUCWqCRBi3Bn5jqIRFso
   hN8kA+fWwmtbOklUkcdeQrk8o/1k51sornUh3sWad3yhbNzeNn/um/qOS
   g==;
X-CSE-ConnectionGUID: DB7Bk6YPS0a0Z2sGK5eU3g==
X-CSE-MsgGUID: 80O5TpsgRISDyvzFdSo3Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="71209566"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="71209566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 06:08:06 -0800
X-CSE-ConnectionGUID: AEUbI/xBSt+6XDGajkk8JA==
X-CSE-MsgGUID: ShCQLkeBTFOV+OIObX/y7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="205826576"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 29 Dec 2025 06:08:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaDul-000000007la-0VWJ
	for oe-kbuild@lists.linux.dev;
	Mon, 29 Dec 2025 14:08:03 +0000
Date: Mon, 29 Dec 2025 15:07:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-absolute-reloc 2/28] checkpatch:
 ERROR:GLOBAL_INITIALISERS: do not initialise globals to 0
Message-ID: <202512291530.OWxHlKpR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-absolute-reloc
head:   4d134a71c162f4488792c37b761ce6ae11c6151e
commit: 27db70a73fef990626c6d33fcf51dd49e2ed79c5 [2/28] vdso: development hacks
:::::: branch date: 36 minutes ago
:::::: commit date: 40 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512291530.OWxHlKpR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:GLOBAL_INITIALISERS: do not initialise globals to 0
#67: FILE: arch/x86/mm/fault.c:1048:
+int show_unhandled_signals = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
