Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65166101EA
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 15:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694790516; x=1726326516;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2mwLIWOXCXfhbj/PqM3//WRphVZMxta6VIKPcExXNqE=;
  b=eq6buY4c2tcrj01nVzCADkHwV2Plq6xPbom2yvfH8F4ayzgpdMXJtNku
   enKnLR6yMIV2gRS6/HLT5zCmqIh9RbmVkKb2rqYtvdhOZpS5gO4dJpBDa
   DQ5ruhCtyNpheG8mBSA2QY4stdA/IGQ8EWp/f1a0WtFNCRF4hRc9zBu44
   NC8OLGJ2TRLJyhCOaxCHaBJpS0Rma2JJeyHsK0FAtQS2SNIJIYGrvI982
   9vTzm3nMkeIM3q4ZCkJu+09K5jI52WEmNqdMCr+3JrOwy/n9MGu994Lnc
   29P/mtNr7Q3YchNpuwwyr3aZgiTYzvp2+lxUrrp+CHHJwMSU1dxaEMC8H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364318633"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="364318633"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 08:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="748240767"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="748240767"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Sep 2023 08:08:06 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhAQO-00036N-2O;
	Fri, 15 Sep 2023 15:08:04 +0000
Date: Fri, 15 Sep 2023 23:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/base/regmap/regmap-spi-avmm.c:446
 br_do_rx_and_pkt_phy_parse() error: we previously assumed 'tb' could be null
 (see line 383)
Message-ID: <202309152200.owgOrmvm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Lee Jones <lee@kernel.org>
CC: Tianfei zhang <tianfei.zhang@intel.com>
CC: Russ Weight <russell.h.weight@intel.com>
CC: Xu Yilun <yilun.xu@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9fdfb15a3dbf818e06be514f4abbfc071004cbe7
commit: 603aed8ffd4c9cb633c05a514cfb5e8ca6b0751d mfd: intel-m10-bmc: Split into core and spi specific parts
date:   8 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20230915 (https://download.01.org/0day-ci/archive/20230915/202309152200.owgOrmvm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309152200.owgOrmvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309152200.owgOrmvm-lkp@intel.com/

smatch warnings:
drivers/base/regmap/regmap-spi-avmm.c:446 br_do_rx_and_pkt_phy_parse() error: we previously assumed 'tb' could be null (see line 383)

vim +/tb +446 drivers/base/regmap/regmap-spi-avmm.c

7f9fb67358a2bc Xu Yilun 2020-08-19  348  
7f9fb67358a2bc Xu Yilun 2020-08-19  349  /*
7f9fb67358a2bc Xu Yilun 2020-08-19  350   * This function read the rx byte stream from SPI word by word and convert
7f9fb67358a2bc Xu Yilun 2020-08-19  351   * them to transaction layer data in br->trans_buf. It also stores the length
7f9fb67358a2bc Xu Yilun 2020-08-19  352   * of rx transaction layer data in br->trans_len
7f9fb67358a2bc Xu Yilun 2020-08-19  353   *
7f9fb67358a2bc Xu Yilun 2020-08-19  354   * The slave may send an unknown number of PHY_IDLEs in rx phase, so we cannot
7f9fb67358a2bc Xu Yilun 2020-08-19  355   * prepare a fixed length buffer to receive all of the rx data in a batch. We
7f9fb67358a2bc Xu Yilun 2020-08-19  356   * have to read word by word and convert them to transaction layer data at
7f9fb67358a2bc Xu Yilun 2020-08-19  357   * once.
7f9fb67358a2bc Xu Yilun 2020-08-19  358   */
7f9fb67358a2bc Xu Yilun 2020-08-19  359  static int br_do_rx_and_pkt_phy_parse(struct spi_avmm_bridge *br)
7f9fb67358a2bc Xu Yilun 2020-08-19  360  {
7f9fb67358a2bc Xu Yilun 2020-08-19  361  	bool eop_found = false, channel_found = false, esc_found = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  362  	bool valid_word = false, last_try = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  363  	struct device *dev = &br->spi->dev;
7f9fb67358a2bc Xu Yilun 2020-08-19  364  	char *pb, *tb_limit, *tb = NULL;
7f9fb67358a2bc Xu Yilun 2020-08-19  365  	unsigned long poll_timeout;
7f9fb67358a2bc Xu Yilun 2020-08-19  366  	int ret, i;
7f9fb67358a2bc Xu Yilun 2020-08-19  367  
7f9fb67358a2bc Xu Yilun 2020-08-19  368  	tb_limit = br->trans_buf + ARRAY_SIZE(br->trans_buf);
7f9fb67358a2bc Xu Yilun 2020-08-19  369  	pb = br->phy_buf;
7f9fb67358a2bc Xu Yilun 2020-08-19  370  	poll_timeout = jiffies + SPI_AVMM_XFER_TIMEOUT;
7f9fb67358a2bc Xu Yilun 2020-08-19  371  	while (tb < tb_limit) {
7f9fb67358a2bc Xu Yilun 2020-08-19  372  		ret = spi_read(br->spi, pb, br->word_len);
7f9fb67358a2bc Xu Yilun 2020-08-19  373  		if (ret)
7f9fb67358a2bc Xu Yilun 2020-08-19  374  			return ret;
7f9fb67358a2bc Xu Yilun 2020-08-19  375  
7f9fb67358a2bc Xu Yilun 2020-08-19  376  		/* reorder the word back */
7f9fb67358a2bc Xu Yilun 2020-08-19  377  		if (br->swap_words)
7f9fb67358a2bc Xu Yilun 2020-08-19  378  			br->swap_words(pb, br->word_len);
7f9fb67358a2bc Xu Yilun 2020-08-19  379  
7f9fb67358a2bc Xu Yilun 2020-08-19  380  		valid_word = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  381  		for (i = 0; i < br->word_len; i++) {
7f9fb67358a2bc Xu Yilun 2020-08-19  382  			/* drop everything before first SOP */
7f9fb67358a2bc Xu Yilun 2020-08-19 @383  			if (!tb && pb[i] != PKT_SOP)
7f9fb67358a2bc Xu Yilun 2020-08-19  384  				continue;
7f9fb67358a2bc Xu Yilun 2020-08-19  385  
7f9fb67358a2bc Xu Yilun 2020-08-19  386  			/* drop PHY_IDLE */
7f9fb67358a2bc Xu Yilun 2020-08-19  387  			if (pb[i] == PHY_IDLE)
7f9fb67358a2bc Xu Yilun 2020-08-19  388  				continue;
7f9fb67358a2bc Xu Yilun 2020-08-19  389  
7f9fb67358a2bc Xu Yilun 2020-08-19  390  			valid_word = true;
7f9fb67358a2bc Xu Yilun 2020-08-19  391  
7f9fb67358a2bc Xu Yilun 2020-08-19  392  			/*
7f9fb67358a2bc Xu Yilun 2020-08-19  393  			 * We don't support multiple channels, so error out if
7f9fb67358a2bc Xu Yilun 2020-08-19  394  			 * a non-zero channel number is found.
7f9fb67358a2bc Xu Yilun 2020-08-19  395  			 */
7f9fb67358a2bc Xu Yilun 2020-08-19  396  			if (channel_found) {
7f9fb67358a2bc Xu Yilun 2020-08-19  397  				if (pb[i] != 0) {
7f9fb67358a2bc Xu Yilun 2020-08-19  398  					dev_err(dev, "%s channel num != 0\n",
7f9fb67358a2bc Xu Yilun 2020-08-19  399  						__func__);
7f9fb67358a2bc Xu Yilun 2020-08-19  400  					return -EFAULT;
7f9fb67358a2bc Xu Yilun 2020-08-19  401  				}
7f9fb67358a2bc Xu Yilun 2020-08-19  402  
7f9fb67358a2bc Xu Yilun 2020-08-19  403  				channel_found = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  404  				continue;
7f9fb67358a2bc Xu Yilun 2020-08-19  405  			}
7f9fb67358a2bc Xu Yilun 2020-08-19  406  
7f9fb67358a2bc Xu Yilun 2020-08-19  407  			switch (pb[i]) {
7f9fb67358a2bc Xu Yilun 2020-08-19  408  			case PKT_SOP:
7f9fb67358a2bc Xu Yilun 2020-08-19  409  				/*
7f9fb67358a2bc Xu Yilun 2020-08-19  410  				 * reset the parsing if a second SOP appears.
7f9fb67358a2bc Xu Yilun 2020-08-19  411  				 */
7f9fb67358a2bc Xu Yilun 2020-08-19  412  				tb = br->trans_buf;
7f9fb67358a2bc Xu Yilun 2020-08-19  413  				eop_found = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  414  				channel_found = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  415  				esc_found = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  416  				break;
7f9fb67358a2bc Xu Yilun 2020-08-19  417  			case PKT_EOP:
7f9fb67358a2bc Xu Yilun 2020-08-19  418  				/*
7f9fb67358a2bc Xu Yilun 2020-08-19  419  				 * No special char is expected after ESC char.
7f9fb67358a2bc Xu Yilun 2020-08-19  420  				 * No special char (except ESC & PHY_IDLE) is
7f9fb67358a2bc Xu Yilun 2020-08-19  421  				 * expected after EOP char.
7f9fb67358a2bc Xu Yilun 2020-08-19  422  				 *
7f9fb67358a2bc Xu Yilun 2020-08-19  423  				 * The special chars are all dropped.
7f9fb67358a2bc Xu Yilun 2020-08-19  424  				 */
7f9fb67358a2bc Xu Yilun 2020-08-19  425  				if (esc_found || eop_found)
7f9fb67358a2bc Xu Yilun 2020-08-19  426  					return -EFAULT;
7f9fb67358a2bc Xu Yilun 2020-08-19  427  
7f9fb67358a2bc Xu Yilun 2020-08-19  428  				eop_found = true;
7f9fb67358a2bc Xu Yilun 2020-08-19  429  				break;
7f9fb67358a2bc Xu Yilun 2020-08-19  430  			case PKT_CHANNEL:
7f9fb67358a2bc Xu Yilun 2020-08-19  431  				if (esc_found || eop_found)
7f9fb67358a2bc Xu Yilun 2020-08-19  432  					return -EFAULT;
7f9fb67358a2bc Xu Yilun 2020-08-19  433  
7f9fb67358a2bc Xu Yilun 2020-08-19  434  				channel_found = true;
7f9fb67358a2bc Xu Yilun 2020-08-19  435  				break;
7f9fb67358a2bc Xu Yilun 2020-08-19  436  			case PKT_ESC:
7f9fb67358a2bc Xu Yilun 2020-08-19  437  			case PHY_ESC:
7f9fb67358a2bc Xu Yilun 2020-08-19  438  				if (esc_found)
7f9fb67358a2bc Xu Yilun 2020-08-19  439  					return -EFAULT;
7f9fb67358a2bc Xu Yilun 2020-08-19  440  
7f9fb67358a2bc Xu Yilun 2020-08-19  441  				esc_found = true;
7f9fb67358a2bc Xu Yilun 2020-08-19  442  				break;
7f9fb67358a2bc Xu Yilun 2020-08-19  443  			default:
7f9fb67358a2bc Xu Yilun 2020-08-19  444  				/* Record the normal byte in trans_buf. */
7f9fb67358a2bc Xu Yilun 2020-08-19  445  				if (esc_found) {
7f9fb67358a2bc Xu Yilun 2020-08-19 @446  					*tb++ = pb[i] ^ 0x20;
7f9fb67358a2bc Xu Yilun 2020-08-19  447  					esc_found = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  448  				} else {
7f9fb67358a2bc Xu Yilun 2020-08-19  449  					*tb++ = pb[i];
7f9fb67358a2bc Xu Yilun 2020-08-19  450  				}
7f9fb67358a2bc Xu Yilun 2020-08-19  451  
7f9fb67358a2bc Xu Yilun 2020-08-19  452  				/*
7f9fb67358a2bc Xu Yilun 2020-08-19  453  				 * We get the last normal byte after EOP, it is
7f9fb67358a2bc Xu Yilun 2020-08-19  454  				 * time we finish. Normally the function should
7f9fb67358a2bc Xu Yilun 2020-08-19  455  				 * return here.
7f9fb67358a2bc Xu Yilun 2020-08-19  456  				 */
7f9fb67358a2bc Xu Yilun 2020-08-19  457  				if (eop_found) {
7f9fb67358a2bc Xu Yilun 2020-08-19  458  					br->trans_len = tb - br->trans_buf;
7f9fb67358a2bc Xu Yilun 2020-08-19  459  					return 0;
7f9fb67358a2bc Xu Yilun 2020-08-19  460  				}
7f9fb67358a2bc Xu Yilun 2020-08-19  461  			}
7f9fb67358a2bc Xu Yilun 2020-08-19  462  		}
7f9fb67358a2bc Xu Yilun 2020-08-19  463  
7f9fb67358a2bc Xu Yilun 2020-08-19  464  		if (valid_word) {
7f9fb67358a2bc Xu Yilun 2020-08-19  465  			/* update poll timeout when we get valid word */
7f9fb67358a2bc Xu Yilun 2020-08-19  466  			poll_timeout = jiffies + SPI_AVMM_XFER_TIMEOUT;
7f9fb67358a2bc Xu Yilun 2020-08-19  467  			last_try = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  468  		} else {
7f9fb67358a2bc Xu Yilun 2020-08-19  469  			/*
7f9fb67358a2bc Xu Yilun 2020-08-19  470  			 * We timeout when rx keeps invalid for some time. But
7f9fb67358a2bc Xu Yilun 2020-08-19  471  			 * it is possible we are scheduled out for long time
7f9fb67358a2bc Xu Yilun 2020-08-19  472  			 * after a spi_read. So when we are scheduled in, a SW
7f9fb67358a2bc Xu Yilun 2020-08-19  473  			 * timeout happens. But actually HW may have worked fine and
7f9fb67358a2bc Xu Yilun 2020-08-19  474  			 * has been ready long time ago. So we need to do an extra
7f9fb67358a2bc Xu Yilun 2020-08-19  475  			 * read, if we get a valid word then we could continue rx,
7f9fb67358a2bc Xu Yilun 2020-08-19  476  			 * otherwise real a HW issue happens.
7f9fb67358a2bc Xu Yilun 2020-08-19  477  			 */
7f9fb67358a2bc Xu Yilun 2020-08-19  478  			if (last_try)
7f9fb67358a2bc Xu Yilun 2020-08-19  479  				return -ETIMEDOUT;
7f9fb67358a2bc Xu Yilun 2020-08-19  480  
7f9fb67358a2bc Xu Yilun 2020-08-19  481  			if (time_after(jiffies, poll_timeout))
7f9fb67358a2bc Xu Yilun 2020-08-19  482  				last_try = true;
7f9fb67358a2bc Xu Yilun 2020-08-19  483  		}
7f9fb67358a2bc Xu Yilun 2020-08-19  484  	}
7f9fb67358a2bc Xu Yilun 2020-08-19  485  
7f9fb67358a2bc Xu Yilun 2020-08-19  486  	/*
7f9fb67358a2bc Xu Yilun 2020-08-19  487  	 * We have used out all transfer layer buffer but cannot find the end
7f9fb67358a2bc Xu Yilun 2020-08-19  488  	 * of the byte stream.
7f9fb67358a2bc Xu Yilun 2020-08-19  489  	 */
7f9fb67358a2bc Xu Yilun 2020-08-19  490  	dev_err(dev, "%s transfer buffer is full but rx doesn't end\n",
7f9fb67358a2bc Xu Yilun 2020-08-19  491  		__func__);
7f9fb67358a2bc Xu Yilun 2020-08-19  492  
7f9fb67358a2bc Xu Yilun 2020-08-19  493  	return -EFAULT;
7f9fb67358a2bc Xu Yilun 2020-08-19  494  }
7f9fb67358a2bc Xu Yilun 2020-08-19  495  

:::::: The code at line 446 was first introduced by commit
:::::: 7f9fb67358a2bcaacbdfeee12e0f19e98c8bdf55 regmap: add Intel SPI Slave to AVMM Bus Bridge support

:::::: TO: Xu Yilun <yilun.xu@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
