Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008291F12E0
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327271; cv=none; b=VFMmVxcisDFUG9OQukNK6c6vlOSHhP283aWxD6XnJA+nh3LrJyHucbj/wpJcNxyPGoV6dUuo2lDfFh2JlgOkKTBSW+h5slY3phXwKb5iEMg1bjIuTvmfxD7oCMH8bTVQJIgNafx5m+Y7VFHdhAamuDqjMFip3Kvsm9nlZh+ODQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327271; c=relaxed/simple;
	bh=gm0zrrQPgqfZkNSCIcsOxnXNIsRdryITC7CTWNuGXGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MoFoVe3BKipD7I9lQfGLGinReMdu39ke/hrPuOvPkPEzBFPj+NeqOwe0qmP18QBIZ2IM33jGJraZWsn7xRuSNBDt9t9XRYaSKIMVz69aTR/ClmawukIOkVpMTCC8nYTKnyo4U/WpkKcQYHzD6CxoSQOkQWe5+blgTGyiHHARsW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xpb2dZyI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xpb2dZyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736327267; x=1767863267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gm0zrrQPgqfZkNSCIcsOxnXNIsRdryITC7CTWNuGXGg=;
  b=Xpb2dZyIL/b30n36EAzu6CuJTNInDguwPLmLbTZ1BKRfMJpz/o4ayiGy
   ZfnBQ7Oiq9h45JSyrNTOPKI44HTTLqd4JP0uRKLJePeW5u7Q9ZS3jJGqV
   oJQUhYI+b1cIRjEwDLL1QKF0s53CPayIt8HaNL72JIluo8nlB1QXP2kZM
   m4h7qI+kqRoU8trDYAuokEf6sZHNOzZ7loll1xqOdd4QNVF8kDcGcjAr8
   fN3gPYAah2UeyrbFSXIt31C+duz7z0GW/HzejgMQoGM+z73ZGtKC57t1S
   KEcHxXTidz4iMWCRGr8vnigTYGiiqt8YFEpVvyKGRiU3yoIfU7niA1ZJZ
   w==;
X-CSE-ConnectionGUID: yfr+184BSSORlZL7iL81Kw==
X-CSE-MsgGUID: sybPbFzHQ665r/yHGP6OtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36759043"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36759043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 01:07:47 -0800
X-CSE-ConnectionGUID: 5RBdDRfyQaCDxdutiX7Uzg==
X-CSE-MsgGUID: O4LDffJ4Q1ys46hHzaJvog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107655090"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jan 2025 01:07:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVS2R-000FrF-1d;
	Wed, 08 Jan 2025 09:07:43 +0000
Date: Wed, 8 Jan 2025 17:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [staging:staging-linus 11/11] ld.lld: error: duplicate symbol:
 __cfi_mite_dma_disarm
Message-ID: <202501081759.vMe4r6EM-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: Lukas Bulwahn <lukas.bulwahn@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-linus
head:   84b172cea4a23016dc80a44eaa7ff8b7c97b04b3
commit: 84b172cea4a23016dc80a44eaa7ff8b7c97b04b3 [11/11] staging: gpib: refer to correct config symbol in tnt4882 Makefile
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250108/202501081759.vMe4r6EM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081759.vMe4r6EM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501081759.vMe4r6EM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __cfi_mite_dma_disarm
   >>> defined at mite.c:453 (drivers/comedi/drivers/mite.c:453)
   >>>            drivers/comedi/drivers/mite.o:(__cfi_mite_dma_disarm) in archive vmlinux.a
   >>> defined at mite.c:170 (drivers/staging/gpib/tnt4882/mite.c:170)
   >>>            drivers/staging/gpib/tnt4882/mite.o:(.text+0x980) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
