Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B533845AC
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308385; cv=none; b=rGVWvBy4kF2teQUWWbZExR3P9xKREagRpRchatDeS0EoaveBVpZfpU2pXbyCHIjof050t/i6sR1TEuMj5ZQ5iOKIy0rB5mcIvdDEmjlbp1+M7XdbT4Uui4blZl88VjuyzTN2ptpElgaICie4LFqtq6Yww0DV69ZDw3nIyR6aBD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308385; c=relaxed/simple;
	bh=1U3A/6fj1kfFS9MLrLSBorB9fQjS/Py2hwhOK18Zek0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rF0EGeqo8sOD4OQ7RYtiU56/rkmr7OdOgLN3f22SEByUrHDIRhIHCoP93ngFb5ES/+GNnPLbkHOrqM7meS6k+K5f0sMWz7koP5Z7JIaPqoCRImf1tOsFIEbNBeI5Lt6G+RCLoaQ6xz25VqogesFXbYv8uYWdRnk1dhdQKH+ScwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QED7SKxp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QED7SKxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774308383; x=1805844383;
  h=date:from:to:cc:subject:message-id;
  bh=1U3A/6fj1kfFS9MLrLSBorB9fQjS/Py2hwhOK18Zek0=;
  b=QED7SKxpCvP0xxuuYM+DFiKMEy5fXZgPnRD9PPHS6lXwepU/HxwOFFOW
   htE5vIAFgdneW/GfWf5draio+sGXMT5hjQtFIlQev980UXGT9v1s3kkWy
   SJzqbfvZSoWIUai7CQLfw/bs7pSoOjMb73YLLIQc7S8iqjZiKILN9WzyZ
   lzv4KTXBj0TEasfyJo2ZNQa99VL8taMn2t8M49t4/sYc0XpkAJmVtdBFE
   utZzfKQ1vplf6PmiD9gsuHiv4A77boiZXb2uV5/+PdZVpqLoKijyBEel9
   yJVfmtA6r079+zZhfYEBl005pOyoxXcP8TqTYmcqXFXkMC6mqNK2d0l/R
   w==;
X-CSE-ConnectionGUID: L/ZkSGNkSbKFmybZxpR5jw==
X-CSE-MsgGUID: mzfp1GHdQl+6sv/9mCRTwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97937872"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="97937872"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 16:26:22 -0700
X-CSE-ConnectionGUID: mLNHhuSNRJSd1UjKyRIS8A==
X-CSE-MsgGUID: c3Obkev5Qz63EPPyaR94pw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Mar 2026 16:26:21 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4of5-000000003ON-1k3r;
	Mon, 23 Mar 2026 23:26:19 +0000
Date: Tue, 24 Mar 2026 07:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7490/8143] fs/gfs2/log.c:1044
 gfs2_remove_from_journal() error: dereferencing freed memory 'bh' (line 1038)
Message-ID: <202603240754.C7jumMeJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
commit: a6ce9e1e687685298eca177d82e68ac61c01e10a [7490/8143] gfs2: Move gfs2_remove_from_journal to log.c
:::::: branch date: 6 hours ago
:::::: commit date: 24 hours ago
config: s390-randconfig-r072-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240754.C7jumMeJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603240754.C7jumMeJ-lkp@intel.com/

New smatch warnings:
fs/gfs2/log.c:1044 gfs2_remove_from_journal() error: dereferencing freed memory 'bh' (line 1038)
fs/gfs2/log.c:1051 gfs2_remove_from_journal() warn: passing freed memory 'bh' (line 1038)

Old smatch warnings:
fs/gfs2/log.c:1181 gfs2_log_flush() error: we previously assumed 'sdp->sd_jdesc' could be null (see line 1134)

vim +/bh +1044 fs/gfs2/log.c

462582b99b6079 Bob Peterson        2020-08-21  1019  
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1020  void gfs2_remove_from_journal(struct buffer_head *bh, int meta)
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1021  {
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1022  	struct address_space *mapping = bh->b_folio->mapping;
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1023  	struct gfs2_sbd *sdp = gfs2_mapping2sbd(mapping);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1024  	struct gfs2_bufdata *bd = bh->b_private;
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1025  	struct gfs2_trans *tr = current->journal_info;
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1026  	int was_pinned = 0;
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1027  
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1028  	if (test_clear_buffer_pinned(bh)) {
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1029  		trace_gfs2_pin(bd, 0);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1030  		atomic_dec(&sdp->sd_log_pinned);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1031  		list_del_init(&bd->bd_list);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1032  		if (meta == REMOVE_META)
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1033  			tr->tr_num_buf_rm++;
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1034  		else
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1035  			tr->tr_num_databuf_rm++;
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1036  		set_bit(TR_TOUCHED, &tr->tr_flags);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1037  		was_pinned = 1;
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13 @1038  		brelse(bh);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1039  	}
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1040  	if (bd) {
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1041  		if (bd->bd_tr) {
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1042  			gfs2_trans_add_revoke(sdp, bd);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1043  		} else if (was_pinned) {
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13 @1044  			bh->b_private = NULL;
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1045  			kmem_cache_free(gfs2_bufdata_cachep, bd);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1046  		} else if (!list_empty(&bd->bd_ail_st_list) &&
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1047  			   !list_empty(&bd->bd_ail_gl_list)) {
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1048  			gfs2_remove_from_ail(bd);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1049  		}
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1050  	}
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13 @1051  	clear_buffer_dirty(bh);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1052  	clear_buffer_uptodate(bh);
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1053  }
a6ce9e1e687685 Andreas Gruenbacher 2026-03-13  1054  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
