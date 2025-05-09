Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740DB20C492
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 23:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746834674; cv=none; b=cKp5A9TgGDQC4kwsbw7g8rPr33BmlzYK41DjMqJuBOT8z+t1y4zbpXowuF+UBQKmiC9TpQ0fY3Fq0aKnb3Zwo3Zj4UX/KDxed52TcfY34yynNgbn2PsWEYa/vpVKPeQBQ+TnUof58wfmMCR/CCXJWEgGkbEp91ava/s7jfzgzn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746834674; c=relaxed/simple;
	bh=3Qm+UEGzgUalWhtl/vQlz1g7pYDljLu6r+/T4HIcers=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UD4cvBDEFGFimfFt6EQVvDFfkyxVjAllCO9ZGvx0T4hs6h4ENl+ZugOpL1yWhRm1Df3MgIqbvXWWUx2n+qG/BlocwOkq037ZUQhQGcajdd1iaB47xjEbA22mP7eyLrD6ZKueA/k2YzfVF39D9rJy728rShLp4XUZTaDVS0weNWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DT6uyPnn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DT6uyPnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746834673; x=1778370673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Qm+UEGzgUalWhtl/vQlz1g7pYDljLu6r+/T4HIcers=;
  b=DT6uyPnnL4B/5ldqVAIpyJNhmfoq7+F50FANr85BmqmNFLVSAaZXDBWO
   nEh0mJxoe7MCKV2dVmoBuQ+qr3z0kUM/Pdki7vDpYNw5aFvvhUyG9WI+r
   HWEmwRgceQbTYQewEnM/GhgJx4j4INuhLGvTfAh0F+3WjaKdJALnQnvqR
   Ecw/+OG0ulkU6k2aQZ+bSMuisi8CW4cx0tLcCEqFxr+1jbZRHOmPjjDAc
   wsf9IRsqX7fHkXj8iRMruXsEL5TAsgRFsg7Py+RSnXpeyX3koqj/drYvp
   nOP9YySjiuqJORG98AJMAOPVAvygB2e8Rk/ISwpE5TNPe8/V6+qZUV3R7
   Q==;
X-CSE-ConnectionGUID: DuIxrhTMSd+WX0oLCVMgLQ==
X-CSE-MsgGUID: IxSrTTfpRV2wgTLE46owog==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66089864"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="66089864"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 16:51:12 -0700
X-CSE-ConnectionGUID: BFFcitWcQR647KyQOe1qlw==
X-CSE-MsgGUID: zl+nPXTqT9Cg0B5PBYDk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141973172"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 May 2025 16:51:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDXUi-000CZn-1s;
	Fri, 09 May 2025 23:51:08 +0000
Date: Sat, 10 May 2025 07:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:x86/boot 10/10] arch/x86/boot/compressed/sev-handle-vc.c:104
 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null
 (see line 101)
Message-ID: <202505100719.9pE7wDfB-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

Hi Ard,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
head:   ed4d95d033e359f9445e85bf5a768a5859a5830b
commit: ed4d95d033e359f9445e85bf5a768a5859a5830b [10/10] x86/sev: Disentangle #VC handling code from startup code
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100719.9pE7wDfB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505100719.9pE7wDfB-lkp@intel.com/

smatch warnings:
arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null (see line 101)

vim +/boot_ghcb +104 arch/x86/boot/compressed/sev-handle-vc.c

ed4d95d033e359 Ard Biesheuvel 2025-05-04   95  
ed4d95d033e359 Ard Biesheuvel 2025-05-04   96  void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
ed4d95d033e359 Ard Biesheuvel 2025-05-04   97  {
ed4d95d033e359 Ard Biesheuvel 2025-05-04   98  	struct es_em_ctxt ctxt;
ed4d95d033e359 Ard Biesheuvel 2025-05-04   99  	enum es_result result;
ed4d95d033e359 Ard Biesheuvel 2025-05-04  100  
ed4d95d033e359 Ard Biesheuvel 2025-05-04 @101  	if (!boot_ghcb && !early_setup_ghcb())
ed4d95d033e359 Ard Biesheuvel 2025-05-04  102  		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
ed4d95d033e359 Ard Biesheuvel 2025-05-04  103  
ed4d95d033e359 Ard Biesheuvel 2025-05-04 @104  	vc_ghcb_invalidate(boot_ghcb);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
