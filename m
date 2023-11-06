Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A46EECA
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 03:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZ7CdCCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699240454; x=1730776454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TVbgJm0QyHn2o2sjYQnZJt6xiEaQA7qSRkD+/UALHMk=;
  b=WZ7CdCCAf7xVhZxtbe7+Fk2UZ3fOXwdcx7WRgoJ6h7Rs1uvkc62PkBaC
   dx41jVk/hWKILniFdOtGzZwrytw9cC/AWPr3GOtp1cJVn+dvHIF+/DtGC
   ITRs3WI2OAHimL3DcBokw3caXPj3i1mGFBdZiJ9fjzuYFZB8WI3vnVqZS
   +pqr/v9Jk0HSc9k/R4OxL9MhaNjh1o5oP/QJ3xbui7AQkOzbkuXKvNXSZ
   QKKg9viY8I65DD1UZ3e+/nskixeeQ5udsKO+NRbI45UKm3kveB9u+AUMf
   n8cbdlK4QYH3Yq6uPaLuIv0lNjik5UFUF1ntIIA6YruHyJHt6WuDmimvT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393097133"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="393097133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 19:14:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3314528"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2023 19:14:13 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzq42-00063q-29;
	Mon, 06 Nov 2023 03:14:10 +0000
Date: Mon, 6 Nov 2023 11:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/tty/serial/uartlite.c:79: warning: Function parameter or
 member 'reg_ops' not described in 'uartlite_data'
Message-ID: <202311061059.NUeUar9b-lkp@intel.com>
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
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: ea017f5853e9a6a11cfa9bdc61ba823a1ed54ee8 tty: serial: uartlite: Prevent changing fixed parameters
date:   2 years, 2 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 2 years, 2 months ago
config: i386-randconfig-004-20231101 (https://download.01.org/0day-ci/archive/20231106/202311061059.NUeUar9b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061059.NUeUar9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311061059.NUeUar9b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/uartlite.c:79: warning: Function parameter or member 'reg_ops' not described in 'uartlite_data'
>> drivers/tty/serial/uartlite.c:79: warning: Function parameter or member 'clk' not described in 'uartlite_data'
   drivers/tty/serial/uartlite.c:79: warning: Function parameter or member 'baud' not described in 'uartlite_data'
   drivers/tty/serial/uartlite.c:79: warning: Function parameter or member 'cflags' not described in 'uartlite_data'


vim +79 drivers/tty/serial/uartlite.c

deeb33e8fdd834 Shubhrajyoti Datta 2018-08-06  66  
ea017f5853e9a6 Sean Anderson      2021-08-26  67  /**
ea017f5853e9a6 Sean Anderson      2021-08-26  68   * struct uartlite_data: Driver private data
ea017f5853e9a6 Sean Anderson      2021-08-26  69   * reg_ops: Functions to read/write registers
ea017f5853e9a6 Sean Anderson      2021-08-26  70   * clk: Our parent clock, if present
ea017f5853e9a6 Sean Anderson      2021-08-26  71   * baud: The baud rate configured when this device was synthesized
ea017f5853e9a6 Sean Anderson      2021-08-26  72   * cflags: The cflags for parity and data bits
ea017f5853e9a6 Sean Anderson      2021-08-26  73   */
da7bf20e775804 Shubhrajyoti Datta 2018-07-21  74  struct uartlite_data {
da7bf20e775804 Shubhrajyoti Datta 2018-07-21  75  	const struct uartlite_reg_ops *reg_ops;
14288befeb572b Shubhrajyoti Datta 2018-07-21  76  	struct clk *clk;
ea017f5853e9a6 Sean Anderson      2021-08-26  77  	unsigned int baud;
ea017f5853e9a6 Sean Anderson      2021-08-26  78  	tcflag_t cflags;
da7bf20e775804 Shubhrajyoti Datta 2018-07-21 @79  };
da7bf20e775804 Shubhrajyoti Datta 2018-07-21  80  

:::::: The code at line 79 was first introduced by commit
:::::: da7bf20e7758042eb3931ff68fc96bdfaf94d881 tty: serial: uartlite: Add structure for private data

:::::: TO: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
