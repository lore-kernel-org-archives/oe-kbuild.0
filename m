Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1071A9F97
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 02:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765594195; cv=none; b=KHjiamCnY1UUKoLbaCYA7RABU/CEW1l51miDWN8fWi25lbJmRsSXRivI5nvYUBAPrT10M/99FK5GpSG75FZAOZo2i+8GTpSYddSv5LEO8SuIbshnPFtMuHTbwHnUF+KoiBwuk4uMQe0uAYM1GIIvcFCa9/0/c54caXUiLsCVd18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765594195; c=relaxed/simple;
	bh=6/PkivTjDZbpYaBjU/h+ybnRmjpcJeJ70A1aueet3vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gAA9z7CUyiXCebaryYSQedEXU8iO7rJMRAojWgjeeNXp3SSMVt30E2WR2AUcse5qAeIf2i2E3Sq4FOkBcI6mYwXZKO/gegqbWj7iJRUn+YOYlRqaQK5nAn6OxeDbBnWeY0RtYUk8ynTiHMkU/nOAy9wufl/ARqUU3xYvVOBJyHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icTw0Eo9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icTw0Eo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765594194; x=1797130194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6/PkivTjDZbpYaBjU/h+ybnRmjpcJeJ70A1aueet3vk=;
  b=icTw0Eo90Cs7B/xVZa8NelJE1biX0lW3+21EC0hQF2d+b5Mw+c6ziyJG
   HzJDLAGwXbAIlcP9xiGV0/kLGhVpM41GqKiSWQ2be+wT6lvYMgp4Ca994
   FAEPSLzjthJ7212hRS78kFT+gO0N/q9nOGs2Jaa9ycrEnve33h4fKSgqI
   5QUIZbfOv624LHhXYmeKikIYek0xLPNVkK24bXBBeui/JHa+ZQvHOxxzM
   ZWy7bxiJ0MwAOJQ2DhzmyYQmw7BxcKk9A+NpkxqTDo+691NUx+7J9TMDk
   eI8ndYUycXj9icnUP1gZrnk9YIMhV1J0b4LCufg5E/Q4W2WkhQIpKCiGq
   A==;
X-CSE-ConnectionGUID: YILIaZ7ERUuUWocv47MfOQ==
X-CSE-MsgGUID: iZ/6exNKQpK1sArdB63r1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77911619"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="77911619"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:49:53 -0800
X-CSE-ConnectionGUID: DlPil0NQRQyoY1O4QFvQLQ==
X-CSE-MsgGUID: XszG715zQfi1JXNBqFvdWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196523072"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2025 18:49:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFhd-000000006x7-1hBr;
	Sat, 13 Dec 2025 02:49:49 +0000
Date: Sat, 13 Dec 2025 10:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/md/md.c:8183 status_personalities() warn: iterator 'i' not
 incremented
Message-ID: <202512131026.y0tchsDK-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Yu Kuai <yukuai3@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 3d44e1d1575a877cf75a7776802506ce7ab8ecc4 md: switch personalities to use md_submodule_head
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: microblaze-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131026.y0tchsDK-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131026.y0tchsDK-lkp@intel.com/

New smatch warnings:
drivers/md/md.c:8183 status_personalities() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/md/md.c:898 get_pers() warn: iterator 'i' not incremented
drivers/md/md.c:3777 analyze_sbs() warn: iterator 'i' not incremented

vim +/i +8183 drivers/md/md.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  8174  
f9cfe7e7f96a94 Yu Kuai        2024-01-09  8175  static void status_personalities(struct seq_file *seq)
f9cfe7e7f96a94 Yu Kuai        2024-01-09  8176  {
3d44e1d1575a87 Yu Kuai        2025-02-15  8177  	struct md_submodule_head *head;
3d44e1d1575a87 Yu Kuai        2025-02-15  8178  	unsigned long i;
f9cfe7e7f96a94 Yu Kuai        2024-01-09  8179  
f9cfe7e7f96a94 Yu Kuai        2024-01-09  8180  	seq_puts(seq, "Personalities : ");
f9cfe7e7f96a94 Yu Kuai        2024-01-09  8181  
3d44e1d1575a87 Yu Kuai        2025-02-15  8182  	xa_lock(&md_submodule);
3d44e1d1575a87 Yu Kuai        2025-02-15 @8183  	xa_for_each(&md_submodule, i, head)
3d44e1d1575a87 Yu Kuai        2025-02-15  8184  		if (head->type == MD_PERSONALITY)
3d44e1d1575a87 Yu Kuai        2025-02-15  8185  			seq_printf(seq, "[%s] ", head->name);
3d44e1d1575a87 Yu Kuai        2025-02-15  8186  	xa_unlock(&md_submodule);
3d44e1d1575a87 Yu Kuai        2025-02-15  8187  
f9cfe7e7f96a94 Yu Kuai        2024-01-09  8188  	seq_puts(seq, "\n");
f9cfe7e7f96a94 Yu Kuai        2024-01-09  8189  }
f9cfe7e7f96a94 Yu Kuai        2024-01-09  8190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
