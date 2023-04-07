Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D10B8494
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Apr 2023 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680891120; x=1712427120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FCTH4/dXYw5OkAZ4atGET1/f1SH8FZLOQidx4HgYACs=;
  b=St4blPlHWevIuBMx1jabDIlXsawyYt3ObsbdSE5U+lw8zNEZs0AR2lPi
   4TR3rhRfXNiob9y9tg1LPvkG/Ksf6Sf7GGpA2tgNjneWKUnMysf8c3tSv
   GSpWFb9n4TztmZ4FeaNWW0Zhr3mZpJEzzwctZeqEZlZHUW8cmOv/4v2Nz
   yDriUwMlvcqLjO8KvO32a3L/ipS2P1Qhj0ahMhm1YT+T/gkRUIfb5vkhi
   NMHjWabuD7dpard+ZaVaM/TPf1Pdd2WR6+A5iDzaEPYOCpZ0UO3KItHe/
   +dhFagLD/cNj1TkosYFh4d13/jrjHEjd2YJH3dVCOvPLeBx4dFIHSx/i1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="345693804"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="345693804"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="717916026"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="717916026"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2023 11:11:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqZ3-000Sla-1p;
	Fri, 07 Apr 2023 18:11:57 +0000
Date: Sat, 8 Apr 2023 02:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool-test 5/18]
 arch/arm64/kernel/entry-common.c:843:36: sparse:    void extern
 [addressable] [noreturn] [toplevel] handle_bad_stack( ... )
Message-ID: <202304080203.FvtFudIc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/kernel/entry-common.c:843:36: sparse:    void extern [addressable] [noreturn] [toplevel] handle_bad_stack( ... )"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-test
head:   9246164af5d4ff960aca81fc04bdf20e45df5823
commit: cab45eaeec81c04eef91285bce5f93fc4fb39e9e [5/18] arm64/cpu: Mark cpu_park_loop() and friends __noreturn
:::::: branch date: 10 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-s052-20230404 (https://download.01.org/0day-ci/archive/20230408/202304080203.FvtFudIc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=cab45eaeec81c04eef91285bce5f93fc4fb39e9e
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-test
        git checkout cab45eaeec81c04eef91285bce5f93fc4fb39e9e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304080203.FvtFudIc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/entry-common.c:843:36: sparse: sparse: symbol 'handle_bad_stack' redeclared with different type (different modifiers):
>> arch/arm64/kernel/entry-common.c:843:36: sparse:    void extern [addressable] [noreturn] [toplevel] handle_bad_stack( ... )
   arch/arm64/kernel/entry-common.c: note: in included file:
   arch/arm64/include/asm/exception.h:34:17: sparse: note: previously declared as:
>> arch/arm64/include/asm/exception.h:34:17: sparse:    void extern [addressable] [toplevel] handle_bad_stack( ... )

vim +843 arch/arm64/kernel/entry-common.c

8168f098867f65 Mark Rutland     2021-06-07  841  
8168f098867f65 Mark Rutland     2021-06-07  842  #ifdef CONFIG_VMAP_STACK
cab45eaeec81c0 Josh Poimboeuf   2023-02-22 @843  asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
8168f098867f65 Mark Rutland     2021-06-07  844  {
8d56e5c5a99ce1 Alexandru Elisei 2022-04-25  845  	unsigned long esr = read_sysreg(esr_el1);
8168f098867f65 Mark Rutland     2021-06-07  846  	unsigned long far = read_sysreg(far_el1);
8168f098867f65 Mark Rutland     2021-06-07  847  
8168f098867f65 Mark Rutland     2021-06-07  848  	arm64_enter_nmi(regs);
8168f098867f65 Mark Rutland     2021-06-07  849  	panic_bad_stack(regs, esr, far);
8168f098867f65 Mark Rutland     2021-06-07  850  }
8168f098867f65 Mark Rutland     2021-06-07  851  #endif /* CONFIG_VMAP_STACK */
d60b228fd19985 Mark Rutland     2021-06-07  852  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
