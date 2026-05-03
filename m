Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2FC239562
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826655; cv=none; b=jPc/gPBqLFGi7ciHGWBIcFdS4OLS2ytajC+X1ySJ+jgf6McmTFEyK4+r+P8FAtPNS+ygxM0lNxvVJFWbedevm/x+PyK2dRR7cTnl0Bldi/JlJUVZQwDSJNlgqdj11S6zJMqCH/tCQR4lrKEts9W3ZHBUuvOJ/oU0nVPq6ABUAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826655; c=relaxed/simple;
	bh=Zz9aLdiNG7KTAJUM5v6w9twNjK+ILAu4Wo93Ob671Uo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H8dR7l95nEpxzqaUK9Zi6fVB9A+THnUWES9DRozdNjQhzFLHBeAJYkvWJqWYrlghg9Uv9y90uhAxyAY1zpx6N2/Z7ZK9YYYgs5nODq6YKqQJqQHljhjfk3RQZu4XKl/jetlh/nKNswhpMzrSAzljhy3oC9SBvzR1cslRrCdgbJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHmEEv7A; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHmEEv7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777826654; x=1809362654;
  h=date:from:to:cc:subject:message-id;
  bh=Zz9aLdiNG7KTAJUM5v6w9twNjK+ILAu4Wo93Ob671Uo=;
  b=RHmEEv7A+l8uNwQ94aXEd35DsP/xkw+X8NWu8vDzI+XK/oj54CRhXOtm
   EbshB8U1fugO47zUKDONRNG/wolau/313MJPZwVIf/KxYZzx1mm1Ti49Z
   Yuj16TC+N+h9s4nkM1p2ajjqqre9UFZXThBVdJt1+XLqUyXuihkb+0Y4Y
   p2mWtJb3mlytBS7Eki4GWOYtwfMQqYbzT15LsluxgED9cBSkIBnXdGtB9
   T6g92gvcnUVs7axjJEnnK5Z0NJVBw96aHfJEzOTrb+bxA+ysQzVQ0l2db
   SqgpwOn0sb+8ixVBKoDim1fyXnT6YvtSFHZ7rbXMjHMgjzif/KesN2ju5
   w==;
X-CSE-ConnectionGUID: 4fOX9zw7TYe5DIS/2u0LiA==
X-CSE-MsgGUID: z4romGEiSCe6SAFzdwVh7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96270318"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="96270318"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 09:44:13 -0700
X-CSE-ConnectionGUID: 2P9viUAuTCK7WrpOYCGZeQ==
X-CSE-MsgGUID: +ue5C8sjQaa8bqNlGsG4GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="258674407"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2026 09:44:12 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJZvI-000000002lv-10sY;
	Sun, 03 May 2026 16:44:06 +0000
Date: Mon, 04 May 2026 00:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1599/1887] {standard input}:200406:
 Error: branch out of range
Message-ID: <202605040006.39vp0mIj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9303e6bff706758c167af686b5315ad00233bf8
commit: 5e2c64739a3212530099b2ca0577e9181549cb85 [1599/1887] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260504/202605040006.39vp0mIj-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040006.39vp0mIj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605040006.39vp0mIj-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:200406: Error: branch out of range
   {standard input}:200407: Error: branch out of range
   {standard input}:200465: Error: branch out of range
   {standard input}:200473: Error: branch out of range
   {standard input}:200537: Error: branch out of range
   {standard input}:200542: Error: branch out of range

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
