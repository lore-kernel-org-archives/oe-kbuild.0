Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5A18B14
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Apr 2024 22:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713132502; cv=none; b=cpnA+UckFcRwaiveL+PHMQcMBVI8QWfHCBrnmDb2vJaWwxTmJuzNACTkegH7o9eAAHxEPRl+o3wBen4zbpygWz7JclMtX9tXstU1CW0S+nIFV30WNd37eysVTR1JlB0rf2g0BWpDO+ddCQdYFPoD+ivZ7fHxLgTEd0/OG0hD/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713132502; c=relaxed/simple;
	bh=LNxlohIc0kiuEIy7CERHCxIi4QQXfUGyevvp6yDpBVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uVuYqxnlZgcVcht7RJBXKqatwqn3v0oitsQne0WQjwlOtbw7GO8JvQExxtH7d0YUsFMaBxki03pdNgPg9FmCMsghcmT0E/xYjzlbPAjagCCqO8wk7+iLSBFuQbContGOWCprUOYcO1XEk5fomjFiJQTTCveT4VkT7SAZ23kzbWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzVXdLBW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzVXdLBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713132499; x=1744668499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LNxlohIc0kiuEIy7CERHCxIi4QQXfUGyevvp6yDpBVA=;
  b=EzVXdLBWmv6IfJJo69tCDv0ogGAj5HevBtW0veXg3nbtmKp+Hr0mPsmt
   zolS1mmKSg0Hai9q3e/RuFrjfwSRUYWKY8jEd0xszJFXO1ZG2Ib3jyQzh
   74xdOGMthkg6nFayXxqOBQm524bUyFLPCcdS+AeRT1d8Jyzcv9Q7qNTUS
   0hFZTQut60AXxtmmo9llGrqTtjAvhKVFt0b7d8X6ZV/XJPJetOuojTEyA
   LevnOmVbqEiLGnF8XNLqDOSo/Kgjku7GTdBKWFVDDAQkktDe6lHLOn3kT
   uRGusRHXHvRVAWlq9GayAQdHsw8Z9nhSp6MDUOvFvUG9/k18sCOc6w1iH
   Q==;
X-CSE-ConnectionGUID: 5PNq/b4yQgSyJaQ4AZX0+w==
X-CSE-MsgGUID: xAEXUVOQR6e1Rhlj0Rl4Xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="19224510"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="19224510"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 15:08:18 -0700
X-CSE-ConnectionGUID: waI9JsPZQSOhqZvLczd9fg==
X-CSE-MsgGUID: Vutuo0WHSDK6VfYG1ucyUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21830187"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2024 15:08:17 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rw81G-0003po-1I;
	Sun, 14 Apr 2024 22:08:14 +0000
Date: Mon, 15 Apr 2024 06:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2992/6010] kernel/bpf/verifier.c:19161
 jit_subprogs() warn: mask and shift to zero: expr='addr >> 32'
Message-ID: <202404150633.xcX34CkS-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
commit: af682b767a41772499f8e54ca7d7e1deb3395f44 [2992/6010] bpf: Optimize emit_mov_imm64().
:::::: branch date: 3 days ago
:::::: commit date: 10 days ago
config: m68k-randconfig-r071-20240415 (https://download.01.org/0day-ci/archive/20240415/202404150633.xcX34CkS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404150633.xcX34CkS-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:19161 jit_subprogs() warn: mask and shift to zero: expr='addr >> 32'

vim +19161 kernel/bpf/verifier.c

9bac3d6d548e5c Alexei Starovoitov      2015-03-13  19113  
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19114  static int jit_subprogs(struct bpf_verifier_env *env)
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19115  {
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19116  	struct bpf_prog *prog = env->prog, **func, *tmp;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19117  	int i, j, subprog_start, subprog_end = 0, len, subprog;
a748c6975dea32 Maciej Fijalkowski      2020-09-16  19118  	struct bpf_map *map_ptr;
7105e828c087de Daniel Borkmann         2017-12-20  19119  	struct bpf_insn *insn;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19120  	void *old_bpf_func;
c4c0bdc0d2d084 Yonghong Song           2020-06-23  19121  	int err, num_exentries;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19122  
f910cefa32b6cd Jiong Wang              2018-05-02  19123  	if (env->subprog_cnt <= 1)
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19124  		return 0;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19125  
7105e828c087de Daniel Borkmann         2017-12-20  19126  	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
3990ed4c426652 Martin KaFai Lau        2021-11-05  19127  		if (!bpf_pseudo_func(insn) && !bpf_pseudo_call(insn))
69c087ba6225b5 Yonghong Song           2021-02-26  19128  			continue;
69c087ba6225b5 Yonghong Song           2021-02-26  19129  
c7a897843224a9 Daniel Borkmann         2018-07-12  19130  		/* Upon error here we cannot fall back to interpreter but
c7a897843224a9 Daniel Borkmann         2018-07-12  19131  		 * need a hard reject of the program. Thus -EFAULT is
c7a897843224a9 Daniel Borkmann         2018-07-12  19132  		 * propagated in any case.
c7a897843224a9 Daniel Borkmann         2018-07-12  19133  		 */
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19134  		subprog = find_subprog(env, i + insn->imm + 1);
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19135  		if (subprog < 0) {
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19136  			WARN_ONCE(1, "verifier bug. No program starts at insn %d\n",
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19137  				  i + insn->imm + 1);
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19138  			return -EFAULT;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19139  		}
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19140  		/* temporarily remember subprog id inside insn instead of
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19141  		 * aux_data, since next loop will split up all insns into funcs
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19142  		 */
f910cefa32b6cd Jiong Wang              2018-05-02  19143  		insn->off = subprog;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19144  		/* remember original imm in case JIT fails and fallback
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19145  		 * to interpreter will be needed
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19146  		 */
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19147  		env->insn_aux_data[i].call_imm = insn->imm;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19148  		/* point imm to __bpf_call_base+1 from JITs point of view */
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19149  		insn->imm = 1;
af682b767a4177 Alexei Starovoitov      2024-04-01  19150  		if (bpf_pseudo_func(insn)) {
af682b767a4177 Alexei Starovoitov      2024-04-01  19151  #if defined(MODULES_VADDR)
af682b767a4177 Alexei Starovoitov      2024-04-01  19152  			u64 addr = MODULES_VADDR;
af682b767a4177 Alexei Starovoitov      2024-04-01  19153  #else
af682b767a4177 Alexei Starovoitov      2024-04-01  19154  			u64 addr = VMALLOC_START;
af682b767a4177 Alexei Starovoitov      2024-04-01  19155  #endif
3990ed4c426652 Martin KaFai Lau        2021-11-05  19156  			/* jit (e.g. x86_64) may emit fewer instructions
3990ed4c426652 Martin KaFai Lau        2021-11-05  19157  			 * if it learns a u32 imm is the same as a u64 imm.
af682b767a4177 Alexei Starovoitov      2024-04-01  19158  			 * Set close enough to possible prog address.
3990ed4c426652 Martin KaFai Lau        2021-11-05  19159  			 */
af682b767a4177 Alexei Starovoitov      2024-04-01  19160  			insn[0].imm = (u32)addr;
af682b767a4177 Alexei Starovoitov      2024-04-01 @19161  			insn[1].imm = addr >> 32;
af682b767a4177 Alexei Starovoitov      2024-04-01  19162  		}
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19163  	}
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19164  
c454a46b5efd8e Martin KaFai Lau        2018-12-07  19165  	err = bpf_prog_alloc_jited_linfo(prog);
c454a46b5efd8e Martin KaFai Lau        2018-12-07  19166  	if (err)
c454a46b5efd8e Martin KaFai Lau        2018-12-07  19167  		goto out_undo_insn;
c454a46b5efd8e Martin KaFai Lau        2018-12-07  19168  
c454a46b5efd8e Martin KaFai Lau        2018-12-07  19169  	err = -ENOMEM;
6396bb221514d2 Kees Cook               2018-06-12  19170  	func = kcalloc(env->subprog_cnt, sizeof(prog), GFP_KERNEL);
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19171  	if (!func)
c7a897843224a9 Daniel Borkmann         2018-07-12  19172  		goto out_undo_insn;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19173  
f910cefa32b6cd Jiong Wang              2018-05-02  19174  	for (i = 0; i < env->subprog_cnt; i++) {
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19175  		subprog_start = subprog_end;
9c8105bd440223 Jiong Wang              2018-05-02  19176  		subprog_end = env->subprog_info[i + 1].start;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19177  
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19178  		len = subprog_end - subprog_start;
fb7dd8bca0139f Andrii Nakryiko         2021-08-15  19179  		/* bpf_prog_run() doesn't call subprogs directly,
492ecee892c2a4 Alexei Starovoitov      2019-02-25  19180  		 * hence main prog stats include the runtime of subprogs.
492ecee892c2a4 Alexei Starovoitov      2019-02-25  19181  		 * subprogs don't have IDs and not reachable via prog_get_next_id
700d4796ef59f5 Alexei Starovoitov      2021-02-09  19182  		 * func[i]->stats will never be accessed and stays NULL
492ecee892c2a4 Alexei Starovoitov      2019-02-25  19183  		 */
492ecee892c2a4 Alexei Starovoitov      2019-02-25  19184  		func[i] = bpf_prog_alloc_no_stats(bpf_prog_size(len), GFP_USER);
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19185  		if (!func[i])
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19186  			goto out_free;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19187  		memcpy(func[i]->insnsi, &prog->insnsi[subprog_start],
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19188  		       len * sizeof(struct bpf_insn));
4f74d80971bce9 Daniel Borkmann         2017-12-20  19189  		func[i]->type = prog->type;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19190  		func[i]->len = len;
4f74d80971bce9 Daniel Borkmann         2017-12-20  19191  		if (bpf_prog_calc_tag(func[i]))
4f74d80971bce9 Daniel Borkmann         2017-12-20  19192  			goto out_free;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19193  		func[i]->is_func = 1;
4d8926a0407cff Andrii Nakryiko         2024-03-13  19194  		func[i]->sleepable = prog->sleepable;
ba64e7d8525236 Yonghong Song           2018-11-24  19195  		func[i]->aux->func_idx = i;
f263a81451c12d John Fastabend          2021-07-07  19196  		/* Below members will be freed only at prog->aux */
ba64e7d8525236 Yonghong Song           2018-11-24  19197  		func[i]->aux->btf = prog->aux->btf;
ba64e7d8525236 Yonghong Song           2018-11-24  19198  		func[i]->aux->func_info = prog->aux->func_info;
9c7c48d6a1e2eb Alexei Starovoitov      2022-07-14  19199  		func[i]->aux->func_info_cnt = prog->aux->func_info_cnt;
f263a81451c12d John Fastabend          2021-07-07  19200  		func[i]->aux->poke_tab = prog->aux->poke_tab;
f263a81451c12d John Fastabend          2021-07-07  19201  		func[i]->aux->size_poke_tab = prog->aux->size_poke_tab;
ba64e7d8525236 Yonghong Song           2018-11-24  19202  
a748c6975dea32 Maciej Fijalkowski      2020-09-16  19203  		for (j = 0; j < prog->aux->size_poke_tab; j++) {
f263a81451c12d John Fastabend          2021-07-07  19204  			struct bpf_jit_poke_descriptor *poke;
a748c6975dea32 Maciej Fijalkowski      2020-09-16  19205  
f263a81451c12d John Fastabend          2021-07-07  19206  			poke = &prog->aux->poke_tab[j];
f263a81451c12d John Fastabend          2021-07-07  19207  			if (poke->insn_idx < subprog_end &&
f263a81451c12d John Fastabend          2021-07-07  19208  			    poke->insn_idx >= subprog_start)
f263a81451c12d John Fastabend          2021-07-07  19209  				poke->aux = func[i]->aux;
a748c6975dea32 Maciej Fijalkowski      2020-09-16  19210  		}
a748c6975dea32 Maciej Fijalkowski      2020-09-16  19211  
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19212  		func[i]->aux->name[0] = 'F';
9c8105bd440223 Jiong Wang              2018-05-02  19213  		func[i]->aux->stack_depth = env->subprog_info[i].stack_depth;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19214  		func[i]->jit_requested = 1;
d2a3b7c5becc39 Hou Tao                 2022-03-09  19215  		func[i]->blinding_requested = prog->blinding_requested;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  19216  		func[i]->aux->kfunc_tab = prog->aux->kfunc_tab;
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  19217  		func[i]->aux->kfunc_btf_tab = prog->aux->kfunc_btf_tab;
c454a46b5efd8e Martin KaFai Lau        2018-12-07  19218  		func[i]->aux->linfo = prog->aux->linfo;
c454a46b5efd8e Martin KaFai Lau        2018-12-07  19219  		func[i]->aux->nr_linfo = prog->aux->nr_linfo;
c454a46b5efd8e Martin KaFai Lau        2018-12-07  19220  		func[i]->aux->jited_linfo = prog->aux->jited_linfo;
c454a46b5efd8e Martin KaFai Lau        2018-12-07  19221  		func[i]->aux->linfo_idx = env->subprog_info[i].linfo_idx;
6082b6c328b548 Alexei Starovoitov      2024-03-07  19222  		func[i]->aux->arena = prog->aux->arena;
c4c0bdc0d2d084 Yonghong Song           2020-06-23  19223  		num_exentries = 0;
c4c0bdc0d2d084 Yonghong Song           2020-06-23  19224  		insn = func[i]->insnsi;
c4c0bdc0d2d084 Yonghong Song           2020-06-23  19225  		for (j = 0; j < func[i]->len; j++, insn++) {
c4c0bdc0d2d084 Yonghong Song           2020-06-23  19226  			if (BPF_CLASS(insn->code) == BPF_LDX &&
1f9a1ea821ff25 Yonghong Song           2023-07-27  19227  			    (BPF_MODE(insn->code) == BPF_PROBE_MEM ||
6082b6c328b548 Alexei Starovoitov      2024-03-07  19228  			     BPF_MODE(insn->code) == BPF_PROBE_MEM32 ||
1f9a1ea821ff25 Yonghong Song           2023-07-27  19229  			     BPF_MODE(insn->code) == BPF_PROBE_MEMSX))
c4c0bdc0d2d084 Yonghong Song           2020-06-23  19230  				num_exentries++;
6082b6c328b548 Alexei Starovoitov      2024-03-07  19231  			if ((BPF_CLASS(insn->code) == BPF_STX ||
6082b6c328b548 Alexei Starovoitov      2024-03-07  19232  			     BPF_CLASS(insn->code) == BPF_ST) &&
6082b6c328b548 Alexei Starovoitov      2024-03-07  19233  			     BPF_MODE(insn->code) == BPF_PROBE_MEM32)
6082b6c328b548 Alexei Starovoitov      2024-03-07  19234  				num_exentries++;
c4c0bdc0d2d084 Yonghong Song           2020-06-23  19235  		}
c4c0bdc0d2d084 Yonghong Song           2020-06-23  19236  		func[i]->aux->num_exentries = num_exentries;
ebf7d1f508a738 Maciej Fijalkowski      2020-09-16  19237  		func[i]->aux->tail_call_reachable = env->subprog_info[i].tail_call_reachable;
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  19238  		func[i]->aux->exception_cb = env->subprog_info[i].is_exception_cb;
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  19239  		if (!i)
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  19240  			func[i]->aux->exception_boundary = env->seen_exception;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19241  		func[i] = bpf_int_jit_compile(func[i]);
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19242  		if (!func[i]->jited) {
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19243  			err = -ENOTSUPP;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19244  			goto out_free;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19245  		}
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19246  		cond_resched();
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19247  	}
a748c6975dea32 Maciej Fijalkowski      2020-09-16  19248  
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19249  	/* at this point all bpf functions were successfully JITed
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19250  	 * now populate all bpf_calls with correct addresses and
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19251  	 * run last pass of JIT
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19252  	 */
f910cefa32b6cd Jiong Wang              2018-05-02  19253  	for (i = 0; i < env->subprog_cnt; i++) {
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19254  		insn = func[i]->insnsi;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19255  		for (j = 0; j < func[i]->len; j++, insn++) {
69c087ba6225b5 Yonghong Song           2021-02-26  19256  			if (bpf_pseudo_func(insn)) {
3990ed4c426652 Martin KaFai Lau        2021-11-05  19257  				subprog = insn->off;
69c087ba6225b5 Yonghong Song           2021-02-26  19258  				insn[0].imm = (u32)(long)func[subprog]->bpf_func;
69c087ba6225b5 Yonghong Song           2021-02-26  19259  				insn[1].imm = ((u64)(long)func[subprog]->bpf_func) >> 32;
69c087ba6225b5 Yonghong Song           2021-02-26  19260  				continue;
69c087ba6225b5 Yonghong Song           2021-02-26  19261  			}
23a2d70c7a2f28 Yonghong Song           2021-02-04  19262  			if (!bpf_pseudo_call(insn))
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19263  				continue;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19264  			subprog = insn->off;
3d717fad5081b8 Kees Cook               2021-09-28  19265  			insn->imm = BPF_CALL_IMM(func[subprog]->bpf_func);
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19266  		}
2162fed49fa86c Sandipan Das            2018-05-24  19267  
2162fed49fa86c Sandipan Das            2018-05-24  19268  		/* we use the aux data to keep a list of the start addresses
2162fed49fa86c Sandipan Das            2018-05-24  19269  		 * of the JITed images for each function in the program
2162fed49fa86c Sandipan Das            2018-05-24  19270  		 *
2162fed49fa86c Sandipan Das            2018-05-24  19271  		 * for some architectures, such as powerpc64, the imm field
2162fed49fa86c Sandipan Das            2018-05-24  19272  		 * might not be large enough to hold the offset of the start
2162fed49fa86c Sandipan Das            2018-05-24  19273  		 * address of the callee's JITed image from __bpf_call_base
2162fed49fa86c Sandipan Das            2018-05-24  19274  		 *
2162fed49fa86c Sandipan Das            2018-05-24  19275  		 * in such cases, we can lookup the start address of a callee
2162fed49fa86c Sandipan Das            2018-05-24  19276  		 * by using its subprog id, available from the off field of
2162fed49fa86c Sandipan Das            2018-05-24  19277  		 * the call instruction, as an index for this list
2162fed49fa86c Sandipan Das            2018-05-24  19278  		 */
2162fed49fa86c Sandipan Das            2018-05-24  19279  		func[i]->aux->func = func;
335d1c5b545284 Kumar Kartikeya Dwivedi 2023-09-13  19280  		func[i]->aux->func_cnt = env->subprog_cnt - env->hidden_subprog_cnt;
335d1c5b545284 Kumar Kartikeya Dwivedi 2023-09-13  19281  		func[i]->aux->real_func_cnt = env->subprog_cnt;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19282  	}
f910cefa32b6cd Jiong Wang              2018-05-02  19283  	for (i = 0; i < env->subprog_cnt; i++) {
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19284  		old_bpf_func = func[i]->bpf_func;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19285  		tmp = bpf_int_jit_compile(func[i]);
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19286  		if (tmp != func[i] || func[i]->bpf_func != old_bpf_func) {
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19287  			verbose(env, "JIT doesn't support bpf-to-bpf calls\n");
c7a897843224a9 Daniel Borkmann         2018-07-12  19288  			err = -ENOTSUPP;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19289  			goto out_free;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19290  		}
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19291  		cond_resched();
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19292  	}
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19293  
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19294  	/* finally lock prog and jit images for all functions and
0108a4e9f3584a Krister Johansen        2023-06-12  19295  	 * populate kallsysm. Begin at the first subprogram, since
0108a4e9f3584a Krister Johansen        2023-06-12  19296  	 * bpf_prog_load will add the kallsyms for the main program.
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19297  	 */
0108a4e9f3584a Krister Johansen        2023-06-12  19298  	for (i = 1; i < env->subprog_cnt; i++) {
7d2cc63eca0c99 Christophe Leroy        2024-03-08  19299  		err = bpf_prog_lock_ro(func[i]);
7d2cc63eca0c99 Christophe Leroy        2024-03-08  19300  		if (err)
7d2cc63eca0c99 Christophe Leroy        2024-03-08  19301  			goto out_free;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19302  	}
7105e828c087de Daniel Borkmann         2017-12-20  19303  
7d2cc63eca0c99 Christophe Leroy        2024-03-08  19304  	for (i = 1; i < env->subprog_cnt; i++)
7d2cc63eca0c99 Christophe Leroy        2024-03-08  19305  		bpf_prog_kallsyms_add(func[i]);
7d2cc63eca0c99 Christophe Leroy        2024-03-08  19306  
7105e828c087de Daniel Borkmann         2017-12-20  19307  	/* Last step: make now unused interpreter insns from main
7105e828c087de Daniel Borkmann         2017-12-20  19308  	 * prog consistent for later dump requests, so they can
7105e828c087de Daniel Borkmann         2017-12-20  19309  	 * later look the same as if they were interpreted only.
7105e828c087de Daniel Borkmann         2017-12-20  19310  	 */
7105e828c087de Daniel Borkmann         2017-12-20  19311  	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
69c087ba6225b5 Yonghong Song           2021-02-26  19312  		if (bpf_pseudo_func(insn)) {
69c087ba6225b5 Yonghong Song           2021-02-26  19313  			insn[0].imm = env->insn_aux_data[i].call_imm;
3990ed4c426652 Martin KaFai Lau        2021-11-05  19314  			insn[1].imm = insn->off;
3990ed4c426652 Martin KaFai Lau        2021-11-05  19315  			insn->off = 0;
69c087ba6225b5 Yonghong Song           2021-02-26  19316  			continue;
69c087ba6225b5 Yonghong Song           2021-02-26  19317  		}
23a2d70c7a2f28 Yonghong Song           2021-02-04  19318  		if (!bpf_pseudo_call(insn))
7105e828c087de Daniel Borkmann         2017-12-20  19319  			continue;
7105e828c087de Daniel Borkmann         2017-12-20  19320  		insn->off = env->insn_aux_data[i].call_imm;
7105e828c087de Daniel Borkmann         2017-12-20  19321  		subprog = find_subprog(env, i + insn->off + 1);
dbecd7388476ae Sandipan Das            2018-05-24  19322  		insn->imm = subprog;
7105e828c087de Daniel Borkmann         2017-12-20  19323  	}
7105e828c087de Daniel Borkmann         2017-12-20  19324  
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19325  	prog->jited = 1;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19326  	prog->bpf_func = func[0]->bpf_func;
d00c6473b1ee90 Song Liu                2022-02-04  19327  	prog->jited_len = func[0]->jited_len;
0108a4e9f3584a Krister Johansen        2023-06-12  19328  	prog->aux->extable = func[0]->aux->extable;
0108a4e9f3584a Krister Johansen        2023-06-12  19329  	prog->aux->num_exentries = func[0]->aux->num_exentries;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19330  	prog->aux->func = func;
335d1c5b545284 Kumar Kartikeya Dwivedi 2023-09-13  19331  	prog->aux->func_cnt = env->subprog_cnt - env->hidden_subprog_cnt;
335d1c5b545284 Kumar Kartikeya Dwivedi 2023-09-13  19332  	prog->aux->real_func_cnt = env->subprog_cnt;
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  19333  	prog->aux->bpf_exception_cb = (void *)func[env->exception_callback_subprog]->bpf_func;
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  19334  	prog->aux->exception_boundary = func[0]->aux->exception_boundary;
e16301fbe1837c Martin KaFai Lau        2021-03-24  19335  	bpf_prog_jit_attempt_done(prog);
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19336  	return 0;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19337  out_free:
f263a81451c12d John Fastabend          2021-07-07  19338  	/* We failed JIT'ing, so at this point we need to unregister poke
f263a81451c12d John Fastabend          2021-07-07  19339  	 * descriptors from subprogs, so that kernel is not attempting to
f263a81451c12d John Fastabend          2021-07-07  19340  	 * patch it anymore as we're freeing the subprog JIT memory.
f263a81451c12d John Fastabend          2021-07-07  19341  	 */
f263a81451c12d John Fastabend          2021-07-07  19342  	for (i = 0; i < prog->aux->size_poke_tab; i++) {
f263a81451c12d John Fastabend          2021-07-07  19343  		map_ptr = prog->aux->poke_tab[i].tail_call.map;
f263a81451c12d John Fastabend          2021-07-07  19344  		map_ptr->ops->map_poke_untrack(map_ptr, prog->aux);
f263a81451c12d John Fastabend          2021-07-07  19345  	}
f263a81451c12d John Fastabend          2021-07-07  19346  	/* At this point we're guaranteed that poke descriptors are not
f263a81451c12d John Fastabend          2021-07-07  19347  	 * live anymore. We can just unlink its descriptor table as it's
f263a81451c12d John Fastabend          2021-07-07  19348  	 * released with the main prog.
f263a81451c12d John Fastabend          2021-07-07  19349  	 */
a748c6975dea32 Maciej Fijalkowski      2020-09-16  19350  	for (i = 0; i < env->subprog_cnt; i++) {
a748c6975dea32 Maciej Fijalkowski      2020-09-16  19351  		if (!func[i])
a748c6975dea32 Maciej Fijalkowski      2020-09-16  19352  			continue;
f263a81451c12d John Fastabend          2021-07-07  19353  		func[i]->aux->poke_tab = NULL;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19354  		bpf_jit_free(func[i]);
a748c6975dea32 Maciej Fijalkowski      2020-09-16  19355  	}
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19356  	kfree(func);
c7a897843224a9 Daniel Borkmann         2018-07-12  19357  out_undo_insn:
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19358  	/* cleanup main prog to be interpreted */
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19359  	prog->jit_requested = 0;
d2a3b7c5becc39 Hou Tao                 2022-03-09  19360  	prog->blinding_requested = 0;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19361  	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
23a2d70c7a2f28 Yonghong Song           2021-02-04  19362  		if (!bpf_pseudo_call(insn))
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19363  			continue;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19364  		insn->off = 0;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19365  		insn->imm = env->insn_aux_data[i].call_imm;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19366  	}
e16301fbe1837c Martin KaFai Lau        2021-03-24  19367  	bpf_prog_jit_attempt_done(prog);
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19368  	return err;
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19369  }
1c2a088a6626d4 Alexei Starovoitov      2017-12-14  19370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
