Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25543229
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Mar 2023 14:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677680603; x=1709216603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lXLgmzG+cwv+eJsZQWmalizLiUEEHvg5rGAkBvBMYiE=;
  b=fDBzEBIZQ+3Lx19aOfMUkKTR0JWTFs8Bj9dNdrolB7Ojoukw6ATj8Rzn
   M3v2hXJQ7SBC3KvVz/IdIYWpGY2KjUzEm4jqJHA63Fo3u1zhMSHuejiXc
   DuvojOqOUzim88EBinbYfZDWIgsW8JzuHZw3/iAf1WRg2XIaV5IzGrSIO
   j3PiMW06PAT6zwL8ynlkddi630f0F3yiURYk3joBZF2QvotsZZoglkGDk
   ty8lK3p18c2e6zJwpHqmYa8GTbWkZRPQrxJSMhhYEYxpo2Sw4aiM6IeFa
   O0BSwEknWD70YudZjrCN+t/HpSiZIOjJbZZ56ng0GhzFheO3zAkC/nwNh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="335911556"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="335911556"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 06:23:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738662688"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738662688"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 06:23:20 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXNMV-0006Cd-2t;
	Wed, 01 Mar 2023 14:23:19 +0000
Date: Wed, 1 Mar 2023 22:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13816/14297]
 arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: too many
 errors
Message-ID: <202303012258.PMGt4IJP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: too many errors"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Qing Zhang <zhangqing@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1716a175592aff9549a0c07aac8f9cadd03003f5
commit: edffa33c7bb5a73e90c754c7a497162b77d7c55f [13816/14297] LoongArch: Add hardware breakpoints/watchpoints support
:::::: branch date: 14 hours ago
:::::: commit date: 4 days ago
config: loongarch-randconfig-s041-20230226 (https://download.01.org/0day-ci/archive/20230301/202303012258.PMGt4IJP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=edffa33c7bb5a73e90c754c7a497162b77d7c55f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout edffa33c7bb5a73e90c754c7a497162b77d7c55f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303012258.PMGt4IJP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:216:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
>> arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: too many errors

vim +226 arch/loongarch/include/asm/loongarch.h

f2ac457a61389b Huacai Chen 2022-05-31  223  
f2ac457a61389b Huacai Chen 2022-05-31  224  static __always_inline void csr_write64(u64 val, u32 reg)
f2ac457a61389b Huacai Chen 2022-05-31  225  {
f2ac457a61389b Huacai Chen 2022-05-31 @226  	__csrwr_d(val, reg);
f2ac457a61389b Huacai Chen 2022-05-31  227  }
f2ac457a61389b Huacai Chen 2022-05-31  228  

:::::: The code at line 226 was first introduced by commit
:::::: f2ac457a61389b7769aad8295027cbe0f91c5b80 LoongArch: Add CPU definition headers

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
