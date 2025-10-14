Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9690219E97F
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431712; cv=none; b=F0MWteTTcKKfTRLb3kusW5yzLOzsaVwZ0YDym046ThLMveiUP0uu/VoqQ9HBauggXJMhpp+DrKEi0/hhBzsYiRUWT5Gtm5aeLfPDK3T+CmcnFmqPBre9LM5jIDROLD4MUqjvGNjPRTzhHyntynovwgNeFA8RZMO1ZABqTRKVw3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431712; c=relaxed/simple;
	bh=yIKIlSp3FSyRk5cKOaMqsW1bR196MEgM9km146kZ9cE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lI890NLG/ppQa5NxvCcZNVw9lTRWp/qanxgZQdpp/867QNv+EmScTL9jgDzWl96OSmPy20RAzurgDLbgxrvB0kZgL5n3s6KSYMTHKDT0gCMuZ3OnTQqHlXsjUDjgiKVm66Zpdi1DKVmi2X6UHF1iA87eN+f8h8E3atQXuBm5wxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPdZRv8r; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPdZRv8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760431709; x=1791967709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yIKIlSp3FSyRk5cKOaMqsW1bR196MEgM9km146kZ9cE=;
  b=HPdZRv8r87RYpwxEASkI+/jByLpStbRkth0k5v86AAXG3o480s364IBo
   4eA5lRL/DXvbDa8JqHymkgYLLalaMx5sTuYYCXrfV50fyXRe5iSZ2CsxR
   L8qlQMRwrBhqVd8wPpqpbNmjwXvqp2cfK1uvV6a3vk8oHtC11PDGev+Ze
   QoRQWylT4VZRm0TBwqnpRkcz9l8Y7/uX8CsVLD1b3Q4wSDZ27bPr1ktMC
   l7ine4yLOX2tR2SOIr7BFHQgDBjw26wU288UA45FywsXx22QThyQWaDm2
   lcoLczx09tP6QiMafPn+dzGClf16jqjG53hzhq+UTq0lehPNOSKDggxUk
   g==;
X-CSE-ConnectionGUID: rRcpws1mTrCUpWFu9PUB/g==
X-CSE-MsgGUID: A+Mn2XlhSrKopv+TsIYjlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72854511"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="72854511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 01:48:28 -0700
X-CSE-ConnectionGUID: 75nSeqFXRcaO6S6m5vxRBg==
X-CSE-MsgGUID: NMasiL90Qa24MdhcfnLAxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="186924841"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Oct 2025 01:48:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8ahk-0002ZE-0k;
	Tue, 14 Oct 2025 08:48:24 +0000
Date: Tue, 14 Oct 2025 16:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:perf/core 5/6] arch/x86/lib/insn-eval.c:1769
 insn_is_nop() error: uninitialized symbol 'modrm_mod'.
Message-ID: <202510141631.kQWSN1gd-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   831b95e7609de26dffe5d2659c3b5ebf406e2989
commit: 96d15af6fdb6f5ce7665d9ba4d32b93300e7a259 [5/6] x86/insn,uprobes,alternative: Unify insn_is_nop()
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20251014 (https://download.01.org/0day-ci/archive/20251014/202510141631.kQWSN1gd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510141631.kQWSN1gd-lkp@intel.com/

New smatch warnings:
arch/x86/lib/insn-eval.c:1769 insn_is_nop() error: uninitialized symbol 'modrm_mod'.
arch/x86/lib/insn-eval.c:1776 insn_is_nop() error: uninitialized symbol 'modrm_reg'.
arch/x86/lib/insn-eval.c:1776 insn_is_nop() error: uninitialized symbol 'modrm_rm'.

Old smatch warnings:
arch/x86/lib/insn-eval.c:1779 insn_is_nop() error: uninitialized symbol 'modrm_mod'.
arch/x86/lib/insn-eval.c:1797 insn_is_nop() error: uninitialized symbol 'modrm_reg'.
arch/x86/lib/insn-eval.c:1797 insn_is_nop() error: uninitialized symbol 'modrm_rm'.
arch/x86/lib/insn-eval.c:1818 insn_is_nop() error: uninitialized symbol 'modrm_reg'.

vim +/modrm_mod +1769 arch/x86/lib/insn-eval.c

96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1679  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1680  /*
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1681   * Recognise typical NOP patterns for both 32bit and 64bit.
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1682   *
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1683   * Notably:
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1684   *  - NOP, but not: REP NOP aka PAUSE
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1685   *  - NOPL
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1686   *  - MOV %reg, %reg
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1687   *  - LEA 0(%reg),%reg
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1688   *  - JMP +0
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1689   *
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1690   * Must not have false-positives; instructions identified as a NOP might be
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1691   * emulated as a NOP (uprobe) or Run Length Encoded in a larger NOP
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1692   * (alternatives).
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1693   *
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1694   * False-negatives are fine; need not be exhaustive.
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1695   */
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1696  bool insn_is_nop(struct insn *insn)
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1697  {
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1698  	u8 b3 = 0, x3 = 0, r3 = 0;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1699  	u8 b4 = 0, x4 = 0, r4 = 0, m = 0;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1700  	u8 modrm, modrm_mod, modrm_reg, modrm_rm;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1701  	u8 sib = 0, sib_scale, sib_index, sib_base;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1702  	u8 nrex, rex;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1703  	u8 p, rep = 0;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1704  	int i;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1705  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1706  	if ((nrex = insn->rex_prefix.nbytes)) {
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1707  		rex = insn->rex_prefix.bytes[nrex-1];
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1708  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1709  		r3 = !!X86_REX_R(rex);
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1710  		x3 = !!X86_REX_X(rex);
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1711  		b3 = !!X86_REX_B(rex);
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1712  		if (nrex > 1) {
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1713  			r4 = !!X86_REX2_R(rex);
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1714  			x4 = !!X86_REX2_X(rex);
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1715  			b4 = !!X86_REX2_B(rex);
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1716  			m  = !!X86_REX2_M(rex);
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1717  		}
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1718  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1719  	} else if (insn->vex_prefix.nbytes) {
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1720  		/*
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1721  		 * Ignore VEX encoded NOPs
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1722  		 */
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1723  		return false;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1724  	}
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1725  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1726  	if (insn->modrm.nbytes) {
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1727  		modrm = insn->modrm.bytes[0];
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1728  		modrm_mod = X86_MODRM_MOD(modrm);
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1729  		modrm_reg = X86_MODRM_REG(modrm) + 8*r3 + 16*r4;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1730  		modrm_rm  = X86_MODRM_RM(modrm)  + 8*b3 + 16*b4;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1731  		modrm = 1;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1732  	}
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1733  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1734  	if (insn->sib.nbytes) {
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1735  		sib = insn->sib.bytes[0];
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1736  		sib_scale = X86_SIB_SCALE(sib);
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1737  		sib_index = X86_SIB_INDEX(sib) + 8*x3 + 16*x4;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1738  		sib_base  = X86_SIB_BASE(sib)  + 8*b3 + 16*b4;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1739  		sib = 1;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1740  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1741  		modrm_rm = sib_base;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1742  	}
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1743  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1744  	for_each_insn_prefix(insn, i, p) {
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1745  		if (p == 0xf3) /* REPE */
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1746  			rep = 1;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1747  	}
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1748  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1749  	/*
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1750  	 * Opcode map munging:
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1751  	 *
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1752  	 * REX2: 0 - single byte opcode
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1753  	 *       1 - 0f second byte opcode
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1754  	 */
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1755  	switch (m) {
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1756  	case 0: break;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1757  	case 1: insn->opcode.value <<= 8;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1758  		insn->opcode.value |= 0x0f;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1759  		break;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1760  	default:
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1761  		return false;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1762  	}
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1763  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1764  	switch (insn->opcode.bytes[0]) {
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1765  	case 0x0f: /* 2nd byte */
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1766  		break;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1767  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1768  	case 0x89: /* MOV */
96d15af6fdb6f5 Peter Zijlstra 2025-09-05 @1769  		if (modrm_mod != 3) /* register-direct */
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1770  			return false;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1771  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1772  		/* native size */
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1773  		if (insn->opnd_bytes != 4 * (1 + insn->x86_64))
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1774  			return false;
96d15af6fdb6f5 Peter Zijlstra 2025-09-05  1775  
96d15af6fdb6f5 Peter Zijlstra 2025-09-05 @1776  		return modrm_reg == modrm_rm; /* MOV %reg, %reg */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
