Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08BCB640
	for <oe-kbuild@lists.linux.dev>; Fri, 17 May 2024 03:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715918301; cv=none; b=Mj3qWJCYEX9GkhPRtKTTRNWxnXpYNjfzhryxB8fUPU6zuCfhgOF6+lJlLdb9b9WmmIbvg8rSz1/FcBLfUFmWVQA9KjAH4mEGtaScr/5xtxFiAr71v7jEMP/2e8FtcLM2Yug/KsPy98iugVXqQ/j9U57S3utzA/UY5e1PeGXiK5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715918301; c=relaxed/simple;
	bh=3r5TTIx59BfvSoP/8XYPHMspB3UKqprCERqloBbWcWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FmubVfxzKbh4p+CZ7xIMAoXq4goyragMGW5J1OR9NQtU3yuPMIfFTllvzxOco+8/QkwPP8Dj6HlT2bD6Gdn22YITCdFdI8p7/UasB37qiu1mmI4u0yFk80wKrmNj2R9ffu8GkSepPqlwHlMEJic1CReJtUvKcxPkHm1cx1vFD14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mq5/qBFR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mq5/qBFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715918298; x=1747454298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3r5TTIx59BfvSoP/8XYPHMspB3UKqprCERqloBbWcWc=;
  b=Mq5/qBFRw74WNFIKGIdRphL4CKS3x5yZ6ZAjfQyqRd7sdFOXaTU/cbv5
   vulbaEnXE0iinJUP2/oAwHcTMwMcOiDUzaKLu6NHR9c9lPABBHt6bvEOJ
   gGziYgxUu9ZQUGZdyUxzKh9K6RLVQiqw+jLhjQ/m8P4ubaKhxVQkb/ILJ
   vZShXm/MR01hWHTFAmIDo4IggoSAdfrNOHmFRIVePQ2hv0hcA5nXKDN4h
   +5KvodhvL/0BMXZF0KSI76G/0AtzV8vrIXf9+D8FVWVgJzsJDeC7Q+ol3
   2ImVmuW0YicCYzaF64cZpXn9E2xU8j8e88Syq1DQ+gacLwnQb2SRfTsat
   Q==;
X-CSE-ConnectionGUID: 7UjP+bWlSl25RB4foD7Cwg==
X-CSE-MsgGUID: 1Wr2tr84Qkyu0JQ0GqKgOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15860676"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="15860676"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 20:58:18 -0700
X-CSE-ConnectionGUID: SKojIL9oRQKsbmn/+lB0dA==
X-CSE-MsgGUID: mhaPy0p9SJSX/Z0JmGUu2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="54880362"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 16 May 2024 20:58:17 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7ojW-0000B9-36;
	Fri, 17 May 2024 03:58:14 +0000
Date: Fri, 17 May 2024 11:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cgroup_util.c:410:65: error: 'O_PATH' undeclared
Message-ID: <202405171144.KpYfFYKr-lkp@intel.com>
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
head:   ea5f6ad9ad9645733b72ab53a98e719b460d36a6
commit: c1457d9aad5ee2feafcf85aa9a58ab50500159d2 selftests/cgroup: Drop define _GNU_SOURCE
date:   3 days ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171144.KpYfFYKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405171144.KpYfFYKr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   cgroup_util.c: In function 'dirfd_open_opath':
>> cgroup_util.c:410:65: error: 'O_PATH' undeclared (first use in this function)
     410 |         return open(dir, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW | O_PATH);
         |                                                                 ^~~~~~
   cgroup_util.c:410:65: note: each undeclared identifier is reported only once for each function it appears in
   cgroup_util.c: In function 'get_temp_fd':
>> cgroup_util.c:468:26: error: 'O_TMPFILE' undeclared (first use in this function)
     468 |         return open(".", O_TMPFILE | O_RDWR | O_EXCL);
         |                          ^~~~~~~~~
   cgroup_util.c: In function 'dirfd_open_opath':
>> cgroup_util.c:411:1: warning: control reaches end of non-void function [-Wreturn-type]
     411 | }
         | ^
   cgroup_util.c: In function 'get_temp_fd':
   cgroup_util.c:469:1: warning: control reaches end of non-void function [-Wreturn-type]
     469 | }
         | ^
--
   test_core.c: In function 'test_cgcore_lesser_ns_open':
>> test_core.c:804:15: warning: implicit declaration of function 'clone'; did you mean 'close'? [-Wimplicit-function-declaration]
     804 |         pid = clone(lesser_ns_open_thread_fn, stack + sizeof(stack),
         |               ^~~~~
         |               close
   cgroup_util.c: In function 'dirfd_open_opath':
>> cgroup_util.c:410:65: error: 'O_PATH' undeclared (first use in this function)
     410 |         return open(dir, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW | O_PATH);
         |                                                                 ^~~~~~
   cgroup_util.c:410:65: note: each undeclared identifier is reported only once for each function it appears in
   cgroup_util.c: In function 'get_temp_fd':
>> cgroup_util.c:468:26: error: 'O_TMPFILE' undeclared (first use in this function)
     468 |         return open(".", O_TMPFILE | O_RDWR | O_EXCL);
         |                          ^~~~~~~~~
   cgroup_util.c: In function 'dirfd_open_opath':
>> cgroup_util.c:411:1: warning: control reaches end of non-void function [-Wreturn-type]
     411 | }
         | ^
   cgroup_util.c: In function 'get_temp_fd':
   cgroup_util.c:469:1: warning: control reaches end of non-void function [-Wreturn-type]
     469 | }
         | ^


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
