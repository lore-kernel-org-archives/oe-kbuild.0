Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41027E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 01:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m417rX+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700099966; x=1731635966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jCIAKvYH/OfXo1RIaKw7XImiK/bWNaVHbOprvujHAas=;
  b=m417rX+52cBl8OyCahdvlWVdBliS8klDSlxIG3D6ptrksarm4K/8V5Yk
   Ni9Zu+MNdHTuvp4gLSMjW4+sGtKtLfNbY4fwKehkqOAv89aRGjQRzlPXB
   ZTKNnoTrYlgxtnGgSRwUDGpONctMdCd74MK0d/p/bueE7JbfDZgnRQ+Wh
   KWWpwGl2Ht2ucKVF5RSf4RP9YRagl1He8/KRv6dT7uo87j886IHCgdv/1
   lADXkSrtExLWwk1LSep/t8dkJ/lug462nMesC4zXYhH3AjatvPGb+S2Jm
   76ofoDAAwe6PO5VAqSlm59vJN2VBk6ACxeYb5Ocd1YCSR1wphZru6XMvE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="393845253"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="393845253"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:59:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758682486"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="758682486"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Nov 2023 17:59:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Rf8-00016h-2Y;
	Thu, 16 Nov 2023 01:59:22 +0000
Date: Thu, 16 Nov 2023 09:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/tty/serial/uartlite.c:79: warning: Function parameter or
 member 'reg_ops' not described in 'uartlite_data'
Message-ID: <202311160932.xnCx3dv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sean Anderson <sean.anderson@seco.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: ea017f5853e9a6a11cfa9bdc61ba823a1ed54ee8 tty: serial: uartlite: Prevent changing fixed parameters
date:   2 years, 2 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 2 years, 2 months ago
config: x86_64-randconfig-a001-20230604 (https://download.01.org/0day-ci/archive/20231116/202311160932.xnCx3dv2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160932.xnCx3dv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160932.xnCx3dv2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/uartlite.c:79: warning: Function parameter or member 'reg_ops' not described in 'uartlite_data'
>> drivers/tty/serial/uartlite.c:79: warning: Function parameter or member 'clk' not described in 'uartlite_data'
>> drivers/tty/serial/uartlite.c:79: warning: Function parameter or member 'baud' not described in 'uartlite_data'
>> drivers/tty/serial/uartlite.c:79: warning: Function parameter or member 'cflags' not described in 'uartlite_data'


vim +79 drivers/tty/serial/uartlite.c

deeb33e8fdd8347 Shubhrajyoti Datta 2018-08-06  66  
ea017f5853e9a6a Sean Anderson      2021-08-26  67  /**
ea017f5853e9a6a Sean Anderson      2021-08-26  68   * struct uartlite_data: Driver private data
ea017f5853e9a6a Sean Anderson      2021-08-26  69   * reg_ops: Functions to read/write registers
ea017f5853e9a6a Sean Anderson      2021-08-26  70   * clk: Our parent clock, if present
ea017f5853e9a6a Sean Anderson      2021-08-26  71   * baud: The baud rate configured when this device was synthesized
ea017f5853e9a6a Sean Anderson      2021-08-26  72   * cflags: The cflags for parity and data bits
ea017f5853e9a6a Sean Anderson      2021-08-26  73   */
da7bf20e7758042 Shubhrajyoti Datta 2018-07-21  74  struct uartlite_data {
da7bf20e7758042 Shubhrajyoti Datta 2018-07-21  75  	const struct uartlite_reg_ops *reg_ops;
14288befeb572b4 Shubhrajyoti Datta 2018-07-21  76  	struct clk *clk;
ea017f5853e9a6a Sean Anderson      2021-08-26  77  	unsigned int baud;
ea017f5853e9a6a Sean Anderson      2021-08-26  78  	tcflag_t cflags;
da7bf20e7758042 Shubhrajyoti Datta 2018-07-21 @79  };
da7bf20e7758042 Shubhrajyoti Datta 2018-07-21  80  

:::::: The code at line 79 was first introduced by commit
:::::: da7bf20e7758042eb3931ff68fc96bdfaf94d881 tty: serial: uartlite: Add structure for private data

:::::: TO: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
