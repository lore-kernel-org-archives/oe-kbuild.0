Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F7A2877DE
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 23:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766099018; cv=none; b=bVwh949F5sHwfMSFn8KgNJlaa+AmWSrfQ65q6A0RYMRTeZX39kK2kGDiMI5IrP9KaWYle6LaZzoBkgCgVZW2K8+0wXmNxdybu8LqKDEKPVwmj+pIbhCOQKTefwvCYipFrqB6Ij0zSsj0k2QPNwVhOd9AIzopEEDDX++JSCzeziY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766099018; c=relaxed/simple;
	bh=LUjYJJUoSkuNVs8dg96/Mbb+w5APcNtmN2trOrT5SWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W3XRYtwDhb7eqxcB+mtGBFDyTqjrz9izEvH3VOaUQvojQwKYZsp64OuUcBUnyWiDQo3RsrFLK6KBx+nnOvuvHSOoHVuTFJ6UulyNtZ9cGEHYKyA21149KsryxEu3oFg/14J5T0g2RF/3pqVfBnl+rHyPt806gsqGMjz9FstUJZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnl922XY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnl922XY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766099016; x=1797635016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LUjYJJUoSkuNVs8dg96/Mbb+w5APcNtmN2trOrT5SWI=;
  b=nnl922XYOE2t/1SSwb6tb75d7UkLm5ehcb3+7/9KWfniGq2eXVFFHK2h
   Odn0hmffLd6jwZ+g+c3oERfA+al0k6UzcpcLJp6xjrMzMYsJOMC1Ws862
   F3Z4QwFPJuZo6xs6fzUjwsMQgiyTURoozQIwjc3YhDU1A8nL7/KqqW3fR
   LUJb9ctA9ZwM5e/PE2sddAxJoDzLhul+O+/5p3Hbt7nrEpe4JmhsiG/wA
   U/ArhyqG/3N+P7HwsOfwXChagF9tkWMNDkZRS5zfYzdKpm1e6QN7H9SB0
   V6vZhqqKeQlWvw3iXERZUIBvwMooXxu99m7l7n4AJyZgrfoUa1aCAU82+
   Q==;
X-CSE-ConnectionGUID: pHSKhNd8SSOhdR58vEnBOQ==
X-CSE-MsgGUID: UnYccclzRQ20sNb/zNxbcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67256150"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67256150"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 15:03:35 -0800
X-CSE-ConnectionGUID: 7eac6Mu8RhmOI+qKCWVVZA==
X-CSE-MsgGUID: 1NYCMpirQlm1SW1B2H3ZSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198471809"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Dec 2025 15:03:34 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWN1v-000000002k5-1PXP;
	Thu, 18 Dec 2025 23:03:31 +0000
Date: Fri, 19 Dec 2025 07:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc()
 error: we previously assumed 'boot_ghcb' could be null (see line 101)
Message-ID: <202512190604.MDHRrUiJ-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

Hi Ard,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: ed4d95d033e359f9445e85bf5a768a5859a5830b x86/sev: Disentangle #VC handling code from startup code
date:   8 months ago
:::::: branch date: 87 minutes ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190604.MDHRrUiJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512190604.MDHRrUiJ-lkp@intel.com/

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
