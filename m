Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1384E2582
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Mar 2023 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678443798; x=1709979798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dTEQ7JxSkI4PNN/vgCFF8/Ysk10WpR4BKzkdM1UQpG0=;
  b=dT1lIssimB2KStEptkH6c0B6F1h/dNjUIEB6xDEnJchqBOXYQ4qI2ymP
   /MlODZzdkx8NhVCuoX8zORW3V5xlSDEe1ffThxhoIncPAj3Ico0vUIKXU
   bCM53Ihnnxhtqr1bRGkLL/EmWsuT6+JUJnOWmjCWTcnToLOEZHaj3rOit
   62dKdlA7Xq/32JYD/1+MitwcSYyWFOIlj2nBt535nj1fe+K0aRcKaqeRh
   LOSwYhl45e+PMdMaoPnoOO1kWBaFF2T2oQpIqSxSL17f0D1tqScM19BDT
   hUH/O4Gxyt6zg2OsgR8QQH3C6wHfiezDpXOIBIe2eQNd8qDdxDbMDAsNM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="399296655"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="399296655"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 02:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="923612776"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="923612776"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 02:23:14 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paZu5-0003kn-0q;
	Fri, 10 Mar 2023 10:23:13 +0000
Date: Fri, 10 Mar 2023 18:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/aspeed/aspeed-acry.c:295 aspeed_acry_rsa_ctx_copy()
 error: uninitialized symbol 'idx'.
Message-ID: <202303101834.h63W0sgT-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Neal Liu <neal_liu@aspeedtech.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44889ba56cbb3d51154660ccd15818bc77276696
commit: 2f1cf4e50c956f882c9fc209c7cded832b67b8a3 crypto: aspeed - Add ACRY RSA driver
date:   8 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 weeks ago
config: m68k-randconfig-m041-20230310 (https://download.01.org/0day-ci/archive/20230310/202303101834.h63W0sgT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303101834.h63W0sgT-lkp@intel.com/

smatch warnings:
drivers/crypto/aspeed/aspeed-acry.c:295 aspeed_acry_rsa_ctx_copy() error: uninitialized symbol 'idx'.

vim +/idx +295 drivers/crypto/aspeed/aspeed-acry.c

2f1cf4e50c956f Neal Liu 2023-01-04  236  
2f1cf4e50c956f Neal Liu 2023-01-04  237  /*
2f1cf4e50c956f Neal Liu 2023-01-04  238   * Copy Exp/Mod to DMA buffer for engine used.
2f1cf4e50c956f Neal Liu 2023-01-04  239   *
2f1cf4e50c956f Neal Liu 2023-01-04  240   * Params:
2f1cf4e50c956f Neal Liu 2023-01-04  241   * - mode 0 : Exponential
2f1cf4e50c956f Neal Liu 2023-01-04  242   * - mode 1 : Modulus
2f1cf4e50c956f Neal Liu 2023-01-04  243   *
2f1cf4e50c956f Neal Liu 2023-01-04  244   * Example:
2f1cf4e50c956f Neal Liu 2023-01-04  245   * - DRAM memory layout:
2f1cf4e50c956f Neal Liu 2023-01-04  246   *	D[0], D[4], D[8], D[12]
2f1cf4e50c956f Neal Liu 2023-01-04  247   * - ACRY SRAM memory layout should reverse the order of source data:
2f1cf4e50c956f Neal Liu 2023-01-04  248   *	D[12], D[8], D[4], D[0]
2f1cf4e50c956f Neal Liu 2023-01-04  249   */
2f1cf4e50c956f Neal Liu 2023-01-04  250  static int aspeed_acry_rsa_ctx_copy(struct aspeed_acry_dev *acry_dev, void *buf,
2f1cf4e50c956f Neal Liu 2023-01-04  251  				    const void *xbuf, size_t nbytes,
2f1cf4e50c956f Neal Liu 2023-01-04  252  				    enum aspeed_rsa_key_mode mode)
2f1cf4e50c956f Neal Liu 2023-01-04  253  {
2f1cf4e50c956f Neal Liu 2023-01-04  254  	const u8 *src = xbuf;
2f1cf4e50c956f Neal Liu 2023-01-04  255  	u32 *dw_buf = (u32 *)buf;
2f1cf4e50c956f Neal Liu 2023-01-04  256  	int nbits, ndw;
2f1cf4e50c956f Neal Liu 2023-01-04  257  	int i, j, idx;
2f1cf4e50c956f Neal Liu 2023-01-04  258  	u32 data = 0;
2f1cf4e50c956f Neal Liu 2023-01-04  259  
2f1cf4e50c956f Neal Liu 2023-01-04  260  	ACRY_DBG(acry_dev, "nbytes:%zu, mode:%d\n", nbytes, mode);
2f1cf4e50c956f Neal Liu 2023-01-04  261  
2f1cf4e50c956f Neal Liu 2023-01-04  262  	if (nbytes > ASPEED_ACRY_RSA_MAX_KEY_LEN)
2f1cf4e50c956f Neal Liu 2023-01-04  263  		return -ENOMEM;
2f1cf4e50c956f Neal Liu 2023-01-04  264  
2f1cf4e50c956f Neal Liu 2023-01-04  265  	/* Remove the leading zeros */
2f1cf4e50c956f Neal Liu 2023-01-04  266  	while (nbytes > 0 && src[0] == 0) {
2f1cf4e50c956f Neal Liu 2023-01-04  267  		src++;
2f1cf4e50c956f Neal Liu 2023-01-04  268  		nbytes--;
2f1cf4e50c956f Neal Liu 2023-01-04  269  	}
2f1cf4e50c956f Neal Liu 2023-01-04  270  
2f1cf4e50c956f Neal Liu 2023-01-04  271  	nbits = nbytes * 8;
2f1cf4e50c956f Neal Liu 2023-01-04  272  	if (nbytes > 0)
2f1cf4e50c956f Neal Liu 2023-01-04  273  		nbits -= count_leading_zeros(src[0]) - (BITS_PER_LONG - 8);
2f1cf4e50c956f Neal Liu 2023-01-04  274  
2f1cf4e50c956f Neal Liu 2023-01-04  275  	/* double-world alignment */
2f1cf4e50c956f Neal Liu 2023-01-04  276  	ndw = DIV_ROUND_UP(nbytes, BYTES_PER_DWORD);
2f1cf4e50c956f Neal Liu 2023-01-04  277  
2f1cf4e50c956f Neal Liu 2023-01-04  278  	if (nbytes > 0) {
2f1cf4e50c956f Neal Liu 2023-01-04  279  		i = BYTES_PER_DWORD - nbytes % BYTES_PER_DWORD;
2f1cf4e50c956f Neal Liu 2023-01-04  280  		i %= BYTES_PER_DWORD;
2f1cf4e50c956f Neal Liu 2023-01-04  281  
2f1cf4e50c956f Neal Liu 2023-01-04  282  		for (j = ndw; j > 0; j--) {
2f1cf4e50c956f Neal Liu 2023-01-04  283  			for (; i < BYTES_PER_DWORD; i++) {
2f1cf4e50c956f Neal Liu 2023-01-04  284  				data <<= 8;
2f1cf4e50c956f Neal Liu 2023-01-04  285  				data |= *src++;
2f1cf4e50c956f Neal Liu 2023-01-04  286  			}
2f1cf4e50c956f Neal Liu 2023-01-04  287  
2f1cf4e50c956f Neal Liu 2023-01-04  288  			i = 0;
2f1cf4e50c956f Neal Liu 2023-01-04  289  
2f1cf4e50c956f Neal Liu 2023-01-04  290  			if (mode == ASPEED_RSA_EXP_MODE)
2f1cf4e50c956f Neal Liu 2023-01-04  291  				idx = acry_dev->exp_dw_mapping[j - 1];
2f1cf4e50c956f Neal Liu 2023-01-04  292  			else if (mode == ASPEED_RSA_MOD_MODE)
2f1cf4e50c956f Neal Liu 2023-01-04  293  				idx = acry_dev->mod_dw_mapping[j - 1];
2f1cf4e50c956f Neal Liu 2023-01-04  294  
2f1cf4e50c956f Neal Liu 2023-01-04 @295  			dw_buf[idx] = cpu_to_le32(data);
2f1cf4e50c956f Neal Liu 2023-01-04  296  		}
2f1cf4e50c956f Neal Liu 2023-01-04  297  	}
2f1cf4e50c956f Neal Liu 2023-01-04  298  
2f1cf4e50c956f Neal Liu 2023-01-04  299  	return nbits;
2f1cf4e50c956f Neal Liu 2023-01-04  300  }
2f1cf4e50c956f Neal Liu 2023-01-04  301  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
