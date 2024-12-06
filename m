Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC40198A0F
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Dec 2024 04:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733460287; cv=none; b=ql/5D2UcW8fXOotT2CtdEIafvIMd/xbfxkrRka0DFt0Fm9lJiDky5ial/lO627eK1lUrF5aUWwC+s0JJeVPIMXowraTEU8f3z9E0d9aqjgHYewoXm163B2PuZZBMb1TcHRvLq+cbfSiZHDSB906UcSeTing/kdzxlvd20ftV+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733460287; c=relaxed/simple;
	bh=n2AhmHAHFgsj7SBP6tsrIinhxQDhNesB4i7p9oiryNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZrBke1e8AgZX4QfDyw4/uPy18yBJr7jes+egBL7dr1YMN/g+JX2dZ+3ctXylPz7Bxk50X8U5B7+ZQaLQREkq+GI2LkGbKmxfEu1EBH1rQxcCJ8D+4R0qfgFnjysSzGm/Nn9cc9/hAKaTP2zAnqYVk5ANTDz+9Aa7g0pnP65XYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PN1sUVkn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PN1sUVkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733460286; x=1764996286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n2AhmHAHFgsj7SBP6tsrIinhxQDhNesB4i7p9oiryNk=;
  b=PN1sUVknkA4wtDcB5I5erXT2Rv7ZkAHwTVDM7OjXYGBnKEV7HlTMYDSC
   xJelA0WRojhbm9wOpimK15XngCqGv2qbxIp/C/DoAyeOuUmr/1MaueLZq
   yAm9lsT/D3uaorsWFL1nAiW+TViMvnq3EdBthj1aHV8gLaadbeNUoxvnk
   +ZPP4bMYZjwlFAJeCOh4vcyJqOCgq5Fg51PswJ2sXa0S2snxrc5VG7Zke
   5eZn/9XNI3Fn1kTJCw/jaYVy9NTRVqFX/bOLTPPSeazQcUVimpf6HR5yQ
   wRBKD4SDPXVzmZkZ4snLVmrBsdf365wFRT2F0tf8Jp+kLxGSZ2NbNhTov
   w==;
X-CSE-ConnectionGUID: 7igmvRtOSkOV6DdPz7Iujg==
X-CSE-MsgGUID: Vu7esxNcQSSGy8XrcAIkFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="21394862"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="21394862"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 20:44:45 -0800
X-CSE-ConnectionGUID: zIQaNg2rR6CqBIQF9L0pzw==
X-CSE-MsgGUID: RLqTJaspQUKYsbN9LUVEUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="93976995"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Dec 2024 20:44:43 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJQCn-0000hr-1d;
	Fri, 06 Dec 2024 04:44:41 +0000
Date: Fri, 6 Dec 2024 12:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/rcu_pending.c:167:8-10: ERROR: reference preceded by
 free on line 167
Message-ID: <202412061222.HJOIs6vm-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f52214c61a5b99a54168145378e91b40d10c90
commit: d2ed0f206a9d8b3add18879f39dd128ff55e4d77 bcachefs: rcu_pending now works in userspace
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r062-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061222.HJOIs6vm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412061222.HJOIs6vm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/rcu_pending.c:167:8-10: ERROR: reference preceded by free on line 167

vim +167 fs/bcachefs/rcu_pending.c

8e973a4f3c7482 Kent Overstreet 2024-06-10  162  
d2ed0f206a9d8b Kent Overstreet 2024-08-23  163  #ifndef __KERNEL__
d2ed0f206a9d8b Kent Overstreet 2024-08-23  164  static inline void kfree_bulk(size_t nr, void ** p)
d2ed0f206a9d8b Kent Overstreet 2024-08-23  165  {
d2ed0f206a9d8b Kent Overstreet 2024-08-23  166  	while (nr--)
d2ed0f206a9d8b Kent Overstreet 2024-08-23 @167  		kfree(*p);
d2ed0f206a9d8b Kent Overstreet 2024-08-23  168  }
d2ed0f206a9d8b Kent Overstreet 2024-08-23  169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
