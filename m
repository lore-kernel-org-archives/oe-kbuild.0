Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F62BE62
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jan 2024 08:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpYtA6/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704703733; x=1736239733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/abX4S4IRUbX4pNisHxhhgMYnZj9u+1OnWfo4DQT/ns=;
  b=ZpYtA6/VdbJq/MfwArC+UheX9Ha74MDHZwQOGYB+yobmwjYGjuj6giw1
   y7LnkCpv4dtrNClRiIEu8IuUttNZ6twqEkAiutNMZqQompnVrQ2PcZoza
   F5aRAl13X9z6TJBFOo94nVpW8Lwrry5c0NATisKpZ8L3U4A4atu+in32P
   TiKxf2NzjKMUyXcEeATXOevzoTGxf6Q7i/Z2c5MnFb1+nNuSssHbmL0Qt
   4pOz43EnAAvIQEiqr/18VPpJKTocz5bSIel8vttnFlgKH+pZBi1zddyPF
   q+k1FtZl5cmUXvpUA0R323luGf8NheY+utquEoPeEqhG0e2hV/lvw91qA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="4585476"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="4585476"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 00:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="784795705"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="784795705"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jan 2024 00:48:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMlJO-0004Yo-1Y;
	Mon, 08 Jan 2024 08:48:46 +0000
Date: Mon, 8 Jan 2024 16:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/smb/client/connect.c:2614:6-25: WARNING: atomic_dec_and_test
 variation before object free at line 2622.
Message-ID: <202401081623.AfPkRwWr-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0dd3ee31125508cd67f7e7172247f05b7fd1753a
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-101-20240106 (https://download.01.org/0day-ci/archive/20240108/202401081623.AfPkRwWr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401081623.AfPkRwWr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/client/connect.c:2614:6-25: WARNING: atomic_dec_and_test variation before object free at line 2622.

vim +2614 fs/smb/client/connect.c

d00c28de55a69d fs/cifs/connect.c Jeff Layton 2010-04-24  2607  
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2608  void
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2609  cifs_put_tlink(struct tcon_link *tlink)
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2610  {
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2611  	if (!tlink || IS_ERR(tlink))
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2612  		return;
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2613  
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06 @2614  	if (!atomic_dec_and_test(&tlink->tl_count) ||
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2615  	    test_bit(TCON_LINK_IN_TREE, &tlink->tl_flags)) {
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2616  		tlink->tl_time = jiffies;
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2617  		return;
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2618  	}
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2619  
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2620  	if (!IS_ERR(tlink_tcon(tlink)))
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2621  		cifs_put_tcon(tlink_tcon(tlink));
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06 @2622  	kfree(tlink);
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2623  	return;
9d002df492b14c fs/cifs/connect.c Jeff Layton 2010-10-06  2624  }
d00c28de55a69d fs/cifs/connect.c Jeff Layton 2010-04-24  2625  

:::::: The code at line 2614 was first introduced by commit
:::::: 9d002df492b14c690425d9785530371b6c1ccbca cifs: add routines to build sessions and tcons on the fly

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
