Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CD81624D5
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 02:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769827365; cv=none; b=p//jqWORn1vPugubSMJEa958eO0eFtuH5ZSzkO32a6+snjFIfOdGlOuCZ4YZsgepWDKa8gO9Dk8uljNIqgGcvjsZrpUeK4rl7rgIXmjf19AvixmouJiMYfVLCcHKwOaE5qaoE0ouAFR4L8W/TgvEjZzJraJpN130itkL1BrfCCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769827365; c=relaxed/simple;
	bh=kBbNkiEkuVuHzv8qsCd8tcsGUgfNc3vqOUYyB9N19U4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AVkemzhSJrA1X+xAb4OStLStKWu6z/O+bmYgzVUQwl/WJjkg0JxfM15b/ueThKmxSoP9d2CxCXjWaB2fhRrbzA2Dt8yWIAFQNuneSMcE7TSuX4cTz2QFvohYN1wXF0PGea3ZOW0IcJDFTzci9Ai6t8IkppmePrAgiF06dtZM2V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tc74fQQC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tc74fQQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769827363; x=1801363363;
  h=date:from:to:cc:subject:message-id;
  bh=kBbNkiEkuVuHzv8qsCd8tcsGUgfNc3vqOUYyB9N19U4=;
  b=Tc74fQQCR4UfXC0p7xZS1hiAj2ltG5Wi7G2u5O2gLJJMtf8YLKdFZ79J
   RV9nMFNqBnPLGMnIaw++sqhuNZY4LS29FKm4tgkyn7bGmyvw0cqhatyf7
   CfIsEvMv1l3bRVYPBvVq8IcqqUIULjNvKa80yyb020d3Cg6SH8UKXLk7+
   S2pCib1B62kNjLGWS6eW1Kn/AFF8KWeEZ5aeUFu/IRg9TScH9RM+69zh8
   I0HnVu+qxxwHyRMEEQXjtliraWcjDLtzcuQtT2ILB8oheD3ayD+zXHu6O
   0qKTK0Rk16aH8m2ewtJPh1gsAgYxVmmBpBXcsC5K5gw/Ew8bpAlsb7o1E
   Q==;
X-CSE-ConnectionGUID: 7mb6F+IHSAK5J4I+zBtdSQ==
X-CSE-MsgGUID: ymmWrNe5Q1mBvxK0MCWMTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="82447903"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="82447903"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 18:42:43 -0800
X-CSE-ConnectionGUID: ZKmKZeYdT/ijyBUh32pHDw==
X-CSE-MsgGUID: eQhZT50dTjO4nL4sxNJwiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209233091"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jan 2026 18:42:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm0wa-00000000daO-0dHG;
	Sat, 31 Jan 2026 02:42:40 +0000
Date: Sat, 31 Jan 2026 10:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:timers/vdso 12/18] arch/riscv/kernel/vdso/vdso.so.dbg:
 dynamic relocations are not supported
Message-ID: <202601311024.bOePole6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dynamic relocations are not supported"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Ian Rogers <irogers@google.com>
CC: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   546e9289c74f606423ef72075b34cc38eda3bb49
commit: a339671db64b12bb02492557d2b0658811286277 [12/18] vdso: Switch get/put_unaligned() from packed struct to memcpy()
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-r064-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311024.bOePole6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311024.bOePole6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601311024.bOePole6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/riscv/kernel/vdso/Makefile:61: arch/riscv/kernel/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/riscv/Makefile:160: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
