Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89B22747B
	for <oe-kbuild@lists.linux.dev>; Sun, 11 May 2025 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746991045; cv=none; b=Y+SlJ+U2R1d3JusEq/+/WtXTGYkKc64cUTUEwG5oRgUA++X1yzsMSaAJJgJ4Y3H4ZgXmHtymSc0FnPYWKxm7/698+IHeMfUJPvritppg6mmvJxjCQNKEi3pCesg/4MlnVCsgq/TP42ijHqPuTpvqV3Tyn7CQDNnoWNFB3nYPuJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746991045; c=relaxed/simple;
	bh=x5eunNlA0OZeqUcCqR4Ds1ayUfzyqsXhSggFmt1ibfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FwviPRoC9+mzjfe3ito6i9zt/w060Cq0OG/m7M6tKI0lvzOYE6ofN73FTecFqSD2tyxgwg1iqyUqQ4O/wjRfSykuzyJlLcqknAiWK9nUwu8Ria2u+4+105G1Ac9vXyOvDD1eHG1sR601jrFJpck8EaabIU6UNhEjakVc11IA6bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIsRmI8R; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIsRmI8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746991042; x=1778527042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x5eunNlA0OZeqUcCqR4Ds1ayUfzyqsXhSggFmt1ibfY=;
  b=EIsRmI8RjLExZ6bQ9cZY/GDIEXUzaTkK1lTQi+eAB247SERfRQWxAMcc
   HxZJ3FhXlagmcMcwqi6p/Haapct0SH14zee+0aPuElbtJiPWwASI69ocy
   bZhHusxTMyYxQndhfko5GWI4OP0T2yG7BSfQ2ZecG2So3RvBuuY7xRUje
   mRxbtGrRVbJM53ljK/prH5Xo4BkvoCkjZhTOZYiIsfECj5895wyhKxWfG
   FR3O6UlwMZd+R/FDeqWhkCT/IPJiFxhCJ9Dx05G68i7qlgjPwyEznaT+T
   uAv7AS1UH8AtBXVfMvX0gNovgS7v/PfjYxZ6XzavCqY964uaL8mKRNbos
   Q==;
X-CSE-ConnectionGUID: PLCZUJqPQvyMALhqsaHjdA==
X-CSE-MsgGUID: Ngx+UYTmRiKsygnM0NFH/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="59007991"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="59007991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 12:17:20 -0700
X-CSE-ConnectionGUID: lbUFwb3qQYSQv6vrg5DLng==
X-CSE-MsgGUID: 83no3Ic6QKKY3D3pJz/DWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="160424954"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 May 2025 12:17:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uECAm-000DxT-1z;
	Sun, 11 May 2025 19:17:16 +0000
Date: Mon, 12 May 2025 03:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:work.coredump.socket.tmp 11/17]
 fs/coredump.c:974:57: sparse: sparse: invalid initializer
Message-ID: <202505120322.9QS6XiSn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/coredump.c:974:57: sparse: sparse: invalid initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.coredump.socket.tmp
head:   35c4ddb37fc4f2ba3ada4ef8eb64e849f82c702b
commit: 8d89644075ddc43d0a8ea35a401366e981fe43a0 [11/17] coredump: add coredump socket
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arc-randconfig-r113-20250511 (https://download.01.org/0day-ci/archive/20250512/202505120322.9QS6XiSn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250512/202505120322.9QS6XiSn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505120322.9QS6XiSn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/coredump.c:476:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:476:27: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:476:27: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:485:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:485:29: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:485:29: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:524:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:524:31: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:524:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:529:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:529:33: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:529:33: sparse:     got struct spinlock [noderef] __rcu *
>> fs/coredump.c:974:57: sparse: sparse: invalid initializer

vim +974 fs/coredump.c

8d89644075ddc4 Christian Brauner            2025-05-05  661  
a78282e2c94f4c Linus Torvalds               2024-09-26  662  void do_coredump(const kernel_siginfo_t *siginfo)
10c28d937e2cca Alex Kelly                   2012-09-26  663  {
10c28d937e2cca Alex Kelly                   2012-09-26  664  	struct core_state core_state;
10c28d937e2cca Alex Kelly                   2012-09-26  665  	struct core_name cn;
10c28d937e2cca Alex Kelly                   2012-09-26  666  	struct mm_struct *mm = current->mm;
10c28d937e2cca Alex Kelly                   2012-09-26  667  	struct linux_binfmt * binfmt;
10c28d937e2cca Alex Kelly                   2012-09-26  668  	const struct cred *old_cred;
10c28d937e2cca Alex Kelly                   2012-09-26  669  	struct cred *cred;
a78282e2c94f4c Linus Torvalds               2024-09-26  670  	int retval = 0;
315c69261dd3fa Paul Wise                    2019-08-02  671  	size_t *argv = NULL;
315c69261dd3fa Paul Wise                    2019-08-02  672  	int argc = 0;
fbb1816942c044 Jann Horn                    2015-09-09  673  	/* require nonrelative corefile path and be extra careful */
fbb1816942c044 Jann Horn                    2015-09-09  674  	bool need_suid_safe = false;
acdedd99b0f3bf Oleg Nesterov                2013-04-30  675  	bool core_dumped = false;
10c28d937e2cca Alex Kelly                   2012-09-26  676  	static atomic_t core_dump_count = ATOMIC_INIT(0);
10c28d937e2cca Alex Kelly                   2012-09-26  677  	struct coredump_params cprm = {
5ab1c309b34488 Denys Vlasenko               2012-10-04  678  		.siginfo = siginfo,
10c28d937e2cca Alex Kelly                   2012-09-26  679  		.limit = rlimit(RLIMIT_CORE),
10c28d937e2cca Alex Kelly                   2012-09-26  680  		/*
10c28d937e2cca Alex Kelly                   2012-09-26  681  		 * We must use the same mm->flags while dumping core to avoid
10c28d937e2cca Alex Kelly                   2012-09-26  682  		 * inconsistency of bit flags, since this flag is not protected
10c28d937e2cca Alex Kelly                   2012-09-26  683  		 * by any locks.
10c28d937e2cca Alex Kelly                   2012-09-26  684  		 */
10c28d937e2cca Alex Kelly                   2012-09-26  685  		.mm_flags = mm->flags,
95c5436a488384 Eric W. Biederman            2022-03-08  686  		.vma_meta = NULL,
8603b6f58637ce Oleksandr Natalenko          2022-09-03  687  		.cpu = raw_smp_processor_id(),
10c28d937e2cca Alex Kelly                   2012-09-26  688  	};
10c28d937e2cca Alex Kelly                   2012-09-26  689  
5ab1c309b34488 Denys Vlasenko               2012-10-04  690  	audit_core_dumps(siginfo->si_signo);
10c28d937e2cca Alex Kelly                   2012-09-26  691  
10c28d937e2cca Alex Kelly                   2012-09-26  692  	binfmt = mm->binfmt;
a78282e2c94f4c Linus Torvalds               2024-09-26  693  	if (!binfmt || !binfmt->core_dump)
10c28d937e2cca Alex Kelly                   2012-09-26  694  		goto fail;
a78282e2c94f4c Linus Torvalds               2024-09-26  695  	if (!__get_dumpable(cprm.mm_flags))
10c28d937e2cca Alex Kelly                   2012-09-26  696  		goto fail;
10c28d937e2cca Alex Kelly                   2012-09-26  697  
10c28d937e2cca Alex Kelly                   2012-09-26  698  	cred = prepare_creds();
a78282e2c94f4c Linus Torvalds               2024-09-26  699  	if (!cred)
10c28d937e2cca Alex Kelly                   2012-09-26  700  		goto fail;
10c28d937e2cca Alex Kelly                   2012-09-26  701  	/*
10c28d937e2cca Alex Kelly                   2012-09-26  702  	 * We cannot trust fsuid as being the "true" uid of the process
10c28d937e2cca Alex Kelly                   2012-09-26  703  	 * nor do we know its entire history. We only know it was tainted
10c28d937e2cca Alex Kelly                   2012-09-26  704  	 * so we dump it as root in mode 2, and only into a controlled
10c28d937e2cca Alex Kelly                   2012-09-26  705  	 * environment (pipe handler or fully qualified path).
10c28d937e2cca Alex Kelly                   2012-09-26  706  	 */
e579d2c259be42 Kees Cook                    2013-02-27  707  	if (__get_dumpable(cprm.mm_flags) == SUID_DUMP_ROOT) {
10c28d937e2cca Alex Kelly                   2012-09-26  708  		/* Setuid core dump mode */
10c28d937e2cca Alex Kelly                   2012-09-26  709  		cred->fsuid = GLOBAL_ROOT_UID;	/* Dump root private */
fbb1816942c044 Jann Horn                    2015-09-09  710  		need_suid_safe = true;
10c28d937e2cca Alex Kelly                   2012-09-26  711  	}
10c28d937e2cca Alex Kelly                   2012-09-26  712  
5ab1c309b34488 Denys Vlasenko               2012-10-04  713  	retval = coredump_wait(siginfo->si_signo, &core_state);
10c28d937e2cca Alex Kelly                   2012-09-26  714  	if (retval < 0)
10c28d937e2cca Alex Kelly                   2012-09-26  715  		goto fail_creds;
10c28d937e2cca Alex Kelly                   2012-09-26  716  
10c28d937e2cca Alex Kelly                   2012-09-26  717  	old_cred = override_creds(cred);
10c28d937e2cca Alex Kelly                   2012-09-26  718  
6c4baec3c5c3c9 Christian Brauner            2025-04-28  719  	retval = format_corename(&cn, &cprm, &argv, &argc);
6c4baec3c5c3c9 Christian Brauner            2025-04-28  720  	if (retval < 0) {
6c4baec3c5c3c9 Christian Brauner            2025-04-28  721  		coredump_report_failure("format_corename failed, aborting core");
6c4baec3c5c3c9 Christian Brauner            2025-04-28  722  		goto fail_unlock;
6c4baec3c5c3c9 Christian Brauner            2025-04-28  723  	}
10c28d937e2cca Alex Kelly                   2012-09-26  724  
ce72186449bbd3 Christian Brauner            2025-04-28  725  	switch (cn.core_type) {
ce72186449bbd3 Christian Brauner            2025-04-28  726  	case COREDUMP_FILE: {
abf08576afe315 Christian Brauner            2023-01-13  727  		struct mnt_idmap *idmap;
10c28d937e2cca Alex Kelly                   2012-09-26  728  		struct inode *inode;
88e4607034ee49 Vladimir Sementsov-Ogievskiy 2023-04-20  729  		int open_flags = O_CREAT | O_WRONLY | O_NOFOLLOW |
378c6520e7d292 Jann Horn                    2016-03-22  730  				 O_LARGEFILE | O_EXCL;
10c28d937e2cca Alex Kelly                   2012-09-26  731  
a78282e2c94f4c Linus Torvalds               2024-09-26  732  		if (cprm.limit < binfmt->min_coredump)
10c28d937e2cca Alex Kelly                   2012-09-26  733  			goto fail_unlock;
10c28d937e2cca Alex Kelly                   2012-09-26  734  
fbb1816942c044 Jann Horn                    2015-09-09  735  		if (need_suid_safe && cn.corename[0] != '/') {
c114e9948c2b6a Roman Kisel                  2024-07-18  736  			coredump_report_failure(
c114e9948c2b6a Roman Kisel                  2024-07-18  737  				"this process can only dump core to a fully qualified path, skipping core dump");
10c28d937e2cca Alex Kelly                   2012-09-26  738  			goto fail_unlock;
10c28d937e2cca Alex Kelly                   2012-09-26  739  		}
10c28d937e2cca Alex Kelly                   2012-09-26  740  
fbb1816942c044 Jann Horn                    2015-09-09  741  		/*
fbb1816942c044 Jann Horn                    2015-09-09  742  		 * Unlink the file if it exists unless this is a SUID
fbb1816942c044 Jann Horn                    2015-09-09  743  		 * binary - in that case, we're running around with root
fbb1816942c044 Jann Horn                    2015-09-09  744  		 * privs and don't want to unlink another user's coredump.
fbb1816942c044 Jann Horn                    2015-09-09  745  		 */
fbb1816942c044 Jann Horn                    2015-09-09  746  		if (!need_suid_safe) {
fbb1816942c044 Jann Horn                    2015-09-09  747  			/*
fbb1816942c044 Jann Horn                    2015-09-09  748  			 * If it doesn't exist, that's fine. If there's some
fbb1816942c044 Jann Horn                    2015-09-09  749  			 * other problem, we'll catch it at the filp_open().
fbb1816942c044 Jann Horn                    2015-09-09  750  			 */
96271654f55c74 Christoph Hellwig            2017-11-04  751  			do_unlinkat(AT_FDCWD, getname_kernel(cn.corename));
fbb1816942c044 Jann Horn                    2015-09-09  752  		}
fbb1816942c044 Jann Horn                    2015-09-09  753  
fbb1816942c044 Jann Horn                    2015-09-09  754  		/*
fbb1816942c044 Jann Horn                    2015-09-09  755  		 * There is a race between unlinking and creating the
fbb1816942c044 Jann Horn                    2015-09-09  756  		 * file, but if that causes an EEXIST here, that's
fbb1816942c044 Jann Horn                    2015-09-09  757  		 * fine - another process raced with us while creating
fbb1816942c044 Jann Horn                    2015-09-09  758  		 * the corefile, and the other process won. To userspace,
fbb1816942c044 Jann Horn                    2015-09-09  759  		 * what matters is that at least one of the two processes
fbb1816942c044 Jann Horn                    2015-09-09  760  		 * writes its coredump successfully, not which one.
fbb1816942c044 Jann Horn                    2015-09-09  761  		 */
378c6520e7d292 Jann Horn                    2016-03-22  762  		if (need_suid_safe) {
378c6520e7d292 Jann Horn                    2016-03-22  763  			/*
378c6520e7d292 Jann Horn                    2016-03-22  764  			 * Using user namespaces, normal user tasks can change
378c6520e7d292 Jann Horn                    2016-03-22  765  			 * their current->fs->root to point to arbitrary
378c6520e7d292 Jann Horn                    2016-03-22  766  			 * directories. Since the intention of the "only dump
378c6520e7d292 Jann Horn                    2016-03-22  767  			 * with a fully qualified path" rule is to control where
378c6520e7d292 Jann Horn                    2016-03-22  768  			 * coredumps may be placed using root privileges,
378c6520e7d292 Jann Horn                    2016-03-22  769  			 * current->fs->root must not be used. Instead, use the
378c6520e7d292 Jann Horn                    2016-03-22  770  			 * root directory of init_task.
378c6520e7d292 Jann Horn                    2016-03-22  771  			 */
378c6520e7d292 Jann Horn                    2016-03-22  772  			struct path root;
378c6520e7d292 Jann Horn                    2016-03-22  773  
378c6520e7d292 Jann Horn                    2016-03-22  774  			task_lock(&init_task);
378c6520e7d292 Jann Horn                    2016-03-22  775  			get_fs_root(init_task.fs, &root);
378c6520e7d292 Jann Horn                    2016-03-22  776  			task_unlock(&init_task);
ffb37ca3bd16ce Al Viro                      2021-04-01  777  			cprm.file = file_open_root(&root, cn.corename,
ffb37ca3bd16ce Al Viro                      2021-04-01  778  						   open_flags, 0600);
378c6520e7d292 Jann Horn                    2016-03-22  779  			path_put(&root);
378c6520e7d292 Jann Horn                    2016-03-22  780  		} else {
378c6520e7d292 Jann Horn                    2016-03-22  781  			cprm.file = filp_open(cn.corename, open_flags, 0600);
378c6520e7d292 Jann Horn                    2016-03-22  782  		}
a78282e2c94f4c Linus Torvalds               2024-09-26  783  		if (IS_ERR(cprm.file))
10c28d937e2cca Alex Kelly                   2012-09-26  784  			goto fail_unlock;
10c28d937e2cca Alex Kelly                   2012-09-26  785  
496ad9aa8ef448 Al Viro                      2013-01-23  786  		inode = file_inode(cprm.file);
a78282e2c94f4c Linus Torvalds               2024-09-26  787  		if (inode->i_nlink > 1)
10c28d937e2cca Alex Kelly                   2012-09-26  788  			goto close_fail;
a78282e2c94f4c Linus Torvalds               2024-09-26  789  		if (d_unhashed(cprm.file->f_path.dentry))
10c28d937e2cca Alex Kelly                   2012-09-26  790  			goto close_fail;
10c28d937e2cca Alex Kelly                   2012-09-26  791  		/*
10c28d937e2cca Alex Kelly                   2012-09-26  792  		 * AK: actually i see no reason to not allow this for named
10c28d937e2cca Alex Kelly                   2012-09-26  793  		 * pipes etc, but keep the previous behaviour for now.
10c28d937e2cca Alex Kelly                   2012-09-26  794  		 */
a78282e2c94f4c Linus Torvalds               2024-09-26  795  		if (!S_ISREG(inode->i_mode))
10c28d937e2cca Alex Kelly                   2012-09-26  796  			goto close_fail;
10c28d937e2cca Alex Kelly                   2012-09-26  797  		/*
40f705a736eac1 Jann Horn                    2015-09-09  798  		 * Don't dump core if the filesystem changed owner or mode
40f705a736eac1 Jann Horn                    2015-09-09  799  		 * of the file during file creation. This is an issue when
40f705a736eac1 Jann Horn                    2015-09-09  800  		 * a process dumps core while its cwd is e.g. on a vfat
40f705a736eac1 Jann Horn                    2015-09-09  801  		 * filesystem.
10c28d937e2cca Alex Kelly                   2012-09-26  802  		 */
abf08576afe315 Christian Brauner            2023-01-13  803  		idmap = file_mnt_idmap(cprm.file);
e67fe63341b811 Christian Brauner            2023-01-13  804  		if (!vfsuid_eq_kuid(i_uid_into_vfsuid(idmap, inode),
dbd9d6f8fa9c3e David Oberhollenzer          2021-09-07  805  				    current_fsuid())) {
c114e9948c2b6a Roman Kisel                  2024-07-18  806  			coredump_report_failure("Core dump to %s aborted: "
c114e9948c2b6a Roman Kisel                  2024-07-18  807  				"cannot preserve file owner", cn.corename);
10c28d937e2cca Alex Kelly                   2012-09-26  808  			goto close_fail;
dbd9d6f8fa9c3e David Oberhollenzer          2021-09-07  809  		}
dbd9d6f8fa9c3e David Oberhollenzer          2021-09-07  810  		if ((inode->i_mode & 0677) != 0600) {
c114e9948c2b6a Roman Kisel                  2024-07-18  811  			coredump_report_failure("Core dump to %s aborted: "
c114e9948c2b6a Roman Kisel                  2024-07-18  812  				"cannot preserve file permissions", cn.corename);
40f705a736eac1 Jann Horn                    2015-09-09  813  			goto close_fail;
dbd9d6f8fa9c3e David Oberhollenzer          2021-09-07  814  		}
a78282e2c94f4c Linus Torvalds               2024-09-26  815  		if (!(cprm.file->f_mode & FMODE_CAN_WRITE))
10c28d937e2cca Alex Kelly                   2012-09-26  816  			goto close_fail;
a78282e2c94f4c Linus Torvalds               2024-09-26  817  		if (do_truncate(idmap, cprm.file->f_path.dentry,
a78282e2c94f4c Linus Torvalds               2024-09-26  818  				0, 0, cprm.file))
10c28d937e2cca Alex Kelly                   2012-09-26  819  			goto close_fail;
ce72186449bbd3 Christian Brauner            2025-04-28  820  		break;
ce72186449bbd3 Christian Brauner            2025-04-28  821  	}
ce72186449bbd3 Christian Brauner            2025-04-28  822  	case COREDUMP_PIPE: {
ce72186449bbd3 Christian Brauner            2025-04-28  823  		int argi;
ce72186449bbd3 Christian Brauner            2025-04-28  824  		int dump_count;
ce72186449bbd3 Christian Brauner            2025-04-28  825  		char **helper_argv;
ce72186449bbd3 Christian Brauner            2025-04-28  826  		struct subprocess_info *sub_info;
ce72186449bbd3 Christian Brauner            2025-04-28  827  
ce72186449bbd3 Christian Brauner            2025-04-28  828  		if (cprm.limit == 1) {
ce72186449bbd3 Christian Brauner            2025-04-28  829  			/* See umh_coredump_setup() which sets RLIMIT_CORE = 1.
ce72186449bbd3 Christian Brauner            2025-04-28  830  			 *
ce72186449bbd3 Christian Brauner            2025-04-28  831  			 * Normally core limits are irrelevant to pipes, since
ce72186449bbd3 Christian Brauner            2025-04-28  832  			 * we're not writing to the file system, but we use
ce72186449bbd3 Christian Brauner            2025-04-28  833  			 * cprm.limit of 1 here as a special value, this is a
ce72186449bbd3 Christian Brauner            2025-04-28  834  			 * consistent way to catch recursive crashes.
ce72186449bbd3 Christian Brauner            2025-04-28  835  			 * We can still crash if the core_pattern binary sets
ce72186449bbd3 Christian Brauner            2025-04-28  836  			 * RLIM_CORE = !1, but it runs as root, and can do
ce72186449bbd3 Christian Brauner            2025-04-28  837  			 * lots of stupid things.
ce72186449bbd3 Christian Brauner            2025-04-28  838  			 *
ce72186449bbd3 Christian Brauner            2025-04-28  839  			 * Note that we use task_tgid_vnr here to grab the pid
ce72186449bbd3 Christian Brauner            2025-04-28  840  			 * of the process group leader.  That way we get the
ce72186449bbd3 Christian Brauner            2025-04-28  841  			 * right pid if a thread in a multi-threaded
ce72186449bbd3 Christian Brauner            2025-04-28  842  			 * core_pattern process dies.
ce72186449bbd3 Christian Brauner            2025-04-28  843  			 */
ce72186449bbd3 Christian Brauner            2025-04-28  844  			coredump_report_failure("RLIMIT_CORE is set to 1, aborting core");
ce72186449bbd3 Christian Brauner            2025-04-28  845  			goto fail_unlock;
ce72186449bbd3 Christian Brauner            2025-04-28  846  		}
ce72186449bbd3 Christian Brauner            2025-04-28  847  		cprm.limit = RLIM_INFINITY;
ce72186449bbd3 Christian Brauner            2025-04-28  848  
ce72186449bbd3 Christian Brauner            2025-04-28  849  		dump_count = atomic_inc_return(&core_dump_count);
ce72186449bbd3 Christian Brauner            2025-04-28  850  		if (core_pipe_limit && (core_pipe_limit < dump_count)) {
ce72186449bbd3 Christian Brauner            2025-04-28  851  			coredump_report_failure("over core_pipe_limit, skipping core dump");
ce72186449bbd3 Christian Brauner            2025-04-28  852  			goto fail_dropcount;
ce72186449bbd3 Christian Brauner            2025-04-28  853  		}
ce72186449bbd3 Christian Brauner            2025-04-28  854  
ce72186449bbd3 Christian Brauner            2025-04-28  855  		helper_argv = kmalloc_array(argc + 1, sizeof(*helper_argv),
ce72186449bbd3 Christian Brauner            2025-04-28  856  					    GFP_KERNEL);
ce72186449bbd3 Christian Brauner            2025-04-28  857  		if (!helper_argv) {
ce72186449bbd3 Christian Brauner            2025-04-28  858  			coredump_report_failure("%s failed to allocate memory", __func__);
ce72186449bbd3 Christian Brauner            2025-04-28  859  			goto fail_dropcount;
ce72186449bbd3 Christian Brauner            2025-04-28  860  		}
ce72186449bbd3 Christian Brauner            2025-04-28  861  		for (argi = 0; argi < argc; argi++)
ce72186449bbd3 Christian Brauner            2025-04-28  862  			helper_argv[argi] = cn.corename + argv[argi];
ce72186449bbd3 Christian Brauner            2025-04-28  863  		helper_argv[argi] = NULL;
ce72186449bbd3 Christian Brauner            2025-04-28  864  
ce72186449bbd3 Christian Brauner            2025-04-28  865  		retval = -ENOMEM;
ce72186449bbd3 Christian Brauner            2025-04-28  866  		sub_info = call_usermodehelper_setup(helper_argv[0],
ce72186449bbd3 Christian Brauner            2025-04-28  867  						helper_argv, NULL, GFP_KERNEL,
ce72186449bbd3 Christian Brauner            2025-04-28  868  						umh_coredump_setup, NULL, &cprm);
ce72186449bbd3 Christian Brauner            2025-04-28  869  		if (sub_info)
ce72186449bbd3 Christian Brauner            2025-04-28  870  			retval = call_usermodehelper_exec(sub_info,
ce72186449bbd3 Christian Brauner            2025-04-28  871  							  UMH_WAIT_EXEC);
ce72186449bbd3 Christian Brauner            2025-04-28  872  
ce72186449bbd3 Christian Brauner            2025-04-28  873  		kfree(helper_argv);
ce72186449bbd3 Christian Brauner            2025-04-28  874  		if (retval) {
ce72186449bbd3 Christian Brauner            2025-04-28  875  			coredump_report_failure("|%s pipe failed", cn.corename);
ce72186449bbd3 Christian Brauner            2025-04-28  876  			goto close_fail;
ce72186449bbd3 Christian Brauner            2025-04-28  877  		}
ce72186449bbd3 Christian Brauner            2025-04-28  878  		break;
ce72186449bbd3 Christian Brauner            2025-04-28  879  	}
8d89644075ddc4 Christian Brauner            2025-05-05  880  	case COREDUMP_SOCK: {
8d89644075ddc4 Christian Brauner            2025-05-05  881  #ifdef CONFIG_UNIX
8d89644075ddc4 Christian Brauner            2025-05-05  882  		struct file *file __free(fput) = NULL;
8d89644075ddc4 Christian Brauner            2025-05-05  883  		struct socket *socket;
8d89644075ddc4 Christian Brauner            2025-05-05  884  
8d89644075ddc4 Christian Brauner            2025-05-05  885  		/*
8d89644075ddc4 Christian Brauner            2025-05-05  886  		 * It is possible that the userspace process which is
8d89644075ddc4 Christian Brauner            2025-05-05  887  		 * supposed to handle the coredump and is listening on
8d89644075ddc4 Christian Brauner            2025-05-05  888  		 * the AF_UNIX socket coredumps. Userspace should just
8d89644075ddc4 Christian Brauner            2025-05-05  889  		 * mark itself non dumpable.
8d89644075ddc4 Christian Brauner            2025-05-05  890  		 */
8d89644075ddc4 Christian Brauner            2025-05-05  891  
8d89644075ddc4 Christian Brauner            2025-05-05  892  		retval = sock_create_kern(&init_net, AF_UNIX, SOCK_STREAM, 0, &socket);
8d89644075ddc4 Christian Brauner            2025-05-05  893  		if (retval < 0)
8d89644075ddc4 Christian Brauner            2025-05-05  894  			goto close_fail;
8d89644075ddc4 Christian Brauner            2025-05-05  895  
8d89644075ddc4 Christian Brauner            2025-05-05  896  		file = sock_alloc_file(socket, 0, NULL);
8d89644075ddc4 Christian Brauner            2025-05-05  897  		if (IS_ERR(file)) {
8d89644075ddc4 Christian Brauner            2025-05-05  898  			sock_release(socket);
8d89644075ddc4 Christian Brauner            2025-05-05  899  			goto close_fail;
8d89644075ddc4 Christian Brauner            2025-05-05  900  		}
8d89644075ddc4 Christian Brauner            2025-05-05  901  
8d89644075ddc4 Christian Brauner            2025-05-05  902  		retval = kernel_connect(socket,
8d89644075ddc4 Christian Brauner            2025-05-05  903  					(struct sockaddr *)(&coredump_unix_socket),
8d89644075ddc4 Christian Brauner            2025-05-05  904  					COREDUMP_UNIX_SOCKET_ADDR_SIZE, O_NONBLOCK);
8d89644075ddc4 Christian Brauner            2025-05-05  905  		if (retval) {
8d89644075ddc4 Christian Brauner            2025-05-05  906  			if (retval == -EAGAIN)
8d89644075ddc4 Christian Brauner            2025-05-05  907  				coredump_report_failure("Skipping as coredump socket connection %s couldn't complete immediately", cn.corename);
8d89644075ddc4 Christian Brauner            2025-05-05  908  			goto close_fail;
8d89644075ddc4 Christian Brauner            2025-05-05  909  		}
8d89644075ddc4 Christian Brauner            2025-05-05  910  
8d89644075ddc4 Christian Brauner            2025-05-05  911  		cprm.limit = RLIM_INFINITY;
8d89644075ddc4 Christian Brauner            2025-05-05  912  		cprm.file = no_free_ptr(file);
8d89644075ddc4 Christian Brauner            2025-05-05  913  #else
8d89644075ddc4 Christian Brauner            2025-05-05  914  		coredump_report_failure("Core dump socket support %s disabled", cn.corename);
8d89644075ddc4 Christian Brauner            2025-05-05  915  		goto close_fail;
8d89644075ddc4 Christian Brauner            2025-05-05  916  #endif
8d89644075ddc4 Christian Brauner            2025-05-05  917  		break;
8d89644075ddc4 Christian Brauner            2025-05-05  918  	}
ce72186449bbd3 Christian Brauner            2025-04-28  919  	default:
ce72186449bbd3 Christian Brauner            2025-04-28  920  		WARN_ON_ONCE(true);
ce72186449bbd3 Christian Brauner            2025-04-28  921  		goto close_fail;
10c28d937e2cca Alex Kelly                   2012-09-26  922  	}
10c28d937e2cca Alex Kelly                   2012-09-26  923  
10c28d937e2cca Alex Kelly                   2012-09-26  924  	/* get us an unshared descriptor table; almost always a no-op */
c39ab6de227306 Eric W. Biederman            2020-11-25  925  	/* The cell spufs coredump code reads the file descriptor tables */
1f702603e7125a Eric W. Biederman            2020-11-20  926  	retval = unshare_files();
10c28d937e2cca Alex Kelly                   2012-09-26  927  	if (retval)
10c28d937e2cca Alex Kelly                   2012-09-26  928  		goto close_fail;
e86d35c38e37eb Al Viro                      2013-05-04  929  	if (!dump_interrupted()) {
3740d93e37902b Luis Chamberlain             2020-04-16  930  		/*
3740d93e37902b Luis Chamberlain             2020-04-16  931  		 * umh disabled with CONFIG_STATIC_USERMODEHELPER_PATH="" would
3740d93e37902b Luis Chamberlain             2020-04-16  932  		 * have this set to NULL.
3740d93e37902b Luis Chamberlain             2020-04-16  933  		 */
3740d93e37902b Luis Chamberlain             2020-04-16  934  		if (!cprm.file) {
c114e9948c2b6a Roman Kisel                  2024-07-18  935  			coredump_report_failure("Core dump to |%s disabled", cn.corename);
3740d93e37902b Luis Chamberlain             2020-04-16  936  			goto close_fail;
3740d93e37902b Luis Chamberlain             2020-04-16  937  		}
a78282e2c94f4c Linus Torvalds               2024-09-26  938  		if (!dump_vma_snapshot(&cprm))
95c5436a488384 Eric W. Biederman            2022-03-08  939  			goto close_fail;
95c5436a488384 Eric W. Biederman            2022-03-08  940  
03d95eb2f25780 Al Viro                      2013-03-20  941  		file_start_write(cprm.file);
e86d35c38e37eb Al Viro                      2013-05-04  942  		core_dumped = binfmt->core_dump(&cprm);
d0f1088b31db2d Al Viro                      2020-03-08  943  		/*
d0f1088b31db2d Al Viro                      2020-03-08  944  		 * Ensures that file size is big enough to contain the current
d0f1088b31db2d Al Viro                      2020-03-08  945  		 * file postion. This prevents gdb from complaining about
d0f1088b31db2d Al Viro                      2020-03-08  946  		 * a truncated file if the last "write" to the file was
d0f1088b31db2d Al Viro                      2020-03-08  947  		 * dump_skip.
d0f1088b31db2d Al Viro                      2020-03-08  948  		 */
d0f1088b31db2d Al Viro                      2020-03-08  949  		if (cprm.to_skip) {
d0f1088b31db2d Al Viro                      2020-03-08  950  			cprm.to_skip--;
d0f1088b31db2d Al Viro                      2020-03-08  951  			dump_emit(&cprm, "", 1);
d0f1088b31db2d Al Viro                      2020-03-08  952  		}
03d95eb2f25780 Al Viro                      2013-03-20  953  		file_end_write(cprm.file);
390031c942116d Eric W. Biederman            2022-03-08  954  		free_vma_snapshot(&cprm);
e86d35c38e37eb Al Viro                      2013-05-04  955  	}
8d89644075ddc4 Christian Brauner            2025-05-05  956  
8d89644075ddc4 Christian Brauner            2025-05-05  957  	/*
8d89644075ddc4 Christian Brauner            2025-05-05  958  	 * When core_pipe_limit is set we wait for the coredump server
8d89644075ddc4 Christian Brauner            2025-05-05  959  	 * or usermodehelper to finish before exiting so it can e.g.,
8d89644075ddc4 Christian Brauner            2025-05-05  960  	 * inspect /proc/<pid>.
8d89644075ddc4 Christian Brauner            2025-05-05  961  	 */
8d89644075ddc4 Christian Brauner            2025-05-05  962  	if (core_pipe_limit) {
8d89644075ddc4 Christian Brauner            2025-05-05  963  		switch (cn.core_type) {
8d89644075ddc4 Christian Brauner            2025-05-05  964  		case COREDUMP_PIPE:
10c28d937e2cca Alex Kelly                   2012-09-26  965  			wait_for_dump_helpers(cprm.file);
8d89644075ddc4 Christian Brauner            2025-05-05  966  			break;
8d89644075ddc4 Christian Brauner            2025-05-05  967  		case COREDUMP_SOCK: {
8d89644075ddc4 Christian Brauner            2025-05-05  968  			/*
8d89644075ddc4 Christian Brauner            2025-05-05  969  			 * We use a simple read to wait for the coredump
8d89644075ddc4 Christian Brauner            2025-05-05  970  			 * processing to finish. Either the socket is
8d89644075ddc4 Christian Brauner            2025-05-05  971  			 * closed or we get sent unexpected data. In
8d89644075ddc4 Christian Brauner            2025-05-05  972  			 * both cases, we're done.
8d89644075ddc4 Christian Brauner            2025-05-05  973  			 */
8d89644075ddc4 Christian Brauner            2025-05-05 @974  			__kernel_read(cprm.file, &(char){}, 1, NULL);
8d89644075ddc4 Christian Brauner            2025-05-05  975  			break;
8d89644075ddc4 Christian Brauner            2025-05-05  976  		}
8d89644075ddc4 Christian Brauner            2025-05-05  977  		default:
8d89644075ddc4 Christian Brauner            2025-05-05  978  			break;
8d89644075ddc4 Christian Brauner            2025-05-05  979  		}
8d89644075ddc4 Christian Brauner            2025-05-05  980  	}
8d89644075ddc4 Christian Brauner            2025-05-05  981  
10c28d937e2cca Alex Kelly                   2012-09-26  982  close_fail:
10c28d937e2cca Alex Kelly                   2012-09-26  983  	if (cprm.file)
10c28d937e2cca Alex Kelly                   2012-09-26  984  		filp_close(cprm.file, NULL);
10c28d937e2cca Alex Kelly                   2012-09-26  985  fail_dropcount:
6c4baec3c5c3c9 Christian Brauner            2025-04-28  986  	if (cn.core_type == COREDUMP_PIPE)
10c28d937e2cca Alex Kelly                   2012-09-26  987  		atomic_dec(&core_dump_count);
10c28d937e2cca Alex Kelly                   2012-09-26  988  fail_unlock:
315c69261dd3fa Paul Wise                    2019-08-02  989  	kfree(argv);
10c28d937e2cca Alex Kelly                   2012-09-26  990  	kfree(cn.corename);
0258b5fd7c7124 Eric W. Biederman            2021-09-22  991  	coredump_finish(core_dumped);
10c28d937e2cca Alex Kelly                   2012-09-26  992  	revert_creds(old_cred);
10c28d937e2cca Alex Kelly                   2012-09-26  993  fail_creds:
10c28d937e2cca Alex Kelly                   2012-09-26  994  	put_cred(cred);
10c28d937e2cca Alex Kelly                   2012-09-26  995  fail:
a78282e2c94f4c Linus Torvalds               2024-09-26  996  	return;
10c28d937e2cca Alex Kelly                   2012-09-26  997  }
10c28d937e2cca Alex Kelly                   2012-09-26  998  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
