Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DF73BF303
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 17:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496786; cv=none; b=PwfzmPoRsDYOlOkSaxKv2HUmQuQraqN3AGER4wWCcKLr8JKSQmn4KRtay9lca2sKo+8pRsNBfU5+EG5oJwZKuLTcTyaQZG4rzueLuton4TL0i2DzgEiEvAnfrkyYCx0exYj3aGzXOqMLzvqHCbAJtX5LU824Y1OfoemaFi4h8r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496786; c=relaxed/simple;
	bh=rUqBTkIwFJVYK4ci5dzKs4mE4eetsud2A94ESEMSTdg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kFSVCjy5TYbTXmmUhjNu7EY4grk1VdDxb+ZJpszzoKlEAl9g0t7Ra4qCX8t5qDa4DYdMKH+WvkwY9eLZ/FvyJgujKXfNRuq2709pI4Wa9uMgOyXfsyRmHjuhfOt8lsYRHif4AtmLDTkaG4qlrmIBlN8kmeK9LeeuhNMQJq3SKBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9XxJKrL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9XxJKrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768496784; x=1800032784;
  h=date:from:to:cc:subject:message-id;
  bh=rUqBTkIwFJVYK4ci5dzKs4mE4eetsud2A94ESEMSTdg=;
  b=h9XxJKrL/69js8oR7/k13LRR+//7Oxo429/FhT8lw83tN1t70UBRbdKw
   pH5W/p7uKvJS6mBmS++h9jWR05invGS0KsgplV9lRMw1gWYBk5GWofISJ
   d1bxQMJ5YNfU5Fd3zNQ8p7RhrKSTaD69QtAk1NXWGBsu7aWxgl2E4xrxP
   340ErqEctREdGgNnGp1zPwm+AC9QVRxaXfXtwLK7uYl3ifs+rDqxQ1GIG
   wdKxZ7sUQYDlT8oiEA0LIkJ/hqIBbYBvjewvM5F/mRoWozOubrdzBLGz5
   qmFXgwpu/GKxhAi/lKV+pl9k2TC8m0rhH40RPdsbotKPJpjMYg2XRE82r
   w==;
X-CSE-ConnectionGUID: 0m03vFddTnyizLDjI9ywow==
X-CSE-MsgGUID: IhCO7ZRaTmq0/Gkh6Nj4ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73650152"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="73650152"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 09:06:23 -0800
X-CSE-ConnectionGUID: ARwcq55nQ9O6k6MGTbImjQ==
X-CSE-MsgGUID: XM3N5mucSq6OWahG92lNZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205278121"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jan 2026 09:06:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgQnc-00000000ISU-3pSV;
	Thu, 15 Jan 2026 17:06:20 +0000
Date: Fri, 16 Jan 2026 01:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5281/6771]
 drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:382:1: sparse: sparse:
 bad integer constant expression
Message-ID: <202601160022.HqOucuTP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:382:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yao Zi <me@ziyao.cc>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Sai Krishna <saikrishnag@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9b7977f9e39b7768c70c2aa497f04e7569fd3e00
commit: 02ff155ea2812ea25a086665522fd4fa196ef0ce [5281/6771] net: stmmac: Add glue driver for Motorcomm YT6801 ethernet controller
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
config: sparc-randconfig-r131-20260115 (https://download.01.org/0day-ci/archive/20260116/202601160022.HqOucuTP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160022.HqOucuTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601160022.HqOucuTP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:382:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:382:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:383:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:383:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:384:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:384:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:384:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:384:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +382 drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c

02ff155ea2812ea Yao Zi 2026-01-09  381  
02ff155ea2812ea Yao Zi 2026-01-09 @382  MODULE_DESCRIPTION("DWMAC glue driver for Motorcomm PCI Ethernet controllers");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
