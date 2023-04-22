Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928B87F
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Apr 2023 07:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682146960; x=1713682960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LGgmpf2kARsIUKID1ftucGaK7nFBZYPcrWo7pYbVXdY=;
  b=HFvl097CRF6kLlo2XT3bD2q6oSa66u3y/HYLtQq+M5l8qpiE2XBdnw0c
   LS/XOXBFXXccf0lN9Gv68JYyrNRgiF8b8rCwy8NcFqPljigkpYxqP0AW6
   GFAyL5492GdaJ16qnNXl6OWD8jOv/+vAiHoodRNAOcu6blXtm58FSbsLK
   1wN0xLLYCc9t7qnADsgT1vYyy6g+DfgpB845XbYJLCVp8NC60W/UTjJh9
   vvP5NNUXIxzdwkb853rqecxn0hPbT2DS7+mja4L6L3t0eo6DlwX88WMwS
   q6OkyiQmoZgI4WyV2hnfQgWQz5AZT2LMorVarERvyOKqGY1CAfXlxhEGW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325730069"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="325730069"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 00:02:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="757125739"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="757125739"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2023 00:02:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq7GX-000h9M-1W;
	Sat, 22 Apr 2023 07:02:37 +0000
Date: Sat, 22 Apr 2023 15:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Patch V10 2/3] tpm_tis-spi: Add hardware wait polling
Message-ID: <202304221457.9URN171w-lkp@intel.com>
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
In-Reply-To: <20230421091309.2672-3-kyarlagadda@nvidia.com>
References: <20230421091309.2672-3-kyarlagadda@nvidia.com>
TO: Krishna Yarlagadda <kyarlagadda@nvidia.com>
TO: jsnitsel@redhat.com
TO: robh+dt@kernel.org
TO: broonie@kernel.org
TO: peterhuewe@gmx.de
TO: jgg@ziepe.ca
TO: jarkko@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: linux-spi@vger.kernel.org
TO: linux-tegra@vger.kernel.org
TO: linux-integrity@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: thierry.reding@gmail.com
CC: jonathanh@nvidia.com
CC: skomatineni@nvidia.com
CC: ldewangan@nvidia.com
CC: Krishna Yarlagadda <kyarlagadda@nvidia.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.3-rc7 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Yarlagadda/spi-Add-TPM-HW-flow-flag/20230421-171759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20230421091309.2672-3-kyarlagadda%40nvidia.com
patch subject: [Patch V10 2/3] tpm_tis-spi: Add hardware wait polling
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arc-randconfig-m041-20230421 (https://download.01.org/0day-ci/archive/20230422/202304221457.9URN171w-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304221457.9URN171w-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_tis_spi_main.c:137 tpm_tis_spi_transfer_half() error: uninitialized symbol 'ret'.

vim +/ret +137 drivers/char/tpm/tpm_tis_spi_main.c

8ab5e82afa969b drivers/char/tpm/tpm_tis_spi.c      Stephen Boyd       2019-09-20   73  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   74  /*
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   75   * Half duplex controller with support for TPM wait state detection like
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   76   * Tegra QSPI need CMD, ADDR & DATA sent in single message to manage HW flow
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   77   * control. Each phase sent in different transfer for controller to idenity
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   78   * phase.
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   79   */
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   80  static int tpm_tis_spi_transfer_half(struct tpm_tis_data *data,	u32 addr,
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   81  				     u16 len, u8 *in, const u8 *out)
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   82  {
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   83  	struct tpm_tis_spi_phy *phy = to_tpm_tis_spi_phy(data);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   84  	struct spi_transfer spi_xfer[3];
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   85  	struct spi_message m;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   86  	u8 transfer_len;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   87  	int ret;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   88  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   89  	while (len) {
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   90  		transfer_len = min_t(u16, len, MAX_SPI_FRAMESIZE);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   91  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   92  		spi_message_init(&m);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   93  		phy->iobuf[0] = (in ? 0x80 : 0) | (transfer_len - 1);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   94  		phy->iobuf[1] = 0xd4;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   95  		phy->iobuf[2] = addr >> 8;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   96  		phy->iobuf[3] = addr;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   97  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   98  		memset(&spi_xfer, 0, sizeof(spi_xfer));
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   99  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  100  		spi_xfer[0].tx_buf = phy->iobuf;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  101  		spi_xfer[0].len = 1;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  102  		spi_message_add_tail(&spi_xfer[0], &m);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  103  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  104  		spi_xfer[1].tx_buf = phy->iobuf + 1;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  105  		spi_xfer[1].len = 3;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  106  		spi_message_add_tail(&spi_xfer[1], &m);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  107  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  108  		if (out) {
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  109  			spi_xfer[2].tx_buf = &phy->iobuf[4];
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  110  			spi_xfer[2].rx_buf = NULL;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  111  			memcpy(&phy->iobuf[4], out, transfer_len);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  112  			out += transfer_len;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  113  		}
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  114  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  115  		if (in) {
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  116  			spi_xfer[2].tx_buf = NULL;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  117  			spi_xfer[2].rx_buf = &phy->iobuf[4];
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  118  		}
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  119  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  120  		spi_xfer[2].len = transfer_len;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  121  		spi_message_add_tail(&spi_xfer[2], &m);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  122  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  123  		reinit_completion(&phy->ready);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  124  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  125  		ret = spi_sync(phy->spi_device, &m);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  126  		if (ret < 0)
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  127  			return ret;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  128  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  129  		if (in) {
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  130  			memcpy(in, &phy->iobuf[4], transfer_len);
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  131  			in += transfer_len;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  132  		}
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  133  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  134  		len -= transfer_len;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  135  	}
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  136  
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21 @137  	return ret;
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  138  }
c09d1b20ab5d73 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
