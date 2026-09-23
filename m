Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D2C3A380F
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 16:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180111; cv=none; b=cTqQijQHemPirGmF994T9Dz+wX0HgLXUdiJ9ZZ2bsRaCdLpgvYRtIzUbXscSkbyFFrBEqhlD6l0fNafy6Qc/LqnM84Rep3eKPuRrua4yniYlR1T6pev+++LyiZCNrqdhTjv3DFFMXJu3NdjCLjC+5MNpFaK+FqKA3v24Z9jARf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180111; c=relaxed/simple;
	bh=I3/nrSuGmweJTlVfV4ktFjjzdKs4FbIDLfCPhqM46L4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=npI5DIKo66JLSuOS+rTnh69Noqh0HD57fLiTpYStjBQsjn4Jp1bMlqOdtbheJCrgag8/W7541W+exj9rxXJz+2T/NG57n95RoTu31IoTDlkImbiHB6nzESYtqOpkKXfnUXlUmsUsW0FVz1ZJdurXROceWLvkgFlfPR5ve2gGCrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqro0jNW; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqro0jNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790180108; x=1821716108;
  h=date:from:to:cc:subject:message-id;
  bh=I3/nrSuGmweJTlVfV4ktFjjzdKs4FbIDLfCPhqM46L4=;
  b=dqro0jNWVy4eBc0bmTos11NZZIWljXodEHCD88k2DRDRWLMWNXOnp0Mu
   2m/ZVxohFwq8JYHFywMWxhCYTrAYvegmrxAa5VtJRuts0cVa6vnx+wl6d
   lUKR6JWviH8osG7ijJUGgj+E0ueOlPSPM4Jlrpvy96ferpugMzQ0QReSX
   h25hnw0TR7iArVQv7hoQw6sv0xkEZ/kTpPV8o4Cpv+uQgWhwRQ/wt8PHh
   HfEGER71ldNRkLB8xSeHKLbBGT/Qi9NHl5nD4LL08Tl3DX5QrhCgSvbuI
   WF9iWui3LL7BICM0NI9qlMmo5E5OGA1poEg50SBcb6OEu2SX52juji21P
   w==;
X-CSE-ConnectionGUID: 9deRHCrUTS+9O/QJbMXPgA==
X-CSE-MsgGUID: UC2Tg7gBSFuQj7R4JLTpog==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1389046"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1389046"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:15:07 -0700
X-CSE-ConnectionGUID: g61woCMURc6TJMXUS88NWQ==
X-CSE-MsgGUID: Tao2/RyxSm6BhymGAH0voA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 09:15:05 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9PcY-000000000jv-1RXE;
	Wed, 23 Sep 2026 16:14:58 +0000
Date: Wed, 23 Sep 2026 18:14:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/notify/fsnotify.c:567 fsnotify() error: we previously
 assumed 'sbinfo->sb_marks' could be null (see line 535)
Message-ID: <202609231841.5L3UNNxT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rong Xu <xur@google.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r2202-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231841.5L3UNNxT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 4b99afb361a8cfd45fc17aebc637688661e9e472)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609231841.5L3UNNxT-lkp@intel.com/

smatch warnings:
fs/notify/fsnotify.c:567 fsnotify() error: we previously assumed 'sbinfo->sb_marks' could be null (see line 535)
fs/notify/fsnotify.c:571 fsnotify() error: we previously assumed 'mnt->mnt_fsnotify_marks' could be null (see line 536)
fs/notify/fsnotify.c:575 fsnotify() error: we previously assumed 'inode->i_fsnotify_marks' could be null (see line 537)
fs/notify/fsnotify.c:579 fsnotify() error: we previously assumed 'inode2->i_fsnotify_marks' could be null (see line 538)
fs/notify/fsnotify.c:583 fsnotify() error: we previously assumed 'mnt_data->ns->n_fsnotify_marks' could be null (see line 539)

vim +567 fs/notify/fsnotify.c

d9a6f30bb89309 Amir Goldstein          2018-04-20  471  
90586523eb4b34 Eric Paris              2009-05-21  472  /*
40a100d3adc1ad Amir Goldstein          2020-07-22  473   * fsnotify - This is the main call to fsnotify.
40a100d3adc1ad Amir Goldstein          2020-07-22  474   *
40a100d3adc1ad Amir Goldstein          2020-07-22  475   * The VFS calls into hook specific functions in linux/fsnotify.h.
40a100d3adc1ad Amir Goldstein          2020-07-22  476   * Those functions then in turn call here.  Here will call out to all of the
40a100d3adc1ad Amir Goldstein          2020-07-22  477   * registered fsnotify_group.  Those groups can then use the notification event
40a100d3adc1ad Amir Goldstein          2020-07-22  478   * in whatever means they feel necessary.
40a100d3adc1ad Amir Goldstein          2020-07-22  479   *
40a100d3adc1ad Amir Goldstein          2020-07-22  480   * @mask:	event type and flags
40a100d3adc1ad Amir Goldstein          2020-07-22  481   * @data:	object that event happened on
40a100d3adc1ad Amir Goldstein          2020-07-22  482   * @data_type:	type of object for fanotify_data_XXX() accessors
40a100d3adc1ad Amir Goldstein          2020-07-22  483   * @dir:	optional directory associated with event -
40a100d3adc1ad Amir Goldstein          2020-07-22  484   *		if @file_name is not NULL, this is the directory that
40a100d3adc1ad Amir Goldstein          2020-07-22  485   *		@file_name is relative to
40a100d3adc1ad Amir Goldstein          2020-07-22  486   * @file_name:	optional file name associated with event
40a100d3adc1ad Amir Goldstein          2020-07-22  487   * @inode:	optional inode associated with event -
29335033c574a1 Gabriel Krisman Bertazi 2021-10-25  488   *		If @dir and @inode are both non-NULL, event may be
29335033c574a1 Gabriel Krisman Bertazi 2021-10-25  489   *		reported to both.
40a100d3adc1ad Amir Goldstein          2020-07-22  490   * @cookie:	inotify rename cookie
90586523eb4b34 Eric Paris              2009-05-21  491   */
40a100d3adc1ad Amir Goldstein          2020-07-22  492  int fsnotify(__u32 mask, const void *data, int data_type, struct inode *dir,
40a100d3adc1ad Amir Goldstein          2020-07-22  493  	     const struct qstr *file_name, struct inode *inode, u32 cookie)
90586523eb4b34 Eric Paris              2009-05-21  494  {
b54cecf5e2293d Amir Goldstein          2020-06-07  495  	const struct path *path = fsnotify_data_path(data, data_type);
29335033c574a1 Gabriel Krisman Bertazi 2021-10-25  496  	struct super_block *sb = fsnotify_data_sb(data, data_type);
b944249bcea97f Miklos Szeredi          2025-01-29  497  	const struct fsnotify_mnt *mnt_data = fsnotify_data_mnt(data, data_type);
b944249bcea97f Miklos Szeredi          2025-01-29  498  	struct fsnotify_sb_info *sbinfo = sb ? fsnotify_sb_info(sb) : NULL;
3427ce71554123 Miklos Szeredi          2017-10-30  499  	struct fsnotify_iter_info iter_info = {};
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  500  	struct mount *mnt = NULL;
e54183fa7047c1 Amir Goldstein          2021-11-29  501  	struct inode *inode2 = NULL;
e54183fa7047c1 Amir Goldstein          2021-11-29  502  	struct dentry *moved;
e54183fa7047c1 Amir Goldstein          2021-11-29  503  	int inode2_type;
9385a84d7e1f65 Jan Kara                2016-11-10  504  	int ret = 0;
b944249bcea97f Miklos Szeredi          2025-01-29  505  	__u32 test_mask, marks_mask = 0;
90586523eb4b34 Eric Paris              2009-05-21  506  
71d734103edfa2 Mel Gorman              2020-07-08  507  	if (path)
aa93bdc5500cc9 Amir Goldstein          2020-03-19  508  		mnt = real_mount(path->mnt);
3a9fb89f4cd04c Eric Paris              2009-12-17  509  
40a100d3adc1ad Amir Goldstein          2020-07-22  510  	if (!inode) {
40a100d3adc1ad Amir Goldstein          2020-07-22  511  		/* Dirent event - report on TYPE_INODE to dir */
40a100d3adc1ad Amir Goldstein          2020-07-22  512  		inode = dir;
e54183fa7047c1 Amir Goldstein          2021-11-29  513  		/* For FS_RENAME, inode is old_dir and inode2 is new_dir */
e54183fa7047c1 Amir Goldstein          2021-11-29  514  		if (mask & FS_RENAME) {
e54183fa7047c1 Amir Goldstein          2021-11-29  515  			moved = fsnotify_data_dentry(data, data_type);
e54183fa7047c1 Amir Goldstein          2021-11-29  516  			inode2 = moved->d_parent->d_inode;
e54183fa7047c1 Amir Goldstein          2021-11-29  517  			inode2_type = FSNOTIFY_ITER_TYPE_INODE2;
e54183fa7047c1 Amir Goldstein          2021-11-29  518  		}
40a100d3adc1ad Amir Goldstein          2020-07-22  519  	} else if (mask & FS_EVENT_ON_CHILD) {
40a100d3adc1ad Amir Goldstein          2020-07-22  520  		/*
fecc4559780d52 Amir Goldstein          2020-12-02  521  		 * Event on child - report on TYPE_PARENT to dir if it is
fecc4559780d52 Amir Goldstein          2020-12-02  522  		 * watching children and on TYPE_INODE to child.
40a100d3adc1ad Amir Goldstein          2020-07-22  523  		 */
e54183fa7047c1 Amir Goldstein          2021-11-29  524  		inode2 = dir;
e54183fa7047c1 Amir Goldstein          2021-11-29  525  		inode2_type = FSNOTIFY_ITER_TYPE_PARENT;
40a100d3adc1ad Amir Goldstein          2020-07-22  526  	}
497b0c5a7c0688 Amir Goldstein          2020-07-16  527  
7c49b8616460eb Dave Hansen             2015-09-04  528  	/*
7c49b8616460eb Dave Hansen             2015-09-04  529  	 * Optimization: srcu_read_lock() has a memory barrier which can
7c49b8616460eb Dave Hansen             2015-09-04  530  	 * be expensive.  It protects walking the *_fsnotify_marks lists.
7c49b8616460eb Dave Hansen             2015-09-04  531  	 * However, if we do not walk the lists, we do not have to do
7c49b8616460eb Dave Hansen             2015-09-04  532  	 * SRCU because we have no references to any objects and do not
7c49b8616460eb Dave Hansen             2015-09-04  533  	 * need SRCU to keep them "alive".
7c49b8616460eb Dave Hansen             2015-09-04  534  	 */
07a3b8d0bf726a Amir Goldstein          2024-03-17 @535  	if ((!sbinfo || !sbinfo->sb_marks) &&
497b0c5a7c0688 Amir Goldstein          2020-07-16 @536  	    (!mnt || !mnt->mnt_fsnotify_marks) &&
9b93f33105f5f9 Amir Goldstein          2020-07-16 @537  	    (!inode || !inode->i_fsnotify_marks) &&
b944249bcea97f Miklos Szeredi          2025-01-29 @538  	    (!inode2 || !inode2->i_fsnotify_marks) &&
b944249bcea97f Miklos Szeredi          2025-01-29 @539  	    (!mnt_data || !mnt_data->ns->n_fsnotify_marks))
7c49b8616460eb Dave Hansen             2015-09-04  540  		return 0;
71d734103edfa2 Mel Gorman              2020-07-08  541  
b944249bcea97f Miklos Szeredi          2025-01-29  542  	if (sb)
b944249bcea97f Miklos Szeredi          2025-01-29  543  		marks_mask |= READ_ONCE(sb->s_fsnotify_mask);
71d734103edfa2 Mel Gorman              2020-07-08  544  	if (mnt)
35ceae44742e11 Jan Kara                2024-07-17  545  		marks_mask |= READ_ONCE(mnt->mnt_fsnotify_mask);
9b93f33105f5f9 Amir Goldstein          2020-07-16  546  	if (inode)
35ceae44742e11 Jan Kara                2024-07-17  547  		marks_mask |= READ_ONCE(inode->i_fsnotify_mask);
e54183fa7047c1 Amir Goldstein          2021-11-29  548  	if (inode2)
35ceae44742e11 Jan Kara                2024-07-17  549  		marks_mask |= READ_ONCE(inode2->i_fsnotify_mask);
b944249bcea97f Miklos Szeredi          2025-01-29  550  	if (mnt_data)
b944249bcea97f Miklos Szeredi          2025-01-29  551  		marks_mask |= READ_ONCE(mnt_data->ns->n_fsnotify_mask);
71d734103edfa2 Mel Gorman              2020-07-08  552  
613a807fe7c793 Eric Paris              2010-07-28  553  	/*
31a371e419c885 Amir Goldstein          2022-06-29  554  	 * If this is a modify event we may need to clear some ignore masks.
31a371e419c885 Amir Goldstein          2022-06-29  555  	 * In that case, the object with ignore masks will have the FS_MODIFY
04e317ba72d079 Amir Goldstein          2022-02-23  556  	 * event in its mask.
04e317ba72d079 Amir Goldstein          2022-02-23  557  	 * Otherwise, return if none of the marks care about this type of event.
613a807fe7c793 Eric Paris              2010-07-28  558  	 */
71d734103edfa2 Mel Gorman              2020-07-08  559  	test_mask = (mask & ALL_FSNOTIFY_EVENTS);
04e317ba72d079 Amir Goldstein          2022-02-23  560  	if (!(test_mask & marks_mask))
613a807fe7c793 Eric Paris              2010-07-28  561  		return 0;
75c1be487a690d Eric Paris              2010-07-28  562  
9385a84d7e1f65 Jan Kara                2016-11-10  563  	iter_info.srcu_idx = srcu_read_lock(&fsnotify_mark_srcu);
75c1be487a690d Eric Paris              2010-07-28  564  
07a3b8d0bf726a Amir Goldstein          2024-03-17  565  	if (sbinfo) {
1c9007d62bea6f Amir Goldstein          2021-11-29  566  		iter_info.marks[FSNOTIFY_ITER_TYPE_SB] =
07a3b8d0bf726a Amir Goldstein          2024-03-17 @567  			fsnotify_first_mark(&sbinfo->sb_marks);
07a3b8d0bf726a Amir Goldstein          2024-03-17  568  	}
9bdda4e9cf2dce Amir Goldstein          2018-09-01  569  	if (mnt) {
1c9007d62bea6f Amir Goldstein          2021-11-29  570  		iter_info.marks[FSNOTIFY_ITER_TYPE_VFSMOUNT] =
3427ce71554123 Miklos Szeredi          2017-10-30 @571  			fsnotify_first_mark(&mnt->mnt_fsnotify_marks);
7131485a93679f Eric Paris              2009-12-17  572  	}
9b93f33105f5f9 Amir Goldstein          2020-07-16  573  	if (inode) {
1c9007d62bea6f Amir Goldstein          2021-11-29  574  		iter_info.marks[FSNOTIFY_ITER_TYPE_INODE] =
9b93f33105f5f9 Amir Goldstein          2020-07-16 @575  			fsnotify_first_mark(&inode->i_fsnotify_marks);
9b93f33105f5f9 Amir Goldstein          2020-07-16  576  	}
e54183fa7047c1 Amir Goldstein          2021-11-29  577  	if (inode2) {
e54183fa7047c1 Amir Goldstein          2021-11-29  578  		iter_info.marks[inode2_type] =
e54183fa7047c1 Amir Goldstein          2021-11-29 @579  			fsnotify_first_mark(&inode2->i_fsnotify_marks);
497b0c5a7c0688 Amir Goldstein          2020-07-16  580  	}
b944249bcea97f Miklos Szeredi          2025-01-29  581  	if (mnt_data) {
b944249bcea97f Miklos Szeredi          2025-01-29  582  		iter_info.marks[FSNOTIFY_ITER_TYPE_MNTNS] =
b944249bcea97f Miklos Szeredi          2025-01-29 @583  			fsnotify_first_mark(&mnt_data->ns->n_fsnotify_marks);
b944249bcea97f Miklos Szeredi          2025-01-29  584  	}
75c1be487a690d Eric Paris              2010-07-28  585  
8edc6e1688fc8f Jan Kara                2014-11-13  586  	/*
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  587  	 * We need to merge inode/vfsmount/sb mark lists so that e.g. inode mark
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  588  	 * ignore masks are properly reflected for mount/sb mark notifications.
8edc6e1688fc8f Jan Kara                2014-11-13  589  	 * That's why this traversal is so complicated...
8edc6e1688fc8f Jan Kara                2014-11-13  590  	 */
d9a6f30bb89309 Amir Goldstein          2018-04-20  591  	while (fsnotify_iter_select_report_types(&iter_info)) {
b54cecf5e2293d Amir Goldstein          2020-06-07  592  		ret = send_to_group(mask, data, data_type, dir, file_name,
b54cecf5e2293d Amir Goldstein          2020-06-07  593  				    cookie, &iter_info);
613a807fe7c793 Eric Paris              2010-07-28  594  
ff8bcbd03da881 Eric Paris              2010-10-28  595  		if (ret && (mask & ALL_FSNOTIFY_PERM_EVENTS))
ff8bcbd03da881 Eric Paris              2010-10-28  596  			goto out;
ff8bcbd03da881 Eric Paris              2010-10-28  597  
d9a6f30bb89309 Amir Goldstein          2018-04-20  598  		fsnotify_iter_next(&iter_info);
90586523eb4b34 Eric Paris              2009-05-21  599  	}
ff8bcbd03da881 Eric Paris              2010-10-28  600  	ret = 0;
ff8bcbd03da881 Eric Paris              2010-10-28  601  out:
9385a84d7e1f65 Jan Kara                2016-11-10  602  	srcu_read_unlock(&fsnotify_mark_srcu, iter_info.srcu_idx);
c4ec54b40d33f8 Eric Paris              2009-12-17  603  
98b5c10d320adf Jean-Christophe Dubois  2010-03-23  604  	return ret;
90586523eb4b34 Eric Paris              2009-05-21  605  }
90586523eb4b34 Eric Paris              2009-05-21  606  EXPORT_SYMBOL_GPL(fsnotify);
90586523eb4b34 Eric Paris              2009-05-21  607  

:::::: The code at line 567 was first introduced by commit
:::::: 07a3b8d0bf726a1e49b050bbc6bd72f031e505fe fsnotify: lazy attach fsnotify_sb_info state to sb

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Jan Kara <jack@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
