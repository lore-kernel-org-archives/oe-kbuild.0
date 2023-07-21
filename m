Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59191363
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jul 2023 00:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689900558; x=1721436558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qndLTS59ZUVswUSuGMXsRD3d1ccPvRlvFvBBtnVxSLg=;
  b=LU3jQWCZwUtMUPMwwYys46Zg5pfVBAKZJ/0VQKRIajoXaD+U371iku0+
   EvzQEOsGyRNn9OmvP7SHTfrA/iKng5ly7RU5U6Ih8IGMMQAcFuzZS8GjR
   xcCRSF5uVk4+sxrXPjcPQphzrdUdNF/GUNL+xqR1JDb6yz62DcRyjBvlL
   BKktY87uOpzJdY/J8bDindtRr+wAWteeZLZasDr4yGM8dBhDyi/yFj3nP
   RfpYiFqa8iXIPxEo5Zi958SXBvMK0H5hlFXIUbkLL3xdkNdeTLhx5OQ5k
   jrDBNRjQzTJ/dTmaLISP4Uqm2NDTfHClBWpE0FmIU32tVz9OBnGI+8UlA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="347206236"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="347206236"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 17:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="718638436"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="718638436"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Jul 2023 17:49:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMeKZ-0006gj-0J;
	Fri, 21 Jul 2023 00:49:15 +0000
Date: Fri, 21 Jul 2023 08:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1587/3762]
 drivers/input/touchscreen/iqs7211.c:1761 iqs7211_parse_cycles() error:
 buffer overflow 'cycle_alloc[0]' 2 <= 41
Message-ID: <202307210856.QWF4tj40-lkp@intel.com>
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
TO: Jeff LaBundy <jeff@labundy.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c58c49dd89324b18a812762a2bfa5a0458e4f252
commit: f2ba47e65f3b5642488802a60cb7dd068f425edc [1587/3762] Input: add support for Azoteq IQS7210A/7211A/E
:::::: branch date: 20 hours ago
:::::: commit date: 8 days ago
config: parisc-randconfig-m041-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210856.QWF4tj40-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210856.QWF4tj40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307210856.QWF4tj40-lkp@intel.com/

smatch warnings:
drivers/input/touchscreen/iqs7211.c:1761 iqs7211_parse_cycles() error: buffer overflow 'cycle_alloc[0]' 2 <= 41
drivers/input/touchscreen/iqs7211.c:1761 iqs7211_parse_cycles() error: buffer overflow 'cycle_alloc[0]' 2 <= 41

vim +1761 drivers/input/touchscreen/iqs7211.c

f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1748  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1749  static int iqs7211_parse_cycles(struct iqs7211_private *iqs7211,
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1750  				struct fwnode_handle *tp_node)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1751  {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1752  	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1753  	struct i2c_client *client = iqs7211->client;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1754  	int num_cycles = dev_desc->cycle_limit[0] + dev_desc->cycle_limit[1];
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1755  	int error, count, i, j, k, cycle_start;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1756  	unsigned int cycle_alloc[IQS7211_MAX_CYCLES][2];
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1757  	u8 total_rx = iqs7211->tp_config.total_rx;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1758  	u8 total_tx = iqs7211->tp_config.total_tx;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1759  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1760  	for (i = 0; i < IQS7211_MAX_CYCLES * 2; i++)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29 @1761  		*(cycle_alloc[0] + i) = U8_MAX;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1762  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1763  	count = fwnode_property_count_u32(tp_node, "azoteq,channel-select");
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1764  	if (count == -EINVAL) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1765  		/*
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1766  		 * Assign each sensing cycle's slots (0 and 1) to a channel,
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1767  		 * defined as the intersection between two CRx and CTx pins.
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1768  		 * A channel assignment of 255 means the slot is unused.
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1769  		 */
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1770  		for (i = 0, cycle_start = 0; i < total_tx; i++) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1771  			int cycle_stop = 0;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1772  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1773  			for (j = 0; j < total_rx; j++) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1774  				/*
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1775  				 * Channels formed by CRx0-3 and CRx4-7 are
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1776  				 * bound to slots 0 and 1, respectively.
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1777  				 */
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1778  				int slot = iqs7211->rx_tx_map[j] < 4 ? 0 : 1;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1779  				int chan = i * total_rx + j;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1780  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1781  				for (k = cycle_start; k < num_cycles; k++) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1782  					if (cycle_alloc[k][slot] < U8_MAX)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1783  						continue;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1784  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1785  					cycle_alloc[k][slot] = chan;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1786  					break;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1787  				}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1788  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1789  				if (k < num_cycles) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1790  					cycle_stop = max(k, cycle_stop);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1791  					continue;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1792  				}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1793  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1794  				dev_err(&client->dev,
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1795  					"Insufficient number of cycles\n");
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1796  				return -EINVAL;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1797  			}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1798  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1799  			/*
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1800  			 * Sensing cycles cannot straddle more than one CTx
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1801  			 * pin. As such, the next row's starting cycle must
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1802  			 * be greater than the previous row's highest cycle.
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1803  			 */
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1804  			cycle_start = cycle_stop + 1;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1805  		}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1806  	} else if (count < 0) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1807  		dev_err(&client->dev, "Failed to count channels: %d\n", count);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1808  		return count;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1809  	} else if (count > num_cycles * 2) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1810  		dev_err(&client->dev, "Insufficient number of cycles\n");
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1811  		return -EINVAL;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1812  	} else if (count > 0) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1813  		error = fwnode_property_read_u32_array(tp_node,
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1814  						       "azoteq,channel-select",
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1815  						       cycle_alloc[0], count);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1816  		if (error) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1817  			dev_err(&client->dev, "Failed to read channels: %d\n",
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1818  				error);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1819  			return error;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1820  		}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1821  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1822  		for (i = 0; i < count; i++) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1823  			int chan = *(cycle_alloc[0] + i);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1824  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1825  			if (chan == U8_MAX)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1826  				continue;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1827  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1828  			if (chan >= total_rx * total_tx) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1829  				dev_err(&client->dev, "Invalid channel: %d\n",
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1830  					chan);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1831  				return -EINVAL;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1832  			}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1833  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1834  			for (j = 0; j < count; j++) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1835  				if (j == i || *(cycle_alloc[0] + j) != chan)
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1836  					continue;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1837  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1838  				dev_err(&client->dev, "Duplicate channel: %d\n",
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1839  					chan);
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1840  				return -EINVAL;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1841  			}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1842  		}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1843  	}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1844  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1845  	/*
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1846  	 * Once the raw channel assignments have been derived, they must be
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1847  	 * packed according to the device's register map.
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1848  	 */
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1849  	for (i = 0, cycle_start = 0; i < sizeof(dev_desc->cycle_limit); i++) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1850  		int offs = 0;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1851  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1852  		for (j = cycle_start;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1853  		     j < cycle_start + dev_desc->cycle_limit[i]; j++) {
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1854  			iqs7211->cycle_alloc[i][offs++] = 0x05;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1855  			iqs7211->cycle_alloc[i][offs++] = cycle_alloc[j][0];
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1856  			iqs7211->cycle_alloc[i][offs++] = cycle_alloc[j][1];
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1857  		}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1858  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1859  		cycle_start += dev_desc->cycle_limit[i];
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1860  	}
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1861  
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1862  	return 0;
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1863  }
f2ba47e65f3b56 Jeff LaBundy 2023-05-29  1864  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
