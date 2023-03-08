Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3702436D
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Mar 2023 23:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678319645; x=1709855645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2IVjLMqmhFsB8yvOL8sM1foOJRTBVA/X6ogskxmFQx4=;
  b=Mocutp+vZAL84DOlSA0X9++iFvQ/xP87bzVsSz3VyPuUB3WoNko/1HEZ
   EWU/vhHvJcP0svS3Of+lSXq3HpfYdcRa6BcMV7PdsCshiH+YZ0hX1t+Bs
   8mNn+RMPoudixYDEVYTMMuRz1a27IFffj9uRGt3+Y6L32mXpekrrT8Eom
   r25vkQub3lgyLIlS+qONmf7NNrr/9q7ASKc9V68QizpFUqiCvY3XqXtxA
   GvIWPmslVhXOmKdyzF/QJYV3m7wQc7SMTllNkXpPm5PuNUtDcNzHEkyn+
   z+DIC/M/sZ2NHqa5zWsk75Clm2KpK6gsHRIuMv+urqrtSc0UWzYWHPXo7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316701668"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="316701668"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 15:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820404625"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="820404625"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2023 15:54:03 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa3be-0002Uv-2c;
	Wed, 08 Mar 2023 23:54:02 +0000
Date: Thu, 9 Mar 2023 07:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can
 be declared as pointer to const [constParameter]
Message-ID: <202303090721.RbNl5X6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heiko Stuebner <heiko@sntech.de>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Wei Fu <wefu@redhat.com>
CC: Liu Shaohua <liush@allwinnertech.com>
CC: Guo Ren <guoren@kernel.org>
CC: Philipp Tomsich <philipp.tomsich@vrull.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a98c9cae232800c319ed69e1063480d31430887
commit: ff689fd21cb13098305bae3f8d0c0065df2e2fc1 riscv: add RISC-V Svpbmt extension support
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ff689fd21cb13098305bae3f8d0c0065df2e2fc1
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303090721.RbNl5X6W-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can be declared as pointer to const [constParameter]
           struct alt_entry *end,
                             ^
>> arch/riscv/kernel/patch.c:68:8: warning: Redundant initialization for 'waddr'. The initialized value is overwritten before it is read. [redundantInitialization]
    waddr = patch_map(addr, FIX_TEXT_POKE0);
          ^
   arch/riscv/kernel/patch.c:54:14: note: waddr is initialized
    void *waddr = addr;
                ^
   arch/riscv/kernel/patch.c:68:8: note: waddr is overwritten
    waddr = patch_map(addr, FIX_TEXT_POKE0);
          ^

vim +/end +288 arch/riscv/kernel/cpufeature.c

ff689fd21cb130 Heiko Stuebner 2022-05-11  286  
ff689fd21cb130 Heiko Stuebner 2022-05-11  287  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
ff689fd21cb130 Heiko Stuebner 2022-05-11 @288  						  struct alt_entry *end,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
