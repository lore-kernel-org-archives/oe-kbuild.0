Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532032;
	b=a3g8degBw05Wl/a8HixXm9D/PSg5+5THtK9ECjZVJcKByGLbXD3qke6+bVHV9OmCDBBJ
	 r8lnrQEA/p5hZbhY7BTWgsVC+wTn1jll042En+oGZYzom2ms6pGTYfUDu8CBbj3B66D5g
	 7MG0l7SrLcqTQ3IJe277Pi7xDZW9Dub5dnaiJZpDDK8jvvex9hy4EOcTQc3U/Q5uATv5K
	 jEWALhu7Z3LZn01vb4KkjcEuhBy/wnLM4JTuIlMOp/h/zoTghPs/xtv4RSvFMkFJaJhPW
	 YU/0W+hfxsslJJO2OyHcGkmP7TqbNmD8Tf4k4caSsKcUmp17GPnIDLWwdWusq6XRPhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532032;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fZ06zYDqnl8uorvvp2r/yOyN5aQVYjzoOb6xaJfy+Y8=;
	b=FBtF810gJkXHc96UVnPvobezAuQFO/QZjIlhkm5URyo49VezQ+U1So436TWQ40c4lTG6
	 N/slOla+oaF0IbdrjglTsGqz/7wUsgBISUfTSZwtVS7+r3U+brYBDY+Wi9WT3jCyRe5Jj
	 JbCQbHXUgRHNuY1bKrFori+2mk8UOR3qUCVj/oTU2YPskYtJwSjkJVqKthuxUZ/R+CwOg
	 a5fvM9ldlEKv26Zy6mYrwTpytGW5t4TjTLA9xac0FwTzdrbEUCmzyB67rckEjBfpsbFQx
	 C9qILL2Vk+TjsPmC0YwQ/BsyT5P8gHZ/VfU7uVo15or7AmzQxM+f8S732e1oXKKlm6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W1UqqjdO;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C58606A321
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 14:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C58606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W1UqqjdO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795532031; x=1827068031;
  h=date:from:to:cc:subject:message-id;
  bh=bXEUpLHY/hCDKXGdO4NgWotMl5IcPNXFCyTcixoZ+gw=;
  b=W1UqqjdOtwS/Jwg0bYV3S6R31C9JDasX77OcwxU+wjSt83Q5XQ671DsQ
   K4Cp21KLmgZ1k/Cen7fmiTVEQJp2RyU9Djbxv1jmVJ2jeF/g7c2WHBlN/
   9Ga/bAM6LSg5visq7XdjsrQtHaNWwN4sSexCJ0ehav8dnAHAcffbPAuNp
   qQW96Oss4/1dfnuxg4ZEVftNuBQl0AF0Mey8QE9HXxTGrMCszvz7F8LFW
   hU5wJEv2HYXe9pPSWClgedUsbXANDY6RKldeomtw+txmT11jbnmnEGwhV
   83SPGhM1fTHb9ml2RZUbucYuOaYb+WDwhpRASEKNQWEX8dv2yh4iDdmv9
   Q==;
X-CSE-ConnectionGUID: RnkFeOfvQhCcEM2+qgoDnw==
X-CSE-MsgGUID: ClvPTjI1QkOVnHQ6sCTDSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4286602"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4286602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 06:53:50 -0800
X-CSE-ConnectionGUID: igFoULIhQ2qchrhvfQcR+Q==
X-CSE-MsgGUID: dD11mJEOTm+/5Yeaz443Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11580365"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 24 Nov 2026 06:53:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVrty-000000005Dd-0w2g;
	Tue, 24 Nov 2026 14:53:46 +0000
Date: Tue, 24 Nov 2026 15:53:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/bio.o: warning: objtool:
 assert_bbio_alignment+0x2e4: unreachable instruction
Message-ID: <20261124155233.v8k6SCnt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
commit: ec20799064c881e373939ea3cea55b1c406c6b76 btrfs: enable encoded read/write/send for bs > ps cases
date:   1 year ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r2304-20261122 (https://download.01.org/0day-ci/archive/20261124/20261124155233.v8k6SCnt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124155233.v8k6SCnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ec20799064c8 ("btrfs: enable encoded read/write/send for bs > ps cases")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261124155233.v8k6SCnt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/bio.o: warning: objtool: assert_bbio_alignment+0x2e4: unreachable instruction
   fs/btrfs/bio.o: warning: objtool: btrfs_submit_chunk+0x838: unreachable instruction
   fs/btrfs/bio.o: warning: objtool: repair_one_sector+0x508: unreachable instruction
   fs/btrfs/bio.o: warning: objtool: btrfs_repair_io_failure+0x104: unreachable instruction
   fs/btrfs/bio.o: warning: objtool: btrfs_end_repair_bio+0x1bc: unreachable instruction
   fs/btrfs/bio.o: warning: objtool: btrfs_submit_repair_write+0x140: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
