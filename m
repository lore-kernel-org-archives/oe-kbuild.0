Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BBF472DA3
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767872294; cv=none; b=Ea++hO5RQV67xKDvpZoT/F5SdireIBt3U+r6HkDBd56zvj0an11bldJjHYIxtfmB8cjrIx6lbY3mPpR0yQXgyv3O27GAHpeeAr3QXcyWuLM8Bhrry70GED8+K7N67fj1YX3cc/Bwe0GSlpV9zeg1aBPJ7wH5cqGprjjPE98fKFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767872294; c=relaxed/simple;
	bh=sVZUGiu03+vHZPC7wjaBwSPa4YM5OtJcxKrCDowyfD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulhz7d0lW0p2HdkXNXG9/bXyJ+XhnLlDAtX7AxGnd3f8K1PbgFiEsevhuh4YqZtRuiz0+xqbRYB2CgYn9d0aP1GMFJBSpctcfD6HewlUwn4X8A4IIsvj3S8FksqHPy16X2GeNBTVsElFTALEoqhnbA/9mrsonv6ny+hKy1rjmAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcoTQgoQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcoTQgoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767872291; x=1799408291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVZUGiu03+vHZPC7wjaBwSPa4YM5OtJcxKrCDowyfD0=;
  b=EcoTQgoQ/MLYB/zzWCFQ7TdQhFjhyLuiCjEkSH7r9amAERnuHAUi1wvt
   6kCWCy8p88uIoXfUrwfX2EDrBTz+T/m75l4c5/tTGO9kfQ3HwtBp9Y5Sj
   k2jEzkZAlh/em9Os3ISRKFJi74B0nIVQuFApPreJr/iF8o3oLMSDzQSR9
   xoWqoBefj0YSI4yAGNOrcIfk6RNdrISNGiscvQEiLks+6TJOuzCY0UW2u
   MOnNaYz7AhPBlH8lD+4ry5rPKr1fPriEGcPwg1vTvjiz1Sj48ig7mlduf
   8c/meWYfgG1QwekrqonyIyeHEKFLhAnRzPG/D/QpN7hG8dtPZgcQojPD3
   A==;
X-CSE-ConnectionGUID: lYB8dSIlSF23uWGSZrs+Ew==
X-CSE-MsgGUID: /B6w469/QtCGFUBOdBb8yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56806721"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56806721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 03:38:09 -0800
X-CSE-ConnectionGUID: wPXi/dsSQw22H6+tN86IEA==
X-CSE-MsgGUID: 4ivBNhVDS9igQNrSjgNBIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233895299"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 08 Jan 2026 03:38:08 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdoL8-000000001lk-18pQ;
	Thu, 08 Jan 2026 11:38:06 +0000
Date: Thu, 8 Jan 2026 12:37:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] vfio: selftests: Add iommufd hwpt replace test
Message-ID: <202601081206.dqP3SEbw-lkp@intel.com>
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
In-Reply-To: <20260107201800.2486137-4-skhawaja@google.com>
References: <20260107201800.2486137-4-skhawaja@google.com>
TO: Samiullah Khawaja <skhawaja@google.com>
TO: David Woodhouse <dwmw2@infradead.org>
TO: Lu Baolu <baolu.lu@linux.intel.com>
TO: Joerg Roedel <joro@8bytes.org>
TO: Will Deacon <will@kernel.org>
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
TO: Jason Gunthorpe <jgg@ziepe.ca>
TO: David Matlack <dmatlack@google.com>
CC: Samiullah Khawaja <skhawaja@google.com>
CC: Robin Murphy <robin.murphy@arm.com>
CC: Pratyush Yadav <pratyush@kernel.org>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Alex Williamson <alex@shazbot.org>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: iommu@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: kvm@vger.kernel.org
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Adithya Jayachandran <ajayachandra@nvidia.com>
CC: Parav Pandit <parav@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: William Tu <witu@nvidia.com>

Hi Samiullah,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6cd6c12031130a349a098dbeb19d8c3070d2dfbe]

url:    https://github.com/intel-lab-lkp/linux/commits/Samiullah-Khawaja/iommu-vt-d-Allow-replacing-no_pasid-iommu_domain/20260108-041955
base:   6cd6c12031130a349a098dbeb19d8c3070d2dfbe
patch link:    https://lore.kernel.org/r/20260107201800.2486137-4-skhawaja%40google.com
patch subject: [PATCH 3/3] vfio: selftests: Add iommufd hwpt replace test
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260108/202601081206.dqP3SEbw-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601081206.dqP3SEbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601081206.dqP3SEbw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c:2:10: fatal error: sys/ioctl.h: No such file or directory
       2 | #include <sys/ioctl.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c

fe33971532b06c Samiullah Khawaja 2026-01-07 @2  #include <sys/ioctl.h>
fe33971532b06c Samiullah Khawaja 2026-01-07  3  #include <sys/mman.h>
fe33971532b06c Samiullah Khawaja 2026-01-07  4  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
