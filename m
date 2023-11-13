Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE79F9E0
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 05:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXizVWFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699852758; x=1731388758;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iVjSc3oCk05I3PrVjCqkZUs2GXeNRnz2N3elox4L5B8=;
  b=CXizVWFbKTXcGfyfAaZKEihpqQp8DBC7U4fayMxRD1vnj4wPQlp2iA9Y
   VEkO6U42ABh0xftmXooCMqjXuV6dyRpkbFTSEROIElVzXhzYX8fw8/kJo
   nPYF9Y17jBucGn8rnadmXAn71VnnhURrBWE/aaGSx8HKQ/Pw7IvfbK1uL
   xs9uZ239uJSB2y/piqoZv4lnvvqvWgiWYpHJDFVQ74J2wQ9ArsjuMPPPJ
   XCrwcbNG1PjajUVJBfgs9b+4jGVjS0yXnEQvYs8HKEzRBfRKMMVUirl+x
   d9vMFoHoPsEHb2VmFV7er0YHvsQy9m3p990QucQYkxqXpnVRVTkM0nTBn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="389245602"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="389245602"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 21:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="881563026"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="881563026"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2023 21:19:16 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2PLu-000Bq4-1l;
	Mon, 13 Nov 2023 05:19:14 +0000
Date: Mon, 13 Nov 2023 13:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 14/19] heki: x86: Initialize permissions counters
 for pages mapped into KVA
Message-ID: <202311131254.C8WZC0U9-lkp@intel.com>
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
:::::: Manual check reason: "fbc 5dc2a03f8c532db0c352fd8cc08cefd8cbae43e6 and parent 44ac2f6f2e17897d27676ba4e80879929a1af167 have different kconfig"
:::::: Manual check reason: "has kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231113022326.24388-15-mic@digikod.net>
References: <20231113022326.24388-15-mic@digikod.net>
TO: "Mickaël Salaün" <mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 881375a408c0f4ea451ff14545b59216d2923881]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/virt-Introduce-Hypervisor-Enforced-Kernel-Integrity-Heki/20231113-102847
base:   881375a408c0f4ea451ff14545b59216d2923881
patch link:    https://lore.kernel.org/r/20231113022326.24388-15-mic%40digikod.net
patch subject: [RFC PATCH v2 14/19] heki: x86: Initialize permissions counters for pages mapped into KVA
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20231113/202311131254.C8WZC0U9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131254.C8WZC0U9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311131254.C8WZC0U9-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARNING: unmet direct dependencies detected for SPARSEMEM
   Depends on [n]: !SELECT_MEMORY_MODEL [=n] && ARCH_SPARSEMEM_ENABLE || SPARSEMEM_MANUAL [=n]
   Selected by [y]:
   - HEKI [=y] && ARCH_SUPPORTS_HEKI [=y] && HYPERVISOR_SUPPORTS_HEKI [=y] && !X86_16BIT
   In file included from include/linux/mm_types.h:18,
   from include/linux/sched/signal.h:13,
   from include/linux/ptrace.h:7,
   from arch/openrisc/kernel/asm-offsets.c:28:
>> include/linux/page-flags-layout.h:30:10: fatal error: asm/sparsemem.h: No such file or directory
   30 | #include <asm/sparsemem.h>
   |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:116: arch/openrisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SPARSEMEM
   Depends on [n]: !SELECT_MEMORY_MODEL [=n] && ARCH_SPARSEMEM_ENABLE || SPARSEMEM_MANUAL [=n]
   Selected by [y]:
   - HEKI [=y] && ARCH_SUPPORTS_HEKI [=y] && HYPERVISOR_SUPPORTS_HEKI [=y] && !X86_16BIT


vim +30 include/linux/page-flags-layout.h

1587db62d8c0db Yu Zhao        2021-04-29  28  
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  29  #ifdef CONFIG_SPARSEMEM
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22 @30  #include <asm/sparsemem.h>
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  31  #define SECTIONS_SHIFT	(MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
1587db62d8c0db Yu Zhao        2021-04-29  32  #else
1587db62d8c0db Yu Zhao        2021-04-29  33  #define SECTIONS_SHIFT	0
1587db62d8c0db Yu Zhao        2021-04-29  34  #endif
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
