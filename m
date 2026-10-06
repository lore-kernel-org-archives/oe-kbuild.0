Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189613DA5BA
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281818; cv=none; b=SxbIbSIJosRcIn0cS/KNmLXfyRmSLfO58Um+6nx+J5N/kqAU6cG0RbugdthK5bTOXSC32pga4vKeEGk58jfQ3SnCvQr2oAiEzJAZOe9/UtrG6zZW+TW/wutzA3oBPK0JnHfLvn8T6r6fP/D6pPlqA0wZryj2YgyLCdzRQK7ypR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281818; c=relaxed/simple;
	bh=cfz0D0nqkivtd6IFybsWT7bUJup4bxyE+GUqXiqC+Xk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fC39843O8YT7gelAOIvTVXggh2pdmW1ch+7LbxWHL619R5p+fEMAuwcihTdqBx4haJmo8RrwNOBKcW0pUl7McczbXC0E6nGHH2lyxkWEeQ+cOL4SDkl18eCzNOTjcDSI66OUS+s8PwgjpQw3Sgeozifa5h8SqHFzt5/Hzzn5cwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlQv9Wur; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlQv9Wur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791281816; x=1822817816;
  h=date:from:to:cc:subject:message-id;
  bh=cfz0D0nqkivtd6IFybsWT7bUJup4bxyE+GUqXiqC+Xk=;
  b=FlQv9WurYZeq5nVTAzY/Yw8/xWNmHNWQbJyjFRkSQ1sucTqlD+8qWUSa
   jX9nC2VOLrDsUT8l1HiMOY/LMWXMpdStng2WHou6MD9BCbq+5zFPejTLA
   3Y0MYxEUPgxzp+GBKFoF0n+qZna+QluaP3WQQQ2ZZDqdSMXHDFwcVUHAr
   5euBU7gKY+zQ8QPbwEhaMSrEgbd1uYRD8XQ7jiLUspZNPjgiDtaWuWb2W
   0K1ckhCIKivRg+izdHlE05dceP5log6pqd8qBoZIym38VHNBmJXxCwCYl
   KvGp4dfnxuRivAKlyRdWKNekKmi5A69BT99y8Lv7G79bZn1qso4OQ/UUf
   w==;
X-CSE-ConnectionGUID: zifK7uNKReWZ2agTlC6sPA==
X-CSE-MsgGUID: NYIbX9KHTIK9xkOCBiE5kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="108340843"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="108340843"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 03:16:53 -0700
X-CSE-ConnectionGUID: HwMCcdxsTnWOQXIQTcIi5A==
X-CSE-MsgGUID: HOmQ9LggSvuATp8ldnmo2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276641352"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2026 03:16:52 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE2E5-0000000015v-109z;
	Tue, 06 Oct 2026 10:16:49 +0000
Date: Tue, 06 Oct 2026 12:16:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/cisco/enic/enic_res.c:219:2-25:
 opportunity for str_yes_no(enic -> has_admin_channel)
Message-ID: <202610061215.L3KeOUeP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Satish Kharat <satishkh@cisco.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c3418fffa9d037b2038a6db48be63f9e2291806
commit: 4368f5fab419b43068dea912536b1f4a724b4bba enic: detect admin channel resources for SR-IOV
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: powerpc64-randconfig-r2104-20261005 (https://download.01.org/0day-ci/archive/20261006/202610061215.L3KeOUeP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4368f5fab419 ("enic: detect admin channel resources for SR-IOV")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610061215.L3KeOUeP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/net/ethernet/cisco/enic/enic_res.c:101:2-25: opportunity for str_yes_no(ENIC_SETTING ( enic , LRO ))
   drivers/net/ethernet/cisco/enic/enic_res.c:102:2-25: opportunity for str_yes_no(ENIC_SETTING ( enic , RSS ))
   drivers/net/ethernet/cisco/enic/enic_res.c:99:2-28: opportunity for str_yes_no(ENIC_SETTING ( enic , RXCSUM ))
   drivers/net/ethernet/cisco/enic/enic_res.c:100:2-25: opportunity for str_yes_no(ENIC_SETTING ( enic , TSO ))
   drivers/net/ethernet/cisco/enic/enic_res.c:98:2-28: opportunity for str_yes_no(ENIC_SETTING ( enic , TXCSUM ))
>> drivers/net/ethernet/cisco/enic/enic_res.c:219:2-25: opportunity for str_yes_no(enic -> has_admin_channel)

vim +219 drivers/net/ethernet/cisco/enic/enic_res.c

01f2e4ead2c512 drivers/net/enic/enic_res.c                Scott Feldman    2008-09-15  194  
01f2e4ead2c512 drivers/net/enic/enic_res.c                Scott Feldman    2008-09-15  195  void enic_get_res_counts(struct enic *enic)
01f2e4ead2c512 drivers/net/enic/enic_res.c                Scott Feldman    2008-09-15  196  {
5aee3324724a7a drivers/net/ethernet/cisco/enic/enic_res.c Nelson Escobar   2024-11-13  197  	enic->wq_avail = vnic_dev_get_res_count(enic->vdev, RES_TYPE_WQ);
5aee3324724a7a drivers/net/ethernet/cisco/enic/enic_res.c Nelson Escobar   2024-11-13  198  	enic->rq_avail = vnic_dev_get_res_count(enic->vdev, RES_TYPE_RQ);
5aee3324724a7a drivers/net/ethernet/cisco/enic/enic_res.c Nelson Escobar   2024-11-13  199  	enic->cq_avail = vnic_dev_get_res_count(enic->vdev, RES_TYPE_CQ);
5aee3324724a7a drivers/net/ethernet/cisco/enic/enic_res.c Nelson Escobar   2024-11-13  200  	enic->intr_avail = vnic_dev_get_res_count(enic->vdev,
717258ba4b3ecc drivers/net/enic/enic_res.c                Vasanthy Kolluri 2010-10-20  201  						  RES_TYPE_INTR_CTRL);
01f2e4ead2c512 drivers/net/enic/enic_res.c                Scott Feldman    2008-09-15  202  
5aee3324724a7a drivers/net/ethernet/cisco/enic/enic_res.c Nelson Escobar   2024-11-13  203  	enic->wq_count = enic->wq_avail;
5aee3324724a7a drivers/net/ethernet/cisco/enic/enic_res.c Nelson Escobar   2024-11-13  204  	enic->rq_count = enic->rq_avail;
5aee3324724a7a drivers/net/ethernet/cisco/enic/enic_res.c Nelson Escobar   2024-11-13  205  	enic->cq_count = enic->cq_avail;
5aee3324724a7a drivers/net/ethernet/cisco/enic/enic_res.c Nelson Escobar   2024-11-13  206  	enic->intr_count = enic->intr_avail;
5aee3324724a7a drivers/net/ethernet/cisco/enic/enic_res.c Nelson Escobar   2024-11-13  207  
4368f5fab419b4 drivers/net/ethernet/cisco/enic/enic_res.c Satish Kharat    2026-04-01  208  	enic->has_admin_channel =
4368f5fab419b4 drivers/net/ethernet/cisco/enic/enic_res.c Satish Kharat    2026-04-01  209  		vnic_dev_get_res_count(enic->vdev, RES_TYPE_ADMIN_WQ) >= 1 &&
4368f5fab419b4 drivers/net/ethernet/cisco/enic/enic_res.c Satish Kharat    2026-04-01  210  		vnic_dev_get_res_count(enic->vdev, RES_TYPE_ADMIN_RQ) >= 1 &&
4368f5fab419b4 drivers/net/ethernet/cisco/enic/enic_res.c Satish Kharat    2026-04-01  211  		vnic_dev_get_res_count(enic->vdev, RES_TYPE_ADMIN_CQ) >=
4368f5fab419b4 drivers/net/ethernet/cisco/enic/enic_res.c Satish Kharat    2026-04-01  212  			ARRAY_SIZE(enic->admin_cq) &&
4368f5fab419b4 drivers/net/ethernet/cisco/enic/enic_res.c Satish Kharat    2026-04-01  213  		vnic_dev_get_res_count(enic->vdev, RES_TYPE_SRIOV_INTR) >= 1;
4368f5fab419b4 drivers/net/ethernet/cisco/enic/enic_res.c Satish Kharat    2026-04-01  214  
a7a79debcca02f drivers/net/enic/enic_res.c                Vasanthy Kolluri 2010-06-24  215  	dev_info(enic_get_dev(enic),
4368f5fab419b4 drivers/net/ethernet/cisco/enic/enic_res.c Satish Kharat    2026-04-01  216  		"vNIC resources avail: wq %d rq %d cq %d intr %d admin %s\n",
5aee3324724a7a drivers/net/ethernet/cisco/enic/enic_res.c Nelson Escobar   2024-11-13  217  		enic->wq_avail, enic->rq_avail,
4368f5fab419b4 drivers/net/ethernet/cisco/enic/enic_res.c Satish Kharat    2026-04-01  218  		enic->cq_avail, enic->intr_avail,
4368f5fab419b4 drivers/net/ethernet/cisco/enic/enic_res.c Satish Kharat    2026-04-01 @219  		enic->has_admin_channel ? "yes" : "no");
01f2e4ead2c512 drivers/net/enic/enic_res.c                Scott Feldman    2008-09-15  220  }
01f2e4ead2c512 drivers/net/enic/enic_res.c                Scott Feldman    2008-09-15  221  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
