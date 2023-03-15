Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C9F5669
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 17:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678900802; x=1710436802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwf2nylumDjdLtIkqPVv2q+9dYE35IvyMmS8ywqgePM=;
  b=dRZF9CBmVVnHnOYsR2rWi7XJA7vgcL3R8aHEUltmPG8s/TiSdpFTDtBX
   HyCce0c6QwWAp5LszEQ/Jxorou26hMGCF2CySope9Qd1bvT5H/2krbjiv
   iTCNotH4+d2ksGRC9jsfgfyO/WripvFERcvdmWoZ5k1/YN0qSMZvHZ42v
   U3JUtQ03O7hNIk2z86b+qroDalN8Efas7Y2dGAFpIl+AiAI2E7kMiSJFW
   tCRxhuSbyUhqMNxO2YZ7iyC3ZAQwAN6gI0y4rB+LuihmkAqrjFa5ntaPD
   xcR5BPbJeAFNgCqVMy+om2DOf1bJXs/no+IOMReh6vbDuox1Ow6FIBXyT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="424042563"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="424042563"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 10:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="1008902594"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="1008902594"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2023 10:20:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcUn9-0007ul-2i;
	Wed, 15 Mar 2023 17:19:59 +0000
Date: Thu, 16 Mar 2023 01:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 132/274]
 fs/xfs/libxfs/xfs_refcount.c:128 xfs_refcount_check_perag_irec() warn:
 impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
Message-ID: <202303160101.oBXWakMp-lkp@intel.com>
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
head:   67bb67e9a9941400f950d75d77991bf99c54ed05
commit: 4ee3a57e2cc4fbd40ef976e4958840b0cd8af193 [132/274] xfs: repair refcount btrees
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160101.oBXWakMp-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303160101.oBXWakMp-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:128 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:138 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

vim +128 fs/xfs/libxfs/xfs_refcount.c

174edb0e46e520 Darrick J. Wong 2016-10-03  122  
4ee3a57e2cc4fb Darrick J. Wong 2023-03-06  123  inline xfs_failaddr_t
4ee3a57e2cc4fb Darrick J. Wong 2023-03-06  124  xfs_refcount_check_perag_irec(
4ee3a57e2cc4fb Darrick J. Wong 2023-03-06  125  	struct xfs_perag		*pag,
491feafe7bd3d5 Darrick J. Wong 2023-03-06  126  	const struct xfs_refcount_irec	*irec)
491feafe7bd3d5 Darrick J. Wong 2023-03-06  127  {
491feafe7bd3d5 Darrick J. Wong 2023-03-06 @128  	if (irec->rc_blockcount == 0 || irec->rc_blockcount > MAXREFCEXTLEN)
491feafe7bd3d5 Darrick J. Wong 2023-03-06  129  		return __this_address;
491feafe7bd3d5 Darrick J. Wong 2023-03-06  130  
491feafe7bd3d5 Darrick J. Wong 2023-03-06  131  	if (!xfs_refcount_check_domain(irec))
491feafe7bd3d5 Darrick J. Wong 2023-03-06  132  		return __this_address;
491feafe7bd3d5 Darrick J. Wong 2023-03-06  133  
491feafe7bd3d5 Darrick J. Wong 2023-03-06  134  	/* check for valid extent range, including overflow */
491feafe7bd3d5 Darrick J. Wong 2023-03-06  135  	if (!xfs_verify_agbext(pag, irec->rc_startblock, irec->rc_blockcount))
491feafe7bd3d5 Darrick J. Wong 2023-03-06  136  		return __this_address;
491feafe7bd3d5 Darrick J. Wong 2023-03-06  137  
491feafe7bd3d5 Darrick J. Wong 2023-03-06 @138  	if (irec->rc_refcount == 0 || irec->rc_refcount > MAXREFCOUNT)
491feafe7bd3d5 Darrick J. Wong 2023-03-06  139  		return __this_address;
491feafe7bd3d5 Darrick J. Wong 2023-03-06  140  
491feafe7bd3d5 Darrick J. Wong 2023-03-06  141  	return NULL;
491feafe7bd3d5 Darrick J. Wong 2023-03-06  142  }
491feafe7bd3d5 Darrick J. Wong 2023-03-06  143  

:::::: The code at line 128 was first introduced by commit
:::::: 491feafe7bd3d5375f8c9d88ae89d00250b4b61c xfs: standardize ondisk to incore conversion for refcount btrees

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
