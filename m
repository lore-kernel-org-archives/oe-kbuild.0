Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B77863B
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 03:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679109092; x=1710645092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QoSejGC6wSFDea0t8HnD6HY8DQ2GtllUNF2Lg3skn+4=;
  b=Ja+CjG0ly2KI+gaVGLjgQY+nS82LQjN9brF+rOggiLq1zKQNOnLtPAc7
   yD4ykKspsmNq+GE1Z8pt1NuJMFRHNP9mj6hM/r4m1xFVf2Ym+GSRbfZJv
   spah+ctkBOxXJh2rsJur0ZTrCRTNqxbaCg/UuIG+TsPv8l9nICJM8OXjE
   xcoAgHAB361MYDlQUcWFE9umxBUUNRAcUuB5aYsorwfLxXsF3i8FrbKtj
   lDN6jPAzTvyJQUkZhdpVbC3q1w0DqGbXmCyp/Ot31q21OHMF4E9ApeKCC
   9LhM7j7yTyJjh0MFgy8/4X4xIYZRLS75ItbHWwuiL5xeNHXbLPwLGCdVl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340758408"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="340758408"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 20:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="710719815"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="710719815"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Mar 2023 20:11:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdMyf-0009lY-2P;
	Sat, 18 Mar 2023 03:11:29 +0000
Date: Sat, 18 Mar 2023 11:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/ntfs/lcnalloc.c:336:33: warning: use of NULL 'rl' where non-null
 expected [CWE-476]
Message-ID: <202303181100.wRAnAayx-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: fs/ntfs/lcnalloc.c:336:33: warning: use of NULL 'rl' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   478a351ce0d69cef2d2bf2a686a09b356b63a66c
commit: 62a3a4dd476d5d1db9f13bb902f78fed2b6abd18 ntfs: Remove check for PageError
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20230316 (https://download.01.org/0day-ci/archive/20230318/202303181100.wRAnAayx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=62a3a4dd476d5d1db9f13bb902f78fed2b6abd18
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 62a3a4dd476d5d1db9f13bb902f78fed2b6abd18
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303181100.wRAnAayx-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   fs/ntfs/lcnalloc.c: In function 'ntfs_cluster_alloc':
>> fs/ntfs/lcnalloc.c:336:33: warning: use of NULL 'rl' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     336 |                                 memcpy(rl2, rl, rlsize);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
     'ntfs_cluster_alloc': event 1
       |
       |  132 | runlist_element *ntfs_cluster_alloc(ntfs_volume *vol, const VCN start_vcn,
       |      |                  ^~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (1) entry to 'ntfs_cluster_alloc'
       |
     'ntfs_cluster_alloc': event 2
       |
       |include/asm-generic/bug.h:71:35:
       |   71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
       |      |                                   ^
       |      |                                   |
       |      |                                   (2) following 'false' branch (when '______r == 0')...
   fs/ntfs/lcnalloc.c:154:9: note: in expansion of macro 'BUG_ON'
       |  154 |         BUG_ON(!vol);
       |      |         ^~~~~~
       |
     'ntfs_cluster_alloc': event 3
       |
       |  155 |         lcnbmp_vi = vol->lcnbmp_ino;
       |      |         ~~~~~~~~~~^~~~~~~~~~~~~~~~~
       |      |                   |
       |      |                   (3) ...to here
       |
     'ntfs_cluster_alloc': event 4
       |
       |include/asm-generic/bug.h:71:35:
       |   71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
       |      |                                   ^
       |      |                                   |
       |      |                                   (4) following 'false' branch (when '______r == 0')...
   fs/ntfs/lcnalloc.c:156:9: note: in expansion of macro 'BUG_ON'
       |  156 |         BUG_ON(!lcnbmp_vi);
       |      |         ^~~~~~
       |
     'ntfs_cluster_alloc': event 5
       |
       |include/linux/compiler.h:33:35:
       |   33 |                         ______r = __builtin_expect(!!(x), expect);      \
       |      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                   |
       |      |                                   (5) ...to here
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
       |   48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
       |      |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
       |   71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
       |      |                                    ^~~~~~~~
   fs/ntfs/lcnalloc.c:157:9: note: in expansion of macro 'BUG_ON'
       |  157 |         BUG_ON(start_vcn < 0);
       |      |         ^~~~~~
       |
     'ntfs_cluster_alloc': event 6
       |
       |include/asm-generic/bug.h:71:35:
       |   71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
       |      |                                   ^
       |      |                                   |
       |      |                                   (6) following 'false' branch (when '______r == 0')...
   fs/ntfs/lcnalloc.c:157:9: note: in expansion of macro 'BUG_ON'
       |  157 |         BUG_ON(start_vcn < 0);
       |      |         ^~~~~~
       |
     'ntfs_cluster_alloc': event 7
       |
       |include/linux/compiler.h:33:35:
       |   33 |                         ______r = __builtin_expect(!!(x), expect);      \
       |      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                   |
       |      |                                   (7) ...to here
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
       |   48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
       |      |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
       |   71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
       |      |                                    ^~~~~~~~
   fs/ntfs/lcnalloc.c:158:9: note: in expansion of macro 'BUG_ON'
       |  158 |         BUG_ON(count < 0);
       |      |         ^~~~~~
       |
     'ntfs_cluster_alloc': event 8
       |
       |include/asm-generic/bug.h:71:35:
       |   71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
       |      |                                   ^
       |      |                                   |
       |      |                                   (8) following 'false' branch (when '______r == 0')...
   fs/ntfs/lcnalloc.c:158:9: note: in expansion of macro 'BUG_ON'
       |  158 |         BUG_ON(count < 0);
       |      |         ^~~~~~
       |
     'ntfs_cluster_alloc': event 9
       |
       |include/linux/compiler.h:33:35:
       |   33 |                         ______r = __builtin_expect(!!(x), expect);      \
       |      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                   |

vim +/rl +336 fs/ntfs/lcnalloc.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   57  
^1da177e4c3f41 Linus Torvalds     2005-04-16   58  /**
^1da177e4c3f41 Linus Torvalds     2005-04-16   59   * ntfs_cluster_alloc - allocate clusters on an ntfs volume
^1da177e4c3f41 Linus Torvalds     2005-04-16   60   * @vol:	mounted ntfs volume on which to allocate the clusters
^1da177e4c3f41 Linus Torvalds     2005-04-16   61   * @start_vcn:	vcn to use for the first allocated cluster
^1da177e4c3f41 Linus Torvalds     2005-04-16   62   * @count:	number of clusters to allocate
^1da177e4c3f41 Linus Torvalds     2005-04-16   63   * @start_lcn:	starting lcn at which to allocate the clusters (or -1 if none)
^1da177e4c3f41 Linus Torvalds     2005-04-16   64   * @zone:	zone from which to allocate the clusters
c49c31115067bc Richard Knutsson   2006-09-30   65   * @is_extension:	if 'true', this is an attribute extension
^1da177e4c3f41 Linus Torvalds     2005-04-16   66   *
^1da177e4c3f41 Linus Torvalds     2005-04-16   67   * Allocate @count clusters preferably starting at cluster @start_lcn or at the
^1da177e4c3f41 Linus Torvalds     2005-04-16   68   * current allocator position if @start_lcn is -1, on the mounted ntfs volume
^1da177e4c3f41 Linus Torvalds     2005-04-16   69   * @vol. @zone is either DATA_ZONE for allocation of normal clusters or
^1da177e4c3f41 Linus Torvalds     2005-04-16   70   * MFT_ZONE for allocation of clusters for the master file table, i.e. the
^1da177e4c3f41 Linus Torvalds     2005-04-16   71   * $MFT/$DATA attribute.
^1da177e4c3f41 Linus Torvalds     2005-04-16   72   *
^1da177e4c3f41 Linus Torvalds     2005-04-16   73   * @start_vcn specifies the vcn of the first allocated cluster.  This makes
^1da177e4c3f41 Linus Torvalds     2005-04-16   74   * merging the resulting runlist with the old runlist easier.
^1da177e4c3f41 Linus Torvalds     2005-04-16   75   *
c49c31115067bc Richard Knutsson   2006-09-30   76   * If @is_extension is 'true', the caller is allocating clusters to extend an
c49c31115067bc Richard Knutsson   2006-09-30   77   * attribute and if it is 'false', the caller is allocating clusters to fill a
fc0fa7dc7d243a Anton Altaparmakov 2005-10-04   78   * hole in an attribute.  Practically the difference is that if @is_extension
c49c31115067bc Richard Knutsson   2006-09-30   79   * is 'true' the returned runlist will be terminated with LCN_ENOENT and if
c49c31115067bc Richard Knutsson   2006-09-30   80   * @is_extension is 'false' the runlist will be terminated with
fc0fa7dc7d243a Anton Altaparmakov 2005-10-04   81   * LCN_RL_NOT_MAPPED.
fc0fa7dc7d243a Anton Altaparmakov 2005-10-04   82   *
^1da177e4c3f41 Linus Torvalds     2005-04-16   83   * You need to check the return value with IS_ERR().  If this is false, the
^1da177e4c3f41 Linus Torvalds     2005-04-16   84   * function was successful and the return value is a runlist describing the
^1da177e4c3f41 Linus Torvalds     2005-04-16   85   * allocated cluster(s).  If IS_ERR() is true, the function failed and
^1da177e4c3f41 Linus Torvalds     2005-04-16   86   * PTR_ERR() gives you the error code.
^1da177e4c3f41 Linus Torvalds     2005-04-16   87   *
^1da177e4c3f41 Linus Torvalds     2005-04-16   88   * Notes on the allocation algorithm
^1da177e4c3f41 Linus Torvalds     2005-04-16   89   * =================================
^1da177e4c3f41 Linus Torvalds     2005-04-16   90   *
^1da177e4c3f41 Linus Torvalds     2005-04-16   91   * There are two data zones.  First is the area between the end of the mft zone
^1da177e4c3f41 Linus Torvalds     2005-04-16   92   * and the end of the volume, and second is the area between the start of the
^1da177e4c3f41 Linus Torvalds     2005-04-16   93   * volume and the start of the mft zone.  On unmodified/standard NTFS 1.x
^1da177e4c3f41 Linus Torvalds     2005-04-16   94   * volumes, the second data zone does not exist due to the mft zone being
^1da177e4c3f41 Linus Torvalds     2005-04-16   95   * expanded to cover the start of the volume in order to reserve space for the
^1da177e4c3f41 Linus Torvalds     2005-04-16   96   * mft bitmap attribute.
^1da177e4c3f41 Linus Torvalds     2005-04-16   97   *
^1da177e4c3f41 Linus Torvalds     2005-04-16   98   * This is not the prettiest function but the complexity stems from the need of
^1da177e4c3f41 Linus Torvalds     2005-04-16   99   * implementing the mft vs data zoned approach and from the fact that we have
^1da177e4c3f41 Linus Torvalds     2005-04-16  100   * access to the lcn bitmap in portions of up to 8192 bytes at a time, so we
^1da177e4c3f41 Linus Torvalds     2005-04-16  101   * need to cope with crossing over boundaries of two buffers.  Further, the
^1da177e4c3f41 Linus Torvalds     2005-04-16  102   * fact that the allocator allows for caller supplied hints as to the location
^1da177e4c3f41 Linus Torvalds     2005-04-16  103   * of where allocation should begin and the fact that the allocator keeps track
^1da177e4c3f41 Linus Torvalds     2005-04-16  104   * of where in the data zones the next natural allocation should occur,
^1da177e4c3f41 Linus Torvalds     2005-04-16  105   * contribute to the complexity of the function.  But it should all be
^1da177e4c3f41 Linus Torvalds     2005-04-16  106   * worthwhile, because this allocator should: 1) be a full implementation of
^1da177e4c3f41 Linus Torvalds     2005-04-16  107   * the MFT zone approach used by Windows NT, 2) cause reduction in
^1da177e4c3f41 Linus Torvalds     2005-04-16  108   * fragmentation, and 3) be speedy in allocations (the code is not optimized
^1da177e4c3f41 Linus Torvalds     2005-04-16  109   * for speed, but the algorithm is, so further speed improvements are probably
^1da177e4c3f41 Linus Torvalds     2005-04-16  110   * possible).
^1da177e4c3f41 Linus Torvalds     2005-04-16  111   *
^1da177e4c3f41 Linus Torvalds     2005-04-16  112   * FIXME: We should be monitoring cluster allocation and increment the MFT zone
^1da177e4c3f41 Linus Torvalds     2005-04-16  113   * size dynamically but this is something for the future.  We will just cause
^1da177e4c3f41 Linus Torvalds     2005-04-16  114   * heavier fragmentation by not doing it and I am not even sure Windows would
^1da177e4c3f41 Linus Torvalds     2005-04-16  115   * grow the MFT zone dynamically, so it might even be correct not to do this.
^1da177e4c3f41 Linus Torvalds     2005-04-16  116   * The overhead in doing dynamic MFT zone expansion would be very large and
^1da177e4c3f41 Linus Torvalds     2005-04-16  117   * unlikely worth the effort. (AIA)
^1da177e4c3f41 Linus Torvalds     2005-04-16  118   *
^1da177e4c3f41 Linus Torvalds     2005-04-16  119   * TODO: I have added in double the required zone position pointer wrap around
^1da177e4c3f41 Linus Torvalds     2005-04-16  120   * logic which can be optimized to having only one of the two logic sets.
^1da177e4c3f41 Linus Torvalds     2005-04-16  121   * However, having the double logic will work fine, but if we have only one of
^1da177e4c3f41 Linus Torvalds     2005-04-16  122   * the sets and we get it wrong somewhere, then we get into trouble, so
^1da177e4c3f41 Linus Torvalds     2005-04-16  123   * removing the duplicate logic requires _very_ careful consideration of _all_
^1da177e4c3f41 Linus Torvalds     2005-04-16  124   * possible code paths.  So at least for now, I am leaving the double logic -
^1da177e4c3f41 Linus Torvalds     2005-04-16  125   * better safe than sorry... (AIA)
^1da177e4c3f41 Linus Torvalds     2005-04-16  126   *
^1da177e4c3f41 Linus Torvalds     2005-04-16  127   * Locking: - The volume lcn bitmap must be unlocked on entry and is unlocked
^1da177e4c3f41 Linus Torvalds     2005-04-16  128   *	      on return.
^1da177e4c3f41 Linus Torvalds     2005-04-16  129   *	    - This function takes the volume lcn bitmap lock for writing and
^1da177e4c3f41 Linus Torvalds     2005-04-16  130   *	      modifies the bitmap contents.
^1da177e4c3f41 Linus Torvalds     2005-04-16  131   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  132  runlist_element *ntfs_cluster_alloc(ntfs_volume *vol, const VCN start_vcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  133  		const s64 count, const LCN start_lcn,
fc0fa7dc7d243a Anton Altaparmakov 2005-10-04  134  		const NTFS_CLUSTER_ALLOCATION_ZONES zone,
c49c31115067bc Richard Knutsson   2006-09-30  135  		const bool is_extension)
^1da177e4c3f41 Linus Torvalds     2005-04-16  136  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  137  	LCN zone_start, zone_end, bmp_pos, bmp_initial_pos, last_read_pos, lcn;
^1da177e4c3f41 Linus Torvalds     2005-04-16  138  	LCN prev_lcn = 0, prev_run_len = 0, mft_zone_size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  139  	s64 clusters;
db30d160cd8dfe Anton Altaparmakov 2004-11-11  140  	loff_t i_size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  141  	struct inode *lcnbmp_vi;
^1da177e4c3f41 Linus Torvalds     2005-04-16  142  	runlist_element *rl = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  143  	struct address_space *mapping;
^1da177e4c3f41 Linus Torvalds     2005-04-16  144  	struct page *page = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  145  	u8 *buf, *byte;
^1da177e4c3f41 Linus Torvalds     2005-04-16  146  	int err = 0, rlpos, rlsize, buf_size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  147  	u8 pass, done_zones, search_zone, need_writeback = 0, bit;
^1da177e4c3f41 Linus Torvalds     2005-04-16  148  
^1da177e4c3f41 Linus Torvalds     2005-04-16  149  	ntfs_debug("Entering for start_vcn 0x%llx, count 0x%llx, start_lcn "
^1da177e4c3f41 Linus Torvalds     2005-04-16  150  			"0x%llx, zone %s_ZONE.", (unsigned long long)start_vcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  151  			(unsigned long long)count,
^1da177e4c3f41 Linus Torvalds     2005-04-16  152  			(unsigned long long)start_lcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  153  			zone == MFT_ZONE ? "MFT" : "DATA");
^1da177e4c3f41 Linus Torvalds     2005-04-16  154  	BUG_ON(!vol);
^1da177e4c3f41 Linus Torvalds     2005-04-16  155  	lcnbmp_vi = vol->lcnbmp_ino;
^1da177e4c3f41 Linus Torvalds     2005-04-16  156  	BUG_ON(!lcnbmp_vi);
^1da177e4c3f41 Linus Torvalds     2005-04-16  157  	BUG_ON(start_vcn < 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  158  	BUG_ON(count < 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  159  	BUG_ON(start_lcn < -1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  160  	BUG_ON(zone < FIRST_ZONE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  161  	BUG_ON(zone > LAST_ZONE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  162  
bbf1813fb8ff9d Anton Altaparmakov 2005-09-08  163  	/* Return NULL if @count is zero. */
bbf1813fb8ff9d Anton Altaparmakov 2005-09-08  164  	if (!count)
bbf1813fb8ff9d Anton Altaparmakov 2005-09-08  165  		return NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  166  	/* Take the lcnbmp lock for writing. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  167  	down_write(&vol->lcnbmp_lock);
^1da177e4c3f41 Linus Torvalds     2005-04-16  168  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  169  	 * If no specific @start_lcn was requested, use the current data zone
^1da177e4c3f41 Linus Torvalds     2005-04-16  170  	 * position, otherwise use the requested @start_lcn but make sure it
^1da177e4c3f41 Linus Torvalds     2005-04-16  171  	 * lies outside the mft zone.  Also set done_zones to 0 (no zones done)
^1da177e4c3f41 Linus Torvalds     2005-04-16  172  	 * and pass depending on whether we are starting inside a zone (1) or
^1da177e4c3f41 Linus Torvalds     2005-04-16  173  	 * at the beginning of a zone (2).  If requesting from the MFT_ZONE,
^1da177e4c3f41 Linus Torvalds     2005-04-16  174  	 * we either start at the current position within the mft zone or at
^1da177e4c3f41 Linus Torvalds     2005-04-16  175  	 * the specified position.  If the latter is out of bounds then we start
^1da177e4c3f41 Linus Torvalds     2005-04-16  176  	 * at the beginning of the MFT_ZONE.
^1da177e4c3f41 Linus Torvalds     2005-04-16  177  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  178  	done_zones = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  179  	pass = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  181  	 * zone_start and zone_end are the current search range.  search_zone
^1da177e4c3f41 Linus Torvalds     2005-04-16  182  	 * is 1 for mft zone, 2 for data zone 1 (end of mft zone till end of
^1da177e4c3f41 Linus Torvalds     2005-04-16  183  	 * volume) and 4 for data zone 2 (start of volume till start of mft
^1da177e4c3f41 Linus Torvalds     2005-04-16  184  	 * zone).
^1da177e4c3f41 Linus Torvalds     2005-04-16  185  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  186  	zone_start = start_lcn;
^1da177e4c3f41 Linus Torvalds     2005-04-16  187  	if (zone_start < 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  188  		if (zone == DATA_ZONE)
^1da177e4c3f41 Linus Torvalds     2005-04-16  189  			zone_start = vol->data1_zone_pos;
^1da177e4c3f41 Linus Torvalds     2005-04-16  190  		else
^1da177e4c3f41 Linus Torvalds     2005-04-16  191  			zone_start = vol->mft_zone_pos;
^1da177e4c3f41 Linus Torvalds     2005-04-16  192  		if (!zone_start) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  193  			/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  194  			 * Zone starts at beginning of volume which means a
^1da177e4c3f41 Linus Torvalds     2005-04-16  195  			 * single pass is sufficient.
^1da177e4c3f41 Linus Torvalds     2005-04-16  196  			 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  197  			pass = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  198  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  199  	} else if (zone == DATA_ZONE && zone_start >= vol->mft_zone_start &&
^1da177e4c3f41 Linus Torvalds     2005-04-16  200  			zone_start < vol->mft_zone_end) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  		zone_start = vol->mft_zone_end;
^1da177e4c3f41 Linus Torvalds     2005-04-16  202  		/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  203  		 * Starting at beginning of data1_zone which means a single
^1da177e4c3f41 Linus Torvalds     2005-04-16  204  		 * pass in this zone is sufficient.
^1da177e4c3f41 Linus Torvalds     2005-04-16  205  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  206  		pass = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  207  	} else if (zone == MFT_ZONE && (zone_start < vol->mft_zone_start ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  208  			zone_start >= vol->mft_zone_end)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  209  		zone_start = vol->mft_lcn;
^1da177e4c3f41 Linus Torvalds     2005-04-16  210  		if (!vol->mft_zone_end)
^1da177e4c3f41 Linus Torvalds     2005-04-16  211  			zone_start = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  212  		/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  213  		 * Starting at beginning of volume which means a single pass
^1da177e4c3f41 Linus Torvalds     2005-04-16  214  		 * is sufficient.
^1da177e4c3f41 Linus Torvalds     2005-04-16  215  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  216  		pass = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  217  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  218  	if (zone == MFT_ZONE) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  		zone_end = vol->mft_zone_end;
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  		search_zone = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	} else /* if (zone == DATA_ZONE) */ {
^1da177e4c3f41 Linus Torvalds     2005-04-16  222  		/* Skip searching the mft zone. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  223  		done_zones |= 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  224  		if (zone_start >= vol->mft_zone_end) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  225  			zone_end = vol->nr_clusters;
^1da177e4c3f41 Linus Torvalds     2005-04-16  226  			search_zone = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  227  		} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  228  			zone_end = vol->mft_zone_start;
^1da177e4c3f41 Linus Torvalds     2005-04-16  229  			search_zone = 4;
^1da177e4c3f41 Linus Torvalds     2005-04-16  230  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  231  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  232  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  233  	 * bmp_pos is the current bit position inside the bitmap.  We use
^1da177e4c3f41 Linus Torvalds     2005-04-16  234  	 * bmp_initial_pos to determine whether or not to do a zone switch.
^1da177e4c3f41 Linus Torvalds     2005-04-16  235  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  	bmp_pos = bmp_initial_pos = zone_start;
^1da177e4c3f41 Linus Torvalds     2005-04-16  237  
^1da177e4c3f41 Linus Torvalds     2005-04-16  238  	/* Loop until all clusters are allocated, i.e. clusters == 0. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  239  	clusters = count;
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	rlpos = rlsize = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  241  	mapping = lcnbmp_vi->i_mapping;
db30d160cd8dfe Anton Altaparmakov 2004-11-11  242  	i_size = i_size_read(lcnbmp_vi);
^1da177e4c3f41 Linus Torvalds     2005-04-16  243  	while (1) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  244  		ntfs_debug("Start of outer while loop: done_zones 0x%x, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  245  				"search_zone %i, pass %i, zone_start 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  246  				"zone_end 0x%llx, bmp_initial_pos 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  247  				"bmp_pos 0x%llx, rlpos %i, rlsize %i.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  248  				done_zones, search_zone, pass,
^1da177e4c3f41 Linus Torvalds     2005-04-16  249  				(unsigned long long)zone_start,
^1da177e4c3f41 Linus Torvalds     2005-04-16  250  				(unsigned long long)zone_end,
^1da177e4c3f41 Linus Torvalds     2005-04-16  251  				(unsigned long long)bmp_initial_pos,
^1da177e4c3f41 Linus Torvalds     2005-04-16  252  				(unsigned long long)bmp_pos, rlpos, rlsize);
^1da177e4c3f41 Linus Torvalds     2005-04-16  253  		/* Loop until we run out of free clusters. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  254  		last_read_pos = bmp_pos >> 3;
^1da177e4c3f41 Linus Torvalds     2005-04-16  255  		ntfs_debug("last_read_pos 0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  256  				(unsigned long long)last_read_pos);
db30d160cd8dfe Anton Altaparmakov 2004-11-11  257  		if (last_read_pos > i_size) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  258  			ntfs_debug("End of attribute reached.  "
^1da177e4c3f41 Linus Torvalds     2005-04-16  259  					"Skipping to zone_pass_done.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  260  			goto zone_pass_done;
^1da177e4c3f41 Linus Torvalds     2005-04-16  261  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  262  		if (likely(page)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  263  			if (need_writeback) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  264  				ntfs_debug("Marking page dirty.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  265  				flush_dcache_page(page);
^1da177e4c3f41 Linus Torvalds     2005-04-16  266  				set_page_dirty(page);
^1da177e4c3f41 Linus Torvalds     2005-04-16  267  				need_writeback = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  268  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  269  			ntfs_unmap_page(page);
^1da177e4c3f41 Linus Torvalds     2005-04-16  270  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  271  		page = ntfs_map_page(mapping, last_read_pos >>
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  272  				PAGE_SHIFT);
^1da177e4c3f41 Linus Torvalds     2005-04-16  273  		if (IS_ERR(page)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  274  			err = PTR_ERR(page);
^1da177e4c3f41 Linus Torvalds     2005-04-16  275  			ntfs_error(vol->sb, "Failed to map page.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  276  			goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  277  		}
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  278  		buf_size = last_read_pos & ~PAGE_MASK;
^1da177e4c3f41 Linus Torvalds     2005-04-16  279  		buf = page_address(page) + buf_size;
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  280  		buf_size = PAGE_SIZE - buf_size;
db30d160cd8dfe Anton Altaparmakov 2004-11-11  281  		if (unlikely(last_read_pos + buf_size > i_size))
db30d160cd8dfe Anton Altaparmakov 2004-11-11  282  			buf_size = i_size - last_read_pos;
^1da177e4c3f41 Linus Torvalds     2005-04-16  283  		buf_size <<= 3;
^1da177e4c3f41 Linus Torvalds     2005-04-16  284  		lcn = bmp_pos & 7;
3bd1f4a173a344 Anton Altaparmakov 2005-06-25  285  		bmp_pos &= ~(LCN)7;
^1da177e4c3f41 Linus Torvalds     2005-04-16  286  		ntfs_debug("Before inner while loop: buf_size %i, lcn 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  287  				"bmp_pos 0x%llx, need_writeback %i.", buf_size,
^1da177e4c3f41 Linus Torvalds     2005-04-16  288  				(unsigned long long)lcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  289  				(unsigned long long)bmp_pos, need_writeback);
^1da177e4c3f41 Linus Torvalds     2005-04-16  290  		while (lcn < buf_size && lcn + bmp_pos < zone_end) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  291  			byte = buf + (lcn >> 3);
^1da177e4c3f41 Linus Torvalds     2005-04-16  292  			ntfs_debug("In inner while loop: buf_size %i, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  293  					"lcn 0x%llx, bmp_pos 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  294  					"need_writeback %i, byte ofs 0x%x, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  295  					"*byte 0x%x.", buf_size,
^1da177e4c3f41 Linus Torvalds     2005-04-16  296  					(unsigned long long)lcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  297  					(unsigned long long)bmp_pos,
^1da177e4c3f41 Linus Torvalds     2005-04-16  298  					need_writeback,
^1da177e4c3f41 Linus Torvalds     2005-04-16  299  					(unsigned int)(lcn >> 3),
^1da177e4c3f41 Linus Torvalds     2005-04-16  300  					(unsigned int)*byte);
^1da177e4c3f41 Linus Torvalds     2005-04-16  301  			/* Skip full bytes. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  302  			if (*byte == 0xff) {
3bd1f4a173a344 Anton Altaparmakov 2005-06-25  303  				lcn = (lcn + 8) & ~(LCN)7;
^1da177e4c3f41 Linus Torvalds     2005-04-16  304  				ntfs_debug("Continuing while loop 1.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  305  				continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  306  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  307  			bit = 1 << (lcn & 7);
fc0fa7dc7d243a Anton Altaparmakov 2005-10-04  308  			ntfs_debug("bit 0x%x.", bit);
^1da177e4c3f41 Linus Torvalds     2005-04-16  309  			/* If the bit is already set, go onto the next one. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  310  			if (*byte & bit) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  311  				lcn++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  312  				ntfs_debug("Continuing while loop 2.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  313  				continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  314  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  315  			/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  316  			 * Allocate more memory if needed, including space for
^1da177e4c3f41 Linus Torvalds     2005-04-16  317  			 * the terminator element.
^1da177e4c3f41 Linus Torvalds     2005-04-16  318  			 * ntfs_malloc_nofs() operates on whole pages only.
^1da177e4c3f41 Linus Torvalds     2005-04-16  319  			 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  320  			if ((rlpos + 2) * sizeof(*rl) > rlsize) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  321  				runlist_element *rl2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  322  
^1da177e4c3f41 Linus Torvalds     2005-04-16  323  				ntfs_debug("Reallocating memory.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  324  				if (!rl)
^1da177e4c3f41 Linus Torvalds     2005-04-16  325  					ntfs_debug("First free bit is at LCN "
^1da177e4c3f41 Linus Torvalds     2005-04-16  326  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  327  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  328  							(lcn + bmp_pos));
^1da177e4c3f41 Linus Torvalds     2005-04-16  329  				rl2 = ntfs_malloc_nofs(rlsize + (int)PAGE_SIZE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  330  				if (unlikely(!rl2)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  331  					err = -ENOMEM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  332  					ntfs_error(vol->sb, "Failed to "
^1da177e4c3f41 Linus Torvalds     2005-04-16  333  							"allocate memory.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  334  					goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  335  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16 @336  				memcpy(rl2, rl, rlsize);
^1da177e4c3f41 Linus Torvalds     2005-04-16  337  				ntfs_free(rl);
^1da177e4c3f41 Linus Torvalds     2005-04-16  338  				rl = rl2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  339  				rlsize += PAGE_SIZE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  340  				ntfs_debug("Reallocated memory, rlsize 0x%x.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  341  						rlsize);
^1da177e4c3f41 Linus Torvalds     2005-04-16  342  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  343  			/* Allocate the bitmap bit. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  344  			*byte |= bit;
^1da177e4c3f41 Linus Torvalds     2005-04-16  345  			/* We need to write this bitmap page to disk. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  346  			need_writeback = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  347  			ntfs_debug("*byte 0x%x, need_writeback is set.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  348  					(unsigned int)*byte);
^1da177e4c3f41 Linus Torvalds     2005-04-16  349  			/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  350  			 * Coalesce with previous run if adjacent LCNs.
^1da177e4c3f41 Linus Torvalds     2005-04-16  351  			 * Otherwise, append a new run.
^1da177e4c3f41 Linus Torvalds     2005-04-16  352  			 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  353  			ntfs_debug("Adding run (lcn 0x%llx, len 0x%llx), "
^1da177e4c3f41 Linus Torvalds     2005-04-16  354  					"prev_lcn 0x%llx, lcn 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  355  					"bmp_pos 0x%llx, prev_run_len 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  356  					"rlpos %i.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  357  					(unsigned long long)(lcn + bmp_pos),
^1da177e4c3f41 Linus Torvalds     2005-04-16  358  					1ULL, (unsigned long long)prev_lcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  359  					(unsigned long long)lcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  360  					(unsigned long long)bmp_pos,
^1da177e4c3f41 Linus Torvalds     2005-04-16  361  					(unsigned long long)prev_run_len,
^1da177e4c3f41 Linus Torvalds     2005-04-16  362  					rlpos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  363  			if (prev_lcn == lcn + bmp_pos - prev_run_len && rlpos) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  364  				ntfs_debug("Coalescing to run (lcn 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  365  						"len 0x%llx).",
^1da177e4c3f41 Linus Torvalds     2005-04-16  366  						(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  367  						rl[rlpos - 1].lcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  368  						(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  369  						rl[rlpos - 1].length);
^1da177e4c3f41 Linus Torvalds     2005-04-16  370  				rl[rlpos - 1].length = ++prev_run_len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  371  				ntfs_debug("Run now (lcn 0x%llx, len 0x%llx), "
^1da177e4c3f41 Linus Torvalds     2005-04-16  372  						"prev_run_len 0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  373  						(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  374  						rl[rlpos - 1].lcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  375  						(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  376  						rl[rlpos - 1].length,
^1da177e4c3f41 Linus Torvalds     2005-04-16  377  						(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  378  						prev_run_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  379  			} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  380  				if (likely(rlpos)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  381  					ntfs_debug("Adding new run, (previous "
^1da177e4c3f41 Linus Torvalds     2005-04-16  382  							"run lcn 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  383  							"len 0x%llx).",
^1da177e4c3f41 Linus Torvalds     2005-04-16  384  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  385  							rl[rlpos - 1].lcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  386  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  387  							rl[rlpos - 1].length);
^1da177e4c3f41 Linus Torvalds     2005-04-16  388  					rl[rlpos].vcn = rl[rlpos - 1].vcn +
^1da177e4c3f41 Linus Torvalds     2005-04-16  389  							prev_run_len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  390  				} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  391  					ntfs_debug("Adding new run, is first "
^1da177e4c3f41 Linus Torvalds     2005-04-16  392  							"run.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  393  					rl[rlpos].vcn = start_vcn;
^1da177e4c3f41 Linus Torvalds     2005-04-16  394  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  395  				rl[rlpos].lcn = prev_lcn = lcn + bmp_pos;
^1da177e4c3f41 Linus Torvalds     2005-04-16  396  				rl[rlpos].length = prev_run_len = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  397  				rlpos++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  398  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  399  			/* Done? */
^1da177e4c3f41 Linus Torvalds     2005-04-16  400  			if (!--clusters) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  401  				LCN tc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  402  				/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  403  				 * Update the current zone position.  Positions
^1da177e4c3f41 Linus Torvalds     2005-04-16  404  				 * of already scanned zones have been updated
^1da177e4c3f41 Linus Torvalds     2005-04-16  405  				 * during the respective zone switches.
^1da177e4c3f41 Linus Torvalds     2005-04-16  406  				 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  407  				tc = lcn + bmp_pos + 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  408  				ntfs_debug("Done. Updating current zone "
^1da177e4c3f41 Linus Torvalds     2005-04-16  409  						"position, tc 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  410  						"search_zone %i.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  411  						(unsigned long long)tc,
^1da177e4c3f41 Linus Torvalds     2005-04-16  412  						search_zone);
^1da177e4c3f41 Linus Torvalds     2005-04-16  413  				switch (search_zone) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  414  				case 1:
^1da177e4c3f41 Linus Torvalds     2005-04-16  415  					ntfs_debug("Before checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  416  							"vol->mft_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  417  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  418  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  419  							vol->mft_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  420  					if (tc >= vol->mft_zone_end) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  421  						vol->mft_zone_pos =
^1da177e4c3f41 Linus Torvalds     2005-04-16  422  								vol->mft_lcn;
^1da177e4c3f41 Linus Torvalds     2005-04-16  423  						if (!vol->mft_zone_end)
^1da177e4c3f41 Linus Torvalds     2005-04-16  424  							vol->mft_zone_pos = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  425  					} else if ((bmp_initial_pos >=
^1da177e4c3f41 Linus Torvalds     2005-04-16  426  							vol->mft_zone_pos ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  427  							tc > vol->mft_zone_pos)
^1da177e4c3f41 Linus Torvalds     2005-04-16  428  							&& tc >= vol->mft_lcn)
^1da177e4c3f41 Linus Torvalds     2005-04-16  429  						vol->mft_zone_pos = tc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  430  					ntfs_debug("After checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  431  							"vol->mft_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  432  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  433  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  434  							vol->mft_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  435  					break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  436  				case 2:
^1da177e4c3f41 Linus Torvalds     2005-04-16  437  					ntfs_debug("Before checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  438  							"vol->data1_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  439  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  440  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  441  							vol->data1_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  442  					if (tc >= vol->nr_clusters)
^1da177e4c3f41 Linus Torvalds     2005-04-16  443  						vol->data1_zone_pos =
^1da177e4c3f41 Linus Torvalds     2005-04-16  444  							     vol->mft_zone_end;
^1da177e4c3f41 Linus Torvalds     2005-04-16  445  					else if ((bmp_initial_pos >=
^1da177e4c3f41 Linus Torvalds     2005-04-16  446  						    vol->data1_zone_pos ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  447  						    tc > vol->data1_zone_pos)
^1da177e4c3f41 Linus Torvalds     2005-04-16  448  						    && tc >= vol->mft_zone_end)
^1da177e4c3f41 Linus Torvalds     2005-04-16  449  						vol->data1_zone_pos = tc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  450  					ntfs_debug("After checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  451  							"vol->data1_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  452  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  453  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  454  							vol->data1_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  455  					break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  456  				case 4:
^1da177e4c3f41 Linus Torvalds     2005-04-16  457  					ntfs_debug("Before checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  458  							"vol->data2_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  459  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  460  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  461  							vol->data2_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  462  					if (tc >= vol->mft_zone_start)
^1da177e4c3f41 Linus Torvalds     2005-04-16  463  						vol->data2_zone_pos = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  464  					else if (bmp_initial_pos >=
^1da177e4c3f41 Linus Torvalds     2005-04-16  465  						      vol->data2_zone_pos ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  466  						      tc > vol->data2_zone_pos)
^1da177e4c3f41 Linus Torvalds     2005-04-16  467  						vol->data2_zone_pos = tc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  468  					ntfs_debug("After checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  469  							"vol->data2_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  470  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  471  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  472  							vol->data2_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  473  					break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  474  				default:
^1da177e4c3f41 Linus Torvalds     2005-04-16  475  					BUG();
^1da177e4c3f41 Linus Torvalds     2005-04-16  476  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  477  				ntfs_debug("Finished.  Going to out.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  478  				goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  479  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  480  			lcn++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  481  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  482  		bmp_pos += buf_size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  483  		ntfs_debug("After inner while loop: buf_size 0x%x, lcn "
^1da177e4c3f41 Linus Torvalds     2005-04-16  484  				"0x%llx, bmp_pos 0x%llx, need_writeback %i.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  485  				buf_size, (unsigned long long)lcn,
^1da177e4c3f41 Linus Torvalds     2005-04-16  486  				(unsigned long long)bmp_pos, need_writeback);
^1da177e4c3f41 Linus Torvalds     2005-04-16  487  		if (bmp_pos < zone_end) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  488  			ntfs_debug("Continuing outer while loop, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  489  					"bmp_pos 0x%llx, zone_end 0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  490  					(unsigned long long)bmp_pos,
^1da177e4c3f41 Linus Torvalds     2005-04-16  491  					(unsigned long long)zone_end);
^1da177e4c3f41 Linus Torvalds     2005-04-16  492  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  493  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  494  zone_pass_done:	/* Finished with the current zone pass. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  495  		ntfs_debug("At zone_pass_done, pass %i.", pass);
^1da177e4c3f41 Linus Torvalds     2005-04-16  496  		if (pass == 1) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  497  			/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  498  			 * Now do pass 2, scanning the first part of the zone
^1da177e4c3f41 Linus Torvalds     2005-04-16  499  			 * we omitted in pass 1.
^1da177e4c3f41 Linus Torvalds     2005-04-16  500  			 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  501  			pass = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  502  			zone_end = zone_start;
^1da177e4c3f41 Linus Torvalds     2005-04-16  503  			switch (search_zone) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  504  			case 1: /* mft_zone */
^1da177e4c3f41 Linus Torvalds     2005-04-16  505  				zone_start = vol->mft_zone_start;
^1da177e4c3f41 Linus Torvalds     2005-04-16  506  				break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  507  			case 2: /* data1_zone */
^1da177e4c3f41 Linus Torvalds     2005-04-16  508  				zone_start = vol->mft_zone_end;
^1da177e4c3f41 Linus Torvalds     2005-04-16  509  				break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  510  			case 4: /* data2_zone */
^1da177e4c3f41 Linus Torvalds     2005-04-16  511  				zone_start = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  512  				break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  513  			default:
^1da177e4c3f41 Linus Torvalds     2005-04-16  514  				BUG();
^1da177e4c3f41 Linus Torvalds     2005-04-16  515  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  516  			/* Sanity check. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  517  			if (zone_end < zone_start)
^1da177e4c3f41 Linus Torvalds     2005-04-16  518  				zone_end = zone_start;
^1da177e4c3f41 Linus Torvalds     2005-04-16  519  			bmp_pos = zone_start;
^1da177e4c3f41 Linus Torvalds     2005-04-16  520  			ntfs_debug("Continuing outer while loop, pass 2, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  521  					"zone_start 0x%llx, zone_end 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  522  					"bmp_pos 0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  523  					(unsigned long long)zone_start,
^1da177e4c3f41 Linus Torvalds     2005-04-16  524  					(unsigned long long)zone_end,
^1da177e4c3f41 Linus Torvalds     2005-04-16  525  					(unsigned long long)bmp_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  526  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  527  		} /* pass == 2 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  528  done_zones_check:
^1da177e4c3f41 Linus Torvalds     2005-04-16  529  		ntfs_debug("At done_zones_check, search_zone %i, done_zones "
^1da177e4c3f41 Linus Torvalds     2005-04-16  530  				"before 0x%x, done_zones after 0x%x.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  531  				search_zone, done_zones,
^1da177e4c3f41 Linus Torvalds     2005-04-16  532  				done_zones | search_zone);
^1da177e4c3f41 Linus Torvalds     2005-04-16  533  		done_zones |= search_zone;
^1da177e4c3f41 Linus Torvalds     2005-04-16  534  		if (done_zones < 7) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  535  			ntfs_debug("Switching zone.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  536  			/* Now switch to the next zone we haven't done yet. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  537  			pass = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  538  			switch (search_zone) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  539  			case 1:
^1da177e4c3f41 Linus Torvalds     2005-04-16  540  				ntfs_debug("Switching from mft zone to data1 "
^1da177e4c3f41 Linus Torvalds     2005-04-16  541  						"zone.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  542  				/* Update mft zone position. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  543  				if (rlpos) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  544  					LCN tc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  545  
^1da177e4c3f41 Linus Torvalds     2005-04-16  546  					ntfs_debug("Before checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  547  							"vol->mft_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  548  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  549  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  550  							vol->mft_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  551  					tc = rl[rlpos - 1].lcn +
^1da177e4c3f41 Linus Torvalds     2005-04-16  552  							rl[rlpos - 1].length;
^1da177e4c3f41 Linus Torvalds     2005-04-16  553  					if (tc >= vol->mft_zone_end) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  554  						vol->mft_zone_pos =
^1da177e4c3f41 Linus Torvalds     2005-04-16  555  								vol->mft_lcn;
^1da177e4c3f41 Linus Torvalds     2005-04-16  556  						if (!vol->mft_zone_end)
^1da177e4c3f41 Linus Torvalds     2005-04-16  557  							vol->mft_zone_pos = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  558  					} else if ((bmp_initial_pos >=
^1da177e4c3f41 Linus Torvalds     2005-04-16  559  							vol->mft_zone_pos ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  560  							tc > vol->mft_zone_pos)
^1da177e4c3f41 Linus Torvalds     2005-04-16  561  							&& tc >= vol->mft_lcn)
^1da177e4c3f41 Linus Torvalds     2005-04-16  562  						vol->mft_zone_pos = tc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  563  					ntfs_debug("After checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  564  							"vol->mft_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  565  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  566  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  567  							vol->mft_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  568  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  569  				/* Switch from mft zone to data1 zone. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  570  switch_to_data1_zone:		search_zone = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  571  				zone_start = bmp_initial_pos =
^1da177e4c3f41 Linus Torvalds     2005-04-16  572  						vol->data1_zone_pos;
^1da177e4c3f41 Linus Torvalds     2005-04-16  573  				zone_end = vol->nr_clusters;
^1da177e4c3f41 Linus Torvalds     2005-04-16  574  				if (zone_start == vol->mft_zone_end)
^1da177e4c3f41 Linus Torvalds     2005-04-16  575  					pass = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  576  				if (zone_start >= zone_end) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  577  					vol->data1_zone_pos = zone_start =
^1da177e4c3f41 Linus Torvalds     2005-04-16  578  							vol->mft_zone_end;
^1da177e4c3f41 Linus Torvalds     2005-04-16  579  					pass = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  580  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  581  				break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  582  			case 2:
^1da177e4c3f41 Linus Torvalds     2005-04-16  583  				ntfs_debug("Switching from data1 zone to "
^1da177e4c3f41 Linus Torvalds     2005-04-16  584  						"data2 zone.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  585  				/* Update data1 zone position. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  586  				if (rlpos) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  587  					LCN tc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  588  
^1da177e4c3f41 Linus Torvalds     2005-04-16  589  					ntfs_debug("Before checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  590  							"vol->data1_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  591  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  592  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  593  							vol->data1_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  594  					tc = rl[rlpos - 1].lcn +
^1da177e4c3f41 Linus Torvalds     2005-04-16  595  							rl[rlpos - 1].length;
^1da177e4c3f41 Linus Torvalds     2005-04-16  596  					if (tc >= vol->nr_clusters)
^1da177e4c3f41 Linus Torvalds     2005-04-16  597  						vol->data1_zone_pos =
^1da177e4c3f41 Linus Torvalds     2005-04-16  598  							     vol->mft_zone_end;
^1da177e4c3f41 Linus Torvalds     2005-04-16  599  					else if ((bmp_initial_pos >=
^1da177e4c3f41 Linus Torvalds     2005-04-16  600  						    vol->data1_zone_pos ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  601  						    tc > vol->data1_zone_pos)
^1da177e4c3f41 Linus Torvalds     2005-04-16  602  						    && tc >= vol->mft_zone_end)
^1da177e4c3f41 Linus Torvalds     2005-04-16  603  						vol->data1_zone_pos = tc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  604  					ntfs_debug("After checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  605  							"vol->data1_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  606  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  607  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  608  							vol->data1_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  609  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  610  				/* Switch from data1 zone to data2 zone. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  611  				search_zone = 4;
^1da177e4c3f41 Linus Torvalds     2005-04-16  612  				zone_start = bmp_initial_pos =
^1da177e4c3f41 Linus Torvalds     2005-04-16  613  						vol->data2_zone_pos;
^1da177e4c3f41 Linus Torvalds     2005-04-16  614  				zone_end = vol->mft_zone_start;
^1da177e4c3f41 Linus Torvalds     2005-04-16  615  				if (!zone_start)
^1da177e4c3f41 Linus Torvalds     2005-04-16  616  					pass = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  617  				if (zone_start >= zone_end) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  618  					vol->data2_zone_pos = zone_start =
^1da177e4c3f41 Linus Torvalds     2005-04-16  619  							bmp_initial_pos = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  620  					pass = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  621  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  622  				break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  623  			case 4:
^1da177e4c3f41 Linus Torvalds     2005-04-16  624  				ntfs_debug("Switching from data2 zone to "
^1da177e4c3f41 Linus Torvalds     2005-04-16  625  						"data1 zone.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  626  				/* Update data2 zone position. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  627  				if (rlpos) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  628  					LCN tc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  629  
^1da177e4c3f41 Linus Torvalds     2005-04-16  630  					ntfs_debug("Before checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  631  							"vol->data2_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  632  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  633  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  634  							vol->data2_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  635  					tc = rl[rlpos - 1].lcn +
^1da177e4c3f41 Linus Torvalds     2005-04-16  636  							rl[rlpos - 1].length;
^1da177e4c3f41 Linus Torvalds     2005-04-16  637  					if (tc >= vol->mft_zone_start)
^1da177e4c3f41 Linus Torvalds     2005-04-16  638  						vol->data2_zone_pos = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  639  					else if (bmp_initial_pos >=
^1da177e4c3f41 Linus Torvalds     2005-04-16  640  						      vol->data2_zone_pos ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  641  						      tc > vol->data2_zone_pos)
^1da177e4c3f41 Linus Torvalds     2005-04-16  642  						vol->data2_zone_pos = tc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  643  					ntfs_debug("After checks, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  644  							"vol->data2_zone_pos "
^1da177e4c3f41 Linus Torvalds     2005-04-16  645  							"0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  646  							(unsigned long long)
^1da177e4c3f41 Linus Torvalds     2005-04-16  647  							vol->data2_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  648  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  649  				/* Switch from data2 zone to data1 zone. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  650  				goto switch_to_data1_zone;
^1da177e4c3f41 Linus Torvalds     2005-04-16  651  			default:
^1da177e4c3f41 Linus Torvalds     2005-04-16  652  				BUG();
^1da177e4c3f41 Linus Torvalds     2005-04-16  653  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  654  			ntfs_debug("After zone switch, search_zone %i, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  655  					"pass %i, bmp_initial_pos 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  656  					"zone_start 0x%llx, zone_end 0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  657  					search_zone, pass,
^1da177e4c3f41 Linus Torvalds     2005-04-16  658  					(unsigned long long)bmp_initial_pos,
^1da177e4c3f41 Linus Torvalds     2005-04-16  659  					(unsigned long long)zone_start,
^1da177e4c3f41 Linus Torvalds     2005-04-16  660  					(unsigned long long)zone_end);
^1da177e4c3f41 Linus Torvalds     2005-04-16  661  			bmp_pos = zone_start;
^1da177e4c3f41 Linus Torvalds     2005-04-16  662  			if (zone_start == zone_end) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  663  				ntfs_debug("Empty zone, going to "
^1da177e4c3f41 Linus Torvalds     2005-04-16  664  						"done_zones_check.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  665  				/* Empty zone. Don't bother searching it. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  666  				goto done_zones_check;
^1da177e4c3f41 Linus Torvalds     2005-04-16  667  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  668  			ntfs_debug("Continuing outer while loop.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  669  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  670  		} /* done_zones == 7 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  671  		ntfs_debug("All zones are finished.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  672  		/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  673  		 * All zones are finished!  If DATA_ZONE, shrink mft zone.  If
^1da177e4c3f41 Linus Torvalds     2005-04-16  674  		 * MFT_ZONE, we have really run out of space.
^1da177e4c3f41 Linus Torvalds     2005-04-16  675  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  676  		mft_zone_size = vol->mft_zone_end - vol->mft_zone_start;
^1da177e4c3f41 Linus Torvalds     2005-04-16  677  		ntfs_debug("vol->mft_zone_start 0x%llx, vol->mft_zone_end "
^1da177e4c3f41 Linus Torvalds     2005-04-16  678  				"0x%llx, mft_zone_size 0x%llx.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  679  				(unsigned long long)vol->mft_zone_start,
^1da177e4c3f41 Linus Torvalds     2005-04-16  680  				(unsigned long long)vol->mft_zone_end,
^1da177e4c3f41 Linus Torvalds     2005-04-16  681  				(unsigned long long)mft_zone_size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  682  		if (zone == MFT_ZONE || mft_zone_size <= 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  683  			ntfs_debug("No free clusters left, going to out.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  684  			/* Really no more space left on device. */
43b01fda8b17b2 Anton Altaparmakov 2005-03-09  685  			err = -ENOSPC;
^1da177e4c3f41 Linus Torvalds     2005-04-16  686  			goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  687  		} /* zone == DATA_ZONE && mft_zone_size > 0 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  688  		ntfs_debug("Shrinking mft zone.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  689  		zone_end = vol->mft_zone_end;
^1da177e4c3f41 Linus Torvalds     2005-04-16  690  		mft_zone_size >>= 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  691  		if (mft_zone_size > 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  692  			vol->mft_zone_end = vol->mft_zone_start + mft_zone_size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  693  		else /* mft zone and data2 zone no longer exist. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  694  			vol->data2_zone_pos = vol->mft_zone_start =
^1da177e4c3f41 Linus Torvalds     2005-04-16  695  					vol->mft_zone_end = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  696  		if (vol->mft_zone_pos >= vol->mft_zone_end) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  697  			vol->mft_zone_pos = vol->mft_lcn;
^1da177e4c3f41 Linus Torvalds     2005-04-16  698  			if (!vol->mft_zone_end)
^1da177e4c3f41 Linus Torvalds     2005-04-16  699  				vol->mft_zone_pos = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  700  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  701  		bmp_pos = zone_start = bmp_initial_pos =
^1da177e4c3f41 Linus Torvalds     2005-04-16  702  				vol->data1_zone_pos = vol->mft_zone_end;
^1da177e4c3f41 Linus Torvalds     2005-04-16  703  		search_zone = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  704  		pass = 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  705  		done_zones &= ~2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  706  		ntfs_debug("After shrinking mft zone, mft_zone_size 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  707  				"vol->mft_zone_start 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  708  				"vol->mft_zone_end 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  709  				"vol->mft_zone_pos 0x%llx, search_zone 2, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  710  				"pass 2, dones_zones 0x%x, zone_start 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  711  				"zone_end 0x%llx, vol->data1_zone_pos 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  712  				"continuing outer while loop.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  713  				(unsigned long long)mft_zone_size,
^1da177e4c3f41 Linus Torvalds     2005-04-16  714  				(unsigned long long)vol->mft_zone_start,
^1da177e4c3f41 Linus Torvalds     2005-04-16  715  				(unsigned long long)vol->mft_zone_end,
^1da177e4c3f41 Linus Torvalds     2005-04-16  716  				(unsigned long long)vol->mft_zone_pos,
^1da177e4c3f41 Linus Torvalds     2005-04-16  717  				done_zones, (unsigned long long)zone_start,
^1da177e4c3f41 Linus Torvalds     2005-04-16  718  				(unsigned long long)zone_end,
^1da177e4c3f41 Linus Torvalds     2005-04-16  719  				(unsigned long long)vol->data1_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  720  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  721  	ntfs_debug("After outer while loop.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  722  out:
^1da177e4c3f41 Linus Torvalds     2005-04-16  723  	ntfs_debug("At out.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  724  	/* Add runlist terminator element. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  725  	if (likely(rl)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  726  		rl[rlpos].vcn = rl[rlpos - 1].vcn + rl[rlpos - 1].length;
fc0fa7dc7d243a Anton Altaparmakov 2005-10-04  727  		rl[rlpos].lcn = is_extension ? LCN_ENOENT : LCN_RL_NOT_MAPPED;
^1da177e4c3f41 Linus Torvalds     2005-04-16  728  		rl[rlpos].length = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  729  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  730  	if (likely(page && !IS_ERR(page))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  731  		if (need_writeback) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  732  			ntfs_debug("Marking page dirty.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  733  			flush_dcache_page(page);
^1da177e4c3f41 Linus Torvalds     2005-04-16  734  			set_page_dirty(page);
^1da177e4c3f41 Linus Torvalds     2005-04-16  735  			need_writeback = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  736  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  737  		ntfs_unmap_page(page);
^1da177e4c3f41 Linus Torvalds     2005-04-16  738  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  739  	if (likely(!err)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  740  		up_write(&vol->lcnbmp_lock);
^1da177e4c3f41 Linus Torvalds     2005-04-16  741  		ntfs_debug("Done.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  742  		return rl;
^1da177e4c3f41 Linus Torvalds     2005-04-16  743  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  744  	ntfs_error(vol->sb, "Failed to allocate clusters, aborting "
^1da177e4c3f41 Linus Torvalds     2005-04-16  745  			"(error %i).", err);
^1da177e4c3f41 Linus Torvalds     2005-04-16  746  	if (rl) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  747  		int err2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  748  
43b01fda8b17b2 Anton Altaparmakov 2005-03-09  749  		if (err == -ENOSPC)
^1da177e4c3f41 Linus Torvalds     2005-04-16  750  			ntfs_debug("Not enough space to complete allocation, "
43b01fda8b17b2 Anton Altaparmakov 2005-03-09  751  					"err -ENOSPC, first free lcn 0x%llx, "
^1da177e4c3f41 Linus Torvalds     2005-04-16  752  					"could allocate up to 0x%llx "
^1da177e4c3f41 Linus Torvalds     2005-04-16  753  					"clusters.",
^1da177e4c3f41 Linus Torvalds     2005-04-16  754  					(unsigned long long)rl[0].lcn,
8907547d4b099e Randy Dunlap       2005-03-03  755  					(unsigned long long)(count - clusters));
^1da177e4c3f41 Linus Torvalds     2005-04-16  756  		/* Deallocate all allocated clusters. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  757  		ntfs_debug("Attempting rollback...");
^1da177e4c3f41 Linus Torvalds     2005-04-16  758  		err2 = ntfs_cluster_free_from_rl_nolock(vol, rl);
^1da177e4c3f41 Linus Torvalds     2005-04-16  759  		if (err2) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  760  			ntfs_error(vol->sb, "Failed to rollback (error %i).  "
^1da177e4c3f41 Linus Torvalds     2005-04-16  761  					"Leaving inconsistent metadata!  "
^1da177e4c3f41 Linus Torvalds     2005-04-16  762  					"Unmount and run chkdsk.", err2);
^1da177e4c3f41 Linus Torvalds     2005-04-16  763  			NVolSetErrors(vol);
^1da177e4c3f41 Linus Torvalds     2005-04-16  764  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  765  		/* Free the runlist. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  766  		ntfs_free(rl);
43b01fda8b17b2 Anton Altaparmakov 2005-03-09  767  	} else if (err == -ENOSPC)
43b01fda8b17b2 Anton Altaparmakov 2005-03-09  768  		ntfs_debug("No space left at all, err = -ENOSPC, first free "
43b01fda8b17b2 Anton Altaparmakov 2005-03-09  769  				"lcn = 0x%llx.",
43b01fda8b17b2 Anton Altaparmakov 2005-03-09  770  				(long long)vol->data1_zone_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  771  	up_write(&vol->lcnbmp_lock);
^1da177e4c3f41 Linus Torvalds     2005-04-16  772  	return ERR_PTR(err);
^1da177e4c3f41 Linus Torvalds     2005-04-16  773  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  774  

:::::: The code at line 336 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
