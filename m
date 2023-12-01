Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4351C6A9
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IX14OA1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701424715; x=1732960715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ep3AuTLaNPQRYVMT/mVt4Rxi9xfdaLGpSwk+n3aT+1g=;
  b=IX14OA1UqG8s64gT5QpMJBtfynuS1oyscWMsoligN5Qj61tJFufwLBNv
   pbT/taiN8KKpFd+6snQ/YAjNGWMpSGeYYAwfcM5h/5kqKCrahR7X4hf7X
   fSnQokIS0xq+FOd+LiayQp8aCnveoOAFcxrtlX0t595qBUuNdJmUtyIEh
   kVhxBPqJ36oz0TC6z0lyRjjAdZNVQ2f/jL0Yqx0r8tX6fbH4EfLU6+uEY
   1hxhlFWqjkkfvn+3hIMmXQAZBkrpWEEB2/V4jwyCs48pFqLS5wvbNcqh+
   0NBTyGiWMfSphbkmYtmcnhGr1SsCbnYpWIWVsu41i74E9q0oi89CLT/EY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="6755408"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="6755408"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 01:58:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="745948630"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="745948630"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 01 Dec 2023 01:58:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r90I1-0003Si-2e;
	Fri, 01 Dec 2023 09:58:29 +0000
Date: Fri, 1 Dec 2023 17:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] riscv: Avoid code duplication with generic bitops
 implementation
Message-ID: <202312011721.RxlcXd9E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231112094421.4014931-1-xiao.w.wang@intel.com>
References: <20231112094421.4014931-1-xiao.w.wang@intel.com>
TO: Xiao Wang <xiao.w.wang@intel.com>
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: arnd@arndb.de
CC: geert@linux-m68k.org
CC: haicheng.li@intel.com
CC: linux-arch@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Xiao Wang <xiao.w.wang@intel.com>

Hi Xiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc3 next-20231201]
[cannot apply to arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Wang/riscv-Avoid-code-duplication-with-generic-bitops-implementation/20231112-173655
base:   linus/master
patch link:    https://lore.kernel.org/r/20231112094421.4014931-1-xiao.w.wang%40intel.com
patch subject: [PATCH] riscv: Avoid code duplication with generic bitops implementation
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011721.RxlcXd9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312011721.RxlcXd9E-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/__fls.h is included more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/fls.h is included more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/__ffs.h is included more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/ffs.h is included more than once.

vim +20 arch/riscv/include/asm/bitops.h

    17	
    18	#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
    19	#include <asm-generic/bitops/__ffs.h>
  > 20	#include <asm-generic/bitops/__fls.h>
    21	#include <asm-generic/bitops/ffs.h>
    22	#include <asm-generic/bitops/fls.h>
    23	
    24	#else
    25	#define __HAVE_ARCH___FFS
    26	#define __HAVE_ARCH___FLS
    27	#define __HAVE_ARCH_FFS
    28	#define __HAVE_ARCH_FLS
    29	
    30	#include <asm-generic/bitops/__ffs.h>
  > 31	#include <asm-generic/bitops/__fls.h>
    32	#include <asm-generic/bitops/ffs.h>
    33	#include <asm-generic/bitops/fls.h>
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
