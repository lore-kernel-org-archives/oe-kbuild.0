Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFCCD51D
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667831991; x=1699367991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCf8ud+ZUBB0eKxFpFCjOdBJTSKs8r2Lzy6QbUw94yM=;
  b=C7TZ5nd88l0fBxQXlLY8gPwIr/FEINeJUO9Q3cqLEY4l6E1sFt4ouPgQ
   nAZmaEFQnobdHAp6sUHFWi5y7BwxGWvQ3dlki1hyM1v0BCDB3s+69bF4O
   PR8eufvYfOJHsFD9t/sizq6x7AUasTp3O3Ofau0DAU8wfjMcU63yxYiiD
   53Yk2UGeJqUtc0xAVLcBFgMgRcYop/xBH5E5p6DztW8oLx5cWbWZvU8Oe
   7O7bIt31LwVV6yDY/H9ficvwj4wPzeRRyzriyDMpBsa/0I0JG/8X5Q2ry
   CDZO8wepjdiGCyxNjYnl+/6/KNupQhVD7OscP3jMwpdA/LA1s9dn4l3SQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="312189270"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="312189270"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 06:39:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="667190498"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="667190498"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Nov 2022 06:39:49 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1os3Hx-0000l6-0R;
	Mon, 07 Nov 2022 14:39:49 +0000
Date: Mon, 7 Nov 2022 22:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can
 be declared as pointer to const [constParameter]
Message-ID: <202211072244.EdVg7H3W-lkp@intel.com>
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
head:   f0c4d9fc9cc9462659728d168387191387e903cc
commit: ff689fd21cb13098305bae3f8d0c0065df2e2fc1 riscv: add RISC-V Svpbmt extension support
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ff689fd21cb13098305bae3f8d0c0065df2e2fc1
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btrtl.c:452:19: warning: Local variable 'skb' shadows outer variable [shadowVariable]
     struct sk_buff *skb;
                     ^
   drivers/bluetooth/btrtl.c:444:18: note: Shadowed declaration
    struct sk_buff *skb;
                    ^
   drivers/bluetooth/btrtl.c:452:19: note: Shadow variable
     struct sk_buff *skb;
                     ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can be declared as pointer to const [constParameter]
           struct alt_entry *end,
                             ^
>> drivers/bluetooth/btusb.c:2725:17: warning: Redundant condition: The condition 'status < 0' is redundant since 'status != 6' is sufficient. [redundantCondition]
        status < 0 || status != BTMTK_WMT_ON_PROGRESS,
                   ^

vim +/end +288 arch/riscv/kernel/cpufeature.c

ff689fd21cb130 Heiko Stuebner 2022-05-11  286  
ff689fd21cb130 Heiko Stuebner 2022-05-11  287  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
ff689fd21cb130 Heiko Stuebner 2022-05-11 @288  						  struct alt_entry *end,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
