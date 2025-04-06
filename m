Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F91A920
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Apr 2025 05:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743917440; cv=none; b=HGq2KuMpWE7blZUO0348qVUs25vL/d1aEmG9YnP+e5cjCWmJl2FwdwstUN/ORcXAz20neBRaJINauCLTubCe/XmemtW98zHdFNFlP6S67ZjlVIJ9pwFVQ/DP9AydJJiSZIweZ3UXXpfjKLEW6SRDZ4NnLHDOBm01yWJPD5wG4/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743917440; c=relaxed/simple;
	bh=nmakwgsPTUuSxq7muvh/8sfbHH13B9k9eFbAAwx9WT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avfn+BtO1wSwI4KnRJaRfuBgetoy5AgG15swZ/kNOAT36Kv7/XGeiU1dXxaDaxZ4rEedEq1ilQR50LTue2k38BF5C+MEDuQa0q3yeiJTcY76KMN3RiUCf9gWws2XYmfjCsiImFSx9ewp4xc2c15qTYwtxmKYN9OLFSmCTmhLUuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsQQZ1mc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsQQZ1mc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743917438; x=1775453438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmakwgsPTUuSxq7muvh/8sfbHH13B9k9eFbAAwx9WT8=;
  b=fsQQZ1mcS9hjTe/7SJBWWBvxUynFGiE5FaLW9ydsi15hWGtB52esswAW
   5+Uy2XjB+FzGCfTC/E40FpbHo+XK9SckZF+cc1bpsZiO0XFqEHYFFqPi0
   4XIorY5x2M30WjpZlxL5Imf/rtmcp/KlwF85NPSoV1DsE8e+ylXe7IZEm
   4O637EER21DMxsDwlNSLItm9vvkSWfJCQG0wwuNDSvE9IdEif37LMM74n
   b9PlgnL4P4tnMoZwZfYwszIYXaPEHInlvwJQET5qrEp5RtlVRRgTnrsRA
   2LDMycdVQnSBp6/eE7HrO/k7bj6YeBTOged2kyVGIXI8b7iFXxKUVjqKZ
   w==;
X-CSE-ConnectionGUID: /nAxHj3ZTvqVizu97aPg9Q==
X-CSE-MsgGUID: 9YXLvFE6SVujnuNI6R50vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="55951519"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="55951519"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 22:30:37 -0700
X-CSE-ConnectionGUID: bmPMueSbQkOUtFz0ah57fA==
X-CSE-MsgGUID: 43sGPjqyQC+ogbEihL2Yew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="127396265"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2025 22:30:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1IaY-0002SB-0a;
	Sun, 06 Apr 2025 05:30:34 +0000
Date: Sun, 6 Apr 2025 13:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 18/18] mm/vmscan.c: trace/hooks/mm.h
 is included more than once.
Message-ID: <202504061350.ClvnDEW4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   2419132b8c991ece73c5a50f6f5c3eacab6077ef
commit: 8f50042a2fc1c22bba3b3c5dc30eb2a53a2a3a76 [18/18] ANDROID: add vendor hooks and expoert reclaim_pages to reclaim memory
:::::: branch date: 31 hours ago
:::::: commit date: 12 days ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504061350.ClvnDEW4-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/vmscan.c: trace/hooks/mm.h is included more than once.

vim +76 mm/vmscan.c

    73	
    74	#undef CREATE_TRACE_POINTS
    75	#include <trace/hooks/vmscan.h>
  > 76	#include <trace/hooks/mm.h>
    77	
    78	#undef CREATE_TRACE_POINTS
  > 79	#include <trace/hooks/mm.h>
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
