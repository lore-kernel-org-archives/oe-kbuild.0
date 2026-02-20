Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAEA30F7F3
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 18:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771611175; cv=none; b=kpSUpSJPkKEvXD6V0Z/OEFE/fb/foVgw2eRTf5GQMYlt7FmnM8J4t5WqyGl/yi2SGlzd8BS0T+jZxFfbj3i+nutsw3CtpAHbyXlUChARH9W81iUIW8lEmR0/hIv5q8uugEykCu5z6Sd6UvJWODIhzlLOysdezYKJ7Ts0TSyFS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771611175; c=relaxed/simple;
	bh=EZNN8ALqzxid0GngdMwW8EHbdlSikBY/m8nuH0t6/n4=;
	h=Date:From:To:Subject:Message-ID; b=hWylsz5UEYKp0UncaJeCYsjKCm58DotgyrjTyriwmbAkbTnc/I82UNvt2Rlwl6VUVEOJ7HvR/lL9tNKG5jbwbjHY3LrQVpNe5oVnexMGNFTOC/hzITeLd5IRTwbNTgsfBW2rl0edC3CmbbmINvO7GUcRLi2hAolxqZ8gOmev7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qmutz3xx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qmutz3xx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771611174; x=1803147174;
  h=date:from:to:subject:message-id;
  bh=EZNN8ALqzxid0GngdMwW8EHbdlSikBY/m8nuH0t6/n4=;
  b=Qmutz3xxPkCMa0s6cQ1SXzRrvEuEEhpH9ePLMQ37BtatnYitkM7Sj+EN
   z6U77+mSjdJtD0ordOLI4f65jqOXCrl7PMmzAFw3vcZoyoqvMfJTvLSBj
   xH+o2c/h73uXqEDC2+5sfAazWWqCrRijDT6prXSIvSIvea7B5o6fBvKu1
   9b74uEFIjkANtw8l7NhCdVoTQcfWlOWHVTYqH3u8icp9YNIq1i002GmrK
   bMKKfLweHexZpYyUMhxj8OyoZrdlcYLfVy7eMdNJ71ZVuDktUvY0w/4Gn
   PSqfq4mIET3/MHnl9GkU7HofKDj9hvJHdGzwpX/oEiLRmVbwmBdqp2M0Q
   Q==;
X-CSE-ConnectionGUID: UapoNoTPS8Ks7p2ByuGWVQ==
X-CSE-MsgGUID: HRcxGDWqT6aumCR1vpJcEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76541303"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="76541303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 10:12:53 -0800
X-CSE-ConnectionGUID: ICworCEfT+6o/LlermXvww==
X-CSE-MsgGUID: tstxcMP3Ri6MdymrUWCmOA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Feb 2026 10:12:53 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtUzi-000000004FZ-2ZkB
	for oe-kbuild@lists.linux.dev;
	Fri, 20 Feb 2026 18:12:50 +0000
Date: Fri, 20 Feb 2026 19:12:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 6/9] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202602201947.Ho8f7wF0-lkp@intel.com>
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

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   09254cd790f7046b6736c1ac67720dea42e1b3f2
commit: df87fb1f48080fc2e8a8c893e08bf8719fb839c8 [6/9] iommupt: Add a kunit to test the iotlb invalidation flow
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260220/202602201947.Ho8f7wF0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#32: 
struct iommu_iotlb_gather into HW operations executed on the the xarray

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
