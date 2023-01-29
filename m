Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14533DF
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675030564; x=1706566564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6hGPxDP8GVY72QNfrL9vTP5YmbMjiO4qny25ETpivw=;
  b=JusxmdC/evjKw+uoypIUUB3s+6Hg3dgFgL7k1MUvUSf2zWakjWr58/lv
   tWY/RlQmTD9fLUrpvyHojajWy9VIZYN06ZcxZsRNqz5yesQe7uvDGyxmK
   sH9xULapVRMZAbPrgj+fXcD9ZHxflgxlLNNPtuRbnh995qTJTTvhnfGfE
   akWoeR1Vuy3mLAbbKjt4WhwirmiCQGb6g+8wEVX3vXS6oUMqAYojRJUcK
   0DY+MuXIi4geoZTOKU/ABJDLKg7lLbGPSVhVX9/r+ZuMN9g/5l0mYnFID
   IfNOOUOa1Ju9vlwMkYa/rOOeAokOwl80mm7jA6WYVNhaeUxFcY+oPpZS6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307088031"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="307088031"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 14:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="732489419"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="732489419"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2023 14:16:02 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMFxy-000394-07;
	Sun, 29 Jan 2023 22:16:02 +0000
Date: Mon, 30 Jan 2023 06:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/compressed/../../../../lib/ashldi3.c:9:19: warning:
 no previous prototype for function '__ashldi3'
Message-ID: <202301300658.biXwHEX4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/mips/boot/compressed/../../../../lib/ashldi3.c:9:19: warning: no previous prototype for function '__ashldi3' [-Wmissing-prototypes]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mikhail Zhilkin <csharper2005@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab072681eabe1ce0a9a32d4baa1a27a2d046bc4a
commit: 105c14b84d93168431abba5d55e6c26fa4b65abb mtd: parsers: scpart: fix __udivdi3 undefined on mips
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-c004-20230123 (https://download.01.org/0day-ci/archive/20230130/202301300658.biXwHEX4-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=105c14b84d93168431abba5d55e6c26fa4b65abb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 105c14b84d93168431abba5d55e6c26fa4b65abb
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/mips/boot/compressed/../../../../lib/ashldi3.c:9:19: warning: no previous prototype for function '__ashldi3' [-Wmissing-prototypes]
   long long notrace __ashldi3(long long u, word_type b)
                     ^
   arch/mips/boot/compressed/../../../../lib/ashldi3.c:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   long long notrace __ashldi3(long long u, word_type b)
   ^
   static 
   1 warning generated.


vim +/__ashldi3 +9 arch/mips/boot/compressed/../../../../lib/ashldi3.c

b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  8  
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23 @9  long long notrace __ashldi3(long long u, word_type b)

:::::: The code at line 9 was first introduced by commit
:::::: b35cd9884fa5d81c9d5e7f57c9d03264ae2bd835 lib: Add shared copies of some GCC library routines

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
