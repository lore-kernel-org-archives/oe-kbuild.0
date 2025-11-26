Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D7D31D399
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764163258; cv=none; b=KZeAqOsMMm9fCPNbHon4JTx25oO0ft3f8pdNACssrC7VCV9rFbURQ/JHWJE1wnZAZ7phIzuFoXDIyrpE4TkCCHUa9VMwlHucNiQBZxfH78KnpotwnS2N2tp+o40t5BuPXIQzu1wNVAuEvAqjylYetsr5znW9wzXAH94Zj0t0YLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764163258; c=relaxed/simple;
	bh=pIpv+0WIg5+Cr9kRz/H5I8m6IeAgDMl2gmra8GjwZyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZiIqakhno5TjrEloeDBHxVmAwb7pVp+94Yb0Jw3bU+pm/Xbd2c8O+nL0X1iKpkZWzUJsjMFtn+7E+Tdox+dZJYV0yFaUG1jl8fs4H2C6QG32S3qG4+kiYZ7sVcWZpyVcRg+itRPbm0uCjabUxlga8Q0jKhgwLDkIJSr9EJFwPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkfhlFLK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkfhlFLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764163256; x=1795699256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pIpv+0WIg5+Cr9kRz/H5I8m6IeAgDMl2gmra8GjwZyU=;
  b=OkfhlFLKiFBEQCGrVbS/3dJKwc3BCWk6ilXgGYPQrOBDZmWk54gYTEYo
   xd++d8JdfYukJrE8wIU7VukBU/SqGBsS4msy8SGrDD1W23suM6ad8PhKq
   VvSufIivx6tnLJakEPbpHGKt/jWmghD7AXIH7VxtN9vjUFsr2SavYjops
   8D/mQ5VMnUCneax6DM35v8+dng13Nd70Rte5EPYlfYX/GE99OCps7Zc7I
   QWR8q5p1P+XhIdv5g0xDUhePiiyHpdbnEuENY+hT0Gt1QON7EhoR4sbw+
   hVPZQpmWXm1iok2eQmEaJGY/Imiy8KSAT5Encb4A5G4nNADIexqint4cX
   g==;
X-CSE-ConnectionGUID: 1/VBq8FDRQCFKOKNCP/wJA==
X-CSE-MsgGUID: YMINw8OHRnCTH/IBHPemKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83592261"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="83592261"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:20:56 -0800
X-CSE-ConnectionGUID: DGnAMl9PQXW3msBlfbzKHw==
X-CSE-MsgGUID: zgU9pawHTTSMOPNXbWLPQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193030308"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2025 05:20:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOFS0-000000002uV-2MEV;
	Wed, 26 Nov 2025 13:20:52 +0000
Date: Wed, 26 Nov 2025 21:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11675/12060] arch/s390/kernel/vdso/vdso.so.dbg:
 dynamic relocations are not supported
Message-ID: <202511262104.Li39R7qd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dynamic relocations are not supported"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Jens Remus <jremus@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   663d0d1af3faefe673cabf4b6b077149a87ad71f
commit: c0087d807ae86cc82cc356e366d2dccf0e3bb225 [11675/12060] s390/vdso: Rename vdso64 to vdso
:::::: branch date: 10 hours ago
:::::: commit date: 23 hours ago
config: s390-randconfig-r072-20251126 (https://download.01.org/0day-ci/archive/20251126/202511262104.Li39R7qd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262104.Li39R7qd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511262104.Li39R7qd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/s390/kernel/vdso/Makefile:54: arch/s390/kernel/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:154: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
