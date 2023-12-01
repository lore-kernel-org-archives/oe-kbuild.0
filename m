Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB858136
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 20:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l44s3p1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701463867; x=1732999867;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=soABaOF6rcMC4AzFbkw/HaBkWD9+6azHbanRwoSW1hY=;
  b=l44s3p1ZdI3bR6fuDsN2Zr9A3pyhXnEg9ZVZcDUI4qUyTN6iVPFWF8ze
   u90+U8eU1iMRYThMzToo3JRZ8RrWiWEEXBv9RUGSApJTMy6MmwPXndXot
   k2HuH22Wt7GoyUk0sZKh9L2KYblMCR183MaIf2IAbfUlj2DK1YbUdaOV/
   5ZVYp7AwdH9ohcz+f+WwbQf8ZE+0mapdxaSOWngDduL1KcYFSyPboO5rw
   fKKewTLQ1sjd7Ix1KFmzN+fo86h1aT1c05PVhnsgUAEAeX63KjuK80qke
   MEWb7x86WuqJwMaWV3Oqd9noMNwrVhezYROoLwQ++F0Je4ZqgBC1+EUpu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="460042915"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="460042915"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 12:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="840306553"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="840306553"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2023 12:51:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9ATT-0004HO-31;
	Fri, 01 Dec 2023 20:50:59 +0000
Date: Sat, 2 Dec 2023 04:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v11 09/10] mtd: spi-nor: Add parallel memories support in
 spi-nor
Message-ID: <202312020416.3O8KWQHs-lkp@intel.com>
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
In-Reply-To: <20231125092137.2948-10-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-10-amit.kumar-mahapatra@amd.com>
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Hi Amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-linus]
[also build test WARNING on linus/master v6.7-rc3]
[cannot apply to mtd/spi-nor/next lee-mfd/for-mfd-fixes next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Kumar-Mahapatra/ALSA-hda-cs35l56-Use-set-get-APIs-to-access-spi-chip_select/20231125-182341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
patch link:    https://lore.kernel.org/r/20231125092137.2948-10-amit.kumar-mahapatra%40amd.com
patch subject: [PATCH v11 09/10] mtd: spi-nor: Add parallel memories support in spi-nor
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc64-randconfig-r071-20231127 (https://download.01.org/0day-ci/archive/20231202/202312020416.3O8KWQHs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020416.3O8KWQHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312020416.3O8KWQHs-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/core.c:1974 spi_nor_erase() error: uninitialized symbol 'offset'.
drivers/mtd/spi-nor/core.c:3729 spi_nor_restore() error: uninitialized symbol 'ret'.

vim +/offset +1974 drivers/mtd/spi-nor/core.c

5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2018-09-11  1828  
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1829  /*
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1830   * Erase an address range on the nor chip.  The address range may extend
c69942bda5152d7 drivers/mtd/spi-nor/core.c    Jonathan Neuschäfer  2020-11-30  1831   * one or more erase sectors. Return an error if there is a problem erasing.
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1832   */
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1833  static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1834  {
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1835  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1836  	struct spi_nor_flash_parameter *params;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1837  	u32 addr, len, offset, cur_cs_num = 0;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1838  	uint32_t rem;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1839  	u32 n_flash = 1;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1840  	int ret;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1841  	u64 sz;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1842  
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1843  	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1844  			(long long)instr->len);
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1845  
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1846  	params = spi_nor_get_params(nor, 0);
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1847  	sz = params->size;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1848  
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1849  	if (nor->num_flash)
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1850  		n_flash = nor->num_flash;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1851  
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2018-09-11  1852  	if (spi_nor_has_uniform_erase(nor)) {
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1853  		div_u64_rem(instr->len, mtd->erasesize, &rem);
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1854  		if (rem)
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1855  			return -EINVAL;
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2018-09-11  1856  	}
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1857  
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1858  	addr = instr->addr;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1859  	len = instr->len;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1860  
e96d4605b024495 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  1861  	ret = spi_nor_prep_and_lock_pe(nor, instr->addr, instr->len);
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1862  	if (ret)
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1863  		return ret;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1864  
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1865  	/* whole-chip erase? */
e99ca98f1d7190c drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-02  1866  	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1867  		unsigned long timeout;
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1868  
74df43b3f626a35 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  1869  		ret = spi_nor_lock_device(nor);
bce679e5ae3a388 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-11-02  1870  		if (ret)
bce679e5ae3a388 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-11-02  1871  			goto erase_err;
05241aead9b98c2 drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-11-05  1872  
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1873  		if (nor->flags & SNOR_F_HAS_PARALLEL) {
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1874  			nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1875  			ret = spi_nor_erase_chip(nor);
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1876  			spi_nor_unlock_device(nor);
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1877  			if (ret)
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1878  				goto erase_err;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1879  
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1880  			/*
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1881  			* Scale the timeout linearly with the size of the flash, with
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1882  			* a minimum calibrated to an old 2MB flash. We could try to
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1883  			* pull these from CFI/SFDP, but these values should be good
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1884  			* enough for now.
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1885  			*/
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1886  			timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1887  					CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1888  					(unsigned long)(mtd->size / SZ_2M));
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1889  			ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1890  			if (ret)
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1891  				goto erase_err;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1892  
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1893  		} else {
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1894  			while (cur_cs_num < n_flash) {
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1895  				nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
7380f79c111cf90 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-10-29  1896  				ret = spi_nor_erase_chip(nor);
74df43b3f626a35 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  1897  				spi_nor_unlock_device(nor);
7380f79c111cf90 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-10-29  1898  				if (ret)
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1899  					goto erase_err;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1900  
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1901  				/*
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1902  				 * Scale the timeout linearly with the size of the flash, with
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1903  				 * a minimum calibrated to an old 2MB flash. We could try to
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1904  				 * pull these from CFI/SFDP, but these values should be good
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1905  				 * enough for now.
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1906  				 */
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1907  				timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1908  					      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1909  						(unsigned long)(params->size / SZ_2M));
09b6a377687b885 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh       2015-09-18  1910  				ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
dfa9c0cba4ea20e drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-08-06  1911  				if (ret)
dfa9c0cba4ea20e drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-08-06  1912  					goto erase_err;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1913  
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1914  				cur_cs_num++;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1915  				params = spi_nor_get_params(nor, cur_cs_num);
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1916  			}
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1917  		}
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1918  	/* REVISIT in some cases we could speed up erasing large regions
b02e7f3ef0beb72 drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-04-08  1919  	 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1920  	 * to use "small sector erase", but that's not always optimal.
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1921  	 */
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1922  	/* "sector"-at-a-time erase */
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2018-09-11  1923  	} else if (spi_nor_has_uniform_erase(nor)) {
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1924  		if (!(nor->flags & SNOR_F_HAS_PARALLEL)) {
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1925  			while ((cur_cs_num < n_flash) && (addr > sz - 1)) {
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1926  				cur_cs_num++;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1927  				params = spi_nor_get_params(nor, cur_cs_num);
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1928  				sz += params->size;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1929  			}
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1930  		}
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1931  		while (len) {
74df43b3f626a35 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  1932  			ret = spi_nor_lock_device(nor);
bce679e5ae3a388 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-11-02  1933  			if (ret)
bce679e5ae3a388 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-11-02  1934  				goto erase_err;
05241aead9b98c2 drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-11-05  1935  
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1936  			offset = addr;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1937  			if (nor->flags & SNOR_F_HAS_STACKED) {
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1938  				params = spi_nor_get_params(nor, cur_cs_num);
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1939  				offset -= (sz - params->size);
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1940  			}
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1941  			nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1942  			if (nor->flags & SNOR_F_HAS_PARALLEL) {
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1943  				u64 aux = offset;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1944  
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1945  				ret = do_div(aux, n_flash);
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1946  				offset = aux;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1947  				nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1948  			}
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1949  
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1950  			ret = spi_nor_erase_sector(nor, offset);
74df43b3f626a35 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  1951  			spi_nor_unlock_device(nor);
c67cbb839da9cc2 drivers/mtd/spi-nor/spi-nor.c Brian Norris         2015-11-10  1952  			if (ret)
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1953  				goto erase_err;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1954  
dfa9c0cba4ea20e drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-08-06  1955  			ret = spi_nor_wait_till_ready(nor);
dfa9c0cba4ea20e drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-08-06  1956  			if (ret)
dfa9c0cba4ea20e drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-08-06  1957  				goto erase_err;
786a0a75d0f34a8 drivers/mtd/spi-nor/core.c    Tudor Ambarus        2021-03-06  1958  
786a0a75d0f34a8 drivers/mtd/spi-nor/core.c    Tudor Ambarus        2021-03-06  1959  			addr += mtd->erasesize;
786a0a75d0f34a8 drivers/mtd/spi-nor/core.c    Tudor Ambarus        2021-03-06  1960  			len -= mtd->erasesize;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1961  
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1962  			/*
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1963  			 * Flash cross over condition in stacked mode.
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1964  			 */
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1965  			if ((nor->flags & SNOR_F_HAS_STACKED) && (addr > sz - 1)) {
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1966  				cur_cs_num++;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1967  				params = spi_nor_get_params(nor, cur_cs_num);
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1968  				sz += params->size;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1969  			}
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1970  		}
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2018-09-11  1971  	/* erase multiple sectors */
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1972  	} else {
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1973  		if (nor->flags & SNOR_F_HAS_PARALLEL) {
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25 @1974  			u64 aux = offset;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1975  
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1976  			ret = do_div(aux, n_flash);
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1977  			offset = aux;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1978  			ret = spi_nor_erase_multi_sectors(nor, addr, len);
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1979  			if (ret)
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1980  				goto erase_err;
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2018-09-11  1981  		} else {
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1982  			u64 erase_len = 0;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1983  
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1984  			/* Determine the flash from which the operation need to start */
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1985  			while ((cur_cs_num < n_flash) && (addr > sz - 1)) {
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1986  				cur_cs_num++;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1987  				params = spi_nor_get_params(nor, cur_cs_num);
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1988  				sz += params->size;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1989  			}
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1990  			/* perform multi sector erase onec per Flash*/
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1991  			while (len) {
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1992  				erase_len = (len > (sz - addr)) ? (sz - addr) : len;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1993  				offset = addr;
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1994  				nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1995  				if (nor->flags & SNOR_F_HAS_STACKED) {
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1996  					params = spi_nor_get_params(nor, cur_cs_num);
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1997  					offset -= (sz - params->size);
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1998  				}
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  1999  				ret = spi_nor_erase_multi_sectors(nor, offset, erase_len);
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2018-09-11  2000  				if (ret)
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2018-09-11  2001  					goto erase_err;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  2002  				len -= erase_len;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  2003  				addr += erase_len;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  2004  				params = spi_nor_get_params(nor, cur_cs_num);
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  2005  				sz += params->size;
c5e6166349410fd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  2006  			}
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2007  		}
08b10484d5b83ce drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-11-25  2008  	}
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2009  
bce679e5ae3a388 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-11-02  2010  	ret = spi_nor_write_disable(nor);
05241aead9b98c2 drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-11-05  2011  
d6af26944a02e6d drivers/mtd/spi-nor/spi-nor.c Heiner Kallweit      2015-11-17  2012  erase_err:
e96d4605b024495 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  2013  	spi_nor_unlock_and_unprep_pe(nor, instr->addr, instr->len);
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2014  
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2015  	return ret;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2016  }
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2017  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
