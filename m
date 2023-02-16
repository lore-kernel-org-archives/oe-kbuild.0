Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8712120FB
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 07:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676532382; x=1708068382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UhN/7SFaRiydR2ZHSXzWRFPARVPAC6d76O+ihVHL9/4=;
  b=OupvFaJiQXxCWxb+BVPNerEAzPtTGlWQ7awa1PL0APKCFzr7FLXXCK8v
   mLK1eeFzDEjVxHfBBYwyZaS+f8lKzQ9BvZzMNdEBvbCmGTSqPFPRjHXLx
   tX00scbyTsvZ+dvuvcyaLy0xkDFXcPv/Q0IeOTRnPjwOVfrkFI481mZB+
   p8G18LYzwGZ1EkbirEV4YcoN1ZnQqkFfruzcUz9/uAJbAtFS89BCvC5px
   q7eLsGS0gR19NZBtb4rmz8sVU8jeZNzUOin2h8f9z4H3LGbum0+Pi5Tu+
   Q6r2VSEE8OYSjHud9EnH/XuZF2jQUPqWAgirnlHATtIaIwZ3xrgwQ3p/c
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="417869389"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="417869389"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 23:26:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="998913934"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="998913934"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Feb 2023 23:26:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSYep-000A5z-2D;
	Thu, 16 Feb 2023 07:26:19 +0000
Date: Thu, 16 Feb 2023 15:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [djwong-xfs:xfile-page-caching 217/268]
 fs/xfs/xfs_swapext_item.c:57:5-24: atomic_dec_and_test variation before
 object free at line 58.
Message-ID: <202302161508.TFV6pe5Z-lkp@intel.com>
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
head:   b1434f1ffff0b89a85493bd8ab8c880b3887ca75
commit: 614a35f77ea5f89cd4bb782019aab1c874aa12b7 [217/268] xfs: introduce a swap-extent log intent item
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230216/202302161508.TFV6pe5Z-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202302161508.TFV6pe5Z-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_swapext_item.c:57:5-24: atomic_dec_and_test variation before object free at line 58.

vim +57 fs/xfs/xfs_swapext_item.c

614a35f77ea5f8 Darrick J. Wong 2022-07-14  44  
614a35f77ea5f8 Darrick J. Wong 2022-07-14  45  /*
614a35f77ea5f8 Darrick J. Wong 2022-07-14  46   * Freeing the SXI requires that we remove it from the AIL if it has already
614a35f77ea5f8 Darrick J. Wong 2022-07-14  47   * been placed there. However, the SXI may not yet have been placed in the AIL
614a35f77ea5f8 Darrick J. Wong 2022-07-14  48   * when called by xfs_sxi_release() from SXD processing due to the ordering of
614a35f77ea5f8 Darrick J. Wong 2022-07-14  49   * committed vs unpin operations in bulk insert operations. Hence the reference
614a35f77ea5f8 Darrick J. Wong 2022-07-14  50   * count to ensure only the last caller frees the SXI.
614a35f77ea5f8 Darrick J. Wong 2022-07-14  51   */
614a35f77ea5f8 Darrick J. Wong 2022-07-14  52  STATIC void
614a35f77ea5f8 Darrick J. Wong 2022-07-14  53  xfs_sxi_release(
614a35f77ea5f8 Darrick J. Wong 2022-07-14  54  	struct xfs_sxi_log_item	*sxi_lip)
614a35f77ea5f8 Darrick J. Wong 2022-07-14  55  {
614a35f77ea5f8 Darrick J. Wong 2022-07-14  56  	ASSERT(atomic_read(&sxi_lip->sxi_refcount) > 0);
614a35f77ea5f8 Darrick J. Wong 2022-07-14 @57  	if (atomic_dec_and_test(&sxi_lip->sxi_refcount)) {
614a35f77ea5f8 Darrick J. Wong 2022-07-14 @58  		xfs_trans_ail_delete(&sxi_lip->sxi_item, SHUTDOWN_LOG_IO_ERROR);
614a35f77ea5f8 Darrick J. Wong 2022-07-14  59  		xfs_sxi_item_free(sxi_lip);
614a35f77ea5f8 Darrick J. Wong 2022-07-14  60  	}
614a35f77ea5f8 Darrick J. Wong 2022-07-14  61  }
614a35f77ea5f8 Darrick J. Wong 2022-07-14  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
