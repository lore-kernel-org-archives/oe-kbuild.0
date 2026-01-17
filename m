Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4D950094B
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768665127; cv=none; b=L+PRKc6Pg7rHQOwvBmZCX0R8tea0oyztj6W/6G/x4BZlmRAjNJB6L9Svo1sCc12y5xr3u+4bG9XvV1WoMH6JCqHYJmdfAfDptkRJbrHxH0os47Cz1Zf/VZZhFyqG88jMIVirG6fejtcrancnJBgjVU/1gyDL/krviUps2twWjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768665127; c=relaxed/simple;
	bh=sWeq8fIjnWb19lgK26X0o2eobgIUaYPqa9HBAxGdD+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SNIjLjgrK33VuV3UANrHKQGUxRwA5lUdYpGs3HoMe+HlHKK9jPBnyIFBR9ydibTexLI7GFqTxAxc2Yxgm5rOJklVCy0Gkah8H8/G9hF2ufkBohbIhtOgpqGdp4NQqwm3IqbOhvMt9xrsLdgO9uKRas93OZ9Uiauy0ibZwXOvu2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgO5SlYp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgO5SlYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768665126; x=1800201126;
  h=date:from:to:cc:subject:message-id;
  bh=sWeq8fIjnWb19lgK26X0o2eobgIUaYPqa9HBAxGdD+4=;
  b=kgO5SlYp/UHf/EWxYwBGs9FF2T8rMj/QXcRBcb9qK3HO6zUHKv7zqS5x
   lO0WgtVfgUgZHucuC7+kvhv4OpBo/2sx3x4NCAfL5jpNtlmlVsMkQekuo
   JRZRRAiAFRQjIiyi8Al53MB0GLGA8ZdYLS1HQ6ZgbLmQW9PAfHevQix0a
   mqe/QSKCuvblrYq0dwpwFeuJwULAmhqQPdyg527yyVv0KhBrtw4DXLEk7
   srXhqULgwidYGQbePhj50H8WF5ckcOGGZ872Dmhvt2cWbHcHV0zoUDVFh
   Jl+CS0VvM+9/2ak+xv3/ivTVWfFWU4AFr5KnBdspgagiRdLvXpw0MV3rK
   Q==;
X-CSE-ConnectionGUID: 77u+d6Q2RSW4lZ9mx1e1vw==
X-CSE-MsgGUID: IVN5dN3HQYS9xIlJ59tiog==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69683604"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69683604"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 07:52:05 -0800
X-CSE-ConnectionGUID: CDkNiHPwR3qepkL0nzRX7g==
X-CSE-MsgGUID: SW/CoFtYRh29FxRWxMr1vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205906531"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2026 07:52:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh8an-00000000Lyi-1Dqh;
	Sat, 17 Jan 2026 15:52:01 +0000
Date: Sat, 17 Jan 2026 23:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [smfrench-smb3:for-next 44/44]
 fs/smb/client/smb2maperror_test.c:45:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601172351.y1uD9b7C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/smb/client/smb2maperror_test.c:45:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steve French <stfrench@microsoft.com>

tree:   https://github.com/smfrench/smb3-kernel.git for-next
head:   7e2b963b93483080d900f13e152acb63b7149f7a
commit: 7e2b963b93483080d900f13e152acb63b7149f7a [44/44] smb/client: introduce KUnit test to check search result of smb2_error_map_table
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-r111-20260117 (https://download.01.org/0day-ci/archive/20260117/202601172351.y1uD9b7C-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601172351.y1uD9b7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601172351.y1uD9b7C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/smb/client/smb2maperror.c: note: in included file:
>> fs/smb/client/smb2maperror_test.c:45:1: sparse: sparse: bad integer constant expression
   fs/smb/client/smb2maperror_test.c:45:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +45 fs/smb/client/smb2maperror_test.c

7e2b963b934830 ChenXiaoSong 2025-12-24  44  
7e2b963b934830 ChenXiaoSong 2025-12-24 @45  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
