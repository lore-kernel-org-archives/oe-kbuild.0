Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919338F923
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 15:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317021; cv=none; b=tfF7R9DfLu2Hwbs8qbhFREWvX8VDfBIj5/BfkopbnmiD6ErVQd6JXDU3ZI+xIWR9vPjUXRhSr2sbUy+t6lWafddjTGiDSrY9lzWIBHyuLdPw/dA4BfTj0KONx6PbwswI0ZoQbmOdvq3lKWoGwW0zaquLSRQx6sR9PPhF7sDU0Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317021; c=relaxed/simple;
	bh=N4UxRrRQEoqHHQJ7XUWbEmoRR/rtT+sxQuHoQxQR4SU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z/gDBz/k1B7doi/7muu7d9bGZ7R8BPUmhQijdAyO+kmLOM5EfoDjlsGs0F/llIGvOOpUcsbpaH/TxE7gFjINZfrN1w/JiXenI/81hN5UzoCVskIw2oTyy+s4B4cX3jZ7t/96NcVkipvI9PDX13tz8aPBCBajaz+1jkgTRNdaees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7Iym7+E; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7Iym7+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768317019; x=1799853019;
  h=date:from:to:cc:subject:message-id;
  bh=N4UxRrRQEoqHHQJ7XUWbEmoRR/rtT+sxQuHoQxQR4SU=;
  b=l7Iym7+E8B7hlyaAXbrDrNSF3K5kui0owxLj67+ow93ITmniqqVZcmQD
   AE/xEKCk5+kdvgOlC10Y9MgL3E+UIM2rL67uFbhupAMdKJjXrGZ1c37Jv
   lr99iTNEgXdqr2G7dpsp6/WQLy3If/AV6tjuaUzqhfzcrLoF4StW2ZVpd
   lIBmePnr/bVDrJPrP5YZFE8BHfjwXedQFMS+U34IYQjP+DjbmhGlYs5mR
   vd9zVtiRArgToOBRst4OZFbTLn2snGW/L1ZlLqzQOd8zD3IsMwlxLLP6a
   giHCZaLCyAYXoJOkKC9PT3RibnKytLB8KOO4UuSe8cvAloWjUGVwH6Iqp
   w==;
X-CSE-ConnectionGUID: YyHZ43w2T1i/UCUVsDv0Cg==
X-CSE-MsgGUID: Pa0WrJuWTnWgxMwa3HXrwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69657907"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69657907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 07:10:18 -0800
X-CSE-ConnectionGUID: ZT+alqSiTOeqrr0tzju1tw==
X-CSE-MsgGUID: ZyOcPhpfTpaQI6siDhb8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203621869"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 07:10:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfg2B-00000000Eye-2p4E;
	Tue, 13 Jan 2026 15:10:15 +0000
Date: Tue, 13 Jan 2026 23:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3983/5774]
 drivers/video/backlight/cgbc_bl.c:177:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601132350.ZH49BEj0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/video/backlight/cgbc_bl.c:177:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Petri Karhula <petri.karhula@novatron.fi>
CC: Lee Jones <lee@kernel.org>
CC: Thomas Richard <thomas.richard@bootlin.com>
CC: "Daniel Thompson (RISCstar)" <danielt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f853ca2a798ead9d24d39cad99b0966815c582a
commit: b516456e9f916070fde6aa50cad5680a689687e6 [3983/5774] backlight: Add Congatec Board Controller (CGBC) backlight support
:::::: branch date: 9 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-r122-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132350.ZH49BEj0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132350.ZH49BEj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601132350.ZH49BEj0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/backlight/cgbc_bl.c:177:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/cgbc_bl.c:177:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/video/backlight/cgbc_bl.c:178:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/cgbc_bl.c:178:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/video/backlight/cgbc_bl.c:179:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/cgbc_bl.c:179:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/video/backlight/cgbc_bl.c:180:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/cgbc_bl.c:180:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"

vim +177 drivers/video/backlight/cgbc_bl.c

b516456e9f9160 Petri Karhula 2025-12-05  176  
b516456e9f9160 Petri Karhula 2025-12-05 @177  MODULE_AUTHOR("Petri Karhula <petri.karhula@novatron.fi>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
