Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F8715B2
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jun 2023 05:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687238156; x=1718774156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I7wRKjwEH7Tdt2UceuEbYmr7axdHrkZdicoKlg35nQc=;
  b=AqrFIJG56WUukcjqpNKVwH9tFxpQad4nuVw02X/YSBEsJXGquFSEFeJr
   dret6dlH0q/n7ZMF+u5Pr1R29XkDOjWjPuyRl2BwTy13LGmYW1Efquz3a
   7kP3vwkNWk5cFEzUsUIQYO4OYBoEUeuTbCGjprKxVx1MNv/GbwjuMxkS/
   6VtCqeesEpPnZs+/dWYP/S7Fu72YdEuMcnoXhtgOrjTqQMoMwjZCFJ/u5
   wYnUhKXMheccpYZCLU8UY19WyFGIU+JJr/7uvNQshfdjSmaglA1pBSsg0
   jRf6sWZdsLQRsEzZvDNp0/smqEPVpkGa61f+b00fAiTbbEPGfeA7drJDb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="339382285"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="339382285"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 22:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="783929241"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="783929241"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jun 2023 22:15:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBTib-0005Vk-2o;
	Tue, 20 Jun 2023 05:15:53 +0000
Date: Tue, 20 Jun 2023 13:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [joelgranados:jag/sysctl-testing-for-0day 25/35]
 arch/arm64/kernel/armv8_deprecated.c:56:18-24: WARNING use flexible-array
 member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202306201323.r35D29tX-lkp@intel.com>
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
TO: Joel Granados <j.granados@samsung.com>

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   2b49f8dc213b7691cb69000b5a3986f82eb064e8
commit: f002b0bcd6d09e496c1c8e39a430eafa5b96acdd [25/35] sysctl Remove end element in armv8_deprecated.c
:::::: branch date: 18 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-c044-20230618 (https://download.01.org/0day-ci/archive/20230620/202306201323.r35D29tX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201323.r35D29tX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306201323.r35D29tX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/armv8_deprecated.c:56:18-24: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +56 arch/arm64/kernel/armv8_deprecated.c

587064b610c703 Punit Agrawal 2014-11-18  43  
b4453cc8a7ebbd Mark Rutland  2022-10-19  44  struct insn_emulation {
587064b610c703 Punit Agrawal 2014-11-18  45  	const char			*name;
587064b610c703 Punit Agrawal 2014-11-18  46  	enum legacy_insn_status		status;
124c49b1b5d947 Mark Rutland  2022-10-19  47  	bool				(*try_emulate)(struct pt_regs *regs,
124c49b1b5d947 Mark Rutland  2022-10-19  48  						       u32 insn);
587064b610c703 Punit Agrawal 2014-11-18  49  	int				(*set_hw_mode)(bool enable);
124c49b1b5d947 Mark Rutland  2022-10-19  50  
587064b610c703 Punit Agrawal 2014-11-18  51  	int current_mode;
587064b610c703 Punit Agrawal 2014-11-18  52  	int min;
587064b610c703 Punit Agrawal 2014-11-18  53  	int max;
124c49b1b5d947 Mark Rutland  2022-10-19  54  
f002b0bcd6d09e Joel Granados 2023-06-19  55  	/* sysctl for this emulation */
f002b0bcd6d09e Joel Granados 2023-06-19 @56  	struct ctl_table sysctl[1];
587064b610c703 Punit Agrawal 2014-11-18  57  };
587064b610c703 Punit Agrawal 2014-11-18  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
