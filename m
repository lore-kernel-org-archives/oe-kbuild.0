Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE9353A0
	for <oe-kbuild@lists.linux.dev>; Fri, 26 May 2023 07:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685084969; x=1716620969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9jsr6kDbZe3Dcr/a/hW8p/KOTnV+PSLYjgEI7iaAJfQ=;
  b=ACpmay/29onmXIG0tiAIL8C4vf/gVLehzk1dngLCLZFYpfzSGFw/kN4D
   jIqDRZo0s9lcv/SYTTwiqywCQYmJTPt4uzOQjS9EKtsUWHJOA3Y7kQcXe
   CFg8iWNDcVwZlPOB5hVjguM5JVtUSRgMHceVxn2SalmXS0YdDSvVhBpzP
   aSzilyUx93TDrjAW7UfchCDM1KYXbvOcFm4Umm3emCv1j3XtEAXTc/epp
   DlC3br0zkCW4Oy4lxFZk1pwHgos4x08PjfOFALBiPBTRfGBPwBllLWvDJ
   GlvWMuXgsLCdZazavklroGE2n5yWinPO1sbWo7f+UNT6H1O3AiOHnemGY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="419894129"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="419894129"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 00:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="735892561"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="735892561"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 May 2023 00:09:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2RZh-000J8b-26;
	Fri, 26 May 2023 07:09:21 +0000
Date: Fri, 26 May 2023 15:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/zsmalloc.c:249:27: sparse: sparse: flexible array member
 'size_class' is not last
Message-ID: <202305261551.IIG4GkXl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d85b27b0cc6b5cf54567c5ad913a247a71583ce
commit: 4ff93b292c0b91b9a7c9fb54643f122bbe59d8d0 zsmalloc: make zspage chain size configurable
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: arc-randconfig-s043-20230524 (https://download.01.org/0day-ci/archive/20230526/202305261551.IIG4GkXl-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4ff93b292c0b91b9a7c9fb54643f122bbe59d8d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4ff93b292c0b91b9a7c9fb54643f122bbe59d8d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305261551.IIG4GkXl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last
>> mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last
>> mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last
>> mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last
>> mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last
>> mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last
>> mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last
>> mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last
>> mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last
>> mm/zsmalloc.c:249:27: sparse: sparse: flexible array member 'size_class' is not last

vim +/size_class +249 mm/zsmalloc.c

0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  245  
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  246  struct zs_pool {
6f3526d6db7cbe mm/zsmalloc.c                            Sergey SENOZHATSKY 2015-11-06  247  	const char *name;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  248  
cf8e0fedf0784e mm/zsmalloc.c                            Jerome Marchand    2017-07-10 @249  	struct size_class *size_class[ZS_SIZE_CLASSES];
2e40e163a25af3 mm/zsmalloc.c                            Minchan Kim        2015-04-15  250  	struct kmem_cache *handle_cachep;
3783689a1aa82e mm/zsmalloc.c                            Minchan Kim        2016-07-26  251  	struct kmem_cache *zspage_cachep;
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  252  
13de8933c96b45 mm/zsmalloc.c                            Minchan Kim        2014-10-09  253  	atomic_long_t pages_allocated;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  254  
7d3f3938236b4b mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  255  	struct zs_pool_stats stats;
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  256  
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  257  	/* Compact classes */
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  258  	struct shrinker shrinker;
93144ca35041b0 mm/zsmalloc.c                            Aliaksei Karaliou  2018-01-31  259  

:::::: The code at line 249 was first introduced by commit
:::::: cf8e0fedf0784ef4bc1889380b09eda295e3d109 mm/zsmalloc: simplify zs_max_alloc_size handling

:::::: TO: Jerome Marchand <jmarchan@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
