Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D0E1DFF0
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 23:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727566446; cv=none; b=eEBZVzWJ1uq0JxFQSp1eGDAaTt4eV84TgI0qLKYxDsj4G3s12PkUuN0XqLJ4vyMMZcCri+I/5JFETHHn0k8sygPITf26vJ/aYJMGZGU0BfoC2wsp3bftJe4JZdqnxFoXjC3nv2jagKi3WehuGVwqszeqkLZbc1vmtSE5gTOzPnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727566446; c=relaxed/simple;
	bh=TA/hGVUSU8GzPAplAowljvZn9tf2ltSuoq+IBxk7XDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uB5whvEUntxpMGUHdPfG6akzJbzXWP/WF1LzVdS+6M1SO4iAmcBlAOT2Q69HdczdhQe9NZ1cAaywGwpk9Efgd+cY+boHzr9s5WiQgm8GA7NY4y1WSomT3l3509tQOWTqhzTLmhbnOwZUYuFyDmiAbvis+TN77o8/cw0a9u4dKTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbKKVLDL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbKKVLDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727566444; x=1759102444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TA/hGVUSU8GzPAplAowljvZn9tf2ltSuoq+IBxk7XDg=;
  b=nbKKVLDL2oS5NvoUDvZOSQzcj4MEbKRLQbGShatYCEGpx7McPgNm4+EC
   DezXpHGW7H4tRxJ7rEUIdpHlZBcTtFXjoUp8v+9S458U1qmJOnOa8xVFn
   uXhu6F9wnI68q8n0ERIxhnmAGUgKPubzd/2wxH9wMMDhfPvoTs9xiUB2m
   5SPlRDW7x1dj/kYSUBZr0OFhy7Ueq+lTD7EPLIE3Mzn5jIpY2ZLcqIytV
   Ti+KbH4DPTn89uwNHsCKxHPah22DhxsZyi1CHVcjm0KcLuwYsza3sfXDz
   JHUAXP7tPfhLo5T/FYP7dLNV9Dvs1TVMKIwXxjKotdAoCuLlTIo4BKuDi
   A==;
X-CSE-ConnectionGUID: abplPk7RTaaTlhpupkI2zw==
X-CSE-MsgGUID: +y6aRtDgRtyob4PEbDhSpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="49202597"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="49202597"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 16:34:04 -0700
X-CSE-ConnectionGUID: tLpOnqhcSZiCiZiCtmA7Cg==
X-CSE-MsgGUID: rZsqyl2qSq+morLGa12HwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72574745"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2024 16:34:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sugwq-000Nkd-1b;
	Sat, 28 Sep 2024 23:34:00 +0000
Date: Sun, 29 Sep 2024 07:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] jfs: array-index-out-of-bounds fix in dtReadFirst
Message-ID: <202409290701.sX8sh83G-lkp@intel.com>
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
In-Reply-To: <20240928083722.2317029-1-ghanshyam1898@gmail.com>
References: <20240928083722.2317029-1-ghanshyam1898@gmail.com>
TO: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
TO: shaggy@kernel.org
TO: eadavis@qq.com
TO: ghandatmanas@gmail.com
TO: osmtendev@gmail.com
TO: ghanshyam1898@gmail.com
CC: jfs-discussion@lists.sourceforge.net
CC: linux-kernel@vger.kernel.org
CC: syzkaller@googlegroups.com
CC: syzbot+65fa06e29859e41a83f3@syzkaller.appspotmail.com

Hi Ghanshyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kleikamp-shaggy/jfs-next]
[also build test WARNING on linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ghanshyam-Agrawal/jfs-array-index-out-of-bounds-fix-in-dtReadFirst/20240928-163931
base:   https://github.com/kleikamp/linux-shaggy jfs-next
patch link:    https://lore.kernel.org/r/20240928083722.2317029-1-ghanshyam1898%40gmail.com
patch subject: [PATCH] jfs: array-index-out-of-bounds fix in dtReadFirst
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20240929 (https://download.01.org/0day-ci/archive/20240929/202409290701.sX8sh83G-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409290701.sX8sh83G-lkp@intel.com/

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
5a203edc9dd969 Ghanshyam Agrawal 2024-09-28  3089  
5a203edc9dd969 Ghanshyam Agrawal 2024-09-28 @3090  		if (stbl[0] < 0 || stbl[0] > 127) {
5a203edc9dd969 Ghanshyam Agrawal 2024-09-28  3091  			DT_PUTPAGE(mp);
5a203edc9dd969 Ghanshyam Agrawal 2024-09-28  3092  			jfs_error(ip->i_sb, "stbl[0] out of bound\n");
5a203edc9dd969 Ghanshyam Agrawal 2024-09-28  3093  			return -EIO;
5a203edc9dd969 Ghanshyam Agrawal 2024-09-28  3094  		}
5a203edc9dd969 Ghanshyam Agrawal 2024-09-28  3095  
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
