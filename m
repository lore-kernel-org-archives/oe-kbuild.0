Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B233E1873
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 04:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MR6ApHDR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40b538d5c4eso35769225e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Dec 2023 20:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701664547; x=1702269347; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKLJpxFQwMfxrQ1ATX/qTquvSOKrU2775t5Qb9uPkZQ=;
        b=MR6ApHDRtTdHvuE4dspIwwgOpHanGkUiqwwOjflTkoPDgnWh6qLLWNVnarigrLXO7Q
         Tw6JmT/UKjO9biwY5Hz0Ni9V9aARgi+U1HGsgxF+ZXr+6b2cBqwY5mRX+3+uhggnFQJI
         rXOfo1hNiFfYwIMA7T/2jEZrh4pSwrL4Y7eir3gB5I500T+uhnnMxhjkGvmKkz0zL/U9
         Mp6au0arl5+pN80MyHp7QU7MYUCJsMwc9uYOYoZ3+Ecg8Q0FfMkCm+ngtN4Lp6ywhHOS
         RMFjqVic3eJsF3XAL1v2JpI9I4QIyM4VyoJJ+Uv7DlVZmjimQoo576DBe2q0rHuS3W1m
         R6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701664547; x=1702269347;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKLJpxFQwMfxrQ1ATX/qTquvSOKrU2775t5Qb9uPkZQ=;
        b=bzPcaJFaOa9vaxp2WuSqeY2hJxLCl0WBlmyGSV7xUGDH3pyNNLllTX+9hOkM6teb0N
         cjP5kisLys+EYLG9ozVU9X05X8/yVq13AR9frf6qzu5Qi30t9W7f6HvScASG3A9TkJcH
         jg4fXGwZgpkQssTzbkr1BKo7jydHD1ZRNB8Btwv3FCphQSKITk2orzkb188+ohg8A6ue
         B187s869T5wNN8VJUwvzf3lNW7T46i081aRDLs1bzl0iWtuUIKvAADNIndDUbfw8YWO7
         mF/jQJHchXH/ckCQ4YzQ1mgtF2ycSgK3/ajy+ExAHbOoI0HNVj0w7Uau4a3y6Pmk9VWQ
         /qng==
X-Gm-Message-State: AOJu0YwAaNNyw8k3tTIYLRCm8P7B48Ex89sBCF2R7PF6MbQJ2ParK8iv
	vp3hzEv9dIK7ny52LkEmWfr2asPvgpNBxKWN8H8=
X-Google-Smtp-Source: AGHT+IEnhJwoZKXmUVbvm14rhYY5oHK4ZjPkekiU9I69SpnrwxVMNT04T0J8gs1lvAmT5ztzBK1i2w==
X-Received: by 2002:a05:600c:4f0d:b0:40b:5e21:cc20 with SMTP id l13-20020a05600c4f0d00b0040b5e21cc20mr2173596wmq.75.1701664546447;
        Sun, 03 Dec 2023 20:35:46 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fm19-20020a05600c0c1300b004060f0a0fd5sm13519503wmb.13.2023.12.03.20.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 20:35:46 -0800 (PST)
Date: Mon, 4 Dec 2023 07:35:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11 09/10] mtd: spi-nor: Add parallel memories support in
 spi-nor
Message-ID: <a9e6a77a-4bb1-4465-aa13-f573b0f8d27f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125092137.2948-10-amit.kumar-mahapatra@amd.com>

Hi Amit,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Kumar-Mahapatra/ALSA-hda-cs35l56-Use-set-get-APIs-to-access-spi-chip_select/20231125-182341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
patch link:    https://lore.kernel.org/r/20231125092137.2948-10-amit.kumar-mahapatra%40amd.com
patch subject: [PATCH v11 09/10] mtd: spi-nor: Add parallel memories support in spi-nor
config: powerpc64-randconfig-r071-20231127 (https://download.01.org/0day-ci/archive/20231202/202312020416.3O8KWQHs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020416.3O8KWQHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312020416.3O8KWQHs-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/core.c:1974 spi_nor_erase() error: uninitialized symbol 'offset'.
drivers/mtd/spi-nor/core.c:3729 spi_nor_restore() error: uninitialized symbol 'ret'.

vim +/offset +1974 drivers/mtd/spi-nor/core.c

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
                                                                                                                  ^^^^^^
offset hasn't been initialized yet.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

