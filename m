Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C9E6168C
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Mar 2024 19:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711653264; cv=none; b=S9s5N1u9rHl8o1ERujZPWPfXQhFe29gfO0pcVIquk8UxyxPJwMfSXU/j1VDfIAguurG6p1pLoXvAuyx/4N/wsgkgNAtUiap9dBg0+ElZDu50WDQ0l7Yxpos8B9QSiwxZeTesLTcgp47WNPOHG5wQBEFWkosUqH8DAmKYl+SF7ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711653264; c=relaxed/simple;
	bh=kJodwuiBu0ozcPontSMe2Z76q9tl8a+5ml8u5UJmbGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lAGq4FNXIOWOAEbtI5erz06WAlV6s+6EnjkuQBUvMwjU+PFuce3Zb4eQ3bx+vfbkWqO1MdxnB6u+lhf4TUhOiWGhGDOZAqSBvaN6HPn+ckx4hKkLPF1df9UzhGjA/bH/3hF4zo+k5ktOsKwNhkMKzpphqMxXtMaVxtAYC/+ge2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goDnrGZr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goDnrGZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711653263; x=1743189263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kJodwuiBu0ozcPontSMe2Z76q9tl8a+5ml8u5UJmbGg=;
  b=goDnrGZr3+EHT+oFAVhvb71rdCt0wK2vc8rf5MYAZYbcQwhBDwNHdjWs
   NSFaQYNSyiNwdftpOhPyIbpH8EDkmn4JGt1Hcq3+cAOes0v6COPpQqbtn
   Oh3t9SqwKM8zQnZFvlY0TY/qzdzx3o05irKntOXVV/Bq7X37w0CWftnsQ
   I9EgEwZi6OvoRtsFyGbID7A9A8t0ch6E8YAlIzx4+OeOOEalFyHBe1U/U
   ne/CT/rkWYyUZ4xDuJhQwJ6BNxQ6sYM8+Bey2CcK3GVoVd4nkdsGhJ7Ty
   OXYRkgmspkjwWmAK1K68lbh+JnOi0pDCvfwa/RrantPOPzXK9Tx56RA6P
   Q==;
X-CSE-ConnectionGUID: VL3fIef0Q+KCY1O29QuMwg==
X-CSE-MsgGUID: bG0ByfgQTVyF//KNSVl/yA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6956267"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6956267"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 12:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21450372"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Mar 2024 12:14:20 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpvCc-0002Sw-0E;
	Thu, 28 Mar 2024 19:14:18 +0000
Date: Fri, 29 Mar 2024 03:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/6] crypto: x86/aes-xts - wire up AESNI + AVX
 implementation
Message-ID: <202403290346.nnYJyAAY-lkp@intel.com>
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
In-Reply-To: <20240326080305.402382-4-ebiggers@kernel.org>
References: <20240326080305.402382-4-ebiggers@kernel.org>
TO: Eric Biggers <ebiggers@kernel.org>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4cece764965020c22cff7665b18a012006359095]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Biggers/x86-add-kconfig-symbols-for-assembler-VAES-and-VPCLMULQDQ-support/20240326-160900
base:   4cece764965020c22cff7665b18a012006359095
patch link:    https://lore.kernel.org/r/20240326080305.402382-4-ebiggers%40kernel.org
patch subject: [PATCH 3/6] crypto: x86/aes-xts - wire up AESNI + AVX implementation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r081-20240328 (https://download.01.org/0day-ci/archive/20240329/202403290346.nnYJyAAY-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403290346.nnYJyAAY-lkp@intel.com/

smatch warnings:
arch/x86/crypto/aesni-intel_glue.c:1200 xts_crypt_slowpath() error: uninitialized symbol 'err'.

vim +/err +1200 arch/x86/crypto/aesni-intel_glue.c

d77e52317c187e Eric Biggers 2024-03-26  1144  
d77e52317c187e Eric Biggers 2024-03-26  1145  typedef void (*xts_asm_func)(const struct aesni_xts_ctx *key,
d77e52317c187e Eric Biggers 2024-03-26  1146  			     const u8 *src, u8 *dst, size_t len,
d77e52317c187e Eric Biggers 2024-03-26  1147  			     u8 iv[AES_BLOCK_SIZE], int flags);
d77e52317c187e Eric Biggers 2024-03-26  1148  
d77e52317c187e Eric Biggers 2024-03-26  1149  /*
d77e52317c187e Eric Biggers 2024-03-26  1150   * This handles cases where the full message isn't available in one step of the
d77e52317c187e Eric Biggers 2024-03-26  1151   * scatterlist walk.
d77e52317c187e Eric Biggers 2024-03-26  1152   */
d77e52317c187e Eric Biggers 2024-03-26  1153  static noinline int
d77e52317c187e Eric Biggers 2024-03-26  1154  xts_crypt_slowpath(struct skcipher_request *req,
d77e52317c187e Eric Biggers 2024-03-26  1155  		   struct skcipher_walk *walk, xts_asm_func asm_func)
d77e52317c187e Eric Biggers 2024-03-26  1156  {
d77e52317c187e Eric Biggers 2024-03-26  1157  	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
d77e52317c187e Eric Biggers 2024-03-26  1158  	const struct aesni_xts_ctx *ctx = aes_xts_ctx(tfm);
d77e52317c187e Eric Biggers 2024-03-26  1159  	int tail = req->cryptlen % AES_BLOCK_SIZE;
d77e52317c187e Eric Biggers 2024-03-26  1160  	struct scatterlist sg_src[2], sg_dst[2];
d77e52317c187e Eric Biggers 2024-03-26  1161  	struct skcipher_request subreq;
d77e52317c187e Eric Biggers 2024-03-26  1162  	struct scatterlist *src, *dst;
d77e52317c187e Eric Biggers 2024-03-26  1163  	int flags = XTS_FIRST | XTS_UPDATE_IV;
d77e52317c187e Eric Biggers 2024-03-26  1164  	int err;
d77e52317c187e Eric Biggers 2024-03-26  1165  
d77e52317c187e Eric Biggers 2024-03-26  1166  	/*
d77e52317c187e Eric Biggers 2024-03-26  1167  	 * If the message length isn't divisible by the AES block size, then
d77e52317c187e Eric Biggers 2024-03-26  1168  	 * separate off the last full block and the partial block.  This ensures
d77e52317c187e Eric Biggers 2024-03-26  1169  	 * that they are processed in the same call to the assembly function,
d77e52317c187e Eric Biggers 2024-03-26  1170  	 * which is required for ciphertext stealing.
d77e52317c187e Eric Biggers 2024-03-26  1171  	 */
d77e52317c187e Eric Biggers 2024-03-26  1172  	if (tail) {
d77e52317c187e Eric Biggers 2024-03-26  1173  		skcipher_walk_abort(walk);
d77e52317c187e Eric Biggers 2024-03-26  1174  
d77e52317c187e Eric Biggers 2024-03-26  1175  		skcipher_request_set_tfm(&subreq, tfm);
d77e52317c187e Eric Biggers 2024-03-26  1176  		skcipher_request_set_callback(&subreq,
d77e52317c187e Eric Biggers 2024-03-26  1177  					      skcipher_request_flags(req),
d77e52317c187e Eric Biggers 2024-03-26  1178  					      NULL, NULL);
d77e52317c187e Eric Biggers 2024-03-26  1179  		skcipher_request_set_crypt(&subreq, req->src, req->dst,
d77e52317c187e Eric Biggers 2024-03-26  1180  					   req->cryptlen - tail - AES_BLOCK_SIZE,
d77e52317c187e Eric Biggers 2024-03-26  1181  					   req->iv);
d77e52317c187e Eric Biggers 2024-03-26  1182  		req = &subreq;
d77e52317c187e Eric Biggers 2024-03-26  1183  		err = skcipher_walk_virt(walk, req, false);
d77e52317c187e Eric Biggers 2024-03-26  1184  	}
d77e52317c187e Eric Biggers 2024-03-26  1185  
d77e52317c187e Eric Biggers 2024-03-26  1186  	while (walk->nbytes) {
d77e52317c187e Eric Biggers 2024-03-26  1187  		unsigned int nbytes = walk->nbytes;
d77e52317c187e Eric Biggers 2024-03-26  1188  
d77e52317c187e Eric Biggers 2024-03-26  1189  		if (nbytes < walk->total)
d77e52317c187e Eric Biggers 2024-03-26  1190  			nbytes = round_down(nbytes, AES_BLOCK_SIZE);
d77e52317c187e Eric Biggers 2024-03-26  1191  
d77e52317c187e Eric Biggers 2024-03-26  1192  		kernel_fpu_begin();
d77e52317c187e Eric Biggers 2024-03-26  1193  		(*asm_func)(ctx, walk->src.virt.addr, walk->dst.virt.addr,
d77e52317c187e Eric Biggers 2024-03-26  1194  			    nbytes, req->iv, flags);
d77e52317c187e Eric Biggers 2024-03-26  1195  		kernel_fpu_end();
d77e52317c187e Eric Biggers 2024-03-26  1196  		flags &= ~XTS_FIRST;
d77e52317c187e Eric Biggers 2024-03-26  1197  		err = skcipher_walk_done(walk, walk->nbytes - nbytes);
d77e52317c187e Eric Biggers 2024-03-26  1198  	}
d77e52317c187e Eric Biggers 2024-03-26  1199  
d77e52317c187e Eric Biggers 2024-03-26 @1200  	if (err || !tail)
d77e52317c187e Eric Biggers 2024-03-26  1201  		return err;
d77e52317c187e Eric Biggers 2024-03-26  1202  
d77e52317c187e Eric Biggers 2024-03-26  1203  	/* Do ciphertext stealing with the last full block and partial block. */
d77e52317c187e Eric Biggers 2024-03-26  1204  
d77e52317c187e Eric Biggers 2024-03-26  1205  	dst = src = scatterwalk_ffwd(sg_src, req->src, req->cryptlen);
d77e52317c187e Eric Biggers 2024-03-26  1206  	if (req->dst != req->src)
d77e52317c187e Eric Biggers 2024-03-26  1207  		dst = scatterwalk_ffwd(sg_dst, req->dst, req->cryptlen);
d77e52317c187e Eric Biggers 2024-03-26  1208  
d77e52317c187e Eric Biggers 2024-03-26  1209  	skcipher_request_set_crypt(req, src, dst, AES_BLOCK_SIZE + tail,
d77e52317c187e Eric Biggers 2024-03-26  1210  				   req->iv);
d77e52317c187e Eric Biggers 2024-03-26  1211  
d77e52317c187e Eric Biggers 2024-03-26  1212  	err = skcipher_walk_virt(walk, req, false);
d77e52317c187e Eric Biggers 2024-03-26  1213  	if (err)
d77e52317c187e Eric Biggers 2024-03-26  1214  		return err;
d77e52317c187e Eric Biggers 2024-03-26  1215  
d77e52317c187e Eric Biggers 2024-03-26  1216  	kernel_fpu_begin();
d77e52317c187e Eric Biggers 2024-03-26  1217  	(*asm_func)(ctx, walk->src.virt.addr, walk->dst.virt.addr, walk->nbytes,
d77e52317c187e Eric Biggers 2024-03-26  1218  		    req->iv, flags);
d77e52317c187e Eric Biggers 2024-03-26  1219  	kernel_fpu_end();
d77e52317c187e Eric Biggers 2024-03-26  1220  
d77e52317c187e Eric Biggers 2024-03-26  1221  	return skcipher_walk_done(walk, 0);
d77e52317c187e Eric Biggers 2024-03-26  1222  }
d77e52317c187e Eric Biggers 2024-03-26  1223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
