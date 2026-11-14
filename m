Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621322;
	b=xM06IlEs6zKvu+PYFMHF/D9Qs7AVjGFQnzdvfS+dhu1BN1tmZN0zreYyo4gdFvWiHqcM
	 FTanjRABRfsnYz6mw1CiJlMx1JnFOsBAWlGQ/uY2r7TeNuf6yX5IfTsOKW0JYcqVX342c
	 g9/VJRYUDD+bEGAJR2nDY+mZWewgI1xLoqd+h9ef1jstxlSSFDRAYBZpG9RPs7Wqo4V57
	 4I/+6xf9zSzf3ZUFmwapu7PhLsb1Y3UYRlYJNRcFmMjHif86lXKRtVETnYPHxtwEh63sg
	 p3XWuXHHbuXbsDajFk6bmyDwwsS+pl6TR/tRegQYJzLJaB6RiSaGtzcRr8SZyO20GhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621322;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pmGJTH8BH66UKRXhUeHRl8rzQ9v3CCkh6JncSbg6HUY=;
	b=TKsl645/nspAspxzyFMwSGUgMslfjbpPy2+yj+DJrjF2ed28a6WDWshtpvbvqLcnyf1G
	 rC/yINWKjN8yCjGchSGWkXynfLpUk6PQy6C7GAt0nji8qFEhu5XJF0IA0+3HpZIrTx3kN
	 EPB3L1+OZA9ks4H/GdjsGwIqOZ+vqmyO3kIRXJrQOpPt9/KC2BrWLX1hy0n55kgLysfEb
	 vc3eocuahKBeDMtHr3/INUP0ERYS8j6qAq4fRFIldVETnoJZzfsYLQY9qyaszeTqcHy5r
	 2z1w8oeVMthGIOdXUsYJKjLHvTEAvpPRVtcCaJPlB9j39an/E+Wpu6Ft5zzWRHzg3Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fd4T8BfZ;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2596C606A337
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 01:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2596C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fd4T8BfZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794621322; x=1826157322;
  h=date:from:to:cc:subject:message-id;
  bh=M7b5wBIXPaFEPZAlHbk7QNoxZVRayD2brCKN7Els81s=;
  b=Fd4T8BfZrgvXzoMqPDsi1yCsQfgDaD+3EASWSaPGu2aEsCZVyNrSh7z5
   xHXSbEIKDWdUiqM+kEtMPqW6T+hzQVhiDmTXnHK1kbI731XTTqj4XzD8J
   ONfJLxLvtKXsqNLOQw/790ZLSERa/TIa1s+0ATGA9YkyYP79gcneLKfyv
   blJAwaXULaMFvfIFHW858pL63U8Q7/ed16HbgFLK55BEUOE6LVGZYYgg/
   NVZMoPoUQLEcROQuA9OwzSZ8al4Qcvd2eYuTT6DvP7sEfdkV51INETR2r
   Jx2taOzR2Wmbj8UP0kIANUvQgiChfKk0HOkcArnMsQHcqjZyWMfBLSnA+
   w==;
X-CSE-ConnectionGUID: Su1Jl046TCmIbeGvvWd2Zg==
X-CSE-MsgGUID: 7BzZoUA4TayYIvJr1tlXbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3447472"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3447472"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 17:55:22 -0800
X-CSE-ConnectionGUID: 7LtDcvDuSRKAigpwalMSCg==
X-CSE-MsgGUID: 3DcWDuMFQo2L6coQEtWSzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9601530"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2026 17:55:20 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS2z7-000000001Sh-44uS;
	Sat, 14 Nov 2026 01:55:17 +0000
Date: Sat, 14 Nov 2026 02:55:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:cancellations 40/71] kernel/bpf/cancel.c:3728
 cancel_emit_exit() error: we previously assumed 'site' could be null (see
 line 3718)
Message-ID: <202611140205.92cQED00-lkp@intel.com>
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
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux cancellations
head:   3ad9d6e61351ecac109d90e7eb385f2ac07aca89
commit: 685a972de1419e92f4998eda9954183da49bd167 [40/71] bpf: Let a callee tell at cancel_exit what it released for its caller
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: sparc-randconfig-2200-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140205.92cQED00-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611140205.92cQED00-lkp@intel.com/

smatch warnings:
kernel/bpf/cancel.c:3728 cancel_emit_exit() error: we previously assumed 'site' could be null (see line 3718)

vim +/site +3728 kernel/bpf/cancel.c

77e5ab95100e8d Kumar Kartikeya Dwivedi 2026-11-13  3678  
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3679  /*
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3680   * Leave the frame of subprog @s. cancel_exit returns to the pad of the call that the frame
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3681   * was called by. The kernel entered the main program or an async callback, and nothing else
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3682   * does, see cancel_sub_reason(): all frames are done. The pad tells that the program was
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3683   * cancelled and returns to the kernel like any exit.
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3684   *
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3685   * The pad of a subprog that a call entered tells the pad of that call in R2 which arguments
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3686   * of the frame are released, see bpf_cancel_note_args(). Every such pad does, so that a pad
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3687   * may go by the mask whatever it was called by: 0 says that all is as the call left it.
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3688   * @site is the site of the pad, NULL for the stack check, where the frame did nothing yet:
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3689   * BPF_CANCEL_PAD_EXIT_INSNS at most then. The mask has what the frame gave when it got to
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3690   * the site, and at a call the bit of each argument of the frame that the callee was passed
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3691   * and tells about: the mask of the callee is in the word of the frame, see cancel_emit_pad().
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3692   *
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3693   *	r2 = gave
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3694   *	r1 = *(u32 *)(r10 + mask)
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3695   *	if r1 & BIT(the argument of the callee) goto +1
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3696   *	goto +1
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3697   *	r2 |= BIT(the argument of the frame)
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3698   *	r0 = 0
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3699   *	cancel_exit
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3700   */
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3701  static int cancel_emit_exit(struct bpf_verifier_env *env, int s, const struct cancel_site *site,
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3702  			    struct bpf_insn *buf)
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3703  {
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3704  	u32 fwd = 0;
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3705  	s32 val = 0;
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3706  	int n = 0, r;
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3707  
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3708  	if (cancel_sub_is_top(env, s)) {
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3709  		/* it didn't refuse in cancel_sub_reason() */
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3710  		if (!s)
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3711  			bpf_prog_cancel_retval(env, &val);
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3712  		buf[n++] = BPF_EMIT_KERNEL_CALL(bpf_prog_report_cancel);
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3713  		buf[n++] = BPF_MOV64_IMM(BPF_REG_0, val);
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3714  		buf[n++] = BPF_EXIT_INSN();
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3715  		return n;
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3716  	}
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3717  	buf[n++] = BPF_MOV64_IMM(BPF_REG_2, site ? site->gave : 0);
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13 @3718  	for (r = 1; site && r <= CANCEL_MAX_ARG; r++)
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3719  		if ((site->told & BIT(r)) && site->fwd[r])
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3720  			fwd |= BIT(r);
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3721  	if (fwd)
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3722  		buf[n++] = BPF_LDX_MEM(BPF_W, BPF_REG_1, BPF_REG_FP, site->mask);
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3723  	for (r = 1; r <= CANCEL_MAX_ARG; r++) {
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3724  		if (!(fwd & BIT(r)))
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3725  			continue;
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3726  		buf[n++] = BPF_JMP_IMM(BPF_JSET, BPF_REG_1, BIT(r), 1);
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3727  		buf[n++] = BPF_JMP_A(1);
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13 @3728  		buf[n++] = BPF_ALU64_IMM(BPF_OR, BPF_REG_2, BIT(site->fwd[r]));
685a972de1419e Kumar Kartikeya Dwivedi 2026-11-13  3729  	}
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3730  	buf[n++] = BPF_MOV64_IMM(BPF_REG_0, 0);
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3731  	buf[n++] = BPF_RAW_INSN(BPF_JMP | BPF_EXIT, 0, BPF_CANCEL_EXIT, 0, 0);
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3732  	env->subprog_info[s].can_cancel = true;
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3733  	env->prog->jit_required = 1;
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3734  	return n;
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3735  }
d722e840ee3991 Kumar Kartikeya Dwivedi 2026-11-13  3736  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
