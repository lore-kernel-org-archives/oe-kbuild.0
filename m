Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6743621322F
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 22:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764453758; cv=none; b=RDBOyZWvi4W6xCOQ81VA0QgGNR6Padth7zll++lyX8qctHLV78p4uk/WmQVnYEfBYBJoMGqryT1E5TWksL5e0XzjHhiyQG9XUlcZ2Cdc31ohxfEAFlnpSzV1SpOHOB7Mxjcto3hd5WdITcuMOW3j/bc1W4Zl23pPgizCrRsx4cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764453758; c=relaxed/simple;
	bh=OFpaCFwSfwjI5h/o0wi41+mF4HrRrXjB04NcHjE0q+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GoUO93Ek8t5dtF/8hn4Q+I+9e1qdldadx2IEo2uUYeALf+KHb8RArqzsWeRlR2zt2Pvn3hMvdrT+HWM+wKMgEqg2P7tbPjzl8TIk8ZpQrBv+k3mAdBLwzVKkHHUpZn9YaIHCd6kLNsYuWjWXAt/TbF/VJM6tSlDCwpgY9eBQUhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OW5RrZX8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OW5RrZX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764453756; x=1795989756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OFpaCFwSfwjI5h/o0wi41+mF4HrRrXjB04NcHjE0q+Q=;
  b=OW5RrZX816L2JeszB2GySykTpZTsMiKQzuJge1WYqDhkubSngRBaiC01
   lqIEdyledDfI4Gikis7xzIegrVOcyR7o947Rjy/dqtnhm/UfoiwISFWoa
   QqGluzagI9qRz8/gNRJmgNLhqyHds5rkRFMYV74wdeZzLM3GmtH15Z21C
   MZzWi5cBcc5jDuTy7PaDVhO/gexBDmgk3t5EabL59CsiIeVkkbYqsD36E
   UxFRUX2QfqWhcTzKU4Lxh8adv8mX8tWV4f363msdScTK0E3QZriY+jHPJ
   IilA++tc7uQ8IoLHp67d51EQZ58pZB8gzYMBECwAeS/vpRPtbum5TBR8x
   g==;
X-CSE-ConnectionGUID: 49nbDZCRSbCNaWSWzFystg==
X-CSE-MsgGUID: 2J4u5nahQ/OT64TifgCQbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="76757708"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="76757708"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 14:02:35 -0800
X-CSE-ConnectionGUID: TyeRqyu2Tc6o4US7yCh2bQ==
X-CSE-MsgGUID: PCTO408lQhuI0pKfd8sTbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="192981976"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Nov 2025 14:02:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPT1U-000000007de-0aZh;
	Sat, 29 Nov 2025 22:02:32 +0000
Date: Sun, 30 Nov 2025 06:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/atheros/ag71xx.c:1316 ag71xx_rings_init() warn:
 potentially one past the end of array 'tx->buf[tx_size]'
Message-ID: <202511300551.AJT4hYH1-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   19eef1d98eeda3745df35839190b7d4a4adea656
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-r072-20251129 (https://download.01.org/0day-ci/archive/20251130/202511300551.AJT4hYH1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511300551.AJT4hYH1-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/atheros/ag71xx.c:1316 ag71xx_rings_init() warn: potentially one past the end of array 'tx->buf[tx_size]'

Old smatch warnings:
drivers/net/ethernet/atheros/ag71xx.c:1926 ag71xx_probe() warn: argument 3 to %08lx specifier is cast from pointer

vim +1316 drivers/net/ethernet/atheros/ag71xx.c

d51b6ce441d356 Oleksij Rempel     2019-05-24  1293  
d51b6ce441d356 Oleksij Rempel     2019-05-24  1294  static int ag71xx_rings_init(struct ag71xx *ag)
d51b6ce441d356 Oleksij Rempel     2019-05-24  1295  {
d51b6ce441d356 Oleksij Rempel     2019-05-24  1296  	struct ag71xx_ring *tx = &ag->tx_ring;
d51b6ce441d356 Oleksij Rempel     2019-05-24  1297  	struct ag71xx_ring *rx = &ag->rx_ring;
d51b6ce441d356 Oleksij Rempel     2019-05-24  1298  	int ring_size, tx_size;
d51b6ce441d356 Oleksij Rempel     2019-05-24  1299  
d51b6ce441d356 Oleksij Rempel     2019-05-24  1300  	ring_size = BIT(tx->order) + BIT(rx->order);
d51b6ce441d356 Oleksij Rempel     2019-05-24  1301  	tx_size = BIT(tx->order);
d51b6ce441d356 Oleksij Rempel     2019-05-24  1302  
d51b6ce441d356 Oleksij Rempel     2019-05-24  1303  	tx->buf = kcalloc(ring_size, sizeof(*tx->buf), GFP_KERNEL);
d51b6ce441d356 Oleksij Rempel     2019-05-24  1304  	if (!tx->buf)
d51b6ce441d356 Oleksij Rempel     2019-05-24  1305  		return -ENOMEM;
d51b6ce441d356 Oleksij Rempel     2019-05-24  1306  
d51b6ce441d356 Oleksij Rempel     2019-05-24  1307  	tx->descs_cpu = dma_alloc_coherent(&ag->pdev->dev,
d51b6ce441d356 Oleksij Rempel     2019-05-24  1308  					   ring_size * AG71XX_DESC_SIZE,
246902bdf562d4 Christophe JAILLET 2019-07-31  1309  					   &tx->descs_dma, GFP_KERNEL);
d51b6ce441d356 Oleksij Rempel     2019-05-24  1310  	if (!tx->descs_cpu) {
d51b6ce441d356 Oleksij Rempel     2019-05-24  1311  		kfree(tx->buf);
d51b6ce441d356 Oleksij Rempel     2019-05-24  1312  		tx->buf = NULL;
d51b6ce441d356 Oleksij Rempel     2019-05-24  1313  		return -ENOMEM;
d51b6ce441d356 Oleksij Rempel     2019-05-24  1314  	}
d51b6ce441d356 Oleksij Rempel     2019-05-24  1315  
a9d41e7b8b1fe4 Christophe JAILLET 2019-07-31 @1316  	rx->buf = &tx->buf[tx_size];
d51b6ce441d356 Oleksij Rempel     2019-05-24  1317  	rx->descs_cpu = ((void *)tx->descs_cpu) + tx_size * AG71XX_DESC_SIZE;
d51b6ce441d356 Oleksij Rempel     2019-05-24  1318  	rx->descs_dma = tx->descs_dma + tx_size * AG71XX_DESC_SIZE;
d51b6ce441d356 Oleksij Rempel     2019-05-24  1319  
d51b6ce441d356 Oleksij Rempel     2019-05-24  1320  	ag71xx_ring_tx_init(ag);
d51b6ce441d356 Oleksij Rempel     2019-05-24  1321  	return ag71xx_ring_rx_init(ag);
d51b6ce441d356 Oleksij Rempel     2019-05-24  1322  }
d51b6ce441d356 Oleksij Rempel     2019-05-24  1323  

:::::: The code at line 1316 was first introduced by commit
:::::: a9d41e7b8b1fe43c0beeab9a45d4c886a5e4ee85 net: ag71xx: Slighly simplify code in 'ag71xx_rings_init()'

:::::: TO: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
