Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB99D1365
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 01:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680226232; x=1711762232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=keXNYWFBfg7OvL9hpDoNRrc4Uo9EOnfZvZOZ05L5y/g=;
  b=LoZX3xh4hBPgHGNyPt3UoKsrd4S5LhvH+0tASZSAwNKKZVgBHgz2mEza
   CK2kn0U41zy7D43VPK71fLM497ob0HHkQgr9KuEzG0Er1umOoRCpzCF8h
   mLoDfVi5sEiub3diH1xG+7kz/IcDOdZ8wagi2S/XTGK3pLzxjIQ5mKWi9
   QIxcqqiV21lZnfblrww1jLOpRsqzOlQ0xMVe5LFggIGkiMKtP9abe2KRo
   k/rQM+Jidy/1yTUscu/E1Ypzr249PO+I9Fs4pfuLcSowdPpY9ACvUKRQp
   3E8o6u59KxUx540KW+/gzzC+x1x+jvD1OElKz4A9C7mBQQE8uJxlma7Xy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427603305"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="427603305"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 18:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687473021"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="687473021"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Mar 2023 18:30:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi3as-000LNo-1d;
	Fri, 31 Mar 2023 01:30:18 +0000
Date: Fri, 31 Mar 2023 09:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jani-drm:is-power-of-2 2/4] include/linux/log2.h:58:9: sparse: this
 was the original definition
Message-ID: <202303310900.ic0wRNY4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/log2.h:58:9: sparse: this was the original definition"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jani Nikula <jani.nikula@intel.com>

tree:   git://people.freedesktop.org/~jani/drm is-power-of-2
head:   051d03b7787fe9ae1e18d6c8724a5d5eda53bc77
commit: 4235abad8fc74bbff10731f7db52beba111da70d [2/4] log2: have is_power_of_2() support bigger types than unsigned long
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-s032-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310900.ic0wRNY4-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add jani-drm git://people.freedesktop.org/~jani/drm
        git fetch --no-tags jani-drm is-power-of-2
        git checkout 4235abad8fc74bbff10731f7db52beba111da70d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze SHELL=/bin/bash arch/microblaze/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303310900.ic0wRNY4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/microblaze/mm/pgtable.c:188:9: sparse: sparse: preprocessor token is_power_of_2 redefined
   arch/microblaze/mm/pgtable.c: note: in included file (through include/linux/kernel.h):
>> include/linux/log2.h:58:9: sparse: this was the original definition

vim +58 include/linux/log2.h

4235abad8fc74b Jani Nikula      2023-03-29  49  
a1c4d24e02d093 Randy Dunlap     2017-09-30  50  /**
a1c4d24e02d093 Randy Dunlap     2017-09-30  51   * is_power_of_2() - check if a value is a power of two
a1c4d24e02d093 Randy Dunlap     2017-09-30  52   * @n: the value to check
a1c4d24e02d093 Randy Dunlap     2017-09-30  53   *
63c2f782e8f6aa Robert P. J. Day 2007-01-30  54   * Determine whether some value is a power of two, where zero is
63c2f782e8f6aa Robert P. J. Day 2007-01-30  55   * *not* considered a power of two.
a1c4d24e02d093 Randy Dunlap     2017-09-30  56   * Return: true if @n is a power of 2, otherwise false.
63c2f782e8f6aa Robert P. J. Day 2007-01-30  57   */
4235abad8fc74b Jani Nikula      2023-03-29 @58  #define is_power_of_2(n)						\
4235abad8fc74b Jani Nikula      2023-03-29  59  	__builtin_choose_expr(sizeof(n) > sizeof(unsigned long),	\
4235abad8fc74b Jani Nikula      2023-03-29  60  			      __is_power_of_2_ull(n),			\
4235abad8fc74b Jani Nikula      2023-03-29  61  			      __is_power_of_2(n))
63c2f782e8f6aa Robert P. J. Day 2007-01-30  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
