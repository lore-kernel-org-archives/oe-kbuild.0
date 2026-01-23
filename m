Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED5D242D88
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 18:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192479; cv=none; b=L/AkD8sbztgXwGGBCU3O4TgpjdWuQVFVQX5AHvFbsBWh4QxfGqtXVmYpwYu4B8Ki3ykdyBMWJ+Md/0NTkgRBmB0tblJ9v4a1FTSJjyN2G7v/ROo0zbBOvydPlK6zL1R5e6jnn2ifuczTNA1BzrIcrzCNSPXGQCVTCoyBSlh71EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192479; c=relaxed/simple;
	bh=t4AaTjl797ZU6XigLbb7BU6UlKddmleeRmpJOS3NSZg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sNvShT0Rfv3ieo5104zbyV1D+obfTYUDm2trlNiBvUTalstJ+gi1xo0xj2gsWs0sjnBoLs363IPotFcdI108eowxy0d7t0aAqRA9S3MoU3a+eO9aqWXfTCV0++hTRnRmbQg65ZCmAY6wpXQ3IOjIQQC4iYG31e95pfwwHpR8zEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdBSoXQ3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdBSoXQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769192477; x=1800728477;
  h=date:from:to:cc:subject:message-id;
  bh=t4AaTjl797ZU6XigLbb7BU6UlKddmleeRmpJOS3NSZg=;
  b=fdBSoXQ3kNQNeIFmmZPWekXC8cPAKg4Uefx/Sy/SgIRy2pmtbR62k+rE
   VEO+Ie0Y3nlHlPED4kakweMk4M/iMvfwnQMIgYFSUAetoFIyW2UauTnGN
   KlGj/gKSqndr+71un5oEXZ16q75P4MmvoBlQZxVitNSE5Dv32Nkl6J1Yl
   wQcUk9T5D5DIyF0mHmwHY344Ae3ffSGDURt1W+ZRG9v5bcl0E5pMgcF1H
   FxwPOI41MHw3JJZw3F6+ikcr0bSkbNn5XEIA/sOvHT3RmsPvb+o8v6UJT
   T33znZIItxqjVtFTQ5T6vi8YAsU6UD3+1PHCHLjxdSntnGOhTV6lZJL+1
   g==;
X-CSE-ConnectionGUID: jTWKpV72TKisHuidVP1j/Q==
X-CSE-MsgGUID: wzB2lodMR9an+MvZ+faH3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70171083"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70171083"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 10:21:17 -0800
X-CSE-ConnectionGUID: n7TYFdMySDGG3w6Bzu4Nzg==
X-CSE-MsgGUID: SWukyz08T7uaHoqN2B/vMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="244703860"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2026 10:21:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjLmT-00000000UJu-1zY3;
	Fri, 23 Jan 2026 18:21:13 +0000
Date: Sat, 24 Jan 2026 02:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ebiggers:wip-aes 53/57]
 lib/crypto/tests/aes_cmac_kunit.c:67:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601240247.S0qjJR4N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/crypto/tests/aes_cmac_kunit.c:67:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   3e84741c73083541146a5fc243dcd8f81887656a
commit: 1a728077f06651b14b4b22fb783e30201e059b72 [53/57] WIP: AES-CMAC library
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-123-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240247.S0qjJR4N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240247.S0qjJR4N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240247.S0qjJR4N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/crypto/tests/aes_cmac_kunit.c:67:1: sparse: sparse: bad integer constant expression
   lib/crypto/tests/aes_cmac_kunit.c:67:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/crypto/tests/aes_cmac_kunit.c:68:1: sparse: sparse: bad integer constant expression
   lib/crypto/tests/aes_cmac_kunit.c:68:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +67 lib/crypto/tests/aes_cmac_kunit.c

1a728077f06651b Eric Biggers 2026-01-22  66  
1a728077f06651b Eric Biggers 2026-01-22 @67  MODULE_DESCRIPTION("KUnit tests and benchmark for AES-CMAC");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
