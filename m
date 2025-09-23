Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AD1224F6
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 00:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758586442; cv=none; b=Q4tlR2drKDJn41OGfNKW+V55SlYWWYONyPWOcEnz265lMGLAgun4BBDFMjh+aZjOtMPIQQEeFEXXqO+f/nUgDidL0CD7qT2VSCc2kc/mBeXKsjKtSD679ptBpEc4cCMudpu5QnBTgdit37ndLmQcWp22Q6HXb2dd6uSmOQxc8Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758586442; c=relaxed/simple;
	bh=zjv2AJ0saO8lSfd84V+PKIceX4QXgxQqU1UdeRLlpbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pSX12H3CzMOBio4ZovtMKh/5cF9qlaTLNSkBJZqq1c6hC8JZrtCmrt0nbcRBROq77FpY5Rfjs69wFcH6PyMS+Cs29DXlU/Q6QFbi59a/iUsXiKnyhDzi4zlcd4EipXFoUjrrsJwXb7QLWdYwUO7B9DJgKYWldW3Dubm7OZHkjA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFCxew13; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFCxew13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758586441; x=1790122441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjv2AJ0saO8lSfd84V+PKIceX4QXgxQqU1UdeRLlpbo=;
  b=NFCxew13HvsNbhdx4hMyIAnfaGda14h1cK4xlaqa4vjgpRDcGeAKtK3/
   EWDvrXbtVtliN06TGO/Pw/cTQq/V1JGrc0Xx1D0qwUa6qX8i3rN58M2UK
   5C++fL7Ny/TG8pX9EwT7B7uzNSAVFfQ0C/pEGxc8HwUAQ2qKprIWTcZj2
   MIjQ4hYDG4AuzMgC+cMbt+oZZTsE9OEQaQAfVvijxFg0jion+r+mqFwaY
   miG3SXlRBQxnQriFQFylJjx7H6GKWdUDWOLWRWJnhHukdPfJ6ZBgfRWTW
   ItMKZDZ1eOvkep13FgG8Cb1aIsO0aTotOLDBn6iApxaBCTw6bULaAFZSp
   g==;
X-CSE-ConnectionGUID: C0Cb4h0fTm2kdE/KKEnExg==
X-CSE-MsgGUID: EzcbgqJqRw2ghY9xbySbuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61027194"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="61027194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 17:14:00 -0700
X-CSE-ConnectionGUID: 7vGHcI0sR5qixkC9O+T4xw==
X-CSE-MsgGUID: xOgQ4H5CQYe8pmmeIRMWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="176450985"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Sep 2025 17:13:59 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0qfM-0002Zp-1N;
	Tue, 23 Sep 2025 00:13:56 +0000
Date: Tue, 23 Sep 2025 08:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 23/35] security/selinux/avc.c:483
 avc_reclaim_node() error: uninitialized symbol 'flags'.
Message-ID: <202509230813.j9h9IIQa-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   b57fd8af63116c56536eb40f04dbe4f2206ec4ed
commit: 32b884d94862a5295719faf9e1c3b5eef162cca4 [23/35] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r071-20250922 (https://download.01.org/0day-ci/archive/20250923/202509230813.j9h9IIQa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509230813.j9h9IIQa-lkp@intel.com/

New smatch warnings:
security/selinux/avc.c:483 avc_reclaim_node() error: uninitialized symbol 'flags'.
arch/powerpc/kernel/nvram_64.c:704 oops_to_nvram() error: uninitialized symbol 'flags'.
drivers/tty/serial/samsung_tty.c:2288 s3c24xx_serial_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/st-asc.c:875 asc_console_write() error: uninitialized symbol 'flags'.

Old smatch warnings:
security/selinux/avc.c:488 avc_reclaim_node() error: uninitialized symbol 'flags'.

vim +/flags +483 security/selinux/avc.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  458  
e67b79850fcc4e Stephen Smalley  2023-03-09  459  static inline int avc_reclaim_node(void)
^1da177e4c3f41 Linus Torvalds   2005-04-16  460  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  461  	struct avc_node *node;
^1da177e4c3f41 Linus Torvalds   2005-04-16  462  	int hvalue, try, ecx;
^1da177e4c3f41 Linus Torvalds   2005-04-16  463  	unsigned long flags;
26036651c56260 Eric Paris       2009-02-12  464  	struct hlist_head *head;
edf3d1aecd0d60 Eric Paris       2009-02-12  465  	spinlock_t *lock;
^1da177e4c3f41 Linus Torvalds   2005-04-16  466  
^1da177e4c3f41 Linus Torvalds   2005-04-16  467  	for (try = 0, ecx = 0; try < AVC_CACHE_SLOTS; try++) {
e67b79850fcc4e Stephen Smalley  2023-03-09  468  		hvalue = atomic_inc_return(&selinux_avc.avc_cache.lru_hint) &
6b6bc6205d9879 Stephen Smalley  2018-03-05  469  			(AVC_CACHE_SLOTS - 1);
e67b79850fcc4e Stephen Smalley  2023-03-09  470  		head = &selinux_avc.avc_cache.slots[hvalue];
e67b79850fcc4e Stephen Smalley  2023-03-09  471  		lock = &selinux_avc.avc_cache.slots_lock[hvalue];
^1da177e4c3f41 Linus Torvalds   2005-04-16  472  
edf3d1aecd0d60 Eric Paris       2009-02-12  473  		if (!spin_trylock_irqsave(lock, flags))
^1da177e4c3f41 Linus Torvalds   2005-04-16  474  			continue;
^1da177e4c3f41 Linus Torvalds   2005-04-16  475  
618442509128fe Paul E. McKenney 2008-04-21  476  		rcu_read_lock();
b67bfe0d42cac5 Sasha Levin      2013-02-27  477  		hlist_for_each_entry(node, head, list) {
e67b79850fcc4e Stephen Smalley  2023-03-09  478  			avc_node_delete(node);
^1da177e4c3f41 Linus Torvalds   2005-04-16  479  			avc_cache_stats_incr(reclaims);
^1da177e4c3f41 Linus Torvalds   2005-04-16  480  			ecx++;
^1da177e4c3f41 Linus Torvalds   2005-04-16  481  			if (ecx >= AVC_CACHE_RECLAIM) {
618442509128fe Paul E. McKenney 2008-04-21  482  				rcu_read_unlock();
edf3d1aecd0d60 Eric Paris       2009-02-12 @483  				spin_unlock_irqrestore(lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16  484  				goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  485  			}
^1da177e4c3f41 Linus Torvalds   2005-04-16  486  		}
618442509128fe Paul E. McKenney 2008-04-21  487  		rcu_read_unlock();
edf3d1aecd0d60 Eric Paris       2009-02-12  488  		spin_unlock_irqrestore(lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16  489  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  490  out:
^1da177e4c3f41 Linus Torvalds   2005-04-16  491  	return ecx;
^1da177e4c3f41 Linus Torvalds   2005-04-16  492  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  493  

:::::: The code at line 483 was first introduced by commit
:::::: edf3d1aecd0d608acbd561b0c527e1d41abcb657 SELinux: code readability with avc_cache

:::::: TO: Eric Paris <eparis@redhat.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
