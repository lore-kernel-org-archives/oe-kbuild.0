Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657726FCC2
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 21:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hql5F8fS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701812816; x=1733348816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SEdBVbW6hDhbMdhYLvNnQpU5y6Tt0aL/CDhZhK+c83A=;
  b=hql5F8fSZEmF22gm+OPVHubh8INELERvqNp9LwUD8qEeaNOpIarsTul6
   BbpMP+75WccsdUG9scHZgFkGF+196SU3vr2Zt10pFbri0aA9I+Gq1SqGs
   Vwf55Ujujq/BVnFbKFgPdXCE5VgmLMG8muLiiXu0gRIXvc5P1JW7Xr/CM
   I+KBfVBZiZg+4iGkcXs+ESn5EZTmpw0nu9FFayj16c5OGlqe/KFLUf0aR
   Rkia+8wu0VYvaneFUqfwZYBP3hcJ2kdCsqXBJH3E6lfd/lett0SBLCBKe
   2paaXP7AB8lL2c7omZhood8ynsmNSd5tlL02BreIiIEY+Tki6xIoD75B/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="480163705"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="480163705"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:46:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="894515402"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="894515402"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Dec 2023 13:46:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdFj-0009lz-2D;
	Tue, 05 Dec 2023 21:46:51 +0000
Date: Wed, 6 Dec 2023 05:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [xilinx-xlnx:lkp_test 14/42] drivers/mtd/spi-nor/core.c:2423:10-11:
 WARNING opportunity for min()
Message-ID: <202312060506.tl49XSLt-lkp@intel.com>
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
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   414b0dc753ec961cf8e532b86412522e78a00169
commit: c29562880a8dec6ead1ec39e25e91840bad9da62 [14/42] mtd: spi-nor: Add EAR support
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-104-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060506.tl49XSLt-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060506.tl49XSLt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060506.tl49XSLt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/core.c:2423:10-11: WARNING opportunity for min()

vim +2423 drivers/mtd/spi-nor/core.c

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2330  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2331  static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2332  			size_t *retlen, u_char *buf)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2333  {
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2334  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2335  	struct spi_nor_flash_parameter *params;
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2336  	ssize_t ret, read_len, len_lock =  len;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2337  	bool is_ofst_odd = false;
e96d4605b02449 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  2338  	loff_t from_lock = from;
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2339  	u32 rem_bank_len = 0;
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2340  	u32 cur_cs_num = 0;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2341  	u_char *readbuf;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2342  	u32 n_flash = 1;
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2343  	loff_t addr;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2344  	u64 sz = 0;
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2345  	u8 bank;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2346  
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2347  #define OFFSET_16_MB 0x1000000
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2348  	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2349  
e96d4605b02449 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  2350  	ret = spi_nor_prep_and_lock_rd(nor, from_lock, len_lock);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2351  	if (ret)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2352  		return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2353  
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2354  	params = spi_nor_get_params(nor, 0);
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2355  	sz = params->size;
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2356  
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2357  	if (nor->num_flash)
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2358  		n_flash = nor->num_flash;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2359  
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2360  	/*
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2361  	 * When even number of flashes are connected in parallel and the
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2362  	 * requested read length is odd then read (len + 1) from offset + 1
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2363  	 * and ignore offset[0] data.
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2364  	 */
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2365  	if ((nor->flags & SNOR_F_HAS_PARALLEL) && (!(n_flash % 2)) && (from & 0x01)) {
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2366  		from = (loff_t)(from - 1);
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2367  		len = (size_t)(len + 1);
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2368  		is_ofst_odd = true;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2369  		readbuf = kmalloc(len, GFP_KERNEL);
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2370  		if (!readbuf)
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2371  			return -ENOMEM;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2372  	} else {
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2373  		readbuf = buf;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2374  	}
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2375  
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2376  	if (!(nor->flags & SNOR_F_HAS_PARALLEL)) {
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2377  		/* Determine the flash from which the operation need to start */
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2378  		while ((cur_cs_num < n_flash) && (from > sz - 1)) {
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2379  			cur_cs_num++;
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2380  			params = spi_nor_get_params(nor, cur_cs_num);
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2381  			sz += params->size;
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2382  		}
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2383  	}
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2384  
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2385  	while (len) {
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2386  		if (nor->addr_nbytes == 3) {
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2387  			if (nor->flags & SNOR_F_HAS_PARALLEL) {
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2388  				bank = (u32)from / (OFFSET_16_MB << 0x01);
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2389  				rem_bank_len = ((OFFSET_16_MB << 0x01) *
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2390  						(bank + 1)) - from;
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2391  			} else {
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2392  				bank = (u32)from / (OFFSET_16_MB);
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2393  				rem_bank_len = ((OFFSET_16_MB) * (bank + 1)) - from;
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2394  			}
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2395  		}
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2396  
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2397  		addr = from;
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-02  2398  
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2399  		if (nor->flags & SNOR_F_HAS_PARALLEL) {
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2400  			u64 aux = addr;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2401  
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2402  			ret = do_div(aux, n_flash);
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2403  			addr = aux;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2404  			nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2405  			read_len = len;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2406  		} else {
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2407  			nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2408  			read_len = (len > (sz - addr)) ? (sz - addr) : len;
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2409  			params = spi_nor_get_params(nor, cur_cs_num);
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2410  			addr -= (sz - params->size);
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2411  		}
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2412  
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2413  		if (nor->addr_nbytes == 3) {
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2414  			ret = spi_nor_write_enable(nor);
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2415  			if (ret)
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2416  				goto read_err;
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2417  			ret = spi_nor_write_ear(nor, addr);
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2418  			if (ret) {
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2419  				dev_err(nor->dev, "While writing ear register\n");
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2420  				goto read_err;
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2421  			}
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2422  		}
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18 @2423  		if (len < rem_bank_len)
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2424  			read_len = len;
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2425  		else
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2426  			read_len = rem_bank_len;
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2427  
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2428  		/* Wait till previous write/erase is done. */
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2429  		ret = spi_nor_wait_till_ready(nor);
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2430  		if (ret)
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2431  			goto read_err;
c29562880a8dec drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2432  
36499596280359 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-24  2433  		addr = spi_nor_convert_addr(nor, addr);
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-02  2434  
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2435  		ret = spi_nor_read_data(nor, addr, read_len, readbuf);
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2436  		if (ret == 0) {
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2437  			/* We shouldn't see 0-length reads */
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2438  			ret = -EIO;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2439  			goto read_err;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2440  		}
59451e1233bd31 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2441  		if (ret < 0)
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2442  			goto read_err;
59451e1233bd31 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2443  
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2444  		WARN_ON(ret > read_len);
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2445  		if (is_ofst_odd) {
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2446  			/*
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2447  			 * Cannot read from odd offset in parallel mode.
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2448  			 * So read len + 1 from offset + 1 from the flash
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2449  			 * and copy len data from readbuf[1].
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2450  			 */
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2451  			memcpy(buf, (readbuf + 1), (len - 1));
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2452  			*retlen += (ret - 1);
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2453  		} else {
2dd087b16946cf drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2454  			*retlen += ret;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2455  		}
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2456  		buf += ret;
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2457  		if (!is_ofst_odd)
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2458  			readbuf += ret;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2459  		from += ret;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2460  		len -= ret;
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2461  
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2462  		/*
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2463  		 * Flash cross over condition in stacked mode.
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2464  		 *
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2465  		 */
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2466  		if ((nor->flags & SNOR_F_HAS_STACKED) && (from > sz - 1)) {
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2467  			cur_cs_num++;
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2468  			params = spi_nor_get_params(nor, cur_cs_num);
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2469  			sz += params->size;
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2470  		}
3ee235dc04a336 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2471  
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2472  	}
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2473  	ret = 0;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2474  
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2475  read_err:
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2476  	if (is_ofst_odd)
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2477  		kfree(readbuf);
e96d4605b02449 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  2478  
1510af3c831f99 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-10-19  2479  	spi_nor_unlock_and_unprep_rd(nor, from_lock, len_lock);
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2480  	return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2481  }
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2482  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
