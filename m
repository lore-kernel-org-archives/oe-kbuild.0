Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897D22877D9
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Oct 2025 17:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760289642; cv=none; b=W+pxy3iYiC+PbpTZyzdnIck4h+aeGzDjd5Yf7RUsbHp3h5WH6Sda+MpM5ERNvuuHFcx/loXeHfmCAJSMouF4VUcKonhQBupwBmcebcQoaMJCmZqRqHkKolkSAt9Kk6vGg7pYljEzzLqsaWSM0C4iu2fLH57N7NPWSBbeVTGMHYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760289642; c=relaxed/simple;
	bh=1Uz6dtjZpElu9PKTazVu3XDS9bHR/De9rd+mH/764GM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G3/XvDusof+cy0xD6/R1UZ1H/2AmGSkRqNOUrpqBO2U5CPmhHMGN8Bt5XLOqiVGNPOMwXAjgk3T3keHDANJFnaAWvwUqrf2JxOwDahYl7LopznWgkkqmOSlCw4++JjZa6oFkhSZC1fG9UW1g6x7es82iiXjJq00NGLu8P4S9zzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UT2bppvk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UT2bppvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760289640; x=1791825640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Uz6dtjZpElu9PKTazVu3XDS9bHR/De9rd+mH/764GM=;
  b=UT2bppvk5vcRPBYpia/uTSitx5cnV3QlX2K+brtkK88p4gNteNo2dvqF
   bQNYOeXFhzs7idD7YK+L3QOSXtbfyxL9PTLwrXwz6BSLLUcDAfQYZjICQ
   hC0UiEkMuLFhjS4GZlWH/E1l+Y/2ijH/Vjru3LpiXZPwYmY/ZviP9EmiN
   +/3Mqjzrc52BXkJshYxd8sAcKkHm25csU+Ab6ZqRVVLSwUeHMkygscEWr
   FD0aI19iTEOihau1WsHNCwdnS9JvtHLX8o7J30qNe7k203XXcN4mUxuei
   mGVEoTwTsjWY3LuFCsbp/k+KYVoFBEd3nZ+OWlcSRO+F7IrCfTloqUS5b
   A==;
X-CSE-ConnectionGUID: cJyps2HlSBGKlC027v1r0A==
X-CSE-MsgGUID: A14xcOPjTJ6HkqH3ZULZ3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66264574"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66264574"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 10:20:39 -0700
X-CSE-ConnectionGUID: ctLPWL2lQne0epdQp7o8ww==
X-CSE-MsgGUID: K8/o0XV7RUG8dm2oRqTYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="180648316"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2025 10:20:38 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7zkK-0004VD-02;
	Sun, 12 Oct 2025 17:20:36 +0000
Date: Mon, 13 Oct 2025 01:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC RFC PATCH] mm: convert VM flags from macros to enum
Message-ID: <202510130026.pC5WDSC7-lkp@intel.com>
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
In-Reply-To: <20251011093054.886460-1-ye.liu@linux.dev>
References: <20251011093054.886460-1-ye.liu@linux.dev>
TO: Ye Liu <ye.liu@linux.dev>

Hi Ye,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Liu/mm-convert-VM-flags-from-macros-to-enum/20251011-173307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251011093054.886460-1-ye.liu%40linux.dev
patch subject: [RFC RFC PATCH] mm: convert VM flags from macros to enum
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20251012 (https://download.01.org/0day-ci/archive/20251013/202510130026.pC5WDSC7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510130026.pC5WDSC7-lkp@intel.com/

smatch warnings:
mm/internal.h:1547 vma_soft_dirty_enabled() warn: bitwise AND condition is false here
mm/internal.h:1547 vma_soft_dirty_enabled() warn: bitwise AND condition is false here
mm/internal.h:1547 vma_soft_dirty_enabled() warn: bitwise AND condition is false here
mm/internal.h:1547 vma_soft_dirty_enabled() warn: bitwise AND condition is false here
mm/internal.h:1547 vma_soft_dirty_enabled() warn: bitwise AND condition is false here

vim +1547 mm/internal.h

412c6ef9862412 Yajun Deng 2024-01-24  1531  
76aefad628aae1 Peter Xu   2022-07-25  1532  static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
76aefad628aae1 Peter Xu   2022-07-25  1533  {
76aefad628aae1 Peter Xu   2022-07-25  1534  	/*
76aefad628aae1 Peter Xu   2022-07-25  1535  	 * NOTE: we must check this before VM_SOFTDIRTY on soft-dirty
76aefad628aae1 Peter Xu   2022-07-25  1536  	 * enablements, because when without soft-dirty being compiled in,
76aefad628aae1 Peter Xu   2022-07-25  1537  	 * VM_SOFTDIRTY is defined as 0x0, then !(vm_flags & VM_SOFTDIRTY)
76aefad628aae1 Peter Xu   2022-07-25  1538  	 * will be constantly true.
76aefad628aae1 Peter Xu   2022-07-25  1539  	 */
76aefad628aae1 Peter Xu   2022-07-25  1540  	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
76aefad628aae1 Peter Xu   2022-07-25  1541  		return false;
76aefad628aae1 Peter Xu   2022-07-25  1542  
76aefad628aae1 Peter Xu   2022-07-25  1543  	/*
76aefad628aae1 Peter Xu   2022-07-25  1544  	 * Soft-dirty is kind of special: its tracking is enabled when the
76aefad628aae1 Peter Xu   2022-07-25  1545  	 * vma flags not set.
76aefad628aae1 Peter Xu   2022-07-25  1546  	 */
76aefad628aae1 Peter Xu   2022-07-25 @1547  	return !(vma->vm_flags & VM_SOFTDIRTY);
76aefad628aae1 Peter Xu   2022-07-25  1548  }
76aefad628aae1 Peter Xu   2022-07-25  1549  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
