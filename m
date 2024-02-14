Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265E125A6
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Feb 2024 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707899385; cv=none; b=OUGgwE9we9L/3qYA371n3RSSri7f7+Ea77Y9E3XVh9uGWULMTsVF11/6X1q9zrpmguysmv5LW67Susv7Kowty7wTHX/m9ldvBDhveQ7VvVrDmxmwr00+7UWR8FoyciNyaSRQyJlBs5E8X4hkqFxwxQ8qG9GO1F1tiq5qzAAmcWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707899385; c=relaxed/simple;
	bh=TbXlZ0dhXI9j+ZXNlLCTUu1Mqq46+ygVICCZhqns0/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9dr0ezDEAlUBGGcPKOyrD0ZwWxCLXMOmCebSnQODg/YMVlylb5stk+l+viGen0UAi8ybz+fjlUo2cahUtP+FlqSQAooE/+tKtfF/3IB6fJ8DnFpUjdiSrZAtAhxndNTAapVACKkvjggEv9DchvF0eyBAnCS29utRGLDTa+nyc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRaOvR3L; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRaOvR3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707899383; x=1739435383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TbXlZ0dhXI9j+ZXNlLCTUu1Mqq46+ygVICCZhqns0/0=;
  b=mRaOvR3L188BX8HOKIBVLCGFWblnMaxMsa39MV/sTMmFkEmQxBn4tiBV
   rryqqF4uGUkADcjfC3NfSgud+xS7VqI6W0GpbNDn6GLhucpxP7n6Z5uq3
   h7NMaFIp9vNWKPgjotYzOOb1gMlVDbAIFhPilon5Bi9CoOEXAqaZ0hr6T
   xgFxofK4m1yym87JDQdcbUrNTIUQsTVSJ54dhsCvQbfBFtfYuBH2xNmqa
   gy35TqSGcKyPB6U9gntrZc0ubDdBF9CFfQwnhRmyKGIbrecskcxCZw6SN
   0B8o8jwE0969Euf965ShHdZWUxYAW7NLsDzWZyhEkKdufXHLly0nEzJaX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19445321"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="19445321"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 00:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7874636"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Feb 2024 00:29:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raAeA-0008b6-0N;
	Wed, 14 Feb 2024 08:29:38 +0000
Date: Wed, 14 Feb 2024 16:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:b4/vfs-pidfd_fs 18/18] fs/pidfdfs.c:98
 pidfd_show_fdinfo() error: 'pid' dereferencing possible ERR_PTR()
Message-ID: <202402141603.gdnMHpbS-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-pidfd_fs
head:   48f1b954dad483121e9e096cc8e9c99eec26bb89
commit: 48f1b954dad483121e9e096cc8e9c99eec26bb89 [18/18] pidfd: add pidfdfs
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-141-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141603.gdnMHpbS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402141603.gdnMHpbS-lkp@intel.com/

smatch warnings:
fs/pidfdfs.c:98 pidfd_show_fdinfo() error: 'pid' dereferencing possible ERR_PTR()

vim +/pid +98 fs/pidfdfs.c

aabe98b9db5422 Christian Brauner 2024-02-12   38  
aabe98b9db5422 Christian Brauner 2024-02-12   39  #ifdef CONFIG_PROC_FS
aabe98b9db5422 Christian Brauner 2024-02-12   40  /**
aabe98b9db5422 Christian Brauner 2024-02-12   41   * pidfd_show_fdinfo - print information about a pidfd
aabe98b9db5422 Christian Brauner 2024-02-12   42   * @m: proc fdinfo file
aabe98b9db5422 Christian Brauner 2024-02-12   43   * @f: file referencing a pidfd
aabe98b9db5422 Christian Brauner 2024-02-12   44   *
aabe98b9db5422 Christian Brauner 2024-02-12   45   * Pid:
aabe98b9db5422 Christian Brauner 2024-02-12   46   * This function will print the pid that a given pidfd refers to in the
aabe98b9db5422 Christian Brauner 2024-02-12   47   * pid namespace of the procfs instance.
aabe98b9db5422 Christian Brauner 2024-02-12   48   * If the pid namespace of the process is not a descendant of the pid
aabe98b9db5422 Christian Brauner 2024-02-12   49   * namespace of the procfs instance 0 will be shown as its pid. This is
aabe98b9db5422 Christian Brauner 2024-02-12   50   * similar to calling getppid() on a process whose parent is outside of
aabe98b9db5422 Christian Brauner 2024-02-12   51   * its pid namespace.
aabe98b9db5422 Christian Brauner 2024-02-12   52   *
aabe98b9db5422 Christian Brauner 2024-02-12   53   * NSpid:
aabe98b9db5422 Christian Brauner 2024-02-12   54   * If pid namespaces are supported then this function will also print
aabe98b9db5422 Christian Brauner 2024-02-12   55   * the pid of a given pidfd refers to for all descendant pid namespaces
aabe98b9db5422 Christian Brauner 2024-02-12   56   * starting from the current pid namespace of the instance, i.e. the
aabe98b9db5422 Christian Brauner 2024-02-12   57   * Pid field and the first entry in the NSpid field will be identical.
aabe98b9db5422 Christian Brauner 2024-02-12   58   * If the pid namespace of the process is not a descendant of the pid
aabe98b9db5422 Christian Brauner 2024-02-12   59   * namespace of the procfs instance 0 will be shown as its first NSpid
aabe98b9db5422 Christian Brauner 2024-02-12   60   * entry and no others will be shown.
aabe98b9db5422 Christian Brauner 2024-02-12   61   * Note that this differs from the Pid and NSpid fields in
aabe98b9db5422 Christian Brauner 2024-02-12   62   * /proc/<pid>/status where Pid and NSpid are always shown relative to
aabe98b9db5422 Christian Brauner 2024-02-12   63   * the  pid namespace of the procfs instance. The difference becomes
aabe98b9db5422 Christian Brauner 2024-02-12   64   * obvious when sending around a pidfd between pid namespaces from a
aabe98b9db5422 Christian Brauner 2024-02-12   65   * different branch of the tree, i.e. where no ancestral relation is
aabe98b9db5422 Christian Brauner 2024-02-12   66   * present between the pid namespaces:
aabe98b9db5422 Christian Brauner 2024-02-12   67   * - create two new pid namespaces ns1 and ns2 in the initial pid
aabe98b9db5422 Christian Brauner 2024-02-12   68   *   namespace (also take care to create new mount namespaces in the
aabe98b9db5422 Christian Brauner 2024-02-12   69   *   new pid namespace and mount procfs)
aabe98b9db5422 Christian Brauner 2024-02-12   70   * - create a process with a pidfd in ns1
aabe98b9db5422 Christian Brauner 2024-02-12   71   * - send pidfd from ns1 to ns2
aabe98b9db5422 Christian Brauner 2024-02-12   72   * - read /proc/self/fdinfo/<pidfd> and observe that both Pid and NSpid
aabe98b9db5422 Christian Brauner 2024-02-12   73   *   have exactly one entry, which is 0
aabe98b9db5422 Christian Brauner 2024-02-12   74   */
aabe98b9db5422 Christian Brauner 2024-02-12   75  static void pidfd_show_fdinfo(struct seq_file *m, struct file *f)
aabe98b9db5422 Christian Brauner 2024-02-12   76  {
48f1b954dad483 Christian Brauner 2024-02-12   77  	struct pid *pid = pidfd_pid(f);
aabe98b9db5422 Christian Brauner 2024-02-12   78  	struct pid_namespace *ns;
aabe98b9db5422 Christian Brauner 2024-02-12   79  	pid_t nr = -1;
aabe98b9db5422 Christian Brauner 2024-02-12   80  
aabe98b9db5422 Christian Brauner 2024-02-12   81  	if (likely(pid_has_task(pid, PIDTYPE_PID))) {
aabe98b9db5422 Christian Brauner 2024-02-12   82  		ns = proc_pid_ns(file_inode(m->file)->i_sb);
aabe98b9db5422 Christian Brauner 2024-02-12   83  		nr = pid_nr_ns(pid, ns);
aabe98b9db5422 Christian Brauner 2024-02-12   84  	}
aabe98b9db5422 Christian Brauner 2024-02-12   85  
aabe98b9db5422 Christian Brauner 2024-02-12   86  	seq_put_decimal_ll(m, "Pid:\t", nr);
aabe98b9db5422 Christian Brauner 2024-02-12   87  
aabe98b9db5422 Christian Brauner 2024-02-12   88  #ifdef CONFIG_PID_NS
aabe98b9db5422 Christian Brauner 2024-02-12   89  	seq_put_decimal_ll(m, "\nNSpid:\t", nr);
aabe98b9db5422 Christian Brauner 2024-02-12   90  	if (nr > 0) {
aabe98b9db5422 Christian Brauner 2024-02-12   91  		int i;
aabe98b9db5422 Christian Brauner 2024-02-12   92  
aabe98b9db5422 Christian Brauner 2024-02-12   93  		/* If nr is non-zero it means that 'pid' is valid and that
aabe98b9db5422 Christian Brauner 2024-02-12   94  		 * ns, i.e. the pid namespace associated with the procfs
aabe98b9db5422 Christian Brauner 2024-02-12   95  		 * instance, is in the pid namespace hierarchy of pid.
aabe98b9db5422 Christian Brauner 2024-02-12   96  		 * Start at one below the already printed level.
aabe98b9db5422 Christian Brauner 2024-02-12   97  		 */
aabe98b9db5422 Christian Brauner 2024-02-12  @98  		for (i = ns->level + 1; i <= pid->level; i++)
aabe98b9db5422 Christian Brauner 2024-02-12   99  			seq_put_decimal_ll(m, "\t", pid->numbers[i].nr);
aabe98b9db5422 Christian Brauner 2024-02-12  100  	}
aabe98b9db5422 Christian Brauner 2024-02-12  101  #endif
aabe98b9db5422 Christian Brauner 2024-02-12  102  	seq_putc(m, '\n');
aabe98b9db5422 Christian Brauner 2024-02-12  103  }
aabe98b9db5422 Christian Brauner 2024-02-12  104  #endif
aabe98b9db5422 Christian Brauner 2024-02-12  105  

:::::: The code at line 98 was first introduced by commit
:::::: aabe98b9db5422cadab4325fb09bb91d058d6105 pidfd: move struct pidfd_fops

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
