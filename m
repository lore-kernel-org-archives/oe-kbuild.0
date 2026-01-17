Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D931032AABC
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768630305; cv=none; b=jGnX+PMGaITqw5Si3NTI4iIiAjAwZFXqkYvTZJBOO38fLN3MGXcrB1cnk1geseE42kMdwhzLYY/Qy4UOwduE8SV8HHKApYpgAn52ZglBeX+xqyJ7AmYV93yAXflhZMOgLxRw/VUdWxt9sYqbRy+wWJRZ8GDVQJy0chqHa0F0FP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768630305; c=relaxed/simple;
	bh=d/m3L5K/uPKhTfgoUCsjG9qqqVx57wc4/ugL1JSfPoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=py0CnSWTzV6DIk0Q0YgHoffvctsm2rxn2MD2C/zTVPTyBf4lDLs3Ck0m9R9fcVci9qrZqotaKMzbf8sPMGtjkZBCKYISuPLDgS+nnad8RxdOAHLtpe1JlVdovLAYssEJMy1ZRxqz5gbPrHEP0X+nox8O8sK78wnfWZQLtMby1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgR+8YbG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgR+8YbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768630304; x=1800166304;
  h=date:from:to:cc:subject:message-id;
  bh=d/m3L5K/uPKhTfgoUCsjG9qqqVx57wc4/ugL1JSfPoA=;
  b=VgR+8YbG7+cbOsLzTCuqhoIJALIcTkkGO4xe+qRQeFRrQxxxYAyGpiy9
   HInvHMxxqczxWzjCJ2rsATqy32ERlgHc4cvR7Os2PqdoRF+ijoGPqEmIf
   qiTOHES58lgxgDI6tJ3XWLcIGdielzS2432FUmG4hNrWUh0+yV1Oq7l1H
   vPHgoGa9w4KaNpcKP8MzQhDkQI8Wz6efLGns1adT5WZKDniNeeTTIBYIO
   MQhWcBgZcUaYfxG/UaOsEVrqIk3CAYP5MhW4Y0dXxtvJISUgkcwLuXM1o
   AzpLDzV0/0GYeft/KGHWvMqAPfgDQ6p+MFrelrLOm/TYL39ozRqcc5aki
   A==;
X-CSE-ConnectionGUID: TNNybYIVQuiA4XVgETptig==
X-CSE-MsgGUID: YVXH4kYFTBiPSqzoDqQeWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="57489998"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="57489998"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 22:11:43 -0800
X-CSE-ConnectionGUID: TFP1M+wjSYOM6tdEFr9h1Q==
X-CSE-MsgGUID: qlsNQEjQT0GQxNFBpycKvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="210432013"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jan 2026 22:11:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgzX9-00000000Lc8-3jJh;
	Sat, 17 Jan 2026 06:11:39 +0000
Date: Sat, 17 Jan 2026 14:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ambarus:b4/acpm-tmu 5/8]
 drivers/thermal/samsung/acpm-tmu.c:641:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601171433.IvJRVuyj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thermal/samsung/acpm-tmu.c:641:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tudor Ambarus <tudor.ambarus@linaro.org>

tree:   https://github.com/ambarus/linux-0day b4/acpm-tmu
head:   0af5463943f469e0f9655a7b00cfc9f9fbb20b1a
commit: b3ff68d0c031d621a9786b55720ceb8f0c2efb52 [5/8] thermal: samsung: Add support for GS101 TMU
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: csky-randconfig-r112-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171433.IvJRVuyj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171433.IvJRVuyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601171433.IvJRVuyj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/samsung/acpm-tmu.c:641:1: sparse: sparse: bad integer constant expression
   drivers/thermal/samsung/acpm-tmu.c:641:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/thermal/samsung/acpm-tmu.c:642:1: sparse: sparse: bad integer constant expression
   drivers/thermal/samsung/acpm-tmu.c:642:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/thermal/samsung/acpm-tmu.c:643:1: sparse: sparse: bad integer constant expression
   drivers/thermal/samsung/acpm-tmu.c:643:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/thermal/samsung/acpm-tmu.c:643:1: sparse: sparse: bad integer constant expression
   drivers/thermal/samsung/acpm-tmu.c:643:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +641 drivers/thermal/samsung/acpm-tmu.c

b3ff68d0c031d62 Tudor Ambarus 2026-01-12  640  
b3ff68d0c031d62 Tudor Ambarus 2026-01-12 @641  MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
