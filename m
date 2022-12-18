Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2AD367
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Dec 2022 05:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671341113; x=1702877113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6vzOwxAwrgkOkBH9AfVqtLD4A5IsWXrnvxp6XL46HzM=;
  b=GNikVWdPxDDV2KR4+4zf/HbMS7ETZuRoT5y7WZvWic0KlS3KIOTBsu/K
   Y1InAneKszZwdgt0Qc+qr3zVib5gfL4/OIfyt5sOogAqyDjFdOwMEMPLb
   HCqx622jwhRNJq0FQ2LzexQdmduEzCZ+NJfPbV6Elt3dVqqXEEops6p/U
   /u9YG+8dXeCJ6DS4sIYjJ03nGkhRcYvyEz6FNlKLKPx31jWdXIwDyQ81X
   mNIqo8lkBK166gFfyNp54M94p8VELbBHPCqUl1h5jBKdQ5tQY2WxK78AC
   Q9LzMrBNGPWc1n61WFFBmoY6Nvehp9u1+3i8kRRFTHCm8ijrWrSet2i7c
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10564"; a="405430462"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="405430462"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2022 21:25:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10564"; a="627967580"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="627967580"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Dec 2022 21:25:10 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p6mAh-00086c-09;
	Sun, 18 Dec 2022 05:25:11 +0000
Date: Sun, 18 Dec 2022 13:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 277/327]
 fs/xfs/libxfs/xfs_format.h:431:4: warning: Shifting signed 32-bit value by
 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
Message-ID: <202212181333.QFpnoBLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/libxfs/xfs_format.h:431:4: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   d1250c38a00309ecfccd142acc124ec461a777bc
commit: 4d4eab765648436066127e90cdb092bc8899a07d [277/327] xfs: create deferred log items for extent swapping
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4d4eab765648436066127e90cdb092bc8899a07d
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   fs/xfs/libxfs/xfs_sb.c:470:21: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    if (!!sbp->sb_unit ^ has_dalign) {
                       ^
>> fs/xfs/libxfs/xfs_format.h:431:4: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_sb.c:1202:17: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     geo->flags |= XFS_FSOP_GEOM_FLAGS_ATOMIC_SWAP;
                   ^
>> fs/xfs/libxfs/xfs_format.h:431:4: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_sb.c:1202:17: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
     geo->flags |= XFS_FSOP_GEOM_FLAGS_ATOMIC_SWAP;
                   ^
--
>> fs/xfs/libxfs/xfs_format.h:431:4: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_format.h:431:4: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_swapext.c:132:24: warning: Using argument irec that points at uninitialized variable irec1 [ctuuninitvar]
    sxi->sxi_startoff1 += irec->br_blockcount;
                          ^
   fs/xfs/libxfs/xfs_swapext.c:398:36: note: Calling function xfs_swapext_find_mappings, 2nd argument is uninitialized
     error = xfs_swapext_find_mappings(sxi, &irec1, &irec2, NULL);
                                      ^
   fs/xfs/libxfs/xfs_swapext.c:219:38: note: Calling function sxi_advance, 2nd argument is uninitialized
    for (; sxi_has_more_swap_work(sxi); sxi_advance(sxi, irec1)) {
                                        ^
   fs/xfs/libxfs/xfs_swapext.c:132:24: note: Using argument irec
    sxi->sxi_startoff1 += irec->br_blockcount;
                          ^
--
   fs/xfs/libxfs/xfs_da_btree.c:2430:4: warning: 'continue' is redundant since it is the last statement in a loop. [redundantContinue]
      continue;
      ^
   fs/xfs/libxfs/xfs_da_btree.c:2451:4: warning: 'continue' is redundant since it is the last statement in a loop. [redundantContinue]
      continue;
      ^
>> fs/xfs/libxfs/xfs_format.h:431:4: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_format.h:431:4: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^

vim +431 fs/xfs/libxfs/xfs_format.h

bb58e6188a10f0 Christoph Hellwig 2014-11-28  427  
4d4eab76564843 Darrick J. Wong   2022-07-14  428  static inline bool xfs_sb_version_haslogswapext(struct xfs_sb *sbp)
4d4eab76564843 Darrick J. Wong   2022-07-14  429  {
4d4eab76564843 Darrick J. Wong   2022-07-14  430  	return xfs_sb_is_v5(sbp) && (sbp->sb_features_log_incompat &
4d4eab76564843 Darrick J. Wong   2022-07-14 @431  		 XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
4d4eab76564843 Darrick J. Wong   2022-07-14  432  }
4d4eab76564843 Darrick J. Wong   2022-07-14  433  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
