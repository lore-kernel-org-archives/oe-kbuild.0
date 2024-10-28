Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C31189902
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 03:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087593; cv=none; b=Wd3iEk+7kZSFNRMKP1pHt+ry7xwIb0VzJhLGEwT3F5O4/OEN4jz+52aeGVf040oKf4x1/wWkduQ0XwA8MZ8q656VoORQ/UfRcPoNPnRhXqT19UOGZ72RKyo7ssTq0YobqNxVIVnk5rwEhAFhpSQjYa3Daw3VBLwx2o5lmuaxMcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087593; c=relaxed/simple;
	bh=nyYxCWIt7wGVrp5kC/Ag8sMf1/u0Xm4xCXbYBHvHJhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KbHEcVBDs8k+SgVJf5m5or1tdM7LHhRQiFhjkBubownZP1LCzkoUkLZIYMdRHKaJIevE4bONAnKcE/7QL+GfBUD3XUYVy1gZQiCRw98hnArdZwNOkDlrwRrfVMAuPerpltAOb006ckROiJKnY7lnnuQiGIpJORxQajRCz0I5pms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6FKe6gH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6FKe6gH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730087590; x=1761623590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nyYxCWIt7wGVrp5kC/Ag8sMf1/u0Xm4xCXbYBHvHJhY=;
  b=m6FKe6gHC5K/yE6rZ9o//HkqymX0y964uNjCJbor7s4nKL6ge7h1RqlH
   u0u1LOAubSMSYTVH46HAUJqWx+wy1DrOjlOIirRIQ0U+Pg0MeHKzimBkq
   3F5ZG0u08rCzpifAbwn4CDZ9DMcZdkQsUCbtEbXXvt0/hTCCVAhXOGar+
   Ux9BxmmsqunFI2J6TsGoUCxot9f4YKensz3GlNfro2pTlmSIgvCcNwWfo
   f+woI0cGNjY5eENLOJNZtHEfWcB4Ay2Dgk6KYDZAV2zSWLGHPgKWCgjHR
   USspqywRG3oo3DWi5fyxGuxWEZdxoRnpjjWCOymGdLq2ZttPyiDECs1eS
   w==;
X-CSE-ConnectionGUID: APaHQAESQnabDvUWmBJDBA==
X-CSE-MsgGUID: 0l6pC/bbRdKI0z2WoDXxxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29634388"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29634388"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 20:53:10 -0700
X-CSE-ConnectionGUID: TE1yGfyDQT2PwNj5gr3CCA==
X-CSE-MsgGUID: dJnoet+cT/ugSjUwOjirUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="81059993"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Oct 2024 20:53:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5GoU-000bEW-0h;
	Mon, 28 Oct 2024 03:53:06 +0000
Date: Mon, 28 Oct 2024 11:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/3] crypto: Add Mediatek EIP-93 crypto engine support
Message-ID: <202410281155.jEN0wSbS-lkp@intel.com>
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
In-Reply-To: <20241025094734.1614-3-ansuelsmth@gmail.com>
References: <20241025094734.1614-3-ansuelsmth@gmail.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Antoine Tenart <atenart@kernel.org>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Will Deacon <will@kernel.org>
TO: Waiman Long <longman@redhat.com>
TO: Boqun Feng <boqun.feng@gmail.com>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nick Desaulniers <ndesaulniers@google.com>
TO: Bill Wendling <morbo@google.com>
TO: Justin Stitt <justinstitt@google.com>
TO: linux-crypto@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: llvm@lists.linux.dev
TO: upstream@airoha.com
CC: Richard van Schagen <vschagen@icloud.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master tip/locking/core linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-crypto-Add-Inside-Secure-SafeXcel-EIP-93-crypto-engine/20241025-175032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241025094734.1614-3-ansuelsmth%40gmail.com
patch subject: [PATCH v4 3/3] crypto: Add Mediatek EIP-93 crypto engine support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: csky-randconfig-r071-20241028 (https://download.01.org/0day-ci/archive/20241028/202410281155.jEN0wSbS-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410281155.jEN0wSbS-lkp@intel.com/

New smatch warnings:
drivers/crypto/inside-secure/eip93/eip93-cipher.c:118 eip93_skcipher_setkey() error: uninitialized symbol 'ret'.
drivers/crypto/inside-secure/eip93/eip93-aead.c:125 eip93_aead_setkey() error: uninitialized symbol 'ret'.
drivers/crypto/inside-secure/eip93/eip93-hash.c:26 eip93_hash_free_data_blocks() error: dereferencing freed memory 'block'
drivers/crypto/inside-secure/eip93/eip93-hash.c:162 _eip93_hash_init() error: uninitialized symbol 'sa_record_hmac'.

Old smatch warnings:
drivers/crypto/inside-secure/eip93/eip93-hash.c:285 eip93_send_hash_req() error: uninitialized symbol 'crypto_async_idr'.

vim +/ret +118 drivers/crypto/inside-secure/eip93/eip93-cipher.c

883ad7684f17d2 Christian Marangi 2024-10-25   77  
883ad7684f17d2 Christian Marangi 2024-10-25   78  static int eip93_skcipher_setkey(struct crypto_skcipher *ctfm, const u8 *key,
883ad7684f17d2 Christian Marangi 2024-10-25   79  				 unsigned int len)
883ad7684f17d2 Christian Marangi 2024-10-25   80  {
883ad7684f17d2 Christian Marangi 2024-10-25   81  	struct crypto_tfm *tfm = crypto_skcipher_tfm(ctfm);
883ad7684f17d2 Christian Marangi 2024-10-25   82  	struct eip93_crypto_ctx *ctx = crypto_tfm_ctx(tfm);
883ad7684f17d2 Christian Marangi 2024-10-25   83  	struct eip93_alg_template *tmpl = container_of(tfm->__crt_alg,
883ad7684f17d2 Christian Marangi 2024-10-25   84  						     struct eip93_alg_template,
883ad7684f17d2 Christian Marangi 2024-10-25   85  						     alg.skcipher.base);
883ad7684f17d2 Christian Marangi 2024-10-25   86  	struct sa_record *sa_record = ctx->sa_record;
883ad7684f17d2 Christian Marangi 2024-10-25   87  	unsigned int keylen = len;
883ad7684f17d2 Christian Marangi 2024-10-25   88  	u32 flags = tmpl->flags;
883ad7684f17d2 Christian Marangi 2024-10-25   89  	u32 nonce = 0;
883ad7684f17d2 Christian Marangi 2024-10-25   90  	int ret;
883ad7684f17d2 Christian Marangi 2024-10-25   91  
883ad7684f17d2 Christian Marangi 2024-10-25   92  	if (!key || !keylen)
883ad7684f17d2 Christian Marangi 2024-10-25   93  		return -EINVAL;
883ad7684f17d2 Christian Marangi 2024-10-25   94  
883ad7684f17d2 Christian Marangi 2024-10-25   95  	if (IS_RFC3686(flags)) {
883ad7684f17d2 Christian Marangi 2024-10-25   96  		if (len < CTR_RFC3686_NONCE_SIZE)
883ad7684f17d2 Christian Marangi 2024-10-25   97  			return -EINVAL;
883ad7684f17d2 Christian Marangi 2024-10-25   98  
883ad7684f17d2 Christian Marangi 2024-10-25   99  		keylen = len - CTR_RFC3686_NONCE_SIZE;
883ad7684f17d2 Christian Marangi 2024-10-25  100  		memcpy(&nonce, key + keylen, CTR_RFC3686_NONCE_SIZE);
883ad7684f17d2 Christian Marangi 2024-10-25  101  	}
883ad7684f17d2 Christian Marangi 2024-10-25  102  
883ad7684f17d2 Christian Marangi 2024-10-25  103  	if (flags & EIP93_ALG_DES) {
883ad7684f17d2 Christian Marangi 2024-10-25  104  		ctx->blksize = DES_BLOCK_SIZE;
883ad7684f17d2 Christian Marangi 2024-10-25  105  		ret = verify_skcipher_des_key(ctfm, key);
883ad7684f17d2 Christian Marangi 2024-10-25  106  	}
883ad7684f17d2 Christian Marangi 2024-10-25  107  	if (flags & EIP93_ALG_3DES) {
883ad7684f17d2 Christian Marangi 2024-10-25  108  		ctx->blksize = DES3_EDE_BLOCK_SIZE;
883ad7684f17d2 Christian Marangi 2024-10-25  109  		ret = verify_skcipher_des3_key(ctfm, key);
883ad7684f17d2 Christian Marangi 2024-10-25  110  	}
883ad7684f17d2 Christian Marangi 2024-10-25  111  
883ad7684f17d2 Christian Marangi 2024-10-25  112  	if (flags & EIP93_ALG_AES) {
883ad7684f17d2 Christian Marangi 2024-10-25  113  		struct crypto_aes_ctx aes;
883ad7684f17d2 Christian Marangi 2024-10-25  114  
883ad7684f17d2 Christian Marangi 2024-10-25  115  		ctx->blksize = AES_BLOCK_SIZE;
883ad7684f17d2 Christian Marangi 2024-10-25  116  		ret = aes_expandkey(&aes, key, keylen);
883ad7684f17d2 Christian Marangi 2024-10-25  117  	}
883ad7684f17d2 Christian Marangi 2024-10-25 @118  	if (ret)
883ad7684f17d2 Christian Marangi 2024-10-25  119  		return ret;
883ad7684f17d2 Christian Marangi 2024-10-25  120  
883ad7684f17d2 Christian Marangi 2024-10-25  121  	eip93_set_sa_record(sa_record, keylen, flags);
883ad7684f17d2 Christian Marangi 2024-10-25  122  
883ad7684f17d2 Christian Marangi 2024-10-25  123  	memcpy(sa_record->sa_key, key, keylen);
883ad7684f17d2 Christian Marangi 2024-10-25  124  	ctx->sa_nonce = nonce;
883ad7684f17d2 Christian Marangi 2024-10-25  125  	sa_record->sa_nonce = nonce;
883ad7684f17d2 Christian Marangi 2024-10-25  126  
883ad7684f17d2 Christian Marangi 2024-10-25  127  	return 0;
883ad7684f17d2 Christian Marangi 2024-10-25  128  }
883ad7684f17d2 Christian Marangi 2024-10-25  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
