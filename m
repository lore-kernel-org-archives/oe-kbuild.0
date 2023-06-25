Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C2F7F
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jun 2023 00:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687653386; x=1719189386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHoG63C0YTAXcMp0tJ8gqDFUmABbQcLelrRWUdyZ/1U=;
  b=R+379yfjzRDrq+1SPAAiPEb0SdlElEAQRyW4LR9eyPQ90ZgbnTXcqrB2
   Cepc8uUfW1LPqKv/hViDgQFAaTe4f6QPNgxcgX3Wl6sE/nJ72t00So9/p
   zWlTncey6gdsSIwnb66CMUfo0rzrjdZ+J0o+oNG+NNdcz/zldsaDZ5Kmg
   M+ld3vJUuYJFHShaZycDlymt/XqRb2F105nxB+RK66mxj5WiME47U/qew
   H1KXI1tCVuNx+sPVA1IqbI15X+/cfWQe/JuDyEQ3Fp0xYYjajEX5g5S6K
   8Bj8HUKJA4ufXnwxqqiaM/tHypQpuutk0RLipq1/vmuuA0Imzb3GRiJYI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="358490808"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="358490808"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 17:36:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="745368816"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="745368816"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Jun 2023 17:36:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDDjq-0009Z7-2B;
	Sun, 25 Jun 2023 00:36:22 +0000
Date: Sun, 25 Jun 2023 08:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 49/202]
 fs/xfs/libxfs/xfs_refcount.c:128 xfs_refcount_check_perag_irec() warn:
 impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
Message-ID: <202306250857.3mgCreb8-lkp@intel.com>
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
head:   9f2fc0e8ef147d9fd9c6af47c4ab87427e0d2d19
commit: 6bc9ccc0539af40fb32ea347a2d594c7c9a71946 [49/202] xfs: repair refcount btrees
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-m001-20230625 (https://download.01.org/0day-ci/archive/20230625/202306250857.3mgCreb8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306250857.3mgCreb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306250857.3mgCreb8-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:128 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:138 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

vim +128 fs/xfs/libxfs/xfs_refcount.c

174edb0e46e520 Darrick J. Wong 2016-10-03  122  
6bc9ccc0539af4 Darrick J. Wong 2023-03-06  123  inline xfs_failaddr_t
6bc9ccc0539af4 Darrick J. Wong 2023-03-06  124  xfs_refcount_check_perag_irec(
6bc9ccc0539af4 Darrick J. Wong 2023-03-06  125  	struct xfs_perag		*pag,
2b30cc0bf0589d Darrick J. Wong 2023-04-11  126  	const struct xfs_refcount_irec	*irec)
2b30cc0bf0589d Darrick J. Wong 2023-04-11  127  {
2b30cc0bf0589d Darrick J. Wong 2023-04-11 @128  	if (irec->rc_blockcount == 0 || irec->rc_blockcount > MAXREFCEXTLEN)
2b30cc0bf0589d Darrick J. Wong 2023-04-11  129  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  130  
2b30cc0bf0589d Darrick J. Wong 2023-04-11  131  	if (!xfs_refcount_check_domain(irec))
2b30cc0bf0589d Darrick J. Wong 2023-04-11  132  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  133  
2b30cc0bf0589d Darrick J. Wong 2023-04-11  134  	/* check for valid extent range, including overflow */
2b30cc0bf0589d Darrick J. Wong 2023-04-11  135  	if (!xfs_verify_agbext(pag, irec->rc_startblock, irec->rc_blockcount))
2b30cc0bf0589d Darrick J. Wong 2023-04-11  136  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  137  
2b30cc0bf0589d Darrick J. Wong 2023-04-11 @138  	if (irec->rc_refcount == 0 || irec->rc_refcount > MAXREFCOUNT)
2b30cc0bf0589d Darrick J. Wong 2023-04-11  139  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  140  
2b30cc0bf0589d Darrick J. Wong 2023-04-11  141  	return NULL;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  142  }
2b30cc0bf0589d Darrick J. Wong 2023-04-11  143  

:::::: The code at line 128 was first introduced by commit
:::::: 2b30cc0bf0589d1ea0506c019b9b81de77535c87 xfs: standardize ondisk to incore conversion for refcount btrees

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
