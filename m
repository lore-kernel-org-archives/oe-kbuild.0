Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3308BEE
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 17:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680196145; x=1711732145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a63eULiiHFGOJbnZaNylcfclWv9AQuok4dXkG8qzoDQ=;
  b=MBE3WaM1Kw4Qu3d7DatDCwyptpzHxxeVyKtK+ePq2EyqRKTD9WaWqnoj
   bfVsCEJrUpG+ctsJgWAnSGNZsBy5oHWrxqB0rgzs3xWEVLDS5v0+a8E7e
   04e2lYNgo+lUtQ3/l58UFKfQLh43RsGpdxnt/Q88P+fhxFZ1QvyON7/IQ
   Sms+A351mKQyz+NvT5WvphuRFSQsG+HrOO+L4AL0mb9U6S1lY4sGG/aSY
   oNCSH1fmzJSENDg6RvIElXFrHTbUDNWTlY/sViv4kM63QUdDQc24Fn1Bu
   f00s9rj+WnelIaaoZpH/xyRg+MQ7k3j+kZ7BKJNrk++RskzMyBcoELqRc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329750695"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="329750695"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 10:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687321377"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="687321377"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Mar 2023 10:09:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phvlm-000L23-0Z;
	Thu, 30 Mar 2023 17:09:02 +0000
Date: Fri, 31 Mar 2023 01:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Patch V9 2/3] tpm_tis-spi: Add hardware wait polling
Message-ID: <202303310004.Ul47LRPD-lkp@intel.com>
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
In-Reply-To: <20230325183409.7695-3-kyarlagadda@nvidia.com>
References: <20230325183409.7695-3-kyarlagadda@nvidia.com>
TO: Krishna Yarlagadda <kyarlagadda@nvidia.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Yarlagadda/spi-Add-TPM-HW-flow-flag/20230326-023635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20230325183409.7695-3-kyarlagadda%40nvidia.com
patch subject: [Patch V9 2/3] tpm_tis-spi: Add hardware wait polling
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: m68k-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310004.Ul47LRPD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303310004.Ul47LRPD-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_tis_spi_main.c:137 tpm_tis_spi_transfer_half() error: uninitialized symbol 'ret'.

vim +/ret +137 drivers/char/tpm/tpm_tis_spi_main.c

8ab5e82afa969b6 drivers/char/tpm/tpm_tis_spi.c      Stephen Boyd       2019-09-20   73  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   74  /*
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   75   * Half duplex controller with support for TPM wait state detection like
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   76   * Tegra QSPI need CMD, ADDR & DATA sent in single message to manage HW flow
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   77   * control. Each phase sent in different transfer for controller to idenity
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   78   * phase.
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   79   */
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   80  static int tpm_tis_spi_transfer_half(struct tpm_tis_data *data,	u32 addr,
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   81  				     u16 len, u8 *in, const u8 *out)
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   82  {
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   83  	struct tpm_tis_spi_phy *phy = to_tpm_tis_spi_phy(data);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   84  	struct spi_transfer spi_xfer[3];
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   85  	struct spi_message m;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   86  	u8 transfer_len;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   87  	int ret;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   88  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   89  	while (len) {
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   90  		transfer_len = min_t(u16, len, MAX_SPI_FRAMESIZE);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   91  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   92  		spi_message_init(&m);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   93  		phy->iobuf[0] = (in ? 0x80 : 0) | (transfer_len - 1);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   94  		phy->iobuf[1] = 0xd4;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   95  		phy->iobuf[2] = addr >> 8;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   96  		phy->iobuf[3] = addr;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   97  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   98  		memset(&spi_xfer, 0, sizeof(spi_xfer));
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26   99  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  100  		spi_xfer[0].tx_buf = phy->iobuf;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  101  		spi_xfer[0].len = 1;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  102  		spi_message_add_tail(&spi_xfer[0], &m);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  103  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  104  		spi_xfer[1].tx_buf = phy->iobuf + 1;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  105  		spi_xfer[1].len = 3;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  106  		spi_message_add_tail(&spi_xfer[1], &m);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  107  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  108  		if (out) {
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  109  			spi_xfer[2].tx_buf = &phy->iobuf[4];
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  110  			spi_xfer[2].rx_buf = NULL;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  111  			memcpy(&phy->iobuf[4], out, transfer_len);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  112  			out += transfer_len;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  113  		}
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  114  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  115  		if (in) {
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  116  			spi_xfer[2].tx_buf = NULL;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  117  			spi_xfer[2].rx_buf = &phy->iobuf[4];
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  118  		}
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  119  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  120  		spi_xfer[2].len = transfer_len;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  121  		spi_message_add_tail(&spi_xfer[2], &m);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  122  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  123  		reinit_completion(&phy->ready);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  124  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  125  		ret = spi_sync_locked(phy->spi_device, &m);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  126  		if (ret < 0)
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  127  			return ret;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  128  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  129  		if (in) {
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  130  			memcpy(in, &phy->iobuf[4], transfer_len);
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  131  			in += transfer_len;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  132  		}
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  133  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  134  		len -= transfer_len;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  135  	}
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  136  
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26 @137  	return ret;
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  138  }
9e4db447b009ec2 drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-03-26  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
