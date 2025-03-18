Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEAD1DED62
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Mar 2025 23:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742339969; cv=none; b=ssI5CZAS0i9FMHMGgbfGfy7hHIDrLGDKTgqrf1B8RrN+H+9A2rtKjUyp+gvmtXgQYkaRELi1RaHQyggpdwZ5JQ+l+O3KPJgjizUwZerbln7AtvXhDEMtIxopieSzCq3HyFwhd07HtSedSaNF/mAgDuh12ak6Y726XAHKqiHie8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742339969; c=relaxed/simple;
	bh=iZWDj0IzYfWiNzwi9aj60YsR7NGXRiXoSTR9FtX79V0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tFfcTM9z8DXgK8xB4HENKqMFvkF7isNeRiksKkrQRHxrZ4cLx+8mGSglV7wyp8xl8jHifWU0KTaMKei1dFSlDFK5uvigdsQ2nwNyHQfo+DhWK4/iIVYPb0X+2ax8QwAszcHkoKZMBG6yw1JJYRLVD+dt2ZVfhT5dzqcfo43XTbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9SYsYxV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9SYsYxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742339966; x=1773875966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iZWDj0IzYfWiNzwi9aj60YsR7NGXRiXoSTR9FtX79V0=;
  b=H9SYsYxVZ+SiXLnzwcKftU7F1rkXFyHUYBSLpSDsPHeKzwxm2eFcZTUw
   StyNPdovs3NIHIsWzGGbTF8SIrId8agQjjVDARxuCP+EicUaKcye/Bf5J
   sA85FEIUxDa4t72j5+gYRxSJI2iB5b+ZEPZ9Bixx9pmCcumRi0ZRjD3yx
   vf8aQpNV69A2PiPgE7qeW9itGJQObTdrCWg7ClE2tqdfJGuIIWQu3XIsA
   Q0M7zOBb39YSzU/74mpMft8KGZOBEkAY4J2Lj7sNmks/DvOro+EiJOXhl
   yqGPwwW0ymqWOSDBT2yki/dbMLDQEUJlPuu+vgxHwKENJxO+UswijeD8t
   w==;
X-CSE-ConnectionGUID: VCPQta1nR5mtmezZFrCLug==
X-CSE-MsgGUID: cx8ly3icSXeyyH5PmZ/+cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54890022"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="54890022"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 16:19:25 -0700
X-CSE-ConnectionGUID: q6Du4T+zSHuNcoLYfeUHzg==
X-CSE-MsgGUID: BDaJxOITQsO8AfDepy7rnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122876815"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Mar 2025 16:19:25 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tugDS-000EEI-26;
	Tue, 18 Mar 2025 23:19:22 +0000
Date: Wed, 19 Mar 2025 07:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <202503190705.CNDxMfGV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/kernel/cacheinfo.c:47:21: sparse: sparse: trying to concatenate 9586-character string (8191 bytes max)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
References: <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
TO: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>

Hi Vincent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7eb172143d5508b4da468ed59ee857c6e5e01da6]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol-via-B4-Relay/bits-fix-typo-unsigned-__init128-unsigned-__int128/20250305-210248
base:   7eb172143d5508b4da468ed59ee857c6e5e01da6
patch link:    https://lore.kernel.org/r/20250305-fixed-type-genmasks-v4-3-1873dcdf6723%40wanadoo.fr
patch subject: [PATCH v4 3/8] bits: introduce fixed-type genmasks
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm-randconfig-r122-20250318 (https://download.01.org/0day-ci/archive/20250319/202503190705.CNDxMfGV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250319/202503190705.CNDxMfGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503190705.CNDxMfGV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/kernel/cacheinfo.c:47:21: sparse: sparse: trying to concatenate 9586-character string (8191 bytes max)

vim +47 arch/arm/kernel/cacheinfo.c

a9ff94477836cb Dmitry Baryshkov 2025-01-14  32  
a9ff94477836cb Dmitry Baryshkov 2025-01-14  33  /* Also valid for v7m */
a9ff94477836cb Dmitry Baryshkov 2025-01-14  34  static inline int cache_line_size_cp15(void)
a9ff94477836cb Dmitry Baryshkov 2025-01-14  35  {
a9ff94477836cb Dmitry Baryshkov 2025-01-14  36  	u32 ctr = read_cpuid_cachetype();
a9ff94477836cb Dmitry Baryshkov 2025-01-14  37  	u32 format = FIELD_GET(CTR_FORMAT_MASK, ctr);
a9ff94477836cb Dmitry Baryshkov 2025-01-14  38  
a9ff94477836cb Dmitry Baryshkov 2025-01-14  39  	if (format == CTR_FORMAT_ARMV7) {
a9ff94477836cb Dmitry Baryshkov 2025-01-14  40  		u32 cwg = FIELD_GET(CTR_CWG_MASK, ctr);
a9ff94477836cb Dmitry Baryshkov 2025-01-14  41  
a9ff94477836cb Dmitry Baryshkov 2025-01-14  42  		return cwg ? 4 << cwg : ARCH_DMA_MINALIGN;
a9ff94477836cb Dmitry Baryshkov 2025-01-14  43  	} else if (WARN_ON_ONCE(format != CTR_FORMAT_ARMV6)) {
a9ff94477836cb Dmitry Baryshkov 2025-01-14  44  		return ARCH_DMA_MINALIGN;
a9ff94477836cb Dmitry Baryshkov 2025-01-14  45  	}
a9ff94477836cb Dmitry Baryshkov 2025-01-14  46  
a9ff94477836cb Dmitry Baryshkov 2025-01-14 @47  	return 8 << max(FIELD_GET(CTR_ISIZE_LEN_MASK, ctr),
a9ff94477836cb Dmitry Baryshkov 2025-01-14  48  			FIELD_GET(CTR_DSIZE_LEN_MASK, ctr));
a9ff94477836cb Dmitry Baryshkov 2025-01-14  49  }
a9ff94477836cb Dmitry Baryshkov 2025-01-14  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
