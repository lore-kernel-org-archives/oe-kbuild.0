Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE311118B
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jan 2024 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H87ju1ol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704657110; x=1736193110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3yyB6Xgjttz2iuee+cneoaCmrJLjrpF5EjPFLU09Qw=;
  b=H87ju1ol/GWDhvRMxIFn97sHlK0t5D0efKo+wJpHwIUG0QSJlXw4pxkt
   iEwip+FgPJX1JPOR0R8EbgbG87TZ0JxA01pPsz0hmR2EcehV/Lk++QG6j
   ZeEYiXb10kgtX24bcUk1P2KVhG1E9bHZQWDd/ELsw1QDfeyllIfzDxyax
   q6+lo7mWXG89/kvmUqfedeGsvgZcOdXg1ScEagLdxP69kq7cd7X1tDv4G
   5jzzfBAolu3j9yt5MwaerjfqFsqRQomagzdcdvadpU7KM5zKmUmirGx3/
   DVqKt34dXaGWjA8i2uDXltSU76ZfA0eWd/2gYnzUsiHZzfIUoPJwSLLPJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="394923393"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="394923393"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 11:51:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="900171762"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="900171762"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 07 Jan 2024 11:51:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMZBS-00045A-3B;
	Sun, 07 Jan 2024 19:51:46 +0000
Date: Mon, 8 Jan 2024 03:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] riscv: Optimize crc32 with Zbc extension
Message-ID: <202401080300.YTHS2GPo-lkp@intel.com>
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
In-Reply-To: <20240105080830.3738117-1-xiao.w.wang@intel.com>
References: <20240105080830.3738117-1-xiao.w.wang@intel.com>
TO: Xiao Wang <xiao.w.wang@intel.com>
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
CC: conor.dooley@microchip.com
CC: ajones@ventanamicro.com
CC: heiko@sntech.de
CC: haicheng.li@intel.com
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Xiao Wang <xiao.w.wang@intel.com>

Hi Xiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc8 next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Wang/riscv-Optimize-crc32-with-Zbc-extension/20240105-161053
base:   linus/master
patch link:    https://lore.kernel.org/r/20240105080830.3738117-1-xiao.w.wang%40intel.com
patch subject: [PATCH] riscv: Optimize crc32 with Zbc extension
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r052-20240107 (https://download.01.org/0day-ci/archive/20240108/202401080300.YTHS2GPo-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401080300.YTHS2GPo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/lib/crc32.c:20:23-24: WARNING opportunity for min()
>> arch/riscv/lib/crc32.c:20:23-24: WARNING opportunity for min()

vim +20 arch/riscv/lib/crc32.c

5ae5016aa875cc Xiao Wang 2024-01-05  19  
5ae5016aa875cc Xiao Wang 2024-01-05 @20  #define MIN(a, b) ((a) < (b) ? (a) : (b))
5ae5016aa875cc Xiao Wang 2024-01-05  21  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
