Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D6679DD
	for <oe-kbuild@lists.linux.dev>; Mon, 22 May 2023 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684747171; x=1716283171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3bzX/WxqIw/OO6wd34u1k0W4MD4YSkFX3JnreJ0lJiY=;
  b=OogoaWP7D0WA9fsywkopVcSrnvnR85wcedtEglXZRBcL1TOkdMmAEkp+
   UjtidLXEd8hQSlVnslMwy3jFHITkbJDvVn7xFdj28Y9nQ6JJnnnQ3/8iF
   CzfSf3sF2Ul2GxIoNgsHLv3h2Q//dxdGEJ36eEPTWIOtU/HfE7LtJZnPc
   T7VWFFpOBJ+1A4pMLCVeiu8CtFUAfBgVTqZq79nK24V4LI2sbGqw0LGsD
   Gzfb8DrjkkP7WorVcAzNLW6p6wwTqe3OuCayMi1MoZq9fIo6Kyi6mgovv
   dlnTd/1Yxld07w14NxQYZESgXP923/MdpBWQMOGxSoUzHVu14dwlz3ZaD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="381095407"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="381095407"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 02:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="949994297"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="949994297"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 May 2023 02:19:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q11hQ-000Ckd-2B;
	Mon, 22 May 2023 09:19:28 +0000
Date: Mon, 22 May 2023 17:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 425/479]
 fs/xfs/libxfs/xfs_refcount.c:161 xfs_refcount_check_rtgroup_irec() warn:
 impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
Message-ID: <202305221739.sAWNgB1g-lkp@intel.com>
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
head:   7812f8addb0ecb005dc98b04df5a584b2631e7ee
commit: ba08099b3cc6b95790bc10345b97c7db5d7aeec0 [425/479] xfs: prepare refcount functions to deal with rtrefcountbt
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: loongarch-randconfig-m041-20230521 (https://download.01.org/0day-ci/archive/20230522/202305221739.sAWNgB1g-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305221739.sAWNgB1g-lkp@intel.com/

New smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:161 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:171 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

Old smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:140 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:150 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

vim +161 fs/xfs/libxfs/xfs_refcount.c

2b30cc0bf0589d Darrick J. Wong 2023-04-11  155  
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  156  static inline xfs_failaddr_t
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  157  xfs_refcount_check_rtgroup_irec(
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  158  	struct xfs_rtgroup		*rtg,
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  159  	const struct xfs_refcount_irec	*irec)
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  160  {
ba08099b3cc6b9 Darrick J. Wong 2023-03-06 @161  	if (irec->rc_blockcount == 0 || irec->rc_blockcount > XFS_REFC_LEN_MAX)
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  162  		return __this_address;
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  163  
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  164  	if (!xfs_refcount_check_domain(irec))
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  165  		return __this_address;
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  166  
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  167  	/* check for valid extent range, including overflow */
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  168  	if (!xfs_verify_rgbext(rtg, irec->rc_startblock, irec->rc_blockcount))
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  169  		return __this_address;
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  170  
ba08099b3cc6b9 Darrick J. Wong 2023-03-06 @171  	if (irec->rc_refcount == 0 || irec->rc_refcount > XFS_REFC_REFCOUNT_MAX)
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  172  		return __this_address;
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  173  
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  174  	return NULL;
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  175  }
ba08099b3cc6b9 Darrick J. Wong 2023-03-06  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
