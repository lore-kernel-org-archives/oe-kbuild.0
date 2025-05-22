Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1B1519B8
	for <oe-kbuild@lists.linux.dev>; Thu, 22 May 2025 04:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747888023; cv=none; b=Uuw0UEzm8UxfXlwdWyffM0va5ovUHmzAvLw4M3lmblaWbZyQz5Xa9BLMeddhBDLM3FdbN2AyD/oI82GXqT8k56CMlRRLnD7bcW627Qw5R1/uNtaSkWZ26KxGURu0fQUzKoRczOxmR0nFjYl7v816fWECGzOUFLiqkN+Ejp8fPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747888023; c=relaxed/simple;
	bh=/Bju8iNMU85crlB+Qd8B6wnJQFg+nBCcbbi2o4axmyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=enXf2JrSpaTqCf0QBttzWBeNnCHpYBs0c+5ud2S4A6FBORDDoYuSmNDYidSbHf97WO/vMzoXg3Hy5ASXDRgYsZu+sCY6vyPF/2V7RQXzT3mYwrgPC6nectHWEY5nq9PvfnvkTZnRPJA5eh/SBNWFiu/O90mUQh+7sNnc9olGr5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPnYbbGL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPnYbbGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747888021; x=1779424021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Bju8iNMU85crlB+Qd8B6wnJQFg+nBCcbbi2o4axmyo=;
  b=GPnYbbGLamFipLAqsWgtsXepZORggHMo3p3/ZDAcmkxplleGZTc9Kxo8
   MSlHvz1ytOicnhpJRV0COfiQmwZkmLwomum5DAA8UjP78EloxlrG6T0Gp
   B2yMiXvR/lEOa2EQ4G5hpRqyABzwn8Mwh4dET5kRe7HOjZGtd8FcjykUM
   QNkjsgjZ8oE+1zuF7UxAkUh8iBvNO2scC4cEZFwXTrgc8cWZnxiO3ac62
   HokNG6JoH8g+5r1FufNstNRc/uaXCdfQ+Hc+xvkd9HnRp7yNdCW5Pruf6
   Y8ruB78yIShiOFzxP5RQzA60ZcxKRlyeGZdVsI9MVDaxyUC2EBjbiiqpa
   w==;
X-CSE-ConnectionGUID: OBCXErvXQEK93JOcs7XXNg==
X-CSE-MsgGUID: o3PSBv/pT0ySzEg9kyMa4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49798031"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49798031"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 21:26:58 -0700
X-CSE-ConnectionGUID: hIDXnU2kQf2VFt37amG5HA==
X-CSE-MsgGUID: BlGUMaypQQe++JG2OkrnVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="163662503"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 May 2025 21:26:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHxWA-000OuM-2Z;
	Thu, 22 May 2025 04:26:54 +0000
Date: Thu, 22 May 2025 12:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/3] treewide: Switch memcpy() users of 'task->comm'
 to a more safer implementation
Message-ID: <202505221104.qV4Iy0rA-lkp@intel.com>
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
In-Reply-To: <20250521062337.53262-3-bhupesh@igalia.com>
References: <20250521062337.53262-3-bhupesh@igalia.com>
TO: Bhupesh <bhupesh@igalia.com>
TO: akpm@linux-foundation.org
CC: bhupesh@igalia.com
CC: kernel-dev@igalia.com
CC: linux-kernel@vger.kernel.org
CC: bpf@vger.kernel.org
CC: linux-perf-users@vger.kernel.org
CC: linux-fsdevel@vger.kernel.org
CC: linux-mm@kvack.org
CC: oliver.sang@intel.com
CC: lkp@intel.com
CC: laoar.shao@gmail.com
CC: pmladek@suse.com
CC: rostedt@goodmis.org
CC: mathieu.desnoyers@efficios.com
CC: arnaldo.melo@gmail.com
CC: alexei.starovoitov@gmail.com
CC: andrii.nakryiko@gmail.com
CC: mirq-linux@rere.qmqm.pl
CC: peterz@infradead.org
CC: willy@infradead.org
CC: david@redhat.com
CC: viro@zeniv.linux.org.uk
CC: keescook@chromium.org
CC: ebiederm@xmission.com
CC: brauner@kernel.org
CC: jack@suse.cz
CC: mingo@redhat.com
CC: juri.lelli@redhat.com
CC: bsegall@google.com
CC: mgorman@suse.de

Hi Bhupesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on tip/sched/core akpm-mm/mm-everything linus/master v6.15-rc7 next-20250521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhupesh/exec-Remove-obsolete-comments/20250521-142443
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250521062337.53262-3-bhupesh%40igalia.com
patch subject: [PATCH v4 2/3] treewide: Switch memcpy() users of 'task->comm' to a more safer implementation
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: powerpc64-randconfig-r071-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221104.qV4Iy0rA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505221104.qV4Iy0rA-lkp@intel.com/

New smatch warnings:
fs/coredump.c:591 do_coredump() error: buffer overflow 'comm' 16 <= 16
fs/coredump.c:1006 validate_coredump_safety() error: buffer overflow 'comm' 16 <= 16

Old smatch warnings:
fs/coredump.c:611 do_coredump() error: buffer overflow 'comm' 16 <= 16
fs/coredump.c:618 do_coredump() error: buffer overflow 'comm' 16 <= 16
fs/coredump.c:625 do_coredump() error: buffer overflow 'comm' 16 <= 16
fs/coredump.c:642 do_coredump() error: buffer overflow 'comm' 16 <= 16
fs/coredump.c:655 do_coredump() error: buffer overflow 'comm' 16 <= 16
fs/coredump.c:725 do_coredump() error: buffer overflow 'comm' 16 <= 16
fs/coredump.c:730 do_coredump() error: buffer overflow 'comm' 16 <= 16
fs/coredump.c:752 do_coredump() error: buffer overflow 'comm' 16 <= 16

vim +/comm +591 fs/coredump.c

10c28d937e2cca Alex Kelly                   2012-09-26  523  
a78282e2c94f4c Linus Torvalds               2024-09-26  524  void do_coredump(const kernel_siginfo_t *siginfo)
10c28d937e2cca Alex Kelly                   2012-09-26  525  {
10c28d937e2cca Alex Kelly                   2012-09-26  526  	struct core_state core_state;
10c28d937e2cca Alex Kelly                   2012-09-26  527  	struct core_name cn;
10c28d937e2cca Alex Kelly                   2012-09-26  528  	struct mm_struct *mm = current->mm;
10c28d937e2cca Alex Kelly                   2012-09-26  529  	struct linux_binfmt * binfmt;
10c28d937e2cca Alex Kelly                   2012-09-26  530  	const struct cred *old_cred;
10c28d937e2cca Alex Kelly                   2012-09-26  531  	struct cred *cred;
a78282e2c94f4c Linus Torvalds               2024-09-26  532  	int retval = 0;
10c28d937e2cca Alex Kelly                   2012-09-26  533  	int ispipe;
315c69261dd3fa Paul Wise                    2019-08-02  534  	size_t *argv = NULL;
315c69261dd3fa Paul Wise                    2019-08-02  535  	int argc = 0;
fbb1816942c044 Jann Horn                    2015-09-09  536  	/* require nonrelative corefile path and be extra careful */
fbb1816942c044 Jann Horn                    2015-09-09  537  	bool need_suid_safe = false;
acdedd99b0f3bf Oleg Nesterov                2013-04-30  538  	bool core_dumped = false;
10c28d937e2cca Alex Kelly                   2012-09-26  539  	static atomic_t core_dump_count = ATOMIC_INIT(0);
10c28d937e2cca Alex Kelly                   2012-09-26  540  	struct coredump_params cprm = {
5ab1c309b34488 Denys Vlasenko               2012-10-04  541  		.siginfo = siginfo,
10c28d937e2cca Alex Kelly                   2012-09-26  542  		.limit = rlimit(RLIMIT_CORE),
10c28d937e2cca Alex Kelly                   2012-09-26  543  		/*
10c28d937e2cca Alex Kelly                   2012-09-26  544  		 * We must use the same mm->flags while dumping core to avoid
10c28d937e2cca Alex Kelly                   2012-09-26  545  		 * inconsistency of bit flags, since this flag is not protected
10c28d937e2cca Alex Kelly                   2012-09-26  546  		 * by any locks.
10c28d937e2cca Alex Kelly                   2012-09-26  547  		 */
10c28d937e2cca Alex Kelly                   2012-09-26  548  		.mm_flags = mm->flags,
95c5436a488384 Eric W. Biederman            2022-03-08  549  		.vma_meta = NULL,
8603b6f58637ce Oleksandr Natalenko          2022-09-03  550  		.cpu = raw_smp_processor_id(),
10c28d937e2cca Alex Kelly                   2012-09-26  551  	};
10c28d937e2cca Alex Kelly                   2012-09-26  552  
5ab1c309b34488 Denys Vlasenko               2012-10-04  553  	audit_core_dumps(siginfo->si_signo);
10c28d937e2cca Alex Kelly                   2012-09-26  554  
10c28d937e2cca Alex Kelly                   2012-09-26  555  	binfmt = mm->binfmt;
a78282e2c94f4c Linus Torvalds               2024-09-26  556  	if (!binfmt || !binfmt->core_dump)
10c28d937e2cca Alex Kelly                   2012-09-26  557  		goto fail;
a78282e2c94f4c Linus Torvalds               2024-09-26  558  	if (!__get_dumpable(cprm.mm_flags))
10c28d937e2cca Alex Kelly                   2012-09-26  559  		goto fail;
10c28d937e2cca Alex Kelly                   2012-09-26  560  
10c28d937e2cca Alex Kelly                   2012-09-26  561  	cred = prepare_creds();
a78282e2c94f4c Linus Torvalds               2024-09-26  562  	if (!cred)
10c28d937e2cca Alex Kelly                   2012-09-26  563  		goto fail;
10c28d937e2cca Alex Kelly                   2012-09-26  564  	/*
10c28d937e2cca Alex Kelly                   2012-09-26  565  	 * We cannot trust fsuid as being the "true" uid of the process
10c28d937e2cca Alex Kelly                   2012-09-26  566  	 * nor do we know its entire history. We only know it was tainted
10c28d937e2cca Alex Kelly                   2012-09-26  567  	 * so we dump it as root in mode 2, and only into a controlled
10c28d937e2cca Alex Kelly                   2012-09-26  568  	 * environment (pipe handler or fully qualified path).
10c28d937e2cca Alex Kelly                   2012-09-26  569  	 */
e579d2c259be42 Kees Cook                    2013-02-27  570  	if (__get_dumpable(cprm.mm_flags) == SUID_DUMP_ROOT) {
10c28d937e2cca Alex Kelly                   2012-09-26  571  		/* Setuid core dump mode */
10c28d937e2cca Alex Kelly                   2012-09-26  572  		cred->fsuid = GLOBAL_ROOT_UID;	/* Dump root private */
fbb1816942c044 Jann Horn                    2015-09-09  573  		need_suid_safe = true;
10c28d937e2cca Alex Kelly                   2012-09-26  574  	}
10c28d937e2cca Alex Kelly                   2012-09-26  575  
5ab1c309b34488 Denys Vlasenko               2012-10-04  576  	retval = coredump_wait(siginfo->si_signo, &core_state);
10c28d937e2cca Alex Kelly                   2012-09-26  577  	if (retval < 0)
10c28d937e2cca Alex Kelly                   2012-09-26  578  		goto fail_creds;
10c28d937e2cca Alex Kelly                   2012-09-26  579  
10c28d937e2cca Alex Kelly                   2012-09-26  580  	old_cred = override_creds(cred);
10c28d937e2cca Alex Kelly                   2012-09-26  581  
315c69261dd3fa Paul Wise                    2019-08-02  582  	ispipe = format_corename(&cn, &cprm, &argv, &argc);
10c28d937e2cca Alex Kelly                   2012-09-26  583  
10c28d937e2cca Alex Kelly                   2012-09-26  584  	if (ispipe) {
315c69261dd3fa Paul Wise                    2019-08-02  585  		int argi;
10c28d937e2cca Alex Kelly                   2012-09-26  586  		int dump_count;
10c28d937e2cca Alex Kelly                   2012-09-26  587  		char **helper_argv;
907ed1328d2a74 Lucas De Marchi              2013-04-30  588  		struct subprocess_info *sub_info;
10c28d937e2cca Alex Kelly                   2012-09-26  589  
10c28d937e2cca Alex Kelly                   2012-09-26  590  		if (ispipe < 0) {
c114e9948c2b6a Roman Kisel                  2024-07-18 @591  			coredump_report_failure("format_corename failed, aborting core");
e7fd1549aeb83e Oleg Nesterov                2013-07-03  592  			goto fail_unlock;
10c28d937e2cca Alex Kelly                   2012-09-26  593  		}
10c28d937e2cca Alex Kelly                   2012-09-26  594  
10c28d937e2cca Alex Kelly                   2012-09-26  595  		if (cprm.limit == 1) {
10c28d937e2cca Alex Kelly                   2012-09-26  596  			/* See umh_pipe_setup() which sets RLIMIT_CORE = 1.
10c28d937e2cca Alex Kelly                   2012-09-26  597  			 *
10c28d937e2cca Alex Kelly                   2012-09-26  598  			 * Normally core limits are irrelevant to pipes, since
10c28d937e2cca Alex Kelly                   2012-09-26  599  			 * we're not writing to the file system, but we use
fcbc32bc6cb59c Bastien Nocera               2015-02-05  600  			 * cprm.limit of 1 here as a special value, this is a
10c28d937e2cca Alex Kelly                   2012-09-26  601  			 * consistent way to catch recursive crashes.
10c28d937e2cca Alex Kelly                   2012-09-26  602  			 * We can still crash if the core_pattern binary sets
10c28d937e2cca Alex Kelly                   2012-09-26  603  			 * RLIM_CORE = !1, but it runs as root, and can do
10c28d937e2cca Alex Kelly                   2012-09-26  604  			 * lots of stupid things.
10c28d937e2cca Alex Kelly                   2012-09-26  605  			 *
10c28d937e2cca Alex Kelly                   2012-09-26  606  			 * Note that we use task_tgid_vnr here to grab the pid
10c28d937e2cca Alex Kelly                   2012-09-26  607  			 * of the process group leader.  That way we get the
10c28d937e2cca Alex Kelly                   2012-09-26  608  			 * right pid if a thread in a multi-threaded
10c28d937e2cca Alex Kelly                   2012-09-26  609  			 * core_pattern process dies.
10c28d937e2cca Alex Kelly                   2012-09-26  610  			 */
c114e9948c2b6a Roman Kisel                  2024-07-18  611  			coredump_report_failure("RLIMIT_CORE is set to 1, aborting core");
10c28d937e2cca Alex Kelly                   2012-09-26  612  			goto fail_unlock;
10c28d937e2cca Alex Kelly                   2012-09-26  613  		}
10c28d937e2cca Alex Kelly                   2012-09-26  614  		cprm.limit = RLIM_INFINITY;
10c28d937e2cca Alex Kelly                   2012-09-26  615  
10c28d937e2cca Alex Kelly                   2012-09-26  616  		dump_count = atomic_inc_return(&core_dump_count);
10c28d937e2cca Alex Kelly                   2012-09-26  617  		if (core_pipe_limit && (core_pipe_limit < dump_count)) {
c114e9948c2b6a Roman Kisel                  2024-07-18  618  			coredump_report_failure("over core_pipe_limit, skipping core dump");
10c28d937e2cca Alex Kelly                   2012-09-26  619  			goto fail_dropcount;
10c28d937e2cca Alex Kelly                   2012-09-26  620  		}
10c28d937e2cca Alex Kelly                   2012-09-26  621  
315c69261dd3fa Paul Wise                    2019-08-02  622  		helper_argv = kmalloc_array(argc + 1, sizeof(*helper_argv),
315c69261dd3fa Paul Wise                    2019-08-02  623  					    GFP_KERNEL);
10c28d937e2cca Alex Kelly                   2012-09-26  624  		if (!helper_argv) {
c114e9948c2b6a Roman Kisel                  2024-07-18  625  			coredump_report_failure("%s failed to allocate memory", __func__);
10c28d937e2cca Alex Kelly                   2012-09-26  626  			goto fail_dropcount;
10c28d937e2cca Alex Kelly                   2012-09-26  627  		}
315c69261dd3fa Paul Wise                    2019-08-02  628  		for (argi = 0; argi < argc; argi++)
315c69261dd3fa Paul Wise                    2019-08-02  629  			helper_argv[argi] = cn.corename + argv[argi];
315c69261dd3fa Paul Wise                    2019-08-02  630  		helper_argv[argi] = NULL;
10c28d937e2cca Alex Kelly                   2012-09-26  631  
907ed1328d2a74 Lucas De Marchi              2013-04-30  632  		retval = -ENOMEM;
907ed1328d2a74 Lucas De Marchi              2013-04-30  633  		sub_info = call_usermodehelper_setup(helper_argv[0],
907ed1328d2a74 Lucas De Marchi              2013-04-30  634  						helper_argv, NULL, GFP_KERNEL,
907ed1328d2a74 Lucas De Marchi              2013-04-30  635  						umh_pipe_setup, NULL, &cprm);
907ed1328d2a74 Lucas De Marchi              2013-04-30  636  		if (sub_info)
907ed1328d2a74 Lucas De Marchi              2013-04-30  637  			retval = call_usermodehelper_exec(sub_info,
907ed1328d2a74 Lucas De Marchi              2013-04-30  638  							  UMH_WAIT_EXEC);
907ed1328d2a74 Lucas De Marchi              2013-04-30  639  
315c69261dd3fa Paul Wise                    2019-08-02  640  		kfree(helper_argv);
10c28d937e2cca Alex Kelly                   2012-09-26  641  		if (retval) {
c114e9948c2b6a Roman Kisel                  2024-07-18  642  			coredump_report_failure("|%s pipe failed", cn.corename);
10c28d937e2cca Alex Kelly                   2012-09-26  643  			goto close_fail;
10c28d937e2cca Alex Kelly                   2012-09-26  644  		}
10c28d937e2cca Alex Kelly                   2012-09-26  645  	} else {
abf08576afe315 Christian Brauner            2023-01-13  646  		struct mnt_idmap *idmap;
10c28d937e2cca Alex Kelly                   2012-09-26  647  		struct inode *inode;
88e4607034ee49 Vladimir Sementsov-Ogievskiy 2023-04-20  648  		int open_flags = O_CREAT | O_WRONLY | O_NOFOLLOW |
378c6520e7d292 Jann Horn                    2016-03-22  649  				 O_LARGEFILE | O_EXCL;
10c28d937e2cca Alex Kelly                   2012-09-26  650  
a78282e2c94f4c Linus Torvalds               2024-09-26  651  		if (cprm.limit < binfmt->min_coredump)
10c28d937e2cca Alex Kelly                   2012-09-26  652  			goto fail_unlock;
10c28d937e2cca Alex Kelly                   2012-09-26  653  
fbb1816942c044 Jann Horn                    2015-09-09  654  		if (need_suid_safe && cn.corename[0] != '/') {
c114e9948c2b6a Roman Kisel                  2024-07-18  655  			coredump_report_failure(
c114e9948c2b6a Roman Kisel                  2024-07-18  656  				"this process can only dump core to a fully qualified path, skipping core dump");
10c28d937e2cca Alex Kelly                   2012-09-26  657  			goto fail_unlock;
10c28d937e2cca Alex Kelly                   2012-09-26  658  		}
10c28d937e2cca Alex Kelly                   2012-09-26  659  
fbb1816942c044 Jann Horn                    2015-09-09  660  		/*
fbb1816942c044 Jann Horn                    2015-09-09  661  		 * Unlink the file if it exists unless this is a SUID
fbb1816942c044 Jann Horn                    2015-09-09  662  		 * binary - in that case, we're running around with root
fbb1816942c044 Jann Horn                    2015-09-09  663  		 * privs and don't want to unlink another user's coredump.
fbb1816942c044 Jann Horn                    2015-09-09  664  		 */
fbb1816942c044 Jann Horn                    2015-09-09  665  		if (!need_suid_safe) {
fbb1816942c044 Jann Horn                    2015-09-09  666  			/*
fbb1816942c044 Jann Horn                    2015-09-09  667  			 * If it doesn't exist, that's fine. If there's some
fbb1816942c044 Jann Horn                    2015-09-09  668  			 * other problem, we'll catch it at the filp_open().
fbb1816942c044 Jann Horn                    2015-09-09  669  			 */
96271654f55c74 Christoph Hellwig            2017-11-04  670  			do_unlinkat(AT_FDCWD, getname_kernel(cn.corename));
fbb1816942c044 Jann Horn                    2015-09-09  671  		}
fbb1816942c044 Jann Horn                    2015-09-09  672  
fbb1816942c044 Jann Horn                    2015-09-09  673  		/*
fbb1816942c044 Jann Horn                    2015-09-09  674  		 * There is a race between unlinking and creating the
fbb1816942c044 Jann Horn                    2015-09-09  675  		 * file, but if that causes an EEXIST here, that's
fbb1816942c044 Jann Horn                    2015-09-09  676  		 * fine - another process raced with us while creating
fbb1816942c044 Jann Horn                    2015-09-09  677  		 * the corefile, and the other process won. To userspace,
fbb1816942c044 Jann Horn                    2015-09-09  678  		 * what matters is that at least one of the two processes
fbb1816942c044 Jann Horn                    2015-09-09  679  		 * writes its coredump successfully, not which one.
fbb1816942c044 Jann Horn                    2015-09-09  680  		 */
378c6520e7d292 Jann Horn                    2016-03-22  681  		if (need_suid_safe) {
378c6520e7d292 Jann Horn                    2016-03-22  682  			/*
378c6520e7d292 Jann Horn                    2016-03-22  683  			 * Using user namespaces, normal user tasks can change
378c6520e7d292 Jann Horn                    2016-03-22  684  			 * their current->fs->root to point to arbitrary
378c6520e7d292 Jann Horn                    2016-03-22  685  			 * directories. Since the intention of the "only dump
378c6520e7d292 Jann Horn                    2016-03-22  686  			 * with a fully qualified path" rule is to control where
378c6520e7d292 Jann Horn                    2016-03-22  687  			 * coredumps may be placed using root privileges,
378c6520e7d292 Jann Horn                    2016-03-22  688  			 * current->fs->root must not be used. Instead, use the
378c6520e7d292 Jann Horn                    2016-03-22  689  			 * root directory of init_task.
378c6520e7d292 Jann Horn                    2016-03-22  690  			 */
378c6520e7d292 Jann Horn                    2016-03-22  691  			struct path root;
378c6520e7d292 Jann Horn                    2016-03-22  692  
378c6520e7d292 Jann Horn                    2016-03-22  693  			task_lock(&init_task);
378c6520e7d292 Jann Horn                    2016-03-22  694  			get_fs_root(init_task.fs, &root);
378c6520e7d292 Jann Horn                    2016-03-22  695  			task_unlock(&init_task);
ffb37ca3bd16ce Al Viro                      2021-04-01  696  			cprm.file = file_open_root(&root, cn.corename,
ffb37ca3bd16ce Al Viro                      2021-04-01  697  						   open_flags, 0600);
378c6520e7d292 Jann Horn                    2016-03-22  698  			path_put(&root);
378c6520e7d292 Jann Horn                    2016-03-22  699  		} else {
378c6520e7d292 Jann Horn                    2016-03-22  700  			cprm.file = filp_open(cn.corename, open_flags, 0600);
378c6520e7d292 Jann Horn                    2016-03-22  701  		}
a78282e2c94f4c Linus Torvalds               2024-09-26  702  		if (IS_ERR(cprm.file))
10c28d937e2cca Alex Kelly                   2012-09-26  703  			goto fail_unlock;
10c28d937e2cca Alex Kelly                   2012-09-26  704  
496ad9aa8ef448 Al Viro                      2013-01-23  705  		inode = file_inode(cprm.file);
a78282e2c94f4c Linus Torvalds               2024-09-26  706  		if (inode->i_nlink > 1)
10c28d937e2cca Alex Kelly                   2012-09-26  707  			goto close_fail;
a78282e2c94f4c Linus Torvalds               2024-09-26  708  		if (d_unhashed(cprm.file->f_path.dentry))
10c28d937e2cca Alex Kelly                   2012-09-26  709  			goto close_fail;
10c28d937e2cca Alex Kelly                   2012-09-26  710  		/*
10c28d937e2cca Alex Kelly                   2012-09-26  711  		 * AK: actually i see no reason to not allow this for named
10c28d937e2cca Alex Kelly                   2012-09-26  712  		 * pipes etc, but keep the previous behaviour for now.
10c28d937e2cca Alex Kelly                   2012-09-26  713  		 */
a78282e2c94f4c Linus Torvalds               2024-09-26  714  		if (!S_ISREG(inode->i_mode))
10c28d937e2cca Alex Kelly                   2012-09-26  715  			goto close_fail;
10c28d937e2cca Alex Kelly                   2012-09-26  716  		/*
40f705a736eac1 Jann Horn                    2015-09-09  717  		 * Don't dump core if the filesystem changed owner or mode
40f705a736eac1 Jann Horn                    2015-09-09  718  		 * of the file during file creation. This is an issue when
40f705a736eac1 Jann Horn                    2015-09-09  719  		 * a process dumps core while its cwd is e.g. on a vfat
40f705a736eac1 Jann Horn                    2015-09-09  720  		 * filesystem.
10c28d937e2cca Alex Kelly                   2012-09-26  721  		 */
abf08576afe315 Christian Brauner            2023-01-13  722  		idmap = file_mnt_idmap(cprm.file);
e67fe63341b811 Christian Brauner            2023-01-13  723  		if (!vfsuid_eq_kuid(i_uid_into_vfsuid(idmap, inode),
dbd9d6f8fa9c3e David Oberhollenzer          2021-09-07  724  				    current_fsuid())) {
c114e9948c2b6a Roman Kisel                  2024-07-18  725  			coredump_report_failure("Core dump to %s aborted: "
c114e9948c2b6a Roman Kisel                  2024-07-18  726  				"cannot preserve file owner", cn.corename);
10c28d937e2cca Alex Kelly                   2012-09-26  727  			goto close_fail;
dbd9d6f8fa9c3e David Oberhollenzer          2021-09-07  728  		}
dbd9d6f8fa9c3e David Oberhollenzer          2021-09-07  729  		if ((inode->i_mode & 0677) != 0600) {
c114e9948c2b6a Roman Kisel                  2024-07-18  730  			coredump_report_failure("Core dump to %s aborted: "
c114e9948c2b6a Roman Kisel                  2024-07-18  731  				"cannot preserve file permissions", cn.corename);
40f705a736eac1 Jann Horn                    2015-09-09  732  			goto close_fail;
dbd9d6f8fa9c3e David Oberhollenzer          2021-09-07  733  		}
a78282e2c94f4c Linus Torvalds               2024-09-26  734  		if (!(cprm.file->f_mode & FMODE_CAN_WRITE))
10c28d937e2cca Alex Kelly                   2012-09-26  735  			goto close_fail;
a78282e2c94f4c Linus Torvalds               2024-09-26  736  		if (do_truncate(idmap, cprm.file->f_path.dentry,
a78282e2c94f4c Linus Torvalds               2024-09-26  737  				0, 0, cprm.file))
10c28d937e2cca Alex Kelly                   2012-09-26  738  			goto close_fail;
10c28d937e2cca Alex Kelly                   2012-09-26  739  	}
10c28d937e2cca Alex Kelly                   2012-09-26  740  
10c28d937e2cca Alex Kelly                   2012-09-26  741  	/* get us an unshared descriptor table; almost always a no-op */
c39ab6de227306 Eric W. Biederman            2020-11-25  742  	/* The cell spufs coredump code reads the file descriptor tables */
1f702603e7125a Eric W. Biederman            2020-11-20  743  	retval = unshare_files();
10c28d937e2cca Alex Kelly                   2012-09-26  744  	if (retval)
10c28d937e2cca Alex Kelly                   2012-09-26  745  		goto close_fail;
e86d35c38e37eb Al Viro                      2013-05-04  746  	if (!dump_interrupted()) {
3740d93e37902b Luis Chamberlain             2020-04-16  747  		/*
3740d93e37902b Luis Chamberlain             2020-04-16  748  		 * umh disabled with CONFIG_STATIC_USERMODEHELPER_PATH="" would
3740d93e37902b Luis Chamberlain             2020-04-16  749  		 * have this set to NULL.
3740d93e37902b Luis Chamberlain             2020-04-16  750  		 */
3740d93e37902b Luis Chamberlain             2020-04-16  751  		if (!cprm.file) {
c114e9948c2b6a Roman Kisel                  2024-07-18  752  			coredump_report_failure("Core dump to |%s disabled", cn.corename);
3740d93e37902b Luis Chamberlain             2020-04-16  753  			goto close_fail;
3740d93e37902b Luis Chamberlain             2020-04-16  754  		}
a78282e2c94f4c Linus Torvalds               2024-09-26  755  		if (!dump_vma_snapshot(&cprm))
95c5436a488384 Eric W. Biederman            2022-03-08  756  			goto close_fail;
95c5436a488384 Eric W. Biederman            2022-03-08  757  
03d95eb2f25780 Al Viro                      2013-03-20  758  		file_start_write(cprm.file);
e86d35c38e37eb Al Viro                      2013-05-04  759  		core_dumped = binfmt->core_dump(&cprm);
d0f1088b31db2d Al Viro                      2020-03-08  760  		/*
d0f1088b31db2d Al Viro                      2020-03-08  761  		 * Ensures that file size is big enough to contain the current
d0f1088b31db2d Al Viro                      2020-03-08  762  		 * file postion. This prevents gdb from complaining about
d0f1088b31db2d Al Viro                      2020-03-08  763  		 * a truncated file if the last "write" to the file was
d0f1088b31db2d Al Viro                      2020-03-08  764  		 * dump_skip.
d0f1088b31db2d Al Viro                      2020-03-08  765  		 */
d0f1088b31db2d Al Viro                      2020-03-08  766  		if (cprm.to_skip) {
d0f1088b31db2d Al Viro                      2020-03-08  767  			cprm.to_skip--;
d0f1088b31db2d Al Viro                      2020-03-08  768  			dump_emit(&cprm, "", 1);
d0f1088b31db2d Al Viro                      2020-03-08  769  		}
03d95eb2f25780 Al Viro                      2013-03-20  770  		file_end_write(cprm.file);
390031c942116d Eric W. Biederman            2022-03-08  771  		free_vma_snapshot(&cprm);
e86d35c38e37eb Al Viro                      2013-05-04  772  	}
10c28d937e2cca Alex Kelly                   2012-09-26  773  	if (ispipe && core_pipe_limit)
10c28d937e2cca Alex Kelly                   2012-09-26  774  		wait_for_dump_helpers(cprm.file);
10c28d937e2cca Alex Kelly                   2012-09-26  775  close_fail:
10c28d937e2cca Alex Kelly                   2012-09-26  776  	if (cprm.file)
10c28d937e2cca Alex Kelly                   2012-09-26  777  		filp_close(cprm.file, NULL);
10c28d937e2cca Alex Kelly                   2012-09-26  778  fail_dropcount:
10c28d937e2cca Alex Kelly                   2012-09-26  779  	if (ispipe)
10c28d937e2cca Alex Kelly                   2012-09-26  780  		atomic_dec(&core_dump_count);
10c28d937e2cca Alex Kelly                   2012-09-26  781  fail_unlock:
315c69261dd3fa Paul Wise                    2019-08-02  782  	kfree(argv);
10c28d937e2cca Alex Kelly                   2012-09-26  783  	kfree(cn.corename);
0258b5fd7c7124 Eric W. Biederman            2021-09-22  784  	coredump_finish(core_dumped);
10c28d937e2cca Alex Kelly                   2012-09-26  785  	revert_creds(old_cred);
10c28d937e2cca Alex Kelly                   2012-09-26  786  fail_creds:
10c28d937e2cca Alex Kelly                   2012-09-26  787  	put_cred(cred);
10c28d937e2cca Alex Kelly                   2012-09-26  788  fail:
a78282e2c94f4c Linus Torvalds               2024-09-26  789  	return;
10c28d937e2cca Alex Kelly                   2012-09-26  790  }
10c28d937e2cca Alex Kelly                   2012-09-26  791  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
