Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF96453B7
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jul 2023 22:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689287953; x=1720823953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jz2OQ9arW3N/eBoCs/kvZO6rWaPx+HdpcMj9o4RfNzs=;
  b=AmTkqo3Le63RCqh9gnkcJd2YvRdjpfeSPVAYIhICiJR51FG4uzBLbYeE
   TBNLPAl8N3iWg6Oa/55AAL4q3/QK0g4tOsA82gsaiZonotzkQVEVlp9Dn
   9uXgcG87jlg4MvKHPCLXQKH01WI7i5Yg9vbXpPArdsdY88tWb+qGA2xwx
   II3ekid4WsfL4ZtgG+bISGtyoZc61X1kdgj5alORnjTd9Pf2JG6pjbeW7
   ddLc2GKOOAa++NzPr4IGSzQjtg2wNF8JRi1I8xdy5B0mT4EBZ+8dWcAnC
   RLUU2BDCtFpq9SipEG7phjX1+IlMrLi/psRCgAoMjjYKdapYSesHebNAQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="350203295"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="350203295"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 15:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968792908"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="968792908"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2023 15:39:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK4xq-0006xF-2W;
	Thu, 13 Jul 2023 22:39:10 +0000
Date: Fri, 14 Jul 2023 06:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1360/2369]
 drivers/char/tpm/tpm_tis_spi_main.c:137 tpm_tis_spi_transfer_half() error:
 uninitialized symbol 'ret'.
Message-ID: <202307140632.lBrSdsuF-lkp@intel.com>
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
head:   e3262265625831348cfb3128d35907ead75d8bf7
commit: 13a54942e9bf0d2812d560669b6eca66d38fe95c [1360/2369] tpm_tis-spi: Add hardware wait polling
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140632.lBrSdsuF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140632.lBrSdsuF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307140632.lBrSdsuF-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_tis_spi_main.c:137 tpm_tis_spi_transfer_half() error: uninitialized symbol 'ret'.

vim +/ret +137 drivers/char/tpm/tpm_tis_spi_main.c

8ab5e82afa969b drivers/char/tpm/tpm_tis_spi.c      Stephen Boyd       2019-09-20   73  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   74  /*
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   75   * Half duplex controller with support for TPM wait state detection like
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   76   * Tegra QSPI need CMD, ADDR & DATA sent in single message to manage HW flow
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   77   * control. Each phase sent in different transfer for controller to idenity
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   78   * phase.
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   79   */
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   80  static int tpm_tis_spi_transfer_half(struct tpm_tis_data *data,	u32 addr,
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   81  				     u16 len, u8 *in, const u8 *out)
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   82  {
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   83  	struct tpm_tis_spi_phy *phy = to_tpm_tis_spi_phy(data);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   84  	struct spi_transfer spi_xfer[3];
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   85  	struct spi_message m;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   86  	u8 transfer_len;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   87  	int ret;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   88  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   89  	while (len) {
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   90  		transfer_len = min_t(u16, len, MAX_SPI_FRAMESIZE);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   91  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   92  		spi_message_init(&m);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   93  		phy->iobuf[0] = (in ? 0x80 : 0) | (transfer_len - 1);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   94  		phy->iobuf[1] = 0xd4;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   95  		phy->iobuf[2] = addr >> 8;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   96  		phy->iobuf[3] = addr;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   97  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   98  		memset(&spi_xfer, 0, sizeof(spi_xfer));
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21   99  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  100  		spi_xfer[0].tx_buf = phy->iobuf;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  101  		spi_xfer[0].len = 1;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  102  		spi_message_add_tail(&spi_xfer[0], &m);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  103  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  104  		spi_xfer[1].tx_buf = phy->iobuf + 1;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  105  		spi_xfer[1].len = 3;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  106  		spi_message_add_tail(&spi_xfer[1], &m);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  107  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  108  		if (out) {
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  109  			spi_xfer[2].tx_buf = &phy->iobuf[4];
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  110  			spi_xfer[2].rx_buf = NULL;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  111  			memcpy(&phy->iobuf[4], out, transfer_len);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  112  			out += transfer_len;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  113  		}
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  114  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  115  		if (in) {
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  116  			spi_xfer[2].tx_buf = NULL;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  117  			spi_xfer[2].rx_buf = &phy->iobuf[4];
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  118  		}
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  119  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  120  		spi_xfer[2].len = transfer_len;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  121  		spi_message_add_tail(&spi_xfer[2], &m);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  122  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  123  		reinit_completion(&phy->ready);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  124  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  125  		ret = spi_sync(phy->spi_device, &m);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  126  		if (ret < 0)
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  127  			return ret;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  128  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  129  		if (in) {
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  130  			memcpy(in, &phy->iobuf[4], transfer_len);
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  131  			in += transfer_len;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  132  		}
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  133  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  134  		len -= transfer_len;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  135  	}
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  136  
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21 @137  	return ret;
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  138  }
13a54942e9bf0d drivers/char/tpm/tpm_tis_spi_main.c Krishna Yarlagadda 2023-04-21  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
