Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB851F92E
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 18:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765824724; cv=none; b=ASGhH8Bt9oS8ApjbDD0EjxlyEB1KJiElPpDsWNpaBUhq29x1QRmR4AYmms+yH07tquEHlKungQjcOO0K32vCwWctjgTcpPiUoR8ZrJsS1PXmfYMNrrGuCk4oT3S3KYgV50RPl8yj//tPv+ep9oyb1UlzKnlHQceNNc/W07RD1rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765824724; c=relaxed/simple;
	bh=CFi5CIEXiBofW2lztnB7U3JYYaHz7biCZkV4fERQJMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XrsoWxWPAL66GKyY9hnDPtr/2+FsfmbFgJ0BrLSuvVduLCpaajWZ6phgvL2tVLLReC7PBt13rE7aKWUmSNX9MGIV1yKw/Rf+73LgmfTqw4WeAtMZ9qnhuxtHLKlQSsE/XYP9NPPUigBvpzRI4/GuJu3qYLq1n0drryHcIfQ4YxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zcn/CVwI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zcn/CVwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765824723; x=1797360723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CFi5CIEXiBofW2lztnB7U3JYYaHz7biCZkV4fERQJMc=;
  b=Zcn/CVwI9HxutUlKW+IFnqpu/cvTd+TNMPcNocNwRnENqiINOYQtq7yz
   6FXJasrhsFrU3/sS2/f2RN2j03mlhn/gftth6cN7xUaxvuWjDVWD6FgzA
   AauHM1jcMD2qpxCKu5N2tQ01ye13L9QjHC5rC4kmkwiSCAEUAhsclwe9t
   GyGB8tGq24Lpu73mhO7araihFIbDURqgWxalNu6nF3yWm5ljgFwTVkD+d
   EGkRhcmRKV/hv6f3beVKD3F0ErHFvt6Bkf4RyUiL/UKqiaXQ8NPcmO2DN
   wcfK/uaqqfezmZ5whKQ60v3wP2v+/EuwEevD8ACf8pRQQbSZAsZqs+hPD
   Q==;
X-CSE-ConnectionGUID: afDOweNlSYCvCm8QE/SGjQ==
X-CSE-MsgGUID: 3c0zOl5BQDWOUKTYL6XH3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78441759"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="78441759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 10:52:02 -0800
X-CSE-ConnectionGUID: Do6WjTLiQw+36h6KoL0mnw==
X-CSE-MsgGUID: E5B5HIsPSs61uPUi+4paeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="198622677"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 15 Dec 2025 10:52:01 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVDfr-000000002kK-09vu;
	Mon, 15 Dec 2025 18:51:59 +0000
Date: Mon, 15 Dec 2025 19:51:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [leon-rdma:dmabuf-vfio-v10 2/3]
 tools/testing/selftests/vfio/vfio_dma_buf_test.c:21:10: fatal error:
 vfio_util.h: No such file or directory
Message-ID: <202512151920.kBmKvTyz-lkp@intel.com>
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
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251215/202512151920.kBmKvTyz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151920.kBmKvTyz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512151920.kBmKvTyz-lkp@intel.com/

Note: the leon-rdma/dmabuf-vfio-v10 HEAD f450671884de47b594f47ec6678edf47e8da57ff builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/vfio_dma_buf_test.c:21:10: fatal error: vfio_util.h: No such file or directory
      21 | #include <vfio_util.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +21 tools/testing/selftests/vfio/vfio_dma_buf_test.c

be9bf37d77ea9c Leon Romanovsky 2025-10-28  20  
be9bf37d77ea9c Leon Romanovsky 2025-10-28 @21  #include <vfio_util.h>
be9bf37d77ea9c Leon Romanovsky 2025-10-28  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
