Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F0347C6
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 02:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774146849; cv=none; b=lWZY6kxwXIZuTdAizJ7y5Sv7XXD3hrlkEcId/W+5AKCny/n3gBtVdgsXn7xZEz2U/BpqZCT5TvhwL8QT/S53REmq3ryxTty5MvFBhhanOHCHO/YIA72uC/1uENaY48Fra7VXJnfj8Xa6ixz9PCIg9708EbdgMVlNuEsXPhOym5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774146849; c=relaxed/simple;
	bh=/fuBIVJoMviT7gHb2X2lO1EtkGvmkS7yh/9HHVhPOmE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jNwX7Z8dHK2C9axIFCSv6Pf00LmCPuNGDdJd5Qp4EYnO5eCTPNaFTjwIynRWgmXPOn9lO/6Xt/mdCGaYUV0IvW3GFtnsKJ2FFDIJCD/ubOAmNBCV5w8QzSWna5dRPEivc1oUC1OoVNkegL2o2s814wUNu0OGv0ceEFhEjH4t8R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJVig6h9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJVig6h9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774146848; x=1805682848;
  h=date:from:to:cc:subject:message-id;
  bh=/fuBIVJoMviT7gHb2X2lO1EtkGvmkS7yh/9HHVhPOmE=;
  b=eJVig6h9JmirM3kN3L9+xhywwiP9aNdLOvDFpSMkCfbW91YYqbWRZZwS
   D69VUn6RI/Yixh4KHVarCoTh/yE5EVDTPzw9DpEFUDrX6h/6gfNseeTag
   FXs6X1Yrke7TWZUg6hKzG7xcnJnqhYD7oZTNUy4g/e0TPVYCpL5Xjv43y
   bPGwdxKErElP85GX4+Pe9e0Jxeri8i5/X4Ipr6NN1dsM7N5Bm1668nShJ
   Htl+VplZM8klhhbP4Hh5QucoVqPn8HcVbTAUfu5w9hhOHSy9DbzGjbhdj
   HITRjmgeCfmPwXY/68I/E2UwOX7jxFDEfpCqhMGmttbO4NpmBqzU9coVg
   w==;
X-CSE-ConnectionGUID: D/C6bt2VTGWokjS5TaXPvg==
X-CSE-MsgGUID: HNe+vgqkRBinFPyOkOI7Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="79050875"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="79050875"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 19:34:07 -0700
X-CSE-ConnectionGUID: TX5d4VxrRKmUK385wqAe5A==
X-CSE-MsgGUID: XxO04CS1TiOAtXet57d4gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="220494775"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2026 19:34:06 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w48dg-000000001Xh-0bwU;
	Sun, 22 Mar 2026 02:34:04 +0000
Date: Sun, 22 Mar 2026 10:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent-io-tree.o: warning: objtool:
 btrfs_get_range_bits+0x90: unreachable instruction
Message-ID: <202603221030.J1lfGV13-lkp@intel.com>
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
head:   113ae7b4decc6c2d95bdbbe52e615a0137ef7f9f
commit: f81c2aea711205c1a4f41e4aaf960053eddba0b9 btrfs: rename the functions to count, test and get bit ranges in io trees
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r053-20260318 (https://download.01.org/0day-ci/archive/20260322/202603221030.J1lfGV13-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221030.J1lfGV13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603221030.J1lfGV13-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_extent_io_tree_release+0xac: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: __set_extent_bit+0x2a0: unreachable instruction
>> fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_get_range_bits+0x90: unreachable instruction
>> fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_test_range_bit+0x6c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
