Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260095;
	b=ZOMmuZzaRJDyShoRgEQFgNFxyaGhpP99L2WACf8Vbg1fztR8cLSsjVQsF1H9dZ2SU8hC
	 gMyTbZ/rb/YqX5Pr2xanD9CYMH3P4qCqqU6T7GmsRKtDGqb3inXHTXgHkO2nvBCc7E4HV
	 AWkdBxly6UZnb6gGrbiXoHN0U71KLOvRehH1Daf8gbvP2LiwuYnqZhKHSEyR/xQAqpINS
	 b9+Eml0HnRuJGjCp1twCVkgMl9GQFnu3+8I/c0PWXRn8YPk4GmTB3GZMxH0Z5/Na0WjLx
	 q5tVLDf3LWQ9nLm1tqjpceRp9TKyNWU3X2wfJ+vvT9avIwp19gORa3VFY/PThcRnj0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260095;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ptru1LZsrhdudgnraVw2KySj1fvQKVk01GUb/+E6fpU=;
	b=kXPLxIhcHfFtl+KX5Jw6yYB9WBf893g7wir3Dcb02A6vHICKyRQLe2Fj4lDczcI4+ZlC
	 BlQBdYLiE//LmLHHzNwFiQb9bkEvsw+0T956rB27mMhSApsKn0+CKbQW44nqgZIAaUm1T
	 DrR3n7a4HiiA0P5vXNfAM8IL+vNu+VFUVIifRtLmDANVExAaDuz3iBv1RZGLsZx4uzNMH
	 K+YOEiIfNqsIN0TU3KovUZPUuA/irp6XL4gIQFyhAidrKL8iRDDzKemvoPWH3GVK1DigV
	 2XY2eUfrfoQriWyNjuDB/wEEVkenXx6VrACGUHEMnYrXOUdV+Ly71KhDfoG29W8gWhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LUNDyVl6;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41075606A32A
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 11:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41075606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LUNDyVl6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795260094; x=1826796094;
  h=date:from:to:cc:subject:message-id;
  bh=2DHTI29pwee4NU9P9KwKFIKJ+VX3gzHxPyrmBq8bP2Y=;
  b=LUNDyVl69UOJM1KsRLcQkg7EiIq8vrEwPCQGXCIbJzw9+0gSB3BTc6pg
   LYAJ/q8ySgF35soojIuQlQiDuvmzBOJcePFlvahxVaVTE618AHYSQHYCT
   W7nj3tVGSUDrb6AQxSQZj07pZD+to9KbvCwRukODdCYOn8K/4jM5J3VQZ
   xYWSCBV8c5sUSOljAKRWHPcJJ6+zLYe+exKULh1Eq3exGCAmmRnF9It8P
   yODJ9ydRLGc89PWCggVkGGOUzRQRGXECcUJVQM6gyHFZSYOirJ6XOsY9H
   Qi8L17qK81ti8UOEZhiswL1Bf8npYpOhOf12NA33DJLYVwGcT0xxxPmsp
   w==;
X-CSE-ConnectionGUID: HZsroO1fTDuKjFrZQcJcYQ==
X-CSE-MsgGUID: tHORiTPLRb+ekB8AhIa39g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4229707"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4229707"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 03:21:33 -0800
X-CSE-ConnectionGUID: v3wZc92RRkqwCmoWrOwsQw==
X-CSE-MsgGUID: HgRlGIbdS3a56fArkI76QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10800888"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2026 03:21:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUj9t-000000004Iz-2REk;
	Sat, 21 Nov 2026 11:21:29 +0000
Date: Sat, 21 Nov 2026 12:21:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bpf-next:master 24/51] kernel/bpf/precision.c:66
 bpf_insn_callee() error: buffer overflow 'aux->const_reg_vals' 10 <= 16
Message-ID: <20261121121608.NYDAtCSJ-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   9867c61abbd44f7053a871566b3d982f62c6d8dc
commit: 37e13b091537b2e41b85a2f362e6defece1ed351 [24/51] bpf: Find the xregs that an unproven insn depends on
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: parisc-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121121608.NYDAtCSJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261121121608.NYDAtCSJ-lkp@intel.com/

smatch warnings:
kernel/bpf/precision.c:66 bpf_insn_callee() error: buffer overflow 'aux->const_reg_vals' 10 <= 16

vim +66 kernel/bpf/precision.c

37e13b091537b2 Alexei Starovoitov 2026-11-20  54  
37e13b091537b2 Alexei Starovoitov 2026-11-20  55  /* The function that the insn at @idx calls, or hands to a helper. -1 if that is not known. */
37e13b091537b2 Alexei Starovoitov 2026-11-20  56  int bpf_insn_callee(struct bpf_verifier_env *env, int idx)
37e13b091537b2 Alexei Starovoitov 2026-11-20  57  {
37e13b091537b2 Alexei Starovoitov 2026-11-20  58  	struct bpf_insn_aux_data *aux = &env->insn_aux_data[idx];
37e13b091537b2 Alexei Starovoitov 2026-11-20  59  	struct bpf_insn *insn = &env->prog->insnsi[idx];
37e13b091537b2 Alexei Starovoitov 2026-11-20  60  	u16 funcs = aux->const_reg_subprog_mask & aux->use_regs;
37e13b091537b2 Alexei Starovoitov 2026-11-20  61  
37e13b091537b2 Alexei Starovoitov 2026-11-20  62  	if (bpf_pseudo_call(insn))
37e13b091537b2 Alexei Starovoitov 2026-11-20  63  		return bpf_find_subprog(env, idx + insn->imm + 1);
37e13b091537b2 Alexei Starovoitov 2026-11-20  64  	if (hweight16(funcs) == 1 && (aux->calls_callback ||
37e13b091537b2 Alexei Starovoitov 2026-11-20  65  				      bpf_is_async_callback_calling_insn(insn)))
37e13b091537b2 Alexei Starovoitov 2026-11-20 @66  		return aux->const_reg_vals[__ffs(funcs)];
37e13b091537b2 Alexei Starovoitov 2026-11-20  67  	return -1;
37e13b091537b2 Alexei Starovoitov 2026-11-20  68  }
37e13b091537b2 Alexei Starovoitov 2026-11-20  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
