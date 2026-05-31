Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D439FD9
	for <oe-kbuild@lists.linux.dev>; Sun, 31 May 2026 00:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780185856; cv=none; b=b3OTE6kZbuZgEDl4XYijSggkyE11WUAqSoQ9JboHmYgHoJ/ZDKN24uJQ7By0l5TBvizXDGc1ieye6OAuCGzJxZHiILGTGg/jFklpONMiEMFsfYy+ZKzMLMHTNyQXH82sobgNCKduK8VW3AY7rwW2tfjk9LfLXhvpXvCmy7VkrMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780185856; c=relaxed/simple;
	bh=955UUZTlW4oD40NEl85P8PjI5JYTvNYPOGUNtHRATQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=olidlpeiShGcpDumA4dlmk/dFlD61kC29hlkUPvkrdesOagdf4Re1GpeU8EtSdDBGux/EFjm7SLCukirzGDQcZqwxN7kmYvTssUAE4rkK4VWN2K2eDggwTu8ip9V4OhDfApcDDjF2iyYHw5K/jOcmZvYsgQfkxfyZe5m0zv5Ij4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSQMkfNl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSQMkfNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780185852; x=1811721852;
  h=date:from:to:cc:subject:message-id;
  bh=955UUZTlW4oD40NEl85P8PjI5JYTvNYPOGUNtHRATQQ=;
  b=cSQMkfNl4qXKewcRYFbnh7U6YtiHj30SQW4LEpuNzurEou+pGWJlu+iB
   fnCz0D4Mvg4UYoqAtiNBrqxOvzr00i8t3L7zQI0CvibjTexfgjoEEp6mj
   dNNlv4cjIBeR2r4fm1mGdAYvlA4vVYzw/v0aLmHd/8P8fjpWe5m6au3eX
   BLj1Uuk85/8uDuhoJ7Bt9VbCb2rixgw1zHj0j6M2+DhuR0zPDzCRzbY6j
   NtcKyBlz3DzM+8bMN2xqceXDJbu4DgyK3iucusqTCe/3fEO5W5r5XHVMO
   V8567Fasail0iKnw2aSrCWkYLP6KBoUQD5qdVWSoGgjEM+FcH137dHw2E
   g==;
X-CSE-ConnectionGUID: geimOE/+TvCMckZkZ+x3dg==
X-CSE-MsgGUID: Vg2hO+d3Q9+wNgixTYQvEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="83568897"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="83568897"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 17:04:11 -0700
X-CSE-ConnectionGUID: r0wzJsW0SjWbmetb9CHgTg==
X-CSE-MsgGUID: 4dPG8p2LSQWXqztALgaQ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="242391230"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2026 17:04:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTTex-000000008zw-3BnV;
	Sun, 31 May 2026 00:04:07 +0000
Date: Sun, 31 May 2026 08:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/notify/fsnotify.c:567 fsnotify() error: we previously
 assumed 'sbinfo->sb_marks' could be null (see line 535)
Message-ID: <202605310846.ZEiFrY92-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: Will Deacon <will@kernel.org>
CC: David Laight <david.laight.linux@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d87d0fc8c8e0a2a2b5026a169db2f270b4828c1
commit: 773b24bcedc16a4a29e8579d66ec67ca7aa0014f arm64, compiler-context-analysis: Permit alias analysis through __READ_ONCE() with CONFIG_LTO=y
date:   3 months ago
:::::: branch date: 83 minutes ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r072-20260530 (https://download.01.org/0day-ci/archive/20260531/202605310846.ZEiFrY92-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 773b24bcedc1 ("arm64, compiler-context-analysis: Permit alias analysis through __READ_ONCE() with CONFIG_LTO=y")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605310846.ZEiFrY92-lkp@intel.com/

smatch warnings:
fs/notify/fsnotify.c:567 fsnotify() error: we previously assumed 'sbinfo->sb_marks' could be null (see line 535)
fs/notify/fsnotify.c:571 fsnotify() error: we previously assumed 'mnt->mnt_fsnotify_marks' could be null (see line 536)
fs/notify/fsnotify.c:575 fsnotify() error: we previously assumed 'inode->i_fsnotify_marks' could be null (see line 537)
fs/notify/fsnotify.c:579 fsnotify() error: we previously assumed 'inode2->i_fsnotify_marks' could be null (see line 538)
fs/notify/fsnotify.c:583 fsnotify() error: we previously assumed 'mnt_data->ns->n_fsnotify_marks' could be null (see line 539)
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift

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
