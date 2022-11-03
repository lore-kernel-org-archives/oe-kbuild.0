Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5500B63A0
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Nov 2022 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667494956; x=1699030956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZr6h/PuFHc32znXWoiT3LFjAvh/AoKCcgLrLkl8+4g=;
  b=F0O6mbEU+Fg45fjdLxhwcxNr1rtBLv6Mb6Sk/tQMBAw0ttBEypWOfJvh
   8FlLa0c0afDmU6RQo9683ncErVun413LtJ9sDig3YQce6+TVnaUiK20YW
   CwSMv8/UCDt3G1+Iym/rcLS9q2LKnKJ3MSSytUu2uyPLUtrJsDp2o2Awb
   810ecEXUooJ1J+m4g7fXvT+tG6eUTfxtPV1r2zcN4dOhzhaMPXpqQkcRp
   ysl7+/m+Ua3uZRo0ZmyIWX6LdmFuzCJ/ysp7LQHTIdvzaH/K1EQOsUQIH
   y01R5ikPRofHhbKdSBad7T9ENvXDiCD1s0FRBtwVDCw+aquN2O78wEfTk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="297203681"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="297203681"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 10:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="724019031"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="724019031"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2022 10:02:24 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqdbk-000G7L-0I;
	Thu, 03 Nov 2022 17:02:24 +0000
Date: Fri, 4 Nov 2022 01:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/errata/thead/errata.c:55:90: warning: Parameter 'end' can
 be declared as pointer to const [constParameter]
Message-ID: <202211040104.GYQhEOtn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/riscv/errata/thead/errata.c:55:90: warning: Parameter 'end' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heiko Stuebner <heiko@sntech.de>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8e5423e991e8cd0988d0c4a3f4ac4ca1af7d148a
commit: a35707c3d850dda0ceefb75b1b3bd191921d5765 riscv: add memory-type errata for T-Head
date:   6 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 6 months ago
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a35707c3d850dda0ceefb75b1b3bd191921d5765
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/errata/thead/errata.c:55:90: warning: Parameter 'end' can be declared as pointer to const [constParameter]
   void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
                                                                                            ^

vim +/end +55 arch/riscv/errata/thead/errata.c

a35707c3d850dd Heiko Stuebner 2022-05-11  54  
a35707c3d850dd Heiko Stuebner 2022-05-11 @55  void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
