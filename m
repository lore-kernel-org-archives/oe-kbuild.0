Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFFFA23
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Nov 2022 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667465836; x=1699001836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I957PlbqaQddO2cX5cQoFDQd1bOC0cJnjRHJ/lV81zQ=;
  b=boLf/pFW9YGAn8t6/F469ShLAJamQW4b8JJBnDtFPnNnQel5OJYMyCQ+
   py88LuEs4DnVQC2S9UNi0PWKbt1or9jysWiOpJpNDmuETHFX3T48OZlMk
   aHsIjDC+ARoTdJiBxJJOPpEQPBZ2f/nfemxuf4O3JOlpGyd2+1QTTczfm
   WF8qXyzjYiG6RNe7sVwerCBWRIyj0bLQc/8B8BuoUykPsZaFqbrMqxEa7
   0ALl/1sqOW3neTQ0XrWTVDaELEBHjW3RBbq0wGgj/gc0QBEpJp8eXXDin
   ZL8YJ6rS1ZJ+89BXctW+r4lB74DFP++OGV7I1W0vQnDGGPL0034Q0ARE1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="289340863"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="289340863"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 01:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="665889232"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="665889232"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Nov 2022 01:56:53 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqW1s-000FjM-2J;
	Thu, 03 Nov 2022 08:56:52 +0000
Date: Thu, 3 Nov 2022 16:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can
 be declared as pointer to const [constParameter]
Message-ID: <202211031642.nHoAL5TU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heiko Stuebner <heiko@sntech.de>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Wei Fu <wefu@redhat.com>
CC: Liu Shaohua <liush@allwinnertech.com>
CC: Guo Ren <guoren@kernel.org>
CC: Philipp Tomsich <philipp.tomsich@vrull.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8e5423e991e8cd0988d0c4a3f4ac4ca1af7d148a
commit: ff689fd21cb13098305bae3f8d0c0065df2e2fc1 riscv: add RISC-V Svpbmt extension support
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ff689fd21cb13098305bae3f8d0c0065df2e2fc1
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can be declared as pointer to const [constParameter]
           struct alt_entry *end,
                             ^

vim +/end +288 arch/riscv/kernel/cpufeature.c

ff689fd21cb130 Heiko Stuebner 2022-05-11  286  
ff689fd21cb130 Heiko Stuebner 2022-05-11  287  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
ff689fd21cb130 Heiko Stuebner 2022-05-11 @288  						  struct alt_entry *end,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
