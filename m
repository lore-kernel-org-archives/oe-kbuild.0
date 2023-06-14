Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05360160
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jun 2023 04:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686717239; x=1718253239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yTXd7SVGWtxbhIU9TNoFxvpz2o8q8nbDa6ZJZt2lr0w=;
  b=UGc9ka8r1UGDzByxy3BQPYvzYMbuopcWTdMSl8/EYUtyVv+jFRy/Xx28
   y2RFK3t8vR0CBgnLJow6Iyvkb72aBzW2YPqe1dINH+L66GiKatljlz+GW
   i4RCHjRukiE0ojKmi+8bnCGjRhXGeD9C0G1NBHiHrGCmju5MLQoE42Z6f
   uv5v59vI5NG3R+gRLIBgypGqxToD/rZUzIQivxv2PEYPQgIIURD4+7PjC
   2Ea4CHRopwCKzxq/mb8bEQTOZtOd5NB7m2F5gO102AS4ORsdfzo0Qtd2w
   h+UIJpaJrLZO2syRrjOQzh6E31J1IVjEXRUVpbp8RiFuQO0qRa0QDv5tL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="338150324"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="338150324"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 21:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958672707"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="958672707"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2023 21:33:56 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9ICi-0000Az-0q;
	Wed, 14 Jun 2023 04:33:56 +0000
Date: Wed, 14 Jun 2023 12:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8337/9385]
 drivers/char/tpm/tpm_tis_spi_main.c:137 tpm_tis_spi_transfer_half() error:
 uninitialized symbol 'ret'.
Message-ID: <202306141240.zF5heDKe-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Krishna Yarlagadda <kyarlagadda@nvidia.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1f6ce8392d6ff486af5ca96df9ded5882c4b6977
commit: 394dfc8ac4b00b38d4fb781794967aa5b2eac687 [8337/9385] tpm_tis-spi: Add hardware wait polling
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: m68k-randconfig-m041-20230611 (https://download.01.org/0day-ci/archive/20230614/202306141240.zF5heDKe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306141240.zF5heDKe-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_tis_spi_main.c:137 tpm_tis_spi_transfer_half() error: uninitialized symbol 'ret'.

vim +/ret +137 drivers/char/tpm/tpm_tis_spi_main.c

8ab5e82afa969b drivers/char/tpm/tpm_tis_spi.c      Stephen Boyd       2019-09-20   73  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   74  /*
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   75   * Half duplex controller with support for TPM wait state detection like
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   76   * Tegra QSPI need CMD, ADDR & DATA sent in single message to manage HW flow
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   77   * control. Each phase sent in different transfer for controller to idenity
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   78   * phase.
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   79   */
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   80  static int tpm_tis_spi_transfer_half(struct tpm_tis_data *data,	u32 addr,
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   81  				     u16 len, u8 *in, const u8 *out)
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   82  {
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   83  	struct tpm_tis_spi_phy *phy = to_tpm_tis_spi_phy(data);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   84  	struct spi_transfer spi_xfer[3];
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   85  	struct spi_message m;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   86  	u8 transfer_len;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   87  	int ret;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   88  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   89  	while (len) {
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   90  		transfer_len = min_t(u16, len, MAX_SPI_FRAMESIZE);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   91  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   92  		spi_message_init(&m);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   93  		phy->iobuf[0] = (in ? 0x80 : 0) | (transfer_len - 1);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   94  		phy->iobuf[1] = 0xd4;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   95  		phy->iobuf[2] = addr >> 8;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   96  		phy->iobuf[3] = addr;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   97  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   98  		memset(&spi_xfer, 0, sizeof(spi_xfer));
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   99  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  100  		spi_xfer[0].tx_buf = phy->iobuf;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  101  		spi_xfer[0].len = 1;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  102  		spi_message_add_tail(&spi_xfer[0], &m);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  103  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  104  		spi_xfer[1].tx_buf = phy->iobuf + 1;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  105  		spi_xfer[1].len = 3;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  106  		spi_message_add_tail(&spi_xfer[1], &m);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  107  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  108  		if (out) {
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  109  			spi_xfer[2].tx_buf = &phy->iobuf[4];
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  110  			spi_xfer[2].rx_buf = NULL;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  111  			memcpy(&phy->iobuf[4], out, transfer_len);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  112  			out += transfer_len;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  113  		}
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  114  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  115  		if (in) {
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  116  			spi_xfer[2].tx_buf = NULL;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  117  			spi_xfer[2].rx_buf = &phy->iobuf[4];
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  118  		}
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  119  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  120  		spi_xfer[2].len = transfer_len;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  121  		spi_message_add_tail(&spi_xfer[2], &m);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  122  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  123  		reinit_completion(&phy->ready);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  124  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  125  		ret = spi_sync(phy->spi_device, &m);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  126  		if (ret < 0)
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  127  			return ret;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  128  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  129  		if (in) {
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  130  			memcpy(in, &phy->iobuf[4], transfer_len);
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  131  			in += transfer_len;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  132  		}
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  133  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  134  		len -= transfer_len;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  135  	}
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  136  
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21 @137  	return ret;
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  138  }
394dfc8ac4b00b drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
