Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D784262D
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 04:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679026016; x=1710562016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hs8PtyoQFzSB14671qjY2uFOXc6536uUY+57kuwp6tU=;
  b=hNb+91p2Qh6tI0pYykZGRe92n4lXXkUYr183ifZdIulkXy1NF2AJgbso
   fna+Lz9cGmqLRrJtAuAdFNtJTWF/monwodwno+L6IDqLdUMOQFJtHjNlT
   fLT+X7QyUidqcIfM0QEkF4N6RhzRYZSyCSmlMBVYsMb50luibHuVW01HY
   Fbc3WKEzNH3W+d1EPQQ72/WW5G1EACCwooK3ZmP7B7EnMIYOtazVFzGYv
   qgt+Yh1CdOeAcCfy7puhRix1oOJ4pKXbNZ+1BChq9mddilwCfGbsuHsYb
   ogynpgSj4ZQs92GLWX/cAPwcvWBpivs0uD+mUle2YVEtrYNx1jOnqeUXR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="403050595"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="403050595"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 21:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854313494"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="854313494"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Mar 2023 21:06:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd1Mk-00093y-1R;
	Fri, 17 Mar 2023 04:06:54 +0000
Date: Fri, 17 Mar 2023 12:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 140/274]
 include/linux/fortify-string.h:57:33: warning: use of NULL 'ifp' where
 non-null expected [CWE-476]
Message-ID: <202303171253.O7xIrpDi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/fortify-string.h:57:33: warning: use of NULL 'ifp' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   67bb67e9a9941400f950d75d77991bf99c54ed05
commit: 544f0ba5469ed386627cf718de28af73eeafc71d [140/274] xfs: repair inode fork block mapping data structures
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230317/202303171253.O7xIrpDi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=544f0ba5469ed386627cf718de28af73eeafc71d
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs xfile-page-caching
        git checkout 544f0ba5469ed386627cf718de28af73eeafc71d
        # save the config file
        make ARCH=i386 KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        make ARCH=i386 KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303171253.O7xIrpDi-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
       |
       |  571 | xfs_bmbt_init_cursor(
       |      | ^~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xfs_bmbt_init_cursor'
       |......
       |  577 |         struct xfs_ifork        *ifp = xfs_ifork_ptr(ip, whichfork);
       |      |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (2) calling 'xfs_ifork_ptr' from 'xfs_bmbt_init_cursor'
       |
       +--> 'xfs_ifork_ptr': events 3-4
              |
              |fs/xfs/xfs_inode.h:90:1:
              |   90 | xfs_ifork_ptr(
              |      | ^~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'xfs_ifork_ptr'
              |......
              |   98 |                 if (!xfs_inode_has_attr_fork(ip))
              |      |                    ~
              |      |                    |
              |      |                    (4) following 'true' branch...
              |
            'xfs_ifork_ptr': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'xfs_bmbt_init_cursor': events 6-7
       |
       |fs/xfs/libxfs/xfs_bmap_btree.c:577:40:
       |  577 |         struct xfs_ifork        *ifp = xfs_ifork_ptr(ip, whichfork);
       |      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (6) return of NULL to 'xfs_bmbt_init_cursor' from 'xfs_ifork_ptr'
       |......
       |  580 |         cur = xfs_bmbt_init_common(mp, tp, ip, whichfork);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (7) calling 'xfs_bmbt_init_common' from 'xfs_bmbt_init_cursor'
       |
       +--> 'xfs_bmbt_init_common': event 8
              |
              |  541 | xfs_bmbt_init_common(
              |      | ^~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (8) entry to 'xfs_bmbt_init_common'
              |
            'xfs_bmbt_init_common': event 9
              |
              |fs/xfs/xfs_linux.h:208:33:
              |  208 |         (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE__))
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (9) following 'false' branch...
   fs/xfs/libxfs/xfs_bmap_btree.c:549:9: note: in expansion of macro 'ASSERT'
              |  549 |         ASSERT(whichfork != XFS_COW_FORK);
              |      |         ^~~~~~
              |
            'xfs_bmbt_init_common': event 10
              |
              |  551 |         cur = xfs_btree_alloc_cursor(mp, tp, XFS_BTNUM_BMAP,
              |      |         ^~~
              |      |         |
              |      |         (10) ...to here
              |
       <------+
       |
     'xfs_bmbt_init_cursor': event 11
       |
       |  580 |         cur = xfs_bmbt_init_common(mp, tp, ip, whichfork);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (11) returning to 'xfs_bmbt_init_cursor' from 'xfs_bmbt_init_common'
       |
     'xfs_bmbt_init_cursor': event 12
       |
       |  582 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
       |      |                                       ~~~^~~~~~~~~~
       |      |                                          |
       |      |                                          (12) dereference of NULL 'ifp'
   include/uapi/linux/swab.h:102:54: note: in definition of macro '__swab16'
       |  102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
       |      |                                                      ^
   include/linux/byteorder/generic.h:97:21: note: in expansion of macro '__be16_to_cpu'
       |   97 | #define be16_to_cpu __be16_to_cpu
       |      |                     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:582:27: note: in expansion of macro 'be16_to_cpu'
       |  582 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
       |      |                           ^~~~~~~~~~~
       |
   In file included from include/linux/string.h:254,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/libxfs/xfs_bmap_btree.c:6:
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_commit_staged_btree':
>> include/linux/fortify-string.h:57:33: warning: use of NULL 'ifp' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:585:9: note: in expansion of macro '__underlying_memcpy'
     585 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:630:26: note: in expansion of macro '__fortify_memcpy_chk'
     630 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:653:9: note: in expansion of macro 'memcpy'
     653 |         memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork));
         |         ^~~~~~
     'xfs_bmbt_commit_staged_btree': events 1-2
       |
       |  630 | xfs_bmbt_commit_staged_btree(
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xfs_bmbt_commit_staged_btree'
       |......
       |  651 |         ifp = xfs_ifork_ptr(cur->bc_ino.ip, whichfork);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'xfs_ifork_ptr' from 'xfs_bmbt_commit_staged_btree'
       |
       +--> 'xfs_ifork_ptr': events 3-4
              |
              |fs/xfs/xfs_inode.h:90:1:
              |   90 | xfs_ifork_ptr(
              |      | ^~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'xfs_ifork_ptr'
              |......
              |   98 |                 if (!xfs_inode_has_attr_fork(ip))
              |      |                    ~
              |      |                    |
              |      |                    (4) following 'true' branch...
              |
            'xfs_ifork_ptr': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'xfs_bmbt_commit_staged_btree': event 6
       |
       |fs/xfs/libxfs/xfs_bmap_btree.c:651:15:
       |  651 |         ifp = xfs_ifork_ptr(cur->bc_ino.ip, whichfork);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (6) returning to 'xfs_bmbt_commit_staged_btree' from 'xfs_ifork_ptr'
       |
     'xfs_bmbt_commit_staged_btree': events 7-8
       |
       |include/linux/fortify-string.h:545:12:
       |  545 |         if ((p_size != SIZE_MAX && p_size < size) ||
       |      |            ^
       |      |            |
       |      |            (7) following 'false' branch...
       |......
       |  564 |         if (p_size_field != 0 && p_size_field != SIZE_MAX &&
       |      |         ~~  
       |      |         |
       |      |         (8) ...to here
       |
     'xfs_bmbt_commit_staged_btree': event 9
       |
       |   57 | #define __underlying_memcpy     __builtin_memcpy
       |      |                                 ^
       |      |                                 |
       |      |                                 (9) argument 1 ('ifp') NULL where non-null expected
   include/linux/fortify-string.h:585:9: note: in expansion of macro '__underlying_memcpy'
       |  585 |         __underlying_##op(p, q, __fortify_size);                        \
       |      |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:630:26: note: in expansion of macro '__fortify_memcpy_chk'
       |  630 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
       |      |                          ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:653:9: note: in expansion of macro 'memcpy'
       |  653 |         memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork));
       |      |         ^~~~~~
       |
   <built-in>: note: argument 1 of '__builtin_memcpy' must be non-null
   In file included from include/linux/string.h:5,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/libxfs/xfs_bmap_btree.c:6:
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_change_owner':
   fs/xfs/libxfs/xfs_bmap_btree.c:750:44: warning: dereference of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
     750 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format == XFS_DINODE_FMT_BTREE);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   fs/xfs/libxfs/xfs_bmap_btree.c:750:9: note: in expansion of macro 'ASSERT'
     750 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format == XFS_DINODE_FMT_BTREE);
         |         ^~~~~~
     'xfs_bmbt_change_owner': event 1
       |
       |  738 | xfs_bmbt_change_owner(
       |      | ^~~~~~~~~~~~~~~~~~~~~

vim +/ifp +57 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  46  
78a498c3a227f2 Alexander Potapenko 2022-10-24  47  #if defined(__SANITIZE_MEMORY__)
78a498c3a227f2 Alexander Potapenko 2022-10-24  48  /*
78a498c3a227f2 Alexander Potapenko 2022-10-24  49   * For KMSAN builds all memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2 Alexander Potapenko 2022-10-24  50   * corresponding __msan_XXX functions.
78a498c3a227f2 Alexander Potapenko 2022-10-24  51   */
78a498c3a227f2 Alexander Potapenko 2022-10-24  52  #include <linux/kmsan_string.h>
78a498c3a227f2 Alexander Potapenko 2022-10-24  53  #define __underlying_memcpy	__msan_memcpy
78a498c3a227f2 Alexander Potapenko 2022-10-24  54  #define __underlying_memmove	__msan_memmove
78a498c3a227f2 Alexander Potapenko 2022-10-24  55  #define __underlying_memset	__msan_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  56  #else
a28a6e860c6cf2 Francis Laniel      2021-02-25 @57  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  58  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf2 Francis Laniel      2021-02-25  59  #define __underlying_memset	__builtin_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  60  #endif
78a498c3a227f2 Alexander Potapenko 2022-10-24  61  

:::::: The code at line 57 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
