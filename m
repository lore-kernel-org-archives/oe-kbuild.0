Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E6136658
	for <oe-kbuild@lists.linux.dev>; Sat, 17 May 2025 04:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747455185; cv=none; b=mALWhCPCC7y4+AL9H6LwlKi5BlAsBku7mQwD4t3xHQnTgz+zWAqjvHiUp5HQCsnk3qn3X9NGlrw95o+qdm6opq2zCu5Zql04QyDvOLQH3Q/+jQs6bawxfmbZWbaw5EBDwobZ+WeO6Ov9BIlxIlWtoKxa/2PXBmjn8iGXO5+Tgjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747455185; c=relaxed/simple;
	bh=7Tyr6W0IPgJ8qYYATTlpsn+6WDbBCSics/MPTh+C7F8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Za00rPYSWDgF8f4FP/zwSoUj+WjM8oNOqLAXuD6lS6jxRhDi1vMVqFVYDhTrzGxPeQzuKd3fjNzb5r0hwt5EUckeu5YSmTitxXSDcvzWh3ttcA4Lk1HMHjXsCwENMIO3krLY85lHQ/ipx7ETwqqPjMmxniGLPXMOm0qBdsfKr84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pxk9Y11d; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pxk9Y11d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747455183; x=1778991183;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7Tyr6W0IPgJ8qYYATTlpsn+6WDbBCSics/MPTh+C7F8=;
  b=Pxk9Y11dAucNnhLZjDeUL+n1YnrW7UVlEs6XUmGKITR6+wP+zcGhXSXS
   H7TFBuIdaSGEW27CShAAZXA0cKTf61i+Lby7oL/gyKmoRLTtWU+0NNCBk
   9IvDs2A+xkeBgVNa3pmsIp+XG8rpCQqwr4SPk1oUF4TXXZ/0XWPlTXsLI
   QQDvfWRnA6LwEHFGFKjm9gN46RFZOUwvTVeZPLcoKKkQZAt4RcVNWStxE
   Y9Bze8nDAvulBlhbh21Mn1rXHiPxm6IfiqOzonqUCIzcTHXadn07xZbjQ
   /CjjmOdUAc+eRMpD6ongPXPPW5Mx6nPwzKd+sXoIFTnAMfEIbFaRVuniE
   w==;
X-CSE-ConnectionGUID: zCLkytxuSbm0YT4uPkW9FQ==
X-CSE-MsgGUID: oncZpY6vSqKjgUOUwgpvOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="71936301"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="71936301"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 21:13:02 -0700
X-CSE-ConnectionGUID: 0I9XlhtSSC2zJY0i45nqrQ==
X-CSE-MsgGUID: Xmu0lf3HRNey2sPXKysDZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="139888793"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 May 2025 21:13:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG8uw-000Jvb-1M;
	Sat, 17 May 2025 04:12:58 +0000
Date: Sat, 17 May 2025 12:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next v4] bpf: WARN_ONCE on verifier bugs
Message-ID: <202505171244.4j4x4rqt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <aCcGpxnlfOOiOJ-b@mail.gmail.com>
References: <aCcGpxnlfOOiOJ-b@mail.gmail.com>
TO: Paul Chaignon <paul.chaignon@gmail.com>
TO: bpf@vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Chaignon/bpf-WARN_ONCE-on-verifier-bugs/20250516-174044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/aCcGpxnlfOOiOJ-b%40mail.gmail.com
patch subject: [PATCH bpf-next v4] bpf: WARN_ONCE on verifier bugs
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-141-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171244.4j4x4rqt-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505171244.4j4x4rqt-lkp@intel.com/

smatch warnings:
kernel/bpf/btf.c:7662 btf_prepare_func_args() warn: check likely/unlikely parentheses
kernel/bpf/verifier.c:4283 backtrack_insn() warn: check likely/unlikely parentheses
kernel/bpf/verifier.c:3998 bt_subprog_exit() warn: check likely/unlikely parentheses
kernel/bpf/verifier.c:3988 bt_subprog_enter() warn: check likely/unlikely parentheses
kernel/bpf/verifier.c:4717 __mark_chain_precision() warn: check likely/unlikely parentheses
kernel/bpf/verifier.c:6557 check_max_stack_depth_subprog() warn: check likely/unlikely parentheses
kernel/bpf/verifier.c:8399 process_timer_func() warn: check likely/unlikely parentheses
kernel/bpf/verifier.c:10271 setup_func_entry() warn: check likely/unlikely parentheses
kernel/bpf/verifier.c:10386 btf_check_func_arg_match() warn: check likely/unlikely parentheses
kernel/bpf/verifier.c:10450 push_callback_call() warn: check likely/unlikely parentheses
kernel/bpf/verifier.c:22433 do_misc_fixups() warn: check likely/unlikely parentheses

vim +7662 kernel/bpf/btf.c

54c11ec4935a61 Andrii Nakryiko         2024-01-04  7636  
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7637  /* Process BTF of a function to produce high-level expectation of function
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7638   * arguments (like ARG_PTR_TO_CTX, or ARG_PTR_TO_MEM, etc). This information
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7639   * is cached in subprog info for reuse.
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7640   * Returns:
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7641   * EFAULT - there is a verifier bug. Abort verification.
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7642   * EINVAL - cannot convert BTF.
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7643   * 0 - Successfully processed BTF and constructed argument expectations.
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7644   */
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7645  int btf_prepare_func_args(struct bpf_verifier_env *env, int subprog)
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7646  {
e26080d0da87f2 Andrii Nakryiko         2023-12-14  7647  	bool is_global = subprog_aux(env, subprog)->linkage == BTF_FUNC_GLOBAL;
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7648  	struct bpf_subprog_info *sub = subprog_info(env, subprog);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7649  	struct bpf_verifier_log *log = &env->log;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7650  	struct bpf_prog *prog = env->prog;
be8704ff07d237 Alexei Starovoitov      2020-01-20  7651  	enum bpf_prog_type prog_type = prog->type;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7652  	struct btf *btf = prog->aux->btf;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7653  	const struct btf_param *args;
94e1c70a34523b Andrii Nakryiko         2023-12-14  7654  	const struct btf_type *t, *ref_t, *fn_t;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7655  	u32 i, nargs, btf_id;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7656  	const char *tname;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7657  
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7658  	if (sub->args_cached)
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7659  		return 0;
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7660  
e26080d0da87f2 Andrii Nakryiko         2023-12-14  7661  	if (!prog->aux->func_info) {
c59cec93356194 Paul Chaignon           2025-05-16 @7662  		verifier_bug(env, "func_info undefined");
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7663  		return -EFAULT;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7664  	}
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7665  
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7666  	btf_id = prog->aux->func_info[subprog].type_id;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7667  	if (!btf_id) {
e26080d0da87f2 Andrii Nakryiko         2023-12-14  7668  		if (!is_global) /* not fatal for static funcs */
e26080d0da87f2 Andrii Nakryiko         2023-12-14  7669  			return -EINVAL;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7670  		bpf_log(log, "Global functions need valid BTF\n");
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7671  		return -EFAULT;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7672  	}
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7673  
94e1c70a34523b Andrii Nakryiko         2023-12-14  7674  	fn_t = btf_type_by_id(btf, btf_id);
94e1c70a34523b Andrii Nakryiko         2023-12-14  7675  	if (!fn_t || !btf_type_is_func(fn_t)) {
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7676  		/* These checks were already done by the verifier while loading
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7677  		 * struct bpf_func_info
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7678  		 */
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7679  		bpf_log(log, "BTF of func#%d doesn't point to KIND_FUNC\n",
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7680  			subprog);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7681  		return -EFAULT;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7682  	}
94e1c70a34523b Andrii Nakryiko         2023-12-14  7683  	tname = btf_name_by_offset(btf, fn_t->name_off);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7684  
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7685  	if (prog->aux->func_info_aux[subprog].unreliable) {
c59cec93356194 Paul Chaignon           2025-05-16  7686  		verifier_bug(env, "unreliable BTF for function %s()", tname);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7687  		return -EFAULT;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7688  	}
be8704ff07d237 Alexei Starovoitov      2020-01-20  7689  	if (prog_type == BPF_PROG_TYPE_EXT)
3aac1ead5eb6b7 Toke Høiland-Jørgensen  2020-09-29  7690  		prog_type = prog->aux->dst_prog->type;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7691  
94e1c70a34523b Andrii Nakryiko         2023-12-14  7692  	t = btf_type_by_id(btf, fn_t->type);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7693  	if (!t || !btf_type_is_func_proto(t)) {
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7694  		bpf_log(log, "Invalid type of function %s()\n", tname);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7695  		return -EFAULT;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7696  	}
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7697  	args = (const struct btf_param *)(t + 1);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7698  	nargs = btf_type_vlen(t);
523a4cf491b3c9 Dmitrii Banshchikov     2021-02-26  7699  	if (nargs > MAX_BPF_FUNC_REG_ARGS) {
1eb986746a6795 Andrii Nakryiko         2024-02-02  7700  		if (!is_global)
1eb986746a6795 Andrii Nakryiko         2024-02-02  7701  			return -EINVAL;
523a4cf491b3c9 Dmitrii Banshchikov     2021-02-26  7702  		bpf_log(log, "Global function %s() with %d > %d args. Buggy compiler.\n",
523a4cf491b3c9 Dmitrii Banshchikov     2021-02-26  7703  			tname, nargs, MAX_BPF_FUNC_REG_ARGS);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7704  		return -EINVAL;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7705  	}
b9ae0c9dd0aca7 Kumar Kartikeya Dwivedi 2023-09-13  7706  	/* check that function returns int, exception cb also requires this */
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7707  	t = btf_type_by_id(btf, t->type);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7708  	while (btf_type_is_modifier(t))
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7709  		t = btf_type_by_id(btf, t->type);
6089fb325cf737 Yonghong Song           2022-06-06  7710  	if (!btf_type_is_int(t) && !btf_is_any_enum(t)) {
1eb986746a6795 Andrii Nakryiko         2024-02-02  7711  		if (!is_global)
1eb986746a6795 Andrii Nakryiko         2024-02-02  7712  			return -EINVAL;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7713  		bpf_log(log,
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7714  			"Global function %s() doesn't return scalar. Only those are supported.\n",
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7715  			tname);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7716  		return -EINVAL;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7717  	}
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7718  	/* Convert BTF function arguments into verifier types.
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7719  	 * Only PTR_TO_CTX and SCALAR are supported atm.
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7720  	 */
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7721  	for (i = 0; i < nargs; i++) {
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7722  		u32 tags = 0;
522bb2c1f82b12 Andrii Nakryiko         2024-01-04  7723  		int id = 0;
94e1c70a34523b Andrii Nakryiko         2023-12-14  7724  
94e1c70a34523b Andrii Nakryiko         2023-12-14  7725  		/* 'arg:<tag>' decl_tag takes precedence over derivation of
94e1c70a34523b Andrii Nakryiko         2023-12-14  7726  		 * register type from BTF type itself
94e1c70a34523b Andrii Nakryiko         2023-12-14  7727  		 */
522bb2c1f82b12 Andrii Nakryiko         2024-01-04  7728  		while ((id = btf_find_next_decl_tag(btf, fn_t, i, "arg:", id)) > 0) {
522bb2c1f82b12 Andrii Nakryiko         2024-01-04  7729  			const struct btf_type *tag_t = btf_type_by_id(btf, id);
522bb2c1f82b12 Andrii Nakryiko         2024-01-04  7730  			const char *tag = __btf_name_by_offset(btf, tag_t->name_off) + 4;
522bb2c1f82b12 Andrii Nakryiko         2024-01-04  7731  
94e1c70a34523b Andrii Nakryiko         2023-12-14  7732  			/* disallow arg tags in static subprogs */
94e1c70a34523b Andrii Nakryiko         2023-12-14  7733  			if (!is_global) {
94e1c70a34523b Andrii Nakryiko         2023-12-14  7734  				bpf_log(log, "arg#%d type tag is not supported in static functions\n", i);
94e1c70a34523b Andrii Nakryiko         2023-12-14  7735  				return -EOPNOTSUPP;
94e1c70a34523b Andrii Nakryiko         2023-12-14  7736  			}
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7737  
94e1c70a34523b Andrii Nakryiko         2023-12-14  7738  			if (strcmp(tag, "ctx") == 0) {
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7739  				tags |= ARG_TAG_CTX;
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7740  			} else if (strcmp(tag, "trusted") == 0) {
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7741  				tags |= ARG_TAG_TRUSTED;
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7742  			} else if (strcmp(tag, "nonnull") == 0) {
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7743  				tags |= ARG_TAG_NONNULL;
8f2b44cd9d69ec Andrii Nakryiko         2024-01-29  7744  			} else if (strcmp(tag, "nullable") == 0) {
8f2b44cd9d69ec Andrii Nakryiko         2024-01-29  7745  				tags |= ARG_TAG_NULLABLE;
2edc3de6fb6509 Alexei Starovoitov      2024-03-07  7746  			} else if (strcmp(tag, "arena") == 0) {
2edc3de6fb6509 Alexei Starovoitov      2024-03-07  7747  				tags |= ARG_TAG_ARENA;
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7748  			} else {
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7749  				bpf_log(log, "arg#%d has unsupported set of tags\n", i);
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7750  				return -EOPNOTSUPP;
94e1c70a34523b Andrii Nakryiko         2023-12-14  7751  			}
94e1c70a34523b Andrii Nakryiko         2023-12-14  7752  		}
522bb2c1f82b12 Andrii Nakryiko         2024-01-04  7753  		if (id != -ENOENT) {
522bb2c1f82b12 Andrii Nakryiko         2024-01-04  7754  			bpf_log(log, "arg#%d type tag fetching failure: %d\n", i, id);
522bb2c1f82b12 Andrii Nakryiko         2024-01-04  7755  			return id;
522bb2c1f82b12 Andrii Nakryiko         2024-01-04  7756  		}
94e1c70a34523b Andrii Nakryiko         2023-12-14  7757  
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7758  		t = btf_type_by_id(btf, args[i].type);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7759  		while (btf_type_is_modifier(t))
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7760  			t = btf_type_by_id(btf, t->type);
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7761  		if (!btf_type_is_ptr(t))
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7762  			goto skip_pointer;
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7763  
fb5b86cfd4ef21 Andrii Nakryiko         2024-02-12  7764  		if ((tags & ARG_TAG_CTX) || btf_is_prog_ctx_type(log, btf, t, prog_type, i)) {
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7765  			if (tags & ~ARG_TAG_CTX) {
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7766  				bpf_log(log, "arg#%d has invalid combination of tags\n", i);
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7767  				return -EINVAL;
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7768  			}
add9c58cd44e88 Andrii Nakryiko         2024-01-25  7769  			if ((tags & ARG_TAG_CTX) &&
add9c58cd44e88 Andrii Nakryiko         2024-01-25  7770  			    btf_validate_prog_ctx_type(log, btf, t, i, prog_type,
add9c58cd44e88 Andrii Nakryiko         2024-01-25  7771  						       prog->expected_attach_type))
add9c58cd44e88 Andrii Nakryiko         2024-01-25  7772  				return -EINVAL;
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7773  			sub->args[i].arg_type = ARG_PTR_TO_CTX;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7774  			continue;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7775  		}
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7776  		if (btf_is_dynptr_ptr(btf, t)) {
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7777  			if (tags) {
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7778  				bpf_log(log, "arg#%d has invalid combination of tags\n", i);
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7779  				return -EINVAL;
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7780  			}
a64bfe618665ea Andrii Nakryiko         2023-12-14  7781  			sub->args[i].arg_type = ARG_PTR_TO_DYNPTR | MEM_RDONLY;
a64bfe618665ea Andrii Nakryiko         2023-12-14  7782  			continue;
a64bfe618665ea Andrii Nakryiko         2023-12-14  7783  		}
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7784  		if (tags & ARG_TAG_TRUSTED) {
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7785  			int kern_type_id;
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7786  
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7787  			if (tags & ARG_TAG_NONNULL) {
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7788  				bpf_log(log, "arg#%d has invalid combination of tags\n", i);
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7789  				return -EINVAL;
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7790  			}
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7791  
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7792  			kern_type_id = btf_get_ptr_to_btf_id(log, i, btf, t);
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7793  			if (kern_type_id < 0)
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7794  				return kern_type_id;
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7795  
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7796  			sub->args[i].arg_type = ARG_PTR_TO_BTF_ID | PTR_TRUSTED;
8f2b44cd9d69ec Andrii Nakryiko         2024-01-29  7797  			if (tags & ARG_TAG_NULLABLE)
8f2b44cd9d69ec Andrii Nakryiko         2024-01-29  7798  				sub->args[i].arg_type |= PTR_MAYBE_NULL;
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7799  			sub->args[i].btf_id = kern_type_id;
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7800  			continue;
e2b3c4ff5d183d Andrii Nakryiko         2024-01-29  7801  		}
2edc3de6fb6509 Alexei Starovoitov      2024-03-07  7802  		if (tags & ARG_TAG_ARENA) {
2edc3de6fb6509 Alexei Starovoitov      2024-03-07  7803  			if (tags & ~ARG_TAG_ARENA) {
2edc3de6fb6509 Alexei Starovoitov      2024-03-07  7804  				bpf_log(log, "arg#%d arena cannot be combined with any other tags\n", i);
2edc3de6fb6509 Alexei Starovoitov      2024-03-07  7805  				return -EINVAL;
2edc3de6fb6509 Alexei Starovoitov      2024-03-07  7806  			}
2edc3de6fb6509 Alexei Starovoitov      2024-03-07  7807  			sub->args[i].arg_type = ARG_PTR_TO_ARENA;
2edc3de6fb6509 Alexei Starovoitov      2024-03-07  7808  			continue;
2edc3de6fb6509 Alexei Starovoitov      2024-03-07  7809  		}
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7810  		if (is_global) { /* generic user data pointer */
e26080d0da87f2 Andrii Nakryiko         2023-12-14  7811  			u32 mem_size;
e5069b9c23b385 Dmitrii Banshchikov     2021-02-13  7812  
8f2b44cd9d69ec Andrii Nakryiko         2024-01-29  7813  			if (tags & ARG_TAG_NULLABLE) {
8f2b44cd9d69ec Andrii Nakryiko         2024-01-29  7814  				bpf_log(log, "arg#%d has invalid combination of tags\n", i);
8f2b44cd9d69ec Andrii Nakryiko         2024-01-29  7815  				return -EINVAL;
8f2b44cd9d69ec Andrii Nakryiko         2024-01-29  7816  			}
8f2b44cd9d69ec Andrii Nakryiko         2024-01-29  7817  
e5069b9c23b385 Dmitrii Banshchikov     2021-02-13  7818  			t = btf_type_skip_modifiers(btf, t->type, NULL);
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7819  			ref_t = btf_resolve_size(btf, t, &mem_size);
e5069b9c23b385 Dmitrii Banshchikov     2021-02-13  7820  			if (IS_ERR(ref_t)) {
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7821  				bpf_log(log, "arg#%d reference type('%s %s') size cannot be determined: %ld\n",
e5069b9c23b385 Dmitrii Banshchikov     2021-02-13  7822  					i, btf_type_str(t), btf_name_by_offset(btf, t->name_off),
e5069b9c23b385 Dmitrii Banshchikov     2021-02-13  7823  					PTR_ERR(ref_t));
e5069b9c23b385 Dmitrii Banshchikov     2021-02-13  7824  				return -EINVAL;
e5069b9c23b385 Dmitrii Banshchikov     2021-02-13  7825  			}
e5069b9c23b385 Dmitrii Banshchikov     2021-02-13  7826  
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7827  			sub->args[i].arg_type = ARG_PTR_TO_MEM | PTR_MAYBE_NULL;
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7828  			if (tags & ARG_TAG_NONNULL)
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7829  				sub->args[i].arg_type &= ~PTR_MAYBE_NULL;
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7830  			sub->args[i].mem_size = mem_size;
e5069b9c23b385 Dmitrii Banshchikov     2021-02-13  7831  			continue;
e5069b9c23b385 Dmitrii Banshchikov     2021-02-13  7832  		}
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7833  
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7834  skip_pointer:
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7835  		if (tags) {
54c11ec4935a61 Andrii Nakryiko         2024-01-04  7836  			bpf_log(log, "arg#%d has pointer tag, but is not a pointer type\n", i);
94e1c70a34523b Andrii Nakryiko         2023-12-14  7837  			return -EINVAL;
94e1c70a34523b Andrii Nakryiko         2023-12-14  7838  		}
18810ad3929ff6 Andrii Nakryiko         2024-01-04  7839  		if (btf_type_is_int(t) || btf_is_any_enum(t)) {
18810ad3929ff6 Andrii Nakryiko         2024-01-04  7840  			sub->args[i].arg_type = ARG_ANYTHING;
18810ad3929ff6 Andrii Nakryiko         2024-01-04  7841  			continue;
18810ad3929ff6 Andrii Nakryiko         2024-01-04  7842  		}
1eb986746a6795 Andrii Nakryiko         2024-02-02  7843  		if (!is_global)
1eb986746a6795 Andrii Nakryiko         2024-02-02  7844  			return -EINVAL;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7845  		bpf_log(log, "Arg#%d type %s in %s() is not supported yet.\n",
571f9738bfb3d4 Peilin Ye               2022-09-16  7846  			i, btf_type_str(t), tname);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7847  		return -EINVAL;
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  7848  	}
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7849  
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7850  	sub->arg_cnt = nargs;
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7851  	sub->args_cached = true;
4ba1d0f2341413 Andrii Nakryiko         2023-12-14  7852  
8c1b6e69dcc1e1 Alexei Starovoitov      2019-11-14  7853  	return 0;
8c1b6e69dcc1e1 Alexei Starovoitov      2019-11-14  7854  }
8c1b6e69dcc1e1 Alexei Starovoitov      2019-11-14  7855  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
