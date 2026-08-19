Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22599CA6F
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145013; cv=none; b=uGy5kcnZK+ubdk9cGchxj/Usn99WZZyvSyi6QQeJnzT7rXhiQRTIWEzmKC+t40Q9hZyGne+mRZaVOdYCiXmqxECopOiy+uKK5Su72zP/drVBaT5PMDYwCpZaLhte3/P9Bq+xwrFac2bf1G985bC8HtepFU8k8DYN8ZpcgjxSjKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145013; c=relaxed/simple;
	bh=YU3Go41QyBKTSgxiwk9D3uy+FvzA3nWpbBfcDdteoSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D4ggqIzambtCgyPRLsitf8KtVIqiBrIPzRVqrO/XrUyC6KLtJmgV0gOr9Be3nuLntHnBx+PsUf+eEBo09drXOL1Ugo37Dg5tDBw4857lDi1p1XfkjTFVBWiEx86EK8G+1rcUZ1HeGNpKUu2TPFg7YiQLxyAHdJVCjj8jv+jay2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcmJpAdT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcmJpAdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787145011; x=1818681011;
  h=date:from:to:cc:subject:message-id;
  bh=YU3Go41QyBKTSgxiwk9D3uy+FvzA3nWpbBfcDdteoSc=;
  b=hcmJpAdTzBCGh1I1BxdD3S9P00zzi9Gnwxr+PaOCIGrXEhvn3J1SR/nR
   F156dWZ721pwZfUGPH8fR7kdgvdimrcUvL1pRRdGbohjqFMZ8aVAH2FTW
   Zhq4OJZvYi2THsBiMS9p3TvEICvNVsuqZyWdZ1T0dORuzarXW9xQwHm/9
   dyy273nuCQnyA9scW2DnLEBJGsgzYHuqfTRM+J9rLf62OCPl1EUmzXCZy
   igoaValL5LXPzN+GwFmPJyr2+zvSEldNSYKfCcJcfuivXpr0vivrzXOU/
   yyxM7v8PaCZVMS0eMNFCXCXjTtMkr6BuYPh24SHJ1/BYPnCQgoQUT/p+/
   A==;
X-CSE-ConnectionGUID: GWASgA/mQyeJ0DiOuzu+ZQ==
X-CSE-MsgGUID: fe0AQ6xoQDiSlZFHHk6ZmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="99182634"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="99182634"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 06:10:11 -0700
X-CSE-ConnectionGUID: WQu4Fpo9SDaGb/h5t6pCVg==
X-CSE-MsgGUID: 2d1NGnMdSQedicxGuMhyww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="263796865"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Aug 2026 06:10:09 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwg3T-000000007NJ-3PIV;
	Wed, 19 Aug 2026 13:10:07 +0000
Date: Wed, 19 Aug 2026 15:09:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [modules:ppavlu-module-include 36/37]
 arch/s390/include/asm/module.h:49:21: error: implicit declaration of function
 'strcmp'
Message-ID: <202608191517.EjXHewtK-lkp@intel.com>
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
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260819/202608191517.EjXHewtK-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191517.EjXHewtK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608191517.EjXHewtK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:28,
                    from ../../../drivers/nvdimm/namespace_devs.c:6:
   arch/s390/include/asm/module.h: In function 'find_section':
>> arch/s390/include/asm/module.h:49:21: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
      49 |                 if (strcmp(name, secstrs + s->sh_name) == 0)
         |                     ^~~~~~
   arch/s390/include/asm/module.h:6:1: note: include '<string.h>' or provide a declaration of 'strcmp'
       5 | #include <asm-generic/module.h>
     +++ |+#include <string.h>
       6 | 


vim +/strcmp +49 arch/s390/include/asm/module.h

^1da177e4c3f41 include/asm-s390/module.h      Linus Torvalds 2005-04-16  40  
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  41  static inline const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  42  					   const Elf_Shdr *sechdrs,
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  43  					   const char *name)
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  44  {
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  45  	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  46  	const Elf_Shdr *s, *se;
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  47  
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  48  	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13 @49  		if (strcmp(name, secstrs + s->sh_name) == 0)
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  50  			return s;
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  51  	}
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  52  	return NULL;
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  53  }
a919390e919420 arch/s390/include/asm/module.h Heiko Carstens 2024-09-13  54  

:::::: The code at line 49 was first introduced by commit
:::::: a919390e9194209bac163ec8e19520bdb3fb738b s390/module: Provide find_section() helper

:::::: TO: Heiko Carstens <hca@linux.ibm.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
