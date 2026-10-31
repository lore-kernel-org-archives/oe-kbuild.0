Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793441866;
	b=3hvNHpORl46HpiURb7EIQsIh0NPHJnCbSngAu8UwKYvz2pHBNHxlP9zo9rJ2u76Ntc0T
	 b+KO75wxsrzh0Dd9aGdmq4dMwRXh/acJucZZwFS+qd2K9vumgnrnobACGrmwMKC6w5ItC
	 VBCzRDaIshFDZqYxlGQwzRYJjvPW/PaZrD+DDS7CIG5A3GHlbnEXGQRROeD9MtF2Y3NnK
	 5yVr/LWzszyyNzPV78mGvcB43cr4efVb7Yh6li4nG7s2yjw/O9nMoJw4/cEWOr2IXOsUy
	 bj12d2hVtghzgXqhahQmffm39MRg5CLU61HqCjTwxLZckwSEGygL5PE4X33nRlyY6Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793441866;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4GFymgMhrkgxD16oLjdi8OmTI4ABKmR2mFL3gl2t9pg=;
	b=HmsTTrqdvPZr9MHVOJSO5Er8ec9dDHPEua6Y4kYIZBnYoutoHODSpe5eKQfdjyLZkqAM
	 Li0HAAcgaB3GkZajBAtE48dBVvPZ1GINe7yLPW07GSMPjT4NDMwc8fbE3bS/0ndE5qyS5
	 O5zBWuX7j+FIJB7zWjKZX4MPbdUcP2s4QlsSbqL0Mqx89SRwhj1cAnRfJoLQdR1tQQnXL
	 7nk0Yt265dZ6ZxpJRJCSbhvM7UStzRkOJVDiYccvB+EX92H2QZM5v7Rjj4Hx6hYepz4wS
	 ugnA+m0Bw9yomQSVWGOnE8ufbwCIII5todtnS85MXldsyzaHQ05NjI7rKwEsZG+73lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dFShxlPO;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAFD606A31F
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 10:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FAFD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dFShxlPO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793441865; x=1824977865;
  h=date:from:to:cc:subject:message-id;
  bh=47VA4BMVhW/i9/qqK1CaOM89hztD/kvl5hQauefU7wg=;
  b=dFShxlPOUc+n5L7+OOUxJHT2Jgvv8AnUC4AVCbFAViQ3fctrXakrZ/oi
   mS+3dr/Y8YrQwGzrRtAaKOTpzdYacSKUZE9QEIi3h5/QvB5adxzZw0CRc
   IbQI3LuzplD27Ouan7mLZMGRLHsrD36hl3ioBSKcu+vh7M4Yzyq0tw36F
   1Entp1PsUYMiYMWBQEeZR7f4Qx4jeeoTKgtkdWbqT4hJ3Y+LVJhs3wSK0
   p75ZmC0vhnRrdLd0G+N+1xrzbyQbixv1OJlEMt0QP54gzwMnmEn7KmRHD
   Oa+Eo9bRk2Tq/mxxoFAtU9eTTdkSPCN4JgpI5lrPLny6znvvC7GUuqIEf
   g==;
X-CSE-ConnectionGUID: GuUt8T6DTTSW+yHJzPAE1Q==
X-CSE-MsgGUID: o6emc/PCSf2eIIOc1HJZWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2091177"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2091177"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 03:17:44 -0700
X-CSE-ConnectionGUID: PawoRBbOS1+seTjFAkXW2Q==
X-CSE-MsgGUID: wCzN89rITcWe5azSwbudpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5611465"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 31 Oct 2026 03:17:43 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN69a-000000005xJ-3fVo;
	Sat, 31 Oct 2026 10:17:38 +0000
Date: Sat, 31 Oct 2026 11:17:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/ntfs/named_stream.c:740:1-7: Missing call to dput() at
 line 744.
Message-ID: <202610311112.wVGzWCCO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   36aad21d50d1af3f6954bb0c988257a908202477
commit: 3f11c48d4f94bfa58eaff60588f81a5484c34ca3 ntfs: add pathname access for named streams
date:   11 days ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 days ago
config: loongarch-randconfig-r2103-20261029 (https://download.01.org/0day-ci/archive/20261031/202610311112.wVGzWCCO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3f11c48d4f94 ("ntfs: add pathname access for named streams")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610311112.wVGzWCCO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ntfs/named_stream.c:740:1-7: Missing call to dput() at line 744.
   fs/ntfs/named_stream.c:740:1-7: Missing call to dput() at line 745.

vim +740 fs/ntfs/named_stream.c

3f11c48d4f94bf Namjae Jeon 2026-09-21  732  
3f11c48d4f94bf Namjae Jeon 2026-09-21  733  /* Obtain a dentry for the base inode behind a stream inode. */
3f11c48d4f94bf Namjae Jeon 2026-09-21  734  static struct dentry *ntfs_stream_base_dentry(struct inode *inode)
3f11c48d4f94bf Namjae Jeon 2026-09-21  735  {
3f11c48d4f94bf Namjae Jeon 2026-09-21  736  	struct inode *base_vi =
3f11c48d4f94bf Namjae Jeon 2026-09-21  737  		VFS_I(NTFS_I(inode)->ext.base_ntfs_ino);
3f11c48d4f94bf Namjae Jeon 2026-09-21  738  	struct dentry *dentry;
3f11c48d4f94bf Namjae Jeon 2026-09-21  739  
3f11c48d4f94bf Namjae Jeon 2026-09-21 @740  	dentry = d_find_alias(base_vi);
3f11c48d4f94bf Namjae Jeon 2026-09-21  741  	if (dentry)
3f11c48d4f94bf Namjae Jeon 2026-09-21  742  		return dentry;
3f11c48d4f94bf Namjae Jeon 2026-09-21  743  	if (!igrab(base_vi))
3f11c48d4f94bf Namjae Jeon 2026-09-21 @744  		return ERR_PTR(-ESTALE);
3f11c48d4f94bf Namjae Jeon 2026-09-21  745  	return d_obtain_alias(base_vi);
3f11c48d4f94bf Namjae Jeon 2026-09-21  746  }
3f11c48d4f94bf Namjae Jeon 2026-09-21  747  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
