Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B3163D
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 04:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678336211; x=1709872211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nyUbugMFVkDnDrlOscHXqvjChRs5UVQe8hvagdAOZME=;
  b=Zou7npqikOvhji7Vifq1eYPNHAs7dohau78jOJfkooh7WCoCwJ28QDta
   DYffKNOujLvi4FBcPFVTnCvqBoSZQySBDmdyHzjkRkux6ZFvdEAVBL8oF
   rnl7FGLKyMagKH0362ueMKBxaf7oqIt3Fyo8F5sGoEs3v+41z8wGvJzE8
   WYbBndA1I6YiXGfVnAWQyzM7LCg0iJhvX8YAfVz0m8G+3nNXwNZusSVNC
   PejI3i3uDyxZQvxpcxM2NWdJY8+3qLHsjVXSW6HcUUUVDUxLDLBsUxzal
   A/E6Sk4/XoKTiQh13gaO7OpqiV6pRILbqoN4fdeh6iUDQZebYuEtKEJVJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="422621365"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="422621365"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 20:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670588644"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="670588644"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 20:30:09 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa7ur-0002dp-0m;
	Thu, 09 Mar 2023 04:30:09 +0000
Date: Thu, 9 Mar 2023 12:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can
 be declared as pointer to const [constParameter]
Message-ID: <202303091248.PQ683Wew-lkp@intel.com>
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
head:   6a98c9cae232800c319ed69e1063480d31430887
commit: ff689fd21cb13098305bae3f8d0c0065df2e2fc1 riscv: add RISC-V Svpbmt extension support
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ff689fd21cb13098305bae3f8d0c0065df2e2fc1
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303091248.PQ683Wew-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can be declared as pointer to const [constParameter]
           struct alt_entry *end,
                             ^
>> arch/riscv/kernel/patch.c:68:8: warning: Redundant initialization for 'waddr'. The initialized value is overwritten before it is read. [redundantInitialization]
    waddr = patch_map(addr, FIX_TEXT_POKE0);
          ^
   arch/riscv/kernel/patch.c:54:14: note: waddr is initialized
    void *waddr = addr;
                ^
   arch/riscv/kernel/patch.c:68:8: note: waddr is overwritten
    waddr = patch_map(addr, FIX_TEXT_POKE0);
          ^

vim +/end +288 arch/riscv/kernel/cpufeature.c

ff689fd21cb130 Heiko Stuebner 2022-05-11  286  
ff689fd21cb130 Heiko Stuebner 2022-05-11  287  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
ff689fd21cb130 Heiko Stuebner 2022-05-11 @288  						  struct alt_entry *end,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
