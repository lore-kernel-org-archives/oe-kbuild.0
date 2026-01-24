Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC61C5D57
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769252998; cv=none; b=Jox1XOkOwVUA9yLpnXwYK2iIvJP+uBje8lcfIuB7gkGA+dtD7LwzdZqlrNTuxxpJz8mTysEFZBf4nCpPNHrO4EBkvdNtDXV8sDkInLY1ohZg/sTIFdS/qp/I3JAXNz6pWHt/Om8P/ZbPbZi5Q1aNnt31KY+YNR6qTUKRecCoYfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769252998; c=relaxed/simple;
	bh=CfYveeNbN87gkyYhy+ZzS8WHbQ5UhIgV4T939n4qPdo=;
	h=Date:From:To:Subject:Message-ID; b=YhiPmj0/ZXJixmCxw/EAfIvRWMxFTwVpJPc3WeahvW2LHNbWmyvxeO2LvmnMzYwu/91Y1o5a0iAIlOWqouXDRZPJn1C9owCxZK3EiYv1iuwaPqF5Km1lSpC6xloQaI/FFipJu90tztHMYY2kDwBb9K1Y2Bsp+ETEbhZDLK9MyVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCqQAKLa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCqQAKLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769252995; x=1800788995;
  h=date:from:to:subject:message-id;
  bh=CfYveeNbN87gkyYhy+ZzS8WHbQ5UhIgV4T939n4qPdo=;
  b=kCqQAKLaLVSmsae/LTEhs9MdaenovVYa8Ci91uf2okh+9OW1xHPZtzmb
   b7Vh7wM+pTz724kmEgE7j8A50qZrT/6tA8p/UWZlECZb7NythDMQFqX8D
   r0ubZMW39FcMJmkyIQ/SFQjVqRgY1cBeDpJB2gYfrk1T+LU/eD9DIhseQ
   uzgEpZU6y+EtUy2hXYLa+GLXRhUyKScRxNTqPoP62V0KdYmIvHxHcECJa
   jAc1my2cl8/EBA2z8vnI6Yl25IhiSO9MZN4BfeLsYo9ydKWCFA6neTBnG
   sg9DOOGaop4swPfoCO8ZhjYjqMbYcgsExiUqyaRzcCRhJIvaI1fYY6cl8
   Q==;
X-CSE-ConnectionGUID: 1UE2fQ9dTW+MpyVT1eqY2w==
X-CSE-MsgGUID: XWgn6Wz4SHSmRh0tN5de/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81856714"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="81856714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 03:09:55 -0800
X-CSE-ConnectionGUID: vwssVJSKTS6g7gFpUvc9YQ==
X-CSE-MsgGUID: gzSx4d9AS1Kfq/yDX2IirQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="206851590"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jan 2026 03:09:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjbWa-000000000xB-19yO
	for oe-kbuild@lists.linux.dev;
	Sat, 24 Jan 2026 11:09:52 +0000
Date: Sat, 24 Jan 2026 12:09:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 27/27] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601241222.bBQute4c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   1a9ae6af19a2a7cc9af7c824230c5c51e6270e35
commit: 1a9ae6af19a2a7cc9af7c824230c5c51e6270e35 [27/27] cover-letter: Add DMA-buf mapping types and convert vfio/iommufd to use them
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601241222.bBQute4c-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#25: 
match-making system to select the best type offered by the the exporter

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
