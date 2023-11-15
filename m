Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBA1364BC
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 18:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jE4Po0HL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700073537; x=1731609537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3hiAl4BGF/dFOVsP+Sxtuc1PwMomutAqSZ3wXL1sAbs=;
  b=jE4Po0HL3nc1oyTN9zOo5Feq3SG4QQrGs8hMaCmNDMdMtLXcCthKz3MU
   NVKuOo3B518d/0pGscEjK788pR3ZjiIFj6rH9BQxuNvJjBOaiuWahQ+V8
   WEGSEd2A/kHAdfDpFtYS3MLQDaj3pduqi8pnxOMsoTAU4tqXSxBIIKDym
   3wfNgxP4fe80jHaYqiW7b1qp4V0pN6YhMiANZ03EawWLSN4rvZTJoRe6a
   TZe3CP+7ov2TjJTpGNJaHfQjI2hxsB/PkhIi0Ly4CKiJrCQSA2shpAvB9
   Ygtf7W4aSWuW8OlRo8sJOPNvQmEWCTYL4aIA3XxIw/z5hFQlt507jNP8D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477149953"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="477149953"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 10:38:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765051773"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="765051773"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Nov 2023 10:38:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Kmq-0000iK-29;
	Wed, 15 Nov 2023 18:38:52 +0000
Date: Thu, 16 Nov 2023 02:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension
Message-ID: <202311160224.50mmKrMV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "fbc 18de17edb09f3b79853cda40d1a659832e8040ee and parent b85ea95d086471afb4ad062012a4d73cd328fa86 have different kconfig"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>
References: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>
TO: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Anup Patel <apatel@ventanamicro.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Mayuresh Chitale <mchitale@ventanamicro.com>
CC: Samuel Holland <samuel.holland@sifive.com>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Hi Heinrich,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heinrich-Schuchardt/tty-serial-RISC-V-SBI-earlycon-via-DBCN-extension/20231115-213355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231115133127.107575-1-heinrich.schuchardt%40canonical.com
patch subject: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231116/202311160224.50mmKrMV-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160224.50mmKrMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160224.50mmKrMV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/earlycon-riscv-sbi.c:11:10: fatal error: asm/sbi.h: No such file or directory
      11 | #include <asm/sbi.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +11 drivers/tty/serial/earlycon-riscv-sbi.c

27de1f541f1f91 Anup Patel 2018-12-04 @11  #include <asm/sbi.h>
27de1f541f1f91 Anup Patel 2018-12-04  12  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
