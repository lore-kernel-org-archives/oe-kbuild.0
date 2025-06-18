Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C62B285C8B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241131; cv=none; b=FvoKVT0O19MXy/BQX4R40JTf4lJDdUzPnFhV2aM7nYUumzckfRy0zC6U3hdEueF7W2ujnfFQ14U5QFjCUR4i5p4nBM+iTIOb2DDWVCFZEN39QQ4bzeDmiPcjqSc1G3v20AAjpMc7wGPW8xbCnPRsYW7g0hQGamp/BUvQvtW8M9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241131; c=relaxed/simple;
	bh=I6M22QaoxPaxqVNl3N2mstGAQOGOgaWmEX65hyeHXR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJ5RHQIEKmZ20Lb9p1j81vRPt66dClaja+vad4K2CVbJNsil9VpCegZD8B3q2EXGqjKupp4EAImFOm5tWBdg3ccUlGIKjKbs+A7Fg6oy8LG0ifuQI9XnRDJZgUJ5ZpsKm2qvX1okSGiifNuxF7p1QM5UC9eL38qmyB4eZAX6yxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlFhrvC5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlFhrvC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750241129; x=1781777129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I6M22QaoxPaxqVNl3N2mstGAQOGOgaWmEX65hyeHXR4=;
  b=YlFhrvC5PFE67d95h/IsW4XoeMWX89dAgy5isIZy6NnR8nOsQ9fQDh14
   +El0W+Va+TVRiD6evGCeKLrUuMPG6dPV9PSlN60K3y194LrmOgVee6oFT
   hmKGYWhUa34b3mlj06VP4k/iMBARkeS2DuAhqGUVQRzlB5o5sNLxMkk+V
   QIOaakDBxTuAiqTFAk6PQ0ap1vPBazAZxc5qD4xWhutIW5D2SFc8YCUnU
   k8OYwUCt/HxDd5zCDyNGg+UKu7kg1eDMn+kuqP40arVCZkgATFJnZxBDa
   oY4qYuHodyILB35/PstEt6ytVYR9NohMd141NXJdDF/Z9Tf+2/3B2dZnQ
   A==;
X-CSE-ConnectionGUID: vfZkjjXpQGGVcR+Zqv/4HQ==
X-CSE-MsgGUID: cb6JtGDeRLWzmWzKSF9DLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52371033"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52371033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:05:28 -0700
X-CSE-ConnectionGUID: 54J+upHnR4yBbczvCxb76g==
X-CSE-MsgGUID: Z4bw7/9UQD6tf+0Aiq+g4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149218619"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jun 2025 03:05:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRpfZ-000Jdy-0K;
	Wed, 18 Jun 2025 10:05:25 +0000
Date: Wed, 18 Jun 2025 18:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jaegeuk-f2fs:dev-test 6/18] fs/f2fs/segment.o: warning: objtool:
 do_write_page+0x104: unreachable instruction
Message-ID: <202506181735.hhZVgCI3-lkp@intel.com>
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
CC: linux-f2fs-devel@lists.sourceforge.net
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   efa38cdf8fc886c1070d25890c91d6c2a7e70dec
commit: 5c7fd57eb036a7b736d39f31bee7e52708ec3877 [6/18] f2fs: do sanity check on fio.new_blkaddr in do_write_page()
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: loongarch-randconfig-r072-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181735.hhZVgCI3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181735.hhZVgCI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506181735.hhZVgCI3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/segment.o: warning: objtool: update_sit_entry_for_alloc+0x74: unreachable instruction
   fs/f2fs/segment.o: warning: objtool: update_sit_entry_for_release+0x210: unreachable instruction
   fs/f2fs/segment.o: warning: objtool: __locate_dirty_segment+0x1cc: unreachable instruction
   fs/f2fs/segment.o: warning: objtool: get_new_segment+0x298: unreachable instruction
   fs/f2fs/segment.o: warning: objtool: __issue_discard_cmd+0x248: unreachable instruction
   fs/f2fs/segment.o: warning: objtool: f2fs_do_replace_block+0x130: unreachable instruction
   fs/f2fs/segment.o: warning: objtool: f2fs_allocate_data_block+0x138: unreachable instruction
>> fs/f2fs/segment.o: warning: objtool: do_write_page+0x104: unreachable instruction
   fs/f2fs/segment.o: warning: objtool: f2fs_flush_sit_entries+0x158: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
