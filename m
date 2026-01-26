Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF373EBF2D
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 04:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769401062; cv=none; b=VE9NVlZximwXiaGvHggRc+YhZ34mYGNvlEc1s2V6lMlk8+rX+xuwomgQO6idIlSgo6UVwkk1DmlCFNveJSFyqEDKSj21j4j8qHk9TQhN7z9AihTPCt7YNurBwmWdG+lPamw2E1nck/RleLy+wF4XqqDuw1w7cmKGgaFGcc6HEUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769401062; c=relaxed/simple;
	bh=tzJBpClhhZ5pyfMg1+un4r5DEGCjAi3jvtPANnBUNoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bPyECfYwlv5K5ZmA3ZycEdUL58SFIYNoHdS95Tpr+Fteq2ylRx5xA1MN6W0o0am0/pu3CVgYqKFBHyGpFSTxtZr/gXkI0OSFWrTzfemQVUCwlv5ugl4+M57JBrGj0fvTFRQjjUlnDsNGMvGmFX0ZMkkAvsISEzFv8J0PprwgAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHMv0514; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHMv0514"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769401062; x=1800937062;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tzJBpClhhZ5pyfMg1+un4r5DEGCjAi3jvtPANnBUNoQ=;
  b=hHMv0514YcFAiCXEKawYRYTyMuvqpeS4f7Bq3dfv4qljQefj71fEWd0X
   npFanQ0hMOhL1IRDTSqMZcJzYq7/fwEHmNOhCaYmZV0Mg5e/8tMLI2C/S
   mOIC/0fS05qu4T6pXonMxQz6IKQPddwXrOqk8mLc/PRTzqgIt7oLoQQoo
   M+XXmwrpufz3k+DkljylSRtnkqvcuWQt5b3KZllTo8tzAKcNv3Sj5QEUo
   6p8jBsaw6GCpkrlRwG5pIQnkFLN46yYwbYiPHdyJg6aUxo4Huj6pYRQWA
   eFb51N7r7MUmSh5tnFwWr63snkjW9aNC3YhX05qR6M3kmAwBc3ACZ+Mqh
   w==;
X-CSE-ConnectionGUID: mkoWq7QCQAmwN7/VP5FK9w==
X-CSE-MsgGUID: pvdYcyRVRu+872xzOsH/TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70622980"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70622980"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 20:17:41 -0800
X-CSE-ConnectionGUID: ff7zVyefQhOOJ/FUky/B5g==
X-CSE-MsgGUID: p7lXkzxyQ9upRnHXL5eBgA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jan 2026 20:17:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkE2j-00000000Wsr-2KFA;
	Mon, 26 Jan 2026 04:17:37 +0000
Date: Mon, 26 Jan 2026 12:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/vdso/vdso.so.dbg: dynamic relocations are not
 supported
Message-ID: <202601261243.PcaLOxI1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dynamic relocations are not supported"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Nam Cao <namcao@linutronix.de>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   63804fed149a6750ffd28610c5c1c98cce6bd377
commit: d2862bb9d9ca58f41319a55db0ca275774ae0c6a LoongArch: vDSO: Switch to=
 generic storage implementation
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-r053-20260126 (https://download.01.org/0day-ci=
/archive/20260126/202601261243.PcaLOxI1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260126/202601261243.PcaLOxI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601261243.PcaLOxI1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/loongarch/vdso/Makefile:77: arch/loongarch/vdso/vdso.=
so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of=
 errors.
   make[2]: *** [arch/loongarch/Makefile:167: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
