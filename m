Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE9199
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 04:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674102938; x=1705638938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4KluNWcY+62Km01VPW6FiwwpPF3TrncqdxpIV2X0kLg=;
  b=NwKnjbnMoWTFbErfH2hCN0Zxp6sygyCqLBAlh08Y33WadfnIk50O2+4h
   W6YNZcHsE7HQqCnDKBg6NsXpolMfgu+ZJKXc6GQZ9dgHBuLWsUj6Ikh49
   ly+6nzvnEUY9e1jgIV4iW/tV+9McpMDautEOSybmXryivPerkcBjaeNGd
   nQZ22DLiI66dvireTZ7f+vrqVaYDDDRfVQ5j7r8ZsSq+TTBeQg74fsC9D
   RNCEdfWtrzpalow5vwGx2E6kTmRUBzwtHzh6tkaiwHx15QWl8CyzmbK2H
   mJgoZFVZ2qdTmavIKodsd8vSTjS0I1msTNywnXC5d/MElK7FcUPqc29zL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="387540142"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="387540142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 20:35:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692278402"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="692278402"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Jan 2023 20:35:37 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIMeB-00015L-28;
	Thu, 19 Jan 2023 04:35:31 +0000
Date: Thu, 19 Jan 2023 12:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [netfilter-nf-next:master 6/9] net/netfilter/nf_tables_core.c:39:20:
 warning: unused function 'nf_skip_indirect_calls'
Message-ID: <202301191223.ChZ7WFs5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Florian Westphal <fw@strlen.de>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git master
head:   68e5b6aa2795fd05c6ff58616cb16f2f216e4123
commit: d8d76062785548167cbc01eb5aaae2ae0665b5da [6/9] netfilter: nf_tables: add static key to skip retpoline workarounds
:::::: branch date: 14 hours ago
:::::: commit date: 16 hours ago
config: arm64-buildonly-randconfig-r005-20230118 (https://download.01.org/0day-ci/archive/20230119/202301191223.ChZ7WFs5-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git/commit/?id=d8d76062785548167cbc01eb5aaae2ae0665b5da
        git remote add netfilter-nf-next git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git
        git fetch --no-tags netfilter-nf-next master
        git checkout d8d76062785548167cbc01eb5aaae2ae0665b5da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/bpf/ net/netfilter/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_tables_core.c:39:20: warning: unused function 'nf_skip_indirect_calls' [-Wunused-function]
   static inline bool nf_skip_indirect_calls(void) { return false; }
                      ^
   1 warning generated.


vim +/nf_skip_indirect_calls +39 net/netfilter/nf_tables_core.c

d8d760627855481 Florian Westphal 2023-01-03  32  
d8d760627855481 Florian Westphal 2023-01-03  33  static void __init nf_skip_indirect_calls_enable(void)
d8d760627855481 Florian Westphal 2023-01-03  34  {
d8d760627855481 Florian Westphal 2023-01-03  35  	if (!cpu_feature_enabled(X86_FEATURE_RETPOLINE))
d8d760627855481 Florian Westphal 2023-01-03  36  		static_branch_enable(&nf_tables_skip_direct_calls);
d8d760627855481 Florian Westphal 2023-01-03  37  }
d8d760627855481 Florian Westphal 2023-01-03  38  #else
d8d760627855481 Florian Westphal 2023-01-03 @39  static inline bool nf_skip_indirect_calls(void) { return false; }
d8d760627855481 Florian Westphal 2023-01-03  40  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
