Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFFB374F5
	for <oe-kbuild@lists.linux.dev>; Fri, 24 May 2024 06:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716531275; cv=none; b=bFCFIDmRliXO3eUwonCe4U9BXBng9Cuq8zy/gb6rkoVUgeqhv4ydDkMzWQ2PP/Aa5w8jP43MMwP4ktCJyOlfieUha7xgpdS9XWtNlVa9BuI2P2NpOhga9c0N6KDORXa/M0OjOE0hN3LrfBGNyrXHqdUEQjvNmdTjlAU0u5DgL2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716531275; c=relaxed/simple;
	bh=rN9R3A83syLLgFviR/Oj0y/zepOHJtygnUrieM09v3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dR+0yvYTnZpKn1jliBoKz/MGoPEOup4FaIsYBv+yZJTOi2yuzywtxRA+xRAqemoi6f4eTzJtKRAvfGns/8jNe/U+vinJGuwibc+g8fxDWsgNQhFD2o5eqF3s52oiPHIhWx8/FrbuWEO71BCaer4XdSajNBmhSEM9Dkyt9NH43Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcAnMKKP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcAnMKKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716531273; x=1748067273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rN9R3A83syLLgFviR/Oj0y/zepOHJtygnUrieM09v3U=;
  b=LcAnMKKPH8ho27241Dl6Tz4c8xKfUBpVS5m2znjVhMNjm1uvD8m6crzH
   GhzxtzgWUVU51d1nbrqaHjNOiC7qHCN1lWPnsHUR90eGr5DIzKVvWrQGH
   riEOctVTzRX96YvpWVBNBNVJMzqjtUzkYLQ3YyuAsSgw/GmKNNXvTVYvp
   ndhjc2PtrrsLQJm/W6He4+ctIjJLMiI9ZFAGhDkqCzZFOXbuUu0k9yncm
   l54toZnJPQr2UcgPXOiYL8SSkG1OAq1q35YFXXk1ABer7jW8G6ldvDRDS
   tz129JBUZXHZ3pjnR+K56L6+h8c7dRlRWQ/5YaeuoE08GPM23Zp/LNQY1
   w==;
X-CSE-ConnectionGUID: bNvVlJ8nTfCsDiOQNWjCsg==
X-CSE-MsgGUID: JXGnS6+pQ9ePuHoHmCndjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="11675508"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="11675508"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 23:14:31 -0700
X-CSE-ConnectionGUID: xncxBZ2MTzS/Bkt3cWxA+w==
X-CSE-MsgGUID: bk2rHTbuQ8K/Ikg6479uDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="33795743"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 May 2024 23:14:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAOCC-0003wv-0A;
	Fri, 24 May 2024 06:14:28 +0000
Date: Fri, 24 May 2024 14:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] crypto: x86/aesni - Update aesni_set_key() to return void
Message-ID: <202405241440.ksMTxyPy-lkp@intel.com>
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
In-Reply-To: <20240311213232.128240-1-chang.seok.bae@intel.com>
References: <20240311213232.128240-1-chang.seok.bae@intel.com>
TO: "Chang S. Bae" <chang.seok.bae@intel.com>

Hi Chang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.9]
[cannot apply to herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chang-S-Bae/crypto-x86-aesni-Update-aesni_set_key-to-return-void/20240523-071024
base:   v6.9
patch link:    https://lore.kernel.org/r/20240311213232.128240-1-chang.seok.bae%40intel.com
patch subject: [PATCH] crypto: x86/aesni - Update aesni_set_key() to return void
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20240524 (https://download.01.org/0day-ci/archive/20240524/202405241440.ksMTxyPy-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405241440.ksMTxyPy-lkp@intel.com/

smatch warnings:
arch/x86/crypto/aesni-intel_glue.c:248 aes_set_key_common() error: uninitialized symbol 'err'.

vim +/err +248 arch/x86/crypto/aesni-intel_glue.c

e12a68b3c6ac2c Chang S. Bae   2023-09-28  230  
28b776098379fb Eric Biggers   2023-07-14  231  static int aes_set_key_common(struct crypto_aes_ctx *ctx,
54b6a1bd5364ac Huang Ying     2009-01-18  232  			      const u8 *in_key, unsigned int key_len)
54b6a1bd5364ac Huang Ying     2009-01-18  233  {
54b6a1bd5364ac Huang Ying     2009-01-18  234  	int err;
54b6a1bd5364ac Huang Ying     2009-01-18  235  
54b6a1bd5364ac Huang Ying     2009-01-18  236  	if (key_len != AES_KEYSIZE_128 && key_len != AES_KEYSIZE_192 &&
674f368a952c48 Eric Biggers   2019-12-30  237  	    key_len != AES_KEYSIZE_256)
54b6a1bd5364ac Huang Ying     2009-01-18  238  		return -EINVAL;
54b6a1bd5364ac Huang Ying     2009-01-18  239  
f2abe0d72b2167 Eric Biggers   2019-03-12  240  	if (!crypto_simd_usable())
2c53fd11f76246 Ard Biesheuvel 2019-07-02  241  		err = aes_expandkey(ctx, in_key, key_len);
54b6a1bd5364ac Huang Ying     2009-01-18  242  	else {
54b6a1bd5364ac Huang Ying     2009-01-18  243  		kernel_fpu_begin();
36ac212f978e58 Chang S. Bae   2024-03-11  244  		aesni_set_key(ctx, in_key, key_len);
54b6a1bd5364ac Huang Ying     2009-01-18  245  		kernel_fpu_end();
54b6a1bd5364ac Huang Ying     2009-01-18  246  	}
54b6a1bd5364ac Huang Ying     2009-01-18  247  
54b6a1bd5364ac Huang Ying     2009-01-18 @248  	return err;
54b6a1bd5364ac Huang Ying     2009-01-18  249  }
54b6a1bd5364ac Huang Ying     2009-01-18  250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
