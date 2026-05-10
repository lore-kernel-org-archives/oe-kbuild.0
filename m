Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E08313522
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 20:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778446191; cv=none; b=hNa1on+eOSGKgKhsQEg0AWGuWmRrSJY53prtOVyTlE0YuRFJE9xt5oNjXypHoq3lwfxv8z672/acT/2qbU/SMik1PPeoKpXuFkV5DaLLVn1dwxvBzUISYCAg5QF4mfK2KYxx3CcvP3ca7wVTLU8xEcp+ekDXP0AI+3118F/P8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778446191; c=relaxed/simple;
	bh=NYYh87PQlsR/GhYSJP1N57iFNstJ9iDc/GkJ+vF/VTE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BQutLYgMZ5CQgk6nLqJPksGOfFwM2vb87Li01mj/Tp73YMv9QIfLstdrg+dIuVQkHUqLl18Ci5bzeuDYGiAjphNHGcaEsaFQC8wltSdaIhlJ7gsn6Yhz0SQgq63Ux1Q0aPsmWFSsiM+tPed4lRiRybKzFLsFPzHdcsTq6WZ8fZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLDXxR5k; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLDXxR5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778446190; x=1809982190;
  h=date:from:to:cc:subject:message-id;
  bh=NYYh87PQlsR/GhYSJP1N57iFNstJ9iDc/GkJ+vF/VTE=;
  b=CLDXxR5kF6ZTPOwe+8DtgukydRg6NM4xUR0XHFwazv2tf29Ht/9Xerro
   uQODUKkHOaiDoRpbEuTO++vCXEyhv4cuGxhCbdtR/29YM016IgvvctmYN
   WKnzekwovNvsQlF1q3zedlmG3N9qld7pQU8hHGYTEa+//d1AbyG/Tkc0z
   JlB20DQn4C98YHV0WnlgW2Dgoj7i7VYq/QA7WtkvuDla6j3T+mlWu9uIv
   tlgJTTHlGP/Sn/FSoecsPbW3gzPUFPMclHa93iE859tzf4v2mVIyGxp3z
   /zmFJpwXkaiOusw+ktiyR9lUfNeF2L0sQXSQ9GRas/rMW0Zx6Kfe1yAIT
   w==;
X-CSE-ConnectionGUID: tVL5FmdHTeSUE3sTDyqQxw==
X-CSE-MsgGUID: +PIMKAFdQ+KDKPJrnm5i+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79064707"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79064707"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 13:49:49 -0700
X-CSE-ConnectionGUID: KiQIve+kSIa9hi6eQXHvhQ==
X-CSE-MsgGUID: hWtvAqgsS96wSOQUTDZdrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="242250773"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 10 May 2026 13:49:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMB5t-000000007mF-3dKy;
	Sun, 10 May 2026 20:49:45 +0000
Date: Sun, 10 May 2026 22:49:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: nolibc-test.c:1522:23: error: storage size of
 'tmp_statfs_buf' isn't known
Message-ID: <202605102227.06itSwzF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Palmer <daniel@thingy.jp>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Daniel-Palmer/tools-nolibc-fcntl-Add-fallocate/20260510-211353
head:   f565c376deb9d1f1915bf8ca714284288e637e4e
commit: f565c376deb9d1f1915bf8ca714284288e637e4e selftests/nolibc: Add a very basic test for fallocate()
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260510/202605102227.06itSwzF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605102227.06itSwzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605102227.06itSwzF-lkp@intel.com/

All errors (new ones prefixed by >>):

   nolibc-test.c: In function 'run_syscall':
>> nolibc-test.c:1522:23: error: storage size of 'tmp_statfs_buf' isn't known
    1522 |         struct statfs tmp_statfs_buf;
         |                       ^~~~~~~~~~~~~~
>> nolibc-test.c:1539:13: error: implicit declaration of function 'statfs'; did you mean 'statx'? [-Wimplicit-function-declaration]
    1539 |         if (statfs("/tmp", &tmp_statfs_buf) == 0 && tmp_statfs_buf.f_type == TMPFS_MAGIC)
         |             ^~~~~~
         |             statx

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
