Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071D929B775
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 23:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764630933; cv=none; b=ho12hEtVMvsX54K8P17bFSYBikNqtE0b+0/PrNjEbNQK0FrlYTYcl4N4LcuUFfXuOFGBdQDRx1FslIbhItKhvX59thFFtkHxXqAPZDag7tdADqiK37Zd9VcBrt5lqKY1btbPmeQ/kQTJBOPlJKDRvCYePbbhdrEdT1M/omVk0+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764630933; c=relaxed/simple;
	bh=s56a0pLM1oenQzqill7URR+TsLM636iuc9kVXe5fNIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdVPmvA2qtUihxgR30YzIGkD8A6EMP6eZQgY/8LZB4Vg/vYMVRSOtGVdYmlHlYBHG9h3En97gl1lBA1DlTjTCvH++QmZCAkXkQbp9aAHlmmtTg8FVKuud33oUvrV0v5Ypz+DjQi5STmU3+MLZTTQSsS85o7eBFebNEnzQwpjANI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTW/GO4r; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTW/GO4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764630931; x=1796166931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s56a0pLM1oenQzqill7URR+TsLM636iuc9kVXe5fNIQ=;
  b=aTW/GO4rlyZJeW2780nJGszIT9YOQslOQvcAI44ev3mkPEwFbuUQVxDc
   M+avwcsvWxAQaUy4e0sI4HfpL7xzl0pRFE0I5iRqMWqoMgU9JcluLVr/j
   buOoIbtFom1QadlYwVW69OwWW7S6F2t5rvbW8ZeoSqzWsosScINC4HWwM
   K7+TxgueSeuNVv+E4LhlJVmwgC98i8CDGkAn+cFONHGQnaaV1APNGiGJR
   nWthkfofSVrLsg/pQQzPgnQ5ne0rvnJ+d77dCbGcVEX2PeeAr07ILOfUT
   Gj0Ksp6p4fWdWtB6QX4zNegfBH27HitdVRNHlBWbps3aBUpmiCDFDPxyv
   Q==;
X-CSE-ConnectionGUID: Frtv6d56QBSzFJV2LsdUsA==
X-CSE-MsgGUID: pfvFy5qJSuaVbOc7T3aAHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66750118"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66750118"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 15:15:30 -0800
X-CSE-ConnectionGUID: PYkQAW5FR5ynPfoy5LJtRg==
X-CSE-MsgGUID: Um0nOssWRIOWD1cfi/XcYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194033582"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 15:15:30 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQD79-000000002lj-1yU0;
	Mon, 01 Dec 2025 23:15:27 +0000
Date: Tue, 2 Dec 2025 00:15:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12706/13171]
 tools/testing/selftests/vfio/lib/iova_allocator.c:2:10: fatal error:
 dirent.h: No such file or directory
Message-ID: <202512020011.IbOhp0SV-lkp@intel.com>
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
TO: David Matlack <dmatlack@google.com>
CC: Alex Williamson <alex@shazbot.org>
CC: Alex Mastro <amastro@fb.com>
CC: Raghavendra Rao Ananta <rananta@google.com>

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 2607a4361312bf407931597423fe23db406ca8d3 [12706/13171] vfio: selftests: Move IOVA allocator into iova_allocator.c
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020011.IbOhp0SV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020011.IbOhp0SV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020011.IbOhp0SV-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/lib/iova_allocator.c:2:10: fatal error: dirent.h: No such file or directory
       2 | #include <dirent.h>
         |          ^~~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/lib/iova_allocator.c

2607a4361312bf David Matlack 2025-11-26 @2  #include <dirent.h>
2607a4361312bf David Matlack 2025-11-26  3  #include <fcntl.h>
2607a4361312bf David Matlack 2025-11-26  4  #include <libgen.h>
2607a4361312bf David Matlack 2025-11-26  5  #include <stdint.h>
2607a4361312bf David Matlack 2025-11-26  6  #include <stdlib.h>
2607a4361312bf David Matlack 2025-11-26  7  #include <string.h>
2607a4361312bf David Matlack 2025-11-26  8  #include <unistd.h>
2607a4361312bf David Matlack 2025-11-26  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
