Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8362117
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Feb 2023 22:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676759778; x=1708295778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MHmhLLER3XYdHzX0heFlGXKHE0Kzl6Xo8x6/7Y4wB5E=;
  b=cNkOc1o/9o970etsvm6l/Jk5K3Dqb/oEe4lKECHJbiA3rYhZB86Rp/y+
   D+lcDOqy708B7/GFPl7Ixu4L6gPgQl5lnUTM0+fZDHJtfRiNtO6Hg+rjU
   qiWj3HCy6TSZjdIAhTJKjxwkuMgeDoV6i4uDbonekbF2fjHhcEHFw3n3g
   CYIQv63ZNPosPXNshvmQslxQbk5caAQKGo5imvAUYYVTKTHKoanr0uI3c
   r3JawNPrGMVM8UvrLwoKQIipbE8PNjsXtnEkc5EZJVTNQ5YgQDrYBqpKz
   C0OnezKd4FJtBOS6rxjMwbuwFdrPGg7uXxe02iZnzsy4+9jJW6cbk/k+x
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="312573485"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="312573485"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 14:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="664250595"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="664250595"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Feb 2023 14:36:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTVoW-000Cop-0B;
	Sat, 18 Feb 2023 22:36:16 +0000
Date: Sun, 19 Feb 2023 06:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/include/asm/insn-def.h: asm/gpr-num.h is included more
 than once.
Message-ID: <202302190613.9oETDTPI-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Andrew Jones <ajones@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5e725d112e1a54c2611d5dffd124a79415d0f0de
commit: 5ac43ab2e3fe4e5d48ef313a99d0591021c3bbdd riscv: Introduce support for defining instructions
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302190613.9oETDTPI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/include/asm/insn-def.h: asm/gpr-num.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
