Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8FB14A9E
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoyLeL+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699962346; x=1731498346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z5dGF3fUj009f0bYfvRxTcowfKHIU9cN3HE/ogRXw9o=;
  b=RoyLeL+NVwHvYyFnwzjxAmPcTSAQRQO4NgHnlqUfYNUDH+VD3WvtKw0B
   VJhvvFshx66CgRGJ0TkJi73s7es0cP9slC70jjXKq+7tYoUBWGW2O9kTr
   v9ibN9YvguxZyqEix1goTPqiLMTC47YbEFIe6D0QOPNHigc6xP3YJvLPs
   Abhth2kLA4UO+dvHsluqctayx0GaD9m358jGWgas01xxFArRQbyTDS8z9
   q0QTMWvGIgD8Q2AKF3X7tEDoNxn3Er+ltEX5P+5PaOMDOmJiVpe5ajThW
   JoCi9hiKW8cArbS3yYE+l+uZ2IUGAQzMM/ztPw2IDhMgUill2+B1L0v97
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="389495578"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="389495578"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="12782293"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2023 03:45:44 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2rrR-0000EF-3A;
	Tue, 14 Nov 2023 11:45:41 +0000
Date: Tue, 14 Nov 2023 19:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and
 Makefile file
Message-ID: <202311141906.Ai9VGcKQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has kconfig file changed"
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231114050525.471854-5-pavitrakumarm@vayavyalabs.com>
References: <20231114050525.471854-5-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
TO: herbert@gondor.apana.org.au
TO: linux-crypto@vger.kernel.org
CC: manjunath.hadli@vayavyalabs.com
CC: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
CC: shwetar <shwetar@vayavyalabs.com>
CC: Ruud Derwig <Ruud.Derwig@synopsys.com>

Hi Pavitrakumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.7-rc1]
[cannot apply to xilinx-xlnx/master next-20231114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPACC-driver-to-Linux-kernel/20231114-143618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20231114050525.471854-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and Makefile file
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20231114/202311141906.Ai9VGcKQ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311141906.Ai9VGcKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311141906.Ai9VGcKQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/crypto/dwc-spacc/spacc_ahash.o: in function `zero_message_process':
>> drivers/crypto/dwc-spacc/spacc_ahash.c:427:(.text+0x284): undefined reference to `sm3_zero_message_hash'


vim +427 drivers/crypto/dwc-spacc/spacc_ahash.c

188d801c0d4bbe Pavitrakumar M 2023-11-14  417  
188d801c0d4bbe Pavitrakumar M 2023-11-14  418  static int zero_message_process(struct ahash_request *req)
188d801c0d4bbe Pavitrakumar M 2023-11-14  419  {
188d801c0d4bbe Pavitrakumar M 2023-11-14  420  	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
188d801c0d4bbe Pavitrakumar M 2023-11-14  421  	int digest_sz = crypto_ahash_digestsize(tfm);
188d801c0d4bbe Pavitrakumar M 2023-11-14  422  	const struct spacc_alg *salg = spacc_tfm_ahash(&tfm->base);
188d801c0d4bbe Pavitrakumar M 2023-11-14  423  
188d801c0d4bbe Pavitrakumar M 2023-11-14  424  	switch (salg->mode->id) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  425  	case CRYPTO_MODE_HASH_SM3:
188d801c0d4bbe Pavitrakumar M 2023-11-14  426  	case CRYPTO_MODE_HMAC_SM3:
188d801c0d4bbe Pavitrakumar M 2023-11-14 @427  		memcpy(req->result, sm3_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  428  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  429  
188d801c0d4bbe Pavitrakumar M 2023-11-14  430  	case CRYPTO_MODE_HMAC_SHA224:
188d801c0d4bbe Pavitrakumar M 2023-11-14  431  	case CRYPTO_MODE_HASH_SHA224:
188d801c0d4bbe Pavitrakumar M 2023-11-14  432  		memcpy(req->result, sha224_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  433  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  434  
188d801c0d4bbe Pavitrakumar M 2023-11-14  435  	case CRYPTO_MODE_HMAC_SHA256:
188d801c0d4bbe Pavitrakumar M 2023-11-14  436  	case CRYPTO_MODE_HASH_SHA256:
188d801c0d4bbe Pavitrakumar M 2023-11-14  437  		memcpy(req->result, sha256_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  438  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  439  
188d801c0d4bbe Pavitrakumar M 2023-11-14  440  	case CRYPTO_MODE_HMAC_SHA384:
188d801c0d4bbe Pavitrakumar M 2023-11-14  441  	case CRYPTO_MODE_HASH_SHA384:
188d801c0d4bbe Pavitrakumar M 2023-11-14  442  		memcpy(req->result, sha384_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  443  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  444  
188d801c0d4bbe Pavitrakumar M 2023-11-14  445  	case CRYPTO_MODE_HMAC_SHA512:
188d801c0d4bbe Pavitrakumar M 2023-11-14  446  	case CRYPTO_MODE_HASH_SHA512:
188d801c0d4bbe Pavitrakumar M 2023-11-14  447  		memcpy(req->result, sha512_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  448  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  449  
188d801c0d4bbe Pavitrakumar M 2023-11-14  450  	case CRYPTO_MODE_HMAC_MD5:
188d801c0d4bbe Pavitrakumar M 2023-11-14  451  	case CRYPTO_MODE_HASH_MD5:
188d801c0d4bbe Pavitrakumar M 2023-11-14  452  		memcpy(req->result, md5_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  453  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  454  
188d801c0d4bbe Pavitrakumar M 2023-11-14  455  	case CRYPTO_MODE_HMAC_SHA1:
188d801c0d4bbe Pavitrakumar M 2023-11-14  456  	case CRYPTO_MODE_HASH_SHA1:
188d801c0d4bbe Pavitrakumar M 2023-11-14  457  		memcpy(req->result, sha1_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  458  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  459  
188d801c0d4bbe Pavitrakumar M 2023-11-14  460  	case CRYPTO_MODE_MAC_XCBC:
188d801c0d4bbe Pavitrakumar M 2023-11-14  461  		memcpy(req->result, xcbc_aes_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  462  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  463  
188d801c0d4bbe Pavitrakumar M 2023-11-14  464  	case CRYPTO_MODE_MAC_CMAC:
188d801c0d4bbe Pavitrakumar M 2023-11-14  465  		memcpy(req->result, cmac_aes_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  466  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  467  
188d801c0d4bbe Pavitrakumar M 2023-11-14  468  	case CRYPTO_MODE_HASH_SHA3_224:
188d801c0d4bbe Pavitrakumar M 2023-11-14  469  		memcpy(req->result, sha3_224_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  470  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  471  
188d801c0d4bbe Pavitrakumar M 2023-11-14  472  	case CRYPTO_MODE_HASH_SHA3_256:
188d801c0d4bbe Pavitrakumar M 2023-11-14  473  		memcpy(req->result, sha3_256_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  474  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  475  
188d801c0d4bbe Pavitrakumar M 2023-11-14  476  	case CRYPTO_MODE_HASH_SHA3_384:
188d801c0d4bbe Pavitrakumar M 2023-11-14  477  		memcpy(req->result, sha3_384_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  478  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  479  
188d801c0d4bbe Pavitrakumar M 2023-11-14  480  	case CRYPTO_MODE_HASH_SHA3_512:
188d801c0d4bbe Pavitrakumar M 2023-11-14  481  		memcpy(req->result, sha3_512_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  482  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  483  
188d801c0d4bbe Pavitrakumar M 2023-11-14  484  	case CRYPTO_MODE_MAC_MICHAEL:
188d801c0d4bbe Pavitrakumar M 2023-11-14  485  		memcpy(req->result, michael_mic_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  486  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  487  
188d801c0d4bbe Pavitrakumar M 2023-11-14  488  	case CRYPTO_MODE_MAC_SM4_XCBC:
188d801c0d4bbe Pavitrakumar M 2023-11-14  489  		memcpy(req->result, sm4_xcbc128_zero_message_hash, digest_sz);
188d801c0d4bbe Pavitrakumar M 2023-11-14  490  		break;
188d801c0d4bbe Pavitrakumar M 2023-11-14  491  
188d801c0d4bbe Pavitrakumar M 2023-11-14  492  	default:
188d801c0d4bbe Pavitrakumar M 2023-11-14  493  		return -EINVAL;
188d801c0d4bbe Pavitrakumar M 2023-11-14  494  	}
188d801c0d4bbe Pavitrakumar M 2023-11-14  495  
188d801c0d4bbe Pavitrakumar M 2023-11-14  496  	return 0;
188d801c0d4bbe Pavitrakumar M 2023-11-14  497  }
188d801c0d4bbe Pavitrakumar M 2023-11-14  498  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
