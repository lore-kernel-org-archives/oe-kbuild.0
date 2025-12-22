Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D513959D
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766386590; cv=none; b=tQzSi0fJX20aXRnZl4SwxK3pn3V4Z1JeGRO7t+NICK2UzEvnMTPK6N0R57vt9x8ULBiw+9wTQEFEDe7/k8RMeC6ii1RCbZki58ktqoKQDEy4nMWc9UQhVf1SmMDDacDwsUm8A8nAN5chaRMfK4uOCk3XhaD2aBtHwgKZqZXFP0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766386590; c=relaxed/simple;
	bh=yQH2+amXuL0c1AANSjnpx7IUBktPrLho62vY4Ve/hnE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IDpknefdsNVZ/kIm7RrLoD8pASb2gDJ+oMRdYMOnFQfRZQ1SalsQROyt2gwJt1+Mp/n0N0UtVmRbhcNaK7/eOzi2wXUKHyGPMKQCoyX6qfpaBlojCsy9l2RZ/EjSTHkjvE/vTaEGT+/ao7IJJzKNegDTPIBiGifAj1WauxArnGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezwrrqTD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezwrrqTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766386589; x=1797922589;
  h=date:from:to:cc:subject:message-id;
  bh=yQH2+amXuL0c1AANSjnpx7IUBktPrLho62vY4Ve/hnE=;
  b=ezwrrqTD8BKA7FfDhBHJGZXS/7HXldOdd8rwIRXxrEI5gThuF8HUCqCW
   GLppd70gabNPm5LWsR+jlfRNsCmYvJ+ugoUnMBSERK4WQ2h7RPi+2HRZ/
   Aya+rGGl2uWNGIn+cMK+Jh+IWS9x13VJSQWKPeZWgY6rHu061DRVyGMGe
   grmpN/ya2uQZpCA7xNW2x4gGDRvVVGHEimNneOAq2Xdl4L3BEq8gRe2xT
   EWtpqXB6lpsCK2+CZkqlUPRRg2I2g/HGsCyozFm3UvbpkTZY504PCrWao
   wDu6fIKjzADyFI5UTJEm4xJbQLL4CdJxMhljOzgqE69TP9ahm1aCO6uFs
   w==;
X-CSE-ConnectionGUID: F9KBgZOgTAyEJR5dAKFapA==
X-CSE-MsgGUID: xer/Gnk9SV6irIEcwGBuuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85824014"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85824014"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 22:56:28 -0800
X-CSE-ConnectionGUID: AbhP27jnRPyJvN3yim998A==
X-CSE-MsgGUID: c3nt4Ij2TqK9+ev2Ier/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199424225"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Dec 2025 22:56:27 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXZq8-000000000B1-3nVw;
	Mon, 22 Dec 2025 06:56:22 +0000
Date: Mon, 22 Dec 2025 14:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 11/14]
 drivers/pinctrl/pinctrl-mpfs-mssio.c:748:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512221415.gBbEfBU3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pinctrl/pinctrl-mpfs-mssio.c:748:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a8805fb8a49841ef67f240537e28ed40ce539661
commit: 4e74c2cd5a9de2859fc73c23634eb34e459e845e [11/14] pinctrl: add polarfire soc mssio pinctrl driver
:::::: branch date: 31 hours ago
:::::: commit date: 35 hours ago
config: openrisc-randconfig-r122-20251221 (https://download.01.org/0day-ci/archive/20251222/202512221415.gBbEfBU3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221415.gBbEfBU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512221415.gBbEfBU3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:748:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/pinctrl-mpfs-mssio.c:748:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pinctrl/pinctrl-mpfs-mssio.c:749:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/pinctrl-mpfs-mssio.c:749:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pinctrl/pinctrl-mpfs-mssio.c:750:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/pinctrl-mpfs-mssio.c:750:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pinctrl/pinctrl-mpfs-mssio.c:750:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/pinctrl-mpfs-mssio.c:750:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +748 drivers/pinctrl/pinctrl-mpfs-mssio.c

4e74c2cd5a9de28 Conor Dooley 2025-09-24  747  
4e74c2cd5a9de28 Conor Dooley 2025-09-24 @748  MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
