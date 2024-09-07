Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAF140BE5
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725730687; cv=none; b=rmbw96EUKbGET3dPz4CsuUeALETES89uN4V5z3ikfrFBftPOlSeaWEGGRwVAMUMPSxnh0m2RHWFs3gQSIYBbzF2Ph03Yd6jAvY/1iu50fZ4hZTmkGTXBJzy4xDqy9KZ4XG7J4DP4t3F1tzRh5EK4rM/kVRznQ/5iShq3hau6urs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725730687; c=relaxed/simple;
	bh=QzGgD4OU/Fz4qdLfRvXMsuCfnIZg62G3HpEPYgGz63k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgWI1b68PIxvUOVWO3fGyW/ksrCD/NSVjNM+lqnpcP1MlyOsan/zTbH2y5nXO2g9iI6X/VCO5QUBVu4e6lTopC0P66bHhhmvtiAyYNIQ0iTFDfuqmNyovJjcbPwf+86vN2tLHZ45JmeYJSCZnzd0stTLfu2/MyKXyoWFOm7XBTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXC+mlIA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXC+mlIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725730685; x=1757266685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QzGgD4OU/Fz4qdLfRvXMsuCfnIZg62G3HpEPYgGz63k=;
  b=ZXC+mlIAn84uQtgse5PVUAGS4sKd7yWA6YGIIEcwsZefdFZbGVtd/cm4
   Sk3HgpI+XYXFK+SVsMoh69p0lrg9PObGMLkbN0jy/HO1q51GEV0RabUcS
   XRhSrS4biTkd+so1y8Nr6g126D1MFPe4cON4vvHHFV21JrtgaWzXJVHHH
   R4Ib/8WgPlv7x/5Bya6esPX1EApdGeiVxORelT2z7ISnelz/TC56xJYUh
   3/eDpMVAUkFuOSPCY0kSvfHIwZ6h3St+XowGZwuO9/WVqH3RiPiHKNrx0
   +12l0gIUV6yIUQ79xndecYBPUd1a5EtVxfY77SNoM17MRB9fou1G76THn
   g==;
X-CSE-ConnectionGUID: /cNBAW2yRJ2CT2YWnQSnkg==
X-CSE-MsgGUID: e5hMPAgvT72D8O6IFWYBkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24265629"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24265629"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 10:38:05 -0700
X-CSE-ConnectionGUID: iISTDtXlStCkhOCafH26/Q==
X-CSE-MsgGUID: 1xsah052Rq2fXO+TVbsG6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66788060"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Sep 2024 10:38:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smzNp-000CnD-2K;
	Sat, 07 Sep 2024 17:38:01 +0000
Date: Sun, 8 Sep 2024 01:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH v3 08/10] mm/mshare: Add basic page table sharing
 support
Message-ID: <202409080155.DiVFKC8g-lkp@intel.com>
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
In-Reply-To: <20240903232241.43995-9-anthony.yznaga@oracle.com>
References: <20240903232241.43995-9-anthony.yznaga@oracle.com>
TO: Anthony Yznaga <anthony.yznaga@oracle.com>

Hi Anthony,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11-rc6]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anthony-Yznaga/mm-Add-msharefs-filesystem/20240904-072513
base:   linus/master
patch link:    https://lore.kernel.org/r/20240903232241.43995-9-anthony.yznaga%40oracle.com
patch subject: [RFC PATCH v3 08/10] mm/mshare: Add basic page table sharing support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080155.DiVFKC8g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409080155.DiVFKC8g-lkp@intel.com/

smatch warnings:
mm/internal.h:1584 vma_is_shared() warn: bitwise AND condition is false here
mm/memory.c:1811 unmap_page_range() warn: inconsistent indenting
mm/memory.c:5836 handle_mm_fault() warn: variable dereferenced before check 'vma' (see line 5815)

vim +1584 mm/internal.h

3577dbb192419e Mateusz Guzik 2024-05-22  1580  
c947fc41c30bcb Khalid Aziz   2024-09-03  1581  extern vm_fault_t find_shared_vma(struct vm_area_struct **vma, unsigned long *addrp);
bff3f0b9b7b8b8 Khalid Aziz   2024-09-03  1582  static inline bool vma_is_shared(const struct vm_area_struct *vma)
bff3f0b9b7b8b8 Khalid Aziz   2024-09-03  1583  {
bff3f0b9b7b8b8 Khalid Aziz   2024-09-03 @1584  	return VM_SHARED_PT && (vma->vm_flags & VM_SHARED_PT);
bff3f0b9b7b8b8 Khalid Aziz   2024-09-03  1585  }
bff3f0b9b7b8b8 Khalid Aziz   2024-09-03  1586  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
