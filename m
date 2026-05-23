Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFBE38837F
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779540300; cv=none; b=MLqkvo3CSF4YhQFN+wIKLK/UHy3cenhmFb0HgWlRTdcl/ZuQ0iy8+Kt9uRiLNGE1JIVotMD5E36s1QP82nxyoSrZ5UtA8uUn6WI7arclZ5X4MLpeve23RLYOTd11l4TRgzUho1FiihsauKduJ38ijdlQJaYQAuGJncPR662HLtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779540300; c=relaxed/simple;
	bh=rhYHir9W8BEmLrvog5d59bXTWCx8FOvCJ1Imy9Uas60=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u+7hZ4lIkbV63rAr7n31cejxdslo/d9hKx2cCXhIfPZ4YVo6XsX7I1K0gyRs4nTtkonXA5LO8wVP0hXKAvDoYAiHUGOb5XO2YcsJYZjCX7YIP7Iisxi5C0DFIzjwjrG547UxZax/acID4YLek9/tK+f4EA56DzaxJIlyV1vEq7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9d39DlT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9d39DlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779540298; x=1811076298;
  h=date:from:to:cc:subject:message-id;
  bh=rhYHir9W8BEmLrvog5d59bXTWCx8FOvCJ1Imy9Uas60=;
  b=W9d39DlTgacTQ3H0JPAU0aczIqrTuKsY/r5jo0ilZ891FC6YZVRrSDFx
   qma86ffsMogUTCAPe7UXjplT8ae/yzYOveqa8pRxixJgS8MRtDVmudyFs
   7tE3wqBpgw6XafKXX/9qGxNJIhGfp5bY2yYhiWP78VZqODD4o2a9qsRj8
   4U6Pj09tnAciiKdxfCeErBwts4KV1uH7Gq1XONKQVWRYy52/Cufso3PGQ
   4fFBRQTVl0gJxJi0Lur9S9mKT+oG0PqDrJWxHU4ejyAR8HerV1kXe8yyV
   M6Q+9uqifDRZLBis1JYHzdgVjo33Eb/rdJAgf1IsvHBsEjoNM2J5g95Zj
   g==;
X-CSE-ConnectionGUID: Wrv9RB++TiCQRQDS26lG0Q==
X-CSE-MsgGUID: mDOHO2FwRrGbzqyMg3kCww==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80173295"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="80173295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 05:44:58 -0700
X-CSE-ConnectionGUID: Z8l2OlDQSPuZEgBFcLSglw==
X-CSE-MsgGUID: IDnLZ1y1ThilQVHlRb1Fzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="236733560"
Received: from lkp-server02.sh.intel.com (HELO 4bc6da68457b) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 May 2026 05:44:56 -0700
Received: from kbuild by 4bc6da68457b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQlin-000000000Io-3oVy;
	Sat, 23 May 2026 12:44:53 +0000
Date: Sat, 23 May 2026 20:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:vfs-7.2.procfs 13/15]
 fs/proc/namespaces.c:74 proc_ns_get_link() warn: passing zero to 'ERR_PTR'
Message-ID: <202605232058.7KbCN5zC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Jann Horn <jannh@google.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git vfs-7.2.procfs
head:   abadd84dab07b3f9e79455b467d9ff60d12940b2
commit: 0ec6945730e17fb8a44283114493b1a54caabf09 [13/15] proc: protect ptrace_may_access() with exec_update_lock (part 1)
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-141-20260523 (https://download.01.org/0day-ci/archive/20260523/202605232058.7KbCN5zC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605232058.7KbCN5zC-lkp@intel.com/

smatch warnings:
fs/proc/namespaces.c:74 proc_ns_get_link() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +74 fs/proc/namespaces.c

6b4e306aa3dc94a Eric W. Biederman 2010-03-07  41  
6b2553918d8b4e6 Al Viro           2015-11-17  42  static const char *proc_ns_get_link(struct dentry *dentry,
fceef393a538134 Al Viro           2015-12-29  43  				    struct inode *inode,
fceef393a538134 Al Viro           2015-12-29  44  				    struct delayed_call *done)
bf056bfa80596a5 Eric W. Biederman 2011-06-18  45  {
3d3d35b1e94ec91 Al Viro           2014-11-01  46  	const struct proc_ns_operations *ns_ops = PROC_I(inode)->ns_ops;
bf056bfa80596a5 Eric W. Biederman 2011-06-18  47  	struct task_struct *task;
db04dc679bcc780 Eric W. Biederman 2013-03-09  48  	struct path ns_path;
ce623f89872df42 Aleksa Sarai      2019-12-07  49  	int error = -EACCES;
bf056bfa80596a5 Eric W. Biederman 2011-06-18  50  
6b2553918d8b4e6 Al Viro           2015-11-17  51  	if (!dentry)
6b2553918d8b4e6 Al Viro           2015-11-17  52  		return ERR_PTR(-ECHILD);
6b2553918d8b4e6 Al Viro           2015-11-17  53  
bf056bfa80596a5 Eric W. Biederman 2011-06-18  54  	task = get_proc_task(inode);
bf056bfa80596a5 Eric W. Biederman 2011-06-18  55  	if (!task)
ce623f89872df42 Aleksa Sarai      2019-12-07  56  		return ERR_PTR(-EACCES);
bf056bfa80596a5 Eric W. Biederman 2011-06-18  57  
0ec6945730e17fb Jann Horn         2026-05-18  58  	error = down_read_killable(&task->signal->exec_update_lock);
0ec6945730e17fb Jann Horn         2026-05-18  59  	if (error)
0ec6945730e17fb Jann Horn         2026-05-18  60  		goto out_put_task;
0ec6945730e17fb Jann Horn         2026-05-18  61  
1bc82070fa2763b Aleksa Sarai      2019-12-07  62  	if (!ptrace_may_access(task, PTRACE_MODE_READ_FSCREDS))
1bc82070fa2763b Aleksa Sarai      2019-12-07  63  		goto out;
bf056bfa80596a5 Eric W. Biederman 2011-06-18  64  
e149ed2b805fefd Al Viro           2014-11-01  65  	error = ns_get_path(&ns_path, task, ns_ops);
1bc82070fa2763b Aleksa Sarai      2019-12-07  66  	if (error)
1bc82070fa2763b Aleksa Sarai      2019-12-07  67  		goto out;
1bc82070fa2763b Aleksa Sarai      2019-12-07  68  
1bc82070fa2763b Aleksa Sarai      2019-12-07  69  	error = nd_jump_link(&ns_path);
1bc82070fa2763b Aleksa Sarai      2019-12-07  70  out:
0ec6945730e17fb Jann Horn         2026-05-18  71  	up_read(&task->signal->exec_update_lock);
0ec6945730e17fb Jann Horn         2026-05-18  72  out_put_task:
bf056bfa80596a5 Eric W. Biederman 2011-06-18  73  	put_task_struct(task);
ce623f89872df42 Aleksa Sarai      2019-12-07 @74  	return ERR_PTR(error);
bf056bfa80596a5 Eric W. Biederman 2011-06-18  75  }
bf056bfa80596a5 Eric W. Biederman 2011-06-18  76  

:::::: The code at line 74 was first introduced by commit
:::::: ce623f89872df4253719be71531116751eeab85f nsfs: clean-up ns_get_path() signature to return int

:::::: TO: Aleksa Sarai <cyphar@cyphar.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
