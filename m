Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D502DBF75
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 02:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439676; cv=none; b=R1lbXDKI55NUFjGi+/IRyqgZW1fAJe6wUoxdmZCjdjSqaKxXDkwxm0IGzJNnHr3AJhIsyI2OO/xQ8Csv0N5cO8Myv/oIKQbkhaG5E2VQ9ipAXzv7nYQ1vY6OkwN6t6muYkB2g+4HT+lJ16+MRjzizD7RnGuXQlhuKmnHUL0Hv0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439676; c=relaxed/simple;
	bh=6/TLJ33iNYOjhU7kr5hyA8uAjC+fSFB8K4hLnt6I1TU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aJeQ2xE9CrTb7mDtTFxYp1Uvs3RuiRbo5LWl/ImYWCH/y5P37WTgYLPO5qUvxpHGMtBi922lc5+db/XWmSXX+4WgxATvjZQ4V8SAUe7jWLGUv2uDDXQM1+IZjJLczPDELM0UwInZ2A1ofYeKwiWhXOuxhjkMtLPwVjUTHychvnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1WLLRCh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1WLLRCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789439672; x=1820975672;
  h=date:from:to:cc:subject:message-id;
  bh=6/TLJ33iNYOjhU7kr5hyA8uAjC+fSFB8K4hLnt6I1TU=;
  b=n1WLLRCh7hZ4s62bEGfD+UMGcFQNBpwexsjJfnLImJXu17lMkCluTcW3
   /5KVoZUbwhm6mGdCVpIzuy4rfPo2SU4oyIrfmnC51pUV5HLVGIaIslqX7
   KGTLKl5s/KOQEGM7bv0604PYBhDO8xKXg0h/YZraPew/6OU+07VDuqW/u
   Ac2zxg2ED00VlbyUoAS8GVVhTYGkdcO31yzEWj0EnPUKK3PO7WjtMa9EZ
   NKBXcjKYJbs+gRhIco3vVDxyiui98diVvd5YguyWNfwQ7Deh7oVoFrLt6
   Vs0HX2jqb0sX9rSm7TwD97V+gMVXdZ/dewtziAYGoB3VgrWfWVZWTnilZ
   Q==;
X-CSE-ConnectionGUID: jtTENAn7TnS47RVNvDnG7A==
X-CSE-MsgGUID: /nnvvyoPQUKbNapWtwO39w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115330869"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115330869"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 19:34:30 -0700
X-CSE-ConnectionGUID: z1VLcjp+QV6kLlV6c5PPsg==
X-CSE-MsgGUID: tDamoVCWRtaC0+b2ntCOmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269131180"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2026 19:34:29 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6J06-000000000Sz-48C7;
	Tue, 15 Sep 2026 02:34:26 +0000
Date: Tue, 15 Sep 2026 04:33:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/futex/core.o: warning: objtool: futex_init+0x128:
 unreachable instruction
Message-ID: <202609150426.M4he5Ppc-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: K Prateek Nayak <kprateek.nayak@amd.com>
CC: Charlie Jenkins <thecharlesjenkins@gmail.com>

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   587858367581b9c55c3690f4e63382ad622719d4
commit: b78b0b65825275f58336a43611a700de174be8c3 futex: Use runtime constants for __futex_hash() hot path
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: loongarch-randconfig-r063-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150426.M4he5Ppc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150426.M4he5Ppc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b78b0b658252 ("futex: Use runtime constants for __futex_hash() hot path")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609150426.M4he5Ppc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/core.o: warning: objtool: futex_init+0x128: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
