Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02723264618
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Jul 2025 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753775635; cv=none; b=aGKVDyuQEGGzcp+U3ID4v7CAQqKEVqQR8QkCcNnD8T6o58n1dQbXMipvip8XtOZRMi5iu0Tj4t0L9k+aGVEh05q5laz9cZ+g2CkVUjUZOQfZURWZCe7Qp1MVape0vouf74dbwDcvL7WuqemruoubSNXNRvXDa+UN+lFbEaDDOEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753775635; c=relaxed/simple;
	bh=NA9UgjuuR6JpdH+Mg1UUUgXbiW0Y8Sf1ezNxQGVUD9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3VbUdC1Az9b/64WUr07vRIADJRUed1ZyBlmQ2XoHBezepYSmxehQfqd8YI3AcTwpue8PfKe+a/KlQpuQjIYcIFR4cH/m+7twPSKGlSE3a5i+7Jl6yXBcJ9yhPIMH/QfdaaR8rlEna4w7jgYipMoMLKeoEVNrsPk97IK/8w7C8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+5UKfN1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+5UKfN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753775634; x=1785311634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NA9UgjuuR6JpdH+Mg1UUUgXbiW0Y8Sf1ezNxQGVUD9A=;
  b=K+5UKfN1EYWA+uBPwzhvQ3HsgBzTYOLIBBe6YnuUeUiTADx/iSBn2kB0
   U9Q+6vplYe/ZAQeqEVAInf+gSwn1B32IYwneiSwOj4iI6B/9q7q27LI7P
   kuI4w3Wemz4z9lPMPM2DrJfWkSqmWlUhIc+y//T9Fv/htxi/fQt5N0kI/
   bgyPIhBIoIGkIZHHuVhso7NNRPAKrIgwiPCfhdq80XfH8IhHCoCF4LBrp
   Wg+DSAmlLU+tG87f93eCuLTQxKoA/kyvIkxKKKmzHYG1N4AGEqtqeEvlL
   cFVY6T46SNplChBaiwq61D6QxXllo5Ht0aj7wmY4aiFFZ8809pvpgKbJ7
   w==;
X-CSE-ConnectionGUID: C4Yc34f1Qc2TBW859mFIdw==
X-CSE-MsgGUID: cIIAJTtnRWiAyHcp0cC/+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67119788"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="67119788"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 00:53:53 -0700
X-CSE-ConnectionGUID: sSxbpScuTmOOY/FCn8O/IQ==
X-CSE-MsgGUID: OuhczWDXQDCpkf3e2F8MrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="163076584"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jul 2025 00:53:52 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugf9i-00016b-0i;
	Tue, 29 Jul 2025 07:53:50 +0000
Date: Tue, 29 Jul 2025 15:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: clang: error: linker command failed with exit code 1 (use -v to see
 invocation)
Message-ID: <202507291508.T5T8jh5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Johannes Berg <johannes.berg@intel.com>

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ae388edd4a8f0226f3ef7b102c34f78220756c3d
commit: 89350defd1f0eb5a58a7e1155d9e322080f0bf15 um: Fix passing '-n' to linker for stub_exe
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: um-randconfig-002-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291508.T5T8jh5f-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1b4db78d2eaa070b3f364a2d2b2b826a5439b892)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291508.T5T8jh5f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507291508.T5T8jh5f-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: argument unused during compilation: '-mno-3dnow' [-Wunused-command-line-argument]
   /usr/bin/ld: ../lib/LLVMgold.so: cannot open shared object file: No such file or directory
>> clang: error: linker command failed with exit code 1 (use -v to see invocation)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
