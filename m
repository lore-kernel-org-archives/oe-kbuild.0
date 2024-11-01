Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609732CAB
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730475950; cv=none; b=rsCVDMs1bsoW8z+cdIcsrds6uAU1JO8VAk0m+1unpYVEcqaU3pKZvkwtRbjD2cG62GHQ2K0wrX++dvNymByIhuOhWPHiEnh60IqhmBUQafp3qCyJ5nCYBYhGbc3f7ZsWaM2TOEng6rRqClkVjfFz8hFhzOr8yK5qiF0BV+xdoTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730475950; c=relaxed/simple;
	bh=HtOuP/w1khpjwC819kYxTok8AHx7tT50uEInj0rbG+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQ35C6S/FXPsx7M9esDnL5yqLLphXhIClY3gQX4hc7sDssff2pT1MCbUO5ZeqUJyWQYFNhpqZrHt2pIGT+h4S4RPCC1NMXZV3rz4+ujvZzv5SVzoiANdUwnsgZrn1tx3vDb4rB/vk6Vf4ifU21253xAN2YpqBxngLPTNn8Kcxc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnPJTmFz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnPJTmFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730475947; x=1762011947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HtOuP/w1khpjwC819kYxTok8AHx7tT50uEInj0rbG+Q=;
  b=OnPJTmFzCCK9K9ZrCAtBuCcyljLqYXo5ohCtxcb6jb9KtBeMaohKcNRJ
   An+ySyvZp3/SMeHfsg1pY37YNd+uDqVoDeEGFMA2iEjR3ZtXjzoGf8Ztj
   WPAVIKJlY4pSAaVT2qvTwTqJVmblXjGVAnu4xxqVG0mnBKHBnY1RCCxGB
   bQAPuyFmP5ReM38+IoGBhnDLaOnl5oQw3XxrI+R7L3dXfnn7qGtPn+dBG
   2nn78e7JsrPuM0ZeTvu4zU1Qmee/JgkSL0Y69HbexGOTF+NlQuT4xneAx
   2gzsH+w4z8tbufNOgaVM1Xf+NEBFf3D0ac6UywK2LDCV9hjHjKRwoUgic
   Q==;
X-CSE-ConnectionGUID: kTBmVINnRvC5bNz5ti/siw==
X-CSE-MsgGUID: U2S0Zc8HSCC4kIEC0q/fKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="17874855"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="17874855"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 08:45:46 -0700
X-CSE-ConnectionGUID: CVfcUWFcQNu6oAeVBN8Mjw==
X-CSE-MsgGUID: Bn8lXpyiQN2XM9AiSISvLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="83139356"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Nov 2024 08:45:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6tqJ-000hij-0Q;
	Fri, 01 Nov 2024 15:45:43 +0000
Date: Fri, 1 Nov 2024 23:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7514/8858] fs/jfs/jfs_dtree.c:3090 dtReadFirst()
 warn: impossible condition '(stbl[0] > 127) => (0-127 > 127)'
Message-ID: <202411012327.YK94Bkiq-lkp@intel.com>
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
TO: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
CC: Dave Kleikamp <dave.kleikamp@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: ca84a2c9be482836b86d780244f0357e5a778c46 [7514/8858] jfs: array-index-out-of-bounds fix in dtReadFirst
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r073-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012327.YK94Bkiq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411012327.YK94Bkiq-lkp@intel.com/

smatch warnings:
fs/jfs/jfs_dtree.c:3090 dtReadFirst() warn: impossible condition '(stbl[0] > 127) => (0-127 > 127)'

vim +3090 fs/jfs/jfs_dtree.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3032  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3033  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3034  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3035   *	dtReadFirst()
^1da177e4c3f41 Linus Torvalds    2005-04-16  3036   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  3037   * function: get the leftmost page of the directory
^1da177e4c3f41 Linus Torvalds    2005-04-16  3038   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3039  static int dtReadFirst(struct inode *ip, struct btstack * btstack)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3040  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3041  	int rc = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3042  	s64 bn;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3043  	int psize = 288;	/* initial in-line directory */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3044  	struct metapage *mp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3045  	dtpage_t *p;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3046  	s8 *stbl;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3047  	struct btframe *btsp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3048  	pxd_t *xd;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3049  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3050  	BT_CLR(btstack);	/* reset stack */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3051  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3052  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3053  	 *	descend leftmost path of the tree
^1da177e4c3f41 Linus Torvalds    2005-04-16  3054  	 *
^1da177e4c3f41 Linus Torvalds    2005-04-16  3055  	 * by convention, root bn = 0.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3056  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3057  	for (bn = 0;;) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3058  		DT_GETPAGE(ip, bn, mp, psize, p, rc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3059  		if (rc)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3060  			return rc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3061  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3062  		/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3063  		 * leftmost leaf page
^1da177e4c3f41 Linus Torvalds    2005-04-16  3064  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3065  		if (p->header.flag & BT_LEAF) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3066  			/* return leftmost entry */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3067  			btsp = btstack->top;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3068  			btsp->bn = bn;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3069  			btsp->index = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3070  			btsp->mp = mp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3071  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3072  			return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3073  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3074  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3075  		/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3076  		 * descend down to leftmost child page
^1da177e4c3f41 Linus Torvalds    2005-04-16  3077  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3078  		if (BT_STACK_FULL(btstack)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3079  			DT_PUTPAGE(mp);
eb8630d7d2fd13 Joe Perches       2013-06-04  3080  			jfs_error(ip->i_sb, "btstack overrun\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3081  			BT_STACK_DUMP(btstack);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3082  			return -EIO;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3083  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3084  		/* push (bn, index) of the parent page/entry */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3085  		BT_PUSH(btstack, bn, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3086  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3087  		/* get the leftmost entry */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3088  		stbl = DT_GETSTBL(p);
ca84a2c9be4828 Ghanshyam Agrawal 2024-09-28  3089  
ca84a2c9be4828 Ghanshyam Agrawal 2024-09-28 @3090  		if (stbl[0] < 0 || stbl[0] > 127) {
ca84a2c9be4828 Ghanshyam Agrawal 2024-09-28  3091  			DT_PUTPAGE(mp);
ca84a2c9be4828 Ghanshyam Agrawal 2024-09-28  3092  			jfs_error(ip->i_sb, "stbl[0] out of bound\n");
ca84a2c9be4828 Ghanshyam Agrawal 2024-09-28  3093  			return -EIO;
ca84a2c9be4828 Ghanshyam Agrawal 2024-09-28  3094  		}
ca84a2c9be4828 Ghanshyam Agrawal 2024-09-28  3095  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3096  		xd = (pxd_t *) & p->slot[stbl[0]];
^1da177e4c3f41 Linus Torvalds    2005-04-16  3097  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3098  		/* get the child page block address */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3099  		bn = addressPXD(xd);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3100  		psize = lengthPXD(xd) << JFS_SBI(ip->i_sb)->l2bsize;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3101  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3102  		/* unpin the parent page */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3103  		DT_PUTPAGE(mp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3104  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3105  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
