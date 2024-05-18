Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19B8D517
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716021773; cv=none; b=hudStLNu7G46KUL+3OBQGWii7YAItSlccDq7Y5mVPW/bJxDYc/og8xJTUIGLqSfGGUfhFiVc81XulKPD0C5P4aecfzbqasjGLkx4KOIBeBlFQDWgWCm3vXe7gvXJ9CGdfdXNdWoRnzOs/Bjr7AL4Subb9V/8qIoVgzVxAlo3Fo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716021773; c=relaxed/simple;
	bh=o6/qfS6o/yBydtCab++/FqgLFxu5K6KdfmVDAyKDAps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B9iWnuBPHqN8Z0YOyXWvk7t4NV3Gl3nbEA9+6/acNB9TRzMp/fieCZNGx2qsfcbyLKrjMpyB3qzNVDHG6omUIPqGMCpgJOOVpzWNApWbsXA93SPc0VIf0+NV0q9KCH2UqTM5JmHvLoYlHpIchEPjX1+ip/QvkfAJ0Fg6omT6MaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwuGYdwY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwuGYdwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716021772; x=1747557772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6/qfS6o/yBydtCab++/FqgLFxu5K6KdfmVDAyKDAps=;
  b=UwuGYdwYkBlsO8x2UjJ7W/zwTpxCwh5K01QC4VL/tayfA8WulpPSk8vy
   LR75XyDdIwi5IwcJnfKMeWA/NcMLLB1GLe258667as2pNT/epZ83OjWCh
   j98WVFAsaTxNCYuow6ZeGVWvQKtSpcGHTt87dY1ihVzgcEuXFpQ333qXY
   N0Hb72uJCazk8NzP+dQp/xyhwh13xpd8vUDMyP7uU8TtybS97baUcWHay
   5/h3OAjiVwtYIUWF/wyRDvwiFyysBXoriI3RTLDRhpg1HrPhSQ2T8weYp
   a5XNu0edcvWMj+KETN3tem0r8Ja5AZO5sqWnXkAvhAznIOrB9HdISbbpy
   g==;
X-CSE-ConnectionGUID: d7kVR7ZKSd6qVaKn/OEKUA==
X-CSE-MsgGUID: 1b53/NnDRsqmcAC8arwmKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12081826"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12081826"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 01:42:51 -0700
X-CSE-ConnectionGUID: j/bpvYpgQ+6jTNfVCwIz7w==
X-CSE-MsgGUID: uFytEgOjSGuIJfFUV6cZfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="69486228"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2024 01:42:50 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8FeR-0001uQ-1C;
	Sat, 18 May 2024 08:42:47 +0000
Date: Sat, 18 May 2024 16:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cgroup_util.c:410:58: error: use of undeclared identifier 'O_PATH'
Message-ID: <202405181620.zh4EErMk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Edward Liaw <edliaw@google.com>
CC: Tejun Heo <tj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4b377b4868ef17b040065bd468668c707d2477a5
commit: c1457d9aad5ee2feafcf85aa9a58ab50500159d2 selftests/cgroup: Drop define _GNU_SOURCE
date:   5 days ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181620.zh4EErMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405181620.zh4EErMk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cgroup_util.c:410:58: error: use of undeclared identifier 'O_PATH'
     410 |         return open(dir, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW | O_PATH);
         |                                                                 ^
>> cgroup_util.c:468:19: error: use of undeclared identifier 'O_TMPFILE'
     468 |         return open(".", O_TMPFILE | O_RDWR | O_EXCL);
         |                          ^
   2 errors generated.
--
>> test_core.c:804:8: error: call to undeclared function 'clone'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     804 |         pid = clone(lesser_ns_open_thread_fn, stack + sizeof(stack),
         |               ^
   test_core.c:804:8: note: did you mean 'close'?
   /usr/include/unistd.h:358:12: note: 'close' declared here
     358 | extern int close (int __fd);
         |            ^
   1 error generated.
>> cgroup_util.c:410:58: error: use of undeclared identifier 'O_PATH'
     410 |         return open(dir, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW | O_PATH);
         |                                                                 ^
>> cgroup_util.c:468:19: error: use of undeclared identifier 'O_TMPFILE'
     468 |         return open(".", O_TMPFILE | O_RDWR | O_EXCL);
         |                          ^
   2 errors generated.


vim +/O_PATH +410 tools/testing/selftests/cgroup/cgroup_util.c

9bd5910d7f3db2 Christian Brauner 2020-02-05  407  
9bd5910d7f3db2 Christian Brauner 2020-02-05  408  int dirfd_open_opath(const char *dir)
9bd5910d7f3db2 Christian Brauner 2020-02-05  409  {
9bd5910d7f3db2 Christian Brauner 2020-02-05 @410  	return open(dir, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW | O_PATH);
9bd5910d7f3db2 Christian Brauner 2020-02-05  411  }
9bd5910d7f3db2 Christian Brauner 2020-02-05  412  

:::::: The code at line 410 was first introduced by commit
:::::: 9bd5910d7f3db2f65be139d2679dd9daa4a3419a selftests/cgroup: add tests for cloning into cgroups

:::::: TO: Christian Brauner <christian.brauner@ubuntu.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
