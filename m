Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE37FA
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Jul 2023 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689411597; x=1720947597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AxVllviO7rnO8PcU709NfPkyjkMeDZpkHx1PPp68ubc=;
  b=iuXNEsP3C0ZatGngr4UG52gyQTR8WG5sGS8zxw8/XgeX2MBUzFGot64C
   3G+vpuH5OGaCxiL6Q1k0FQRh8/PmHzeaA1Fggryay1q5c77eZVsnxQJMQ
   gTza26G7atd+vBpLyIraNAXZYLjYmazQv5yihki7FeGdCit+cwkSY8Yw/
   ivqHkghlxoMcYVDUvVy18W9wioSpsqKGq4R65Nx1/CZ2FQfN4ZYKCvOIq
   vrkyggZ/Mtcx3XcU/kSoUF6X0ImsmUnHTBWlbWc5Vsr19wIkxfaNNaSxv
   xjdr2tzmcPC9yyC//XtuxJWZv45RKzt7iiccVYKixXVhAsfHfcV2k45+1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="396460426"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; 
   d="scan'208";a="396460426"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 01:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="725964639"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; 
   d="scan'208";a="725964639"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jul 2023 01:59:56 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKb87-00084n-1a;
	Sat, 15 Jul 2023 08:59:55 +0000
Date: Sat, 15 Jul 2023 16:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/i40e/i40e_main.c:15650:2-8: ERROR:
 missing iounmap; ioremap on line 15497 and execution via conditional on line
 15649
Message-ID: <202307151617.bKVnM7PB-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Stafford Horne <shorne@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b6e6cc1f78c772e952495b7416c9ac9029f9390c
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: openrisc-randconfig-r054-20230713 (https://download.01.org/0day-ci/archive/20230715/202307151617.bKVnM7PB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151617.bKVnM7PB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307151617.bKVnM7PB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/i40e/i40e_main.c:15650:2-8: ERROR: missing iounmap; ioremap on line 15497 and execution via conditional on line 15649
--
>> drivers/net/ethernet/via/via-rhine.c:1822:33-35: WARNING opportunity for max()
--
>> drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3981:32-37: ERROR: invalid reference to the index variable of the iterator on line 3935

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
