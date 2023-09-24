Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC7D26E
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Sep 2023 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695566179; x=1727102179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPvvSYuRKFgRYojJ3MuypGqeVsakfGBKT7DY59vrScM=;
  b=TvVItHyg/Og3BNUNUivvnqZQlCJoxitBl5KcNXkzlIJMYXX0cnHsRWbW
   CSaUeUET31iH65I23xa/RkEdm5WcSmZa9NQ7wDutGFKas8ZH8FrL8OStr
   1GbuaugMj7jkdwvd28aNXZjGZEckR4JJ4HPNBxppv6tNlsYVL8U9D1+o+
   nmwgynsfYXBOAVlgEZQ3ZOXtVrdGRZCfxaNRwVPqPZJXKxTL0PRE4NBmY
   IQ3lBy1UJvpSt9MIYYwYEh6heR01rbO4FDFie7x8FQIxXE+im8w1wNK1Z
   wSgYq3ti2+Xl0OPep5wFboGbYgyYz1L3owmTQTzIW83sHGwJltD49xJ5D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371419357"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="371419357"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 07:36:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="724714994"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="724714994"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Sep 2023 07:36:17 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkQDW-0003m9-23;
	Sun, 24 Sep 2023 14:36:14 +0000
Date: Sun, 24 Sep 2023 22:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 893/1370]
 drivers/mtd/spi-nor/core.c:1862 spi_nor_read() warn: possible memory leak of
 'readbuf'
Message-ID: <202309242242.TrcXYJpQ-lkp@intel.com>
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
CC: git@amd.com
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 8a6272094c8daba59954d3f7ce6e43b04a56bcbb [893/1370] mtd: spi-nor: Add parallel memories support in spi-nor
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20230924 (https://download.01.org/0day-ci/archive/20230924/202309242242.TrcXYJpQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309242242.TrcXYJpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309242242.TrcXYJpQ-lkp@intel.com/

New smatch warnings:
drivers/mtd/spi-nor/core.c:1862 spi_nor_read() warn: possible memory leak of 'readbuf'

Old smatch warnings:
drivers/mtd/spi-nor/core.c:3063 spi_nor_quad_enable() error: uninitialized symbol 'err'.

vim +/readbuf +1862 drivers/mtd/spi-nor/core.c

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1820  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1821  static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1822  			size_t *retlen, u_char *buf)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1823  {
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1824  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1825  	struct spi_nor_flash_parameter *params;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1826  	ssize_t ret, read_len;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1827  	u32 cur_cs_num = 0;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1828  	u_char *readbuf;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1829  	bool is_ofst_odd = false;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1830  	u64 sz = 0;
3d20dfdb2efb3f drivers/mtd/spi-nor/core.c    Michal Simek         2023-01-19  1831  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1832  	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1833  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1834  	params = spi_nor_get_params(nor, 0);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1835  	sz = params->size;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1836  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1837  	/*
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1838  	 * Cannot read from odd offset in parallel mode, so read
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1839  	 * len + 1 from offset + 1 and ignore offset[0] data.
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1840  	 */
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1841  	if ((nor->flags & SNOR_F_HAS_PARALLEL) && (from & 0x01)) {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1842  		from = (loff_t)(from - 1);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1843  		len = (size_t)(len + 1);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1844  		is_ofst_odd = true;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1845  		readbuf = kmalloc(len, GFP_KERNEL);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1846  		if (!readbuf)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1847  			return -ENOMEM;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1848  	} else {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1849  		readbuf = buf;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1850  	}
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1851  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1852  	if (!(nor->flags & SNOR_F_HAS_PARALLEL)) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1853  		/* Determine the flash from which the operation need to start */
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1854  		while ((cur_cs_num < SNOR_FLASH_CNT_MAX) && (from > sz - 1) && params) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1855  			cur_cs_num++;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1856  			params = spi_nor_get_params(nor, cur_cs_num);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1857  			sz += params->size;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1858  		}
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1859  	}
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1860  	ret = spi_nor_lock_and_prep(nor);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1861  	if (ret)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18 @1862  		return ret;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1863  
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1864  	while (len) {
3d20dfdb2efb3f drivers/mtd/spi-nor/core.c    Michal Simek         2023-01-19  1865  		loff_t addr = from;
933c6de1167e55 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-11-11  1866  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1867  		if (nor->flags & SNOR_F_HAS_PARALLEL) {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1868  			nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1869  			read_len = len;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1870  			addr /= 2;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1871  		} else {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1872  			nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1873  			read_len = (len > (sz - addr)) ? (sz - addr) : len;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1874  			params = spi_nor_get_params(nor, cur_cs_num);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1875  			addr -= (sz - params->size);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1876  		}
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1877  
3d20dfdb2efb3f drivers/mtd/spi-nor/core.c    Michal Simek         2023-01-19  1878  		addr = spi_nor_convert_addr(nor, addr);
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-02  1879  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1880  		ret = spi_nor_read_data(nor, addr, read_len, readbuf);
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1881  		if (ret == 0) {
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1882  			/* We shouldn't see 0-length reads */
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1883  			ret = -EIO;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1884  			goto read_err;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1885  		}
59451e1233bd31 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1886  		if (ret < 0)
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1887  			goto read_err;
59451e1233bd31 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1888  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1889  		WARN_ON(ret > read_len);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1890  		if (is_ofst_odd) {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1891  			/*
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1892  			 * Cannot read from odd offset in parallel mode.
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1893  			 * So read len + 1 from offset + 1 from the flash
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1894  			 * and copy len data from readbuf[1].
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1895  			 */
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1896  			memcpy(buf, (readbuf + 1), (len - 1));
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1897  			*retlen += (ret - 1);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1898  		} else {
2dd087b16946cf drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1899  			*retlen += ret;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1900  		}
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1901  		buf += ret;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1902  		if (!is_ofst_odd)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1903  			readbuf += ret;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1904  		from += ret;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1905  		len -= ret;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1906  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1907  		/*
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1908  		 * Flash cross over condition in stacked mode.
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1909  		 *
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1910  		 */
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1911  		if ((nor->flags & SNOR_F_HAS_STACKED) && (from > sz - 1)) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1912  			cur_cs_num++;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1913  			params = spi_nor_get_params(nor, cur_cs_num);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1914  			sz += params->size;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1915  		}
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1916  
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1917  	}
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1918  	ret = 0;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1919  
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1920  read_err:
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1921  	if (is_ofst_odd)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1922  		kfree(readbuf);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  1923  
52bbd2dcb42c21 drivers/mtd/spi-nor/spi-nor.c Michael Walle        2020-01-13  1924  	spi_nor_unlock_and_unprep(nor);
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  1925  	return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1926  }
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1927  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
