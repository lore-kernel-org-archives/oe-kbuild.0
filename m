Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820D3193B2
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Aug 2023 21:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692999000; x=1724535000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t8c5fxNpNGLeixnhfilcqybDtiKQJ7jtw36Rfs8vXLE=;
  b=ZskNitXQ3nQQx7ZRFEQebBAiUKJWJjELIYNKmmbFfqo9RjNwYTYlWEvp
   8CWA+dQE4Gj4Nezv6dhtKHyya0YHwTIVHOkLbKg2CUtgyAIWdm5fKH9R5
   fQOiVO0PJqWiIYVd4QSDvuyO4F9nUL5HEjLn19+kSVrvnFmwFvOtZUMng
   amYU6RnhUYHYHYtndVHq4kkpyA1OZgOrIjP/DhNq7wCxOuQ/WtgIxTY1f
   P26kbstltrrd8+bwBkpDUoWghl9/o87ISJ9gUtZG4wjKgLiM7sy7rax/h
   0x7EX+8ZNgk7rRFJKwTis+7z27J0AEakNNyjquLCVKXcNWfRA75PtBZsu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="372207354"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="372207354"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 14:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911405575"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="911405575"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Aug 2023 14:29:55 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZeNO-000411-16;
	Fri, 25 Aug 2023 21:29:54 +0000
Date: Sat, 26 Aug 2023 05:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [djwong-xfs:xfile-page-caching 149/203]
 fs/xfs/xfs_swapext_item.c:57:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 58.
Message-ID: <202308260546.c2rzeECQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   3a75294b1e898d6439eb60de137d003f3a112b58
commit: 0a4014b579bd691f25a25941d73ea088622c4fc9 [149/203] xfs: introduce a swap-extent log intent item
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-054-20230825 (https://download.01.org/0day-ci/archive/20230826/202308260546.c2rzeECQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260546.c2rzeECQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308260546.c2rzeECQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_swapext_item.c:57:5-24: WARNING: atomic_dec_and_test variation before object free at line 58.

vim +57 fs/xfs/xfs_swapext_item.c

0a4014b579bd69 Darrick J. Wong 2023-03-06  44  
0a4014b579bd69 Darrick J. Wong 2023-03-06  45  /*
0a4014b579bd69 Darrick J. Wong 2023-03-06  46   * Freeing the SXI requires that we remove it from the AIL if it has already
0a4014b579bd69 Darrick J. Wong 2023-03-06  47   * been placed there. However, the SXI may not yet have been placed in the AIL
0a4014b579bd69 Darrick J. Wong 2023-03-06  48   * when called by xfs_sxi_release() from SXD processing due to the ordering of
0a4014b579bd69 Darrick J. Wong 2023-03-06  49   * committed vs unpin operations in bulk insert operations. Hence the reference
0a4014b579bd69 Darrick J. Wong 2023-03-06  50   * count to ensure only the last caller frees the SXI.
0a4014b579bd69 Darrick J. Wong 2023-03-06  51   */
0a4014b579bd69 Darrick J. Wong 2023-03-06  52  STATIC void
0a4014b579bd69 Darrick J. Wong 2023-03-06  53  xfs_sxi_release(
0a4014b579bd69 Darrick J. Wong 2023-03-06  54  	struct xfs_sxi_log_item	*sxi_lip)
0a4014b579bd69 Darrick J. Wong 2023-03-06  55  {
0a4014b579bd69 Darrick J. Wong 2023-03-06  56  	ASSERT(atomic_read(&sxi_lip->sxi_refcount) > 0);
0a4014b579bd69 Darrick J. Wong 2023-03-06 @57  	if (atomic_dec_and_test(&sxi_lip->sxi_refcount)) {
0a4014b579bd69 Darrick J. Wong 2023-03-06 @58  		xfs_trans_ail_delete(&sxi_lip->sxi_item, SHUTDOWN_LOG_IO_ERROR);
0a4014b579bd69 Darrick J. Wong 2023-03-06  59  		xfs_sxi_item_free(sxi_lip);
0a4014b579bd69 Darrick J. Wong 2023-03-06  60  	}
0a4014b579bd69 Darrick J. Wong 2023-03-06  61  }
0a4014b579bd69 Darrick J. Wong 2023-03-06  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
