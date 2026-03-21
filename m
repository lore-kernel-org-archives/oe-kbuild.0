Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34922E5B2A
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774113641; cv=none; b=lRxV+q0ZacVRizxxrKJaX9u3oShHxvDcAxBzYTJc3V4gKYs4BJcuKS26JSMsNIw6V+FOjbi8ADcwQqq2jIsjEwvxQeU8Cif+QcV7dtxl/SYPM5KzLdRxCeX8AjvNUkOqkuC7gyFKZwA1NqpJfFAExN0iC71Pzi/Hs5yPGLKWkJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774113641; c=relaxed/simple;
	bh=91pgOx4ASYi5OLUMCTREWbPMeKZYtjL23nDLIR6EHWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VgP2MQolSee9r1sx3Rq+pAqFo/GninHcEUKCT2JUWUTEHJ0EGGdZlboLIA4YOzBae6BMi5DcXfDaMkpWnMkSOE+Eoj/HSiHXwxgmO5NvBcE6ycp5XEFN8y+xsLwLqyAFRgiP8PSxAJoEAm+JT37So/29xa/BTaf8seL0cAz9gnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrlMIV92; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrlMIV92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774113639; x=1805649639;
  h=date:from:to:cc:subject:message-id;
  bh=91pgOx4ASYi5OLUMCTREWbPMeKZYtjL23nDLIR6EHWY=;
  b=lrlMIV92fRsWsBVLlwlK7+D5CzT1Kl4hY5KaDoIAHGOCTvZpBW6QlEhG
   IVZ1ftUsblMtjMkpt972pfd81G/QW8oHCAmooz97bgAjK77NJQtCLHguL
   cHMT46r/35TtcMrf1E6qNZEO05kz7i72dV69v153aNq2dW2eakoHw6C9O
   MsVHd4mOgA3lp4EykpfxJeROecrHM69zUdo1p3I0TGUc40WXvbujp94iU
   iYtvVzg64LxBrq8g2telOxIsZOFIKGn03bSS5pouv0pWvKOSEqQEzJD/r
   W5HqoIxe3kRc6+pz4nl3iDGj1d+z7z25BKyZGJgVgZJfXe6sZn5pyldcz
   A==;
X-CSE-ConnectionGUID: cShrIcW7RHSD3ataghGg3g==
X-CSE-MsgGUID: iEAOwbv1SqSuChv81Oe4Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="79037446"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="79037446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 10:20:39 -0700
X-CSE-ConnectionGUID: gu2xnKMZT9ujlZqzA05QJQ==
X-CSE-MsgGUID: 3qsKbGodQ5m/D6BHcJFndQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="222677413"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Mar 2026 10:20:38 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4004-0000000015U-0Bz5;
	Sat, 21 Mar 2026 17:20:36 +0000
Date: Sun, 22 Mar 2026 01:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent-io-tree.o: warning: objtool:
 btrfs_extent_io_tree_release+0xac: unreachable instruction
Message-ID: <202603220150.FNeZW61D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Filipe,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a0c83177734ab98623795e1ba2cf4b72c23de5e7
commit: e965835c9829b1188879f75d678e19f7ec110ac6 btrfs: rename the functions to init and release an extent io tree
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r053-20260318 (https://download.01.org/0day-ci/archive/20260322/202603220150.FNeZW61D-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603220150.FNeZW61D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603220150.FNeZW61D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_extent_io_tree_release+0xac: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: __set_extent_bit+0x2a0: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: get_range_bits+0x90: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: test_range_bit+0x6c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
