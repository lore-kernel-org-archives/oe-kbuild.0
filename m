Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB07E2
	for <oe-kbuild@lists.linux.dev>; Thu,  4 May 2023 04:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683176031; x=1714712031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sqd5Kj+QJyIRDgLijTno/+BNYZE8yW0u53bkMaufULI=;
  b=Tf6Nhtj46LcwSqyqd4dx2/jCSboZsWOjOBrz13weDm+Lghv4SzJdPskf
   gbsNoaANaaN0YEn/l3bTS7ZddJJIDzzOt3nqn/MkhPN6jk3P5jT86YnhQ
   3l+tQl9iOCcDx2vxtEvOnvkph1WBmE6uJQzq6sklKUKOvJOrz4jGlzqMO
   w5XS6och7pk26IHE8cuWaFaKHyzON3w7zNOczwEfkthV0Q5Mepq/NZooi
   2wIHOsSoSMTMNecT2JHWnDNJRE3mweCzcbLGepfYk73vrH7wv2Chfg0+f
   ErAsdRAnWsVk6JhZCgHJezNixorgQYO2OWQ5u0GN38jKlC3nXZRC6mTR6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="412008696"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="412008696"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 21:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="840971119"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="840971119"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 May 2023 21:53:49 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puQyS-0002Zm-2J;
	Thu, 04 May 2023 04:53:48 +0000
Date: Thu, 4 May 2023 12:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/microchip/ksz_ptp.c:217 ksz_ptp_clock_register()
 warn: passing zero to 'PTR_ERR'
Message-ID: <202305041244.tDo9luPw-lkp@intel.com>
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
TO: Christian Eggers <ceggers@arri.de>
CC: Arun Ramadoss <arun.ramadoss@microchip.com>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Florian Fainelli <f.fainelli@gmail.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa31fc82fb775445c176e576304c4098222f47f2
commit: eac1ea20261e1fac8ffbfb3b7da2d5e6b7c159e3 net: dsa: microchip: ptp: add the posix clock support
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230504/202305041244.tDo9luPw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305041244.tDo9luPw-lkp@intel.com/

smatch warnings:
drivers/net/dsa/microchip/ksz_ptp.c:217 ksz_ptp_clock_register() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +217 drivers/net/dsa/microchip/ksz_ptp.c

eac1ea20261e1f Christian Eggers 2023-01-10  185  
eac1ea20261e1f Christian Eggers 2023-01-10  186  int ksz_ptp_clock_register(struct dsa_switch *ds)
eac1ea20261e1f Christian Eggers 2023-01-10  187  {
eac1ea20261e1f Christian Eggers 2023-01-10  188  	struct ksz_device *dev = ds->priv;
eac1ea20261e1f Christian Eggers 2023-01-10  189  	struct ksz_ptp_data *ptp_data;
eac1ea20261e1f Christian Eggers 2023-01-10  190  	int ret;
eac1ea20261e1f Christian Eggers 2023-01-10  191  
eac1ea20261e1f Christian Eggers 2023-01-10  192  	ptp_data = &dev->ptp_data;
eac1ea20261e1f Christian Eggers 2023-01-10  193  	mutex_init(&ptp_data->lock);
eac1ea20261e1f Christian Eggers 2023-01-10  194  
eac1ea20261e1f Christian Eggers 2023-01-10  195  	ptp_data->caps.owner		= THIS_MODULE;
eac1ea20261e1f Christian Eggers 2023-01-10  196  	snprintf(ptp_data->caps.name, 16, "Microchip Clock");
eac1ea20261e1f Christian Eggers 2023-01-10  197  	ptp_data->caps.max_adj		= KSZ_MAX_DRIFT_CORR;
eac1ea20261e1f Christian Eggers 2023-01-10  198  	ptp_data->caps.gettime64	= ksz_ptp_gettime;
eac1ea20261e1f Christian Eggers 2023-01-10  199  	ptp_data->caps.settime64	= ksz_ptp_settime;
eac1ea20261e1f Christian Eggers 2023-01-10  200  	ptp_data->caps.adjfine		= ksz_ptp_adjfine;
eac1ea20261e1f Christian Eggers 2023-01-10  201  	ptp_data->caps.adjtime		= ksz_ptp_adjtime;
eac1ea20261e1f Christian Eggers 2023-01-10  202  
eac1ea20261e1f Christian Eggers 2023-01-10  203  	ret = ksz_ptp_start_clock(dev);
eac1ea20261e1f Christian Eggers 2023-01-10  204  	if (ret)
eac1ea20261e1f Christian Eggers 2023-01-10  205  		return ret;
eac1ea20261e1f Christian Eggers 2023-01-10  206  
eac1ea20261e1f Christian Eggers 2023-01-10  207  	/* Currently only P2P mode is supported. When 802_1AS bit is set, it
eac1ea20261e1f Christian Eggers 2023-01-10  208  	 * forwards all PTP packets to host port and none to other ports.
eac1ea20261e1f Christian Eggers 2023-01-10  209  	 */
eac1ea20261e1f Christian Eggers 2023-01-10  210  	ret = ksz_rmw16(dev, REG_PTP_MSG_CONF1, PTP_TC_P2P | PTP_802_1AS,
eac1ea20261e1f Christian Eggers 2023-01-10  211  			PTP_TC_P2P | PTP_802_1AS);
eac1ea20261e1f Christian Eggers 2023-01-10  212  	if (ret)
eac1ea20261e1f Christian Eggers 2023-01-10  213  		return ret;
eac1ea20261e1f Christian Eggers 2023-01-10  214  
eac1ea20261e1f Christian Eggers 2023-01-10  215  	ptp_data->clock = ptp_clock_register(&ptp_data->caps, dev->dev);
eac1ea20261e1f Christian Eggers 2023-01-10  216  	if (IS_ERR_OR_NULL(ptp_data->clock))
eac1ea20261e1f Christian Eggers 2023-01-10 @217  		return PTR_ERR(ptp_data->clock);
eac1ea20261e1f Christian Eggers 2023-01-10  218  
eac1ea20261e1f Christian Eggers 2023-01-10  219  	return 0;
eac1ea20261e1f Christian Eggers 2023-01-10  220  }
eac1ea20261e1f Christian Eggers 2023-01-10  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
