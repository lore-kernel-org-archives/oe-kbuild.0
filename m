Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA782080C8
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 21:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764623552; cv=none; b=joKu5QRIhSPZCu7lv5WHvqGU98kiLIUD2kt+wShVfrKqQG8Z0SkyCzzojEuSOYG/dfVGTBuJrX1KOpN6C9B4JxbT5rFW8TZSQQYH/6jD09UiQYCgpRtyaE9l3knAW22qANeY4yV0k+iZf/pBQiVHMhn52Om+mERhKexnMJzKwNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764623552; c=relaxed/simple;
	bh=AYfdP8iS/4wmOUH6P5FU0hy7XlP1cKLm9VO+H0n4u3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NAAjkjW/I37UiyQD9cL1ddTm0rTSEWD6Vc0OHOy9nz5s5CKCYRtL9LVhdIpO4qjdCOEeNl9lQ55OJfHd005UkH0NoQauLxIq6LopX7dmGXuPsN7gShGFgF/MdlS60x9B88tl7XJPMuEwqMR9fH80v7m+DfSv7I3wpd7wD8W3F7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIt2CJKx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIt2CJKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764623550; x=1796159550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYfdP8iS/4wmOUH6P5FU0hy7XlP1cKLm9VO+H0n4u3I=;
  b=iIt2CJKxWfzQhxai3xO8zE5pNDYca/Qzdy6s6xTjN4049xZV25zbk8vA
   qlwSQRcweNt3yJPbwHq2qMzUUaZOd5Qp6iQnBJCw3s/bY4F5JgGOK24uv
   1tOZWXQ04g5P4cyM9mjgsrbXkPWB62tds+iQbIAPcClwqz09WkxhsDVeY
   3a1L9zcplFy4Xa7zJ99TLkyLw54TBsN8MwZIoLNnvgF1e65StEQg9ZTvo
   iD/XTvM1pFvSrcvWx/f8uQrv9ijbTudGQyEBSQWRK3sZblSoUZANyzATp
   dxRTwvl76YWHz1cJPh0XgJDlcWJ+p8WdLTES/lRdhEjUbXrRWp8Ugp/pu
   A==;
X-CSE-ConnectionGUID: bgFinh1ySRKH8dXqtE7KpQ==
X-CSE-MsgGUID: zKdozZaNSSKXrqPJLySc5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66615352"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66615352"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 13:12:30 -0800
X-CSE-ConnectionGUID: 9wtnQALnQFS6UKyCdYtbrg==
X-CSE-MsgGUID: 34LGdksJTKmPtXfpzsGlCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="198553301"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 13:12:28 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQBC6-000000002kT-21Qr;
	Mon, 01 Dec 2025 21:12:26 +0000
Date: Mon, 1 Dec 2025 22:11:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12705/13171]
 tools/testing/selftests/vfio/lib/iommu.c:2:10: fatal error: dirent.h: No
 such file or directory
Message-ID: <202512012202.dhYThS64-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 2aca571089b2cc333ed5ad0ada4902aa6f7c0d3c [12705/13171] vfio: selftests: Move IOMMU library code into iommu.c
:::::: branch date: 18 hours ago
:::::: commit date: 3 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251201/202512012202.dhYThS64-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012202.dhYThS64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512012202.dhYThS64-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/lib/iommu.c:2:10: fatal error: dirent.h: No such file or directory
       2 | #include <dirent.h>
         |          ^~~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/lib/iommu.c

2aca571089b2cc David Matlack 2025-11-26 @2  #include <dirent.h>
2aca571089b2cc David Matlack 2025-11-26  3  #include <fcntl.h>
2aca571089b2cc David Matlack 2025-11-26  4  #include <libgen.h>
2aca571089b2cc David Matlack 2025-11-26  5  #include <stdint.h>
2aca571089b2cc David Matlack 2025-11-26  6  #include <stdlib.h>
2aca571089b2cc David Matlack 2025-11-26  7  #include <string.h>
2aca571089b2cc David Matlack 2025-11-26  8  #include <unistd.h>
2aca571089b2cc David Matlack 2025-11-26  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
