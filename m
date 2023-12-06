Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1813DDA6
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 03:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkzAd7nA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701834815; x=1733370815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lYfQnXE4bsAUfl2mnFIbzvnDAfAIDJhQWRzBiNdEFaE=;
  b=DkzAd7nAEZTUzLb1GIypxtjoj2yMOOJUYvse9OhNqpYKupuGjK5qh//y
   FO5hqT2N66VbnFaMWnASYwScZCIpXqe6z0m/KlWDM6C9MFLcpiSgJ4jAR
   YH3TB6DbZCBR0AkA5FxEKVcixXi+MqjlqZfSO1vPod9GRNzxBozNoHWey
   LXZ4Oc7Op977hVQnWYwDJmGu+vUzzn9IZQ8oooOIBd8EhxZuKkFBWn5ho
   KVLd1ub5bRYABtZgoLHYbHqHnWlopLtTKF3h5IDmLtQwMr56eaOJZ7BAz
   bQMeqVnQO+8rbewFEUVG92DmvQzZNSUKkaZ4AUKMmyG1rerzZpMN7HM7N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="874037"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="874037"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 19:53:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720939252"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="720939252"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 19:53:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAiyZ-000ADU-1n;
	Wed, 06 Dec 2023 03:53:31 +0000
Date: Wed, 6 Dec 2023 11:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/include/asm/hw_breakpoint.h:135:16: sparse: sparse:
 cast from unknown type
Message-ID: <202312061142.zpXERgZ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/loongarch/include/asm/hw_breakpoint.h:135:16: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: WANG Xuerui <git@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 53a4858ccd0d27538f9ab1ac2bead002fca97edc LoongArch: Make the CPUCFG&CSR ops simple aliases of compiler built-ins
date:   5 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r133-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061142.zpXERgZ0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061142.zpXERgZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312061142.zpXERgZ0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:87:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:88:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:89:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:213:26: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:213:26: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:214:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:214:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:529:25: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/kernel/hw_breakpoint.c:529:25: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c: note: in included file (through arch/loongarch/include/asm/processor.h, arch/loongarch/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/loongarch/include/asm/hw_breakpoint.h:135:16: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/include/asm/hw_breakpoint.h:135:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/hw_breakpoint.h:141:16: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/include/asm/hw_breakpoint.h:141:16: sparse: sparse: cast from unknown type
>> arch/loongarch/include/asm/hw_breakpoint.h:135:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/hw_breakpoint.h:141:16: sparse: sparse: cast from unknown type

vim +135 arch/loongarch/include/asm/hw_breakpoint.h

edffa33c7bb5a73 Qing Zhang 2023-02-25  131  
edffa33c7bb5a73 Qing Zhang 2023-02-25  132  /* Determine number of BRP registers available. */
edffa33c7bb5a73 Qing Zhang 2023-02-25  133  static inline int get_num_brps(void)
edffa33c7bb5a73 Qing Zhang 2023-02-25  134  {
edffa33c7bb5a73 Qing Zhang 2023-02-25 @135  	return csr_read64(LOONGARCH_CSR_FWPC) & CSR_FWPC_NUM;
edffa33c7bb5a73 Qing Zhang 2023-02-25  136  }
edffa33c7bb5a73 Qing Zhang 2023-02-25  137  

:::::: The code at line 135 was first introduced by commit
:::::: edffa33c7bb5a73e90c754c7a497162b77d7c55f LoongArch: Add hardware breakpoints/watchpoints support

:::::: TO: Qing Zhang <zhangqing@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
