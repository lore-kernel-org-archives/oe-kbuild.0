Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A22C331222
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402647; cv=none; b=A6ItKHT/ZnOzn4zftzzbRx98ATcVN73Ve85aaYj6gNBMxWNnvoJ0s1k/uMLkuTPMynCl1TC02PdX+9YC/GnIANzkTSkpBYpv8k+DBUPceKUF05lWWbX5cG0XC6mTjnQaelWFIQ1KIswWndM7h8alAS2oU8wnGT4g/FxANOrOhIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402647; c=relaxed/simple;
	bh=xQKLM+1mwi3sh4sMzbes4VdbGWK32UG5v9bsbAzrZNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AYaA6o2u3ipZd9tYyVNU01Ixq3ZzDXS9TGptyKV3l3EGPQ2DGoHdIXnThCdFLjAf9s88kdXzEY1rNUBWNHAGB4neBnnd4ee+Xp1kXBr3WyDmTIyDamtGGQKS2i1Kr3N3zerMEMqoGMxv5tlCjNz4+6zfOLWRPlc0hYBukGV8siQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U83qdjSr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U83qdjSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780402646; x=1811938646;
  h=date:from:to:cc:subject:message-id;
  bh=xQKLM+1mwi3sh4sMzbes4VdbGWK32UG5v9bsbAzrZNw=;
  b=U83qdjSrr4/aMT/lNeiXA3Rfil5SOL9GYUhFd22jwg2H/QBQUqiC8JFA
   s3yqMSkYkZUgQ1eYtmLEv6IhN7ltjN2JMs7pjakz2sxLMMrQ+9evC3cu8
   i/J9dOR47Y2RQqtXFka3jx01f7H9vZ68kL0SYlwjsWaqF5X2RT9/RTIOU
   yzJNmw3a3d/pHQH2xNWTUnhnnSvQ7InsJ22RcwpUzCCyfZRrPeJDtYiou
   mIPrOK9TriICizOqSQLE5v3gQq53fYNVIR3kMmEiOj+c+jrzaBJNdGbd9
   U+GnS0pH6CKdJglBKwLLHFxUmLlotCBd75X0h+C0HAcmQ/2AVkQQ2B+sQ
   g==;
X-CSE-ConnectionGUID: yH4rEgcpR0KAbUteTyDfRA==
X-CSE-MsgGUID: ArPXKKT2SLKvw1Qa4nOI5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92670176"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="92670176"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 05:17:26 -0700
X-CSE-ConnectionGUID: FNLNImSBToOvtedRMZSPHw==
X-CSE-MsgGUID: O9DC2SX/QG2eFHHR6WGdPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239722192"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 05:17:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUO3e-00000000C0C-40xZ;
	Tue, 02 Jun 2026 12:17:22 +0000
Date: Tue, 02 Jun 2026 20:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:master 781/889] ld.lld: error: duplicate
 symbol: __cfi_cleanup_module
Message-ID: <202606022030.D8bBfxkJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   641071b397e4ef707f4512d9b6e48794c3b28f8f
commit: 876b3725514698ee0158346c94ea8034a02ee82b [781/889] mtd: fix modpost errors for mtd_virt_concat symbols
:::::: branch date: 4 weeks ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-001-20260602 (https://download.01.org/0day-ci/archive/20260602/202606022030.D8bBfxkJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606022030.D8bBfxkJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606022030.D8bBfxkJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __cfi_cleanup_module
   >>> defined at mtdcore.c
   >>>            drivers/mtd/mtdcore.o:(__cfi_cleanup_module)
   >>> defined at mtd_virt_concat.c
   >>>            drivers/mtd/mtd_virt_concat.o:(.exit.text+0x0)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
