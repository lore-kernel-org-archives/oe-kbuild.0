Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954944;
	b=zted+G7hgkP/cfKZbszJOaWYZirgm3TNRa2taYN9P7XpdUf3bmfksWFyR35iY9H3frj0
	 g3aYeknOTkEP4MHheuu28yFMFFuJQ880wgIl0gYBO3nLgQVp2TX8xn4tL8zmN+vYA319f
	 d1lp2nda5yUQWmKTQKbepYFjYZRL06WNnPSvkm7eFclYev2XXDDBaHvfUeKP0PdOAVzv+
	 GTy1jSZyi1kWpkRleBb+5NhhEgjEqBmrQjNQBMDIkIhAS2xTKBpRr4wyjxv4BTevjgJBp
	 579r9X61+JQrAbiy2W72B6AZZMckJRQu/wIWFxHkDFBlIHR/LE61ee0Fu8+mwxfXhDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954944;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Udl8byhMqDW296JlvI97ZpA1DFzeHOQ1wQAPkAxQkes=;
	b=hq1Jj5Rl/Tugrun8phKu54vBds3FbqCoD8qPlNLWw7gjnAfPC2DLEAopUR1wrhom7JJf
	 Q+QsAjISaQ8UxtbQhQPRhEczpquLHyEi6507cO8IQd3IavalfGp10gUTzNfvuqwsSWw66
	 KUrqiaX5OjgejmuYTu/DUad7iz/uJOTSeQoAli/qUqRK7LmcV1IIT4xu43xyh3oGYTgL+
	 ZYes/ceWbCoopA86e5nFISROAQq3x9Do74tjCyU+l9sPvg5N0A8oTE954IbnTlotz00Av
	 MwcExj0ZvxTO4vMoT1uAdE3/SJ1Gku2Q6WA3lvwk+oaUkArpKZY9mzr3Mkdj+ka/sKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GObOAU9k;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F16606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 22:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GObOAU9k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794954943; x=1826490943;
  h=date:from:to:cc:subject:message-id;
  bh=oWTQBR6kzG3MSEglA1sWbvAsyNw9f8LNuxJ8/3GAyMM=;
  b=GObOAU9klaO9p67VdIJofjOClfSZQQs7kjCBFBjUj7YV/fHtOkg031nR
   zSo5yVoWXeO3NAhRLt87CgbOwLCl4gCGjkJJ1E2SNoBavuUDptwKx/BzT
   QXhA234IziYiPYoCuQArYYFaXoAKPKGCzXhC1Mi0QtsKgESGDG9u8mxfz
   TQ93JVXNIBa0p/ISPrlQSTgZ1ZsyvmdE0FHIaoN7Jc73NfbXp3Us6dfv5
   c8p8Tcu+HVKDnTB5+c4XgoCSWhM4wMXdvabrxNZDBy3QlfIEVmHIdZLXo
   4M74lnYqzo4Pm8roB1Top46iy8EB941EJSXTGHneInklAAFpzk8v+yO3w
   g==;
X-CSE-ConnectionGUID: Qq5N2148TMqmHTUU+OuIHw==
X-CSE-MsgGUID: sahveytXQNGVj6d9MK27cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3762584"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3762584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:35:42 -0800
X-CSE-ConnectionGUID: pLxovqGmQxmkKxPU6Dbrpg==
X-CSE-MsgGUID: Si/nzSrYSbadZGw/u5ybiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9884013"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 14:35:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTRm6-000000003DE-2rlk;
	Tue, 17 Nov 2026 22:35:38 +0000
Date: Tue, 17 Nov 2026 23:35:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 12/12]
 fs/jfs/jfs_dtree.c:3090 dtReadFirst() warn: impossible condition '(stbl[0] >
 127) => (0-127 > 127)'
Message-ID: <20261117232509.bhPlvaiF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5228562af4fa87e987989e0a55f5c01d71f2aae1
commit: 22dcbf7661c6ffc3247978c254dc40b833a0d429 [12/12] jfs: array-index-out-of-bounds fix in dtReadFirst
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 11 months ago
config: arm-randconfig-2200-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117232509.bhPlvaiF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c7014922f5829426952a38d079220c21b0a8ebe8)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261117232509.bhPlvaiF-lkp@intel.com/

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
22dcbf7661c6ff Ghanshyam Agrawal 2024-09-28  3089  
22dcbf7661c6ff Ghanshyam Agrawal 2024-09-28 @3090  		if (stbl[0] < 0 || stbl[0] > 127) {
22dcbf7661c6ff Ghanshyam Agrawal 2024-09-28  3091  			DT_PUTPAGE(mp);
22dcbf7661c6ff Ghanshyam Agrawal 2024-09-28  3092  			jfs_error(ip->i_sb, "stbl[0] out of bound\n");
22dcbf7661c6ff Ghanshyam Agrawal 2024-09-28  3093  			return -EIO;
22dcbf7661c6ff Ghanshyam Agrawal 2024-09-28  3094  		}
22dcbf7661c6ff Ghanshyam Agrawal 2024-09-28  3095  
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
