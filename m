Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449877;
	b=K/JRaz3say/bvZzsVQV3RmXHyLuPJFDvjaDk66WMnnIBMVWcug1261h+4zdyQa6SCmh9
	 l01BwKwNinrEZxUtA9ZDo8azId7ExK6pMSZm9jNY0C518AoYKY0HcCO6xU7yTnlmyfYQ4
	 jD9JWnsLY9d8EHZB63hNGkjbNhw5BYWesj5JKaIQXtdL4/2+aP2yXMx1/c7rGUQFFp/Zq
	 Z/k0EIbv4uehGZeMZjonjWyiRs68u7Bid+Bcwohc/hCZuVqVDTwpLDhsMiOxy6sLR56Ab
	 wvTtvVUJPeZtNKwNJMbpVNNwmrwXy88vRxwbyCXRyZFiWhl52xH7cafeikJgFeBKWEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449877;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FzvTuRKboReHCjHOu4eSc2s92jtZlPjh9bWVYvwoU3A=;
	b=IUUkrj5zIpEVKXHkMrwN2zkl4bqrA5Z6V3waqfh0qgu4U25KVIxClTfROf2NUAvUE840
	 5/VatyX/jFqYizv+9N3pFIBz0uicxqhr8zwj1d0z2pPiaH0U19MTFm7hL2ZzB5NyBhZBP
	 7YC+HF8GVRBTb7xsKurf+zZTc0L101omfAoAMlKq6Yj4DiSzQdtaSyvVzuyfDqsELV2FG
	 1PWeT5JSIvs3T4GjfvpufBPq+XIb8u88iRDIgNt++uLN5vxBNmUzZHmVptGQ8gGQsJQB/
	 ur6yxL4TIi4YUoeEXALbgM5wPv6irmhaNZKD9v9OoSCDsP1PtoAGwKjuhGp2paethyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XU1ICIpD;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEFC606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 12:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAEFC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XU1ICIpD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793449876; x=1824985876;
  h=date:from:to:cc:subject:message-id;
  bh=kCFu/qoOD2I+THOl9cSI8JcaQcyIJMNSUszlyH9isaA=;
  b=XU1ICIpDWcXrUYmrPgds2wbiLjXkSfldFtwkq865NMuk6C5AH4cA0cqT
   XJR7gvT52imLA+r+iS4C1U4hBeJmVzQtkgF1AYxz7ugUWooDDj0B12Z0X
   g3sdL74uVd572VkbeUY+Z6tWyyRx6O0bJxMXRduSG6JMF//xRnFY90twj
   14Cr8mJVXRGtoeacC4cFls4jsPZkWjuox6wP0F1cfJI+sjig/yrhOJ/DE
   hN7OKXoTTndFYmpVZKpVD3tj+IbY7uU5Itj0dCOQTdbiL+CI9EhrtlJyo
   atvw71m/u4NYNpj/K4RtaZjp4WWym/qPukYSV1r00RUh/QEbDWHqzsV5/
   w==;
X-CSE-ConnectionGUID: mHWuVHx6S8azkEoORpqzEw==
X-CSE-MsgGUID: dnD8bdoVTzGJU9lPu/K4Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2091760"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2091760"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 05:31:15 -0700
X-CSE-ConnectionGUID: FTgnMkU7T+GQm1XNpVkbUg==
X-CSE-MsgGUID: EI745nDzT+KwmgPrXKig3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5802493"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2026 05:31:13 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN8Ep-0000000061D-2bO3;
	Sat, 31 Oct 2026 12:31:11 +0000
Date: Sat, 31 Oct 2026 13:30:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/netronome/nfp/nfp_netvf_main.c:296
 nfp_netvf_pci_probe() warn: 'nn->rx_bar' from ioremap() not released on
 lines: 296.
Message-ID: <202610311316.2ncGxfB1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   36aad21d50d1af3f6954bb0c988257a908202477
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce slab: support for compiler-assisted type-based slab cache partitioning
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: alpha-randconfig-r2202-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311316.2ncGxfB1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: feb662d9168b ("slab: support for compiler-assisted type-based slab cache partitioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610311316.2ncGxfB1-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/netronome/nfp/nfp_netvf_main.c:296 nfp_netvf_pci_probe() warn: 'nn->rx_bar' from ioremap() not released on lines: 296.
drivers/net/ethernet/netronome/nfp/nfp_netvf_main.c:296 nfp_netvf_pci_probe() warn: 'nn->tx_bar' from ioremap() not released on lines: 296.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

vim +296 drivers/net/ethernet/netronome/nfp/nfp_netvf_main.c

4c3523623dc0b9 Jakub Kicinski    2015-12-01   76  
4c3523623dc0b9 Jakub Kicinski    2015-12-01   77  static int nfp_netvf_pci_probe(struct pci_dev *pdev,
4c3523623dc0b9 Jakub Kicinski    2015-12-01   78  			       const struct pci_device_id *pci_id)
4c3523623dc0b9 Jakub Kicinski    2015-12-01   79  {
9423d24b7b84b0 Jakub Kicinski    2022-03-11   80  	const struct nfp_dev_info *dev_info;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   81  	struct nfp_net_fw_version fw_ver;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   82  	int max_tx_rings, max_rx_rings;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   83  	u32 tx_bar_off, rx_bar_off;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   84  	u32 tx_bar_sz, rx_bar_sz;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   85  	int tx_bar_no, rx_bar_no;
fdace6c224e9fc Jakub Kicinski    2017-02-09   86  	struct nfp_net_vf *vf;
fdace6c224e9fc Jakub Kicinski    2017-02-09   87  	unsigned int num_irqs;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   88  	u8 __iomem *ctrl_bar;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   89  	struct nfp_net *nn;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   90  	u32 startq;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   91  	int stride;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   92  	int err;
4c3523623dc0b9 Jakub Kicinski    2015-12-01   93  
9423d24b7b84b0 Jakub Kicinski    2022-03-11   94  	dev_info = &nfp_dev_info[pci_id->driver_data];
9423d24b7b84b0 Jakub Kicinski    2022-03-11   95  
bf4afc53b77aea Linus Torvalds    2026-02-21   96  	vf = kzalloc_obj(*vf);
fdace6c224e9fc Jakub Kicinski    2017-02-09   97  	if (!vf)
fdace6c224e9fc Jakub Kicinski    2017-02-09   98  		return -ENOMEM;
fdace6c224e9fc Jakub Kicinski    2017-02-09   99  	pci_set_drvdata(pdev, vf);
fdace6c224e9fc Jakub Kicinski    2017-02-09  100  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  101  	err = pci_enable_device_mem(pdev);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  102  	if (err)
fdace6c224e9fc Jakub Kicinski    2017-02-09  103  		goto err_free_vf;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  104  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  105  	err = pci_request_regions(pdev, nfp_net_driver_name);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  106  	if (err) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  107  		dev_err(&pdev->dev, "Unable to allocate device memory.\n");
4c3523623dc0b9 Jakub Kicinski    2015-12-01  108  		goto err_pci_disable;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  109  	}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  110  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  111  	pci_set_master(pdev);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  112  
9ba1dc994ff56f Jakub Kicinski    2022-03-11  113  	err = dma_set_mask_and_coherent(&pdev->dev, dev_info->dma_mask);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  114  	if (err)
4c3523623dc0b9 Jakub Kicinski    2015-12-01  115  		goto err_pci_regions;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  116  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  117  	/* Map the Control BAR.
4c3523623dc0b9 Jakub Kicinski    2015-12-01  118  	 *
4c3523623dc0b9 Jakub Kicinski    2015-12-01  119  	 * Irrespective of the advertised BAR size we only map the
4c3523623dc0b9 Jakub Kicinski    2015-12-01  120  	 * first NFP_NET_CFG_BAR_SZ of the BAR.  This keeps the code
4c3523623dc0b9 Jakub Kicinski    2015-12-01  121  	 * the identical for PF and VF drivers.
4c3523623dc0b9 Jakub Kicinski    2015-12-01  122  	 */
4bdc0d676a6431 Christoph Hellwig 2020-01-06  123  	ctrl_bar = ioremap(pci_resource_start(pdev, NFP_NET_CTRL_BAR),
4c3523623dc0b9 Jakub Kicinski    2015-12-01  124  				   NFP_NET_CFG_BAR_SZ);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  125  	if (!ctrl_bar) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  126  		dev_err(&pdev->dev,
796312cd00d308 Jakub Kicinski    2016-06-29  127  			"Failed to map resource %d\n", NFP_NET_CTRL_BAR);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  128  		err = -EIO;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  129  		goto err_pci_regions;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  130  	}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  131  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  132  	nfp_net_get_fw_version(&fw_ver, ctrl_bar);
d9e3c29918a80d Jakub Kicinski    2022-03-21  133  	if (fw_ver.extend & NFP_NET_CFG_VERSION_RESERVED_MASK ||
d9e3c29918a80d Jakub Kicinski    2022-03-21  134  	    fw_ver.class != NFP_NET_CFG_VERSION_CLASS_GENERIC) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  135  		dev_err(&pdev->dev, "Unknown Firmware ABI %d.%d.%d.%d\n",
d9e3c29918a80d Jakub Kicinski    2022-03-21  136  			fw_ver.extend, fw_ver.class,
d9e3c29918a80d Jakub Kicinski    2022-03-21  137  			fw_ver.major, fw_ver.minor);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  138  		err = -EINVAL;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  139  		goto err_ctrl_unmap;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  140  	}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  141  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  142  	/* Determine stride */
313b345cbff566 Jakub Kicinski    2016-09-07  143  	if (nfp_net_fw_ver_eq(&fw_ver, 0, 0, 0, 1)) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  144  		stride = 2;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  145  		tx_bar_no = NFP_NET_Q0_BAR;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  146  		rx_bar_no = NFP_NET_Q1_BAR;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  147  		dev_warn(&pdev->dev, "OBSOLETE Firmware detected - VF isolation not available\n");
4c3523623dc0b9 Jakub Kicinski    2015-12-01  148  	} else {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  149  		switch (fw_ver.major) {
f9380629fafcf0 Jakub Kicinski    2017-06-05  150  		case 1 ... 5:
4c3523623dc0b9 Jakub Kicinski    2015-12-01  151  			stride = 4;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  152  			tx_bar_no = NFP_NET_Q0_BAR;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  153  			rx_bar_no = tx_bar_no;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  154  			break;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  155  		default:
4c3523623dc0b9 Jakub Kicinski    2015-12-01  156  			dev_err(&pdev->dev, "Unsupported Firmware ABI %d.%d.%d.%d\n",
d9e3c29918a80d Jakub Kicinski    2022-03-21  157  				fw_ver.extend, fw_ver.class,
4c3523623dc0b9 Jakub Kicinski    2015-12-01  158  				fw_ver.major, fw_ver.minor);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  159  			err = -EINVAL;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  160  			goto err_ctrl_unmap;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  161  		}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  162  	}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  163  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  164  	/* Find out how many rings are supported */
4c3523623dc0b9 Jakub Kicinski    2015-12-01  165  	max_tx_rings = readl(ctrl_bar + NFP_NET_CFG_MAX_TXRINGS);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  166  	max_rx_rings = readl(ctrl_bar + NFP_NET_CFG_MAX_RXRINGS);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  167  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  168  	tx_bar_sz = NFP_QCP_QUEUE_ADDR_SZ * max_tx_rings * stride;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  169  	rx_bar_sz = NFP_QCP_QUEUE_ADDR_SZ * max_rx_rings * stride;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  170  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  171  	/* Sanity checks */
4c3523623dc0b9 Jakub Kicinski    2015-12-01  172  	if (tx_bar_sz > pci_resource_len(pdev, tx_bar_no)) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  173  		dev_err(&pdev->dev,
4c3523623dc0b9 Jakub Kicinski    2015-12-01  174  			"TX BAR too small for number of TX rings. Adjusting\n");
4c3523623dc0b9 Jakub Kicinski    2015-12-01  175  		tx_bar_sz = pci_resource_len(pdev, tx_bar_no);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  176  		max_tx_rings = (tx_bar_sz / NFP_QCP_QUEUE_ADDR_SZ) / 2;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  177  	}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  178  	if (rx_bar_sz > pci_resource_len(pdev, rx_bar_no)) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  179  		dev_err(&pdev->dev,
4c3523623dc0b9 Jakub Kicinski    2015-12-01  180  			"RX BAR too small for number of RX rings. Adjusting\n");
4c3523623dc0b9 Jakub Kicinski    2015-12-01  181  		rx_bar_sz = pci_resource_len(pdev, rx_bar_no);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  182  		max_rx_rings = (rx_bar_sz / NFP_QCP_QUEUE_ADDR_SZ) / 2;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  183  	}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  184  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  185  	startq = readl(ctrl_bar + NFP_NET_CFG_START_TXQ);
e900db704c8512 Jakub Kicinski    2022-03-11  186  	tx_bar_off = nfp_qcp_queue_offset(dev_info, startq);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  187  	startq = readl(ctrl_bar + NFP_NET_CFG_START_RXQ);
e900db704c8512 Jakub Kicinski    2022-03-11  188  	rx_bar_off = nfp_qcp_queue_offset(dev_info, startq);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  189  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  190  	/* Allocate and initialise the netdev */
9423d24b7b84b0 Jakub Kicinski    2022-03-11  191  	nn = nfp_net_alloc(pdev, dev_info, ctrl_bar, true,
9423d24b7b84b0 Jakub Kicinski    2022-03-11  192  			   max_tx_rings, max_rx_rings);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  193  	if (IS_ERR(nn)) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  194  		err = PTR_ERR(nn);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  195  		goto err_ctrl_unmap;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  196  	}
fdace6c224e9fc Jakub Kicinski    2017-02-09  197  	vf->nn = nn;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  198  
79c12a752cea61 Jakub Kicinski    2017-03-10  199  	nn->dp.is_vf = 1;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  200  	nn->stride_tx = stride;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  201  	nn->stride_rx = stride;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  202  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  203  	if (rx_bar_no == tx_bar_no) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  204  		u32 bar_off, bar_sz;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  205  		resource_size_t map_addr;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  206  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  207  		/* Make a single overlapping BAR mapping */
4c3523623dc0b9 Jakub Kicinski    2015-12-01  208  		if (tx_bar_off < rx_bar_off)
4c3523623dc0b9 Jakub Kicinski    2015-12-01  209  			bar_off = tx_bar_off;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  210  		else
4c3523623dc0b9 Jakub Kicinski    2015-12-01  211  			bar_off = rx_bar_off;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  212  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  213  		if ((tx_bar_off + tx_bar_sz) > (rx_bar_off + rx_bar_sz))
4c3523623dc0b9 Jakub Kicinski    2015-12-01  214  			bar_sz = (tx_bar_off + tx_bar_sz) - bar_off;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  215  		else
4c3523623dc0b9 Jakub Kicinski    2015-12-01  216  			bar_sz = (rx_bar_off + rx_bar_sz) - bar_off;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  217  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  218  		map_addr = pci_resource_start(pdev, tx_bar_no) + bar_off;
4bdc0d676a6431 Christoph Hellwig 2020-01-06  219  		vf->q_bar = ioremap(map_addr, bar_sz);
fdace6c224e9fc Jakub Kicinski    2017-02-09  220  		if (!vf->q_bar) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  221  			nn_err(nn, "Failed to map resource %d\n", tx_bar_no);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  222  			err = -EIO;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  223  			goto err_netdev_free;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  224  		}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  225  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  226  		/* TX queues */
fdace6c224e9fc Jakub Kicinski    2017-02-09  227  		nn->tx_bar = vf->q_bar + (tx_bar_off - bar_off);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  228  		/* RX queues */
fdace6c224e9fc Jakub Kicinski    2017-02-09  229  		nn->rx_bar = vf->q_bar + (rx_bar_off - bar_off);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  230  	} else {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  231  		resource_size_t map_addr;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  232  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  233  		/* TX queues */
4c3523623dc0b9 Jakub Kicinski    2015-12-01  234  		map_addr = pci_resource_start(pdev, tx_bar_no) + tx_bar_off;
4bdc0d676a6431 Christoph Hellwig 2020-01-06  235  		nn->tx_bar = ioremap(map_addr, tx_bar_sz);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  236  		if (!nn->tx_bar) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  237  			nn_err(nn, "Failed to map resource %d\n", tx_bar_no);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  238  			err = -EIO;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  239  			goto err_netdev_free;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  240  		}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  241  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  242  		/* RX queues */
4c3523623dc0b9 Jakub Kicinski    2015-12-01  243  		map_addr = pci_resource_start(pdev, rx_bar_no) + rx_bar_off;
4bdc0d676a6431 Christoph Hellwig 2020-01-06  244  		nn->rx_bar = ioremap(map_addr, rx_bar_sz);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  245  		if (!nn->rx_bar) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  246  			nn_err(nn, "Failed to map resource %d\n", rx_bar_no);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  247  			err = -EIO;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  248  			goto err_unmap_tx;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  249  		}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  250  	}
4c3523623dc0b9 Jakub Kicinski    2015-12-01  251  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  252  	nfp_netvf_get_mac_addr(nn);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  253  
fdace6c224e9fc Jakub Kicinski    2017-02-09  254  	num_irqs = nfp_net_irqs_alloc(pdev, vf->irq_entries,
d4e7f0928593ac Jakub Kicinski    2017-05-22  255  				      NFP_NET_MIN_VNIC_IRQS,
79c12a752cea61 Jakub Kicinski    2017-03-10  256  				      NFP_NET_NON_Q_VECTORS +
79c12a752cea61 Jakub Kicinski    2017-03-10  257  				      nn->dp.num_r_vecs);
fdace6c224e9fc Jakub Kicinski    2017-02-09  258  	if (!num_irqs) {
4c3523623dc0b9 Jakub Kicinski    2015-12-01  259  		nn_warn(nn, "Unable to allocate MSI-X Vectors. Exiting\n");
4c3523623dc0b9 Jakub Kicinski    2015-12-01  260  		err = -EIO;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  261  		goto err_unmap_rx;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  262  	}
fdace6c224e9fc Jakub Kicinski    2017-02-09  263  	nfp_net_irqs_assign(nn, vf->irq_entries, num_irqs);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  264  
beba69ca755542 Jakub Kicinski    2017-05-22  265  	err = nfp_net_init(nn);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  266  	if (err)
4c3523623dc0b9 Jakub Kicinski    2015-12-01  267  		goto err_irqs_disable;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  268  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  269  	nfp_net_info(nn);
fdace6c224e9fc Jakub Kicinski    2017-02-09  270  	vf->ddir = nfp_net_debugfs_device_add(pdev);
51c1df83e35ce0 Jakub Kicinski    2018-05-21  271  	nfp_net_debugfs_vnic_add(nn, vf->ddir);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  272  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  273  	return 0;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  274  
4c3523623dc0b9 Jakub Kicinski    2015-12-01  275  err_irqs_disable:
fdace6c224e9fc Jakub Kicinski    2017-02-09  276  	nfp_net_irqs_disable(pdev);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  277  err_unmap_rx:
fdace6c224e9fc Jakub Kicinski    2017-02-09  278  	if (!vf->q_bar)
4c3523623dc0b9 Jakub Kicinski    2015-12-01  279  		iounmap(nn->rx_bar);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  280  err_unmap_tx:
fdace6c224e9fc Jakub Kicinski    2017-02-09  281  	if (!vf->q_bar)
4c3523623dc0b9 Jakub Kicinski    2015-12-01  282  		iounmap(nn->tx_bar);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  283  	else
fdace6c224e9fc Jakub Kicinski    2017-02-09  284  		iounmap(vf->q_bar);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  285  err_netdev_free:
beba69ca755542 Jakub Kicinski    2017-05-22  286  	nfp_net_free(nn);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  287  err_ctrl_unmap:
4c3523623dc0b9 Jakub Kicinski    2015-12-01  288  	iounmap(ctrl_bar);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  289  err_pci_regions:
4c3523623dc0b9 Jakub Kicinski    2015-12-01  290  	pci_release_regions(pdev);
4c3523623dc0b9 Jakub Kicinski    2015-12-01  291  err_pci_disable:
4c3523623dc0b9 Jakub Kicinski    2015-12-01  292  	pci_disable_device(pdev);
fdace6c224e9fc Jakub Kicinski    2017-02-09  293  err_free_vf:
fdace6c224e9fc Jakub Kicinski    2017-02-09  294  	pci_set_drvdata(pdev, NULL);
fdace6c224e9fc Jakub Kicinski    2017-02-09  295  	kfree(vf);
4c3523623dc0b9 Jakub Kicinski    2015-12-01 @296  	return err;
4c3523623dc0b9 Jakub Kicinski    2015-12-01  297  }
4c3523623dc0b9 Jakub Kicinski    2015-12-01  298  

:::::: The code at line 296 was first introduced by commit
:::::: 4c3523623dc0b980158e34b64360603035239a71 net: add driver for Netronome NFP4000/NFP6000 NIC VFs

:::::: TO: Jakub Kicinski <jakub.kicinski@netronome.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
