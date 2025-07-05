Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C59475
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Jul 2025 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751703338; cv=none; b=aD7r8nFN4JZiggQVJppP9g7HurfL/rIuQJksI+2cR0SUMXidHnMOE2Il+E7pUCdysdoN4hNkzCDEUV6rMGpjYL+HODv/aIqKh/nqHjaNCkqKY3xne3bkRx2Ja+15B86oeN1IbrL+U01kWtR24/07oT6QFcY98P19OnI+d1u46WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751703338; c=relaxed/simple;
	bh=RcTIr9zIEuDHQKQusJkaD0o+pLLvoO50rx7G12Jy0xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKo/DQrg3XQbVQAx+1LQkcLDMecEhJKxVFmooL1NAxkA+IUNOTXqiXpzsAPzPdnaBrHgQX1sSnajyyUZjAdA2nLhK1YB5InKsTl4qx0UI7Y19mcYJG7ucI2AqCld8YUBjolNnleFG6h/1KvR2N353ZgF9VCe2c0UdwK8kgeF9FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqNqmFBx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqNqmFBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751703336; x=1783239336;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RcTIr9zIEuDHQKQusJkaD0o+pLLvoO50rx7G12Jy0xo=;
  b=nqNqmFBxwGYRLv1I55ofY3ZE8UpIAUCtmho/uOGkhCCvVfAeJRCWDzVU
   K7imDpdOaRde2fwsjEeboQgo6CDM3fMwKupP0mL5dRKAWCUEXL5fIHVgS
   VfyNmcsOrfsGTQkPflCMTkYIeUxcyadzCAbjgRqRVdWTu5oBAVOmWq1v+
   EmMAp1vFjgpvc8poPv+g19NYJ0M+Ym1yszmM4fJ/3D2CxrmupUEjg5Rwj
   gUMhAO3q3wF1qTx2cncOEX3at2WpLKN+W0ztYluyNseaTzX78CUWW2Xg1
   RxHQzH7al3KImdDbSAb3ZiOzxCPuMkK+quZT4r9a1bx5iAB10vRTCcCN7
   g==;
X-CSE-ConnectionGUID: 2y5MOQ6YTNiH1HPK1mR1xw==
X-CSE-MsgGUID: bAL/EPLJTISoOG2P7dzQIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="54152501"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="54152501"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 01:15:35 -0700
X-CSE-ConnectionGUID: 9pnbqekcSUGsSHeN2CZBEg==
X-CSE-MsgGUID: 0PbIV6+2QJyGWU5zjAmboA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="155153411"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jul 2025 01:15:34 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXy3Y-0004OD-2J;
	Sat, 05 Jul 2025 08:15:32 +0000
Date: Sat, 5 Jul 2025 16:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: security/landlock/errata.h:43:5: sparse: sparse: not a function
 <noident>
Message-ID: <202507051620.ja4hiZDu-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: security/landlock/errata.h:43:5: sparse: sparse: not a function <noident>"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Mickaël Salaün" <mic@digikod.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a79a588fc1761dc12a3064fc2f648ae66cea3c5a
commit: 15383a0d63dbcd63dc7e8d9ec1bf3a0f7ebf64ac landlock: Add the errata interface
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-r132-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051620.ja4hiZDu-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250705/202507051620.ja4hiZDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507051620.ja4hiZDu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/landlock/setup.c: note: in included file:
>> security/landlock/errata.h:43:5: sparse: sparse: not a function <noident>
   security/landlock/errata.h:43:5: sparse: sparse: bad constant expression type
   security/landlock/errata.h:49:5: sparse: sparse: not a function <noident>
   security/landlock/errata.h:49:5: sparse: sparse: bad constant expression type
   security/landlock/errata.h:55:5: sparse: sparse: not a function <noident>
   security/landlock/errata.h:55:5: sparse: sparse: bad constant expression type
   security/landlock/errata.h:61:5: sparse: sparse: not a function <noident>
   security/landlock/errata.h:61:5: sparse: sparse: bad constant expression type

vim +43 security/landlock/errata.h

15383a0d63dbcd Mickaël Salaün 2025-03-18  41  
15383a0d63dbcd Mickaël Salaün 2025-03-18  42  #define LANDLOCK_ERRATA_ABI 1
15383a0d63dbcd Mickaël Salaün 2025-03-18 @43  #if __has_include("errata/abi-1.h")
15383a0d63dbcd Mickaël Salaün 2025-03-18  44  #include "errata/abi-1.h"
15383a0d63dbcd Mickaël Salaün 2025-03-18  45  #endif
15383a0d63dbcd Mickaël Salaün 2025-03-18  46  #undef LANDLOCK_ERRATA_ABI
15383a0d63dbcd Mickaël Salaün 2025-03-18  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
