Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BAE15B99A
	for <oe-kbuild@lists.linux.dev>; Wed, 29 May 2024 07:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716966792; cv=none; b=rxsFJQiDfHfuuJyC35M6s5DR9x5yh32pj9Cku4YLqrc2JDmb5c6gpSTV39z+aazfGHJ/Sj7CWnvxezyYnpPCsEp9ENKj/4+XhBb65WtRQJEjO0h6M0Eld9Wmvf2uzdXyjkI9obxgnrGtbQRMLofQJUyluRtWn91powA7MT371v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716966792; c=relaxed/simple;
	bh=3On8p+Htk3t7eAw94MOZ6EsQLn5MmJlSReyopLxMrAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UGXZdVi8psfruRKmED7EAi2U6pXt/EkJ/YVkANfOJ+Dimvp8ljnaEMAKLQrJ1UOUxD07TTmLt5Yr2+tFYoTZG/sVVeAhocwC9ijUIgpXoEiiOSLK+mKXxRr24MvvqPybGsR0C0J6Qr8G3Soa2fUH0TOzirzxGk5sbnB8bv6E1Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etWgwoD/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etWgwoD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716966790; x=1748502790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3On8p+Htk3t7eAw94MOZ6EsQLn5MmJlSReyopLxMrAo=;
  b=etWgwoD/IjDb1tjw/Fa5SHP/trNfkWhvkLXI6Jmy3ajlygv7KiJnnlUN
   dn+A4marOfaK2qAgLiDZKtfCWAHTJKBxtEKzioCXEsUsj0+hg7LNMTTKn
   42vf0Yem6O7o0CfQNQcvcAMbTa4KW20HfMwYPlTdopCH4DuZOVVM3Cali
   BtHmH/ZOUkmP/gX/Dglf7Vr7vl+X8k76bgLAtXc3Y/oXbm6Bk99RdENAf
   uT6xXNbkN8rcJ8zxg4ki3uLH+G0r1mfDq/7AkwF3HEg/pum8O/+3jDjue
   qas3XpPwfH9UScPWj2uiO06UnkC/01ihIVbpevrvvP6Ytva3/6lEVIaYp
   Q==;
X-CSE-ConnectionGUID: luAonjXLRWmnB26piXkiPw==
X-CSE-MsgGUID: QvaPZSvdSQuYhqrNKbn7/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11744644"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="11744644"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 00:13:09 -0700
X-CSE-ConnectionGUID: SAG/qwJKRWm9DXR1efXfQg==
X-CSE-MsgGUID: /y8gkBc3Q7iy/B1oTfFYGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="58517357"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 May 2024 00:13:08 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCDUf-000DFP-2m;
	Wed, 29 May 2024 07:13:05 +0000
Date: Wed, 29 May 2024 15:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:tpm2key-v7 8/9]
 crypto/asymmetric_keys/tpm2_key_rsa.c:636 tpm2_key_rsa_preparse() error:
 uninitialized symbol 'ret'.
Message-ID: <202405291528.FxUKVyP2-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>
CC: James Prestwood <prestwoj@gmail.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v7
head:   892305fec7841bf841a9c19e01c999c5f4b4e831
commit: 4970b8d723c3af732b21a8bf7c1eebfb03792457 [8/9] keys: asymmetric: Add tpm2_key_rsa
:::::: branch date: 10 hours ago
:::::: commit date: 19 hours ago
config: alpha-randconfig-r081-20240529 (https://download.01.org/0day-ci/archive/20240529/202405291528.FxUKVyP2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405291528.FxUKVyP2-lkp@intel.com/

smatch warnings:
crypto/asymmetric_keys/tpm2_key_rsa.c:636 tpm2_key_rsa_preparse() error: uninitialized symbol 'ret'.

vim +/ret +636 crypto/asymmetric_keys/tpm2_key_rsa.c

4970b8d723c3af Jarkko Sakkinen 2024-05-26  625  
4970b8d723c3af Jarkko Sakkinen 2024-05-26  626  /*
4970b8d723c3af Jarkko Sakkinen 2024-05-26  627   * Attempt to parse a data blob for a key as a TPM private key blob.
4970b8d723c3af Jarkko Sakkinen 2024-05-26  628   */
4970b8d723c3af Jarkko Sakkinen 2024-05-26  629  static int tpm2_key_rsa_preparse(struct key_preparsed_payload *prep)
4970b8d723c3af Jarkko Sakkinen 2024-05-26  630  {
4970b8d723c3af Jarkko Sakkinen 2024-05-26  631  	struct tpm2_key *key;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  632  	int ret;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  633  
4970b8d723c3af Jarkko Sakkinen 2024-05-26  634  	key = tpm2_key_decode(prep->data, prep->datalen);
4970b8d723c3af Jarkko Sakkinen 2024-05-26  635  	if (IS_ERR(key))
4970b8d723c3af Jarkko Sakkinen 2024-05-26 @636  		return ret;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  637  
4970b8d723c3af Jarkko Sakkinen 2024-05-26  638  	if (key->oid != OID_TPMLoadableKey) {
4970b8d723c3af Jarkko Sakkinen 2024-05-26  639  		kfree(key);
4970b8d723c3af Jarkko Sakkinen 2024-05-26  640  		return -EBADMSG;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  641  	}
4970b8d723c3af Jarkko Sakkinen 2024-05-26  642  
4970b8d723c3af Jarkko Sakkinen 2024-05-26  643  	ret = __tpm2_key_rsa_preparse(key);
4970b8d723c3af Jarkko Sakkinen 2024-05-26  644  	if (ret < 0) {
4970b8d723c3af Jarkko Sakkinen 2024-05-26  645  		kfree(key);
4970b8d723c3af Jarkko Sakkinen 2024-05-26  646  		return ret;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  647  	}
4970b8d723c3af Jarkko Sakkinen 2024-05-26  648  
4970b8d723c3af Jarkko Sakkinen 2024-05-26  649  	prep->payload.data[asym_subtype] = &tpm2_key_rsa_subtype;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  650  	prep->payload.data[asym_key_ids] = NULL;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  651  	prep->payload.data[asym_crypto] = key;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  652  	prep->payload.data[asym_auth] = NULL;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  653  	prep->quotalen = 100;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  654  
4970b8d723c3af Jarkko Sakkinen 2024-05-26  655  	return 0;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  656  }
4970b8d723c3af Jarkko Sakkinen 2024-05-26  657  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
