Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548BC22331
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Sep 2024 02:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727662966; cv=none; b=c+F0r5nZAR4dHDgvAt6fphMLNjOMcm2rSjGpvVlNvcJY3OgwWkEaEuI32NjsH0swbvQetRNBSVvexbyAwEf0dZJ3DwojHcdLg2wvyZHKWQY7qmukXJuUDTXRaBrfB4ChrUagu3t4wIXFH2aqdjsmOssATlhro8tP4hkmn6Pc7k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727662966; c=relaxed/simple;
	bh=e8v35JOaA+4q9dQ5R2MZZRhedwUUaw9I2V1awuw+dDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aJQNjXKSJmE1JnaQ7qMEG5I17aGJOKjbYoaP5u2fdfQLmWDvqWDkg45nhuUr/11BXbD7KbEShdrpfoqjlUw+3XfOJwcWy1mEg12H/UwHzIV1IvrLQikyVDYirqrV3aXsnMsV5T0jfttXgKOon0+S98uJ3gqEXAIedw7K1xarYnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdafJj4j; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdafJj4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727662964; x=1759198964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8v35JOaA+4q9dQ5R2MZZRhedwUUaw9I2V1awuw+dDo=;
  b=gdafJj4jrnz2Mv0VjpJhQPQIQ1tZSwge3t6+HcAvpDSXd6a2nTmwt6B3
   Y78jhYxOIIGzWh2irSEy71PXFxnf+J8WrOcruuDuP291mTPChWBTcOMQd
   4VAFQLjGN9UtDIcLyYdyaOTH3TUb0T5uA54QpHFotbLeIubAGcpyi40NC
   HwNrtAPg9V7+PVFWCcPIKTTfRwSBqnUq8oeRJwk1DdiRfes1uAOzmt8ww
   UdHo56dceEMvrIETqC0249izoEDV5/lPPQluZdsyico6w6Ot4fFfZm/il
   yWj1oy1mkW93wIHAMmEm+/ZGvf/oibDm8z1jSU4H/MDe0L2zF45Tbj7kd
   Q==;
X-CSE-ConnectionGUID: hvA+WE6HRrufrXRTV6NlNQ==
X-CSE-MsgGUID: N+TiNuCJTB6KH0UXTzVvxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26909250"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26909250"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 19:22:43 -0700
X-CSE-ConnectionGUID: zJEyST8yQJGEr50Uucwaeg==
X-CSE-MsgGUID: Nu2mQlcgSIyqqPuPDY6BOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73419759"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Sep 2024 19:22:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv63b-000Ov9-2s;
	Mon, 30 Sep 2024 02:22:39 +0000
Date: Mon, 30 Sep 2024 10:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/bpf/verifier.c:19778 convert_ctx_accesses() error: __memcpy()
 'insn_buf' too small (128 vs u32max)
Message-ID: <202409301008.wCtChliC-lkp@intel.com>
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
TO: Martin KaFai Lau <martin.lau@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9852d85ec9d492ebef56dc5f229416c925758edc
commit: 169c31761c8d7f606f3ee628829c27998626c4f0 bpf: Add gen_epilogue to bpf_verifier_ops
date:   4 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
config: xtensa-randconfig-r071-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301008.wCtChliC-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409301008.wCtChliC-lkp@intel.com/

New smatch warnings:
kernel/bpf/verifier.c:19778 convert_ctx_accesses() error: __memcpy() 'insn_buf' too small (128 vs u32max)
kernel/bpf/verifier.c:19778 convert_ctx_accesses() error: __memcpy() 'epilogue_buf' too small (128 vs u32max)

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +/insn_buf +19778 kernel/bpf/verifier.c

a4b1d3c1ddf6cb Jiong Wang              2019-05-24  19672  
c64b7983288e63 Joe Stringer            2018-10-02  19673  /* convert load instructions that access fields of a context type into a
c64b7983288e63 Joe Stringer            2018-10-02  19674   * sequence of instructions that access fields of the underlying structure:
c64b7983288e63 Joe Stringer            2018-10-02  19675   *     struct __sk_buff    -> struct sk_buff
c64b7983288e63 Joe Stringer            2018-10-02  19676   *     struct bpf_sock_ops -> struct sock
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19677   */
58e2af8b3a6b58 Jakub Kicinski          2016-09-21  19678  static int convert_ctx_accesses(struct bpf_verifier_env *env)
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19679  {
169c31761c8d7f Martin KaFai Lau        2024-08-29  19680  	struct bpf_subprog_info *subprogs = env->subprog_info;
00176a34d9e27a Jakub Kicinski          2017-10-16  19681  	const struct bpf_verifier_ops *ops = env->ops;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19682  	int i, cnt, size, ctx_field_size, delta = 0, epilogue_cnt = 0;
3df126f35f88dc Jakub Kicinski          2016-09-21  19683  	const int insn_cnt = env->prog->len;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19684  	struct bpf_insn *epilogue_buf = env->epilogue_buf;
6f606ffd6dd758 Martin KaFai Lau        2024-08-29  19685  	struct bpf_insn *insn_buf = env->insn_buf;
6f606ffd6dd758 Martin KaFai Lau        2024-08-29  19686  	struct bpf_insn *insn;
46f53a65d2de3e Andrey Ignatov          2018-11-10  19687  	u32 target_size, size_default, off;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19688  	struct bpf_prog *new_prog;
d691f9e8d4405c Alexei Starovoitov      2015-06-04  19689  	enum bpf_access_type type;
f96da09473b52c Daniel Borkmann         2017-07-02  19690  	bool is_narrower_load;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19691  	int epilogue_idx = 0;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19692  
169c31761c8d7f Martin KaFai Lau        2024-08-29  19693  	if (ops->gen_epilogue) {
169c31761c8d7f Martin KaFai Lau        2024-08-29  19694  		epilogue_cnt = ops->gen_epilogue(epilogue_buf, env->prog,
169c31761c8d7f Martin KaFai Lau        2024-08-29  19695  						 -(subprogs[0].stack_depth + 8));
169c31761c8d7f Martin KaFai Lau        2024-08-29  19696  		if (epilogue_cnt >= INSN_BUF_SIZE) {
169c31761c8d7f Martin KaFai Lau        2024-08-29  19697  			verbose(env, "bpf verifier is misconfigured\n");
169c31761c8d7f Martin KaFai Lau        2024-08-29  19698  			return -EINVAL;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19699  		} else if (epilogue_cnt) {
169c31761c8d7f Martin KaFai Lau        2024-08-29  19700  			/* Save the ARG_PTR_TO_CTX for the epilogue to use */
169c31761c8d7f Martin KaFai Lau        2024-08-29  19701  			cnt = 0;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19702  			subprogs[0].stack_depth += 8;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19703  			insn_buf[cnt++] = BPF_STX_MEM(BPF_DW, BPF_REG_FP, BPF_REG_1,
169c31761c8d7f Martin KaFai Lau        2024-08-29  19704  						      -subprogs[0].stack_depth);
169c31761c8d7f Martin KaFai Lau        2024-08-29  19705  			insn_buf[cnt++] = env->prog->insnsi[0];
169c31761c8d7f Martin KaFai Lau        2024-08-29  19706  			new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
169c31761c8d7f Martin KaFai Lau        2024-08-29  19707  			if (!new_prog)
169c31761c8d7f Martin KaFai Lau        2024-08-29  19708  				return -ENOMEM;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19709  			env->prog = new_prog;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19710  			delta += cnt - 1;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19711  		}
169c31761c8d7f Martin KaFai Lau        2024-08-29  19712  	}
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19713  
b09928b976280d Daniel Borkmann         2018-10-24  19714  	if (ops->gen_prologue || env->seen_direct_write) {
b09928b976280d Daniel Borkmann         2018-10-24  19715  		if (!ops->gen_prologue) {
b09928b976280d Daniel Borkmann         2018-10-24  19716  			verbose(env, "bpf verifier is misconfigured\n");
b09928b976280d Daniel Borkmann         2018-10-24  19717  			return -EINVAL;
b09928b976280d Daniel Borkmann         2018-10-24  19718  		}
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19719  		cnt = ops->gen_prologue(insn_buf, env->seen_direct_write,
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19720  					env->prog);
6f606ffd6dd758 Martin KaFai Lau        2024-08-29  19721  		if (cnt >= INSN_BUF_SIZE) {
61bd5218eef349 Jakub Kicinski          2017-10-09  19722  			verbose(env, "bpf verifier is misconfigured\n");
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19723  			return -EINVAL;
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19724  		} else if (cnt) {
8041902dae5299 Alexei Starovoitov      2017-03-15  19725  			new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19726  			if (!new_prog)
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19727  				return -ENOMEM;
8041902dae5299 Alexei Starovoitov      2017-03-15  19728  
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19729  			env->prog = new_prog;
3df126f35f88dc Jakub Kicinski          2016-09-21  19730  			delta += cnt - 1;
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19731  		}
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19732  	}
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19733  
d5c47719f24438 Martin KaFai Lau        2024-08-29  19734  	if (delta)
d5c47719f24438 Martin KaFai Lau        2024-08-29  19735  		WARN_ON(adjust_jmp_off(env->prog, 0, delta));
d5c47719f24438 Martin KaFai Lau        2024-08-29  19736  
9d03ebc71a027c Stanislav Fomichev      2023-01-19  19737  	if (bpf_prog_is_offloaded(env->prog->aux))
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19738  		return 0;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19739  
3df126f35f88dc Jakub Kicinski          2016-09-21  19740  	insn = env->prog->insnsi + delta;
36bbef52c7eb64 Daniel Borkmann         2016-09-20  19741  
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19742  	for (i = 0; i < insn_cnt; i++, insn++) {
c64b7983288e63 Joe Stringer            2018-10-02  19743  		bpf_convert_ctx_access_t convert_ctx_access;
1f1e864b65554e Yonghong Song           2023-07-27  19744  		u8 mode;
c64b7983288e63 Joe Stringer            2018-10-02  19745  
62c7989b24dbd3 Daniel Borkmann         2017-01-12  19746  		if (insn->code == (BPF_LDX | BPF_MEM | BPF_B) ||
62c7989b24dbd3 Daniel Borkmann         2017-01-12  19747  		    insn->code == (BPF_LDX | BPF_MEM | BPF_H) ||
62c7989b24dbd3 Daniel Borkmann         2017-01-12  19748  		    insn->code == (BPF_LDX | BPF_MEM | BPF_W) ||
1f9a1ea821ff25 Yonghong Song           2023-07-27  19749  		    insn->code == (BPF_LDX | BPF_MEM | BPF_DW) ||
1f9a1ea821ff25 Yonghong Song           2023-07-27  19750  		    insn->code == (BPF_LDX | BPF_MEMSX | BPF_B) ||
1f9a1ea821ff25 Yonghong Song           2023-07-27  19751  		    insn->code == (BPF_LDX | BPF_MEMSX | BPF_H) ||
1f9a1ea821ff25 Yonghong Song           2023-07-27  19752  		    insn->code == (BPF_LDX | BPF_MEMSX | BPF_W)) {
d691f9e8d4405c Alexei Starovoitov      2015-06-04  19753  			type = BPF_READ;
2039f26f3aca5b Daniel Borkmann         2021-07-13  19754  		} else if (insn->code == (BPF_STX | BPF_MEM | BPF_B) ||
62c7989b24dbd3 Daniel Borkmann         2017-01-12  19755  			   insn->code == (BPF_STX | BPF_MEM | BPF_H) ||
62c7989b24dbd3 Daniel Borkmann         2017-01-12  19756  			   insn->code == (BPF_STX | BPF_MEM | BPF_W) ||
2039f26f3aca5b Daniel Borkmann         2021-07-13  19757  			   insn->code == (BPF_STX | BPF_MEM | BPF_DW) ||
2039f26f3aca5b Daniel Borkmann         2021-07-13  19758  			   insn->code == (BPF_ST | BPF_MEM | BPF_B) ||
2039f26f3aca5b Daniel Borkmann         2021-07-13  19759  			   insn->code == (BPF_ST | BPF_MEM | BPF_H) ||
2039f26f3aca5b Daniel Borkmann         2021-07-13  19760  			   insn->code == (BPF_ST | BPF_MEM | BPF_W) ||
2039f26f3aca5b Daniel Borkmann         2021-07-13  19761  			   insn->code == (BPF_ST | BPF_MEM | BPF_DW)) {
d691f9e8d4405c Alexei Starovoitov      2015-06-04  19762  			type = BPF_WRITE;
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  19763  		} else if ((insn->code == (BPF_STX | BPF_ATOMIC | BPF_W) ||
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  19764  			    insn->code == (BPF_STX | BPF_ATOMIC | BPF_DW)) &&
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  19765  			   env->insn_aux_data[i + delta].ptr_type == PTR_TO_ARENA) {
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  19766  			insn->code = BPF_STX | BPF_PROBE_ATOMIC | BPF_SIZE(insn->code);
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  19767  			env->prog->aux->num_exentries++;
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  19768  			continue;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19769  		} else if (insn->code == (BPF_JMP | BPF_EXIT) &&
169c31761c8d7f Martin KaFai Lau        2024-08-29  19770  			   epilogue_cnt &&
169c31761c8d7f Martin KaFai Lau        2024-08-29  19771  			   i + delta < subprogs[1].start) {
169c31761c8d7f Martin KaFai Lau        2024-08-29  19772  			/* Generate epilogue for the main prog */
169c31761c8d7f Martin KaFai Lau        2024-08-29  19773  			if (epilogue_idx) {
169c31761c8d7f Martin KaFai Lau        2024-08-29  19774  				/* jump back to the earlier generated epilogue */
169c31761c8d7f Martin KaFai Lau        2024-08-29  19775  				insn_buf[0] = BPF_JMP32_A(epilogue_idx - i - delta - 1);
169c31761c8d7f Martin KaFai Lau        2024-08-29  19776  				cnt = 1;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19777  			} else {
169c31761c8d7f Martin KaFai Lau        2024-08-29 @19778  				memcpy(insn_buf, epilogue_buf,
169c31761c8d7f Martin KaFai Lau        2024-08-29  19779  				       epilogue_cnt * sizeof(*epilogue_buf));
169c31761c8d7f Martin KaFai Lau        2024-08-29  19780  				cnt = epilogue_cnt;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19781  				/* epilogue_idx cannot be 0. It must have at
169c31761c8d7f Martin KaFai Lau        2024-08-29  19782  				 * least one ctx ptr saving insn before the
169c31761c8d7f Martin KaFai Lau        2024-08-29  19783  				 * epilogue.
169c31761c8d7f Martin KaFai Lau        2024-08-29  19784  				 */
169c31761c8d7f Martin KaFai Lau        2024-08-29  19785  				 epilogue_idx = i + delta;
169c31761c8d7f Martin KaFai Lau        2024-08-29  19786  			}
169c31761c8d7f Martin KaFai Lau        2024-08-29  19787  			goto patch_insn_buf;
2039f26f3aca5b Daniel Borkmann         2021-07-13  19788  		} else {
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19789  			continue;
2039f26f3aca5b Daniel Borkmann         2021-07-13  19790  		}
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19791  
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19792  		if (type == BPF_WRITE &&
2039f26f3aca5b Daniel Borkmann         2021-07-13  19793  		    env->insn_aux_data[i + delta].sanitize_stack_spill) {
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19794  			struct bpf_insn patch[] = {
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19795  				*insn,
2039f26f3aca5b Daniel Borkmann         2021-07-13  19796  				BPF_ST_NOSPEC(),
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19797  			};
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19798  
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19799  			cnt = ARRAY_SIZE(patch);
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19800  			new_prog = bpf_patch_insn_data(env, i + delta, patch, cnt);
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19801  			if (!new_prog)
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19802  				return -ENOMEM;
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19803  
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19804  			delta    += cnt - 1;
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19805  			env->prog = new_prog;
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19806  			insn      = new_prog->insnsi + i + delta;
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19807  			continue;
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19808  		}
af86ca4e3088fe Alexei Starovoitov      2018-05-15  19809  
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25  19810  		switch ((int)env->insn_aux_data[i + delta].ptr_type) {
c64b7983288e63 Joe Stringer            2018-10-02  19811  		case PTR_TO_CTX:
c64b7983288e63 Joe Stringer            2018-10-02  19812  			if (!ops->convert_ctx_access)
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19813  				continue;
c64b7983288e63 Joe Stringer            2018-10-02  19814  			convert_ctx_access = ops->convert_ctx_access;
c64b7983288e63 Joe Stringer            2018-10-02  19815  			break;
c64b7983288e63 Joe Stringer            2018-10-02  19816  		case PTR_TO_SOCKET:
46f8bc92758c62 Martin KaFai Lau        2019-02-09  19817  		case PTR_TO_SOCK_COMMON:
c64b7983288e63 Joe Stringer            2018-10-02  19818  			convert_ctx_access = bpf_sock_convert_ctx_access;
c64b7983288e63 Joe Stringer            2018-10-02  19819  			break;
655a51e536c09d Martin KaFai Lau        2019-02-09  19820  		case PTR_TO_TCP_SOCK:
655a51e536c09d Martin KaFai Lau        2019-02-09  19821  			convert_ctx_access = bpf_tcp_sock_convert_ctx_access;
655a51e536c09d Martin KaFai Lau        2019-02-09  19822  			break;
fada7fdc83c0bf Jonathan Lemon          2019-06-06  19823  		case PTR_TO_XDP_SOCK:
fada7fdc83c0bf Jonathan Lemon          2019-06-06  19824  			convert_ctx_access = bpf_xdp_sock_convert_ctx_access;
fada7fdc83c0bf Jonathan Lemon          2019-06-06  19825  			break;
2a02759ef5f8a3 Alexei Starovoitov      2019-10-15  19826  		case PTR_TO_BTF_ID:
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25  19827  		case PTR_TO_BTF_ID | PTR_UNTRUSTED:
282de143ead96a Kumar Kartikeya Dwivedi 2022-11-18  19828  		/* PTR_TO_BTF_ID | MEM_ALLOC always has a valid lifetime, unlike
282de143ead96a Kumar Kartikeya Dwivedi 2022-11-18  19829  		 * PTR_TO_BTF_ID, and an active ref_obj_id, but the same cannot
282de143ead96a Kumar Kartikeya Dwivedi 2022-11-18  19830  		 * be said once it is marked PTR_UNTRUSTED, hence we must handle
282de143ead96a Kumar Kartikeya Dwivedi 2022-11-18  19831  		 * any faults for loads into such types. BPF_WRITE is disallowed
282de143ead96a Kumar Kartikeya Dwivedi 2022-11-18  19832  		 * for this case.
282de143ead96a Kumar Kartikeya Dwivedi 2022-11-18  19833  		 */
282de143ead96a Kumar Kartikeya Dwivedi 2022-11-18  19834  		case PTR_TO_BTF_ID | MEM_ALLOC | PTR_UNTRUSTED:
27ae7997a66174 Martin KaFai Lau        2020-01-08  19835  			if (type == BPF_READ) {
1f9a1ea821ff25 Yonghong Song           2023-07-27  19836  				if (BPF_MODE(insn->code) == BPF_MEM)
27ae7997a66174 Martin KaFai Lau        2020-01-08  19837  					insn->code = BPF_LDX | BPF_PROBE_MEM |
27ae7997a66174 Martin KaFai Lau        2020-01-08  19838  						     BPF_SIZE((insn)->code);
1f9a1ea821ff25 Yonghong Song           2023-07-27  19839  				else
1f9a1ea821ff25 Yonghong Song           2023-07-27  19840  					insn->code = BPF_LDX | BPF_PROBE_MEMSX |
1f9a1ea821ff25 Yonghong Song           2023-07-27  19841  						     BPF_SIZE((insn)->code);
27ae7997a66174 Martin KaFai Lau        2020-01-08  19842  				env->prog->aux->num_exentries++;
2a02759ef5f8a3 Alexei Starovoitov      2019-10-15  19843  			}
2a02759ef5f8a3 Alexei Starovoitov      2019-10-15  19844  			continue;
6082b6c328b548 Alexei Starovoitov      2024-03-07  19845  		case PTR_TO_ARENA:
6082b6c328b548 Alexei Starovoitov      2024-03-07  19846  			if (BPF_MODE(insn->code) == BPF_MEMSX) {
6082b6c328b548 Alexei Starovoitov      2024-03-07  19847  				verbose(env, "sign extending loads from arena are not supported yet\n");
6082b6c328b548 Alexei Starovoitov      2024-03-07  19848  				return -EOPNOTSUPP;
6082b6c328b548 Alexei Starovoitov      2024-03-07  19849  			}
6082b6c328b548 Alexei Starovoitov      2024-03-07  19850  			insn->code = BPF_CLASS(insn->code) | BPF_PROBE_MEM32 | BPF_SIZE(insn->code);
6082b6c328b548 Alexei Starovoitov      2024-03-07  19851  			env->prog->aux->num_exentries++;
6082b6c328b548 Alexei Starovoitov      2024-03-07  19852  			continue;
c64b7983288e63 Joe Stringer            2018-10-02  19853  		default:
c64b7983288e63 Joe Stringer            2018-10-02  19854  			continue;
c64b7983288e63 Joe Stringer            2018-10-02  19855  		}
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19856  
31fd85816dbe3a Yonghong Song           2017-06-13  19857  		ctx_field_size = env->insn_aux_data[i + delta].ctx_field_size;
f96da09473b52c Daniel Borkmann         2017-07-02  19858  		size = BPF_LDST_BYTES(insn);
1f1e864b65554e Yonghong Song           2023-07-27  19859  		mode = BPF_MODE(insn->code);
31fd85816dbe3a Yonghong Song           2017-06-13  19860  
31fd85816dbe3a Yonghong Song           2017-06-13  19861  		/* If the read access is a narrower load of the field,
31fd85816dbe3a Yonghong Song           2017-06-13  19862  		 * convert to a 4/8-byte load, to minimum program type specific
31fd85816dbe3a Yonghong Song           2017-06-13  19863  		 * convert_ctx_access changes. If conversion is successful,
31fd85816dbe3a Yonghong Song           2017-06-13  19864  		 * we will apply proper mask to the result.
31fd85816dbe3a Yonghong Song           2017-06-13  19865  		 */
f96da09473b52c Daniel Borkmann         2017-07-02  19866  		is_narrower_load = size < ctx_field_size;
46f53a65d2de3e Andrey Ignatov          2018-11-10  19867  		size_default = bpf_ctx_off_adjust_machine(ctx_field_size);
46f53a65d2de3e Andrey Ignatov          2018-11-10  19868  		off = insn->off;
31fd85816dbe3a Yonghong Song           2017-06-13  19869  		if (is_narrower_load) {
f96da09473b52c Daniel Borkmann         2017-07-02  19870  			u8 size_code;
31fd85816dbe3a Yonghong Song           2017-06-13  19871  
f96da09473b52c Daniel Borkmann         2017-07-02  19872  			if (type == BPF_WRITE) {
61bd5218eef349 Jakub Kicinski          2017-10-09  19873  				verbose(env, "bpf verifier narrow ctx access misconfigured\n");
f96da09473b52c Daniel Borkmann         2017-07-02  19874  				return -EINVAL;
f96da09473b52c Daniel Borkmann         2017-07-02  19875  			}
f96da09473b52c Daniel Borkmann         2017-07-02  19876  
f96da09473b52c Daniel Borkmann         2017-07-02  19877  			size_code = BPF_H;
31fd85816dbe3a Yonghong Song           2017-06-13  19878  			if (ctx_field_size == 4)
31fd85816dbe3a Yonghong Song           2017-06-13  19879  				size_code = BPF_W;
31fd85816dbe3a Yonghong Song           2017-06-13  19880  			else if (ctx_field_size == 8)
31fd85816dbe3a Yonghong Song           2017-06-13  19881  				size_code = BPF_DW;
f96da09473b52c Daniel Borkmann         2017-07-02  19882  
bc23105ca0abde Daniel Borkmann         2018-06-02  19883  			insn->off = off & ~(size_default - 1);
31fd85816dbe3a Yonghong Song           2017-06-13  19884  			insn->code = BPF_LDX | BPF_MEM | size_code;
31fd85816dbe3a Yonghong Song           2017-06-13  19885  		}
f96da09473b52c Daniel Borkmann         2017-07-02  19886  
f96da09473b52c Daniel Borkmann         2017-07-02  19887  		target_size = 0;
c64b7983288e63 Joe Stringer            2018-10-02  19888  		cnt = convert_ctx_access(type, insn, insn_buf, env->prog,
f96da09473b52c Daniel Borkmann         2017-07-02  19889  					 &target_size);
6f606ffd6dd758 Martin KaFai Lau        2024-08-29  19890  		if (cnt == 0 || cnt >= INSN_BUF_SIZE ||
f96da09473b52c Daniel Borkmann         2017-07-02  19891  		    (ctx_field_size && !target_size)) {
61bd5218eef349 Jakub Kicinski          2017-10-09  19892  			verbose(env, "bpf verifier is misconfigured\n");
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19893  			return -EINVAL;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19894  		}
f96da09473b52c Daniel Borkmann         2017-07-02  19895  
f96da09473b52c Daniel Borkmann         2017-07-02  19896  		if (is_narrower_load && size < target_size) {
d895a0f16fadb2 Ilya Leoshkevich        2019-08-16  19897  			u8 shift = bpf_ctx_narrow_access_offset(
d895a0f16fadb2 Ilya Leoshkevich        2019-08-16  19898  				off, size, size_default) * 8;
6f606ffd6dd758 Martin KaFai Lau        2024-08-29  19899  			if (shift && cnt + 1 >= INSN_BUF_SIZE) {
d7af7e497f0308 Andrey Ignatov          2021-08-20  19900  				verbose(env, "bpf verifier narrow ctx load misconfigured\n");
d7af7e497f0308 Andrey Ignatov          2021-08-20  19901  				return -EINVAL;
d7af7e497f0308 Andrey Ignatov          2021-08-20  19902  			}
46f53a65d2de3e Andrey Ignatov          2018-11-10  19903  			if (ctx_field_size <= 4) {
46f53a65d2de3e Andrey Ignatov          2018-11-10  19904  				if (shift)
46f53a65d2de3e Andrey Ignatov          2018-11-10  19905  					insn_buf[cnt++] = BPF_ALU32_IMM(BPF_RSH,
46f53a65d2de3e Andrey Ignatov          2018-11-10  19906  									insn->dst_reg,
46f53a65d2de3e Andrey Ignatov          2018-11-10  19907  									shift);
31fd85816dbe3a Yonghong Song           2017-06-13  19908  				insn_buf[cnt++] = BPF_ALU32_IMM(BPF_AND, insn->dst_reg,
31fd85816dbe3a Yonghong Song           2017-06-13  19909  								(1 << size * 8) - 1);
46f53a65d2de3e Andrey Ignatov          2018-11-10  19910  			} else {
46f53a65d2de3e Andrey Ignatov          2018-11-10  19911  				if (shift)
46f53a65d2de3e Andrey Ignatov          2018-11-10  19912  					insn_buf[cnt++] = BPF_ALU64_IMM(BPF_RSH,
46f53a65d2de3e Andrey Ignatov          2018-11-10  19913  									insn->dst_reg,
46f53a65d2de3e Andrey Ignatov          2018-11-10  19914  									shift);
0613d8ca9ab382 Will Deacon             2023-05-18  19915  				insn_buf[cnt++] = BPF_ALU32_IMM(BPF_AND, insn->dst_reg,
e2f7fc0ac6957c Krzesimir Nowak         2019-05-08  19916  								(1ULL << size * 8) - 1);
31fd85816dbe3a Yonghong Song           2017-06-13  19917  			}
46f53a65d2de3e Andrey Ignatov          2018-11-10  19918  		}
1f1e864b65554e Yonghong Song           2023-07-27  19919  		if (mode == BPF_MEMSX)
1f1e864b65554e Yonghong Song           2023-07-27  19920  			insn_buf[cnt++] = BPF_RAW_INSN(BPF_ALU64 | BPF_MOV | BPF_X,
1f1e864b65554e Yonghong Song           2023-07-27  19921  						       insn->dst_reg, insn->dst_reg,
1f1e864b65554e Yonghong Song           2023-07-27  19922  						       size * 8, 0);
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19923  
169c31761c8d7f Martin KaFai Lau        2024-08-29  19924  patch_insn_buf:
8041902dae5299 Alexei Starovoitov      2017-03-15  19925  		new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19926  		if (!new_prog)
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19927  			return -ENOMEM;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19928  
3df126f35f88dc Jakub Kicinski          2016-09-21  19929  		delta += cnt - 1;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19930  
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19931  		/* keep walking new program and skip insns we just inserted */
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19932  		env->prog = new_prog;
3df126f35f88dc Jakub Kicinski          2016-09-21  19933  		insn      = new_prog->insnsi + i + delta;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19934  	}
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19935  
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19936  	return 0;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19937  }
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19938  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
