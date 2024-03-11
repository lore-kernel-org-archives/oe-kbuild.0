Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED09523D
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Mar 2024 02:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710124754; cv=none; b=uZXJEqvzyexHeJetRgC3a7RsDqodAX3e3MTqNXhagoR5gAmE2gyOcO7xyITF9k6Clk2Vo22uzxN8ED9mDsGkG+NXnQhXFtZYXW+rV7PCGeoTeKEpWEj11z89xaRah3B1fMQ06Yez3Yid+btNw5sVeNwtLfoGPEtexocAGVlWzBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710124754; c=relaxed/simple;
	bh=ZVvFnnk8//NhLSNsLc9sXOy68BHtas2xOxF/e/TK6+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbpJdxjv05I46x0CC/vmp59fuH1u1hcDGva8FjKqMe6VbuqQHdFr36DhFBLadZYLu58VCc3iTOHKw+GWAG96JrQ8RT3jDNG9hwb+tk35kYHFUg9rdjW/RDE4kscMwAHFY63wlzS5QD6YH62hbPckdPBULC0xsnapuhfwhUu+f1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmwAclFO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmwAclFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710124752; x=1741660752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZVvFnnk8//NhLSNsLc9sXOy68BHtas2xOxF/e/TK6+0=;
  b=gmwAclFORsv57imms0dREiVOYATcHureSFNo97UcnTNzjJuLe/t+Lfh8
   orE/zjiOp13h9mTvCLE0MsQBa+xG7w6Wkj8AS3dWn9LqcGlknPR0cBrjk
   wism6gOreIs48/LiD2K8eZz8u9rDfHx+M46YakEJYdQDU+OGevrKr9D8a
   Y7U82SZmp1NTHU++0+IAQQCGBYXmR9IQx5utceeAqz/loyiFDTXWE3lak
   Qm4Yr6VwrcCNsIXNuwOT75+vT6aLw/XAn0JcQHMSuuPehn0/h/C4EjpKM
   2CdYbveEBIcXj50K6tyi7Efgo8+2sLs2l5onNpTdutEW6deeV0pEW1g/d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15909784"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15909784"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 19:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="41953622"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2024 19:39:10 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjVZD-0008q3-0y;
	Mon, 11 Mar 2024 02:39:07 +0000
Date: Mon, 11 Mar 2024 10:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and
 Makefile file
Message-ID: <202403111044.eqxBgcDl-lkp@intel.com>
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
In-Reply-To: <20240305112831.3380896-5-pavitrakumarm@vayavyalabs.com>
References: <20240305112831.3380896-5-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
TO: herbert@gondor.apana.org.au
TO: linux-crypto@vger.kernel.org
CC: Ruud.Derwig@synopsys.com
CC: manjunath.hadli@vayavyalabs.com
CC: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.8 next-20240308]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPAcc-driver-to-Linux-kernel/20240305-193337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240305112831.3380896-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and Makefile file
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20240308 (https://download.01.org/0day-ci/archive/20240311/202403111044.eqxBgcDl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403111044.eqxBgcDl-lkp@intel.com/

New smatch warnings:
drivers/crypto/dwc-spacc/spacc_skcipher.c:176 spacc_cipher_cb() warn: was && intended here instead of ||?
drivers/crypto/dwc-spacc/spacc_aead.c:1131 spacc_aead_process() error: uninitialized symbol 'ptaadsize'.

Old smatch warnings:
drivers/crypto/dwc-spacc/spacc_skcipher.c:528 spacc_cipher_process() warn: bitwise AND condition is false here
drivers/crypto/dwc-spacc/spacc_skcipher.c:751 probe_ciphers() warn: inconsistent indenting
drivers/crypto/dwc-spacc/spacc_skcipher.c:762 probe_ciphers() warn: possible memory leak of 'salg'
drivers/crypto/dwc-spacc/spacc_aead.c:1165 spacc_aead_process() error: uninitialized symbol 'ptaadsize'.

vim +176 drivers/crypto/dwc-spacc/spacc_skcipher.c

6ad822cec22644 Pavitrakumar M 2024-03-05  145  
6ad822cec22644 Pavitrakumar M 2024-03-05  146  static void spacc_cipher_cb(void *spacc, void *tfm)
6ad822cec22644 Pavitrakumar M 2024-03-05  147  {
6ad822cec22644 Pavitrakumar M 2024-03-05  148  	struct cipher_cb_data *cb = tfm;
6ad822cec22644 Pavitrakumar M 2024-03-05  149  	int err = -1, rc;
6ad822cec22644 Pavitrakumar M 2024-03-05  150  	int total_len;
6ad822cec22644 Pavitrakumar M 2024-03-05  151  	struct spacc_crypto_reqctx *ctx = skcipher_request_ctx(cb->req);
6ad822cec22644 Pavitrakumar M 2024-03-05  152  
6ad822cec22644 Pavitrakumar M 2024-03-05  153  	u32 status_reg = readl(cb->spacc->regmap + SPACC_REG_STATUS);
6ad822cec22644 Pavitrakumar M 2024-03-05  154  	u32 status_ret = (status_reg >> 24) & 0x03;
6ad822cec22644 Pavitrakumar M 2024-03-05  155  
6ad822cec22644 Pavitrakumar M 2024-03-05  156  	if (ctx->mode == CRYPTO_MODE_DES_CBC ||
6ad822cec22644 Pavitrakumar M 2024-03-05  157  	    ctx->mode == CRYPTO_MODE_3DES_CBC) {
6ad822cec22644 Pavitrakumar M 2024-03-05  158  		rc = spacc_read_context(cb->spacc, cb->tctx->handle,
6ad822cec22644 Pavitrakumar M 2024-03-05  159  					SPACC_CRYPTO_OPERATION, NULL, 0,
6ad822cec22644 Pavitrakumar M 2024-03-05  160  					cb->req->iv, 8);
6ad822cec22644 Pavitrakumar M 2024-03-05  161  	} else if (ctx->mode != CRYPTO_MODE_DES_ECB  &&
6ad822cec22644 Pavitrakumar M 2024-03-05  162  		   ctx->mode != CRYPTO_MODE_3DES_ECB &&
6ad822cec22644 Pavitrakumar M 2024-03-05  163  		   ctx->mode != CRYPTO_MODE_SM4_ECB  &&
6ad822cec22644 Pavitrakumar M 2024-03-05  164  		   ctx->mode != CRYPTO_MODE_AES_ECB  &&
6ad822cec22644 Pavitrakumar M 2024-03-05  165  		   ctx->mode != CRYPTO_MODE_SM4_XTS  &&
6ad822cec22644 Pavitrakumar M 2024-03-05  166  		   ctx->mode != CRYPTO_MODE_KASUMI_ECB) {
6ad822cec22644 Pavitrakumar M 2024-03-05  167  		if (status_ret == 0x3) {
6ad822cec22644 Pavitrakumar M 2024-03-05  168  			err = -EINVAL;
6ad822cec22644 Pavitrakumar M 2024-03-05  169  			goto REQ_DST_CP_SKIP;
6ad822cec22644 Pavitrakumar M 2024-03-05  170  		}
6ad822cec22644 Pavitrakumar M 2024-03-05  171  		rc = spacc_read_context(cb->spacc, cb->tctx->handle,
6ad822cec22644 Pavitrakumar M 2024-03-05  172  					SPACC_CRYPTO_OPERATION, NULL, 0,
6ad822cec22644 Pavitrakumar M 2024-03-05  173  					cb->req->iv, 16);
6ad822cec22644 Pavitrakumar M 2024-03-05  174  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  175  
6ad822cec22644 Pavitrakumar M 2024-03-05 @176  	if (ctx->mode != CRYPTO_MODE_DES_ECB  ||
6ad822cec22644 Pavitrakumar M 2024-03-05  177  	    ctx->mode != CRYPTO_MODE_DES_CBC  ||
6ad822cec22644 Pavitrakumar M 2024-03-05  178  	    ctx->mode != CRYPTO_MODE_3DES_ECB ||
6ad822cec22644 Pavitrakumar M 2024-03-05  179  	    ctx->mode != CRYPTO_MODE_3DES_CBC) {
6ad822cec22644 Pavitrakumar M 2024-03-05  180  		if (status_ret == 0x03) {
6ad822cec22644 Pavitrakumar M 2024-03-05  181  			err = -EINVAL;
6ad822cec22644 Pavitrakumar M 2024-03-05  182  			goto REQ_DST_CP_SKIP;
6ad822cec22644 Pavitrakumar M 2024-03-05  183  		}
6ad822cec22644 Pavitrakumar M 2024-03-05  184  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  185  
6ad822cec22644 Pavitrakumar M 2024-03-05  186  	if (ctx->mode == CRYPTO_MODE_SM4_ECB && status_ret == 0x03) {
6ad822cec22644 Pavitrakumar M 2024-03-05  187  		err = -EINVAL;
6ad822cec22644 Pavitrakumar M 2024-03-05  188  		goto REQ_DST_CP_SKIP;
6ad822cec22644 Pavitrakumar M 2024-03-05  189  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  190  
6ad822cec22644 Pavitrakumar M 2024-03-05  191  	total_len = cb->req->cryptlen;
6ad822cec22644 Pavitrakumar M 2024-03-05  192  	if (ctx->mode == CRYPTO_MODE_SM4_XTS && total_len != 16) {
6ad822cec22644 Pavitrakumar M 2024-03-05  193  		if (status_ret == 0x03) {
6ad822cec22644 Pavitrakumar M 2024-03-05  194  			err = -EINVAL;
6ad822cec22644 Pavitrakumar M 2024-03-05  195  			goto REQ_DST_CP_SKIP;
6ad822cec22644 Pavitrakumar M 2024-03-05  196  		}
6ad822cec22644 Pavitrakumar M 2024-03-05  197  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  198  
6ad822cec22644 Pavitrakumar M 2024-03-05  199  	dma_sync_sg_for_cpu(cb->tctx->dev, cb->req->dst, ctx->dst_nents,
6ad822cec22644 Pavitrakumar M 2024-03-05  200  				DMA_FROM_DEVICE);
6ad822cec22644 Pavitrakumar M 2024-03-05  201  
6ad822cec22644 Pavitrakumar M 2024-03-05  202  	err = cb->spacc->job[cb->new_handle].job_err;
6ad822cec22644 Pavitrakumar M 2024-03-05  203  REQ_DST_CP_SKIP:
6ad822cec22644 Pavitrakumar M 2024-03-05  204  	spacc_cipher_cleanup_dma(cb->tctx->dev, cb->req);
6ad822cec22644 Pavitrakumar M 2024-03-05  205  	spacc_close(cb->spacc, cb->new_handle);
6ad822cec22644 Pavitrakumar M 2024-03-05  206  
6ad822cec22644 Pavitrakumar M 2024-03-05  207  	/* call complete */
6ad822cec22644 Pavitrakumar M 2024-03-05  208  	skcipher_request_complete(cb->req, err);
6ad822cec22644 Pavitrakumar M 2024-03-05  209  }
6ad822cec22644 Pavitrakumar M 2024-03-05  210  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
