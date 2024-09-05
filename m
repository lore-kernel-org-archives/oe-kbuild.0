Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D881361
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Sep 2024 00:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725495175; cv=none; b=Lhgiy7OjpfFR5R9ZKZfcOtUjVw73KRNS0OYuMN7dRPvNjX4q3OC+PwPGq4goSyXiN+9T52FWY+3sNVagCwplhADJOypr1g5DcuBg6H0/uk/g/gdbgD58Uybor8tPjO8qnQimU2rF1qaJoXI1m5/+6QZqfNJ/EeQvVLWOnjCgZT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725495175; c=relaxed/simple;
	bh=iR3WkTepj0gRYXtd4gLcLcypaUDuwU2fbZ/KJhP43eY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WofZIkXuDVDThnn7jbL2/HMUYkVBeab6FmNtyR8rJl4QmlxG4UPLjKfkJOgqSyKbjc6fOIfq9L1o3A8okVZipiEDnsv7/LklILhOqULz3oGxzM6PXg6upiWlbre3r5RJOcYu9xvu18mXb99q8DhkUGPWphneKZBOcDBewwqJHrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mmf/150D; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mmf/150D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725495174; x=1757031174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iR3WkTepj0gRYXtd4gLcLcypaUDuwU2fbZ/KJhP43eY=;
  b=Mmf/150DvXMW3Bz8YQC8jMBZlIMvOt+rMEhlD/0FpmkFm7FBuCFjuGM7
   g6hj4KgPz04jQR56wfw28fBdrE/gg8a3KkaOqm1SbxQ3xKJE4aVxdqXrR
   febBxy3F8bVzD80TESjc18ePJHYmVUotyTBLma+swcXGUX9LTIWyAnVhO
   /YrJCAZ5SLgZMc43ZSRiXZA9tJKu0Z9Ho3xLmtZifHCEZfSDqZeHN5nTO
   9q3tGzFFe7pR03pzWKNpwp89AWXdZ1/UI8Kk/53Ob2ghma93560yYJxCa
   RyVBEcN8aZxhRpzWPYsMddDPSIa8dVddlbSa1GzRJZHHLYqGpqAtiMJHo
   Q==;
X-CSE-ConnectionGUID: WPiY7B/sTLeP1DYUKJd7fA==
X-CSE-MsgGUID: AliVKkC9SU6LL2grTbQySw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="46713283"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="46713283"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 17:12:53 -0700
X-CSE-ConnectionGUID: UqcTpFSeSzmnWzbo635i3g==
X-CSE-MsgGUID: JH9lrJVlRh+H21/kzRyl+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="65451686"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Sep 2024 17:12:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm07G-0008il-0R;
	Thu, 05 Sep 2024 00:12:50 +0000
Date: Thu, 5 Sep 2024 08:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-vfs:vfs.misc 55/57]
 tools/perf/trace/beauty/generated/fs_at_flags_array.c:10:24: error:
 initializer overrides prior initialization of this subobject
Message-ID: <202409050844.id41fEap-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Aleksa Sarai <cyphar@cyphar.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Josef Bacik <josef@toxicpanda.com>
CC: Jan Kara <jack@suse.cz>

Hi Aleksa,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
head:   5b53696a4ef157a228d75673297bddbfb33b01e4
commit: 34cf4084965437b9d1b470067b0b3155dbc119d6 [55/57] uapi: explain how per-syscall AT_* flags should be allocated
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409050844.id41fEap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409050844.id41fEap-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc4.g34cf40849654
   In file included from trace/beauty/fs_at_flags.c:21:
>> tools/perf/trace/beauty/generated/fs_at_flags_array.c:10:24: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
      10 |         [ilog2(0x0001) + 1] = "RENAME_NOREPLACE",
         |                               ^~~~~~~~~~~~~~~~~~
   tools/perf/trace/beauty/generated/fs_at_flags_array.c:6:24: note: previous initialization is here
       6 |         [ilog2(0x0000) + 1] = "STATX_SYNC_AS_STAT",
         |                               ^~~~~~~~~~~~~~~~~~~~
   tools/perf/trace/beauty/generated/fs_at_flags_array.c:14:23: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
      14 |         [ilog2(0x200) + 1] = "HANDLE_FID",
         |                              ^~~~~~~~~~~~
   tools/perf/trace/beauty/generated/fs_at_flags_array.c:13:23: note: previous initialization is here
      13 |         [ilog2(0x200) + 1] = "REMOVEDIR",
         |                              ^~~~~~~~~~~
   2 errors generated.
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/trace/beauty/fs_at_flags.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: trace/beauty] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:760: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:290: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
