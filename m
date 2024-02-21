Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3C780614
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Feb 2024 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529039; cv=none; b=En7X6mEge+lZkru6VWrVowLIgI/HHTbOuFrzvYTZ7y5znUdM9Ozev8XdsbkmLkT5RDXup1S3yD49CBiM4oYLSQ6sohJ6e+uTjrOAaP9An9mTQ8svn3geaKY5JBtgE+JdByvOGxpIY3qLHmRTkp2GgSM4q59w8MOJWl4h1wEQcuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529039; c=relaxed/simple;
	bh=G7NFti5JeOgYUhTqQis8FP7TkCloMplXzef4vbTSIZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FgkOjRr8HTGTXMAqmXI4IJlXg6x3WUVbVX4x/QcxMQ2pXOHrjNc7X3Fn6f7+ga2LJpvM0zkyoIrZMrxoRNraRP9bn9UdDtFJtf+ivuTTR0JjT3/PNPZ4M4HpQaE/D/Trel13jkoRV86W6VP94cLdJG1ukXIwV30c7fT3f4qhFeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLmxYC6W; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLmxYC6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529037; x=1740065037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G7NFti5JeOgYUhTqQis8FP7TkCloMplXzef4vbTSIZA=;
  b=bLmxYC6Wo5QGFTZ087944lKbmLW+dBC1ajkyVk1fuSW8HNrC7NG13h3U
   kYqB4o4/WPPJJTY9erc7p+b1P6va+WSpMLxEeIQm6CoPc3agYGnZW23fm
   trkkBvuT9avVulUvD/HcD08PGbZJrvvSHs6RTzFKZAb2Qja+O60W5BzSK
   lIJWdMosQAB3J2QnMFErA5bIw3kmr85FsfOBI+Pf1Td5P/P5FS9h/tv1/
   xINIJlPfCZkOKeCV8POIck8mfLh9oxfFXUHnbW2B3N1pVp3dbeXKVBwzs
   r8Tm2JyAjm2NTZwzaYqymNScN3Tz9jzBAZo71uFCGgmKtrhr5Ayohjoxx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2563530"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2563530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5142034"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2024 07:23:55 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcoRr-0005Qu-1u;
	Wed, 21 Feb 2024 15:23:52 +0000
Date: Wed, 21 Feb 2024 23:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7538/8619] fs/pidfs.c:98 pidfd_show_fdinfo()
 error: 'pid' dereferencing possible ERR_PTR()
Message-ID: <202402212332.M66RPJyA-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4893c639cc3659cefaa675bf1e59f4e7571afb5c
commit: 193d98b1d3aa72761cf7a9cae5f8ac9933ef4d0a [7538/8619] pidfd: add pidfs
:::::: branch date: 10 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20240221 (https://download.01.org/0day-ci/archive/20240221/202402212332.M66RPJyA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402212332.M66RPJyA-lkp@intel.com/

smatch warnings:
fs/pidfs.c:98 pidfd_show_fdinfo() error: 'pid' dereferencing possible ERR_PTR()

vim +/pid +98 fs/pidfs.c

bb8576deed306e Christian Brauner 2024-02-12   38  
bb8576deed306e Christian Brauner 2024-02-12   39  #ifdef CONFIG_PROC_FS
bb8576deed306e Christian Brauner 2024-02-12   40  /**
bb8576deed306e Christian Brauner 2024-02-12   41   * pidfd_show_fdinfo - print information about a pidfd
bb8576deed306e Christian Brauner 2024-02-12   42   * @m: proc fdinfo file
bb8576deed306e Christian Brauner 2024-02-12   43   * @f: file referencing a pidfd
bb8576deed306e Christian Brauner 2024-02-12   44   *
bb8576deed306e Christian Brauner 2024-02-12   45   * Pid:
bb8576deed306e Christian Brauner 2024-02-12   46   * This function will print the pid that a given pidfd refers to in the
bb8576deed306e Christian Brauner 2024-02-12   47   * pid namespace of the procfs instance.
bb8576deed306e Christian Brauner 2024-02-12   48   * If the pid namespace of the process is not a descendant of the pid
bb8576deed306e Christian Brauner 2024-02-12   49   * namespace of the procfs instance 0 will be shown as its pid. This is
bb8576deed306e Christian Brauner 2024-02-12   50   * similar to calling getppid() on a process whose parent is outside of
bb8576deed306e Christian Brauner 2024-02-12   51   * its pid namespace.
bb8576deed306e Christian Brauner 2024-02-12   52   *
bb8576deed306e Christian Brauner 2024-02-12   53   * NSpid:
bb8576deed306e Christian Brauner 2024-02-12   54   * If pid namespaces are supported then this function will also print
bb8576deed306e Christian Brauner 2024-02-12   55   * the pid of a given pidfd refers to for all descendant pid namespaces
bb8576deed306e Christian Brauner 2024-02-12   56   * starting from the current pid namespace of the instance, i.e. the
bb8576deed306e Christian Brauner 2024-02-12   57   * Pid field and the first entry in the NSpid field will be identical.
bb8576deed306e Christian Brauner 2024-02-12   58   * If the pid namespace of the process is not a descendant of the pid
bb8576deed306e Christian Brauner 2024-02-12   59   * namespace of the procfs instance 0 will be shown as its first NSpid
bb8576deed306e Christian Brauner 2024-02-12   60   * entry and no others will be shown.
bb8576deed306e Christian Brauner 2024-02-12   61   * Note that this differs from the Pid and NSpid fields in
bb8576deed306e Christian Brauner 2024-02-12   62   * /proc/<pid>/status where Pid and NSpid are always shown relative to
bb8576deed306e Christian Brauner 2024-02-12   63   * the  pid namespace of the procfs instance. The difference becomes
bb8576deed306e Christian Brauner 2024-02-12   64   * obvious when sending around a pidfd between pid namespaces from a
bb8576deed306e Christian Brauner 2024-02-12   65   * different branch of the tree, i.e. where no ancestral relation is
bb8576deed306e Christian Brauner 2024-02-12   66   * present between the pid namespaces:
bb8576deed306e Christian Brauner 2024-02-12   67   * - create two new pid namespaces ns1 and ns2 in the initial pid
bb8576deed306e Christian Brauner 2024-02-12   68   *   namespace (also take care to create new mount namespaces in the
bb8576deed306e Christian Brauner 2024-02-12   69   *   new pid namespace and mount procfs)
bb8576deed306e Christian Brauner 2024-02-12   70   * - create a process with a pidfd in ns1
bb8576deed306e Christian Brauner 2024-02-12   71   * - send pidfd from ns1 to ns2
bb8576deed306e Christian Brauner 2024-02-12   72   * - read /proc/self/fdinfo/<pidfd> and observe that both Pid and NSpid
bb8576deed306e Christian Brauner 2024-02-12   73   *   have exactly one entry, which is 0
bb8576deed306e Christian Brauner 2024-02-12   74   */
bb8576deed306e Christian Brauner 2024-02-12   75  static void pidfd_show_fdinfo(struct seq_file *m, struct file *f)
bb8576deed306e Christian Brauner 2024-02-12   76  {
193d98b1d3aa72 Christian Brauner 2024-02-12   77  	struct pid *pid = pidfd_pid(f);
bb8576deed306e Christian Brauner 2024-02-12   78  	struct pid_namespace *ns;
bb8576deed306e Christian Brauner 2024-02-12   79  	pid_t nr = -1;
bb8576deed306e Christian Brauner 2024-02-12   80  
bb8576deed306e Christian Brauner 2024-02-12   81  	if (likely(pid_has_task(pid, PIDTYPE_PID))) {
bb8576deed306e Christian Brauner 2024-02-12   82  		ns = proc_pid_ns(file_inode(m->file)->i_sb);
bb8576deed306e Christian Brauner 2024-02-12   83  		nr = pid_nr_ns(pid, ns);
bb8576deed306e Christian Brauner 2024-02-12   84  	}
bb8576deed306e Christian Brauner 2024-02-12   85  
bb8576deed306e Christian Brauner 2024-02-12   86  	seq_put_decimal_ll(m, "Pid:\t", nr);
bb8576deed306e Christian Brauner 2024-02-12   87  
bb8576deed306e Christian Brauner 2024-02-12   88  #ifdef CONFIG_PID_NS
bb8576deed306e Christian Brauner 2024-02-12   89  	seq_put_decimal_ll(m, "\nNSpid:\t", nr);
bb8576deed306e Christian Brauner 2024-02-12   90  	if (nr > 0) {
bb8576deed306e Christian Brauner 2024-02-12   91  		int i;
bb8576deed306e Christian Brauner 2024-02-12   92  
bb8576deed306e Christian Brauner 2024-02-12   93  		/* If nr is non-zero it means that 'pid' is valid and that
bb8576deed306e Christian Brauner 2024-02-12   94  		 * ns, i.e. the pid namespace associated with the procfs
bb8576deed306e Christian Brauner 2024-02-12   95  		 * instance, is in the pid namespace hierarchy of pid.
bb8576deed306e Christian Brauner 2024-02-12   96  		 * Start at one below the already printed level.
bb8576deed306e Christian Brauner 2024-02-12   97  		 */
bb8576deed306e Christian Brauner 2024-02-12  @98  		for (i = ns->level + 1; i <= pid->level; i++)
bb8576deed306e Christian Brauner 2024-02-12   99  			seq_put_decimal_ll(m, "\t", pid->numbers[i].nr);
bb8576deed306e Christian Brauner 2024-02-12  100  	}
bb8576deed306e Christian Brauner 2024-02-12  101  #endif
bb8576deed306e Christian Brauner 2024-02-12  102  	seq_putc(m, '\n');
bb8576deed306e Christian Brauner 2024-02-12  103  }
bb8576deed306e Christian Brauner 2024-02-12  104  #endif
bb8576deed306e Christian Brauner 2024-02-12  105  

:::::: The code at line 98 was first introduced by commit
:::::: bb8576deed306ec1ccebdccc4aa9664ed2db5514 pidfd: move struct pidfd_fops

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
