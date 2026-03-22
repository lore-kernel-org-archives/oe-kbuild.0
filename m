Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CAA367F2A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774193989; cv=none; b=N8oIMCMcf6/ZS0X8Tp0z/mbflyP08nJXUO30xjRF/98nxb4vFnAWUurfafZyezqTGVHadvrntBVDiojZIAFPx6jYGypxsGNTxTdpZP8R1yjdmdICaRop0JOq3Q29MZTFwkfW+5iM9RuMDiIM9m+JfDhhsZcFi1yRsVM0rRJC6U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774193989; c=relaxed/simple;
	bh=XVoJbTomm/bJWgxV5iH5h2ThpUGwEZus802XuWOObqU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O2P/EKYdWQm4uOeAjZZNhgkGKm/glL21lMT5VYR3OkRbwBnlFCGk4+RmlcDidJqLPPIydfzyNqNzMVQf+EVoSaXg8Lu/JMALROpMuQusLOVF1pkatMRpQjnUK8zZBAXnN/Mxpkg2LwctHb+gOti0uwtdgUYiui0d3Q/yvfOK+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4HAJTlQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4HAJTlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774193986; x=1805729986;
  h=date:from:to:cc:subject:message-id;
  bh=XVoJbTomm/bJWgxV5iH5h2ThpUGwEZus802XuWOObqU=;
  b=Q4HAJTlQjO/UU3H6gT1bBJaLayyHFSl4RePpz/t9z6W+Ci+uz8Ecfyfr
   QOKX0qv6KdGA0a5dwA9KPk8yiuDWJF8mJypvJ3+7TGKBCwEAwvfJaeGBw
   JLW9akSi5b5SngP56qEC3dm5tp4VHkudvaDVFtpLUbS00g7En+fH75MPh
   lMsKD8xvguDqxi44XtHtsjKMRoXgLKpUSPNWmhpg28lzbyBKSjzvbHTaJ
   unbNA9F03xHtV/03XYYn8PdF1S2JMnkzhRFXehxa/0DEBOfVzeNNRPDQM
   cPlYHUVLp4VoFryrUzBXKLuf6oXu06v+3CLiIXBUf0H4AOubPGs3TmyYK
   Q==;
X-CSE-ConnectionGUID: 69mB+7xrQHy8TMIxlP2m5w==
X-CSE-MsgGUID: 0dWT9LOFQme8SSs6FbfB6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74231343"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="74231343"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 08:39:46 -0700
X-CSE-ConnectionGUID: 1CS6Yy/ATEO3tNbbBHEnRA==
X-CSE-MsgGUID: 7yx+0BTiRkOgD6swgsSoYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="219482158"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2026 08:39:45 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Ktz-000000002JH-0Jpt;
	Sun, 22 Mar 2026 15:39:43 +0000
Date: Sun, 22 Mar 2026 23:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent-io-tree.o: warning: objtool:
 set_extent_bit+0x2a0: unreachable instruction
Message-ID: <202603222329.4NubzHdd-lkp@intel.com>
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
commit: 00ba32e5be977fc156fa5a2e5bdf6d1f6570452f btrfs: remove double underscore prefix from __set_extent_bit()
date:   10 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r053-20260318 (https://download.01.org/0day-ci/archive/20260322/202603222329.4NubzHdd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222329.4NubzHdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603222329.4NubzHdd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_extent_io_tree_release+0xac: unreachable instruction
>> fs/btrfs/extent-io-tree.o: warning: objtool: set_extent_bit+0x2a0: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_get_range_bits+0x90: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_test_range_bit+0x6c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
