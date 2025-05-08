Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029A3153BD9
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712747; cv=none; b=CAIsP/9lGxZP5Y1Xz1Gmt+lpQpmftDenawGLu2PZXMeQ6CBIZxKj59U6fbo3RIjjUdFnfSo3e9quttp8JF/wuEOxyBLJsUaf6qktF4b0vZq97vSTAwXhJDDgRqiLvalBbMNSaukEUGnHDTi1VROxHcaKLoh//ZdHr52wp8WHMOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712747; c=relaxed/simple;
	bh=Ty6ZJHiwhsPB99LUPFGVR+qYDB+TXA0pa5zbLUvhrgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JejCD0vLttsJ9E5Jo+J7aJmlZFewipAFv4+a3+zg1dCNia8x22KKJ0skCO+o2iz0sPAx/Hhk3EMKJLz8RFxFZCFHVyjAun5rw0MFMUC98W/VMEwVuCIdCAHdcbN/Y7cWpnEmXaobKwk0p/l2zC9NhUSK8RvlzXLnB560LjTlVzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcZ5vL4V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcZ5vL4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746712747; x=1778248747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ty6ZJHiwhsPB99LUPFGVR+qYDB+TXA0pa5zbLUvhrgc=;
  b=HcZ5vL4VJHHuLzohZNd7ZnPrnuy35Jzmg4QFd2yFkdib3OY1MoQiV8j1
   0oDL5u7c1E3AvYYpnsFKzronXM+LMFtCVvSkrTOhWfFTtgEawOZVezc/P
   bdN+BwZF1iVF4MHYE7mp4rQpj61ep5DWMvjOdVZIyzF4f3ud3tgRs2uFc
   2U7WpX0oenalb7NkO8xXHvloThXDIQV9Q00KfPYenJfwQiUYSguCWNccQ
   k/xgmaMf/y9aqrNE48zxOM92z+OdGcV7H6Zyt9z+FJ9dDQPpk6NJbxfVO
   zDHv6pcgU7cU9vtr637TjhEyEJ/CTovu8q9KHJtAAIAHxMuYuuq8Dc+qo
   A==;
X-CSE-ConnectionGUID: ZTny8jczSvKnm8V1P9wQ8Q==
X-CSE-MsgGUID: M19wnDEERU+1EVln/Y283Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="71007645"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="71007645"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 06:59:06 -0700
X-CSE-ConnectionGUID: M+uxpP8pTEGu03ocS7mJGg==
X-CSE-MsgGUID: 1KQAa2qgT3KU7YI4XIaPzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136236009"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 06:59:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD1mA-000B1a-0R;
	Thu, 08 May 2025 13:59:02 +0000
Date: Thu, 8 May 2025 21:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:work.coredump.socket 16/19] fs/pidfs.c:607:2: error:
 call to '__compiletime_assert_461' declared with 'error' attribute: Need
 native word sized stores/loads for atomicity.
Message-ID: <202505082112.7bJXJxXT-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.coredump.socket
head:   bc6c0c24d12262711c2c7f04f2f7fb37af6ee342
commit: 67685311fdc135568fc80417d4f8b7ede7b7f08d [16/19] pidfs, coredump: allow to verify coredump connection
:::::: branch date: 71 minutes ago
:::::: commit date: 22 hours ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250508/202505082112.7bJXJxXT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505082112.7bJXJxXT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505082112.7bJXJxXT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/pidfs.c:607:2: error: call to '__compiletime_assert_461' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
     607 |         smp_store_release(&exit_info->coredump_cookie, coredump_cookie);
         |         ^
   include/asm-generic/barrier.h:172:55: note: expanded from macro 'smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^
   include/asm-generic/barrier.h:141:2: note: expanded from macro '__smp_store_release'
     141 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro 'compiletime_assert_atomic_type'
     560 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:104:1: note: expanded from here
     104 | __compiletime_assert_461
         | ^
   1 error generated.


vim +607 fs/pidfs.c

4513522984a0af Christian Brauner 2025-03-05  595  
67685311fdc135 Christian Brauner 2025-05-07  596  void pidfs_coredump_cookie(struct pid *pid, u64 coredump_cookie)
67685311fdc135 Christian Brauner 2025-05-07  597  {
67685311fdc135 Christian Brauner 2025-05-07  598  	struct pidfs_exit_info *exit_info;
67685311fdc135 Christian Brauner 2025-05-07  599  	struct dentry *dentry = pid->stashed;
67685311fdc135 Christian Brauner 2025-05-07  600  	struct inode *inode;
67685311fdc135 Christian Brauner 2025-05-07  601  
67685311fdc135 Christian Brauner 2025-05-07  602  	if (WARN_ON_ONCE(!dentry))
67685311fdc135 Christian Brauner 2025-05-07  603  		return;
67685311fdc135 Christian Brauner 2025-05-07  604  
67685311fdc135 Christian Brauner 2025-05-07  605  	inode = d_inode(dentry);
67685311fdc135 Christian Brauner 2025-05-07  606  	exit_info = &pidfs_i(inode)->__pei;
67685311fdc135 Christian Brauner 2025-05-07 @607  	smp_store_release(&exit_info->coredump_cookie, coredump_cookie);
67685311fdc135 Christian Brauner 2025-05-07  608  }
67685311fdc135 Christian Brauner 2025-05-07  609  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
