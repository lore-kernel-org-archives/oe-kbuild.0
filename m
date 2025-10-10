Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEB636B
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 04:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760070119; cv=none; b=hioUWDYKgAmeSoE+zg09j+dO4XDjzr9Bug/skvTxCYwSgwjAUmwrs0ZsNSz4HLWoStCWkfUwhJeAG2xrlBoRwSKl5Wtq3IvL+HDG1djEJCSqchU/frehYZWphxGuzkZ7l4GeR0emMwYx0shbHCTaW5g3wvUgJbgM8Zfdx8V3LKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760070119; c=relaxed/simple;
	bh=KygIFEyD6+JPTgD7zTOoC/BuqbdVdJ4aPrk45BDI5fY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UWUj1A7grfVm7y8DOVBIp5/72zVg8eLcLhGTGah/E+18aDayICAhQjOloZANwr+S+EIzHn5Sq1RVU0E6gGFzwvW+Xhnv/cRf5j4COe1hRWu8H8Pp4J9q/HrBpQSm4k50YyGuw7zIusob1B+Pc4QLUepB+BnEQVr4BNr7nMIatZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LeXSrIOJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeXSrIOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760070118; x=1791606118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KygIFEyD6+JPTgD7zTOoC/BuqbdVdJ4aPrk45BDI5fY=;
  b=LeXSrIOJvQq04PLBLHB5jIvo/FJMvJeTrpIYUkuVF3tT023Ajak1H7Ck
   hb1/LTdkyJUPnLUmaxcpovpm1q9P1guejzbIerFNmD7kkilG71sNnjkc2
   R94BgfnJ4I1HZ7117CIZzBS5uCF9sHc2nx+5E3HAyT/LPYeTv6UNLlZtn
   JAQ4JByRSaOLVa1OzVonqQ55PVRUczScL7IoX4qgjAXaka5vi8GE+k+P7
   fzA1F2HnneAUILAJ7jXmyRLjxZMGxyewIsw2ypuY9yMygUPdFhuwgb5kb
   yy+yk8Ool/H8zk9Fbkzhu+3jF4aRy4H+qa9GgJZiK6Zeu/Nd5ZRd0P2Z2
   w==;
X-CSE-ConnectionGUID: QGcOFLsHT9WUHVZE7CauaA==
X-CSE-MsgGUID: drYmsvNpQXmmdITbjdJe5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79931631"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="79931631"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 21:21:57 -0700
X-CSE-ConnectionGUID: /541kVzWTzGj65CdBicFpg==
X-CSE-MsgGUID: /KALR1xlSk65uhImF/eIsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180572611"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2025 21:21:56 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v74dd-00028j-2q;
	Fri, 10 Oct 2025 04:21:53 +0000
Date: Fri, 10 Oct 2025 12:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:tpm2-session 11/20] drivers/char/tpm/tpm2-space.c:393
 tpm2_map_response_header() error: uninitialized symbol 'i'.
Message-ID: <202510101214.N6SpXZEg-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   5ff746df84024ce3acd63bc2c69a92d76c5daf97
commit: a09691e4bb366823a4eb2972ba4a4569e90a7549 [11/20] tpm: Skip stale tpmrm0 flushes and saves
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-r073-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101214.N6SpXZEg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510101214.N6SpXZEg-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm2-space.c:393 tpm2_map_response_header() error: uninitialized symbol 'i'.

vim +/i +393 drivers/char/tpm/tpm2-space.c

745b361e989af2 Jarkko Sakkinen 2017-01-06  381  
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  382  static int tpm2_map_response_header(struct tpm_chip *chip, u8 *rsp, size_t len)
745b361e989af2 Jarkko Sakkinen 2017-01-06  383  {
b34b77a99b1a4c Jarkko Sakkinen 2018-11-06  384  	struct tpm_header *header = (struct tpm_header *)rsp;
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  385  	struct tpm_space *space = &chip->work_space;
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  386  	u32 phandle, vhandle;
745b361e989af2 Jarkko Sakkinen 2017-01-06  387  	u32 attrs;
745b361e989af2 Jarkko Sakkinen 2017-01-06  388  	int i;
745b361e989af2 Jarkko Sakkinen 2017-01-06  389  
745b361e989af2 Jarkko Sakkinen 2017-01-06  390  	if (be32_to_cpu(header->return_code) != TPM2_RC_SUCCESS)
745b361e989af2 Jarkko Sakkinen 2017-01-06  391  		return 0;
745b361e989af2 Jarkko Sakkinen 2017-01-06  392  
745b361e989af2 Jarkko Sakkinen 2017-01-06 @393  	attrs = chip->cc_attrs_tbl[i];
745b361e989af2 Jarkko Sakkinen 2017-01-06  394  	if (!((attrs >> TPM2_CC_ATTR_RHANDLE) & 1))
745b361e989af2 Jarkko Sakkinen 2017-01-06  395  		return 0;
745b361e989af2 Jarkko Sakkinen 2017-01-06  396  
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  397  	switch (chip->last_phandle & 0xFF000000) {
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  398  	case TPM2_HT_TRANSIENT:
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  399  		if (chip->last_cc == TPM2_CC_FLUSH_CONTEXT) {
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  400  			for (i = 0; i < ARRAY_SIZE(space->context_tbl); i++) {
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  401  				if (space->context_tbl[i] == chip->last_phandle)
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  402  					space->context_tbl[i] = 0;
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  403  			}
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  404  		}
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  405  		break;
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  406  	case TPM2_HT_HMAC_SESSION:
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  407  	case TPM2_HT_POLICY_SESSION:
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  408  		if (chip->last_cc == TPM2_CC_CONTEXT_SAVE ||
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  409  		    chip->last_cc == TPM2_CC_FLUSH_CONTEXT) {
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  410  			for (i = 0; i < ARRAY_SIZE(space->session_tbl); i++) {
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  411  				if (space->session_tbl[i] == chip->last_phandle)
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  412  					space->session_tbl[i] = 0;
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  413  			}
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  414  		}
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  415  	default:
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  416  		break;
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  417  	}
745b361e989af2 Jarkko Sakkinen 2017-01-06  418  
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  419  	phandle = be32_to_cpup((__be32 *)&rsp[TPM_HEADER_SIZE]);
a09691e4bb3668 Jarkko Sakkinen 2025-10-04  420  	switch (phandle & 0xFF000000) {
745b361e989af2 Jarkko Sakkinen 2017-01-06  421  	case TPM2_HT_TRANSIENT:
745b361e989af2 Jarkko Sakkinen 2017-01-06  422  		vhandle = tpm2_map_to_vhandle(space, phandle, true);
745b361e989af2 Jarkko Sakkinen 2017-01-06  423  		if (!vhandle)
745b361e989af2 Jarkko Sakkinen 2017-01-06  424  			goto out_no_slots;
745b361e989af2 Jarkko Sakkinen 2017-01-06  425  
745b361e989af2 Jarkko Sakkinen 2017-01-06  426  		*(__be32 *)&rsp[TPM_HEADER_SIZE] = cpu_to_be32(vhandle);
745b361e989af2 Jarkko Sakkinen 2017-01-06  427  		break;
745b361e989af2 Jarkko Sakkinen 2017-01-06  428  	case TPM2_HT_HMAC_SESSION:
745b361e989af2 Jarkko Sakkinen 2017-01-06  429  	case TPM2_HT_POLICY_SESSION:
4d57856a21ed2a James Bottomley 2017-01-31  430  		if (!tpm2_add_session(chip, phandle))
4d57856a21ed2a James Bottomley 2017-01-31  431  			goto out_no_slots;
745b361e989af2 Jarkko Sakkinen 2017-01-06  432  		break;
745b361e989af2 Jarkko Sakkinen 2017-01-06  433  	default:
745b361e989af2 Jarkko Sakkinen 2017-01-06  434  		dev_err(&chip->dev, "%s: unknown handle 0x%08X\n",
745b361e989af2 Jarkko Sakkinen 2017-01-06  435  			__func__, phandle);
745b361e989af2 Jarkko Sakkinen 2017-01-06  436  		break;
c22780ff0c764c Tomas Winkler   2018-10-19  437  	}
745b361e989af2 Jarkko Sakkinen 2017-01-06  438  
745b361e989af2 Jarkko Sakkinen 2017-01-06  439  	return 0;
745b361e989af2 Jarkko Sakkinen 2017-01-06  440  out_no_slots:
47a6c28b6861b1 Jarkko Sakkinen 2018-11-05  441  	tpm2_flush_context(chip, phandle);
745b361e989af2 Jarkko Sakkinen 2017-01-06  442  	dev_warn(&chip->dev, "%s: out of slots for 0x%08X\n", __func__,
745b361e989af2 Jarkko Sakkinen 2017-01-06  443  		 phandle);
745b361e989af2 Jarkko Sakkinen 2017-01-06  444  	return -ENOMEM;
745b361e989af2 Jarkko Sakkinen 2017-01-06  445  }
745b361e989af2 Jarkko Sakkinen 2017-01-06  446  

:::::: The code at line 393 was first introduced by commit
:::::: 745b361e989af21ad40811c2586b60229f870a68 tpm: infrastructure for TPM spaces

:::::: TO: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
