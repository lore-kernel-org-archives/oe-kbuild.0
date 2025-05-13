Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48CE139CFA
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 01:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747100332; cv=none; b=l0z0kl9tM0KrVAwQq1+nDb+1mQdqkYZelFTi+uRhunzG0QdKbpjWIIpP9qsWWsGKUawJ7VyfcgOg92nLBqwNAEe+fIPGSKyC8O6k/YB5DjKzxBFFf4YQE7nmaT89EKjiZ61K8lBUv3jq7Er8tKPIIp0IF7I/Traj/Dd0TbOhkg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747100332; c=relaxed/simple;
	bh=Jesx9b1lE5uLmmVghQ0oOhfJNcUWR2wt8yp2M8kzL2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmibK8Wb6aJcdWOLuw9V5qvLe6iT5CwDC2EmI9TF0QAug8pGcBHW0PxgeiP0ewVAGyh0cYW1v76Kqy49Tx4mJvNgXWlCzsQWeZIKR9OJlUugTnrXtO8X+j3erHo+0rvp1L9JRv16/VtFRxXJZ5zhDjtq+n2IifoIMqUHPyOIaU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jG8piYdY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jG8piYdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747100330; x=1778636330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jesx9b1lE5uLmmVghQ0oOhfJNcUWR2wt8yp2M8kzL2E=;
  b=jG8piYdYRo6aRDT8puwXxzh7/HPz+7E7MOGMyfmgvAs7FWbQvVTCZVLF
   XZB9WK9ulsF1VsZi7BDTmFgcdlloqBXxiJAzvAak9Aj34YPPRzlKyzAb8
   ZxQXfRQtvFwC/EL0+OqpLpxhOFA6pNgvF2qxh9evNvl+veBjwvEujZ1MU
   cATzHN/rl0SKEoz8PTumhFuWRk2tHQ5XhtYQHWg4w7vyZfwhjEua5c3e4
   qVFUsD+EHeGUpDUfUjOikDOqcmCMkoRBbIyxIAeId8Y9gLry3WbpIHyxq
   4obuU6tCVo737YvaWUfhK7OsBHw2sw/UFj8hsEG5dt9h5q1cX29qUDV5W
   A==;
X-CSE-ConnectionGUID: q99WbgRUQfKLzqjSBNieOg==
X-CSE-MsgGUID: i2d0hbUGQ3SiOi1U4VW5Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52730121"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="52730121"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:38:49 -0700
X-CSE-ConnectionGUID: xQw6Li9VRIWgoTMxKdUq6w==
X-CSE-MsgGUID: ZXm562AoQPSDQYiJF25iqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="137444644"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 May 2025 18:38:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEebW-000FZR-0K;
	Tue, 13 May 2025 01:38:46 +0000
Date: Tue, 13 May 2025 09:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8454/10491] fs/btrfs/extent_map.o: warning:
 objtool: btrfs_split_extent_map+0x8c: unreachable instruction
Message-ID: <202505130955.cQGuUvSi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

Hi Filipe,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
commit: 8c0a82a28dbafab201f9e3b7e7cd0064e4794ceb [8454/10491] btrfs: rename remaining exported extent map functions
:::::: branch date: 15 hours ago
:::::: commit date: 6 days ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250513/202505130955.cQGuUvSi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130955.cQGuUvSi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505130955.cQGuUvSi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_map.o: warning: objtool: merge_ondisk_extents+0x98: unreachable instruction
   fs/btrfs/extent_map.o: warning: objtool: btrfs_add_extent_mapping+0x2e8: unreachable instruction
   fs/btrfs/extent_map.o: warning: objtool: btrfs_drop_extent_map_range+0x4c8: unreachable instruction
>> fs/btrfs/extent_map.o: warning: objtool: btrfs_split_extent_map+0x8c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
