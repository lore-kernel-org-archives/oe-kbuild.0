Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CEE2FF65B
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076203; cv=none; b=NZcg8Y9tnrZFphZmBgWVfd7gp35HzZW/yGYYLwAD5mb/eKjrwVReMmACUoUPfZcNHSI1thckCaOfSDWuuh2vIE+xjvHhf+NU2TUV1g6j16/Bgdsg3q4YcMJ8MXxKCr8JZDE4CxiuYwahyP/ketHFTkwpydGgHEZqqQ0UTFGdZ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076203; c=relaxed/simple;
	bh=SADFSw05VSQhJDxpqEvTAd7iGZP3R2e7sH8zntmJtL4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q5tXOTEvo/I8Mc/reBDC/jg062qN2r0ZKxpfTNu6JA5jU49kwyTi9mghHYyBUaeopUeVhlc0aXfV9yxG3Gp77Bs8QGDPW7F6oxzUODvGdey2DHWU1PuamnEg8KQuq82hUuVwCQDds6yWjubQ0+WfFoyfXpPGWIwtAnsIGcyq/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6N2ngWb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6N2ngWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774076202; x=1805612202;
  h=date:from:to:cc:subject:message-id;
  bh=SADFSw05VSQhJDxpqEvTAd7iGZP3R2e7sH8zntmJtL4=;
  b=k6N2ngWbcCdFq41UAPA4pJL2PidSqMjH/1BdzYE4Nec5uq7HDzz9rczi
   rUG8nj3lnzGRUWI5ToMTzftlfm8nrWxS/gxhiNAjtXhO3NF09gBLnhrdO
   Q3tFsTRA2SfiEMSOLN4jfku4nICcxupKruqmBmsYN3KxS06eg3HgEZRcL
   TYMxvRMYGswO/YZgLZM6ZBXlB9PAuCfs50XO7VDW0b4WpEV+91vAGgUcK
   wYVa4zzZPv7aHY7Fey5M0FBcTzWuo+49v45pXV4dwPgxzk9e/syt3QcDA
   h9pg3Zat873nt1BNUyFreiHQHKnGDd6D8OoM5ufhjOUJ/doY0VtgVcem7
   w==;
X-CSE-ConnectionGUID: AjCZEg2/TwqzUkGfMy2IWA==
X-CSE-MsgGUID: /YOMvpxsQy2cKC+wjRJbWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75062957"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75062957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 23:56:41 -0700
X-CSE-ConnectionGUID: z/xfrrvhQeS5NgopO4WEGA==
X-CSE-MsgGUID: 5uAYCAYYSeC1YTS64YX/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="228448459"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2026 23:56:41 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3qFW-000000000PN-13iP;
	Sat, 21 Mar 2026 06:56:12 +0000
Date: Sat, 21 Mar 2026 14:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/file.o: warning: objtool: copy_one_range+0x354:
 unreachable instruction
Message-ID: <202603211416.Upoueljo-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a0c83177734ab98623795e1ba2cf4b72c23de5e7
commit: 581bb9e761f93df37c40ff8e6904796aa6d8aa41 btrfs: refactor how we handle reserved space inside copy_one_range()
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r053-20260318 (https://download.01.org/0day-ci/archive/20260321/202603211416.Upoueljo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211416.Upoueljo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603211416.Upoueljo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/file.o: warning: objtool: btrfs_dirty_folio+0x110: unreachable instruction
   fs/btrfs/file.o: warning: objtool: btrfs_drop_extents+0x3e0: unreachable instruction
>> fs/btrfs/file.o: warning: objtool: copy_one_range+0x354: unreachable instruction
   fs/btrfs/file.o: warning: objtool: btrfs_sync_file+0x5d8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
