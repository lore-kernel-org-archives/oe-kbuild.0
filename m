Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA6E200B0
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 03:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739330450; cv=none; b=TSI1dTS+TBg5bL25NMQBV+/GQzwxp73xSsZuXdhkHBlkDaIjKjzuZJm05LmNNPhAMxVrwvVrKftVVngzSCa2WSEUyTjFl73reIKYhI7sra6NWbXXlFQpGDEALK8xdBzblw8Qb0SoiztQPqNHHOlZy0rue/MBGXNFp3ORT/F8aaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739330450; c=relaxed/simple;
	bh=l12jcj3Z65v7x+etNfX5Jx7tP3luIfArN6E4tQurIJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCW2ww8tw5rmqlQDrdww7J5IIDq4eaOmeqrtTIcgXoU6PIh7DkiZrTFElt/8/sA2qF0+dwZKUKxIh0NiC0ge0/vg7x0SWdwv0kbXlBLc4l6svLtKed6qH79ejZDX6uSxfWxomzwrOI9Lqr+D9TvEfEibTAWQ1aYTJ88HYBT88js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMuyxGL0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMuyxGL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739330447; x=1770866447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l12jcj3Z65v7x+etNfX5Jx7tP3luIfArN6E4tQurIJM=;
  b=KMuyxGL0Y7LOcPJ9Xi03WVv+b8TuY9rn9K4XZBohQ382O81Q9pQCYRAW
   09tjUz3jguM1Lc0JhtMwP0DkVUsIZeLHOyutQwfQwZlFMT+Ibc8+QJDrg
   nYjk6q3/NypYEkvuEuudctCmE/4YrAbSC8ad8QE0YlVzjC/b9H6Yr3iik
   usL87N3t6puXzMQ3A/GIDaVVj2yrCxgvp+oxGyr+KZ2y8I3H3tlc6fVc/
   P+i6WDZwS6B9E5ALzeYgOXXHNWH4PKiZyuYnk+i0mIwJzJvfSikHJXQhS
   r4n8Jam7sM6kfOUzZtPz91rNpkI3fLR3v6PxR9AQnnKqVuJwcOShEIlVG
   w==;
X-CSE-ConnectionGUID: 3cnFfD4WQLOCEFiLf+bu1Q==
X-CSE-MsgGUID: E5M3Ag9/QB+pq7+lP2d/dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42816595"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="42816595"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 19:20:45 -0800
X-CSE-ConnectionGUID: NAiMScXcQnGoZ3qyLRhNXQ==
X-CSE-MsgGUID: V8U+C/kURb+tzamWaytKAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="143540268"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2025 19:20:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti3In-00153d-1o;
	Wed, 12 Feb 2025 03:20:41 +0000
Date: Wed, 12 Feb 2025 11:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-5.10 2738/2738]
 arch/arm64/kernel/cvm_tsi.c:120:17-18: WARNING opportunity for
 kfree_sensitive/kvfree_sensitive (memset at line 119)
Message-ID: <202502121141.FNUBjfkk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Shengjie Li <lishengjie12@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   83b361e2942e85c04f931c63e78bc54215a2db25
commit: 31071f4b2a0b2c18ad45d9d2c621e1366bf331e7 [2738/2738] cvm_tsi: add cvm tsi interface
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r054-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121141.FNUBjfkk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502121141.FNUBjfkk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/cvm_tsi.c:120:17-18: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 119)

vim +120 arch/arm64/kernel/cvm_tsi.c

31071f4b2a0b2c Shengjie Li 2024-05-25  115  
31071f4b2a0b2c Shengjie Li 2024-05-25  116  static int tmm_tsi_release(struct inode *inode, struct file *file)
31071f4b2a0b2c Shengjie Li 2024-05-25  117  {
31071f4b2a0b2c Shengjie Li 2024-05-25  118  	if (token.buf != NULL) {
31071f4b2a0b2c Shengjie Li 2024-05-25 @119  		memset(token.buf, 0, GRANULE_SIZE * MAX_TOKEN_GRANULE_PAGE);
31071f4b2a0b2c Shengjie Li 2024-05-25 @120  		kfree(token.buf);
31071f4b2a0b2c Shengjie Li 2024-05-25  121  	}
31071f4b2a0b2c Shengjie Li 2024-05-25  122  	return 0;
31071f4b2a0b2c Shengjie Li 2024-05-25  123  }
31071f4b2a0b2c Shengjie Li 2024-05-25  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
