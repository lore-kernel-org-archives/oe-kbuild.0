Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E881DAC97
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733161695; cv=none; b=UO6GB/OS6P9qB6IHvL68xtppnX7jdXb1GJ9/Lfjh24bAVdSHVlW8dj2MyNA1MJvcjTbxBKkIODknS6i5NHIlGrRjV/ybTOkvZwtfClBre1Q8+M/56PtwUViYCTiUUoHEJG8OS0b+7nlHM+1V1pQgS8QSSK/PFOUz1pnu+/lfkK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733161695; c=relaxed/simple;
	bh=x8jPwoVOScj3O8a8z0Ek0ktlvydokfzfotJFlJgKbRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXkJ091OXWL3hYiSbV3mCSKRlaDUbH+vkPEkK/Ln/buJL3WQselGdozb7WUGtAjNVawDqI6j1NLGpT1Q+3tC/plm6+vqWcgEDQtVdxap+M2NnrNRxE0q2Vy5SF158jZxpGBm4u44oIXw0t/MWmRiI1HMdymL2kEAF0gZG7BtAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3+D6s+E; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3+D6s+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733161694; x=1764697694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8jPwoVOScj3O8a8z0Ek0ktlvydokfzfotJFlJgKbRA=;
  b=J3+D6s+EBr49bEcfSgU2yCvsQ86KqNCFkW1WJTHQptIPjslgxIOTZKbB
   nvML0iWD+0HhI5lQU9B+f3gB5PVGzkkF4tIDyi8yLA1MmmgEwGyvd+xBR
   UANBpPYwyZNhELx0/r3+q28JCOGVjH65rBgJXfPMNjiK0jDLElCu1ycLM
   /A3JikICGF3eo+X3IZfZVFz4eINtY2WOmQlzotN57MzTfJ8Zjg3qgItuI
   Nl1L8l32gYb5IFx6VvQEhndUdEHOO/qZKSrIrjQzxHtrRFDKQ9HinsrbR
   yG75srXEyGtcwyo5NlV8aZxkZWrVjlYAVsoWfQVcidu/e8OMKGivNIXPg
   w==;
X-CSE-ConnectionGUID: BSSLpAHJTXuGIK82nzSbxg==
X-CSE-MsgGUID: s1WddfS7SPisZ1NmZJf32g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33219638"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33219638"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:48:13 -0800
X-CSE-ConnectionGUID: j6KqBRcBQ5mK3+fPZciepg==
X-CSE-MsgGUID: CNGWB3goREWel+bLBruZGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93004461"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Dec 2024 09:48:12 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIAWn-0002gv-2F;
	Mon, 02 Dec 2024 17:48:09 +0000
Date: Tue, 3 Dec 2024 01:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] x86/cpu: Enable SD_ASYM_PACKING for PKG domain on
 systems with AMD preferred cores
Message-ID: <202412030147.iL04d26O-lkp@intel.com>
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
In-Reply-To: <20241202043724.3929062-1-superm1@kernel.org>
References: <20241202043724.3929062-1-superm1@kernel.org>
TO: Mario Limonciello <superm1@kernel.org>
TO: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: "(maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\))" <x86@kernel.org>
CC: "H . Peter Anvin" <hpa@zytor.com>
CC: Mario Limonciello <mario.limonciello@amd.com>
CC: "(open list:X86 ARCHITECTURE \(32-BIT AND 64-BIT\))" <linux-kernel@vger.kernel.org>
CC: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
CC: Perry Yuan <perry.yuan@amd.com>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/x86-cpu-Enable-SD_ASYM_PACKING-for-PKG-domain-on-systems-with-AMD-preferred-cores/20241202-124012
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241202043724.3929062-1-superm1%40kernel.org
patch subject: [PATCH] x86/cpu: Enable SD_ASYM_PACKING for PKG domain on systems with AMD preferred cores
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-161-20241202 (https://download.01.org/0day-ci/archive/20241203/202412030147.iL04d26O-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412030147.iL04d26O-lkp@intel.com/

smatch warnings:
arch/x86/kernel/smpboot.c:508 x86_die_flags() warn: statement has no effect 3

vim +508 arch/x86/kernel/smpboot.c

108af4b4bd3813 Ricardo Neri      2023-08-14  499  
108af4b4bd3813 Ricardo Neri      2023-08-14  500  static int x86_die_flags(void)
108af4b4bd3813 Ricardo Neri      2023-08-14  501  {
d5fec370ef73d0 Mario Limonciello 2024-12-01  502  	if (cpu_feature_enabled(X86_FEATURE_HYBRID_CPU))
108af4b4bd3813 Ricardo Neri      2023-08-14  503  		return x86_sched_itmt_flags();
108af4b4bd3813 Ricardo Neri      2023-08-14  504  
d5fec370ef73d0 Mario Limonciello 2024-12-01  505  	switch (boot_cpu_data.x86_vendor) {
d5fec370ef73d0 Mario Limonciello 2024-12-01  506  	case X86_VENDOR_AMD:
d5fec370ef73d0 Mario Limonciello 2024-12-01  507  	case X86_VENDOR_HYGON:
d5fec370ef73d0 Mario Limonciello 2024-12-01 @508  		bool prefcore = false;
d5fec370ef73d0 Mario Limonciello 2024-12-01  509  
d5fec370ef73d0 Mario Limonciello 2024-12-01  510  		amd_detect_prefcore(&prefcore);
d5fec370ef73d0 Mario Limonciello 2024-12-01  511  		if (prefcore || cpu_feature_enabled(X86_FEATURE_AMD_HETEROGENEOUS_CORES))
d5fec370ef73d0 Mario Limonciello 2024-12-01  512  			return x86_sched_itmt_flags();
d5fec370ef73d0 Mario Limonciello 2024-12-01  513  	};
d5fec370ef73d0 Mario Limonciello 2024-12-01  514  
108af4b4bd3813 Ricardo Neri      2023-08-14  515  	return 0;
108af4b4bd3813 Ricardo Neri      2023-08-14  516  }
d3d37d850d1d77 Tim Chen          2016-11-22  517  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
