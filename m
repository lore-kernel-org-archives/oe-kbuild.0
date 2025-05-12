Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAAD27511F
	for <oe-kbuild@lists.linux.dev>; Mon, 12 May 2025 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747079339; cv=none; b=Z6rn6o/FELw/ZN9fwI5BuZIIqm9has3jS4Sh0/8vN9h1Mx9DidKvPYREAJIKrQDmTS89cVHziQN3OTE5OaNhH21X7iwETY704DQO5/fp/Wu6BEyW58PG5vw4v+oJDsQBqIL+YcAyRUu0zgeVAjPk2VcEEN4zzFqxB5h4br4KPGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747079339; c=relaxed/simple;
	bh=ysndZpkLOcKSdOyXZTKYECN7U1Rn+Aducjylj2QYENI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xxyv7RSQkuIN1K6VVQFUw1mxwW+tv9XOO6AVCHtlG9JL+DNH1TxDf3lJDbalhgFXe47NIkcPUAZBqYZC2d1x6oy7V8YTpdBVBF6NoTUNb82nXRXRCCNJI647F0AF5kVVroUdie4s/SNC+AHDecQeFm+7tHsaQJs63MVu5dsxqf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qr9o1EbZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qr9o1EbZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747079338; x=1778615338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ysndZpkLOcKSdOyXZTKYECN7U1Rn+Aducjylj2QYENI=;
  b=Qr9o1EbZ+Y3aEpf7+zJZtYBLxSAlYiSyrExCVGYhSD9+nWpuB4TsJ452
   UY4GcY94HxdcZh9pFoQBoCcTIMcMa3XZWhAQQzXV1Frt/XraqeyLcpGBp
   lm2rUN7vGWaDdlF2wp8hOtrXvGAdN/M6fPRIM9EgnE3a6/8PJYViIB2bD
   7ZYqVHqm1m2aUTkL4n2G8LZYQxvuQRMnnVwzLJBJ6KxDRRvY4eH1PnC0J
   ck9nHf0moj17SFX3VhAhLN0orJS62iJgASoQaPkHn7SkLrvr5QhiyqpEM
   gwnv0blLtpOF6oXZHNifXabQwiaWxK01nGORm0ps9MJaiVmMIXoYNPEf4
   w==;
X-CSE-ConnectionGUID: GtEgXRcJRHqVuBek0SJBpQ==
X-CSE-MsgGUID: KmWQ8aWuQo+7kx+jD0pNqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49015862"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="49015862"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 12:48:53 -0700
X-CSE-ConnectionGUID: oTzApFsdRBijcE5V+JNGBQ==
X-CSE-MsgGUID: /nVg2MaET7al2HJE8FdqHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="137406452"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 May 2025 12:48:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEZ8r-000FM7-2q;
	Mon, 12 May 2025 19:48:49 +0000
Date: Tue, 13 May 2025 03:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/userfaultfd.o: warning: objtool:
 userfaultfd_register_range+0x164: unreachable instruction
Message-ID: <202505130358.CckKlCvr-lkp@intel.com>
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
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>

Hi Lorenzo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   627277ba7c2398dc4f95cc9be8222bb2d9477800
commit: a17c7d8fd2b097a422fc892b660e879e19c20214 userfaultfd: move core VMA manipulation logic to mm/userfaultfd.c
date:   8 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250513/202505130358.CckKlCvr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130358.CckKlCvr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505130358.CckKlCvr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/userfaultfd.c:8:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:299:34: warning: missing braces around initializer [-Wmissing-braces]
     299 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:556:16: note: in expansion of macro '__swp_entry_to_pmd'
     556 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   mm/userfaultfd.o: warning: objtool: mfill_atomic_copy+0x8c: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mfill_atomic_zeropage+0x84: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mfill_atomic_continue+0x88: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mfill_atomic_poison+0x84: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mwriteprotect_range+0xb0: unreachable instruction
>> mm/userfaultfd.o: warning: objtool: userfaultfd_register_range+0x164: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
