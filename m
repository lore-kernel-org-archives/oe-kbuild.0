Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D817E294DC
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jun 2023 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686045052; x=1717581052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D8YHxN+A9t7xIZD6Rboj+b4KQlmLRNwFWcfBrjRkvq0=;
  b=KFpPfM76ZFf/wtqqOP67bDOOrAxDYvxzPTVXIy4jZNLv2bIO/kXAz1cz
   EXsqmd4iPWaSPIQz1An9rJKPU3BOMSx90gdzhAS1DKuP0Xo4ibhidWZKB
   IIaQkZlxv54nxtVsY+f0ifgiaNE0we6EZICVrQGml0nnZH8s9kX4+Ecf6
   TYXqHtSHJ3rsbjmmPvVosu0BBGv5Jg6/lg3HzpSqK3aEoY2U1i0Jwwhcl
   duO5MC5ki1/ktxSjzbfr7e+t8yX3yAPGmdM5X19d3MmWXDtodjslGAU7j
   2cT8uFjBntFvGP3Js8wlysSruYuMK7//WnXfpeIJhHYgCSGv7bfjvv5e5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="356630033"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="356630033"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 02:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709016090"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="709016090"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 02:50:13 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6TKP-00056n-0u;
	Tue, 06 Jun 2023 09:50:13 +0000
Date: Tue, 6 Jun 2023 17:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/kcsan-checks.h:220:28: warning: 'sk' may be used
 uninitialized
Message-ID: <202306061738.4Sr8QlVP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/kcsan-checks.h:220:28: warning: 'sk' may be used uninitialized [-Wmaybe-uninitialized]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>

Hi Josef,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8dba31b0a826e691949cd4fdfa5c30defaac8c5
commit: 1ec49744ba83f0429c5c706708610f7821a7b6f4 btrfs: turn on -Wmaybe-uninitialized
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-s051-20230606 (https://download.01.org/0day-ci/archive/20230606/202306061738.4Sr8QlVP-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ec49744ba83f0429c5c706708610f7821a7b6f4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1ec49744ba83f0429c5c706708610f7821a7b6f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306061738.4Sr8QlVP-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/rwonce.h:27,
                    from ./arch/mips/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/kernel.h:20,
                    from fs/btrfs/ioctl.c:6:
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl_tree_search':
>> include/linux/kcsan-checks.h:220:28: warning: 'sk' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:1733:39: note: 'sk' declared here
    1733 |         struct btrfs_ioctl_search_key sk;
         |                                       ^~
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl_set_fslabel':
>> include/linux/kcsan-checks.h:220:28: warning: 'label' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4106:14: note: 'label' declared here
    4106 |         char label[BTRFS_LABEL_SIZE];
         |              ^~~~~
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl_wait_sync':
   include/linux/kcsan-checks.h:220:28: warning: 'transid' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:3134:13: note: 'transid' declared here
    3134 |         u64 transid;
         |             ^~~~~~~
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl_set_features':
>> include/linux/kcsan-checks.h:220:28: warning: 'flags' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4248:42: note: 'flags' declared here
    4248 |         struct btrfs_ioctl_feature_flags flags[2];
         |                                          ^~~~~
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl_tree_search_v2':
>> include/linux/kcsan-checks.h:220:28: warning: 'args' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:1763:43: note: 'args' declared here
    1763 |         struct btrfs_ioctl_search_args_v2 args;
         |                                           ^~~~
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl_space_info':
   include/linux/kcsan-checks.h:220:28: warning: 'space_args' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:2973:39: note: 'space_args' declared here
    2973 |         struct btrfs_ioctl_space_args space_args;
         |                                       ^~~~~~~~~~
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl_encoded_write':
   include/linux/kcsan-checks.h:220:28: warning: 'args32' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4453:55: note: 'args32' declared here
    4453 |                 struct btrfs_ioctl_encoded_io_args_32 args32;
         |                                                       ^~~~~~
>> include/linux/kcsan-checks.h:220:28: warning: 'args' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4433:44: note: 'args' declared here
    4433 |         struct btrfs_ioctl_encoded_io_args args;
         |                                            ^~~~
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl_encoded_read':
   include/linux/kcsan-checks.h:220:28: warning: 'args32' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4369:55: note: 'args32' declared here
    4369 |                 struct btrfs_ioctl_encoded_io_args_32 args32;
         |                                                       ^~~~~~
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl':
   include/linux/kcsan-checks.h:220:28: warning: 'args32' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4320:49: note: 'args32' declared here
    4320 |                 struct btrfs_ioctl_send_args_32 args32;
         |                                                 ^~~~~~


vim +/sk +220 include/linux/kcsan-checks.h

dfd402a4c4baae Marco Elver 2019-11-14  214  
19acd03d95dad1 Marco Elver 2020-04-24  215  #ifdef __SANITIZE_THREAD__
dfd402a4c4baae Marco Elver 2019-11-14  216  /*
19acd03d95dad1 Marco Elver 2020-04-24  217   * Only calls into the runtime when the particular compilation unit has KCSAN
19acd03d95dad1 Marco Elver 2020-04-24  218   * instrumentation enabled. May be used in header files.
dfd402a4c4baae Marco Elver 2019-11-14  219   */
dfd402a4c4baae Marco Elver 2019-11-14 @220  #define kcsan_check_access __kcsan_check_access
19acd03d95dad1 Marco Elver 2020-04-24  221  

:::::: The code at line 220 was first introduced by commit
:::::: dfd402a4c4baae42398ce9180ff424d589b8bffc kcsan: Add Kernel Concurrency Sanitizer infrastructure

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
