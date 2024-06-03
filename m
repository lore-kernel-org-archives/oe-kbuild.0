Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC604AEF5
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jun 2024 08:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717402558; cv=none; b=aLYw/QdrjkgMrpD7Rc0+LzHxko8wl8usyeg49YXftDy57W+7eM4ruSLMVSjtFC0jIw7GzJZhTAK9jej9aXNp7G2YXm9e7tzj5F7C/HptlfDO6Q1xMqFg/P+9Y2p5BDkL5coqu5/lcUFrXukzHu2I8jGC4JG96tTd2ZngoEbmLVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717402558; c=relaxed/simple;
	bh=SDdvnt4it1OQ/NPqIFSDE72B/MAQQRXI2ekEZpvG0OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OGPb/Kb4cDFG+dX3IafV8GClsLMdJpM0i7h4mWLl02OIFzq6Ysc399cvQH1DC0bY9biTsXU2KLHIJUr3wDRAJaHyKRQBl2/LA53DgFRpQSg3wt5zZOHbqvzj41IlGIxim4r1qlyjmGx7Yvvc2K+vGa6WiSJMfisxjgGg74T9Rig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9o0T8rw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9o0T8rw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717402556; x=1748938556;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SDdvnt4it1OQ/NPqIFSDE72B/MAQQRXI2ekEZpvG0OQ=;
  b=T9o0T8rwkrKGhT+vFVXN6pJKtTkrkkUxJe5MmpJgXXqXNTERHasa35ok
   UeY7dOWwd/olIOIF7uJh54ijFtA1+XFCGRROyv72GATdwyoJLQu1T6k/I
   gGFSPEA8TdZ6Exgnhx721NYganaYjzT/qh5PWcV8CW+OLkQkIRlyyA00j
   PFLoQGpJMPq7/SAMtUDEjvaaCGb1HbyYNZ/YexFKGZaNG80JmIebdz6We
   DCor60yRNsRaG0/nZ0cXtN4pxkNxNA1aOS2Gv+Hg3sBVcFyinWhBKqYnU
   NBnG2QnHgNcEPf3jMLRkhvHZAEJ73Nz1DnQeO4lCKLMnL73YeW8TQI8MT
   Q==;
X-CSE-ConnectionGUID: IolFXatiTLy3anaFXvH9xQ==
X-CSE-MsgGUID: reahQOuXQi6s83gnsaoFiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13695853"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="13695853"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:15:55 -0700
X-CSE-ConnectionGUID: AmdjkPk1SCqpS0lzAt1zRw==
X-CSE-MsgGUID: +5CCoCFUT2+8UR0lSvOdxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36889024"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jun 2024 01:15:52 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE2qt-000LC9-1P;
	Mon, 03 Jun 2024 08:15:40 +0000
Date: Mon, 3 Jun 2024 16:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] can: m_can: don't enable transceiver when probing
Message-ID: <202406031513.ByfTbHww-lkp@intel.com>
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
In-Reply-To: <20240530105801.3930087-1-martin@geanix.com>
References: <20240530105801.3930087-1-martin@geanix.com>
TO: "Martin Hundebøll" <martin@geanix.com>
TO: Chandrasekar Ramakrishnan <rcsekar@samsung.com>
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: "Markus Schneider-Pargmann" <msp@baylibre.com>
CC: "Martin Hundebøll" <martin@geanix.com>
CC: linux-can@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Martin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkl-can-next/testing]
[also build test WARNING on linus/master v6.10-rc2 next-20240603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Hundeb-ll/can-m_can-don-t-enable-transceiver-when-probing/20240530-185906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git testing
patch link:    https://lore.kernel.org/r/20240530105801.3930087-1-martin%40geanix.com
patch subject: [PATCH v3] can: m_can: don't enable transceiver when probing
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-r081-20240603 (https://download.01.org/0day-ci/archive/20240603/202406031513.ByfTbHww-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406031513.ByfTbHww-lkp@intel.com/

New smatch warnings:
drivers/net/can/m_can/m_can.c:1725 m_can_dev_setup() error: uninitialized symbol 'err'.

Old smatch warnings:
drivers/net/can/m_can/m_can.c:2075 m_can_open() warn: 'dev->irq' from request_threaded_irq() not released on lines: 2075.
drivers/net/can/m_can/m_can.c:2075 m_can_open() warn: 'dev->irq' from request_irq() not released on lines: 2075.

vim +/err +1725 drivers/net/can/m_can/m_can.c

b03cfc5bb0e11f Mario Huettel     2017-04-08  1670  
3b464affd89821 Marc Kleine-Budde 2020-12-12  1671  static int m_can_dev_setup(struct m_can_classdev *cdev)
e0d1f4816f2a7e Dong Aisheng      2014-07-16  1672  {
3b464affd89821 Marc Kleine-Budde 2020-12-12  1673  	struct net_device *dev = cdev->net;
e96c73eab56aed Martin Hundebøll  2024-05-30  1674  	int m_can_version, err, niso;
e0d1f4816f2a7e Dong Aisheng      2014-07-16  1675  
3b464affd89821 Marc Kleine-Budde 2020-12-12  1676  	m_can_version = m_can_check_core_release(cdev);
b03cfc5bb0e11f Mario Huettel     2017-04-08  1677  	/* return if unsupported version */
b03cfc5bb0e11f Mario Huettel     2017-04-08  1678  	if (!m_can_version) {
3b464affd89821 Marc Kleine-Budde 2020-12-12  1679  		dev_err(cdev->dev, "Unsupported version number: %2d",
5e520edd91f0cd Faiz Abbas        2018-01-16  1680  			m_can_version);
5e520edd91f0cd Faiz Abbas        2018-01-16  1681  		return -EINVAL;
b03cfc5bb0e11f Mario Huettel     2017-04-08  1682  	}
b03cfc5bb0e11f Mario Huettel     2017-04-08  1683  
3b464affd89821 Marc Kleine-Budde 2020-12-12  1684  	if (!cdev->is_peripheral)
b48b89f9c189d2 Jakub Kicinski    2022-09-27  1685  		netif_napi_add(dev, &cdev->napi, m_can_poll);
e0d1f4816f2a7e Dong Aisheng      2014-07-16  1686  
b03cfc5bb0e11f Mario Huettel     2017-04-08  1687  	/* Shared properties of all M_CAN versions */
3b464affd89821 Marc Kleine-Budde 2020-12-12  1688  	cdev->version = m_can_version;
3b464affd89821 Marc Kleine-Budde 2020-12-12  1689  	cdev->can.do_set_mode = m_can_set_mode;
3b464affd89821 Marc Kleine-Budde 2020-12-12  1690  	cdev->can.do_get_berr_counter = m_can_get_berr_counter;
6cfda7fbebe8a4 Oliver Hartkopp   2015-01-05  1691  
b03cfc5bb0e11f Mario Huettel     2017-04-08  1692  	/* Set M_CAN supported operations */
3b464affd89821 Marc Kleine-Budde 2020-12-12  1693  	cdev->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK |
e0d1f4816f2a7e Dong Aisheng      2014-07-16  1694  		CAN_CTRLMODE_LISTENONLY |
80646733f11c2e Dong Aisheng      2014-11-18  1695  		CAN_CTRLMODE_BERR_REPORTING |
fb7d6a81c22017 Pankaj Sharma     2019-10-21  1696  		CAN_CTRLMODE_FD |
fb7d6a81c22017 Pankaj Sharma     2019-10-21  1697  		CAN_CTRLMODE_ONE_SHOT;
e0d1f4816f2a7e Dong Aisheng      2014-07-16  1698  
b03cfc5bb0e11f Mario Huettel     2017-04-08  1699  	/* Set properties depending on M_CAN version */
3b464affd89821 Marc Kleine-Budde 2020-12-12  1700  	switch (cdev->version) {
b03cfc5bb0e11f Mario Huettel     2017-04-08  1701  	case 30:
b03cfc5bb0e11f Mario Huettel     2017-04-08  1702  		/* CAN_CTRLMODE_FD_NON_ISO is fixed with M_CAN IP v3.0.x */
7d4a101c0bd3c6 Vincent Mailhol   2021-12-14  1703  		err = can_set_static_ctrlmode(dev, CAN_CTRLMODE_FD_NON_ISO);
7d4a101c0bd3c6 Vincent Mailhol   2021-12-14  1704  		if (err)
7d4a101c0bd3c6 Vincent Mailhol   2021-12-14  1705  			return err;
d6da7881020f9b Jarkko Nikula     2022-05-12  1706  		cdev->can.bittiming_const = &m_can_bittiming_const_30X;
d6da7881020f9b Jarkko Nikula     2022-05-12  1707  		cdev->can.data_bittiming_const = &m_can_data_bittiming_const_30X;
b03cfc5bb0e11f Mario Huettel     2017-04-08  1708  		break;
b03cfc5bb0e11f Mario Huettel     2017-04-08  1709  	case 31:
b03cfc5bb0e11f Mario Huettel     2017-04-08  1710  		/* CAN_CTRLMODE_FD_NON_ISO is fixed with M_CAN IP v3.1.x */
7d4a101c0bd3c6 Vincent Mailhol   2021-12-14  1711  		err = can_set_static_ctrlmode(dev, CAN_CTRLMODE_FD_NON_ISO);
7d4a101c0bd3c6 Vincent Mailhol   2021-12-14  1712  		if (err)
7d4a101c0bd3c6 Vincent Mailhol   2021-12-14  1713  			return err;
d6da7881020f9b Jarkko Nikula     2022-05-12  1714  		cdev->can.bittiming_const = &m_can_bittiming_const_31X;
d6da7881020f9b Jarkko Nikula     2022-05-12  1715  		cdev->can.data_bittiming_const = &m_can_data_bittiming_const_31X;
b03cfc5bb0e11f Mario Huettel     2017-04-08  1716  		break;
b03cfc5bb0e11f Mario Huettel     2017-04-08  1717  	case 32:
5c7d55bded77da Pankaj Sharma     2020-11-26  1718  	case 33:
5c7d55bded77da Pankaj Sharma     2020-11-26  1719  		/* Support both MCAN version v3.2.x and v3.3.0 */
d6da7881020f9b Jarkko Nikula     2022-05-12  1720  		cdev->can.bittiming_const = &m_can_bittiming_const_31X;
d6da7881020f9b Jarkko Nikula     2022-05-12  1721  		cdev->can.data_bittiming_const = &m_can_data_bittiming_const_31X;
f524f829b75a7d Dan Murphy        2019-05-09  1722  
e96c73eab56aed Martin Hundebøll  2024-05-30  1723  		niso = m_can_niso_supported(cdev);
e96c73eab56aed Martin Hundebøll  2024-05-30  1724  		if (niso < 0)
e96c73eab56aed Martin Hundebøll  2024-05-30 @1725  			return err;
e96c73eab56aed Martin Hundebøll  2024-05-30  1726  		if (niso)
e96c73eab56aed Martin Hundebøll  2024-05-30  1727  			cdev->can.ctrlmode_supported |= CAN_CTRLMODE_FD_NON_ISO;
b03cfc5bb0e11f Mario Huettel     2017-04-08  1728  		break;
b03cfc5bb0e11f Mario Huettel     2017-04-08  1729  	default:
3b464affd89821 Marc Kleine-Budde 2020-12-12  1730  		dev_err(cdev->dev, "Unsupported version number: %2d",
3b464affd89821 Marc Kleine-Budde 2020-12-12  1731  			cdev->version);
5e520edd91f0cd Faiz Abbas        2018-01-16  1732  		return -EINVAL;
b03cfc5bb0e11f Mario Huettel     2017-04-08  1733  	}
b03cfc5bb0e11f Mario Huettel     2017-04-08  1734  
e96c73eab56aed Martin Hundebøll  2024-05-30  1735  	/* Forcing standby mode should be redunant, as the chip should be in
e96c73eab56aed Martin Hundebøll  2024-05-30  1736  	 * standby after a reset. Write the INIT bit anyways, should the chip
e96c73eab56aed Martin Hundebøll  2024-05-30  1737  	 * be configured by previous stage.
e96c73eab56aed Martin Hundebøll  2024-05-30  1738  	 */
e96c73eab56aed Martin Hundebøll  2024-05-30  1739  	return m_can_cccr_update_bits(cdev, CCCR_INIT, CCCR_INIT);
e0d1f4816f2a7e Dong Aisheng      2014-07-16  1740  }
e0d1f4816f2a7e Dong Aisheng      2014-07-16  1741  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
