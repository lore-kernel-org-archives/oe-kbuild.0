Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079E7225D6
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 05:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754112094; cv=none; b=DsJzB2Q1WcQcol5OLv9pbqC5xlrb+IHIvCDtG2USZUT+Fx2gqf5Alt71bZ9OgYxnVgR1163QbgXBAK9+zmEmEip/RXFaZ7mr8E9eAr/lBhsqWX9cCMLFb+LGPIjTx9c1s062dhoTvJb3XZaxcPZneYolOy0JNwsNdH8J+QpTwK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754112094; c=relaxed/simple;
	bh=3GIZUv7OgaPXZC47G/UWrf7uAjHT2LfjwuBQF8ecHZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZwW46/2opXatwaqmcujuRy75BpR67JbK2c37L2pmRrOdLZRLPgn8/mMq3kQLOi205v9eer8Z25S8oJEX6OhQ73kT3aidI5QX2SHreXW2xAxe2EEMqmZ3IUR3b4rIbyxTvBKV5ho544HhjJYUnK6TmzBU6Gu12l/dwMudQylAWPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MU7RJMhy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MU7RJMhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754112092; x=1785648092;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3GIZUv7OgaPXZC47G/UWrf7uAjHT2LfjwuBQF8ecHZU=;
  b=MU7RJMhyBPdoo0P7Y9w/6IFLD7F3vqlMVfRCWLopYso7uX+QdOIIx6EY
   P2fz+CjOP3TYqiXRSAaxYEQ7bW8+iHwV/AjJ0hj2agnORoRo1gAGiDxs0
   L7jEFEoBpcERKJS1DXdbS0lQV+VYMD5dP8f9oWpXLIAao2zuCrQ4T77UB
   c3npCPqlUg30hG8/Q5+vG7V+FwldSt9NY3q2qVAWtkd/L8pnuVDU8zuv8
   nGAJnPc2vuvwqbGMdKycP97sNFpwld13pBHrTAidrCCxr4NfJf7wzetTk
   Ev8FBxIz+XTdH6uNRT24a1dVGqgXFklsmTJhLFrXcIBO//uS/7TmeG0u+
   A==;
X-CSE-ConnectionGUID: 1TT2QV2GQQuHEcBlZ82YHg==
X-CSE-MsgGUID: CG04/99VRqu0IaBKsjQSeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="59076925"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59076925"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 22:21:32 -0700
X-CSE-ConnectionGUID: DE/q0/fGS2qInQRoU7Nm6w==
X-CSE-MsgGUID: TZ3iDum6RguG4NVNw6hMvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169023840"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Aug 2025 22:21:30 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui4gS-0005Bw-27;
	Sat, 02 Aug 2025 05:21:28 +0000
Date: Sat, 2 Aug 2025 13:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/vdso/vdso.so.dbg: dynamic relocations are not
 supported
Message-ID: <202508021329.QnK6MvKk-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a6923c06a3b2e2c534ae28c53a7531e76cc95cfa
commit: d2862bb9d9ca58f41319a55db0ca275774ae0c6a LoongArch: vDSO: Switch to generic storage implementation
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r052-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021329.QnK6MvKk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021329.QnK6MvKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508021329.QnK6MvKk-lkp@intel.com/

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
