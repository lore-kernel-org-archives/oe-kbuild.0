Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A2C125AC
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Aug 2024 02:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723515242; cv=none; b=qDg93Ga/psdvm+iZVIKHUTnm6qdNP2yIOsBkTC4d7bX9bICUBNgadeoD2Z1Lhe9TOA3hs4+Aryr/MtCeM0Bv6LPX268RHTvibyjAEIdcLNRP0r2CdgPc9Qtg/HFjKcjUduwChsKzdsRPoxWkTrFx4vgNdt1wnx3P81gl7dHhZLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723515242; c=relaxed/simple;
	bh=+LjxXYUyLPdDQdbX3jHA1ffPAerEjaBEIrqbSDBMi8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O1vHdq2tiUkLWLZq2h5Ty23+gCtGlzfYmRiO9oS2Qr1c3z6pFIQUewrKBQJG6TEPLMvku7BmSaM/9EN3nM3h0Ax5YnBriOElfb3fkaKlvsuRqgntkO+H1Bpj0Klpe+U/k+9R3GVG5byGGpqSCbnPHugPAZbO+Z//Y4WnHJvkt/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKyyCsLh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKyyCsLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723515241; x=1755051241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+LjxXYUyLPdDQdbX3jHA1ffPAerEjaBEIrqbSDBMi8w=;
  b=jKyyCsLhaa5fQ25ujwpN8SE0NIxZWCShxseECEgiiasn1JaKLXxa85Ip
   v8kYOYXhU//TESQ1Y7akKJywBgd3HdLdz6DBvlGI9lqMeP1sATMuBFh65
   S4oQc9qKHeHa++CyE/vwZ3+icACsQnaxH6J2w0Yp2aTDMmTMSukSwt/LQ
   7ri9w1b8GI5g44s+fqIH5R4MCfxQhGUT/pjaMQcGSew5a0bW250nsWER3
   NRpu1D2vCtA2NCwJppwLVRHYGcJRsgOY69xQoqRgkxKw+0rRpq9N7qUc8
   CkUhXihRDZMQYDq3lhkZwLGEsf9V8FDkAm4Ucbr195Hu4vKvtMq9Hmxgo
   A==;
X-CSE-ConnectionGUID: ImsImpABQ2enGLspFiwjKg==
X-CSE-MsgGUID: YIaUr6o+RLKqsYiFDNs2Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21787627"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="21787627"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 19:14:00 -0700
X-CSE-ConnectionGUID: mmSNQEuKQ7ynXc5HQvO9Pw==
X-CSE-MsgGUID: sCFfZh9DRViIY8RPTwwGYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="58793338"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Aug 2024 19:13:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdh2p-00001c-30;
	Tue, 13 Aug 2024 02:13:55 +0000
Date: Tue, 13 Aug 2024 10:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/hugetlb.o: warning: objtool: remove_hugetlb_folio+0x4c:
 unreachable instruction
Message-ID: <202408131022.GlMvGe0A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yu Zhao <yuzhao@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d74da846046aeec9333e802f5918bd3261fb5509
commit: bd225530a4c717714722c3731442b78954c765b3 mm/hugetlb_vmemmap: fix race with speculative PFN walkers
date:   6 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-r131-20240809 (https://download.01.org/0day-ci/archive/20240813/202408131022.GlMvGe0A-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240813/202408131022.GlMvGe0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408131022.GlMvGe0A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.o: warning: objtool: set_vma_resv_flags+0x1c: unreachable instruction
   mm/hugetlb.o: warning: objtool: set_vma_resv_map+0x1c: unreachable instruction
   mm/hugetlb.o: warning: objtool: __prep_compound_gigantic_folio+0xf0: unreachable instruction
   mm/hugetlb.o: warning: objtool: hugetlb_try_dup_anon_rmap+0x80: unreachable instruction
>> mm/hugetlb.o: warning: objtool: remove_hugetlb_folio+0x4c: unreachable instruction
   mm/hugetlb.o: warning: objtool: allocate_file_region_entries+0x68: unreachable instruction
   mm/hugetlb.o: warning: objtool: hugetlb_resv_map_add+0x40: unreachable instruction
   mm/hugetlb.o: warning: objtool: __vma_reservation_common+0xa8: unreachable instruction
   mm/hugetlb.o: warning: objtool: free_huge_folio+0x5c: unreachable instruction
   mm/hugetlb.o: warning: objtool: __unmap_hugepage_range+0x64: unreachable instruction
   mm/hugetlb.o: warning: objtool: hugetlb_wp+0x140: unreachable instruction
   mm/hugetlb.o: warning: objtool: hugetlb_change_protection+0x58: unreachable instruction
   mm/hugetlb.o: warning: objtool: gather_bootmem_prealloc_parallel+0xc8: unreachable instruction
   mm/hugetlb.o: warning: objtool: hugetlb_add_hstate+0x4c: unreachable instruction


objdump-func vmlinux.o remove_hugetlb_folio:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
