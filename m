Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296846;
	b=XZO8gZsHuOXYQBeQdR1j9zBzRw+hzpLnH7WMMgWn/CpUQujiH9US6TbNdJisMNzwh2KP
	 VPYnempkZVp/rley5/qZtMyp4W37nK42GdxwdP/3KKYWNE4FufpHqQccvlkbYn730TWrA
	 V+vpnkwUDUjQOld8WcTZWoxUocD0mXT6Gs8dTpk+pGJW1DmcAgEsgTMZaF3VJZJePyBd8
	 oHMO5WRWE2egCproHRWXof7aQlK9RYVgv8LZf6ZhoR9cqwijWkFrSLB848RDsY4TGEvNl
	 99gWh6E2JdBLIYE0zF7XD0U7rTjOznytGVDXHqGmZ6s3nOAkWG6nYr8UARFJ54NcNVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296846;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=P09FalSQcsvATN+hdAy39AtWdz0xBb4B/OmdgWHcGCY=;
	b=TOWaq58SYC/+QikKWoWGwzM79faf7bwssVYdsOoiUNfk/BWGp+2dJhoA6C3kKTcqFxSK
	 lXwjZn6j+Qi5tLl2ftIlt2EuxPqQaPjmaSbO8rZqTRqTeCd74n9bn5DmnSYcppp3x/XcC
	 BHYXNG0sGZlmBNBk97tMKxY64X8u5ge8eL9YJmRKcB/Kjr2p5js1OBCisAT9W4Cfz8ZD9
	 6OmhzP17IWmcJaC5a8JSouFmoFrKaF//D1KFtF8b204cTiUdF9YwBt7N/sm6E4SRSeG11
	 yM91asUjRYkYMbUBp6QJoG1C3V1BZTN1dDO7m+/FTRxQ1DSUucuJuWBLv9FPTxnpXkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JosGH1NO;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B073E606A971
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 07:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B073E606A971
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JosGH1NO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794296845; x=1825832845;
  h=date:from:to:cc:subject:message-id;
  bh=TMZJJ3hrq6VeGEuauo08ZNEq/CP8yHqPR1v1gDJ0I1E=;
  b=JosGH1NOR5g4+jEjjn7GK7updcmq2Gx17sHEoO3LJ3DmTjSUfSH0A0M1
   RCCdOLGauH9ForwxuxSIa0ophnMj/BG7r6OsjVPu5ymBSPS7SwV7MDa8R
   +jy/qwWeWFsHSzQq7DB0sbXPjuWWvQ6H8PkAULzFlF2eWW7PG90DOmCgZ
   VLUO94+f8XR8OtJCV7U66/iPVgfBoGZejC7ntXDa7JAaNvDAOkBDVABSN
   bcXAFdhzxU0IdOlxhKTwo0Vkd+Pag37cONOpmPWRu948zm3h2nNJ3DSCr
   gBXP90nK7eh8MQ0yV8GlvFCneilIGtu3FoewS5EPrXaVtwpB9Ob7gg0t3
   g==;
X-CSE-ConnectionGUID: YRQMsXV4TUaKsQFfHav59w==
X-CSE-MsgGUID: p1wDvbuPTquDyW3OFmnyPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3028530"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3028530"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 23:47:24 -0800
X-CSE-ConnectionGUID: bl3wBfoTQPK1ePc2+gErYg==
X-CSE-MsgGUID: RE83BCXqTyS/Jiq2vvLkSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7943441"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2026 23:47:23 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQgZc-000000000Dr-3wmY;
	Tue, 10 Nov 2026 07:47:20 +0000
Date: Tue, 10 Nov 2026 08:47:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:hibernate 32/39]
 drivers/char/tpm/tpm2-rsp.h:112 tpm2_rsp_ecdsa_public() warn: was && intended
 here instead of ||?
Message-ID: <202611100802.66Q7bfro-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git hibernate
head:   74bb07bc3885849d08ac7ab1942479559faa986c
commit: 53d3622f5f68be4ed89dbb5d232c14b56992ab56 [32/39] tpm: Move the bounds-checked response reader to a header
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: parisc-randconfig-2200-20261110 (https://download.01.org/0day-ci/archive/20261110/202611100802.66Q7bfro-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611100802.66Q7bfro-lkp@intel.com/

New smatch warnings:
drivers/char/tpm/tpm2-rsp.h:112 tpm2_rsp_ecdsa_public() warn: was && intended here instead of ||?

Old smatch warnings:
drivers/char/tpm/tpm2-ak.c:253 tpm2_get_signed_audit_digest() warn: was && intended here instead of ||?

vim +112 drivers/char/tpm/tpm2-rsp.h

53d3622f5f68be Matthew Garrett 2026-10-08  100  
53d3622f5f68be Matthew Garrett 2026-10-08  101  /*
53d3622f5f68be Matthew Garrett 2026-10-08  102   * Parse a TPM2B_PUBLIC for an ECDSA-SHA256 P-256 signing key with no
53d3622f5f68be Matthew Garrett 2026-10-08  103   * symmetric algorithm, KDF or policy, checking that it has exactly the
53d3622f5f68be Matthew Garrett 2026-10-08  104   * object attributes @attrs, and return its public point.
53d3622f5f68be Matthew Garrett 2026-10-08  105   */
53d3622f5f68be Matthew Garrett 2026-10-08  106  static inline int tpm2_rsp_ecdsa_public(struct tpm2_rsp *r, u32 attrs,
53d3622f5f68be Matthew Garrett 2026-10-08  107  					u8 *x, u8 *y)
53d3622f5f68be Matthew Garrett 2026-10-08  108  {
53d3622f5f68be Matthew Garrett 2026-10-08  109  	u16 size = tpm2_rsp_u16(r);
53d3622f5f68be Matthew Garrett 2026-10-08  110  	u32 end = r->off + size;
53d3622f5f68be Matthew Garrett 2026-10-08  111  
53d3622f5f68be Matthew Garrett 2026-10-08 @112  	if (tpm2_rsp_u16(r) != TPM_ALG_ECC ||
53d3622f5f68be Matthew Garrett 2026-10-08  113  	    tpm2_rsp_u16(r) != TPM_ALG_SHA256 ||
53d3622f5f68be Matthew Garrett 2026-10-08  114  	    tpm2_rsp_u32(r) != attrs ||
53d3622f5f68be Matthew Garrett 2026-10-08  115  	    tpm2_rsp_u16(r) != 0 ||			/* authPolicy */
53d3622f5f68be Matthew Garrett 2026-10-08  116  	    tpm2_rsp_u16(r) != TPM_ALG_NULL ||		/* symmetric */
53d3622f5f68be Matthew Garrett 2026-10-08  117  	    tpm2_rsp_u16(r) != TPM_ALG_ECDSA ||		/* scheme */
53d3622f5f68be Matthew Garrett 2026-10-08  118  	    tpm2_rsp_u16(r) != TPM_ALG_SHA256 ||	/* scheme hash */
53d3622f5f68be Matthew Garrett 2026-10-08  119  	    tpm2_rsp_u16(r) != TPM2_ECC_NIST_P256 ||
53d3622f5f68be Matthew Garrett 2026-10-08  120  	    tpm2_rsp_u16(r) != TPM_ALG_NULL)		/* kdf */
53d3622f5f68be Matthew Garrett 2026-10-08  121  		return -EINVAL;
53d3622f5f68be Matthew Garrett 2026-10-08  122  
53d3622f5f68be Matthew Garrett 2026-10-08  123  	tpm2_rsp_ecc_param(r, x);
53d3622f5f68be Matthew Garrett 2026-10-08  124  	tpm2_rsp_ecc_param(r, y);
53d3622f5f68be Matthew Garrett 2026-10-08  125  
53d3622f5f68be Matthew Garrett 2026-10-08  126  	if (r->err || r->off != end)
53d3622f5f68be Matthew Garrett 2026-10-08  127  		return -EINVAL;
53d3622f5f68be Matthew Garrett 2026-10-08  128  
53d3622f5f68be Matthew Garrett 2026-10-08  129  	return 0;
53d3622f5f68be Matthew Garrett 2026-10-08  130  }
53d3622f5f68be Matthew Garrett 2026-10-08  131  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
