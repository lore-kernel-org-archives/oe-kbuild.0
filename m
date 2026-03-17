Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E532C234A
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 19:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774274; cv=none; b=d5D6tnh9WTf9kG1+0y10j0UnGjRNPE6M7/YwVubTYpsB5S+xRyg5B8gTWeO2M1JxggV4u2PZ3XGi4BbVE5hHcO7KBqyPI+IOTIrifUSRrzoZJmHtFwLWluqaIrGsQSTUZAWOZTJVxdqUVjyb7kXowW3d+2CMNB8zuMPY3v6cyIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774274; c=relaxed/simple;
	bh=3yig9Xcq5G2lRtJ50ioyvJvlnCLeUdvIL1btrLZ7CoY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dhywl5w5Ip05XFtR8l40DgN3eaM0tGFpLHPuJ9qz96ftTPcRBJthil2Bpf7OuhNsDgskOlO3f0/fSxpCfiV5yoJDmNLuuvMItGUgcGL/G9UenXALVULFKUKAyoUbxocjyQxxHt3BgBMzSeaHkvXaNzFTrrguhB750GG1qXxtBLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngBFFk0B; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngBFFk0B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773774272; x=1805310272;
  h=date:from:to:cc:subject:message-id;
  bh=3yig9Xcq5G2lRtJ50ioyvJvlnCLeUdvIL1btrLZ7CoY=;
  b=ngBFFk0BVHGjMwiDYHz9Xc9qJsBN5alXuH7pxcqE4tFok5JoxdHyBi6W
   X/pUbKOZGUejk9auLL9i7m1ZR94GrJJwaIlCfjWZq+yCdN4SRNoM+nIOQ
   /CJWU4chmDTyuJs3Yj4SE+mq+O7Y8OKTAlnT0LHqixaT6n/x20GHclnJP
   MnUniZ59FVN4g2TGNrAH25kQY86m5k8PcVH09phwTn971m1Y3IugEqBfq
   +sDu1z1ug7JBTS6MDuXjm7TMn+2W1NgVcw9dRpUpb+1LidYt7FBo1nltI
   GlVtWfTMkO/BuZ0CgeNsUbJoDATAYR5/ifRX2CzESJ8n0GWTiKZ8hVKMs
   w==;
X-CSE-ConnectionGUID: Gkh7j7AZTxaTQE7YbHzujw==
X-CSE-MsgGUID: Ea/lLLOsRxOtXjjZepEhwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92388598"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92388598"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 12:04:32 -0700
X-CSE-ConnectionGUID: V1aTXVxeS9+yKIj+XETIHA==
X-CSE-MsgGUID: bmnqZ984Qm6l9wIt5CZX2w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2026 12:04:30 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ZiO-000000001qZ-0dKU;
	Tue, 17 Mar 2026 19:04:28 +0000
Date: Wed, 18 Mar 2026 03:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jlayton:exportd-netlink 3/18] net/sunrpc/cache.c:1074
 cache_release() error: dereferencing freed memory 'rq' (line 1070)
Message-ID: <202603180258.r8Bt94T2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chuck Lever <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   4599c5d95d86c6bc932897f19b1f5a573e7c4637
commit: e344b49528c8ef457ee714bb65e2da4c121132c2 [3/18] Merge branch 'mrchuck/nfsd-testing'
:::::: branch date: 29 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180258.r8Bt94T2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603180258.r8Bt94T2-lkp@intel.com/

smatch warnings:
net/sunrpc/cache.c:1074 cache_release() error: dereferencing freed memory 'rq' (line 1070)

vim +/rq +1074 net/sunrpc/cache.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  1039  
173912a6add00f Trond Myklebust  2009-08-09  1040  static int cache_release(struct inode *inode, struct file *filp,
173912a6add00f Trond Myklebust  2009-08-09  1041  			 struct cache_detail *cd)
^1da177e4c3f41 Linus Torvalds   2005-04-16  1042  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  1043  	struct cache_reader *rp = filp->private_data;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1044  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1045  	if (rp) {
17ad31b3a43b72 Jeff Layton      2026-02-23  1046  		struct cache_request *rq = NULL;
17ad31b3a43b72 Jeff Layton      2026-02-23  1047  
b00567a1495f66 Jeff Layton      2026-02-23  1048  		spin_lock(&cd->queue_lock);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1049  		if (rp->offset) {
812936f74067e6 Jeff Layton      2026-02-23  1050  			struct cache_request *cr;
812936f74067e6 Jeff Layton      2026-02-23  1051  
812936f74067e6 Jeff Layton      2026-02-23  1052  			cr = cache_next_request(cd, rp->next_seqno);
812936f74067e6 Jeff Layton      2026-02-23  1053  			if (cr) {
17ad31b3a43b72 Jeff Layton      2026-02-23  1054  				cr->readers--;
17ad31b3a43b72 Jeff Layton      2026-02-23  1055  				if (cr->readers == 0 &&
17ad31b3a43b72 Jeff Layton      2026-02-23  1056  				    !test_bit(CACHE_PENDING,
17ad31b3a43b72 Jeff Layton      2026-02-23  1057  					      &cr->item->flags)) {
812936f74067e6 Jeff Layton      2026-02-23  1058  					list_del(&cr->list);
17ad31b3a43b72 Jeff Layton      2026-02-23  1059  					rq = cr;
17ad31b3a43b72 Jeff Layton      2026-02-23  1060  				}
^1da177e4c3f41 Linus Torvalds   2005-04-16  1061  			}
^1da177e4c3f41 Linus Torvalds   2005-04-16  1062  			rp->offset = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1063  		}
812936f74067e6 Jeff Layton      2026-02-23  1064  		list_del(&rp->list);
b00567a1495f66 Jeff Layton      2026-02-23  1065  		spin_unlock(&cd->queue_lock);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1066  
0b88d5fcde160d Jeff Layton      2026-02-23  1067  		if (rq) {
0b88d5fcde160d Jeff Layton      2026-02-23  1068  			cache_put(rq->item, cd);
0b88d5fcde160d Jeff Layton      2026-02-23  1069  			kfree(rq->buf);
0b88d5fcde160d Jeff Layton      2026-02-23 @1070  			kfree(rq);
0b88d5fcde160d Jeff Layton      2026-02-23  1071  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  1072  
17ad31b3a43b72 Jeff Layton      2026-02-23  1073  		if (rq) {
17ad31b3a43b72 Jeff Layton      2026-02-23 @1074  			cache_put(rq->item, cd);
17ad31b3a43b72 Jeff Layton      2026-02-23  1075  			kfree(rq->buf);
17ad31b3a43b72 Jeff Layton      2026-02-23  1076  			kfree(rq);
17ad31b3a43b72 Jeff Layton      2026-02-23  1077  		}
17ad31b3a43b72 Jeff Layton      2026-02-23  1078  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1079  		filp->private_data = NULL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1080  		kfree(rp);
64a38e840ce594 Dave Wysochanski 2019-07-26  1081  	}
64a38e840ce594 Dave Wysochanski 2019-07-26  1082  	if (filp->f_mode & FMODE_WRITE) {
64a38e840ce594 Dave Wysochanski 2019-07-26  1083  		atomic_dec(&cd->writers);
c5b29f885afe89 NeilBrown        2010-08-12  1084  		cd->last_close = seconds_since_boot();
^1da177e4c3f41 Linus Torvalds   2005-04-16  1085  	}
f7e86ab92f2198 Trond Myklebust  2009-08-19  1086  	module_put(cd->owner);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1087  	return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1088  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  1089  

:::::: The code at line 1074 was first introduced by commit
:::::: 17ad31b3a43b72aec3a3d83605891e1397d0d065 sunrpc: fix cache_request leak in cache_release

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
