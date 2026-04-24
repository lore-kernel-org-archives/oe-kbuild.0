Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485F417D6
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Apr 2026 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025763; cv=none; b=MDN3tHCmVeFj5yYlIIp4jrJDCMhtcAbI9CMjnS4o678vkRiqMAvN5R7ljaVlZiTdqfwMKiFbol9YAIWZd9T9hRcjsIPdG6m+ybY+dj8lTBvyA5fViyIf+w8dv+GPlSihAQRoQXccZW3wDWGZ+8VMxM3YvRYAlWXq74qJ/yJ67cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025763; c=relaxed/simple;
	bh=zptUAau/MSHyiC7NXSHw/yFlFOwwYNgeNSf7/Y9Jo18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iOpkdybwv4uO3tUbsiMAoPw41xRQuLNUGXU+mRhOwi+wgQ52mcnjaKALvYkXBFNGQfCZNnRY+1rv1/KmGf9+Rv4YAaP2R9Aa7lGo3WxYqP7vUOfb0yYtZBjsQPy9p1XV2TplZ04N+IK0BZMJBCoypxacBkxw88tZtNzm1PLrzp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBexkWDo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBexkWDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777025762; x=1808561762;
  h=date:from:to:cc:subject:message-id;
  bh=zptUAau/MSHyiC7NXSHw/yFlFOwwYNgeNSf7/Y9Jo18=;
  b=QBexkWDoqTxStkf3Zax7zaX3+Uk70eezZ/XjQmgyPjoDyLx9UAAs95Vl
   5Sky5T37lYKzRHgluCnlP5XhLTRZfz1nwrKDsgK/3JEMzEVXouu2KKeUw
   kNEoBLisMRLjUdhNbSKpDR7XmdAJCSG4R4GG3W+qRfuFQCxdfbjO8J6vQ
   GjtoQl0tIQw5oEyzP08VeSXaNARa1pG4UNJugzwQgbzqMTBgRVVqkJMTS
   dXPnwxq0mF0hTbCBlll/Xj/F11NYsrgeZLj8OqVDd4ERfJWMZkqayXNpL
   zs9BlJXqLakMb3fTNRRbgG4ufz+m08QPdF/jnm8PQ14Acy0+oPRUC5ydd
   Q==;
X-CSE-ConnectionGUID: hHySvECkRaW3cVQeDDRUQA==
X-CSE-MsgGUID: aHfindqBS4GiKXm77tB9zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77169672"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="77169672"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 03:16:02 -0700
X-CSE-ConnectionGUID: Z+yU0oBNQaCN9G2pc19UVw==
X-CSE-MsgGUID: NuLw6BInTPyLkUoeXhQDCA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Apr 2026 03:16:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGDZn-000000003Ez-01AV;
	Fri, 24 Apr 2026 10:15:59 +0000
Date: Fri, 24 Apr 2026 12:15:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dwmw2:fred 24/24] int1_fred_test.c:undefined reference to
 `fred_handler'
Message-ID: <202604241223.LIZT7rY3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Woodhouse <dwmw@amazon.co.uk>

tree:   git://git.infradead.org/users/dwmw2/linux fred
head:   bd465aabebcb124e09a26fe9f4c861354febabe4
commit: bd465aabebcb124e09a26fe9f4c861354febabe4 [24/24] KVM: selftests: Add FRED event type classification test
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260424/202604241223.LIZT7rY3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604241223.LIZT7rY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604241223.LIZT7rY3-lkp@intel.com/

Note: the dwmw2/fred HEAD bd465aabebcb124e09a26fe9f4c861354febabe4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   /usr/bin/ld: tools/testing/selftests/kvm/x86/int1_fred_test.o: in function `fred_entrypoint_kernel':
>> int1_fred_test.c:(.text+0x104): undefined reference to `fred_handler'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
