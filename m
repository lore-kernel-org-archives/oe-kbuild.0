Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668C23AA
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 05:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667800473; x=1699336473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=++sJU+RSk2m43hXxGDTov3gOn1piD3KAjm9tkXO83lI=;
  b=MRNY90jjQvTu3HCh5TP7AvIwzD1mQdl8lQCoOTbiYbznWGiXquJMzNru
   bBZit8TKqvvAP5ZI6mx/zRGInsICxJj5sTuwdXAW62GOEGsx45HLLTT6n
   /0/j/TgYsTjDYaQnxRWDEDPiC+HYP8H/yMnbr8SzMP0xWOMVnHZRsKHUz
   VaisvleWhtfl0XBREeqGqAYDIqA1qjV5HDr+6sUZDSMfwxhQLe/rHUDEg
   j+XZVHLR39vN/xG4HEznIswdptcr+5Oku3mse7eribytHq1NYBOyp9Y8Y
   2k99OFU5duft9sBA2fohPosXkbUbfi4DbuJcJ6N+/zS//DNCEjqnPhJ+x
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="307956212"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="307956212"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2022 21:54:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="635778944"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="635778944"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Nov 2022 21:54:29 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1orv5Y-0000Nm-2y;
	Mon, 07 Nov 2022 05:54:28 +0000
Date: Mon, 7 Nov 2022 13:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can
 be declared as pointer to const [constParameter]
Message-ID: <202211071349.QTuQsOGn-lkp@intel.com>
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
:::::: branch date: 7 hours ago
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
