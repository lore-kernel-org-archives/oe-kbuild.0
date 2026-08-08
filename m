Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156C82F0661
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786178211; cv=none; b=reQsXm5L5rwGYxCvV7XqUmEhjiVePpiD5vWAAa3q0/eN6YatRtkxSSKFmN9owO+wt7USLZ+pMeZVYEYqgHshhlJHfpBu368NKNJBv1Zljh8Iu2gCPDQBIwIKuSqM9H0OD72ZOYe7AR5D69uXUhqDX3zjPmIubs03Q5crZ+bSt7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786178211; c=relaxed/simple;
	bh=B3ww1AEQQZtc8XclTFv2qaCGrie7FmuInp20kRD3RBQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a0Be8tKXIoiHMDWwvUf4LMGBq7Hs8P2l+vYauyZHfiFDT2ddyleo9YEYi/YsuOl6DuIHAow8FQm4MCUNW5mE3zJqGyerxE+WWYvBgobTvpP81GA7/bXiHylePVkEf5kKhd5vbAVDXq79nGy97WWPPOkk1D/5yEAeN7+p+mUzNTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BG81Dr7m; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BG81Dr7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786178208; x=1817714208;
  h=date:from:to:cc:subject:message-id;
  bh=B3ww1AEQQZtc8XclTFv2qaCGrie7FmuInp20kRD3RBQ=;
  b=BG81Dr7mq6tCZgi524IvtYA5HiL6Z/4Nt2jlqphYyiIF3eUgGgJ9rIPf
   HMFptzZBmJNNdoJ1SFy40UH5wcoeIJwHHJWMUkycolUesWJ6qhPRusxtJ
   NMM430HLNnEFVBZMIR5o1eYzzza+FD29wfkKvignstp9sG4csTmEoliuz
   roQftB2EJnsR5UcAEDSIcAFtcxTxXzInh6lv0fBYNIuDCv5mtiARNsSoZ
   iNJ2smg4vZqLX7z+Dc6606d/0eMOkZjuW6MaGU+t9Oz28wBnooWVKgHjR
   CHF9GB868n7SbzO67jQzJP30/98jTKDL8tJVItJxVBcXYWZLHwC0xots9
   g==;
X-CSE-ConnectionGUID: l7frvFq7QDK+YNuPyLeLNg==
X-CSE-MsgGUID: AVkSdoN5TimL32+P0tXL0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="98288395"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="98288395"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 01:36:48 -0700
X-CSE-ConnectionGUID: mDA6OSl8TOqrICb1v/X/EQ==
X-CSE-MsgGUID: NOw2U+NERWqRD9okgFBk4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="300813401"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Aug 2026 01:36:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wscXs-00000000K0j-1PQa;
	Sat, 08 Aug 2026 08:36:44 +0000
Date: Sat, 08 Aug 2026 16:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-kminext 4/4]
 fs/jfs/jfs_dtree.c:3090 dtReadFirst() warn: impossible condition '(stbl[0] >
 127) => (0-127 > 127)'
Message-ID: <202608081637.KNSd6oSL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   3709fda36866cd4468d65d7e3988ea70bf52fbde
commit: 22dcbf7661c6ffc3247978c254dc40b833a0d429 [4/4] jfs: array-index-out-of-bounds fix in dtReadFirst
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 8 months ago
config: x86_64-randconfig-161-20260808 (https://download.01.org/0day-ci/archive/20260808/202608081637.KNSd6oSL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608081637.KNSd6oSL-lkp@intel.com/

smatch warnings:
fs/jfs/jfs_dtree.c:3090 dtReadFirst() warn: impossible condition '(stbl[0] > 127) => (0-127 > 127)'

vim +3090 fs/jfs/jfs_dtree.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  3032  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3033  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3034  /*
^1da177e4c3f415 Linus Torvalds    2005-04-16  3035   *	dtReadFirst()
^1da177e4c3f415 Linus Torvalds    2005-04-16  3036   *
^1da177e4c3f415 Linus Torvalds    2005-04-16  3037   * function: get the leftmost page of the directory
^1da177e4c3f415 Linus Torvalds    2005-04-16  3038   */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3039  static int dtReadFirst(struct inode *ip, struct btstack * btstack)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3040  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3041  	int rc = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3042  	s64 bn;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3043  	int psize = 288;	/* initial in-line directory */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3044  	struct metapage *mp;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3045  	dtpage_t *p;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3046  	s8 *stbl;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3047  	struct btframe *btsp;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3048  	pxd_t *xd;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3049  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3050  	BT_CLR(btstack);	/* reset stack */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3051  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3052  	/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  3053  	 *	descend leftmost path of the tree
^1da177e4c3f415 Linus Torvalds    2005-04-16  3054  	 *
^1da177e4c3f415 Linus Torvalds    2005-04-16  3055  	 * by convention, root bn = 0.
^1da177e4c3f415 Linus Torvalds    2005-04-16  3056  	 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3057  	for (bn = 0;;) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3058  		DT_GETPAGE(ip, bn, mp, psize, p, rc);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3059  		if (rc)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3060  			return rc;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3061  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3062  		/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  3063  		 * leftmost leaf page
^1da177e4c3f415 Linus Torvalds    2005-04-16  3064  		 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3065  		if (p->header.flag & BT_LEAF) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3066  			/* return leftmost entry */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3067  			btsp = btstack->top;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3068  			btsp->bn = bn;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3069  			btsp->index = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3070  			btsp->mp = mp;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3071  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3072  			return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3073  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3074  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3075  		/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  3076  		 * descend down to leftmost child page
^1da177e4c3f415 Linus Torvalds    2005-04-16  3077  		 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3078  		if (BT_STACK_FULL(btstack)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3079  			DT_PUTPAGE(mp);
eb8630d7d2fd135 Joe Perches       2013-06-04  3080  			jfs_error(ip->i_sb, "btstack overrun\n");
^1da177e4c3f415 Linus Torvalds    2005-04-16  3081  			BT_STACK_DUMP(btstack);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3082  			return -EIO;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3083  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3084  		/* push (bn, index) of the parent page/entry */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3085  		BT_PUSH(btstack, bn, 0);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3086  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3087  		/* get the leftmost entry */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3088  		stbl = DT_GETSTBL(p);
22dcbf7661c6ffc Ghanshyam Agrawal 2024-09-28  3089  
22dcbf7661c6ffc Ghanshyam Agrawal 2024-09-28 @3090  		if (stbl[0] < 0 || stbl[0] > 127) {
22dcbf7661c6ffc Ghanshyam Agrawal 2024-09-28  3091  			DT_PUTPAGE(mp);
22dcbf7661c6ffc Ghanshyam Agrawal 2024-09-28  3092  			jfs_error(ip->i_sb, "stbl[0] out of bound\n");
22dcbf7661c6ffc Ghanshyam Agrawal 2024-09-28  3093  			return -EIO;
22dcbf7661c6ffc Ghanshyam Agrawal 2024-09-28  3094  		}
22dcbf7661c6ffc Ghanshyam Agrawal 2024-09-28  3095  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3096  		xd = (pxd_t *) & p->slot[stbl[0]];
^1da177e4c3f415 Linus Torvalds    2005-04-16  3097  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3098  		/* get the child page block address */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3099  		bn = addressPXD(xd);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3100  		psize = lengthPXD(xd) << JFS_SBI(ip->i_sb)->l2bsize;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3101  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3102  		/* unpin the parent page */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3103  		DT_PUTPAGE(mp);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3104  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3105  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  3106  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
