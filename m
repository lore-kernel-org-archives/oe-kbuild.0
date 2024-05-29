Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA83D6B
	for <oe-kbuild@lists.linux.dev>; Wed, 29 May 2024 01:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716947631; cv=none; b=mm+b9wF4MvWcsQED93nZHM/gRoWeeQPKcWf/0rONFNLmS7BLyN434X3EGXo/gjY81odSvsasgmpjO6+clkbd+5L4exffyywzwTNjoiKKF4WyaZGyObRsbjaI8/F862xaP/uHK2Z58XapQ5NdIW+xVUnYU/efzhkOIrJdAtpA//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716947631; c=relaxed/simple;
	bh=nFFeHdtO+FkJncVunddY3QuvNWr9ZxBIfr8dHZXAKZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsSBFCkSxNBrbgAC+T4pUAYSvIKh9rbYRuT1jAnyM+mDbczxBt+xTn5JzkNJrhVNPA8N2BLA10hO+1GqOwsSjKf5Uy/GgOjXsYR4QQjb5zyC+BZPlPl/k5QLPrUNnBybBG5iwQZxt0hzYJyZTjm4OirKsTTR8FvjxLMPEuju9Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXL1ZI7+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXL1ZI7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716947630; x=1748483630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nFFeHdtO+FkJncVunddY3QuvNWr9ZxBIfr8dHZXAKZ8=;
  b=HXL1ZI7+I31cjjm9ICIzM3EDmeoZBIzvJdO4937rueFJZl63NllvLJC1
   QBMh9elG3lepWmmggaIqSsd+jF01pEv4AYIe/2FxvMPejorXWnmMr+zqN
   8DPikGhtgX8EBe/p4Fz2WT02ifFBlJmgKkJuvJs3itHkccnnQK9JJerAM
   PWNZgWr9HeBdd7xNTjAFvj4nsAoF2ahqRGjihN5j5+4fi6jOfsYj+Xj55
   8/djtVO27k4/D7XtmrFCwsQW+/5T3botwRw/zyw0ixmzm37OH0vr5W6O9
   8ZQex4dIR1I5Yi61TdDLMvOCWZXRykmr8czPeK97PV9HaCtmeqjrJhTbP
   A==;
X-CSE-ConnectionGUID: PCWPF8yvRbu4S4g7zXOcfw==
X-CSE-MsgGUID: yBwYS1waTmKAjgMwSF7Mjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11741309"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="11741309"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 18:53:49 -0700
X-CSE-ConnectionGUID: hKVgBrPKS3OsLypAFOMrpQ==
X-CSE-MsgGUID: F7RxkhwNRqau8kaas+zN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35243599"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 May 2024 18:53:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC8Vc-000CzR-2V;
	Wed, 29 May 2024 01:53:45 +0000
Date: Wed, 29 May 2024 09:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:tpm2key-v7 9/9]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:400 tpm2_key_ecdsa_preparse() error:
 uninitialized symbol 'ret'.
Message-ID: <202405290944.TAA2j4lu-lkp@intel.com>
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

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v7
head:   892305fec7841bf841a9c19e01c999c5f4b4e831
commit: dfd0950fe8c58c105ecba27fc4968d8e3db7d639 [9/9] keys: asymmetric: Add tpm2_key_ecdsa
:::::: branch date: 5 hours ago
:::::: commit date: 14 hours ago
config: openrisc-randconfig-r071-20240529 (https://download.01.org/0day-ci/archive/20240529/202405290944.TAA2j4lu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405290944.TAA2j4lu-lkp@intel.com/

smatch warnings:
crypto/asymmetric_keys/tpm2_key_ecdsa.c:400 tpm2_key_ecdsa_preparse() error: uninitialized symbol 'ret'.

vim +/ret +400 crypto/asymmetric_keys/tpm2_key_ecdsa.c

dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  389  
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  390  /*
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  391   * Attempt to parse a data blob for a key as a TPM private key blob.
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  392   */
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  393  static int tpm2_key_ecdsa_preparse(struct key_preparsed_payload *prep)
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  394  {
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  395  	struct tpm2_key *key;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  396  	int ret;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  397  
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  398  	key = tpm2_key_decode(prep->data, prep->datalen);
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  399  	if (IS_ERR(key))
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28 @400  		return ret;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  401  
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  402  	if (key->oid != OID_TPMLoadableKey) {
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  403  		kfree(key);
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  404  		return -EBADMSG;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  405  	}
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  406  
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  407  	ret = __tpm2_key_ecdsa_preparse(key);
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  408  	if (ret < 0) {
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  409  		kfree(key);
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  410  		return ret;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  411  	}
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  412  
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  413  	prep->payload.data[asym_subtype] = &tpm2_key_ecdsa_subtype;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  414  	prep->payload.data[asym_key_ids] = NULL;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  415  	prep->payload.data[asym_crypto] = key;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  416  	prep->payload.data[asym_auth] = NULL;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  417  	prep->quotalen = 100;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  418  	return 0;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  419  }
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  420  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
