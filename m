Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAEC53A6
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Sep 2023 13:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695562373; x=1727098373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EpfM7POWCZmiuLzb5Af9YnT431Krc18wtn/+fPC7Yoc=;
  b=X9FvdasXVDxUSWn8CnQgWVjJ90mAE3FNc0SDYpJCVUgKDxZdO2M7SPRW
   n+ot+tv5PBU4Ikxv2Qly4FEfD8cLGX/urNWFzGjHtyRQAnhlPOcSGKlZP
   UaA650XBkFzC5ViqRO1ifld05+GzLJh6lQzfQlZX1PQ5JH836aSED4NRv
   KBRvzlJbFzBSYBDJvU0WfH3ruADyAgRj3YVpg2pGtZRyvwskZyIkNk3Os
   dwL3dlUmbSJakWZO9Nk+ip7ytMr0DBvmbDTAccUGaq7wECMf5DYXSZjHz
   ZtOGe1T3a1JA98XjVJPUzwKTZUIwHHcbfxvC5bA1ab+QtBhilQcbcUheX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366155612"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="366155612"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 06:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995098769"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="995098769"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Sep 2023 06:32:51 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkPE9-0003iO-1x;
	Sun, 24 Sep 2023 13:32:49 +0000
Date: Sun, 24 Sep 2023 21:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 891/1370]
 drivers/mtd/spi-nor/core.c:2867 spi_nor_quad_enable() error: uninitialized
 symbol 'err'.
Message-ID: <202309242141.Llw5gcjl-lkp@intel.com>
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
commit: e500b96b4c8a5c61ab86c2a5bb1750abf2d59bf0 [891/1370] mtd: spi-nor: Add stacked memories support in spi-nor
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20230924 (https://download.01.org/0day-ci/archive/20230924/202309242141.Llw5gcjl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309242141.Llw5gcjl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309242141.Llw5gcjl-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/core.c:2867 spi_nor_quad_enable() error: uninitialized symbol 'err'.

vim +/err +2867 drivers/mtd/spi-nor/core.c

a33c89db4c3ba8 drivers/mtd/spi-nor/core.c    Pratyush Yadav       2020-10-05  2835  
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2836  /**
1afc0c89f6a155 drivers/mtd/spi-nor/core.c    Yicong Yang          2020-09-04  2837   * spi_nor_quad_enable() - enable Quad I/O if needed.
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2838   * @nor:                pointer to a 'struct spi_nor'
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2839   *
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2840   * Return: 0 on success, -errno otherwise.
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2841   */
1afc0c89f6a155 drivers/mtd/spi-nor/core.c    Yicong Yang          2020-09-04  2842  static int spi_nor_quad_enable(struct spi_nor *nor)
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2843  {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2844  	struct spi_nor_flash_parameter *params;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2845  	int err, idx;
aa5a6e93900b17 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2846  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2847  	for (idx = 0; idx < SNOR_FLASH_CNT_MAX; idx++) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2848  		params = spi_nor_get_params(nor, idx);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2849  		if (params) {
aa5a6e93900b17 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2850  			if (!params->quad_enable)
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2851  				return 0;
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2852  
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2853  			if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2854  			      spi_nor_get_protocol_width(nor->write_proto) == 4))
46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-22  2855  				return 0;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2856  			/*
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2857  			 * Set the appropriate CS index before
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2858  			 * issuing the command.
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2859  			 */
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2860  			nor->spimem->spi->cs_index_mask = 0x01 << idx;
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  2861  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2862  			err = params->quad_enable(nor);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2863  			if (err)
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2864  				return err;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2865  		}
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18  2866  	}
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2023-01-18 @2867  	return err;
46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-22  2868  }
46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-22  2869  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
