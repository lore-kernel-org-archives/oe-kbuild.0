Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD956759
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jan 2024 20:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NR8LZQaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705003753; x=1736539753;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E9OnDSKv8f5BRBcKVDzesiofGkGTxZifReI/+Y8/OW8=;
  b=NR8LZQaLppaZhyqQ0GncNYJewC35abrn9VadMdgPRHc9luwYm5PaOKZc
   NEj63Gchaf5d5RZEF7HyMhQgxI39bU/03kJ4RF1KkqYIxDzAMMWH8ymP7
   htTWi7d5gqobGi8XVFnee3mupYd4yL9OMc/FOs7fgXyH+outxlYcSq2bA
   v+DPtoGw69KwjXSd+PZ/4au0PT81qPzJpaAdjjoxmKpxoVzwpp2SXaEMG
   nw/zSo/71Bb82CKO/x3G1QiAncPtP0tQuPl7auhOuyHXgUTCTYK81ZmLm
   QUASm06Ms8HGsaL8zPJRZWvfcENp0uubZMzd0YkjWYuXAlc1fO/KrhHCs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="430156482"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="430156482"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 12:09:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="816836910"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="816836910"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Jan 2024 12:09:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO1MO-0008hC-1U;
	Thu, 11 Jan 2024 20:09:04 +0000
Date: Fri, 12 Jan 2024 04:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or
 member 'timing0' not described in 'mxs_i2c_dev'
Message-ID: <202401120442.Ixwb0ytj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de927f6c0b07d9e698416c5b287c521b07694cac
commit: 4a2d5f663dab6614772d8e28ca190b127ba46d9d i2c: Enable compile testing for more drivers
date:   4 years ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 years ago
config: i386-buildonly-randconfig-003-20240106 (https://download.01.org/0day-ci/archive/20240112/202401120442.Ixwb0ytj-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120442.Ixwb0ytj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401120442.Ixwb0ytj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or member 'timing0' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or member 'timing1' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or member 'timing2' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or member 'dmach' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or member 'pio_data' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or member 'addr_data' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or member 'sg_io' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or member 'dma_read' not described in 'mxs_i2c_dev'
--
>> drivers/i2c/busses/i2c-tegra-bpmp.c:104: warning: Function parameter or member 'i2c' not described in 'tegra_bpmp_serialize_i2c_msg'
>> drivers/i2c/busses/i2c-tegra-bpmp.c:104: warning: Function parameter or member 'request' not described in 'tegra_bpmp_serialize_i2c_msg'
>> drivers/i2c/busses/i2c-tegra-bpmp.c:104: warning: Function parameter or member 'msgs' not described in 'tegra_bpmp_serialize_i2c_msg'
>> drivers/i2c/busses/i2c-tegra-bpmp.c:104: warning: Function parameter or member 'num' not described in 'tegra_bpmp_serialize_i2c_msg'
>> drivers/i2c/busses/i2c-tegra-bpmp.c:153: warning: Function parameter or member 'i2c' not described in 'tegra_bpmp_i2c_deserialize'
>> drivers/i2c/busses/i2c-tegra-bpmp.c:153: warning: Function parameter or member 'response' not described in 'tegra_bpmp_i2c_deserialize'
>> drivers/i2c/busses/i2c-tegra-bpmp.c:153: warning: Function parameter or member 'msgs' not described in 'tegra_bpmp_i2c_deserialize'
>> drivers/i2c/busses/i2c-tegra-bpmp.c:153: warning: Function parameter or member 'num' not described in 'tegra_bpmp_i2c_deserialize'
--
>> drivers/i2c/busses/i2c-altera.c:74: warning: cannot understand function prototype: 'struct altr_i2c_dev '
>> drivers/i2c/busses/i2c-altera.c:185: warning: Function parameter or member 'idev' not described in 'altr_i2c_transfer'
>> drivers/i2c/busses/i2c-altera.c:185: warning: Function parameter or member 'data' not described in 'altr_i2c_transfer'
>> drivers/i2c/busses/i2c-altera.c:198: warning: Function parameter or member 'idev' not described in 'altr_i2c_empty_rx_fifo'
>> drivers/i2c/busses/i2c-altera.c:214: warning: Function parameter or member 'idev' not described in 'altr_i2c_fill_tx_fifo'


vim +130 drivers/i2c/busses/i2c-mxs.c

616228a164d436 Juergen Beisert 2013-09-30  101  
a8da7fecb60102 Wolfram Sang    2011-02-16  102  /**
a8da7fecb60102 Wolfram Sang    2011-02-16  103   * struct mxs_i2c_dev - per device, private MXS-I2C data
a8da7fecb60102 Wolfram Sang    2011-02-16  104   *
a8da7fecb60102 Wolfram Sang    2011-02-16  105   * @dev: driver model device node
616228a164d436 Juergen Beisert 2013-09-30  106   * @dev_type: distinguish i.MX23/i.MX28 features
a8da7fecb60102 Wolfram Sang    2011-02-16  107   * @regs: IO registers pointer
a8da7fecb60102 Wolfram Sang    2011-02-16  108   * @cmd_complete: completion object for transaction wait
a8da7fecb60102 Wolfram Sang    2011-02-16  109   * @cmd_err: error code for last transaction
a8da7fecb60102 Wolfram Sang    2011-02-16  110   * @adapter: i2c subsystem adapter node
a8da7fecb60102 Wolfram Sang    2011-02-16  111   */
a8da7fecb60102 Wolfram Sang    2011-02-16  112  struct mxs_i2c_dev {
a8da7fecb60102 Wolfram Sang    2011-02-16  113  	struct device *dev;
616228a164d436 Juergen Beisert 2013-09-30  114  	enum mxs_i2c_devtype dev_type;
a8da7fecb60102 Wolfram Sang    2011-02-16  115  	void __iomem *regs;
a8da7fecb60102 Wolfram Sang    2011-02-16  116  	struct completion cmd_complete;
0f40cbc4f85e13 Fabio Estevam   2013-01-07  117  	int cmd_err;
a8da7fecb60102 Wolfram Sang    2011-02-16  118  	struct i2c_adapter adapter;
626f0a2ff6bc98 Marek Vasut     2012-11-30  119  
626f0a2ff6bc98 Marek Vasut     2012-11-30  120  	uint32_t timing0;
626f0a2ff6bc98 Marek Vasut     2012-11-30  121  	uint32_t timing1;
869c6a3ededbb1 Lothar Waﬂmann  2013-07-05  122  	uint32_t timing2;
62885f59a26195 Marek Vasut     2012-08-24  123  
62885f59a26195 Marek Vasut     2012-08-24  124  	/* DMA support components */
62885f59a26195 Marek Vasut     2012-08-24  125  	struct dma_chan			*dmach;
62885f59a26195 Marek Vasut     2012-08-24  126  	uint32_t			pio_data[2];
62885f59a26195 Marek Vasut     2012-08-24  127  	uint32_t			addr_data;
62885f59a26195 Marek Vasut     2012-08-24  128  	struct scatterlist		sg_io[2];
62885f59a26195 Marek Vasut     2012-08-24  129  	bool				dma_read;
a8da7fecb60102 Wolfram Sang    2011-02-16 @130  };
a8da7fecb60102 Wolfram Sang    2011-02-16  131  

:::::: The code at line 130 was first introduced by commit
:::::: a8da7fecb6010222fe495cc2b4330b99bca20c61 i2c: add driver for Freescale i.MX28

:::::: TO: Wolfram Sang <w.sang@pengutronix.de>
:::::: CC: Ben Dooks <ben-linux@fluff.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
