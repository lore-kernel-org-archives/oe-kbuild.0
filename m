Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7A61B7F0
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Aug 2023 20:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691527112; x=1723063112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fQ1ZKiLNngbui05aNcekblg20bi6O1EuGmr/J0TlTIo=;
  b=SkpdMkHLjPQCd1sLiwEo/C3WYYc4CoUYNvSiL7myr/zJBZt/eDUmpssu
   ZCotkhFHfb9tLPdDjAVT+JdL35ukQk4RDRIXB6XFifZxxKTm6geLFNmRA
   O0xep+u8PP0Y1fh1OcK8k7ekeLZ07yVlIk83KhyFezUHZXBlEcSvnnCK1
   KkX3RAIJNKzQReI5/YWLQi9D0YHYp1fKDwJKx0zWHp+JiCKAywxZ4MszO
   FF91kTWuVjp0unOj0RHHw9Kix05esn3y6hBDRe0zI7IlaiMjfo9mHkV0f
   wxxdnPxND+xxMbgJ4qOYStafzdLjTl4gLON3Kp+pt+t+y2YMNeHw1MQlK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351257113"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="351257113"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 13:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801465860"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="801465860"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2023 13:37:12 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTTS4-0005bQ-0F;
	Tue, 08 Aug 2023 20:37:12 +0000
Date: Wed, 9 Aug 2023 04:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/kasan-checks.h:38:27: warning: 'sk' may be used
 uninitialized
Message-ID: <202308090424.KMizjv5X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/kasan-checks.h:38:27: warning: 'sk' may be used uninitialized [-Wmaybe-uninitialized]"
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
head:   02aee814d37c563e24b73bcd0f9cb608fbd403d4
commit: 1ec49744ba83f0429c5c706708610f7821a7b6f4 btrfs: turn on -Wmaybe-uninitialized
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-r072-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090424.KMizjv5X-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090424.KMizjv5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308090424.KMizjv5X-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/rwonce.h:26,
                    from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/kernel.h:20,
                    from fs/btrfs/ioctl.c:6:
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_tree_search':
>> include/linux/kasan-checks.h:38:27: warning: 'sk' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:1733:39: note: 'sk' declared here
    1733 |         struct btrfs_ioctl_search_key sk;
         |                                       ^~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_tree_search_v2':
>> include/linux/kasan-checks.h:38:27: warning: 'args' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:1763:43: note: 'args' declared here
    1763 |         struct btrfs_ioctl_search_args_v2 args;
         |                                           ^~~~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_wait_sync':
   include/linux/kasan-checks.h:38:27: warning: 'transid' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:3134:13: note: 'transid' declared here
    3134 |         u64 transid;
         |             ^~~~~~~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_set_fslabel':
>> include/linux/kasan-checks.h:38:27: warning: 'label' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4106:14: note: 'label' declared here
    4106 |         char label[BTRFS_LABEL_SIZE];
         |              ^~~~~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_set_features':
>> include/linux/kasan-checks.h:38:27: warning: 'flags' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4248:42: note: 'flags' declared here
    4248 |         struct btrfs_ioctl_feature_flags flags[2];
         |                                          ^~~~~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_space_info':
   include/linux/kasan-checks.h:38:27: warning: 'space_args' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:2973:39: note: 'space_args' declared here
    2973 |         struct btrfs_ioctl_space_args space_args;
         |                                       ^~~~~~~~~~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_encoded_write.constprop':
>> include/linux/kasan-checks.h:38:27: warning: 'args' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4433:44: note: 'args' declared here
    4433 |         struct btrfs_ioctl_encoded_io_args args;
         |                                            ^~~~


vim +/sk +38 include/linux/kasan-checks.h

7d8ad890dad00f6 Marco Elver     2019-07-11  31  
7d8ad890dad00f6 Marco Elver     2019-07-11  32  /*
7d8ad890dad00f6 Marco Elver     2019-07-11  33   * kasan_check_*: Only available when the particular compilation unit has KASAN
7d8ad890dad00f6 Marco Elver     2019-07-11  34   * instrumentation enabled. May be used in header files.
7d8ad890dad00f6 Marco Elver     2019-07-11  35   */
7d8ad890dad00f6 Marco Elver     2019-07-11  36  #ifdef __SANITIZE_ADDRESS__
7d8ad890dad00f6 Marco Elver     2019-07-11  37  #define kasan_check_read __kasan_check_read
7d8ad890dad00f6 Marco Elver     2019-07-11 @38  #define kasan_check_write __kasan_check_write
64f8ebaf115bcdd Andrey Ryabinin 2016-05-20  39  #else
b5f6e0fc7d60e02 Marco Elver     2019-07-11  40  static inline bool kasan_check_read(const volatile void *p, unsigned int size)
b5f6e0fc7d60e02 Marco Elver     2019-07-11  41  {
b5f6e0fc7d60e02 Marco Elver     2019-07-11  42  	return true;
b5f6e0fc7d60e02 Marco Elver     2019-07-11  43  }
b5f6e0fc7d60e02 Marco Elver     2019-07-11  44  static inline bool kasan_check_write(const volatile void *p, unsigned int size)
b5f6e0fc7d60e02 Marco Elver     2019-07-11  45  {
b5f6e0fc7d60e02 Marco Elver     2019-07-11  46  	return true;
b5f6e0fc7d60e02 Marco Elver     2019-07-11  47  }
64f8ebaf115bcdd Andrey Ryabinin 2016-05-20  48  #endif
64f8ebaf115bcdd Andrey Ryabinin 2016-05-20  49  

:::::: The code at line 38 was first introduced by commit
:::::: 7d8ad890dad00f6cd64bfb44d9be4fceb10cf819 mm/kasan: introduce __kasan_check_{read,write}

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
