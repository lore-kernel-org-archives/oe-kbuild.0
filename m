Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9A5175A5
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Jun 2025 02:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749089764; cv=none; b=PkUNwbFvnRTakVNNvjM9rTzluY+iIEPRcDqGS70AF6jSQoKeYPsWlvo2LL900yMVYpAA4L3k9ceY97sGNWMVsBiutrh4JjIYTYT5awhPqxU9NZV8D7ySfo0/GoxTnB8aDkCLNJ1qovm29c9vqePLeQqbBFRVyWF6634CIQvkFbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749089764; c=relaxed/simple;
	bh=5aZlfuHjt10tP7kMzdVG4Kql8bdZEZKOkQH7KJZ5Qf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTU/7VsbkreQRk/fWTv9qSC/iXhDuV2JXslt3M45O4l3VpUI7MNVU8990c7gURa40Ws3WG/ya68ClY5x4p2zS8vhHQG28clXPyEaM2iEQdexDn4IF1iHKOmFLqbGAbDY+k9Jq5I92jB8SE2QJ8mATgHIncXtWfvodFOhIgYKrhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9oF6S5T; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9oF6S5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749089762; x=1780625762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5aZlfuHjt10tP7kMzdVG4Kql8bdZEZKOkQH7KJZ5Qf4=;
  b=Z9oF6S5T0e5NyvcweCkbJgTQzoO5vXHRxCl0y3mHZRZu2UJtcSjPKEYp
   ne1lKdnJhZDMlCPJpHoBpBC+nbllb+o6BimUKRjEILQlCa6U8e4HQLTgg
   f0P4ViKcYmBT8wEZYQW9WijT6jfYBg2b3Kl3O+VecjJSpvxJ2SXlgoAM+
   3YMTql+qdeD0DcnOkydkDO1Axt1LncAZmtZmcJBqA4xc6kF/4Acu0gxCf
   dT17S3GQnd10jGNl1JMAs92RTvvKNBgRMX0Egn/bS/3DkbEQ49l3DKZCc
   vMR8Yre3qbAEaJlzdoIE2FZYzU3rZ9TpXgou4OibekDkPZhYcJLB0K4ax
   A==;
X-CSE-ConnectionGUID: 3QU46Y65RIyO/465L6CnQw==
X-CSE-MsgGUID: yasfIzGnTzioUkStzPTjuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51261366"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51261366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 19:16:01 -0700
X-CSE-ConnectionGUID: 8reJX4xTS/6uwmF7xhTgEw==
X-CSE-MsgGUID: XqzdDwQpRqaP7TJh7nxSow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="145319788"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jun 2025 19:16:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN098-0003dZ-0m;
	Thu, 05 Jun 2025 02:15:58 +0000
Date: Thu, 5 Jun 2025 10:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 5/5] mm/rmap.c: trace/hooks/mm.h is
 included more than once.
Message-ID: <202506051010.edVtXapp-lkp@intel.com>
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
head:   7a02c9f4a3ec528bc3b99ff4475e9823225c4f04
commit: 79376c98694f31a642dc7765eb726d1bb1f6378d [5/5] ANDROID: vendor_hooks: Add hook in try_to_unmap_one()
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506051010.edVtXapp-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/rmap.c: trace/hooks/mm.h is included more than once.

vim +86 mm/rmap.c

    81	
    82	#define CREATE_TRACE_POINTS
    83	#include <trace/events/tlb.h>
    84	#include <trace/events/migrate.h>
    85	#undef CREATE_TRACE_POINTS
  > 86	#include <trace/hooks/mm.h>
    87	
    88	#undef CREATE_TRACE_POINTS
  > 89	#include <trace/hooks/mm.h>
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
