Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB91374737
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260866; cv=none; b=TNIvip2H+F6udGWOeSym4o7VYd6KF2kM4yt8cgRAMdcYEzZRvkYamh9PYSsyKeG8P6To/F3Mb3ywoDui3ldNiOMAJA8DzIlCXL8ZdvAe0ArD7GYOPybI+NHL6JRawYDCk6cbVxvlrYK4n/DOlJwffwodmo5ShJli4CsEyeGivOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260866; c=relaxed/simple;
	bh=xwupmhSWzLFZ/skxFsLoumpFP+0iodLHe6acz9vnCOk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tna+pB97N2n6FQNWTx+6WzFAo0oKOT1J83uadyw5tHI1+7l5wr35NY8Pb8UcPXXTiCuq9NWaRtoL0FNTf+8OVstIGqJHjv7fWwz0NgECoL7AUAnqr+XnAWZssp1edGF0L5dj0k3e7tE1c6ItSO4GekYCaJ6q8EV9jpnBm2XL5qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVXYHYUm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVXYHYUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779260864; x=1810796864;
  h=date:from:to:cc:subject:message-id;
  bh=xwupmhSWzLFZ/skxFsLoumpFP+0iodLHe6acz9vnCOk=;
  b=kVXYHYUm+p5/9zhK/eSz9RYN7j9Cl7Ez5auOUDE7SCdKNbll8b7wpcpN
   /wj7V5rp+pU6bLGLNyTfOP1ZP8zOQcaOpBrXLDNj0Cfia69t5dm7ztKu6
   Yau1w37qa1vT1O3pR0MP056PCSd7H47aCq6vC3CdBEgd5fkNzMUctrdQu
   wsO9MA4HFt3QN8/BRYbH57S9iQr/EFkGQVSopHmH6qJICKu1J9EEKLuyW
   SQCS78iyiE5iVLzejZek4E3vJXpWkZqDIf6jdsK+n4QISkBKqqXA7YeQr
   XFeRMIlUu4i7UNNuOYLg7D0KDFLBnIWVpc7PCnMtlVU4e96hTt95LXrVN
   A==;
X-CSE-ConnectionGUID: Mnk9K/IFQAKAeEa1H0oJSw==
X-CSE-MsgGUID: 9xzPTz+MQxqNtvVjdDLCnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="84034719"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="84034719"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 00:07:44 -0700
X-CSE-ConnectionGUID: AH+KRAfGRAO+p2DlrhMnpA==
X-CSE-MsgGUID: xgJW3zjRRR6hoptoTCmo4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239213117"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2026 00:07:44 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPb1p-000000002hT-1ep4;
	Wed, 20 May 2026 07:07:41 +0000
Date: Wed, 20 May 2026 15:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: undefined reference to `mem_cgroup_dmem_uncharge'
Message-ID: <202605201518.KZ0oSQFj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Eric-Chanudet/mm-memcontrol-add-dmem-charge-uncharge-functions/20260520-000345, commit: 8c23ade377046c937570c234116eb210372657dd"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Chanudet <echanude@redhat.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eric-Chanudet/mm-memcontrol-add-dmem-charge-uncharge-functions/20260520-000345
head:   8c23ade377046c937570c234116eb210372657dd
commit: 8c23ade377046c937570c234116eb210372657dd cgroup/dmem: add dmem.memcg control file for double-charging to memcg
date:   15 hours ago
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: alpha-randconfig-r051-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201518.KZ0oSQFj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201518.KZ0oSQFj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605201518.KZ0oSQFj-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: kernel/cgroup/dmem.o: in function `dmem_cgroup_uncharge':
>> (.text+0x16b4): undefined reference to `mem_cgroup_dmem_uncharge'
>> alpha-linux-ld: (.text+0x16c0): undefined reference to `mem_cgroup_dmem_uncharge'
   alpha-linux-ld: kernel/cgroup/dmem.o: in function `dmem_cgroup_try_charge':
>> (.text+0x22f4): undefined reference to `mem_cgroup_dmem_charge'
>> alpha-linux-ld: (.text+0x2308): undefined reference to `mem_cgroup_dmem_charge'
   alpha-linux-ld: (.text+0x2484): undefined reference to `mem_cgroup_dmem_uncharge'
   alpha-linux-ld: (.text+0x2490): undefined reference to `mem_cgroup_dmem_uncharge'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
