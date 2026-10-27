Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125301;
	b=UluxIuvry0yXpMNR9VEiquxuc/XH3O3eW8u0CVfwVXN7D2ERrU0MXNgUyeu8cUhDdCq7
	 tninwUviEZPsuMT65nWDJ3s1EuMTLWENtEhY/xlxLmn832hkyRKPf7pcDC6kovVMJUrQw
	 cd55VUxI1kXqfykypbPc4QDW/qkqphTw8pw/C87M3PlT4gpvC32X3b70MHPDIhl4o20JD
	 kzCAyKdrIfHBDti2Dw8Z7+H2fdw5M9i38IqSmxnv2tG6tOQwnMmvcJWEuyzdGVyrwtyFf
	 j3g8jh0/cpXU07Z6PjSGLFfBAnPmWhND/xEv4I3adQ8vn5FGWAN9vTJybcPHN8DCzOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125301;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=z3EmLs6wcbmDycnGhTSJ6zmz8e08HGjIV8u/O5EIqTQ=;
	b=2io8nLrlv499zHEU+OAipsKg8lGRfyrgaW+KDnUw9qAwRyvJj3H8bNxnANlZ9BXDi/5F
	 vDh0atvy7rnBlcSlx1VO2aHP7nUKQZ3CsDo00mqSyg3ohexQyLT7aQUqjNKc0Gw1+iFtD
	 ka3is0HYmEenPcC2Z35LGR813JybxRsOPBqoCrxRz+na5cshKs7hoDb3YqgE5CnVltpfl
	 tQ7H4ZZvzsw0XbmKCv1XtYuRYK+Fpl4G6Nyof8G9ahJM42yP3q/H2kEQ/lKVXRspoA3XO
	 2Gurm/IMABe8MzdehbGLFzY7mwy++juzPtSOFYNVVe6pS7DTowQFBUSjvxpiMhXNbdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="W/K14do5";
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6B8606A322
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Oct 2026 18:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B6B8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W/K14do5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793125300; x=1824661300;
  h=date:from:to:cc:subject:message-id;
  bh=WzmLoUDMNAr7d/A74xab4TaloHTMMBlCpf8vMt0hUlE=;
  b=W/K14do5puXGOJ+QPEkNLn42zZ+1BcwEyct/b1upJFimfHpBDknnTu3E
   CpElEh7hyDthcBXwJWyTyunQCgFj3E1S2tUfTchVDnVHnKs/f0cmXiXql
   WOz7t/1UowZiYfBWKsmoV6sJSRgJ685M/6f5IZROWZDMkrH1nDp+4DgNS
   fvYaz+dGLbWTNvf2FvQF9b6hB5x32DfXBdABFWvVo63D6ccZZcSeF1wnN
   m8A9SBP7Ps1dA9512RI05KNavcjffTsM+lhesSPmN61cor9kSFsyXtefl
   0mH/CXZ/2zN0Wd8Vddogrv670yPWGmq64HEuzVgR9A8r34VPyIL6eR7rJ
   A==;
X-CSE-ConnectionGUID: fz1/gFV+Q8WX4dXKC9VKcA==
X-CSE-MsgGUID: wcMi9qDHTJOabnyuO3Rchw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1848082"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1848082"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 11:21:37 -0700
X-CSE-ConnectionGUID: Zs6GMJBMSDGRPeAMYRaebA==
X-CSE-MsgGUID: fWSQXC16RF2k5kyPn/+g6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4623261"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2026 11:21:36 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLlnh-000000004ab-1bBN;
	Tue, 27 Oct 2026 18:21:33 +0000
Date: Tue, 27 Oct 2026 19:21:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/alpha/kernel/err_tsunami.c:172 tsunami_ack_pchip()
 warn: statement has no effect 'pchip->perror.csr'
Message-ID: <202610271939.tKl1kpMr-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Magnus Lindholm <linmag7@gmail.com>
CC: Matt Turner <mattst88@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d135ab453a7400a34930bdda1ef4bdc8acfac80e
commit: ea2b073b4f31f334354479b993160788610c779d alpha: decode and acknowledge Tsunami system machine checks
date:   9 days ago
:::::: branch date: 23 hours ago
:::::: commit date: 9 days ago
config: alpha-randconfig-r2201-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271939.tKl1kpMr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ea2b073b4f31 ("alpha: decode and acknowledge Tsunami system machine checks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610271939.tKl1kpMr-lkp@intel.com/

smatch warnings:
arch/alpha/kernel/err_tsunami.c:172 tsunami_ack_pchip() warn: statement has no effect 'pchip->perror.csr'
arch/alpha/kernel/err_tsunami.c:200 tsunami_clear_errors() warn: statement has no effect '((18446739675663040512 + 1099511627776 + 6979321856))->misc.csr'

vim +172 arch/alpha/kernel/err_tsunami.c

ea2b073b4f31f3 Magnus Lindholm 2026-10-09  163  
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  164  static void
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  165  tsunami_ack_pchip(tsunami_pchip *pchip, u64 perror)
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  166  {
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  167  	if (!(perror & TSUNAMI_PERROR_ERRMASK))
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  168  		return;
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  169  	pchip->perror.csr = perror & TSUNAMI_PERROR_ERRMASK;
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  170  	/* Complete the W1C write before releasing the logout frame. */
2c8792df90e565 Magnus Lindholm 2026-10-08  171  	mb();
2c8792df90e565 Magnus Lindholm 2026-10-08 @172  	pchip->perror.csr;
2c8792df90e565 Magnus Lindholm 2026-10-08  173  }
2c8792df90e565 Magnus Lindholm 2026-10-08  174  
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  175  static void
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  176  tsunami_clear_errors(struct tsunami_error_state *state)
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  177  {
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  178  	bool pchip1 = TSUNAMI_cchip->csc.csr & (1UL << 14);
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  179  
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  180  	/* Preserve each chip's transaction and the NXM source before clearing. */
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  181  	state->perror[0] = TSUNAMI_pchip0->perror.csr;
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  182  	state->perror[1] = pchip1 ? TSUNAMI_pchip1->perror.csr : 0;
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  183  	state->misc = TSUNAMI_cchip->misc.csr;
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  184  
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  185  	/*
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  186  	 * Acknowledge both present Pchips: the saved frame may predate
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  187  	 * live errors. This can consume another chip's pending error
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  188  	 * with INV set before it reaches DRIR, losing its transaction
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  189  	 * details and subsequent system-error notification.
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  190  	 */
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  191  	tsunami_ack_pchip(TSUNAMI_pchip0, state->perror[0]);
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  192  	/* Do not access the second Pchip on single-Pchip systems. */
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  193  	if (pchip1)
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  194  		tsunami_ack_pchip(TSUNAMI_pchip1, state->perror[1]);
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  195  	if (state->misc & TSUNAMI_MISC_NXM) {
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  196  		/* Zero writes leave the other MISC fields unchanged. */
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  197  		TSUNAMI_cchip->misc.csr = TSUNAMI_MISC_NXM;
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  198  		/* Complete the NXM acknowledgment before releasing the frame. */
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  199  		mb();
ea2b073b4f31f3 Magnus Lindholm 2026-10-09 @200  		TSUNAMI_cchip->misc.csr;
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  201  	}
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  202  }
ea2b073b4f31f3 Magnus Lindholm 2026-10-09  203  

:::::: The code at line 172 was first introduced by commit
:::::: 2c8792df90e565d5a280549f37f5c5563f76ebe3 alpha: move Tsunami machine check handling to err_tsunami.c

:::::: TO: Magnus Lindholm <linmag7@gmail.com>
:::::: CC: Magnus Lindholm <linmag7@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
