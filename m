Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B6B338922
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765869242; cv=none; b=Mbw3dDE1mYyoouiTfdtQFVhS6khfSfp+H4e0qm0driQY62MIAgup8ZcXQ83qAxY1WYnAm5BnlAJk57qZGzPfguJufZCPk7U4LjwNz1ulkzf85ooRJCtMNplRNrAOU+gv2Duz3jeoJBLXfvD+NkZvZdhwD2vcWqhwPts3doMT4FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765869242; c=relaxed/simple;
	bh=Zj1D/OQkaD6J09DaYToEC7Q/uUS/Me5SSeShGeygt38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8a3l+ZI3L2Bx3oaEQUNCyrH7kC0zfOdUR7kkx5B1pSrzi4ez9A524amXheBXzaFN/MbSL8yQJjgOeTQUvv+JM1tOkK5GsTYUGwjz2vPKzv11QfpwjoLjURWkxxVJF4ShwEFOKiX8uHnG6RfamrB672JTGefwfBEvtzachZq2ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5v7Nq0F; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5v7Nq0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765869240; x=1797405240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zj1D/OQkaD6J09DaYToEC7Q/uUS/Me5SSeShGeygt38=;
  b=j5v7Nq0FJeDyq10PkeDGQmHrLVAH53dd0qKwDI1Ll06PKdGMgfN1hhj1
   kcy4UzdiZvciT0c31AfFrUFWrR68kEXKVSGC3KUAeGb7eLdVdNieb3Piw
   cu00V3yOBdXKIAuE/FQkb8mouTnvN3vvm8gUsOWmP4xLAYF+00+eRXkDl
   GUaxYrxFGKhwOmwCt43EKXMUfktAZHf+dmqzkc5ZO359g/yGkQRhQt+6V
   tIV3ctr2cqTGKeSyXeRV/vbOE3fcar3oRfBMVPsgEXCYGQ6sdFgFcMSUO
   UnP2jaT3XE2qS4+JitAtPFSc8dI3CN9YNzlzi/ZINWaLgw0hA4w+FSIrv
   A==;
X-CSE-ConnectionGUID: nsSUMFSxR3W5svTAIZAeGw==
X-CSE-MsgGUID: 8wOUfhfNSO6DUYzrAjDDcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67815830"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67815830"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 23:13:59 -0800
X-CSE-ConnectionGUID: p2IK0pvKSji9JinTRjXYcw==
X-CSE-MsgGUID: 4qdcPp9oTJaSHEruLaZYzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="203046726"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Dec 2025 23:13:57 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVPFq-000000001ID-1A06;
	Tue, 16 Dec 2025 07:13:54 +0000
Date: Tue, 16 Dec 2025 15:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
Message-ID: <202512161410.yLavtxHG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/tests/lazy_mmu_mode_kunit.c:70:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251215150323.2218608-15-kevin.brodsky@arm.com>
References: <20251215150323.2218608-15-kevin.brodsky@arm.com>
TO: Kevin Brodsky <kevin.brodsky@arm.com>
TO: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: Kevin Brodsky <kevin.brodsky@arm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Andreas Larsson <andreas@gaisler.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Anshuman Khandual <anshuman.khandual@arm.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: David Hildenbrand <david@redhat.com>
CC: David Woodhouse <dwmw2@infradead.org>
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: Ingo Molnar <mingo@redhat.com>
CC: Jann Horn <jannh@google.com>
CC: Juergen Gross <jgross@suse.com>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Michal Hocko <mhocko@suse.com>
CC: Mike Rapoport <rppt@kernel.org>
CC: Nicholas Piggin <npiggin@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Suren Baghdasaryan <surenb@google.com>

Hi Kevin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Brodsky/powerpc-64s-Do-not-re-activate-batched-TLB-flush/20251215-230757
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251215150323.2218608-15-kevin.brodsky%40arm.com
patch subject: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: sparc64-randconfig-r113-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161410.yLavtxHG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161410.yLavtxHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512161410.yLavtxHG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/tests/lazy_mmu_mode_kunit.c:70:1: sparse: sparse: bad integer constant expression
   mm/tests/lazy_mmu_mode_kunit.c:70:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   mm/tests/lazy_mmu_mode_kunit.c:71:1: sparse: sparse: bad integer constant expression
   mm/tests/lazy_mmu_mode_kunit.c:71:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   mm/tests/lazy_mmu_mode_kunit.c:71:1: sparse: sparse: bad integer constant expression
   mm/tests/lazy_mmu_mode_kunit.c:71:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +70 mm/tests/lazy_mmu_mode_kunit.c

51e6de7443f69e Kevin Brodsky 2025-12-15  69  
51e6de7443f69e Kevin Brodsky 2025-12-15 @70  MODULE_DESCRIPTION("Tests for the lazy MMU mode");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
