Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DA47B;
	Sat, 24 Dec 2022 07:18:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso2329754wmb.3;
        Fri, 23 Dec 2022 23:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUx9cpZcYERslapw+heGtHbym4VjLEOm9qKWOBsoDho=;
        b=YJXMrFBmbuGFRSBlOeoYqKmz9+A5rB47cUsWdc6C53vfWkYPTcbLawFP/tb00OQL69
         SDKA6o4pX8FAHRvb6za2UEuVHKwozryv0SC/gHO4cMtl8x0FLZfLki3qrzJNJx8xpBMg
         R4w0lzOdqLVaTteG4UYVmn9yrRBuB5+W79Hv2yBX29JLoYLszZ3e3nchh3MMNqRcomsi
         j1D8kg0x1NRTBFy4NAoB9MPJonM/3MWrRqVCOvTZHDsPOTLRj9k2ulX2gqQTh6JlFWCY
         2KGAzD1UkzrKG8aIP5ihTIgHzvudenT59Besz6UjCkT8leuszeaY44pnIUDPbmCwgX4E
         /6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUx9cpZcYERslapw+heGtHbym4VjLEOm9qKWOBsoDho=;
        b=rTh8zEvY1+pbY4b+7a0HkK498z3gxv9eQfQiRTTvx08r6ycMxZ06MHk/0kY2UhBS+f
         3sHjejwDd0o7mjJNXmh49Nu5lPecmMVccj6JwhHpxDaNge7NBIrIC375XkFvVUGIhZxF
         Ear/28asMM9jUzWirCTxBNcZYQwVwAmEglXSz/UDbZ6vg/VO8C9QGfdifG9qj0RcLEYn
         n6ApFwf5BnA/+rAq7ueinDuPwgESiZ+xbbKELjRU2dJwcPhsLEmKuDPCFl2FmMsT9ZEo
         JOMuyMBgXBYgXXrPgwXbbn6qF/xVsXD05bD6uxADf1aIcumYvx22WPx5EnA7GVZJtlx+
         MtRg==
X-Gm-Message-State: AFqh2kqFzWIdL6lEAnD6WfaH15DlBnY2sKzWLTriFGzOK+jQO+qeF+Xy
	ETQoxSGrQBT/E2R38p5FluW+9dZmje3vLqQy
X-Google-Smtp-Source: AMrXdXtS22tBWvj5h2ZriP3m1qOtlPHaplB1jO66/J65du0supZUcRESOdIhtmtawlTlWR/TntUwMQ==
X-Received: by 2002:a05:600c:1da3:b0:3d3:4dbc:75ef with SMTP id p35-20020a05600c1da300b003d34dbc75efmr8709253wms.17.1671866311642;
        Fri, 23 Dec 2022 23:18:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h12-20020a05600c350c00b003d355ad9bb7sm12801789wmq.20.2022.12.23.23.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 23:18:31 -0800 (PST)
Date: Sat, 24 Dec 2022 10:18:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 72/1346]
 drivers/mtd/spi-nor/core.c:1891 spi_nor_read_id() error: we previously
 assumed 'nor->spimem' could be null (see line 1873)
Message-ID: <202212241022.TAtlUM9B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20221224071828.8Gcg-SgkHB4M8reOPPPSBODAfbF3T9h3JjByn81dPiw@z>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   b9b26dcfcb221a7465b71e124f9ec0f4f4be988d
commit: 87a0aa695a2dbabc2d1a24acbb421529ea53c59e [72/1346] spi: spi-cadence-quadspi: Add support for DDR PHY mode
config: arm-randconfig-m041-20221218
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/mtd/spi-nor/core.c:1891 spi_nor_read_id() error: we previously assumed 'nor->spimem' could be null (see line 1873)

Old smatch warnings:
drivers/mtd/spi-nor/core.c:1544 spi_nor_init_erase_cmd_list() warn: passing a valid pointer to 'PTR_ERR'
drivers/mtd/spi-nor/core.c:1558 spi_nor_init_erase_cmd_list() warn: passing a valid pointer to 'PTR_ERR'

vim +1891 drivers/mtd/spi-nor/core.c

06bb6f5a69dfc5 drivers/mtd/spi-nor/spi-nor.c Rafał Miłecki        2015-08-10  1866  static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1867  {
9ec4bbcb2044ea drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-13  1868  	const struct flash_info *info;
f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-06  1869  	u8 *id = nor->bouncebuf;
2dcbfe365b1303 drivers/mtd/spi-nor/spi-nor.c Jonathan Neuschäfer  2020-02-23  1870  	unsigned int i;
2dcbfe365b1303 drivers/mtd/spi-nor/spi-nor.c Jonathan Neuschäfer  2020-02-23  1871  	int ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1872  
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-06 @1873  	if (nor->spimem) {
                                                                                            ^^^^^^^^^^^
Check for NULL

b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-06  1874  		struct spi_mem_op op =
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-06  1875  			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-06  1876  				   SPI_MEM_OP_NO_ADDR,
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-06  1877  				   SPI_MEM_OP_NO_DUMMY,
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-06  1878  				   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, id, 1));
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-06  1879  
2dcbfe365b1303 drivers/mtd/spi-nor/spi-nor.c Jonathan Neuschäfer  2020-02-23  1880  		ret = spi_mem_exec_op(nor->spimem, &op);
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-06  1881  	} else {
2dcbfe365b1303 drivers/mtd/spi-nor/spi-nor.c Jonathan Neuschäfer  2020-02-23  1882  		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-06  1883  						    SPI_NOR_MAX_ID_LEN);
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-06  1884  	}
2dcbfe365b1303 drivers/mtd/spi-nor/spi-nor.c Jonathan Neuschäfer  2020-02-23  1885  	if (ret) {
2dcbfe365b1303 drivers/mtd/spi-nor/spi-nor.c Jonathan Neuschäfer  2020-02-23  1886  		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
2dcbfe365b1303 drivers/mtd/spi-nor/spi-nor.c Jonathan Neuschäfer  2020-02-23  1887  		return ERR_PTR(ret);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1888  	}
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1889  
87a0aa695a2dba drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2021-12-09  1890  	for (i = 0; i < SPI_NOR_MAX_ID_LEN; i++)
87a0aa695a2dba drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2021-12-09 @1891  		nor->spimem->device_id[i] = id[i];
                                                                                                ^^^^^^^^^^^
Unchecked dereference.

87a0aa695a2dba drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2021-12-09  1892  
9ec4bbcb2044ea drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-13  1893  	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
9ec4bbcb2044ea drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-13  1894  		info = spi_nor_search_part_by_id(manufacturers[i]->parts,
9ec4bbcb2044ea drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-13  1895  						 manufacturers[i]->nparts,
9ec4bbcb2044ea drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-13  1896  						 id);
9ec4bbcb2044ea drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-13  1897  		if (info) {
9ec4bbcb2044ea drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-13  1898  			nor->manufacturer = manufacturers[i];
9ec4bbcb2044ea drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-13  1899  			return info;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1900  		}
9ec4bbcb2044ea drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-13  1901  	}
9ec4bbcb2044ea drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-13  1902  
3ddc8adbbc7683 drivers/mtd/spi-nor/spi-nor.c Geert Uytterhoeven   2019-03-12  1903  	dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
3ddc8adbbc7683 drivers/mtd/spi-nor/spi-nor.c Geert Uytterhoeven   2019-03-12  1904  		SPI_NOR_MAX_ID_LEN, id);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1905  	return ERR_PTR(-ENODEV);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-24  1906  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

