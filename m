Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02951386
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 02:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677380089; x=1708916089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AjK8sSMUJ46p+Sh/6m3YK4DPQsLDQnCN7d3rYGl+oeQ=;
  b=J7bvloEOj1ZXt7MtaknziFh0eyv9cRIKdyVm6cDJdyy+4SDasvrk+xqh
   C60TgyTe7AoGoCY+I0dZdH+dp6EDb/lLTlFlUdaqOExrkLU0jz4R8Zp3K
   CxRKubIICqU9rGHUxFc4tKy+ydmCA9HWBNFl7wteRm1kB3Y1mW8jvvJ43
   ZRfgEoaK3im8Uih/1TXWfrlb8ocFX457siAl6zluIRI78gKkcgbtXcNSq
   8r8Ji3hJ7uQgrth7Px+bl54DwWuvw0fFrU6iR9XJMf4KYSF83tHak9uVQ
   /cZjVAgmrrtcKdVkSuXekxii4L38/8Cei3cyooh4L7dxDxx6FCD1j/Rqj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="313351237"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="313351237"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 18:54:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="918865508"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="918865508"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Feb 2023 18:54:47 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW7BW-0003WN-28;
	Sun, 26 Feb 2023 02:54:46 +0000
Date: Sun, 26 Feb 2023 10:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/aspeed/aspeed-acry.c:295 aspeed_acry_rsa_ctx_copy()
 error: uninitialized symbol 'idx'.
Message-ID: <202302261052.CVFRyq6F-lkp@intel.com>
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
head:   1ec35eadc3b448c91a6b763371a7073444e95f9d
commit: 2f1cf4e50c956f882c9fc209c7cded832b67b8a3 crypto: aspeed - Add ACRY RSA driver
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: m68k-randconfig-m031-20230226 (https://download.01.org/0day-ci/archive/20230226/202302261052.CVFRyq6F-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302261052.CVFRyq6F-lkp@intel.com/

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
