Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8333223336
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 22:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768170082; cv=none; b=mm+tcOdLES5D3/cW+guG6ZUb7znujPMqrbjrNjOFK1tKY0hjdoRwsXG+HccjjjkaM+Nc+0YuHA6UenqUP+8jmDpCX5qVujE0L73elCzO7RZJK1BKwFT2LNFLM1bwi5gywMIO9ZESl7r7CDQw6KDUg+GQgCytJebbtICOiMQoEgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768170082; c=relaxed/simple;
	bh=lFk3/YykgQ+y526NdYGwJwqx2ZPF+/NUixg36sPZwhg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iBBqzINWWJOycZLBrHiBe2A12TXAuoQpOPommSKJS4zyY5qWvkGN5JyB/VmaAVhR0YgfgkEWbibv3oH8zqHrET3V6kN0G5bB+qdRxLINwu/i1uxb3EteaLtc1k0wrYzKS+BwT9pjx0smniLPvmZOnr5IQyTXzD6jg6rHJmeAeIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcFgzcKO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcFgzcKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768170081; x=1799706081;
  h=date:from:to:cc:subject:message-id;
  bh=lFk3/YykgQ+y526NdYGwJwqx2ZPF+/NUixg36sPZwhg=;
  b=bcFgzcKOIqny3Nf9F0eHs06MOrd1+rXsKhbnkn+65Ux8GDW2dDRsUSJn
   jemOHejxlHt2csrqGOZBPJYVxleo1neNF87HwyQYNRhw+vMQBzERqBHSG
   WoiQUVF0kLbkhfnJq6oG8NmpzJU0MQhtiu2s+khaCDHCQKZ3YsGvYRXlI
   nNR3aNBPBuy6vXUKIpc4xT68d7VSSjR7C449EL4/iHiSN7NOrKOiPX2rA
   xdX5fBm9wcxyM/Umv+u+8Wrc2hRoAJZeJD9NDwsvQ8ea+IYqN+3jJeJPV
   QcQolwwLs6BUe5/dpOYSB6MGdlqwslrPKE3Ly4sBP4g1HMznwqiJMUpuf
   w==;
X-CSE-ConnectionGUID: ZM1JhxnqSluzlVLZF8dvcQ==
X-CSE-MsgGUID: nLFbuuA9T9WloXkOXV313A==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="68657752"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="68657752"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 14:21:20 -0800
X-CSE-ConnectionGUID: dzAZppILQ9Wo9Rv4xRoC6A==
X-CSE-MsgGUID: 4SogghXDR7iB91+OfA5zxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204654822"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jan 2026 14:21:19 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf3oD-000000000VR-1S1c;
	Sun, 11 Jan 2026 22:21:17 +0000
Date: Sun, 11 Jan 2026 23:21:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 249/262] /tmp/tmp.nVkms6LzJd.c:1:10:
 fatal error: sys/types.h: No such file or directory
Message-ID: <202601112330.j74wTi02-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Kevin Brodsky <kevin.brodsky@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   4d2d0ad5d6a267cb4473e5f50e1b363e8a9fac3d
commit: 07d24f53d92b17b35fa289a56d2c93398af1288d [249/262] selftests/mm: pass down full CC and CFLAGS to check_config.sh
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260111/202601112330.j74wTi02-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601112330.j74wTi02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601112330.j74wTi02-lkp@intel.com/

Note: the akpm-mm/mm-unstable HEAD 4d2d0ad5d6a267cb4473e5f50e1b363e8a9fac3d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> /tmp/tmp.nVkms6LzJd.c:1:10: fatal error: sys/types.h: No such file or directory
       1 | #include <sys/types.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
