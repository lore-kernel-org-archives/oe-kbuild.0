Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA85A7DA66
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 14:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764685598; cv=none; b=na120jD4YscCN22YKm2zZIlCl9vEOVwiO8SMHyn4RGWuOs+cYCnexjwQB2e6Ma7aSDfoWfE0Y6/XYa71G/R+WhjUDwB2rdc+yCiex7a5o0sSu/3e3GtWUQlUPk2DzX3RfQjBlp9dQCVuSas+CsWmcbGAN8mhm+J6YkK1FUqipeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764685598; c=relaxed/simple;
	bh=hUbS0oO3cHWhXv0vCPxw9zj2+Iugupd9aWlaNF3GScs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bjPKlFRXl5CrI4xugdryfkn2ChZUyLP3LVlzoOzUiB8J822zQOkWMBMsFdyYxRkA3Q3nCT+xCrc7qF9CgUg0LeYRlJY1+lAQ7zXqY6/je13aazdQSdm1nKSfbA5yHcs+lBzgNT7fCOnY5QPs27hFZMtKGYlhPzKFbQCrlSzkYtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CfHRckf9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfHRckf9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764685597; x=1796221597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hUbS0oO3cHWhXv0vCPxw9zj2+Iugupd9aWlaNF3GScs=;
  b=CfHRckf9N2sC+81bIVyM+Wi5P5vlj+qw8B1NbytIPL1hCEX1hu+q/ByW
   U9KQwMp3eS49c/Vc/gIQvyB4KZUinGwn27IHbjUvbRSyEE1F7Y264htBd
   ImUH4ZqFiqjTOqlZ9gdviqHukZSjx+Nh5W6tmy3wkX4TEQybDNAvGVmnv
   cbl5Mg49B1PvR4wu3xfCMIroepri1hX0UVEse26kS7SITKdmoaoT1FMn+
   BuYEygCGM0wlreGNX+sGXraOBhXzbOapmBdpyWlj6J6GCoajQKjnlVS/W
   1krJwXMg8D1XEa4nZ6LOdp/+AklzfQs25iXdTgWGoYeqqa8UeFINlfveU
   Q==;
X-CSE-ConnectionGUID: aBlpL5ttQCSM8cQ+6zPYGw==
X-CSE-MsgGUID: J/zSsJ0fTwK7XyLxcaJqfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66366622"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66366622"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 06:26:36 -0800
X-CSE-ConnectionGUID: 0MSYcLnfTyCN3Ije+t7X0A==
X-CSE-MsgGUID: TZS5uTIWR1SGi2i01P/NJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194381655"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2025 06:26:36 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQRKr-000000002tR-2Nl4;
	Tue, 02 Dec 2025 14:26:33 +0000
Date: Tue, 2 Dec 2025 15:26:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 36/36] map_hugetlb.c:79:18:
 error: call to undeclared function 'default_huge_page_size'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202512021558.rAIf9zoH-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: a584c7734a4dd050451fcdd65c66317e15660e81 [36/36] selftests: mm: fix map_hugetlb failure on 64K page size systems
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 9 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021558.rAIf9zoH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021558.rAIf9zoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021558.rAIf9zoH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> map_hugetlb.c:79:18: error: call to undeclared function 'default_huge_page_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |         hugepage_size = default_huge_page_size();
         |                         ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
