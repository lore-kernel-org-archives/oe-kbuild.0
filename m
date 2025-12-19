Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EFB3314AB
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 12:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145974; cv=none; b=DX+zeR/By7pBXAJoBjSAt+Yimi4+iXLSrzcxrnUS93Ir230vT5U3Tslwsn4DCnEFMl6+jlfrQYvTsbDdR72MZVZgtwDCl79JqdWofTqzYRe9F2VBqOWkviRyPNBOiNxn8lomSyNyWr+xenez2MD+dWurVGgGDDRWnwQ9V/VLgjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145974; c=relaxed/simple;
	bh=CkccP2TFPjRrBE51AOY09IhbrbWuuQvu0WO8DsPDd28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ADZVy3Z2eFwk4/ui0C+NjqJI79pC66r9T8NzQB15RgSuK3v6yQql1lBhKgUw625HNnXr5gdTda7C4Z268VpgWYjD/Vbohes3CP95OihE5CXLMElolZcL0RnYIARwA5MmiwIoRe+5nSa7Ak4a430POv8rmGnrmUpwPNIMTvvHOI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mh/fHFdC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mh/fHFdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766145971; x=1797681971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkccP2TFPjRrBE51AOY09IhbrbWuuQvu0WO8DsPDd28=;
  b=Mh/fHFdC7tIGXG7rgmXyqLodOy1lYwleKhcEIwzPchJYsNZt40aagv9L
   VzvQOvfrBzTlPW7MsskmZDrPSQOIVxKRDQq/Wnj5KaHi6uX21fDEs51e3
   OrvnDkf5f1tuDZma2IvIcIvnv/9sqtXL1bCfgDvekDdDhH6xYmSd0EH0l
   ABFr/N31Zu9d2xwwSdCEGIf0/Rtc4Af5z5tBvU++n4uWbgMSLcxdgs1n+
   KttFwX42mzhEnJ6ztYACdUNxDG4/8pz11iFF86gnr9WInzzk/jI/JWakR
   j6uRqC18fPY5RctNVSYlv6sGVq1ko+MDRM9apFfRf+kpd3eg/frHPdiGD
   w==;
X-CSE-ConnectionGUID: yiIyMqjxRzi2a0/hX91GlA==
X-CSE-MsgGUID: a5L23G2hQtun2OIjGy6GQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78424755"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="78424755"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:04:18 -0800
X-CSE-ConnectionGUID: z19h47PYQwOqPdJWIITFSQ==
X-CSE-MsgGUID: jqimjtWFQxCPJnsx5f7a8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="199666433"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Dec 2025 04:04:16 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWZDR-000000003Uv-3sKj;
	Fri, 19 Dec 2025 12:04:13 +0000
Date: Fri, 19 Dec 2025 20:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 43/43] fs/sysctls.c:32 (null)()
 warn: (struct ctl_table)->proc_handler cannot be NULL. Expression :
 fs_base_table[0]->proc_handler
Message-ID: <202512191929.yWyCMWgY-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 7f3340bf06f89278d69fb17a8274da2477206c41 [43/43] fs: fix sysctls.c built
:::::: branch date: 26 hours ago
:::::: commit date: 2 years, 7 months ago
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251219/202512191929.yWyCMWgY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512191929.yWyCMWgY-lkp@intel.com/

New smatch warnings:
fs/sysctls.c:32 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : fs_base_table[0]->proc_handler
fs/sysctls.c:32 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : fs_base_table[1]->procname

Old smatch warnings:
fs/sysctls.c:10 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : fs_shared_sysctls[2]->procname
fs/sysctls.c:10 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : fs_shared_sysctls[2]->proc_handler
fs/sysctls.c:32 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : fs_base_table[1]->proc_handler

vim +32 fs/sysctls.c

d1d8ac9edf10e8 Luis Chamberlain 2022-01-21  31  
ab171b952c6e06 Luis Chamberlain 2022-01-21 @32  DECLARE_SYSCTL_BASE(fs, fs_shared_sysctls);
ab171b952c6e06 Luis Chamberlain 2022-01-21  33  

:::::: The code at line 32 was first introduced by commit
:::::: ab171b952c6e065779687b44041038efdadb3915 fs: move namespace sysctls and declare fs base directory

:::::: TO: Luis Chamberlain <mcgrof@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
