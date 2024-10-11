Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB01D12F0
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Oct 2024 19:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675877; cv=none; b=tlIIqrb8kbwA3CW6SZWYT2LO6iZAk2XE+AcZbpbKe5iLHr6LQKFITYj/IIZccWtbY3dqG46jFM9JxmSO4RL4MAYmKSjLV28qfAU4ifpM3KJdwKiMAFJ7nzLMzgWI+t6as6DADcVfoHg19QpUMzRrNzA86GADUvcJeTbVNFGcZds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675877; c=relaxed/simple;
	bh=MQVaQW9wk1o5f4jhHBuJTVbR3I246KWvh5Ton5mkHJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U4RePaPo3MBM/+SP0CCiDfE8Gt8Ay5h8o2EoodAXpwDQe9dtk2sEZDCH7+qqizIgRNkYeEWpTKx71YTn0FwIm6LNbamkYXVNVBQXW5sHjzadbg9+jGdJMtuY7c1xKWqMyjlY+6Romcaw55HfIYLNBfyR6kIsfl8DXtBzWV9R9gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meGp4EqD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meGp4EqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728675875; x=1760211875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MQVaQW9wk1o5f4jhHBuJTVbR3I246KWvh5Ton5mkHJA=;
  b=meGp4EqDH55OlX/HnqYgOX30Pwoz+vD5+OnWQsGT6bShtxtKHq0Bnq1U
   m4KcdtP/EvUvylHzkUYuO3J4IBb60fZ0qA2JY8I8UcxvyfSvDhKj+XcHk
   Ye2M76tchirGAGGcoCJvXYqqrp0o7OlH2HEZHIJ2d317HbstWFNQ1a1BS
   aT6lvj/LbuCnvsHtkenDo+qXbHteqDVkejGl143s2v08OFADJ2ej4BXRA
   UY9c758TZciwnq4xK0FnEi7TzThv3LSn1ybbiOCeAkQ6dBH8CPo3fdvhv
   dizVV7OxjvpRTqk1HtXgSYhgQmxyUBw6HgIQhktpUtlagS7nUOiOihODg
   A==;
X-CSE-ConnectionGUID: Xiqh2yx5S/6IWt74C/MXvA==
X-CSE-MsgGUID: Aih5I8pTSpmaF6YItV3exQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45596866"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="45596866"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 12:44:34 -0700
X-CSE-ConnectionGUID: nWCu/VGzTlGszcZiJqHpvQ==
X-CSE-MsgGUID: 4WFUC/CMQPaCx+DceJ7Etw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="100313755"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Oct 2024 12:44:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szLYt-000Cfj-0n;
	Fri, 11 Oct 2024 19:44:31 +0000
Date: Sat, 12 Oct 2024 03:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next 05/16] bpf: Support map key with dynptr in
 verifier
Message-ID: <202410120302.bUO1BoP7-lkp@intel.com>
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
In-Reply-To: <20241008091501.8302-6-houtao@huaweicloud.com>
References: <20241008091501.8302-6-houtao@huaweicloud.com>
TO: Hou Tao <houtao@huaweicloud.com>
TO: bpf@vger.kernel.org
CC: Martin KaFai Lau <martin.lau@linux.dev>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Song Liu <song@kernel.org>
CC: Hao Luo <haoluo@google.com>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: KP Singh <kpsingh@kernel.org>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: Jiri Olsa <jolsa@kernel.org>
CC: John Fastabend <john.fastabend@gmail.com>
CC: houtao1@huawei.com
CC: xukuohai@huawei.com

Hi Hou,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/bpf-Introduce-map-flag-BPF_F_DYNPTR_IN_KEY/20241008-171136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241008091501.8302-6-houtao%40huaweicloud.com
patch subject: [PATCH bpf-next 05/16] bpf: Support map key with dynptr in verifier
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20241011 (https://download.01.org/0day-ci/archive/20241012/202410120302.bUO1BoP7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410120302.bUO1BoP7-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:7471 check_stack_range_initialized() error: we previously assumed 'meta' could be null (see line 7439)

vim +/meta +7471 kernel/bpf/verifier.c

cf5a0c90a8bc5f Hou Tao                 2024-10-08  7350  
01f810ace9ed37 Andrei Matei            2021-02-06  7351  /* When register 'regno' is used to read the stack (either directly or through
01f810ace9ed37 Andrei Matei            2021-02-06  7352   * a helper function) make sure that it's within stack boundary and, depending
6b4a64bafd107e Andrei Matei            2023-12-07  7353   * on the access type and privileges, that all elements of the stack are
6b4a64bafd107e Andrei Matei            2023-12-07  7354   * initialized.
01f810ace9ed37 Andrei Matei            2021-02-06  7355   *
01f810ace9ed37 Andrei Matei            2021-02-06  7356   * 'off' includes 'regno->off', but not its dynamic part (if any).
01f810ace9ed37 Andrei Matei            2021-02-06  7357   *
01f810ace9ed37 Andrei Matei            2021-02-06  7358   * All registers that have been spilled on the stack in the slots within the
01f810ace9ed37 Andrei Matei            2021-02-06  7359   * read offsets are marked as read.
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7360   */
01f810ace9ed37 Andrei Matei            2021-02-06  7361  static int check_stack_range_initialized(
01f810ace9ed37 Andrei Matei            2021-02-06  7362  		struct bpf_verifier_env *env, int regno, int off,
81b030a7eaa2ee Hou Tao                 2024-10-08  7363  		int access_size, unsigned int access_flags,
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  7364  		enum bpf_access_src type, struct bpf_call_arg_meta *meta)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7365  {
2a159c6f82381a Daniel Borkmann         2018-10-21  7366  	struct bpf_reg_state *reg = reg_state(env, regno);
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  7367  	struct bpf_func_state *state = func(env, reg);
f7cf25b2026dc8 Alexei Starovoitov      2019-06-15  7368  	int err, min_off, max_off, i, j, slot, spi;
01f810ace9ed37 Andrei Matei            2021-02-06  7369  	char *err_extra = type == ACCESS_HELPER ? " indirect" : "";
01f810ace9ed37 Andrei Matei            2021-02-06  7370  	enum bpf_access_type bounds_check_type;
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7371  	struct dynptr_key_state dynptr_key;
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7372  	bool dynptr_read_allowed;
01f810ace9ed37 Andrei Matei            2021-02-06  7373  	/* Some accesses can write anything into the stack, others are
01f810ace9ed37 Andrei Matei            2021-02-06  7374  	 * read-only.
01f810ace9ed37 Andrei Matei            2021-02-06  7375  	 */
01f810ace9ed37 Andrei Matei            2021-02-06  7376  	bool clobber = false;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7377  
81b030a7eaa2ee Hou Tao                 2024-10-08  7378  	if (access_size == 0 && !(access_flags & ACCESS_F_ZERO_SIZE_ALLOWED)) {
01f810ace9ed37 Andrei Matei            2021-02-06  7379  		verbose(env, "invalid zero-sized read\n");
01f810ace9ed37 Andrei Matei            2021-02-06  7380  		return -EACCES;
01f810ace9ed37 Andrei Matei            2021-02-06  7381  	}
01f810ace9ed37 Andrei Matei            2021-02-06  7382  
01f810ace9ed37 Andrei Matei            2021-02-06  7383  	if (type == ACCESS_HELPER) {
01f810ace9ed37 Andrei Matei            2021-02-06  7384  		/* The bounds checks for writes are more permissive than for
01f810ace9ed37 Andrei Matei            2021-02-06  7385  		 * reads. However, if raw_mode is not set, we'll do extra
01f810ace9ed37 Andrei Matei            2021-02-06  7386  		 * checks below.
01f810ace9ed37 Andrei Matei            2021-02-06  7387  		 */
01f810ace9ed37 Andrei Matei            2021-02-06  7388  		bounds_check_type = BPF_WRITE;
01f810ace9ed37 Andrei Matei            2021-02-06  7389  		clobber = true;
01f810ace9ed37 Andrei Matei            2021-02-06  7390  	} else {
01f810ace9ed37 Andrei Matei            2021-02-06  7391  		bounds_check_type = BPF_READ;
01f810ace9ed37 Andrei Matei            2021-02-06  7392  	}
01f810ace9ed37 Andrei Matei            2021-02-06  7393  	err = check_stack_access_within_bounds(env, regno, off, access_size,
01f810ace9ed37 Andrei Matei            2021-02-06  7394  					       type, bounds_check_type);
2011fccfb61bbd Andrey Ignatov          2019-03-28  7395  	if (err)
2011fccfb61bbd Andrey Ignatov          2019-03-28  7396  		return err;
01f810ace9ed37 Andrei Matei            2021-02-06  7397  
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7398  	dynptr_read_allowed = access_flags & ACCESS_F_DYNPTR_READ_ALLOWED;
01f810ace9ed37 Andrei Matei            2021-02-06  7399  	if (tnum_is_const(reg->var_off)) {
01f810ace9ed37 Andrei Matei            2021-02-06  7400  		min_off = max_off = reg->var_off.value + off;
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7401  
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7402  		if (dynptr_read_allowed && (min_off % BPF_REG_SIZE)) {
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7403  			verbose(env, "R%d misaligned offset %d for dynptr-key\n", regno, min_off);
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7404  			return -EACCES;
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7405  		}
2011fccfb61bbd Andrey Ignatov          2019-03-28  7406  	} else {
088ec26d9c2da9 Andrey Ignatov          2019-04-03  7407  		/* Variable offset is prohibited for unprivileged mode for
088ec26d9c2da9 Andrey Ignatov          2019-04-03  7408  		 * simplicity since it requires corresponding support in
088ec26d9c2da9 Andrey Ignatov          2019-04-03  7409  		 * Spectre masking for stack ALU.
088ec26d9c2da9 Andrey Ignatov          2019-04-03  7410  		 * See also retrieve_ptr_limit().
088ec26d9c2da9 Andrey Ignatov          2019-04-03  7411  		 */
2c78ee898d8f10 Alexei Starovoitov      2020-05-13  7412  		if (!env->bypass_spec_v1) {
f1174f77b50c94 Edward Cree             2017-08-07  7413  			char tn_buf[48];
f1174f77b50c94 Edward Cree             2017-08-07  7414  
914cb781ee1a35 Alexei Starovoitov      2017-11-30  7415  			tnum_strn(tn_buf, sizeof(tn_buf), reg->var_off);
01f810ace9ed37 Andrei Matei            2021-02-06  7416  			verbose(env, "R%d%s variable offset stack access prohibited for !root, var_off=%s\n",
01f810ace9ed37 Andrei Matei            2021-02-06  7417  				regno, err_extra, tn_buf);
ea25f914dc164c Jann Horn               2017-12-18  7418  			return -EACCES;
f1174f77b50c94 Edward Cree             2017-08-07  7419  		}
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7420  
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7421  		if (dynptr_read_allowed) {
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7422  			verbose(env, "R%d variable offset prohibited for dynptr-key\n", regno);
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7423  			return -EACCES;
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7424  		}
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7425  
f2bcd05ec7b839 Andrey Ignatov          2019-04-03  7426  		/* Only initialized buffer on stack is allowed to be accessed
f2bcd05ec7b839 Andrey Ignatov          2019-04-03  7427  		 * with variable offset. With uninitialized buffer it's hard to
f2bcd05ec7b839 Andrey Ignatov          2019-04-03  7428  		 * guarantee that whole memory is marked as initialized on
f2bcd05ec7b839 Andrey Ignatov          2019-04-03  7429  		 * helper return since specific bounds are unknown what may
f2bcd05ec7b839 Andrey Ignatov          2019-04-03  7430  		 * cause uninitialized stack leaking.
f2bcd05ec7b839 Andrey Ignatov          2019-04-03  7431  		 */
f2bcd05ec7b839 Andrey Ignatov          2019-04-03  7432  		if (meta && meta->raw_mode)
f2bcd05ec7b839 Andrey Ignatov          2019-04-03  7433  			meta = NULL;
f2bcd05ec7b839 Andrey Ignatov          2019-04-03  7434  
01f810ace9ed37 Andrei Matei            2021-02-06  7435  		min_off = reg->smin_value + off;
01f810ace9ed37 Andrei Matei            2021-02-06  7436  		max_off = reg->smax_value + off;
107c26a70ca81b Andrey Ignatov          2019-04-03  7437  	}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7438  
435faee1aae9c1 Daniel Borkmann         2016-04-13 @7439  	if (meta && meta->raw_mode) {
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7440  		/* Ensure we won't be overwriting dynptrs when simulating byte
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7441  		 * by byte access in check_helper_call using meta.access_size.
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7442  		 * This would be a problem if we have a helper in the future
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7443  		 * which takes:
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7444  		 *
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7445  		 *	helper(uninit_mem, len, dynptr)
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7446  		 *
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7447  		 * Now, uninint_mem may overlap with dynptr pointer. Hence, it
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7448  		 * may end up writing to dynptr itself when touching memory from
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7449  		 * arg 1. This can be relaxed on a case by case basis for known
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7450  		 * safe cases, but reject due to the possibilitiy of aliasing by
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7451  		 * default.
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7452  		 */
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7453  		for (i = min_off; i < max_off + access_size; i++) {
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7454  			int stack_off = -i - 1;
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7455  
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7456  			spi = __get_spi(i);
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7457  			/* raw_mode may write past allocated_stack */
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7458  			if (state->allocated_stack <= stack_off)
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7459  				continue;
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7460  			if (state->stack[spi].slot_type[stack_off % BPF_REG_SIZE] == STACK_DYNPTR) {
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7461  				verbose(env, "potential write to dynptr at off=%d disallowed\n", i);
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7462  				return -EACCES;
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7463  			}
ef8fc7a07c0e16 Kumar Kartikeya Dwivedi 2023-01-21  7464  		}
435faee1aae9c1 Daniel Borkmann         2016-04-13  7465  		meta->access_size = access_size;
435faee1aae9c1 Daniel Borkmann         2016-04-13  7466  		meta->regno = regno;
435faee1aae9c1 Daniel Borkmann         2016-04-13  7467  		return 0;
435faee1aae9c1 Daniel Borkmann         2016-04-13  7468  	}
435faee1aae9c1 Daniel Borkmann         2016-04-13  7469  
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7470  	if (dynptr_read_allowed) {
cf5a0c90a8bc5f Hou Tao                 2024-10-08 @7471  		err = init_dynptr_key_state(env, meta->map_ptr->key_record, &dynptr_key);
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7472  		if (err)
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7473  			return err;
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7474  	}
2011fccfb61bbd Andrey Ignatov          2019-03-28  7475  	for (i = min_off; i < max_off + access_size; i++) {
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7476  		u8 *stype;
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7477  
2011fccfb61bbd Andrey Ignatov          2019-03-28  7478  		slot = -i - 1;
638f5b90d46016 Alexei Starovoitov      2017-10-31  7479  		spi = slot / BPF_REG_SIZE;
6b4a64bafd107e Andrei Matei            2023-12-07  7480  		if (state->allocated_stack <= slot) {
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7481  			verbose(env, "verifier bug: allocated_stack too small\n");
6b4a64bafd107e Andrei Matei            2023-12-07  7482  			return -EFAULT;
6b4a64bafd107e Andrei Matei            2023-12-07  7483  		}
6b4a64bafd107e Andrei Matei            2023-12-07  7484  
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7485  		stype = &state->stack[spi].slot_type[slot % BPF_REG_SIZE];
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7486  		if (*stype == STACK_MISC)
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7487  			goto mark;
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7488  		if (dynptr_read_allowed && *stype == STACK_DYNPTR)
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7489  			goto mark;
6715df8d5d2465 Eduard Zingerman        2023-02-19  7490  		if ((*stype == STACK_ZERO) ||
6715df8d5d2465 Eduard Zingerman        2023-02-19  7491  		    (*stype == STACK_INVALID && env->allow_uninit_stack)) {
01f810ace9ed37 Andrei Matei            2021-02-06  7492  			if (clobber) {
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7493  				/* helper can write anything into the stack */
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7494  				*stype = STACK_MISC;
01f810ace9ed37 Andrei Matei            2021-02-06  7495  			}
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7496  			goto mark;
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7497  		}
1d68f22b3d53d3 Yonghong Song           2020-05-09  7498  
27113c59b6d0a5 Martin KaFai Lau        2021-09-21  7499  		if (is_spilled_reg(&state->stack[spi]) &&
cd17d38f8b28f8 Yonghong Song           2020-12-09  7500  		    (state->stack[spi].spilled_ptr.type == SCALAR_VALUE ||
cd17d38f8b28f8 Yonghong Song           2020-12-09  7501  		     env->allow_ptr_leaks)) {
01f810ace9ed37 Andrei Matei            2021-02-06  7502  			if (clobber) {
f54c7898ed1c3c Daniel Borkmann         2019-12-22  7503  				__mark_reg_unknown(env, &state->stack[spi].spilled_ptr);
f7cf25b2026dc8 Alexei Starovoitov      2019-06-15  7504  				for (j = 0; j < BPF_REG_SIZE; j++)
354e8f1970f821 Martin KaFai Lau        2021-09-21  7505  					scrub_spilled_slot(&state->stack[spi].slot_type[j]);
01f810ace9ed37 Andrei Matei            2021-02-06  7506  			}
f7cf25b2026dc8 Alexei Starovoitov      2019-06-15  7507  			goto mark;
f7cf25b2026dc8 Alexei Starovoitov      2019-06-15  7508  		}
f7cf25b2026dc8 Alexei Starovoitov      2019-06-15  7509  
2011fccfb61bbd Andrey Ignatov          2019-03-28  7510  		if (tnum_is_const(reg->var_off)) {
01f810ace9ed37 Andrei Matei            2021-02-06  7511  			verbose(env, "invalid%s read from stack R%d off %d+%d size %d\n",
01f810ace9ed37 Andrei Matei            2021-02-06  7512  				err_extra, regno, min_off, i - min_off, access_size);
2011fccfb61bbd Andrey Ignatov          2019-03-28  7513  		} else {
2011fccfb61bbd Andrey Ignatov          2019-03-28  7514  			char tn_buf[48];
2011fccfb61bbd Andrey Ignatov          2019-03-28  7515  
2011fccfb61bbd Andrey Ignatov          2019-03-28  7516  			tnum_strn(tn_buf, sizeof(tn_buf), reg->var_off);
01f810ace9ed37 Andrei Matei            2021-02-06  7517  			verbose(env, "invalid%s read from stack R%d var_off %s+%d size %d\n",
01f810ace9ed37 Andrei Matei            2021-02-06  7518  				err_extra, regno, tn_buf, i - min_off, access_size);
2011fccfb61bbd Andrey Ignatov          2019-03-28  7519  		}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7520  		return -EACCES;
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7521  mark:
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7522  		if (dynptr_read_allowed) {
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7523  			err = check_dynptr_key_access(env, &dynptr_key,
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7524  						      &state->stack[spi].spilled_ptr, *stype,
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7525  						      i - min_off);
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7526  			if (err)
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7527  				return err;
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7528  		}
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7529  
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7530  		/* reading any byte out of 8-byte 'spill_slot' will cause
cc2b14d51053eb Alexei Starovoitov      2017-12-14  7531  		 * the whole slot to be marked as 'read'
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7532  		 *
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7533  		 * We do not set REG_LIVE_WRITTEN for stack slot, as we can not
261f4664caffde Kumar Kartikeya Dwivedi 2022-11-04  7534  		 * be sure that whether stack slot is written to or not. Hence,
261f4664caffde Kumar Kartikeya Dwivedi 2022-11-04  7535  		 * we must still conservatively propagate reads upwards even if
261f4664caffde Kumar Kartikeya Dwivedi 2022-11-04  7536  		 * helper may write to the entire memory range.
261f4664caffde Kumar Kartikeya Dwivedi 2022-11-04  7537  		 */
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7538  		mark_reg_read(env, &state->stack[spi].spilled_ptr,
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7539  			      state->stack[spi].spilled_ptr.parent,
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7540  			      REG_LIVE_READ64);
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7541  
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7542  	}
cf5a0c90a8bc5f Hou Tao                 2024-10-08  7543  
6b4a64bafd107e Andrei Matei            2023-12-07  7544  	return 0;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7545  }
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
