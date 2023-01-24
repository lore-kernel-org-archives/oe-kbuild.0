Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289CEA31
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jan 2023 03:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674529419; x=1706065419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+dDDewbobpYnPQWpZFs9h8Qq/aHuGwwM/0iHoDhO5k8=;
  b=dBVXSJS/AjLDYMFNJpkdlXOmK6QQ1T57R52XbMlaae76q5nhOFY5qCfb
   /5cc3Bj0SAQJY2AAyUQ/HQvqbJ02UUs9eHfWYqWvBAMH8ryZl+7ZEouZC
   fhYo9v58HRZ2NzmHUrh+vw7xhHM2nE/h1dnpAtElaFWIws4oJcFqdH4f4
   OYqSsCZZsEkSfOxjOTUkJFibFL/7eizfsuXFog8CQn6cASvcg5cBCdFox
   hssEs+FhJkLV+mN7DN+1K7skWu5wuBroSHqcgIU61VMH4t86IvrFFwCRB
   JBJSlFgGzjIQD8sjAAVox5L0PZxrdASRZuxJU5q6axLAHAQuvz9dsdl2V
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328307108"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="328307108"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 19:03:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725314154"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="725314154"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2023 19:03:34 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK9aw-00064a-03;
	Tue, 24 Jan 2023 03:03:34 +0000
Date: Tue, 24 Jan 2023 11:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 441/494]
 fs/xfs/libxfs/xfs_refcount.c:161 xfs_refcount_check_rtgroup_irec() warn:
 impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
Message-ID: <202301241051.pK9DvwWG-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   abc4c69aeae29731384cf593368229fca036112b
commit: 32805795c8d20a6c8c557ea944cdef5bd82f429e [441/494] xfs: prepare refcount functions to deal with rtrefcountbt
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241051.pK9DvwWG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:161 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:171 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

Old smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:140 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:150 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

vim +161 fs/xfs/libxfs/xfs_refcount.c

129cfe961da7bd Darrick J. Wong 2022-10-31  155  
32805795c8d20a Darrick J. Wong 2022-07-14  156  static inline xfs_failaddr_t
32805795c8d20a Darrick J. Wong 2022-07-14  157  xfs_refcount_check_rtgroup_irec(
32805795c8d20a Darrick J. Wong 2022-07-14  158  	struct xfs_rtgroup		*rtg,
32805795c8d20a Darrick J. Wong 2022-07-14  159  	const struct xfs_refcount_irec	*irec)
32805795c8d20a Darrick J. Wong 2022-07-14  160  {
32805795c8d20a Darrick J. Wong 2022-07-14 @161  	if (irec->rc_blockcount == 0 || irec->rc_blockcount > XFS_REFC_LEN_MAX)
32805795c8d20a Darrick J. Wong 2022-07-14  162  		return __this_address;
32805795c8d20a Darrick J. Wong 2022-07-14  163  
32805795c8d20a Darrick J. Wong 2022-07-14  164  	if (!xfs_refcount_check_domain(irec))
32805795c8d20a Darrick J. Wong 2022-07-14  165  		return __this_address;
32805795c8d20a Darrick J. Wong 2022-07-14  166  
32805795c8d20a Darrick J. Wong 2022-07-14  167  	/* check for valid extent range, including overflow */
32805795c8d20a Darrick J. Wong 2022-07-14  168  	if (!xfs_verify_rgbext(rtg, irec->rc_startblock, irec->rc_blockcount))
32805795c8d20a Darrick J. Wong 2022-07-14  169  		return __this_address;
32805795c8d20a Darrick J. Wong 2022-07-14  170  
32805795c8d20a Darrick J. Wong 2022-07-14 @171  	if (irec->rc_refcount == 0 || irec->rc_refcount > XFS_REFC_REFCOUNT_MAX)
32805795c8d20a Darrick J. Wong 2022-07-14  172  		return __this_address;
32805795c8d20a Darrick J. Wong 2022-07-14  173  
32805795c8d20a Darrick J. Wong 2022-07-14  174  	return NULL;
32805795c8d20a Darrick J. Wong 2022-07-14  175  }
32805795c8d20a Darrick J. Wong 2022-07-14  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
