Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C515B6
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 03:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZBuG1M4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698983800; x=1730519800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Jtr6p97MMZ1lz8Sw3kc129JGVmVFEy3ebEql1wSWx8=;
  b=cZBuG1M48T+waYlisj0Y2LGw2h2rmhsbItslRPhBNreflRoeZBN9fcXZ
   FCnyKmuezaLpE9yDTN7nwiBUUadgBfSlULZu9FMRdDWMx2rgl8OZTD3Kp
   S+1nXMv/u314N5ZxA2gmoi6Y1SbU7W2DM/mtwuPSDV4XebCuWlWUKD+kI
   fkoa/XfBMkGRCgbMxbnEodWX2Q7raNVGtibEiNMloP/8fi77GeDpAkhwq
   xFhBATNBnM9+nFDkKtHRg5Im1OvmZSEQ9fRAnsql3NiCvECo9T5uB/iIH
   vjeZ1G48Jr13H0gym1xz94qLV/Xr2TU2RkCmZaKROmhadJxVySawUlKQk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379274155"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="379274155"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 20:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="827362112"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="827362112"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Nov 2023 20:56:31 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qylIL-0002C4-25;
	Fri, 03 Nov 2023 03:56:29 +0000
Date: Fri, 3 Nov 2023 11:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/char/tpm/tpm_tis_spi_main.c:137 tpm_tis_spi_transfer_half()
 error: uninitialized symbol 'ret'.
Message-ID: <202311031103.4168yXXv-lkp@intel.com>
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
TO: Krishna Yarlagadda <kyarlagadda@nvidia.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   431f1051884e38d2a5751e4731d69b2ff289ee56
commit: a86a42ac2bd652fdc7836a9d880c306a2485c142 tpm_tis_spi: Add hardware wait polling
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20231102 (https://download.01.org/0day-ci/archive/20231103/202311031103.4168yXXv-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311031103.4168yXXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311031103.4168yXXv-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_tis_spi_main.c:137 tpm_tis_spi_transfer_half() error: uninitialized symbol 'ret'.

vim +/ret +137 drivers/char/tpm/tpm_tis_spi_main.c

8ab5e82afa969b drivers/char/tpm/tpm_tis_spi.c      Stephen Boyd       2019-09-20   73  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   74  /*
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   75   * Half duplex controller with support for TPM wait state detection like
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   76   * Tegra QSPI need CMD, ADDR & DATA sent in single message to manage HW flow
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   77   * control. Each phase sent in different transfer for controller to idenity
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   78   * phase.
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   79   */
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   80  static int tpm_tis_spi_transfer_half(struct tpm_tis_data *data,	u32 addr,
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   81  				     u16 len, u8 *in, const u8 *out)
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   82  {
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   83  	struct tpm_tis_spi_phy *phy = to_tpm_tis_spi_phy(data);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   84  	struct spi_transfer spi_xfer[3];
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   85  	struct spi_message m;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   86  	u8 transfer_len;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   87  	int ret;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   88  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   89  	while (len) {
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   90  		transfer_len = min_t(u16, len, MAX_SPI_FRAMESIZE);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   91  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   92  		spi_message_init(&m);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   93  		phy->iobuf[0] = (in ? 0x80 : 0) | (transfer_len - 1);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   94  		phy->iobuf[1] = 0xd4;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   95  		phy->iobuf[2] = addr >> 8;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   96  		phy->iobuf[3] = addr;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   97  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   98  		memset(&spi_xfer, 0, sizeof(spi_xfer));
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   99  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  100  		spi_xfer[0].tx_buf = phy->iobuf;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  101  		spi_xfer[0].len = 1;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  102  		spi_message_add_tail(&spi_xfer[0], &m);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  103  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  104  		spi_xfer[1].tx_buf = phy->iobuf + 1;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  105  		spi_xfer[1].len = 3;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  106  		spi_message_add_tail(&spi_xfer[1], &m);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  107  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  108  		if (out) {
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  109  			spi_xfer[2].tx_buf = &phy->iobuf[4];
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  110  			spi_xfer[2].rx_buf = NULL;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  111  			memcpy(&phy->iobuf[4], out, transfer_len);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  112  			out += transfer_len;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  113  		}
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  114  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  115  		if (in) {
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  116  			spi_xfer[2].tx_buf = NULL;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  117  			spi_xfer[2].rx_buf = &phy->iobuf[4];
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  118  		}
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  119  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  120  		spi_xfer[2].len = transfer_len;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  121  		spi_message_add_tail(&spi_xfer[2], &m);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  122  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  123  		reinit_completion(&phy->ready);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  124  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  125  		ret = spi_sync(phy->spi_device, &m);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  126  		if (ret < 0)
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  127  			return ret;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  128  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  129  		if (in) {
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  130  			memcpy(in, &phy->iobuf[4], transfer_len);
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  131  			in += transfer_len;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  132  		}
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  133  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  134  		len -= transfer_len;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  135  	}
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  136  
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21 @137  	return ret;
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  138  }
a86a42ac2bd652 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
