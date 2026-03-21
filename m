Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3268F1D9663
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100293; cv=none; b=jJsOUbXNUMp4QR/bc6DnAp4ctN1WF32Mu0B7nCs8ZwqVRJ7nCidEZXtMcZrx/wbilzm6kJU0HU39D17IqdNy71F/0iWHRYagBaKRYmNREpDwBcFMNGZ4nhIUpefXCAjrLczg8yrXNDOZ0kE5yORFE+YHUPNcdbvFByA9qewUbO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100293; c=relaxed/simple;
	bh=T+A5txz9G/AYmhZxEsRmNGYFRjfmBEM8qhVLx9EWqNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDwNR4LBK9toum1SbIJPzLFB9fjXr7LNa+XW4gztOr0EsJiy08ZL2h7EcjmhMGKwJ0qE2+sitm73xTjvOgf0OCG8UF7ZHVDlu8p2FXYtZP84FiTbHTEwmReVs38b3jL+nT8hLOq7N1H4WIKHK9/xYjP+GBJr7sibHN3FfE2MySk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+fwULBJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+fwULBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774100291; x=1805636291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+A5txz9G/AYmhZxEsRmNGYFRjfmBEM8qhVLx9EWqNA=;
  b=h+fwULBJ0zXerQ+YR5Mfdr2ZeZUfaArgiU7qc03e9DwOB+D+wygycFfc
   NZJKV5hQXMTC059kv+0+oBPJlMZZhQcKZd5pGldM4Z/iv9M6SmWgLr69W
   QyFsFwaHQ9ivjTvVlMSIxvHOF3VBRZhaffDMZwqzliWeXZpf9XoPESZZU
   9kmrmhnSkoyjKoO2YFTV7IsHRnVGNDR29gWAqvkEFl79m3X8rb8oqVVnI
   IvS6jLRZ8vH8hRpDekL5YT5mW/rU+jZkaLvoEIW/P49T+T5YMMMm9aCdT
   Pn06xe2Mx4RkkeWsAU4RbEKBd8Qwd0JKRNoIErz6F7Wh4u1D9QUwhPkvl
   g==;
X-CSE-ConnectionGUID: bKstfCmlRjaiflWS/5Qtpw==
X-CSE-MsgGUID: tUBAn7WbRWqVzjbSzezcdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="85483530"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="85483530"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 06:38:10 -0700
X-CSE-ConnectionGUID: NZlPAgDRQS2JqHDG+hNm2A==
X-CSE-MsgGUID: 4oSTLraASz+E2hXUiQCHiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="228051198"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Mar 2026 06:38:09 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3wWl-000000000pF-1Z8k;
	Sat, 21 Mar 2026 13:38:07 +0000
Date: Sat, 21 Mar 2026 21:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] pidfds: add coredump_code field to pidfd_info
Message-ID: <202603212112.pTkZUTmt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <ab29J6KsQm8Xg3LR@NH27D9T0LF>
References: <ab29J6KsQm8Xg3LR@NH27D9T0LF>
TO: Emanuele Rocca <emanuele.rocca@arm.com>
TO: linux-kernel@vger.kernel.org
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Alexander Viro <viro@zeniv.linux.org.uk>
CC: linux-fsdevel@vger.kernel.org
CC: Mark Brown <broonie@kernel.org>
CC: Jann Horn <jannh@google.com>
CC: Oleg Nesterov <oleg@redhat.com>

Hi Emanuele,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes brauner-vfs/vfs.all linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Emanuele-Rocca/pidfds-add-coredump_code-field-to-pidfd_info/20260321-125434
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/ab29J6KsQm8Xg3LR%40NH27D9T0LF
patch subject: [PATCH] pidfds: add coredump_code field to pidfd_info
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-003-20260321 (https://download.01.org/0day-ci/archive/20260321/202603212112.pTkZUTmt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603212112.pTkZUTmt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603212112.pTkZUTmt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/pidfs.c:350:2: error: call to '__compiletime_assert_431' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(struct pidfd_info) != PIDFD_INFO_SIZE_VER3
     350 |         BUILD_BUG_ON(sizeof(struct pidfd_info) != PIDFD_INFO_SIZE_VER3);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:706:2: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:694:2: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:687:4: note: expanded from macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:35:1: note: expanded from here
      35 | __compiletime_assert_431
         | ^
   1 error generated.


vim +350 fs/pidfs.c

1d8db6fd698de1f Christian Brauner     2025-05-16  327  
dfd78546c95330d Christian Brauner     2025-10-28  328  /* This must be updated whenever a new flag is added */
dfd78546c95330d Christian Brauner     2025-10-28  329  #define PIDFD_INFO_SUPPORTED (PIDFD_INFO_PID | \
dfd78546c95330d Christian Brauner     2025-10-28  330  			      PIDFD_INFO_CREDS | \
dfd78546c95330d Christian Brauner     2025-10-28  331  			      PIDFD_INFO_CGROUPID | \
dfd78546c95330d Christian Brauner     2025-10-28  332  			      PIDFD_INFO_EXIT | \
dfd78546c95330d Christian Brauner     2025-10-28  333  			      PIDFD_INFO_COREDUMP | \
036375522be8425 Christian Brauner     2025-10-28  334  			      PIDFD_INFO_SUPPORTED_MASK | \
9c68e666b0d5e05 Emanuele Rocca        2026-03-20  335  			      PIDFD_INFO_COREDUMP_SIGNAL | \
9c68e666b0d5e05 Emanuele Rocca        2026-03-20  336  			      PIDFD_INFO_COREDUMP_CODE)
dfd78546c95330d Christian Brauner     2025-10-28  337  
7477d7dce48a996 Christian Brauner     2025-03-05  338  static long pidfd_info(struct file *file, unsigned int cmd, unsigned long arg)
cdda1f26e74bac7 Luca Boccassi         2024-10-10  339  {
cdda1f26e74bac7 Luca Boccassi         2024-10-10  340  	struct pidfd_info __user *uinfo = (struct pidfd_info __user *)arg;
0b2d71a7c82628b Adrian Huang (Lenovo  2025-08-14  341) 	struct task_struct *task __free(put_task) = NULL;
7477d7dce48a996 Christian Brauner     2025-03-05  342  	struct pid *pid = pidfd_pid(file);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  343  	size_t usize = _IOC_SIZE(cmd);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  344  	struct pidfd_info kinfo = {};
cdda1f26e74bac7 Luca Boccassi         2024-10-10  345  	struct user_namespace *user_ns;
8ec7c826d97b390 Christian Brauner     2025-06-18  346  	struct pidfs_attr *attr;
cdda1f26e74bac7 Luca Boccassi         2024-10-10  347  	const struct cred *c;
cdda1f26e74bac7 Luca Boccassi         2024-10-10  348  	__u64 mask;
cdda1f26e74bac7 Luca Boccassi         2024-10-10  349  
9c68e666b0d5e05 Emanuele Rocca        2026-03-20 @350  	BUILD_BUG_ON(sizeof(struct pidfd_info) != PIDFD_INFO_SIZE_VER3);
d8fc51d8fa3b989 Christian Brauner     2025-10-28  351  
cdda1f26e74bac7 Luca Boccassi         2024-10-10  352  	if (!uinfo)
cdda1f26e74bac7 Luca Boccassi         2024-10-10  353  		return -EINVAL;
cdda1f26e74bac7 Luca Boccassi         2024-10-10  354  	if (usize < PIDFD_INFO_SIZE_VER0)
cdda1f26e74bac7 Luca Boccassi         2024-10-10  355  		return -EINVAL; /* First version, no smaller struct possible */
cdda1f26e74bac7 Luca Boccassi         2024-10-10  356  
cdda1f26e74bac7 Luca Boccassi         2024-10-10  357  	if (copy_from_user(&mask, &uinfo->mask, sizeof(mask)))
cdda1f26e74bac7 Luca Boccassi         2024-10-10  358  		return -EFAULT;
cdda1f26e74bac7 Luca Boccassi         2024-10-10  359  
7477d7dce48a996 Christian Brauner     2025-03-05  360  	/*
7477d7dce48a996 Christian Brauner     2025-03-05  361  	 * Restrict information retrieval to tasks within the caller's pid
7477d7dce48a996 Christian Brauner     2025-03-05  362  	 * namespace hierarchy.
7477d7dce48a996 Christian Brauner     2025-03-05  363  	 */
7477d7dce48a996 Christian Brauner     2025-03-05  364  	if (!pid_in_current_pidns(pid))
ab89060fbc92edd Luca Boccassi         2026-01-27  365  		return -EREMOTE;
7477d7dce48a996 Christian Brauner     2025-03-05  366  
8ec7c826d97b390 Christian Brauner     2025-06-18  367  	attr = READ_ONCE(pid->attr);
7477d7dce48a996 Christian Brauner     2025-03-05  368  	if (mask & PIDFD_INFO_EXIT) {
ad6e3ea683ef408 Christian Brauner     2025-10-28  369  		if (test_bit(PIDFS_ATTR_BIT_EXIT, &attr->attr_mask)) {
ad6e3ea683ef408 Christian Brauner     2025-10-28  370  			smp_rmb();
7477d7dce48a996 Christian Brauner     2025-03-05  371  			kinfo.mask |= PIDFD_INFO_EXIT;
7477d7dce48a996 Christian Brauner     2025-03-05  372  #ifdef CONFIG_CGROUPS
90df6ff6853b5fc Christian Brauner     2025-10-28  373  			kinfo.cgroupid = attr->cgroupid;
7477d7dce48a996 Christian Brauner     2025-03-05  374  			kinfo.mask |= PIDFD_INFO_CGROUPID;
7477d7dce48a996 Christian Brauner     2025-03-05  375  #endif
90df6ff6853b5fc Christian Brauner     2025-10-28  376  			kinfo.exit_code = attr->exit_code;
7477d7dce48a996 Christian Brauner     2025-03-05  377  		}
7477d7dce48a996 Christian Brauner     2025-03-05  378  	}
7477d7dce48a996 Christian Brauner     2025-03-05  379  
1d8db6fd698de1f Christian Brauner     2025-05-16  380  	if (mask & PIDFD_INFO_COREDUMP) {
036375522be8425 Christian Brauner     2025-10-28  381  		if (test_bit(PIDFS_ATTR_BIT_COREDUMP, &attr->attr_mask)) {
036375522be8425 Christian Brauner     2025-10-28  382  			smp_rmb();
9c68e666b0d5e05 Emanuele Rocca        2026-03-20  383  			kinfo.mask |= PIDFD_INFO_COREDUMP | PIDFD_INFO_COREDUMP_SIGNAL | PIDFD_INFO_COREDUMP_CODE;
036375522be8425 Christian Brauner     2025-10-28  384  			kinfo.coredump_mask = attr->coredump_mask;
036375522be8425 Christian Brauner     2025-10-28  385  			kinfo.coredump_signal = attr->coredump_signal;
9c68e666b0d5e05 Emanuele Rocca        2026-03-20  386  			kinfo.coredump_code = attr->coredump_code;
036375522be8425 Christian Brauner     2025-10-28  387  		}
1d8db6fd698de1f Christian Brauner     2025-05-16  388  	}
1d8db6fd698de1f Christian Brauner     2025-05-16  389  
7477d7dce48a996 Christian Brauner     2025-03-05  390  	task = get_pid_task(pid, PIDTYPE_PID);
7477d7dce48a996 Christian Brauner     2025-03-05  391  	if (!task) {
7477d7dce48a996 Christian Brauner     2025-03-05  392  		/*
7477d7dce48a996 Christian Brauner     2025-03-05  393  		 * If the task has already been reaped, only exit
7477d7dce48a996 Christian Brauner     2025-03-05  394  		 * information is available
7477d7dce48a996 Christian Brauner     2025-03-05  395  		 */
7477d7dce48a996 Christian Brauner     2025-03-05  396  		if (!(mask & PIDFD_INFO_EXIT))
7477d7dce48a996 Christian Brauner     2025-03-05  397  			return -ESRCH;
7477d7dce48a996 Christian Brauner     2025-03-05  398  
7477d7dce48a996 Christian Brauner     2025-03-05  399  		goto copy_out;
7477d7dce48a996 Christian Brauner     2025-03-05  400  	}
7477d7dce48a996 Christian Brauner     2025-03-05  401  
cdda1f26e74bac7 Luca Boccassi         2024-10-10  402  	c = get_task_cred(task);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  403  	if (!c)
cdda1f26e74bac7 Luca Boccassi         2024-10-10  404  		return -ESRCH;
cdda1f26e74bac7 Luca Boccassi         2024-10-10  405  
fe0e6ce3fd65bac Christian Brauner     2025-10-28  406  	if ((mask & PIDFD_INFO_COREDUMP) && !kinfo.coredump_mask) {
ccb3851ce7d4b6c Christian Brauner     2025-10-28  407  		guard(task_lock)(task);
39f8049cd49f7e8 Lorenzo Stoakes       2025-08-12  408  		if (task->mm) {
39f8049cd49f7e8 Lorenzo Stoakes       2025-08-12  409  			unsigned long flags = __mm_flags_get_dumpable(task->mm);
39f8049cd49f7e8 Lorenzo Stoakes       2025-08-12  410  
39f8049cd49f7e8 Lorenzo Stoakes       2025-08-12  411  			kinfo.coredump_mask = pidfs_coredump_mask(flags);
fe0e6ce3fd65bac Christian Brauner     2025-10-28  412  			kinfo.mask |= PIDFD_INFO_COREDUMP;
036375522be8425 Christian Brauner     2025-10-28  413  			/* No coredump actually took place, so no coredump signal. */
39f8049cd49f7e8 Lorenzo Stoakes       2025-08-12  414  		}
1d8db6fd698de1f Christian Brauner     2025-05-16  415  	}
1d8db6fd698de1f Christian Brauner     2025-05-16  416  
cdda1f26e74bac7 Luca Boccassi         2024-10-10  417  	/* Unconditionally return identifiers and credentials, the rest only on request */
cdda1f26e74bac7 Luca Boccassi         2024-10-10  418  
cdda1f26e74bac7 Luca Boccassi         2024-10-10  419  	user_ns = current_user_ns();
cdda1f26e74bac7 Luca Boccassi         2024-10-10  420  	kinfo.ruid = from_kuid_munged(user_ns, c->uid);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  421  	kinfo.rgid = from_kgid_munged(user_ns, c->gid);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  422  	kinfo.euid = from_kuid_munged(user_ns, c->euid);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  423  	kinfo.egid = from_kgid_munged(user_ns, c->egid);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  424  	kinfo.suid = from_kuid_munged(user_ns, c->suid);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  425  	kinfo.sgid = from_kgid_munged(user_ns, c->sgid);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  426  	kinfo.fsuid = from_kuid_munged(user_ns, c->fsuid);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  427  	kinfo.fsgid = from_kgid_munged(user_ns, c->fsgid);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  428  	kinfo.mask |= PIDFD_INFO_CREDS;
cdda1f26e74bac7 Luca Boccassi         2024-10-10  429  	put_cred(c);
cdda1f26e74bac7 Luca Boccassi         2024-10-10  430  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
