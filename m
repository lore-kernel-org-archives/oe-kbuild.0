Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425510;
	b=ZnDp71rX0QYA4UsKWouHT8R8TYa2M1K+wFZUDGw9VtNYWtyWhGF5D2gkEoNKjmC3yzCv
	 4gNzxyb1uOCO8KVLw3AL4u3riy9QUQZ4K7ZRCcPwmvag9rftSec8l5usaDozwf9pM3RAz
	 Jdafy/03O7uF5BtrGqQNZHK65EazrW8VCYHZv27oGSpG00t1xdOJIJZWfe/cYBa39u2PT
	 3Um/uVQYoucVyjiFoFtFV5wuGT+JVDLNB4DQxr7ntzZFRSj/PftvWKBiYNKd9nqFR2Ar1
	 jjcS4u3lL1RFI9LgXQpKDVv13aXJSEpNs5okFILV0MBvK/XWrgOrMrlVbjonoK6ZnMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425510;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=nhOpRJ03R3U0UsEVk57aPsHWZrtJIuZmuV1JnsIGDbc=;
	b=YXwO8NCDic/hkF5vjwGA3DYTpb9M1TrItjdxfo3kDcuvMfVhr2fF/1k21jZqRLeHWCsR
	 AMs6s/Cy1+OyYcjyQC2fuSWty2gr7mg5tROz5qppuUIf1ipuYQqvuKF7iH/Th6YWVH2/S
	 Uk8342WuTxbhC8e3oajAGy+6JNRLNpQMlFuUOO4HuRrk8VZj/q6Rch9351bfKSOG/Ka/N
	 csYIedOsWb+uqe9/0/NCwds83SuxcF3lDVC8sb2JcDaXr7QpIwq2DQ5j6Hkt6hBmgYnsH
	 ko9ybk3k/0gpIpLu7wxlOcSjhxxzUkScbli88W3SWjzUjoW/tXmsZqPgB2gG7j7LC4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XLVHzrCV;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C36606A326
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 19:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C36606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XLVHzrCV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794425509; x=1825961509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VO1Cn5uT4K0ocj+FI36VV3cP+QAYTrNv6OTtUXPHsKU=;
  b=XLVHzrCVms+zOpT0oILh9Y1YJlmmiSIsAPbDEogo+rLSuqs7EXtMrKZr
   mWf5vUe0dXrkqANVjidPrVuk+/I8hyI+iAqEmNbkeO6OUdKiG+hKuXw/y
   oi7z1uVMVfOr4HWwqzfkBaFuJrCYMHvgwLt+w3xk5rRE2ZNJumss0b8ux
   Gh2Q1og95bWvjT/RyCyCZwgmFq8MzoGAih2iX29tY0+x6LrYgX5Auc1R/
   y5sMuPtwmceVqnbHAmiVG9i79v1KevUyex6K+b7qedimltD9KwiseGfVa
   2XbtuOstEIR7OpXiN8E3TqSl5t/qQUI6C8E9kFyIfN6YvsutF0TY8+Hwp
   Q==;
X-CSE-ConnectionGUID: D5OSzcz2QpypzOj8Xb0RLg==
X-CSE-MsgGUID: zx73d1GRTuyfWmMeDXIhjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3086898"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3086898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 11:31:45 -0800
X-CSE-ConnectionGUID: Jy6G98nvRxaffSWRtIs+7g==
X-CSE-MsgGUID: j8PP/EIXR/O103SdK/GLrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8529033"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Nov 2026 11:31:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRE2n-00000000zZj-26mE;
	Wed, 11 Nov 2026 19:31:41 +0000
Date: Thu, 12 Nov 2026 03:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 28/30] crypto: sa2ul - route requests through
 crypto_engine
Message-ID: <202611120349.vAmMdc8r-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261104-b4-upstream-sa2ul-cleanup-v2-28-15ab90b3f9c2@ti.com>
References: <20261104-b4-upstream-sa2ul-cleanup-v2-28-15ab90b3f9c2@ti.com>
TO: Manorit Chawdhry <m-chawdhry@ti.com>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Keerthy <j-keerthy@ti.com>
TO: Colin Ian King <colin.i.king@gmail.com>
CC: Andrew Davis <afd@ti.com>
CC: Pratham T <t-pratham@ti.com>
CC: Kamlesh Gurudasani <kamlesh@ti.com>
CC: Udit Kumar <u-kumar1@ti.com>
CC: linux-crypto@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Manorit Chawdhry <m-chawdhry@ti.com>

Hi Manorit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c]

url:    https://github.com/intel-lab-lkp/linux/commits/Manorit-Chawdhry/crypto-sa2ul-remove-dead-code/20261104-111411
base:   7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
patch link:    https://lore.kernel.org/r/20261104-b4-upstream-sa2ul-cleanup-v2-28-15ab90b3f9c2%40ti.com
patch subject: [PATCH v2 28/30] crypto: sa2ul - route requests through crypto_engine
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20261112/202611120349.vAmMdc8r-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120349.vAmMdc8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611120349.vAmMdc8r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/sa2ul.c: In function 'sa_aead_run':
>> drivers/crypto/sa2ul.c:1933:27: warning: variable 'enc_size' set but not used [-Wunused-but-set-variable=]
    1933 |         size_t auth_size, enc_size;
         |                           ^~~~~~~~


vim +/enc_size +1933 drivers/crypto/sa2ul.c

d2c8ac187fc922 Keerthy          2020-07-13  1927  
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1928  static int sa_aead_run(struct aead_request *req, int enc)
d2c8ac187fc922 Keerthy          2020-07-13  1929  {
d2c8ac187fc922 Keerthy          2020-07-13  1930  	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
d2c8ac187fc922 Keerthy          2020-07-13  1931  	struct sa_tfm_ctx *ctx = crypto_aead_ctx(tfm);
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1932  	struct sa_aead_req_ctx *rctx = aead_request_ctx(req);
d2c8ac187fc922 Keerthy          2020-07-13 @1933  	size_t auth_size, enc_size;
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1934  	unsigned long flags;
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1935  	int ret;
d2c8ac187fc922 Keerthy          2020-07-13  1936  
d2c8ac187fc922 Keerthy          2020-07-13  1937  	enc_size = req->cryptlen;
d2c8ac187fc922 Keerthy          2020-07-13  1938  	auth_size = req->assoclen + req->cryptlen;
d2c8ac187fc922 Keerthy          2020-07-13  1939  
d2c8ac187fc922 Keerthy          2020-07-13  1940  	if (!enc) {
d2c8ac187fc922 Keerthy          2020-07-13  1941  		enc_size -= crypto_aead_authsize(tfm);
d2c8ac187fc922 Keerthy          2020-07-13  1942  		auth_size -= crypto_aead_authsize(tfm);
d2c8ac187fc922 Keerthy          2020-07-13  1943  	}
d2c8ac187fc922 Keerthy          2020-07-13  1944  
d2c8ac187fc922 Keerthy          2020-07-13  1945  	if (auth_size > SA_MAX_DATA_SZ ||
d2c8ac187fc922 Keerthy          2020-07-13  1946  	    (auth_size >= SA_UNSAFE_DATA_SZ_MIN &&
d2c8ac187fc922 Keerthy          2020-07-13  1947  	     auth_size <= SA_UNSAFE_DATA_SZ_MAX)) {
d2c8ac187fc922 Keerthy          2020-07-13  1948  		struct aead_request *subreq = aead_request_ctx(req);
d2c8ac187fc922 Keerthy          2020-07-13  1949  		int ret;
d2c8ac187fc922 Keerthy          2020-07-13  1950  
d2c8ac187fc922 Keerthy          2020-07-13  1951  		aead_request_set_tfm(subreq, ctx->fallback.aead);
d2c8ac187fc922 Keerthy          2020-07-13  1952  		aead_request_set_callback(subreq, req->base.flags,
d2c8ac187fc922 Keerthy          2020-07-13  1953  					  req->base.complete, req->base.data);
d2c8ac187fc922 Keerthy          2020-07-13  1954  		aead_request_set_crypt(subreq, req->src, req->dst,
d2c8ac187fc922 Keerthy          2020-07-13  1955  				       req->cryptlen, req->iv);
d2c8ac187fc922 Keerthy          2020-07-13  1956  		aead_request_set_ad(subreq, req->assoclen);
d2c8ac187fc922 Keerthy          2020-07-13  1957  
d2c8ac187fc922 Keerthy          2020-07-13  1958  		ret = enc ? crypto_aead_encrypt(subreq) :
d2c8ac187fc922 Keerthy          2020-07-13  1959  			crypto_aead_decrypt(subreq);
d2c8ac187fc922 Keerthy          2020-07-13  1960  		return ret;
d2c8ac187fc922 Keerthy          2020-07-13  1961  	}
d2c8ac187fc922 Keerthy          2020-07-13  1962  
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1963  	rctx->enc = enc;
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1964  
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1965  	spin_lock_irqsave(&ctx->dev_data->request_lock, flags);
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1966  	ret = ctx->dev_data->stopping ? -ESHUTDOWN :
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1967  		crypto_transfer_aead_request_to_engine(ctx->dev_data->engine, req);
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1968  	spin_unlock_irqrestore(&ctx->dev_data->request_lock, flags);
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1969  	return ret;
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1970  }
e12a9e13f96716 Manorit Chawdhry 2026-11-04  1971  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
