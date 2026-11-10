Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330898;
	b=Zq/0XQqy5I472NIfSgYVMUOSfP64awF9m3ufDcZTs2Lb+ln8ZjPIz57AIzzOwcAYGKJk
	 uBwZQIL/5tiLQek7c396JZY9ZxNsAzvdzUgx8ibWTMig25eqIosXa6HlIsvS9zhYTQbAf
	 b9pQVTT11c5vkia9Ws/eU8sI2QaDQEPhKE5PEf9m/ZMvEO0hjcz2VnJm+LuFsC+SvzUIQ
	 8d73smcc590+hgNAzmvFd5MD7t64nTfAxo5YeUNugH+3MHQDQqCu246jqVCvBY47Hz7ir
	 MXSCaQql61MEJkdaAtRREczD6fnmkOL68dvyRN6B/nS5JDJBPb6YBtTmGBVdCCrLPOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330898;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/oXujU0Hud+feK3nVgj+rrC6qO5bLmcZeZ4SU2uI0Hw=;
	b=5LWD86q2JZ5vWFy3xiVCDuMQv7Es5Ma676f7IyBE99IggUktaXMOuJ2/TZOLH5NrKrPw
	 r/2rDjR1Q6MyfIv8PSoSM7Q9vyv4UqD4s1gBeNj8JO0SD517fe4mJ2OR/bpZYPjFmZLqf
	 3SL25Q8pFyNCm+d8qzETmlqPf8VbCmloSURTCDWD4l/QUtjdeQiBLxLgmOsNhSY5cvjTd
	 nW3VGNYR4akMXidp8ARoZYJX4GjZJ56REkffgSKm1GmOBSoG3JwpsOyircn9FkUyOkvoy
	 yAaZ1Jlk1exGzVyi59zLm6UKZMNaUApFacr+yZmozQd5cyT99OmKAmltXWOt7Ff5eog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GE8gOXmO;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD947606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 17:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD947606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GE8gOXmO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794330897; x=1825866897;
  h=date:from:to:cc:subject:message-id;
  bh=hGdKyAvQfPq5f0S5wuBA6mlb7G3ZMee2Vm0QtDbEjws=;
  b=GE8gOXmO4V0+LfO2V9+4YWsOlrSWlWG80MAW/kjsozG7Oxp03gk/0cjt
   Y+Yu92NzZW8HzePCgS/bUhB843K/I57oBIRWQ0AsTbNM0qBqRaHrW+w1G
   XZXODfqkZLJJhjmMmJhIHgfFeryUj2zPiz2pukVqxOL0d1FwiYStV0dcq
   rHnD+ZjaCeNFl85u8ZyPKqHOW96cX36nGbtoJrSXdKHWyFmsLHErWWoy3
   OKEtJsZtakWL03zAA8AXr6PObX9ag+6zHXxZ53Qdu22/9UhxndZWa7Hah
   fRwwH8IHKe/cvYrSWbdokC/IZ/7xQpS2DuhLnvLRiWNf0CrIV3fba8YAH
   g==;
X-CSE-ConnectionGUID: 7VNEuqmPSauxd4x6o5SQHQ==
X-CSE-MsgGUID: 9KSPPBseQCKD408jRKqS4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2968207"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2968207"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 09:14:57 -0800
X-CSE-ConnectionGUID: RssjdGU0SCW+0BftPYyx8A==
X-CSE-MsgGUID: 52hzmCPtTS+qrTL5lc7r8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8095628"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 10 Nov 2026 09:14:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQpQq-000000000JP-3c4C;
	Tue, 10 Nov 2026 17:14:52 +0000
Date: Tue, 10 Nov 2026 18:14:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:cancellations 29/40] kernel/bpf/frame_desc.c:290
 resource_describe() warn: missing unwind goto?
Message-ID: <202611101837.1BRWJSuF-lkp@intel.com>
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
head:   cebd6c9fc9adb0f84623f6e93f543666457c22cd
commit: 16fed6de01f760a3170fdcd20421531c09060029 [29/40] bpf: Describe the references a frame holds at a throw site
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: sparc-randconfig-2200-20261110 (https://download.01.org/0day-ci/archive/20261110/202611101837.1BRWJSuF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611101837.1BRWJSuF-lkp@intel.com/

smatch warnings:
kernel/bpf/frame_desc.c:290 resource_describe() warn: missing unwind goto?

vim +290 kernel/bpf/frame_desc.c

16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  250  
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  251  /*
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  252   * Classify a register or spilled register that holds a reference. The pointer
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  253   * may point into the object, see reg_is_ref(): the class carries by how much.
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  254   * A reference of a type that no destructor is registered for, or whose
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  255   * release kfunc the program may not call, has no class: it is one the program
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  256   * could not release either, so a site holding it is one the verifier would
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  257   * reject anyway, for the leak.
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  258   */
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  259  static int resource_describe(struct bpf_verifier_env *env, const struct bpf_reg_state *reg,
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  260  			     struct bpf_resource *resp)
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  261  {
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  262  	u32 flags = type_flag(reg->type) & ~PTR_MAYBE_NULL;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  263  	struct bpf_resource res;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  264  	int ret;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  265  
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  266  	memset(&res, 0, sizeof(res));
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  267  	res.type = reg->type & ~PTR_MAYBE_NULL;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  268  	res.delta = reg->var_off.value;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  269  	switch (base_type(reg->type)) {
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  270  	case PTR_TO_BTF_ID:
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  271  		res.btf = reg->btf;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  272  		res.btf_id = reg->btf_id;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  273  		if (flags & MEM_ALLOC) {
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  274  			if (flags & ~(MEM_ALLOC | MEM_PERCPU))
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  275  				goto unsupported;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  276  			res.kind = flags & MEM_PERCPU ? BPF_RESOURCE_PERCPU_OBJ : BPF_RESOURCE_OBJ;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  277  			res.meta = btf_find_struct_meta(reg->btf, reg->btf_id);
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  278  			break;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  279  		}
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  280  		if (flags & ~PTR_TRUSTED)
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  281  			goto unsupported;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  282  		/* A socket cast to one of its structs is still what bpf_sk_release() takes. */
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  283  		if (reg_is_sock_btf(reg) && helper_ok(env, BPF_FUNC_sk_release)) {
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  284  			res.kind = BPF_RESOURCE_SOCK;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  285  			break;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  286  		}
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  287  		res.kind = BPF_RESOURCE_KPTR;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  288  		ret = resource_registry(env, reg->btf, reg->btf_id, &res, "object");
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  289  		if (ret)
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08 @290  			return ret;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  291  		break;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  292  	case PTR_TO_SOCKET:
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  293  	case PTR_TO_SOCK_COMMON:
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  294  	case PTR_TO_TCP_SOCK:
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  295  		if (flags || !helper_ok(env, BPF_FUNC_sk_release))
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  296  			goto unsupported;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  297  		res.kind = BPF_RESOURCE_SOCK;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  298  		break;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  299  	case PTR_TO_MEM:
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  300  		if (flags != MEM_RINGBUF || !helper_ok(env, BPF_FUNC_ringbuf_discard))
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  301  			goto unsupported;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  302  		res.kind = BPF_RESOURCE_RINGBUF;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  303  		break;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  304  	default:
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  305  		goto unsupported;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  306  	}
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  307  	*resp = res;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  308  	return 0;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  309  unsupported:
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  310  	verbose(env, "frame_desc: cannot release a reference of type %s\n",
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  311  		reg_type_str(env, reg->type));
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  312  	return -EOPNOTSUPP;
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  313  }
16fed6de01f760 Kumar Kartikeya Dwivedi 2026-11-08  314  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
