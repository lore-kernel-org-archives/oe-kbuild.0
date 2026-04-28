Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F8F2D8767
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Apr 2026 03:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777345256; cv=none; b=tAtFlWoFz2m27CKubjjuafZXDY2bKzVwVnLEHQ5gH2sQER7O4QWissZkq6qnQLfpxbKRG8G1Ry0nGmHzYTupOLYSuIgj6V7ZHKLZxjNaUI2arzZcuBFyVb/gm8ErKAGSOUwMXBPzRgsK2JOsd0Fwha90HLB4Zd+gFF0I9XsRVSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777345256; c=relaxed/simple;
	bh=aWLq2gUnm6e/IhIkdpXFsAPoRJP8apn/pPJnWnRzGbg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L2o9k2OKg7K8NvV5Q6/tgYnhkHKQUD3tRXIRfQvOch09dCDSEUNFOrY+UAWACsU7gXH3k999PHybpOimXililFhoFXraiFnZ+qI2jgRrubGIeBfJca5kvc+/esXcipQ9uKpRqg9GBS42N1fEg3F54KNPu/JWxYhXQSXG9/ta9+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g13dlBxx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g13dlBxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777345254; x=1808881254;
  h=date:from:to:cc:subject:message-id;
  bh=aWLq2gUnm6e/IhIkdpXFsAPoRJP8apn/pPJnWnRzGbg=;
  b=g13dlBxxjxKx2lfuB0tlOBSyKpL/2gmX6FVBq+SqsgdJUbbK1UZ3odx7
   Ru6RVCb+5pSA3qkOnw/dC+tzDskiWlv5+D5JAO4BHn6KG7WNXV+x1z6QW
   lqMA88fctEofKTgGv73kjPbZ2+Ki92Z2eh4gVZ3WF+wxnhQDcfLtgu+xF
   TwZwTT135E9dWrLNP5uCU16SQ6iRaJKlg7gTJjCkJ20DtEuwapBlbCMlO
   V3UhJOIbgiuZtrP79/qjCxRoqDW/q+zNI/kBKiSyAtf+g7rgOuZZTtwLf
   6ZYOQEDvNfgn8Kd8S+9QBUbj+QSnqtlXCiBOesIbZSOLkvVRasQzRtmiT
   g==;
X-CSE-ConnectionGUID: FdJZ8IzmRxmYNAIpLsKiLA==
X-CSE-MsgGUID: XzPIFv8zT9WJeuKeIOjvRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88557370"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="88557370"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 20:00:53 -0700
X-CSE-ConnectionGUID: eWHQlD43Q0SQ4yta54urEw==
X-CSE-MsgGUID: hPg+e2b9TeCgnxwYjPDbOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="257354472"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Apr 2026 20:00:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHYgr-000000004B3-41DH;
	Tue, 28 Apr 2026 03:00:49 +0000
Date: Tue, 28 Apr 2026 05:00:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 3/3] fs/kernfs/dir.c:481:
 warning: Function parameter or struct member 'drop_supers' not described in
 'kernfs_drain'
Message-ID: <202604280437.RP2pUR6K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c0e06fe2fe2382104e8fc0af29079c3f5c0087ed
commit: b34d8a3a3a256046c35ed5a28173fe0686d34460 [3/3] UPSTREAM: kernfs: Send IN_DELETE_SELF and IN_IGNORED
:::::: branch date: 3 hours ago
:::::: commit date: 11 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260428/202604280437.RP2pUR6K-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604280437.RP2pUR6K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604280437.RP2pUR6K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/kernfs/dir.c:481: warning: Function parameter or struct member 'drop_supers' not described in 'kernfs_drain'


vim +481 fs/kernfs/dir.c

fd7b9f7b9776b1 Tejun Heo    2013-11-28  469  
fd7b9f7b9776b1 Tejun Heo    2013-11-28  470  /**
81c173cb5e87fb Tejun Heo    2014-02-03  471   * kernfs_drain - drain kernfs_node
81c173cb5e87fb Tejun Heo    2014-02-03  472   * @kn: kernfs_node to drain
fd7b9f7b9776b1 Tejun Heo    2013-11-28  473   *
24b3e3dd9c9c74 Randy Dunlap 2022-11-11  474   * Drain existing usages and nuke all existing mmaps of @kn.  Multiple
81c173cb5e87fb Tejun Heo    2014-02-03  475   * removers may invoke this function concurrently on @kn and all will
81c173cb5e87fb Tejun Heo    2014-02-03  476   * return after draining is complete.
fd7b9f7b9776b1 Tejun Heo    2013-11-28  477   */
b34d8a3a3a2560 T.J. Mercier 2026-02-25  478  static void kernfs_drain(struct kernfs_node *kn, bool drop_supers)
393c3714081a53 Minchan Kim  2021-11-18  479  	__releases(&kernfs_root(kn)->kernfs_rwsem)
393c3714081a53 Minchan Kim  2021-11-18  480  	__acquires(&kernfs_root(kn)->kernfs_rwsem)
fd7b9f7b9776b1 Tejun Heo    2013-11-28 @481  {
abd54f028ec309 Tejun Heo    2014-02-03  482  	struct kernfs_root *root = kernfs_root(kn);
fd7b9f7b9776b1 Tejun Heo    2013-11-28  483  
393c3714081a53 Minchan Kim  2021-11-18  484  	lockdep_assert_held_write(&root->kernfs_rwsem);
81c173cb5e87fb Tejun Heo    2014-02-03  485  	WARN_ON_ONCE(kernfs_active(kn));
abd54f028ec309 Tejun Heo    2014-02-03  486  
2d7f9f8c181570 Tejun Heo    2022-08-27  487  	/*
2d7f9f8c181570 Tejun Heo    2022-08-27  488  	 * Skip draining if already fully drained. This avoids draining and its
2d7f9f8c181570 Tejun Heo    2022-08-27  489  	 * lockdep annotations for nodes which have never been activated
2d7f9f8c181570 Tejun Heo    2022-08-27  490  	 * allowing embedding kernfs_remove() in create error paths without
2d7f9f8c181570 Tejun Heo    2022-08-27  491  	 * worrying about draining.
2d7f9f8c181570 Tejun Heo    2022-08-27  492  	 */
2d7f9f8c181570 Tejun Heo    2022-08-27  493  	if (atomic_read(&kn->active) == KN_DEACTIVATED_BIAS &&
2d7f9f8c181570 Tejun Heo    2022-08-27  494  	    !kernfs_should_drain_open_files(kn))
2d7f9f8c181570 Tejun Heo    2022-08-27  495  		return;
2d7f9f8c181570 Tejun Heo    2022-08-27  496  
393c3714081a53 Minchan Kim  2021-11-18  497  	up_write(&root->kernfs_rwsem);
b34d8a3a3a2560 T.J. Mercier 2026-02-25  498  	if (drop_supers)
b34d8a3a3a2560 T.J. Mercier 2026-02-25  499  		up_read(&root->kernfs_supers_rwsem);
35beab0635f3cd Tejun Heo    2014-02-03  500  
182fd64b663422 Tejun Heo    2014-02-03  501  	if (kernfs_lockdep(kn)) {
35beab0635f3cd Tejun Heo    2014-02-03  502  		rwsem_acquire(&kn->dep_map, 0, 0, _RET_IP_);
35beab0635f3cd Tejun Heo    2014-02-03  503  		if (atomic_read(&kn->active) != KN_DEACTIVATED_BIAS)
324a56e16e44ba Tejun Heo    2013-12-11  504  			lock_contended(&kn->dep_map, _RET_IP_);
35beab0635f3cd Tejun Heo    2014-02-03  505  	}
abd54f028ec309 Tejun Heo    2014-02-03  506  
abd54f028ec309 Tejun Heo    2014-02-03  507  	wait_event(root->deactivate_waitq,
abd54f028ec309 Tejun Heo    2014-02-03  508  		   atomic_read(&kn->active) == KN_DEACTIVATED_BIAS);
fd7b9f7b9776b1 Tejun Heo    2013-11-28  509  
182fd64b663422 Tejun Heo    2014-02-03  510  	if (kernfs_lockdep(kn)) {
324a56e16e44ba Tejun Heo    2013-12-11  511  		lock_acquired(&kn->dep_map, _RET_IP_);
5facae4f3549b5 Qian Cai     2019-09-19  512  		rwsem_release(&kn->dep_map, _RET_IP_);
fd7b9f7b9776b1 Tejun Heo    2013-11-28  513  	}
35beab0635f3cd Tejun Heo    2014-02-03  514  
bdb2fd7fc56e19 Tejun Heo    2022-08-27  515  	if (kernfs_should_drain_open_files(kn))
0e67db2f9fe919 Tejun Heo    2016-12-27  516  		kernfs_drain_open_files(kn);
ccf02aaf8167bb Tejun Heo    2014-02-03  517  
b34d8a3a3a2560 T.J. Mercier 2026-02-25  518  	if (drop_supers)
b34d8a3a3a2560 T.J. Mercier 2026-02-25  519  		down_read(&root->kernfs_supers_rwsem);
393c3714081a53 Minchan Kim  2021-11-18  520  	down_write(&root->kernfs_rwsem);
a6607930b6cd82 Tejun Heo    2014-02-03  521  }
fd7b9f7b9776b1 Tejun Heo    2013-11-28  522  

:::::: The code at line 481 was first introduced by commit
:::::: fd7b9f7b9776b11df629e9dd3865320bf57ce588 sysfs, kernfs: move dir core code to fs/kernfs/dir.c

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
