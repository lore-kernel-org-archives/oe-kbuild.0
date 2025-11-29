Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791BB156661
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 00:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376185; cv=none; b=Q2w2ij5gb3nzOoF0FFH8qNHQyHqgixllc/oJWrC3yUFenMuPaqFm7mZCGZjh3HCJJA1k3bkkL/2Fu4FL+I32QY6IkMXTzq6fwMiHVtaDyZn4nhxTgs4zdk+UDD995oXVAaCObFD8YT+Nuoawp+l9CbvK47km5hJkV5I48rBnEWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376185; c=relaxed/simple;
	bh=1uIitct+YSydhnZOdNLqLrK7wCJoQQTxCROVZ8Kj5J4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tABz00sgYQIY+rNPvPtfO5tnjAD66R/oXWj77VuxOpw6K0TWRNHiZl5Fyb+EubZ3rsSwmn3WFRmvhsmVqvaKYXTr0smwJ1H7O+6jFEms3Zz86nfG1kPl9OVExLhhdkHY7K+RIOFLCV2vLhHJ3G0N+MgPO/j6rNE3NDvYaF03gX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNO62Ror; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNO62Ror"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764376182; x=1795912182;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1uIitct+YSydhnZOdNLqLrK7wCJoQQTxCROVZ8Kj5J4=;
  b=ZNO62RorOd3hmKLXoJPxk44zu7ErS7i5udjFWJ/ykoSUHwHpCDJnyaKh
   sjVJGmKHyFFxndNJ0o0yUadNxDvXHqQ5ElOBc3/hQw7bEwMzDVw4zzbEi
   f4fEcStTpd04e4wVoYJNuYu4281ghuxuD6BHG8HSilInyAkGV44Atu4Af
   gQYuumUZidtdxkKyCBLxi/bR+136kLGUOBc2RolFZn6Ku9rm2/U5eHXT1
   00y/LYoka3fobf3kNd+sxU1PfSrTEIYjy6+DuSpJnlkezoPerv6qJ2YNS
   Bc8y/UrAB1+WbFY+UFC88HXSYOJRPanTjDCsPNNDq4f5uxZYjQchriRII
   A==;
X-CSE-ConnectionGUID: cWvHk+pYSgyv158f5gpA0A==
X-CSE-MsgGUID: wP7qyP1CR/OtgVzRCIMd0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66289054"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66289054"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 16:29:42 -0800
X-CSE-ConnectionGUID: i9isntcQRUSkSFLnIjfLzA==
X-CSE-MsgGUID: Jfn/sLUNRhmS3pumBDRiSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="224503808"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2025 16:29:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP8qJ-000000006qh-3kAJ;
	Sat, 29 Nov 2025 00:29:39 +0000
Date: Sat, 29 Nov 2025 08:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/vdso/vdso.so.dbg: dynamic relocations are not
 supported
Message-ID: <202511290808.urWwhoZK-lkp@intel.com>
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
:::::: Manual check reason: "dynamic relocations are not supported"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Nam Cao <namcao@linutronix.de>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e6640487845061255af9614ec0a192e4fafa486e
commit: d2862bb9d9ca58f41319a55db0ca275774ae0c6a LoongArch: vDSO: Switch to generic storage implementation
date:   9 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 months ago
config: loongarch-randconfig-r111-20251129 (https://download.01.org/0day-ci/archive/20251129/202511290808.urWwhoZK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290808.urWwhoZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511290808.urWwhoZK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/loongarch/vdso/Makefile:77: arch/loongarch/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/loongarch/Makefile:167: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
