Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39DB10EC
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679218806; x=1710754806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bjuFeoAOGmdiYEJuIYhezMFe4C/tV06svMg9arqxl1U=;
  b=Efu2//kMurkIJXuQk9l/Zt5K+VksEG9s9k/i7faSo+WedC6AVDCHmQRC
   21ewDtV/aKSJMkX1vzz6HGzwRNV1ZSezPmLqkNyqDXLUjoM84oNoEHOxO
   bPOFnYTnqUfpvfl9vLlewt/XbdhgBKQlpNHiqv+POLQ95mVDvWgApBvRy
   0Sjaq8+cDKT5qE0Get2+BLlBXrjuBIjBHfSqrZW07VC8Ztqh/CjUhXjym
   hi5Tv7sMJZxGkKFRFCeK2wZO8S88ZZDY0FX7bo9AAwcwDYR5/27DQcYfK
   LJxxtV+ALdBnqKk/EtQN/MQaOoFNfolsUq6oB+Bvp45QYHeK6/XbC64I8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="401069928"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="401069928"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 02:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="680759466"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="680759466"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Mar 2023 02:40:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdpWG-000AUH-1i;
	Sun, 19 Mar 2023 09:40:04 +0000
Date: Sun, 19 Mar 2023 17:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:dd-drm-fix-next 16/19] include/linux/map.h:17:9: sparse: this
 was the original definition
Message-ID: <202303191709.0Kzf4J8B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/map.h:17:9: sparse: this was the original definition"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dd-drm-fix-next
head:   c4b31485bf709f2667d85485ee94f8bc2f7c91d1
commit: 1ea6546fdc0cb7ab5b9c4dc05af37dff22781c10 [16/19] dyndbg-API: DYNDBG_CLASSMAP_DEFINE() improvements
:::::: branch date: 4 hours ago
:::::: commit date: 5 hours ago
config: m68k-randconfig-s043-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191709.0Kzf4J8B-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jimc/linux/commit/1ea6546fdc0cb7ab5b9c4dc05af37dff22781c10
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout 1ea6546fdc0cb7ab5b9c4dc05af37dff22781c10
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303191709.0Kzf4J8B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/core.c:2036:9: sparse: sparse: preprocessor token EVAL1 redefined
   kernel/bpf/core.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/module.h, include/linux/bpf.h, ...):
>> include/linux/map.h:17:9: sparse: this was the original definition
   kernel/bpf/core.c:2037:9: sparse: sparse: preprocessor token EVAL2 redefined
   include/linux/map.h:18:9: sparse: this was the original definition
   kernel/bpf/core.c:2038:9: sparse: sparse: preprocessor token EVAL3 redefined
   include/linux/map.h:19:9: sparse: this was the original definition
   kernel/bpf/core.c:2039:9: sparse: sparse: preprocessor token EVAL4 redefined
   include/linux/map.h:20:9: sparse: this was the original definition
   kernel/bpf/core.c:232:49: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:1822:43: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:1827:48: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2073:77: sparse: sparse: subtraction of functions? Share your drugs

vim +17 include/linux/map.h

cda0e3ffa09019 Jim Cromie 2023-03-18  15  
cda0e3ffa09019 Jim Cromie 2023-03-18  16  #define EVAL0(...) __VA_ARGS__
cda0e3ffa09019 Jim Cromie 2023-03-18 @17  #define EVAL1(...) EVAL0(EVAL0(EVAL0(__VA_ARGS__)))
cda0e3ffa09019 Jim Cromie 2023-03-18  18  #define EVAL2(...) EVAL1(EVAL1(EVAL1(__VA_ARGS__)))
cda0e3ffa09019 Jim Cromie 2023-03-18  19  #define EVAL3(...) EVAL2(EVAL2(EVAL2(__VA_ARGS__)))
cda0e3ffa09019 Jim Cromie 2023-03-18  20  #define EVAL4(...) EVAL3(EVAL3(EVAL3(__VA_ARGS__)))
cda0e3ffa09019 Jim Cromie 2023-03-18  21  #define EVAL(...)  EVAL4(EVAL4(EVAL4(__VA_ARGS__)))
cda0e3ffa09019 Jim Cromie 2023-03-18  22  

:::::: The code at line 17 was first introduced by commit
:::::: cda0e3ffa090194c6cae2071c4c2044477aad9a3 dyndbg: add map.h, test_map_h.c (RFC)

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
