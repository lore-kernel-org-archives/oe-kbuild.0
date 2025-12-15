Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE312E1730
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 19:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765828325; cv=none; b=ULAIGdOH5gn/OZXWlRHaj3FsHg5b1bbkFqJH9WB/W2fSEeIHXc+N4tGeKPlArnEFF3BSmsTJoDUrWeoaMBS/gjzBEGWkqkNBV+4bc4aMOkrDz1IxiwzD1ouYpZYEpYS4km99pmKycpqQ52LWU6KNhJ7dblwQVzKF4xxBLgNHBfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765828325; c=relaxed/simple;
	bh=8D696Ht4AP9pSasw3Aw8Pph1pqiUTNZdrX4OsahSJnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhaIVgrdgA4c1Dl4Dp8WU+Fcj7i+jS6BKc2NSy/H+oFgpanHthhcujtNwjJhOBVKX1BoU9k+MhL6dBCRgxj2CJXQ/bE+A/QN2AaAQiBpuLwpY6dV3ry7P/f62HG5mZ8nUUuvsEeOYt9Q2JOrEAma1bW7syfOBx7xnh7Ha5yu5Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Myac9ymU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Myac9ymU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765828324; x=1797364324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8D696Ht4AP9pSasw3Aw8Pph1pqiUTNZdrX4OsahSJnM=;
  b=Myac9ymUVF7Ik6EKqP6WYn2HdEVErUOVbSv/vMjcza1ll+TIzFCQMpWz
   oQYKfIxim0n5f9M1cHvY/DOKymqkfPa76XExoeXeIfVjPcROAQWBJHYJS
   W7QRTfKS4ROGJLMS97zx3+++N2ZQYEYNwUs0FY3B7hv3pWK2dIvu5Bhms
   QLvA2bcrQ7Q0OLnYq+Yol1rXchlyns4yasfyiJi4s0dNjeNUBugcaLxlx
   D4N6NzaN97ATVHnjLZ93abjgCc7YdqmQhqvhjzq0us3mf+URI/wlTZy0d
   o8yL2TBA7YWTCBwNch3ihxlIXS+QQvXKmmCdvgUkL8mo+cDjFol9I8yS4
   g==;
X-CSE-ConnectionGUID: lD+bGTAKQ9mXagmnnt69dw==
X-CSE-MsgGUID: ZO9fxk+QSK+LqkrqAKx4KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="90395476"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="90395476"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 11:52:03 -0800
X-CSE-ConnectionGUID: x5fISXEEQDSn0A7cEKtivA==
X-CSE-MsgGUID: /Md04O9WQoi4M8jfjz1efQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="221181006"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Dec 2025 11:52:01 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVEbv-000000002ke-1BEe;
	Mon, 15 Dec 2025 19:51:59 +0000
Date: Mon, 15 Dec 2025 20:51:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [leon-rdma:dmabuf-vfio-v10 2/3]
 tools/testing/selftests/vfio/vfio_dma_buf_test.c:9:10: fatal error: fcntl.h:
 No such file or directory
Message-ID: <202512152048.yCSeRGwU-lkp@intel.com>
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
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio-v10
head:   f450671884de47b594f47ec6678edf47e8da57ff
commit: be9bf37d77ea9c2d9dad71982e2ce121074da2cd [2/3] vfio: selftests: Add DMABUF test
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251215/202512152048.yCSeRGwU-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512152048.yCSeRGwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512152048.yCSeRGwU-lkp@intel.com/

Note: the leon-rdma/dmabuf-vfio-v10 HEAD f450671884de47b594f47ec6678edf47e8da57ff builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/vfio_dma_buf_test.c:9:10: fatal error: fcntl.h: No such file or directory
       9 | #include <fcntl.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +9 tools/testing/selftests/vfio/vfio_dma_buf_test.c

be9bf37d77ea9c Leon Romanovsky 2025-10-28  @9  #include <fcntl.h>
be9bf37d77ea9c Leon Romanovsky 2025-10-28  10  #include <stdlib.h>
be9bf37d77ea9c Leon Romanovsky 2025-10-28  11  #include <sys/ioctl.h>
be9bf37d77ea9c Leon Romanovsky 2025-10-28  12  #include <sys/mman.h>
be9bf37d77ea9c Leon Romanovsky 2025-10-28  13  #include <unistd.h>
be9bf37d77ea9c Leon Romanovsky 2025-10-28  14  #include <errno.h>
be9bf37d77ea9c Leon Romanovsky 2025-10-28  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
