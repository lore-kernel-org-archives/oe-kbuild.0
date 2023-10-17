Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2A111CBA
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 06:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFoShith"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697525058; x=1729061058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k+0WUnC6O223ImbrIrPY5ECm5H+o6SZLMClaLhO97i8=;
  b=MFoShithuX7Dqtzs115qKF3OsdnCdTGVzOBvuDE1P0AuzedfCZy+b11Y
   Mrdei3dd7WaD4dAMM48oPk69QsmfO0DbWtXKsjxnSkG+sbedEGqRuF0Y8
   lZsAr4MWlLoyeW5OOiNKdSo7/jYY/oC4ZNX5JPfthUeiU7AcH5y+PmFSU
   y0YtyB1DvbWJs5+1diQM/g7SQkvj97XLaubT99FY1MBWSrnj2YsuTOArq
   iMipoJeeFGGcxY7EbJxVwTJdui4v+yvlFPUGrcHmwP89dIxSYaXGYzEfF
   G8OnDqkKtynVdhnVkGyFaSoKG27bbeOJeAvAoKkKn4cg9RcNkwADKJcNZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="4315293"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="4315293"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 23:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="732608319"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="732608319"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Oct 2023 23:44:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsdoM-0009Av-0m;
	Tue, 17 Oct 2023 06:44:14 +0000
Date: Tue, 17 Oct 2023 14:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 4/4] mm: abstract VMA extension and merge into
 vma_merge_extend() helper
Message-ID: <202310171446.xkvmdUBk-lkp@intel.com>
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
In-Reply-To: <1ed3d1ba0069104e1685298aa2baf980c38a85ff.1696795837.git.lstoakes@gmail.com>
References: <1ed3d1ba0069104e1685298aa2baf980c38a85ff.1696795837.git.lstoakes@gmail.com>
TO: Lorenzo Stoakes <lstoakes@gmail.com>
TO: linux-mm@kvack.org
TO: linux-kernel@vger.kernel.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
TO: Christian Brauner <brauner@kernel.org>
CC: "=Liam R . Howlett" <Liam.Howlett@oracle.com>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: linux-fsdevel@vger.kernel.org
CC: Lorenzo Stoakes <lstoakes@gmail.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[cannot apply to linus/master v6.6-rc6 next-20231016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-abstract-the-vma_merge-split_vma-pattern-for-mprotect-et-al/20231009-042425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/1ed3d1ba0069104e1685298aa2baf980c38a85ff.1696795837.git.lstoakes%40gmail.com
patch subject: [PATCH 4/4] mm: abstract VMA extension and merge into vma_merge_extend() helper
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-104-20231017 (https://download.01.org/0day-ci/archive/20231017/202310171446.xkvmdUBk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171446.xkvmdUBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310171446.xkvmdUBk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/internal.h:619:33-39: WARNING: Consider using vma_pages helper on vma
>> mm/mmap.c:2558:9-15: WARNING: Consider using vma_pages helper on vma

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
