Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAA232B118
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jun 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741685; cv=none; b=o4ecV6IAkEzmmk3cbhv9D4PE1TowrJ8OGMGRL0Txi0TGkR+P+0fC+zMd769EWTY9VJptj57nEYuCJlaHwJOIQsHyQEQAIGIn1dLaeI84i+11fg6InhQYG/PUX8R4IPpk2yfpcLyotRT0TZW+1aPF/RyzGhAamHVvBKyztAFMgRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741685; c=relaxed/simple;
	bh=NtEl/Lg3LNwqGIHrxIxcuadeyWMhh9OvqCyoNu8woME=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DNEGgODT+7/o0MfNMUEiI5s2RAKWAAM8TY4+d2OQXHqGss5Mu/vbPMJuNqa7aJ3ABa9ijuwzOc8fkpU3zYPSVlmEhnYHvoAQ7k8mn45vjUWUsK79AraUynP1Ya1ZKcwC7bS04hD2aireZyInw6tpsvIyumCt2bD1SXG5KXr9EIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROeRqejG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROeRqejG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782741685; x=1814277685;
  h=date:from:to:cc:subject:message-id;
  bh=NtEl/Lg3LNwqGIHrxIxcuadeyWMhh9OvqCyoNu8woME=;
  b=ROeRqejG1tEwKtgfJNiWeKBY+6Db8YR6IdpEwy5If5ajOeCQ8i+OTcmY
   neM3usYZHWi2jlQ2+pqxK9nBQE1Pg2KkBDs84hWfmRhpHcCyDg5KvCHJE
   FrD1R1YHLb0ydOONOAsAZrcVzH0VScbv57kBD/nUG1htMnXSRqJZVVJiG
   Aea3nk+Usx2PqDeFlV+8E27n0MUIYOja2aKH1ku/KckgSFCPB4PK0v5mH
   DGys6gb11cNf6d9lHtMzPZr2qp406hGFRzcB0hhMsmiSsrLPY9Iz3996m
   Lg/bLaN+l7w+PE4VcgAMEE+45efEsbUV8Cfc1PakIStZ6qjMtsSdLTBQM
   w==;
X-CSE-ConnectionGUID: RcjuszYYRwmVPcI/FJ+QIQ==
X-CSE-MsgGUID: Rs1gfvBQTWC15ru1r7pBrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83519842"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83519842"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:01:24 -0700
X-CSE-ConnectionGUID: mEOHI1IER/CkOoZvdJU5SQ==
X-CSE-MsgGUID: 6eBwS1IQRV+wZF4zkHRnyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="282042779"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 29 Jun 2026 07:01:23 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weCXk-000000000BR-3gcI;
	Mon, 29 Jun 2026 14:01:00 +0000
Date: Mon, 29 Jun 2026 16:00:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:timers/cleanup 17/36]
 ../../../lib/rbtree_test.c:7:10: fatal error: linux/timekeeping.h: No such
 file or directory
Message-ID: <202606291502.TQknS1m4-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   52371350762f95b2054111a9c887b0eb99d622f4
commit: d066e7c8d9409e37ba4e162dbbc294f3397dc764 [17/36] lib/tests: Replace get_cycles() with ktime_get()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260629/202606291502.TQknS1m4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291502.TQknS1m4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606291502.TQknS1m4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rbtree_test.c:11:
>> ../../../lib/rbtree_test.c:7:10: fatal error: linux/timekeeping.h: No such file or directory
       7 | #include <linux/timekeeping.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
