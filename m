Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864815383D
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jan 2025 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736628491; cv=none; b=hJ7oCfSFGkjFK3Xt3qJ69JEZRvGr9k8jh8bFhoiNsM1h5we41n381ITFqT4K05ezF0NXMhBB+Fyn+dYPF0dXKQVVOu4CIDj/Q+RfcfqEUK5IOcc/jm6rVwrHWnxjgML1uLXm/jE8bjSl33jozz6gBe79idXvdMLArPrimOxg+48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736628491; c=relaxed/simple;
	bh=I5/kU7Pnna/yAhPR/mWbzk3bMfyCr8fFylC1hQLY+fE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kKV3arEdvHHeINs4LTWDiqMsugyouht8rEHZyfR9uh0UXXAsICvFUIU2uwhjHCadC40yygi7ob4Icfb8xQw7jW2KfZkb/EfF9abTvKrXb4ScodcSbobLJmm9BheCoUFHwAN1W9nEckhHLzfklBIiA731YiI6+hNa7zhsOFvtDEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlIhZyZD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlIhZyZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736628489; x=1768164489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I5/kU7Pnna/yAhPR/mWbzk3bMfyCr8fFylC1hQLY+fE=;
  b=mlIhZyZDyNOlSrRgwfPz4tutSFI1blA54zjta1Mj+1gYUsP7aFjBuYUk
   k7ZP3WjjdxySEZ6aY3I+LsWBmIx6J+cIAimlWbcyYSEZ2X7H95/YJbDFN
   AJm3L9+q7UmfQkF1eC07rhoVXkTDIhL7WdT+RiKtpIXx5SLd7w7//IflO
   XYuny1Au1OyS7mGY6UCvKXbKFQTMhgx1FopIaDhmQd86wXTG/p5t+hssF
   b07wyxTb14pXXmkoB4FlhssKz3VCGjlwGphQXKXIjs6la2oCe4MSxbZ6i
   YZKhZBNlcDSGXGykrtuZ7DdzZ3Ct8JJuYgv5HNDMyJoWFFWVtkQ3O6M0A
   A==;
X-CSE-ConnectionGUID: ZN+Lpd5GRGOY5Qzgj5dQXA==
X-CSE-MsgGUID: kx1fOgfQS5mRLl+2wCh5Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="39712750"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="39712750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 12:48:08 -0800
X-CSE-ConnectionGUID: FrIfW+edSZyUqEXAFWPv/A==
X-CSE-MsgGUID: +9hdmSOXQEuAZ7POTM48Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="104223326"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jan 2025 12:48:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWiOq-000LCJ-1F;
	Sat, 11 Jan 2025 20:48:04 +0000
Date: Sun, 12 Jan 2025 04:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [xilinx-xlnx:lkp_test 422/504]
 drivers/mtd/spi-nor/core.c:2371:10-11: WARNING opportunity for min()
Message-ID: <202501120426.qYccAV3e-lkp@intel.com>
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
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: ebed2525c5ae574248a1ddad1e8ba2e04ad2d4cf [422/504] mtd: spi-nor: Add EAR support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r062-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120426.qYccAV3e-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501120426.qYccAV3e-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/core.c:2371:10-11: WARNING opportunity for min()

vim +2371 drivers/mtd/spi-nor/core.c

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2282  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2283  static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2284  			size_t *retlen, u_char *buf)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2285  {
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2286  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2287  	struct spi_nor_flash_parameter *params;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2288  	ssize_t ret, read_len, len_lock =  len;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2289  	bool is_ofst_odd = false;
e96d4605b02449 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  2290  	loff_t from_lock = from;
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2291  	u32 rem_bank_len = 0;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2292  	u32 cur_cs_num = 0;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2293  	u_char *readbuf;
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2294  	loff_t addr;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2295  	u64 sz = 0;
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2296  	u8 bank;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2297  
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2298  #define OFFSET_16_MB 0x1000000
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2299  	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2300  
e96d4605b02449 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  2301  	ret = spi_nor_prep_and_lock_rd(nor, from_lock, len_lock);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2302  	if (ret)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2303  		return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2304  
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2305  	params = spi_nor_get_params(nor, 0);
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2306  	sz = params->size;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2307  
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2308  	/*
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2309  	 * When even number of flashes are connected in parallel and the
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2310  	 * requested read length is odd then read (len + 1) from offset + 1
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2311  	 * and ignore offset[0] data.
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2312  	 */
4797f25bec4d73 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2313  	if ((nor->flags & SNOR_F_HAS_PARALLEL) && (!(nor->num_flash % 2)) && (from & 0x01)) {
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2314  		from = (loff_t)(from - 1);
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2315  		len = (size_t)(len + 1);
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2316  		is_ofst_odd = true;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2317  		readbuf = kmalloc(len, GFP_KERNEL);
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2318  		if (!readbuf)
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2319  			return -ENOMEM;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2320  	} else {
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2321  		readbuf = buf;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2322  	}
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2323  
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2324  	if (!(nor->flags & SNOR_F_HAS_PARALLEL)) {
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2325  		/* Determine the flash from which the operation need to start */
4797f25bec4d73 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2326  		while ((cur_cs_num < nor->num_flash) && (from > sz - 1)) {
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2327  			cur_cs_num++;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2328  			params = spi_nor_get_params(nor, cur_cs_num);
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2329  			sz += params->size;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2330  		}
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2331  	}
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2332  
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2333  	while (len) {
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2334  		if (nor->addr_nbytes == 3) {
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2335  			if (nor->flags & SNOR_F_HAS_PARALLEL) {
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2336  				bank = (u32)from / (OFFSET_16_MB << 0x01);
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2337  				rem_bank_len = ((OFFSET_16_MB << 0x01) *
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2338  						(bank + 1)) - from;
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2339  			} else {
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2340  				bank = (u32)from / (OFFSET_16_MB);
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2341  				rem_bank_len = ((OFFSET_16_MB) * (bank + 1)) - from;
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2342  			}
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2343  		}
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2344  
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2345  		addr = from;
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-02  2346  
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2347  		if (nor->flags & SNOR_F_HAS_PARALLEL) {
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2348  			u64 aux = addr;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2349  
4797f25bec4d73 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2350  			ret = do_div(aux, nor->num_flash);
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2351  			addr = aux;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2352  			nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2353  			read_len = len;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2354  		} else {
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2355  			nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2356  			read_len = (len > (sz - addr)) ? (sz - addr) : len;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2357  			params = spi_nor_get_params(nor, cur_cs_num);
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2358  			addr -= (sz - params->size);
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2359  		}
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2360  
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2361  		if (nor->addr_nbytes == 3) {
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2362  			ret = spi_nor_write_enable(nor);
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2363  			if (ret)
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2364  				goto read_err;
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2365  			ret = spi_nor_write_ear(nor, addr);
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2366  			if (ret) {
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2367  				dev_err(nor->dev, "While writing ear register\n");
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2368  				goto read_err;
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2369  			}
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2370  		}
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05 @2371  		if (len < rem_bank_len)
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2372  			read_len = len;
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2373  		else
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2374  			read_len = rem_bank_len;
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2375  
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2376  		/* Wait till previous write/erase is done. */
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2377  		ret = spi_nor_wait_till_ready(nor);
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2378  		if (ret)
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2379  			goto read_err;
ebed2525c5ae57 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2380  
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2381  		ret = spi_nor_read_data(nor, addr, read_len, readbuf);
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2382  		if (ret == 0) {
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2383  			/* We shouldn't see 0-length reads */
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2384  			ret = -EIO;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2385  			goto read_err;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2386  		}
59451e1233bd31 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2387  		if (ret < 0)
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2388  			goto read_err;
59451e1233bd31 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2389  
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2390  		WARN_ON(ret > read_len);
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2391  		if (is_ofst_odd) {
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2392  			/*
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2393  			 * Cannot read from odd offset in parallel mode.
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2394  			 * So read len + 1 from offset + 1 from the flash
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2395  			 * and copy len data from readbuf[1].
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2396  			 */
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2397  			memcpy(buf, (readbuf + 1), (len - 1));
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2398  			*retlen += (ret - 1);
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2399  		} else {
2dd087b16946cf drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2400  			*retlen += ret;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2401  		}
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2402  		buf += ret;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2403  		if (!is_ofst_odd)
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2404  			readbuf += ret;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2405  		from += ret;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2406  		len -= ret;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2407  
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2408  		/*
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2409  		 * Flash cross over condition in stacked mode.
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2410  		 *
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2411  		 */
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2412  		if ((nor->flags & SNOR_F_HAS_STACKED) && (from > sz - 1) &&
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2413  		    (cur_cs_num != nor->num_flash - 1)) {
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2414  			cur_cs_num++;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2415  			params = spi_nor_get_params(nor, cur_cs_num);
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2416  			sz += params->size;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2417  		}
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2418  
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2419  	}
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2420  	ret = 0;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2421  
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2422  read_err:
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2423  	if (is_ofst_odd)
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2424  		kfree(readbuf);
e96d4605b02449 drivers/mtd/spi-nor/core.c    Miquel Raynal        2023-03-28  2425  
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  2426  	spi_nor_unlock_and_unprep_rd(nor, from_lock, len_lock);
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-05  2427  	return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2428  }
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  2429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
