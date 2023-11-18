Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553D623C3
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Nov 2023 03:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUo+xvdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700279366; x=1731815366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t1ToEOS57LD06OLbsha0y0lqxmptqX8Vxyq4T2vx+8Y=;
  b=TUo+xvdDZaAMbgVeaz2Gm6lB5Yr9wfrhZrIxQqB5OYrtrHYnZaj9SmJq
   YxC2ZEQjYh/mWHtN9lizGenVD8ooJ06L73S3uK44mUSHHzWdz96INlneU
   IY3Qix8wG4Nwle5WCIAwWM/IanswVqHzYtio65iB0vXKJOGSdRcKQxALW
   xevtOyoAnydYW2NipGyk+M3EvlYY5Tn/uqm791+fcY8RXaKwI/05hfVjc
   nAPJVXpcH2tCdPu/0E5FDHsU/EgJ7DiHcigfPpuvFdLuOgwfiwQGrduoA
   /XcJCRhiLV0Dc4RyybID9zrK3YBtdtJLvftQAPQg7ecz25Sz3uxodifVC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="376452263"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="376452263"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 19:49:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="13661864"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2023 19:49:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4CKg-0003Us-0W;
	Sat, 18 Nov 2023 03:49:22 +0000
Date: Sat, 18 Nov 2023 11:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/journal.c:884:17: sparse: sparse: cast to non-scalar
Message-ID: <202311181131.i1dhiz1S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/journal.c:884:17: sparse: sparse: cast to non-scalar"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   791c8ab095f71327899023223940dd52257a4173
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: alpha-randconfig-r112-20231118 (https://download.01.org/0day-ci/archive/20231118/202311181131.i1dhiz1S-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311181131.i1dhiz1S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311181131.i1dhiz1S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/journal.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1022:42: sparse: sparse: array of flexible structures
>> fs/bcachefs/journal.c:884:17: sparse: sparse: cast to non-scalar
>> fs/bcachefs/journal.c:884:17: sparse: sparse: cast from non-scalar
   fs/bcachefs/journal.c:150:9: sparse: sparse: context imbalance in 'journal_buf_switch' - unexpected unlock
   fs/bcachefs/journal.c:271:13: sparse: sparse: context imbalance in 'journal_flush_write' - wrong count at exit
   fs/bcachefs/journal.c:329:35: sparse: sparse: context imbalance in '__journal_res_get' - different lock contexts for basic block
   fs/bcachefs/journal.c:509:6: sparse: sparse: context imbalance in 'bch2_journal_flush_seq_async' - different lock contexts for basic block
   fs/bcachefs/journal.c:570:12: sparse: sparse: context imbalance in 'journal_seq_flushed' - different lock contexts for basic block
   fs/bcachefs/journal.c:797:17: sparse: sparse: context imbalance in '__bch2_set_nr_journal_buckets' - different lock contexts for basic block

vim +884 fs/bcachefs/journal.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  876  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  877  static bool bch2_journal_writing_to_device(struct journal *j, unsigned dev_idx)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  878  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  879  	union journal_res_state state;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  880  	struct journal_buf *w;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  881  	bool ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  882  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  883  	spin_lock(&j->lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @884  	state = READ_ONCE(j->reservations);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  885  	w = j->buf + !state.idx;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  886  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  887  	ret = state.prev_buf_unwritten &&
1c6fdbd8f2465d Kent Overstreet 2017-03-16  888  		bch2_extent_has_device(bkey_i_to_s_c_extent(&w->key), dev_idx);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  889  	spin_unlock(&j->lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  890  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  891  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  892  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  893  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
