Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643FD33F6
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722925598; cv=none; b=WHfmuw8OqJIG3Jnkp3I8S9tWkG4W0089J9FvmW8Dd7TVlCsO/OO+LlrSD9Y51CvYX6XTKVgm1/L5V+hXcLuXAzJz7T/aUS5fGntWpcvudAASKc/US5RcQKA7K8+PBkfyPMZgzub7NahppfJixwephHOdNuHp6Prc7W6fyfIQ4Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722925598; c=relaxed/simple;
	bh=n7aHq3wjdOUemx/lCYz+jD5pdrQohmGEHO3jMMbN8ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtrZICVzxHVgFQE4v/nxVQyAIdGErsdu7ekApkxsDr+cxhgBAzjLsYlmXmu9FPWFyGcgnCACgSZlvJI2a78lXH08wN3Xa+rjtAkgSf54FCiVDi8ZsYDUfFe43jz1iBS85421ucAZHY1SvA09+XCkCyCvXTypyo/DnPL/xSm/P8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USZ2gJoo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USZ2gJoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722925597; x=1754461597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n7aHq3wjdOUemx/lCYz+jD5pdrQohmGEHO3jMMbN8ZA=;
  b=USZ2gJoo2XNwXRsZXvG9Yh79Erf6vKin33tbPUCv0DjvLppUJx7RS4BW
   pzhePPEfIFxKXjEQLP+L4GE/RNTiWh5lRYBqVfWZVTjhUXnN/lwwH0E8/
   dE6tTHqkdOy4fY8ZrcP0a34KMNN5ZlAkHxXMTP1Y3OBQCuh6/v4/eLB5K
   X/l91RTemVEMKKdDdALolNYEsRKmuuFwKqZR4oMPWVsuGqKFiSCKA7T6u
   bVVSuYzl9Lrv+FDuF4ynw/98WQBDXnH+EJqjqV+sxUdKrQ2/is4s3RyMg
   8uiWiaa1IIk6OmzctTF1gztjyQFflkR7bIuZUpjx4MWzB+iRdMLwbFbdU
   g==;
X-CSE-ConnectionGUID: x//XxcXPQXqHkXZIAYTLKQ==
X-CSE-MsgGUID: L7Ez0jlxR92DeO1//DTAwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="43447562"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="43447562"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 23:26:36 -0700
X-CSE-ConnectionGUID: SAQYTbrQTh+ohQ8N9KfIyw==
X-CSE-MsgGUID: 5NCc2iiKS6CTIqNp8Sv05g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="93935610"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Aug 2024 23:26:28 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbDeJ-0004Dc-19;
	Tue, 06 Aug 2024 06:26:24 +0000
Date: Tue, 6 Aug 2024 14:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-xfs:xfs-per-rtg-bitmap-rebase 56/60] fs/xfs/scrub/bmap.c:
 xfs_rtgroup.h is included more than once.
Message-ID: <202408061420.OpRtP2oI-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap-rebase
head:   556815df77c3443419163e1deccade141c065289
commit: b586f162ed8a92a3c49d905ee0b71d4eb9a3dc55 [56/60] xfs: don't coalesce file mappings that cross allocation group boundaries
:::::: branch date: 8 hours ago
:::::: commit date: 9 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408061420.OpRtP2oI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/bmap.c: xfs_rtgroup.h is included more than once.

vim +22 fs/xfs/scrub/bmap.c

  > 22	#include "xfs_rtgroup.h"
    23	#include "xfs_health.h"
    24	#include "xfs_ag.h"
  > 25	#include "xfs_rtgroup.h"
    26	#include "scrub/scrub.h"
    27	#include "scrub/common.h"
    28	#include "scrub/btree.h"
    29	#include "scrub/health.h"
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
