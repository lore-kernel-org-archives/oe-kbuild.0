Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630D428CF5D
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144414; cv=none; b=kSF0+LcDVj7nIHfAiDTQsqLj4s5kucvCss0fNP+WM2lLnWBq47SFN0EJ7+Tv67R1iH3qzH2vbEB+Tnt+i2/b4Bs6viJeA/yPslgrFHJJKi7lzZsEidQoO639WbWVhcDsivqHo/6jUoHCpCUe7hiNT7Jfe8b+IORUcf8fvcM6ra4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144414; c=relaxed/simple;
	bh=cNv+VNtj0jOwg5/SRxR2KjMP/L+dGIyJRINzvIbP3b0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uH0QBc5WB41n3m6KccuEtNPxVRW0hSZFsiXoS2ahdHbV1cOwS2fq4kRwcxA5PnH7Vfph50D1J76LbYjNmr2v/FVI+17TQWlmoLAsZ7NZeB7UlXP89ELl5FWwB8x5r23XJWxcKdkDMB4GLQv7ty5KqpzKurSzM0Sd39LBRpVZGWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZ/BTkrb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZ/BTkrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787144412; x=1818680412;
  h=date:from:to:cc:subject:message-id;
  bh=cNv+VNtj0jOwg5/SRxR2KjMP/L+dGIyJRINzvIbP3b0=;
  b=eZ/BTkrbTmr8LVoZUvtCXc+xsMmOPR3ysQ4RsfC7HhPxiwP+VwfPdAPR
   4cl9UZjoFsK2fRyUuw5B9VpNCmjaO73LuyoAvgGuTn846XK6GLI7RQrMj
   NnTmlpjTa/KukELGwwUsjnmwN31hc5wNq9RiStqXFsufoA2cDj4x3/Xpz
   ABP5G1YwV3K6CGBc3JTVVG2Kd02k2E77C36n0mAioJ1Uk6vEpHdzDPwMn
   4FMQ2+WOD2f+gVS4xiKWbI0s4xTDScbmTtZq2LIzmi/1fYmZOIic5O1Ns
   jIVRoEh5lJeZXOVysHnfPk7JqDXnnb/rbDD4OWaoIabQQp1ItDjRVp1Xw
   A==;
X-CSE-ConnectionGUID: /l0aF69lTDmV9y5v1n0p/w==
X-CSE-MsgGUID: mPsSDNrfQ3qixRQnkkL09w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="110442619"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="110442619"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 06:00:11 -0700
X-CSE-ConnectionGUID: vMiOayKSSY61mXBo6qGsZA==
X-CSE-MsgGUID: wDZz85lgTWClBH9ehWNIIQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2026 06:00:09 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwftn-000000007NF-3CRl;
	Wed, 19 Aug 2026 13:00:07 +0000
Date: Wed, 19 Aug 2026 14:59:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [modules:ppavlu-module-include 36/37]
 arch/arm64/include/asm/module.h:48:16: error: implicit declaration of
 function 'cpus_have_final_cap'
Message-ID: <202608191435.CTMWvnpe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Petr Pavlu <petr.pavlu@suse.com>
CC: Sami Tolvanen <samitolvanen@google.com>
CC: Daniel Gomez <da.gomez@kernel.org>
CC: linux-modules@vger.kernel.org
TO: Petr Pavlu <petr.pavlu@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git ppavlu-module-include
head:   fcbfd3cbe0a054838436812cc0b664f71ba1d0a4
commit: acb4d9bafad10e9712a74d71304a4f3a404eb4ec [36/37] WIP: module: Clean up includes in linux/module.h
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260819/202608191435.CTMWvnpe-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191435.CTMWvnpe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608191435.CTMWvnpe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:28,
                    from ../../../drivers/nvdimm/namespace_devs.c:6:
   arch/arm64/include/asm/module.h: In function 'is_forbidden_offset_for_adrp':
>> arch/arm64/include/asm/module.h:48:16: error: implicit declaration of function 'cpus_have_final_cap' [-Wimplicit-function-declaration]
      48 |         return cpus_have_final_cap(ARM64_WORKAROUND_843419) &&
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/module.h: In function 'find_section':
>> arch/arm64/include/asm/module.h:62:21: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
      62 |                 if (strcmp(name, secstrs + s->sh_name) == 0)
         |                     ^~~~~~
   arch/arm64/include/asm/module.h:9:1: note: include '<string.h>' or provide a declaration of 'strcmp'
       8 | #include <asm-generic/module.h>
     +++ |+#include <string.h>
       9 | 
   In file included from arch/arm64/include/asm/processor.h:40,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from ../../../drivers/nvdimm/namespace_devs.c:7:
   arch/arm64/include/asm/cpufeature.h: At top level:
>> arch/arm64/include/asm/cpufeature.h:519:29: error: conflicting types for 'cpus_have_final_cap'; have 'bool(int)' {aka '_Bool(int)'}
     519 | static __always_inline bool cpus_have_final_cap(int num)
         |                             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/module.h:48:16: note: previous implicit declaration of 'cpus_have_final_cap' with type 'int()'
      48 |         return cpus_have_final_cap(ARM64_WORKAROUND_843419) &&
         |                ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:28,
                    from libnvdimm_test.c:4:
   arch/arm64/include/asm/module.h: In function 'is_forbidden_offset_for_adrp':
>> arch/arm64/include/asm/module.h:48:16: error: implicit declaration of function 'cpus_have_final_cap' [-Wimplicit-function-declaration]
      48 |         return cpus_have_final_cap(ARM64_WORKAROUND_843419) &&
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/module.h: In function 'find_section':
>> arch/arm64/include/asm/module.h:62:21: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
      62 |                 if (strcmp(name, secstrs + s->sh_name) == 0)
         |                     ^~~~~~
   arch/arm64/include/asm/module.h:9:1: note: include '<string.h>' or provide a declaration of 'strcmp'
       8 | #include <asm-generic/module.h>
     +++ |+#include <string.h>
       9 | 


vim +/cpus_have_final_cap +48 arch/arm64/include/asm/module.h

7e8b9c1d2e2f5f Ard Biesheuvel 2017-11-20  45  
bdb85cd1d20669 Ard Biesheuvel 2018-11-22  46  static inline bool is_forbidden_offset_for_adrp(void *place)
7e8b9c1d2e2f5f Ard Biesheuvel 2017-11-20  47  {
0a285dfe875d52 Mark Rutland   2023-10-16 @48  	return cpus_have_final_cap(ARM64_WORKAROUND_843419) &&
bdb85cd1d20669 Ard Biesheuvel 2018-11-22  49  	       ((u64)place & 0xfff) >= 0xff8;
7e8b9c1d2e2f5f Ard Biesheuvel 2017-11-20  50  }
7e8b9c1d2e2f5f Ard Biesheuvel 2017-11-20  51  
bdb85cd1d20669 Ard Biesheuvel 2018-11-22  52  struct plt_entry get_plt_entry(u64 dst, void *pc);
7e8b9c1d2e2f5f Ard Biesheuvel 2017-11-20  53  
b3adc3844e1ded Joey Gouly     2022-08-30  54  static inline const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
b3adc3844e1ded Joey Gouly     2022-08-30  55  				    const Elf_Shdr *sechdrs,
b3adc3844e1ded Joey Gouly     2022-08-30  56  				    const char *name)
5a3ae7b314a225 Ard Biesheuvel 2019-04-07  57  {
b3adc3844e1ded Joey Gouly     2022-08-30  58  	const Elf_Shdr *s, *se;
b3adc3844e1ded Joey Gouly     2022-08-30  59  	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
b3adc3844e1ded Joey Gouly     2022-08-30  60  
b3adc3844e1ded Joey Gouly     2022-08-30  61  	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
b3adc3844e1ded Joey Gouly     2022-08-30 @62  		if (strcmp(name, secstrs + s->sh_name) == 0)
b3adc3844e1ded Joey Gouly     2022-08-30  63  			return s;
b3adc3844e1ded Joey Gouly     2022-08-30  64  	}
b3adc3844e1ded Joey Gouly     2022-08-30  65  
b3adc3844e1ded Joey Gouly     2022-08-30  66  	return NULL;
5a3ae7b314a225 Ard Biesheuvel 2019-04-07  67  }
5a3ae7b314a225 Ard Biesheuvel 2019-04-07  68  

:::::: The code at line 48 was first introduced by commit
:::::: 0a285dfe875d5206da10c3d00564727f9482a9dd arm64: Avoid cpus_have_const_cap() for ARM64_WORKAROUND_843419

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
