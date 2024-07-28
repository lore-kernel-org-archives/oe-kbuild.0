Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056DA5A7AA
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jul 2024 14:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722175871; cv=none; b=F41K/BsolSyTge+evNeyqRyBvEJdQbddldjUSlvi3uCce4ZfZbsFMIeXszGBN+1Q7BUp2yfDHNPIZUJ4c8Mp71ox2rsFVmistA8UzbyZ0fZHp62Ir6PRGRx5kB2WrswX9uOwKwyr0bFPsXBUaHPH6Atte+Avp2X+gwrqkcyvkx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722175871; c=relaxed/simple;
	bh=ciufenspEvNu3SnAl329pjzrmLTp3NWOCDSP7XUqPwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sjRL6zoBbA9aohgmMRpVKUXXp7ut1wGAQDYQIhLOiIt/0UEhqA9FaXV+UUnw9a5EwHuMHhvKNz70WhoNX1WpJpA0IqFfR5MLLIeYz6c2EYrlu1LXlaoaLFNO4XzXroOfjMBxwkIl/vdKe0mcfwQ8QDIMQCmxHSkk3VIZdaPWJu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INCVYzBK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INCVYzBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722175870; x=1753711870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ciufenspEvNu3SnAl329pjzrmLTp3NWOCDSP7XUqPwo=;
  b=INCVYzBK8OEx5qS9RvZGiLdfyM5PyvwlaPHev6flz8oxsOrPPNwnH55F
   ae/XtlXxpHQsf9J+PiUK5J0FbvQdtIbS4vbAhgeQXJk6u7dhFbIrOm0m1
   MEcOl5uRnyR1e5J8auE0+OqqV+5df+61MH0ko07x2UD+j9Kyb6KWQE/in
   XaBa1cO6ghzJOqOaYCHYrUyHUeTFAGrQ5vJjwFRTONxNKepq070BHnEqy
   I86ZWcXXxW4rtAHS2VCdBJ2iSUZ9P1uZ+Ogljt26igZJ45CGMijr28bNU
   KL/RW4Q0x1ynrOridZhgddT3esYJ4L8vuEpUIQfeE5uer2Vrmc08yMpYN
   w==;
X-CSE-ConnectionGUID: 3ZlqTSjNQmGqBUDUxo/tvQ==
X-CSE-MsgGUID: An3smAlWTAOItLADRO2xrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="12753147"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="12753147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 07:11:06 -0700
X-CSE-ConnectionGUID: /siflSjBSBuIsBLzPa2ncg==
X-CSE-MsgGUID: yYoUhy52RQGxwZDWKQQgGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="76955675"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2024 07:11:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sY4c3-000qqj-1K;
	Sun, 28 Jul 2024 14:11:03 +0000
Date: Sun, 28 Jul 2024 22:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/memcontrol-v1.c:454 folio_memcg_lock() warn: inconsistent returns
 'flags'.
Message-ID: <202407282221.LeTV9RK4-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5437f30d3458ad36e83ab96088d490ebfee844d8
commit: e548ad4a7cbf765f3ab74f6aa1aecc2df390a0b2 mm: memcg: move charge migration code to memcontrol-v1.c
date:   3 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-r071-20240728 (https://download.01.org/0day-ci/archive/20240728/202407282221.LeTV9RK4-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407282221.LeTV9RK4-lkp@intel.com/

smatch warnings:
mm/memcontrol-v1.c:454 folio_memcg_lock() warn: inconsistent returns 'flags'.

vim +/flags +454 mm/memcontrol-v1.c

e548ad4a7cbf76 Roman Gushchin 2024-06-24  437  
e548ad4a7cbf76 Roman Gushchin 2024-06-24  438  	if (atomic_read(&memcg->moving_account) <= 0)
e548ad4a7cbf76 Roman Gushchin 2024-06-24  439  		return;
e548ad4a7cbf76 Roman Gushchin 2024-06-24  440  
e548ad4a7cbf76 Roman Gushchin 2024-06-24  441  	spin_lock_irqsave(&memcg->move_lock, flags);
e548ad4a7cbf76 Roman Gushchin 2024-06-24  442  	if (memcg != folio_memcg(folio)) {
e548ad4a7cbf76 Roman Gushchin 2024-06-24  443  		spin_unlock_irqrestore(&memcg->move_lock, flags);
e548ad4a7cbf76 Roman Gushchin 2024-06-24  444  		goto again;
e548ad4a7cbf76 Roman Gushchin 2024-06-24  445  	}
e548ad4a7cbf76 Roman Gushchin 2024-06-24  446  
e548ad4a7cbf76 Roman Gushchin 2024-06-24  447  	/*
e548ad4a7cbf76 Roman Gushchin 2024-06-24  448  	 * When charge migration first begins, we can have multiple
e548ad4a7cbf76 Roman Gushchin 2024-06-24  449  	 * critical sections holding the fast-path RCU lock and one
e548ad4a7cbf76 Roman Gushchin 2024-06-24  450  	 * holding the slowpath move_lock. Track the task who has the
e548ad4a7cbf76 Roman Gushchin 2024-06-24  451  	 * move_lock for folio_memcg_unlock().
e548ad4a7cbf76 Roman Gushchin 2024-06-24  452  	 */
e548ad4a7cbf76 Roman Gushchin 2024-06-24  453  	memcg->move_lock_task = current;
e548ad4a7cbf76 Roman Gushchin 2024-06-24 @454  	memcg->move_lock_flags = flags;
e548ad4a7cbf76 Roman Gushchin 2024-06-24  455  }
e548ad4a7cbf76 Roman Gushchin 2024-06-24  456  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
