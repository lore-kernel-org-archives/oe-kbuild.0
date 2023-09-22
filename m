Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BCA2770A
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Sep 2023 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695388463; x=1726924463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vZUY2RSyFTHtT3cPpuRU1JTBt/BZuVqgyXIwiw7euG0=;
  b=RScZDhTEJYJ/MCFgp8rneHYDhTvHx0yHXmuixp6hP8DgB8SBBl360sdv
   xpXu/95sG/mHKJPNgiSWInXS4nYLiVp49TLDn3WpA/vFghoW8BDsoU/oM
   iXDJySR42IsRBDgQ6ofpZiFslw5Btm1gf8DK0hvQpW6DcjweM63ptfsY9
   nFTZ/17DCaIyfxc7/gXu3MeGd8Q+9fo3Kf/Vso6pI+RwB/0fJ4nQdQr2A
   qN/RuG9mV5yRG2oN1E6tAPnVWozVxI6xwaVJXPLY/NEPRu033FWKC7EqY
   ipV7vTTtANQjgSbGLrXSaY5jnhfs8fFX13emOM2YcXbYdIiAYsiFhssrV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="361074898"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="361074898"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 06:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750834940"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="750834940"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Sep 2023 06:14:21 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjfz9-0000kP-0S;
	Fri, 22 Sep 2023 13:14:19 +0000
Date: Fri, 22 Sep 2023 21:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next v4 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202309222002.aSjj9A5w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/ethernet/engleder/tsnep_main.c:1547:25: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <fe7e6c542e094bfca655abcd323c1c98@AcuMS.aculab.com>
References: <fe7e6c542e094bfca655abcd323c1c98@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
CC: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
CC: "'Christoph Hellwig'" <hch@infradead.org>
CC: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.6-rc2]
[cannot apply to next-20230918 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-umin-a-b-and-umax-a-b/20230918-162441
base:   linux/master
patch link:    https://lore.kernel.org/r/fe7e6c542e094bfca655abcd323c1c98%40AcuMS.aculab.com
patch subject: [PATCH next v4 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-122-20230922 (https://download.01.org/0day-ci/archive/20230922/202309222002.aSjj9A5w-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309222002.aSjj9A5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309222002.aSjj9A5w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/engleder/tsnep_main.c:1547:25: sparse: sparse: too long token expansion

vim +1547 drivers/net/ethernet/engleder/tsnep_main.c

403f69bbdbadb2 Gerhard Engleder 2021-11-19  1457  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1458  static int tsnep_rx_poll_zc(struct tsnep_rx *rx, struct napi_struct *napi,
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1459  			    int budget)
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1460  {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1461  	struct tsnep_rx_entry *entry;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1462  	struct netdev_queue *tx_nq;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1463  	struct bpf_prog *prog;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1464  	struct tsnep_tx *tx;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1465  	int desc_available;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1466  	int xdp_status = 0;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1467  	struct page *page;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1468  	int done = 0;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1469  	int length;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1470  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1471  	desc_available = tsnep_rx_desc_available(rx);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1472  	prog = READ_ONCE(rx->adapter->xdp_prog);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1473  	if (prog) {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1474  		tx_nq = netdev_get_tx_queue(rx->adapter->netdev,
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1475  					    rx->tx_queue_index);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1476  		tx = &rx->adapter->tx[rx->tx_queue_index];
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1477  	}
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1478  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1479  	while (likely(done < budget) && (rx->read != rx->write)) {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1480  		entry = &rx->entry[rx->read];
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1481  		if ((__le32_to_cpu(entry->desc_wb->properties) &
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1482  		     TSNEP_DESC_OWNER_COUNTER_MASK) !=
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1483  		    (entry->properties & TSNEP_DESC_OWNER_COUNTER_MASK))
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1484  			break;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1485  		done++;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1486  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1487  		if (desc_available >= TSNEP_RING_RX_REFILL) {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1488  			bool reuse = desc_available >= TSNEP_RING_RX_REUSE;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1489  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1490  			desc_available -= tsnep_rx_refill_zc(rx, desc_available,
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1491  							     reuse);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1492  			if (!entry->xdp) {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1493  				/* buffer has been reused for refill to prevent
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1494  				 * empty RX ring, thus buffer cannot be used for
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1495  				 * RX processing
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1496  				 */
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1497  				rx->read = (rx->read + 1) & TSNEP_RING_MASK;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1498  				desc_available++;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1499  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1500  				rx->dropped++;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1501  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1502  				continue;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1503  			}
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1504  		}
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1505  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1506  		/* descriptor properties shall be read first, because valid data
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1507  		 * is signaled there
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1508  		 */
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1509  		dma_rmb();
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1510  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1511  		prefetch(entry->xdp->data);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1512  		length = __le32_to_cpu(entry->desc_wb->properties) &
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1513  			 TSNEP_DESC_LENGTH_MASK;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1514  		xsk_buff_set_size(entry->xdp, length);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1515  		xsk_buff_dma_sync_for_cpu(entry->xdp, rx->xsk_pool);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1516  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1517  		/* RX metadata with timestamps is in front of actual data,
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1518  		 * subtract metadata size to get length of actual data and
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1519  		 * consider metadata size as offset of actual data during RX
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1520  		 * processing
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1521  		 */
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1522  		length -= TSNEP_RX_INLINE_METADATA_SIZE;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1523  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1524  		rx->read = (rx->read + 1) & TSNEP_RING_MASK;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1525  		desc_available++;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1526  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1527  		if (prog) {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1528  			bool consume;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1529  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1530  			entry->xdp->data += TSNEP_RX_INLINE_METADATA_SIZE;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1531  			entry->xdp->data_meta += TSNEP_RX_INLINE_METADATA_SIZE;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1532  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1533  			consume = tsnep_xdp_run_prog_zc(rx, prog, entry->xdp,
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1534  							&xdp_status, tx_nq, tx);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1535  			if (consume) {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1536  				rx->packets++;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1537  				rx->bytes += length;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1538  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1539  				entry->xdp = NULL;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1540  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1541  				continue;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1542  			}
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1543  		}
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1544  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1545  		page = page_pool_dev_alloc_pages(rx->page_pool);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1546  		if (page) {
3fc2333933fdf1 Gerhard Engleder 2023-04-21 @1547  			memcpy(page_address(page) + TSNEP_RX_OFFSET,
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1548  			       entry->xdp->data - TSNEP_RX_INLINE_METADATA_SIZE,
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1549  			       length + TSNEP_RX_INLINE_METADATA_SIZE);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1550  			tsnep_rx_page(rx, napi, page, length);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1551  		} else {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1552  			rx->dropped++;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1553  		}
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1554  		xsk_buff_free(entry->xdp);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1555  		entry->xdp = NULL;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1556  	}
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1557  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1558  	if (xdp_status)
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1559  		tsnep_finalize_xdp(rx->adapter, xdp_status, tx_nq, tx);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1560  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1561  	if (desc_available)
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1562  		desc_available -= tsnep_rx_refill_zc(rx, desc_available, false);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1563  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1564  	if (xsk_uses_need_wakeup(rx->xsk_pool)) {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1565  		if (desc_available)
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1566  			xsk_set_rx_need_wakeup(rx->xsk_pool);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1567  		else
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1568  			xsk_clear_rx_need_wakeup(rx->xsk_pool);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1569  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1570  		return done;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1571  	}
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1572  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1573  	return desc_available ? budget : done;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1574  }
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1575  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
