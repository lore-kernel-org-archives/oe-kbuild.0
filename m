Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3E819930
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jun 2023 18:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686247997; x=1717783997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ELAwOpTeAGBUlBmd58Xim/Vytutl6FFQoSIo0qLRloo=;
  b=Gscw6PsWrKm9oP0/xM6ZWpuDvMUXSRi7OAheSiDmpjztYbfQG6nbAdnD
   CcO/MexZjEHXnLbmKVSFblehzUbhV4xi2uA2te1lEeQ0CCzP5OeYoKX+M
   HW5nYNZlPiDWmYKkEPO4Zw1Yiu+jK8JAPB9aVPY8sa2CSEVT+JmhYc0b6
   Jyyd8UserJ2H6YBn4MTH7bdZAtkpeFSXP4bqHTDuB4w5EsAD7O7TmasTt
   P0LWICmmy1lHA+nUSVo/0NAtYNCpUOU2cc1AQNqsy6IyLMSnOSDOj2kaq
   HVpxdP4DODVQLgrk4E6UP0fdxrB5g9P7q4s65srCKCcl25stM7UUNIw0m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="342064725"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="342064725"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 11:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="854445783"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="854445783"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2023 11:09:37 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7K4m-000896-2o;
	Thu, 08 Jun 2023 18:09:36 +0000
Date: Fri, 9 Jun 2023 02:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7389/8065]
 include/asm-generic/bitops/instrumented-non-atomic.h:141: undefined
 reference to `uv_info'
Message-ID: <202306090202.CddcOgQ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/asm-generic/bitops/instrumented-non-atomic.h:141: undefined reference to `uv_info'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Steffen Eiden <seiden@linux.ibm.com>
CC: Claudio Imbrenda <imbrenda@linux.ibm.com>
CC: Janosch Frank <frankja@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   db10f126048021b86e43a5d6a335ec49dec10155
commit: 6ea10af0617e18118653e041b4c3bb32e92421ad [7389/8065] s390/uvdevice: Add 'Add Secret' UVC
:::::: branch date: 14 hours ago
:::::: commit date: 26 hours ago
config: s390-randconfig-s052-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090202.CddcOgQ6-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6ea10af0617e18118653e041b4c3bb32e92421ad
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6ea10af0617e18118653e041b4c3bb32e92421ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306090202.CddcOgQ6-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/s390/char/uvdevice.o: in function `_test_bit':
>> include/asm-generic/bitops/instrumented-non-atomic.h:141: undefined reference to `uv_info'


vim +141 include/asm-generic/bitops/instrumented-non-atomic.h

81d2c6f81996e0 Daniel Axtens     2019-08-20  132  
81d2c6f81996e0 Daniel Axtens     2019-08-20  133  /**
e69eb9c460f128 Alexander Lobakin 2022-06-24  134   * _test_bit - Determine whether a bit is set
81d2c6f81996e0 Daniel Axtens     2019-08-20  135   * @nr: bit number to test
81d2c6f81996e0 Daniel Axtens     2019-08-20  136   * @addr: Address to start counting from
81d2c6f81996e0 Daniel Axtens     2019-08-20  137   */
0e862838f29014 Alexander Lobakin 2022-06-24  138  static __always_inline bool
e69eb9c460f128 Alexander Lobakin 2022-06-24  139  _test_bit(unsigned long nr, const volatile unsigned long *addr)
81d2c6f81996e0 Daniel Axtens     2019-08-20  140  {
27f937cc810aef Marco Elver       2020-01-21 @141  	instrument_atomic_read(addr + BIT_WORD(nr), sizeof(long));
81d2c6f81996e0 Daniel Axtens     2019-08-20  142  	return arch_test_bit(nr, addr);
81d2c6f81996e0 Daniel Axtens     2019-08-20  143  }
81d2c6f81996e0 Daniel Axtens     2019-08-20  144  

:::::: The code at line 141 was first introduced by commit
:::::: 27f937cc810aef63b0752f5bfbf383390dd076a1 asm-generic, kcsan: Add KCSAN instrumentation for bitops

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
