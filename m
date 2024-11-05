Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA241C07D9
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805987; cv=none; b=AoyYEZ+/15x+Y+pu1tbO+A74GWMb9rKciFUxqNvXPJCxfdLfiSocBNmu+/QhSm3wUgujd23Ia+8l7sjT/3eS/64C2AJXlvdosLS/xraWBO/D/Ty8bZGBpOOg8wkDEz8pk//FruCUioSMZWDEaybX1Si0GvNGEuKkxn9HmXYCeFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805987; c=relaxed/simple;
	bh=eFbYiikUA4q84MF9YWAxQQ+rD7t7X+Z548RVNAmkLhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iBkQ9Z+G+bjnzbWMUTKKM68gVC+9RH/VFEfsi71bUiCXBz2LIk6sQcuFBStre+VEpNBWURXhcwBsCYGGUjCOAIsCaxNAaz9IyziWuOkLl2HwcdeWsO4zsK2LrhjlhBxRIQqygYBr8+jnEhpB+XXndSOBCUF76EZBu1TkQpVOa74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjNEPh8H; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjNEPh8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730805985; x=1762341985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFbYiikUA4q84MF9YWAxQQ+rD7t7X+Z548RVNAmkLhg=;
  b=LjNEPh8HscLCbvrUxXwyM3pNBGnc9jrwfHGnpszQt15L4Dpp7BALkHS+
   7/lRqJymMdrB81cmlJ21ya6fspnTBUxk+6sG65Icn0IMMq8lMC0YIjlf6
   BQRN1iWzPnzJncBxq/4KjWEFnfY+qHz3w6o/uAJ5kERA0bdMvR3a6cQFO
   P5R3VFojRiYsb+iXoeRAF/v3F0D0+x2hXSHW9IE2+PM9WZckP1YpVjnzI
   SqzwFoOCx3VNagCqTXlFI8cw0n4omfFkKwOESokoZ+VbqEhS6qiT0yZx4
   VgQY3zg/SaJVFcZsS0H5Xl7UkKs8J6d844hAE+3BKHRrwhiy6QPKBt/rf
   A==;
X-CSE-ConnectionGUID: cCtsr0hzTUmwmdmMyeMfQA==
X-CSE-MsgGUID: BOOafz7FTU2pCNlDG1mOzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30710704"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30710704"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 03:26:24 -0800
X-CSE-ConnectionGUID: SwmCn266RTaFjS34pl/2vw==
X-CSE-MsgGUID: IMoFci+oSQGZD8HHVVF3XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84374449"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2024 03:26:25 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8HhW-000lyP-0h;
	Tue, 05 Nov 2024 11:26:22 +0000
Date: Tue, 5 Nov 2024 19:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:tpm2key-v8 11/12]
 crypto/asymmetric_keys/tpm2_key_rsa.c:633 tpm2_key_rsa_preparse() error:
 uninitialized symbol 'ret'.
Message-ID: <202411051927.zyKNO38H-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   70a2627b8284f6c04ea99db77b2365c83179e7cf
commit: 70ff943241a1202554120aa67fdb4708c684fed4 [11/12] KEYS: asymmetric: Add tpm2_key_rsa signer
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r071-20241104 (https://download.01.org/0day-ci/archive/20241105/202411051927.zyKNO38H-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411051927.zyKNO38H-lkp@intel.com/

smatch warnings:
crypto/asymmetric_keys/tpm2_key_rsa.c:633 tpm2_key_rsa_preparse() error: uninitialized symbol 'ret'.

vim +/ret +633 crypto/asymmetric_keys/tpm2_key_rsa.c

70ff943241a120 Jarkko Sakkinen 2024-05-26  622  
70ff943241a120 Jarkko Sakkinen 2024-05-26  623  /*
70ff943241a120 Jarkko Sakkinen 2024-05-26  624   * Attempt to parse a data blob for a key as a TPM private key blob.
70ff943241a120 Jarkko Sakkinen 2024-05-26  625   */
70ff943241a120 Jarkko Sakkinen 2024-05-26  626  static int tpm2_key_rsa_preparse(struct key_preparsed_payload *prep)
70ff943241a120 Jarkko Sakkinen 2024-05-26  627  {
70ff943241a120 Jarkko Sakkinen 2024-05-26  628  	struct tpm2_key *key;
70ff943241a120 Jarkko Sakkinen 2024-05-26  629  	int ret;
70ff943241a120 Jarkko Sakkinen 2024-05-26  630  
70ff943241a120 Jarkko Sakkinen 2024-05-26  631  	key = tpm2_key_decode(prep->data, prep->datalen);
70ff943241a120 Jarkko Sakkinen 2024-05-26  632  	if (IS_ERR(key))
70ff943241a120 Jarkko Sakkinen 2024-05-26 @633  		return ret;
70ff943241a120 Jarkko Sakkinen 2024-05-26  634  
70ff943241a120 Jarkko Sakkinen 2024-05-26  635  	if (key->oid != OID_TPMLoadableKey) {
70ff943241a120 Jarkko Sakkinen 2024-05-26  636  		kfree(key);
70ff943241a120 Jarkko Sakkinen 2024-05-26  637  		return -EBADMSG;
70ff943241a120 Jarkko Sakkinen 2024-05-26  638  	}
70ff943241a120 Jarkko Sakkinen 2024-05-26  639  
70ff943241a120 Jarkko Sakkinen 2024-05-26  640  	ret = __tpm2_key_rsa_preparse(key);
70ff943241a120 Jarkko Sakkinen 2024-05-26  641  	if (ret < 0) {
70ff943241a120 Jarkko Sakkinen 2024-05-26  642  		kfree(key);
70ff943241a120 Jarkko Sakkinen 2024-05-26  643  		return ret;
70ff943241a120 Jarkko Sakkinen 2024-05-26  644  	}
70ff943241a120 Jarkko Sakkinen 2024-05-26  645  
70ff943241a120 Jarkko Sakkinen 2024-05-26  646  	prep->payload.data[asym_subtype] = &tpm2_key_rsa_subtype;
70ff943241a120 Jarkko Sakkinen 2024-05-26  647  	prep->payload.data[asym_key_ids] = NULL;
70ff943241a120 Jarkko Sakkinen 2024-05-26  648  	prep->payload.data[asym_crypto] = key;
70ff943241a120 Jarkko Sakkinen 2024-05-26  649  	prep->payload.data[asym_auth] = NULL;
70ff943241a120 Jarkko Sakkinen 2024-05-26  650  	prep->quotalen = 100;
70ff943241a120 Jarkko Sakkinen 2024-05-26  651  
70ff943241a120 Jarkko Sakkinen 2024-05-26  652  	return 0;
70ff943241a120 Jarkko Sakkinen 2024-05-26  653  }
70ff943241a120 Jarkko Sakkinen 2024-05-26  654  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
