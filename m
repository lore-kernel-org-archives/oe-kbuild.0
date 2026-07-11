Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E342E8B98
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 01:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783734826; cv=none; b=dZ/0wscgi7CxquZVLwBdq+MNsBgddYpsfWFEyanovdYlgb1b9LSLc0MF0quRbLFnDdXkrqtItSZAtUBsm5FKkxRn/zY/LaEObNs+xgvEjhXKfBUE+ufOizaX4oW9sOke09CG/oXZdaAdE72xX+QQSuR4COrv7s95na+vlT160DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783734826; c=relaxed/simple;
	bh=NFfkC7WrwiBXz+yTe0QSN4y6iV8cw88VpVihHEPcHMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mbTw9ymkDAgJKWUL1bTg11TPN52fQv33oVp4eUCuvsCYm9FyuHP+J/rUvOjRTm7ztuMdYdHYOAHcM/3zTwRsHNKKcRZy1pisJh6Jog9b9MBpH5gjh7vhuGKW/aLedGzj2TW8V74kCKkPQgGHTVxaGKjktJKw9cxguci7tfo4nBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gd8Qcqw3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gd8Qcqw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783734824; x=1815270824;
  h=date:from:to:cc:subject:message-id;
  bh=NFfkC7WrwiBXz+yTe0QSN4y6iV8cw88VpVihHEPcHMk=;
  b=Gd8Qcqw3eIA7+2t20BRwSkZECzVGomUewuYUGTI6LY8ak+10DZP4rUXy
   tELcu393NdUEQ5opogt7pFf22dqFrk08/Yn53h2AejxtQo70B9pxfXLUM
   8Cbf62lgAkrgxqezVK8O0yi+qSIxo/EDGMXYKDe37mmY2yUmq8oAf4++J
   FG7qcKYqmlgDwHK4U9njtasBTroaWdIfSnDZbOnEVTV/vVyJg/G/oVh+K
   rhHTYK1hjJi/rqQNnMaHIaILvRuRksOWLJRJ3hNhq8miQ20prcEdKYo69
   5ohGp693Rgm2xbifYcu+APIWP7nQC6GDaIwTPP7jSGuKOFg4GuuO2WHm/
   Q==;
X-CSE-ConnectionGUID: bQ0JoyNcSmCYkGcsHiQbvA==
X-CSE-MsgGUID: q0YyF7GhQXu4Brgd0xxkLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71956490"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71956490"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 18:53:40 -0700
X-CSE-ConnectionGUID: kmFip7ZCQlaTDGJF7UK/WQ==
X-CSE-MsgGUID: RAxbn3EXRIKINio4BtHodw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259929401"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2026 18:53:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiMuO-00000000JcO-2LYL;
	Sat, 11 Jul 2026 01:53:36 +0000
Date: Sat, 11 Jul 2026 09:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/gfs2/log.c:1044 gfs2_remove_from_journal() error:
 dereferencing freed memory 'bh' (line 1038)
Message-ID: <202607110908.l7Owhul4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: 10866892c79159168459289a1288df4163e94d67 gfs2: Move gfs2_remove_from_journal to log.c
date:   4 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260711/202607110908.l7Owhul4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 10866892c791 ("gfs2: Move gfs2_remove_from_journal to log.c")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607110908.l7Owhul4-lkp@intel.com/

New smatch warnings:
fs/gfs2/log.c:1044 gfs2_remove_from_journal() error: dereferencing freed memory 'bh' (line 1038)

Old smatch warnings:
fs/gfs2/log.c:1051 gfs2_remove_from_journal() warn: passing freed memory 'bh' (line 1038)
fs/gfs2/log.c:1181 gfs2_log_flush() error: we previously assumed 'sdp->sd_jdesc' could be null (see line 1134)

vim +/bh +1044 fs/gfs2/log.c

462582b99b6079 Bob Peterson        2020-08-21  1019  
10866892c79159 Andreas Gruenbacher 2026-03-13  1020  void gfs2_remove_from_journal(struct buffer_head *bh, int meta)
10866892c79159 Andreas Gruenbacher 2026-03-13  1021  {
10866892c79159 Andreas Gruenbacher 2026-03-13  1022  	struct address_space *mapping = bh->b_folio->mapping;
10866892c79159 Andreas Gruenbacher 2026-03-13  1023  	struct gfs2_sbd *sdp = gfs2_mapping2sbd(mapping);
10866892c79159 Andreas Gruenbacher 2026-03-13  1024  	struct gfs2_bufdata *bd = bh->b_private;
10866892c79159 Andreas Gruenbacher 2026-03-13  1025  	struct gfs2_trans *tr = current->journal_info;
10866892c79159 Andreas Gruenbacher 2026-03-13  1026  	int was_pinned = 0;
10866892c79159 Andreas Gruenbacher 2026-03-13  1027  
10866892c79159 Andreas Gruenbacher 2026-03-13  1028  	if (test_clear_buffer_pinned(bh)) {
10866892c79159 Andreas Gruenbacher 2026-03-13  1029  		trace_gfs2_pin(bd, 0);
10866892c79159 Andreas Gruenbacher 2026-03-13  1030  		atomic_dec(&sdp->sd_log_pinned);
10866892c79159 Andreas Gruenbacher 2026-03-13  1031  		list_del_init(&bd->bd_list);
10866892c79159 Andreas Gruenbacher 2026-03-13  1032  		if (meta == REMOVE_META)
10866892c79159 Andreas Gruenbacher 2026-03-13  1033  			tr->tr_num_buf_rm++;
10866892c79159 Andreas Gruenbacher 2026-03-13  1034  		else
10866892c79159 Andreas Gruenbacher 2026-03-13  1035  			tr->tr_num_databuf_rm++;
10866892c79159 Andreas Gruenbacher 2026-03-13  1036  		set_bit(TR_TOUCHED, &tr->tr_flags);
10866892c79159 Andreas Gruenbacher 2026-03-13  1037  		was_pinned = 1;
10866892c79159 Andreas Gruenbacher 2026-03-13 @1038  		brelse(bh);
10866892c79159 Andreas Gruenbacher 2026-03-13  1039  	}
10866892c79159 Andreas Gruenbacher 2026-03-13  1040  	if (bd) {
10866892c79159 Andreas Gruenbacher 2026-03-13  1041  		if (bd->bd_tr) {
10866892c79159 Andreas Gruenbacher 2026-03-13  1042  			gfs2_trans_add_revoke(sdp, bd);
10866892c79159 Andreas Gruenbacher 2026-03-13  1043  		} else if (was_pinned) {
10866892c79159 Andreas Gruenbacher 2026-03-13 @1044  			bh->b_private = NULL;
10866892c79159 Andreas Gruenbacher 2026-03-13  1045  			kmem_cache_free(gfs2_bufdata_cachep, bd);
10866892c79159 Andreas Gruenbacher 2026-03-13  1046  		} else if (!list_empty(&bd->bd_ail_st_list) &&
10866892c79159 Andreas Gruenbacher 2026-03-13  1047  			   !list_empty(&bd->bd_ail_gl_list)) {
10866892c79159 Andreas Gruenbacher 2026-03-13  1048  			gfs2_remove_from_ail(bd);
10866892c79159 Andreas Gruenbacher 2026-03-13  1049  		}
10866892c79159 Andreas Gruenbacher 2026-03-13  1050  	}
10866892c79159 Andreas Gruenbacher 2026-03-13  1051  	clear_buffer_dirty(bh);
10866892c79159 Andreas Gruenbacher 2026-03-13  1052  	clear_buffer_uptodate(bh);
10866892c79159 Andreas Gruenbacher 2026-03-13  1053  }
10866892c79159 Andreas Gruenbacher 2026-03-13  1054  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
