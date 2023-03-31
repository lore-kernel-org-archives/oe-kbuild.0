Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5853C0C
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 15:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680276593; x=1711812593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u4iH8bdcraQ2Etnq/SxIpgoNVcFrLZW7KzI4xAO2+dg=;
  b=LAHxx2IxfjfbRrBY59kTw8MWbkRSXgNtvU6/3UuL2UJuewmaJ1OT9hV/
   ZyiKJ2F94+KbJ+tIaGRvnIK2nRC3GjF/rizoQ/FPFSrZzqpppJrfwXclO
   FM5cs97Qo/Gl6BWJTwNzuf2uXfCz41H6AqAyiXr5K9+0KfQXtMxG6nUv0
   1vVX2mGE+lethziWNRQHs+9XzDnOMWXKgVwIKKqg18oJaLDEQqbQrPoEO
   gfhF6AEwE99UaBbCY6orpEGrMS+8FMJ0RWKgMX2Tz3e9Y712mSq93Lbv+
   P75953iVtl7JKIxOIWVyPGITArverJZEETSWYzywM7DZwh+LVz/S79aMh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321133291"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="321133291"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 08:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="828750381"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="828750381"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2023 08:29:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piGhD-000LuV-1X;
	Fri, 31 Mar 2023 15:29:43 +0000
Date: Fri, 31 Mar 2023 23:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1648/8375] kernel/bpf/verifier.c:10148:11:
 warning: Assigned value is garbage or undefined
 [clang-analyzer-core.uninitialized.Assign]
Message-ID: <202303312345.Si1OyCDq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/bpf/verifier.c:10148:11: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andrii Nakryiko <andrii@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Andrii,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5
commit: 07236eab7a3139da97aef9f5f21f403be82a82ea [1648/8375] bpf: factor out fetching basic kfunc metadata
:::::: branch date: 11 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230329 (https://download.01.org/0day-ci/archive/20230331/202303312345.Si1OyCDq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=07236eab7a3139da97aef9f5f21f403be82a82ea
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 07236eab7a3139da97aef9f5f21f403be82a82ea
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303312345.Si1OyCDq-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                        ^
   include/linux/rcupdate.h:673:31: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:471:35: note: expanded from macro '__rcu_dereference_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   net/9p/client.c:974:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:974:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:1146:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:1146:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:1223:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:1223:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:1313:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:1313:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:1679:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:1679:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:1732:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:1732:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:1886:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:1886:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:1985:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:1985:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:2062:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:2062:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:2121:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:2121:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:2152:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:2152:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:2181:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:2181:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:2213:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:2213:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   net/9p/client.c:2250:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = 0;
           ^     ~
   net/9p/client.c:2250:2: note: Value stored to 'err' is never read
           err = 0;
           ^     ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (17 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (17 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   34 warnings generated.
>> kernel/bpf/verifier.c:10148:11: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           desc_btf = meta.btf;
                    ^ ~~~~~~~~
   kernel/bpf/verifier.c:10140:6: note: Assuming field 'imm' is not equal to 0
           if (!insn->imm)
               ^~~~~~~~~~
   kernel/bpf/verifier.c:10140:2: note: Taking false branch
           if (!insn->imm)
           ^
   kernel/bpf/verifier.c:10143:8: note: Calling 'fetch_kfunc_meta'
           err = fetch_kfunc_meta(env, insn, &meta, &func_name);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:10092:6: note: 'kfunc_name' is non-null
           if (kfunc_name)
               ^~~~~~~~~~
   kernel/bpf/verifier.c:10092:2: note: Taking true branch
           if (kfunc_name)
           ^
   kernel/bpf/verifier.c:10095:13: note: Field 'imm' is not equal to 0, which participates in a condition later
           if (!insn->imm)
                      ^
   kernel/bpf/verifier.c:10095:2: note: Taking false branch
           if (!insn->imm)
           ^
   kernel/bpf/verifier.c:10098:13: note: Calling 'find_kfunc_desc_btf'
           desc_btf = find_kfunc_desc_btf(env, insn->off);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:2364:6: note: Assuming 'offset' is 0
           if (offset) {
               ^~~~~~
   kernel/bpf/verifier.c:2364:2: note: Taking false branch
           if (offset) {
           ^
   kernel/bpf/verifier.c:2375:9: note: '?' condition is true
           return btf_vmlinux ?: ERR_PTR(-ENOENT);
                  ^
   kernel/bpf/verifier.c:2375:2: note: Returning pointer, which participates in a condition later
           return btf_vmlinux ?: ERR_PTR(-ENOENT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:10098:13: note: Returning from 'find_kfunc_desc_btf'
           desc_btf = find_kfunc_desc_btf(env, insn->off);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:10099:2: note: Taking true branch
           if (IS_ERR(desc_btf))
           ^
   kernel/bpf/verifier.c:10100:3: note: Returning without writing to 'meta->btf'
                   return PTR_ERR(desc_btf);
                   ^
   kernel/bpf/verifier.c:10100:3: note: Returning value, which participates in a condition later
                   return PTR_ERR(desc_btf);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:10143:8: note: Returning from 'fetch_kfunc_meta'
           err = fetch_kfunc_meta(env, insn, &meta, &func_name);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:10144:6: note: Assuming the condition is false
           if (err == -EACCES && func_name)
               ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c:10144:21: note: Left side of '&&' is false
           if (err == -EACCES && func_name)
                              ^
   kernel/bpf/verifier.c:10146:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   kernel/bpf/verifier.c:10146:2: note: Taking false branch
           if (err)
           ^
   kernel/bpf/verifier.c:10148:11: note: Assigned value is garbage or undefined
           desc_btf = meta.btf;
                    ^ ~~~~~~~~
   kernel/bpf/verifier.c:12830:13: warning: Access to field 'type' results in a dereference of a null pointer (loaded from variable 'src_reg') [clang-analyzer-core.NullDereference]
           } else if (src_reg->type == SCALAR_VALUE &&
                      ^~~~~~~
   kernel/bpf/verifier.c:12783:54: note: 'src_reg' initialized to a null pointer value
           struct bpf_reg_state *dst_reg, *other_branch_regs, *src_reg = NULL;
                                                               ^~~~~~~
   kernel/bpf/verifier.c:12791:6: note: Assuming 'opcode' is not equal to BPF_JA
           if (opcode == BPF_JA || opcode > BPF_JSLE) {
               ^~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12791:6: note: Left side of '||' is false
   kernel/bpf/verifier.c:12791:26: note: Assuming 'opcode' is <= BPF_JSLE
           if (opcode == BPF_JA || opcode > BPF_JSLE) {
                                   ^~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12791:2: note: Taking false branch
           if (opcode == BPF_JA || opcode > BPF_JSLE) {
           ^
   kernel/bpf/verifier.c:12796:6: note: Assuming the condition is false
           if (BPF_SRC(insn->code) == BPF_X) {
               ^
   include/uapi/linux/bpf_common.h:49:25: note: expanded from macro 'BPF_SRC'
   #define BPF_SRC(code)   ((code) & 0x08)
                           ^
   kernel/bpf/verifier.c:12796:2: note: Taking false branch
           if (BPF_SRC(insn->code) == BPF_X) {
           ^
   kernel/bpf/verifier.c:12814:7: note: Assuming field 'src_reg' is equal to BPF_REG_0
                   if (insn->src_reg != BPF_REG_0) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12814:3: note: Taking false branch
                   if (insn->src_reg != BPF_REG_0) {
                   ^
   kernel/bpf/verifier.c:12822:6: note: Assuming 'err' is 0

vim +10148 kernel/bpf/verifier.c

07236eab7a3139 Andrii Nakryiko         2023-03-08  10123  
07236eab7a3139 Andrii Nakryiko         2023-03-08  10124  static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
07236eab7a3139 Andrii Nakryiko         2023-03-08  10125  			    int *insn_idx_p)
07236eab7a3139 Andrii Nakryiko         2023-03-08  10126  {
07236eab7a3139 Andrii Nakryiko         2023-03-08  10127  	const struct btf_type *t, *ptr_type;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10128  	u32 i, nargs, ptr_type_id, release_ref_obj_id;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10129  	struct bpf_reg_state *regs = cur_regs(env);
07236eab7a3139 Andrii Nakryiko         2023-03-08  10130  	const char *func_name, *ptr_type_name;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10131  	bool sleepable, rcu_lock, rcu_unlock;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10132  	struct bpf_kfunc_call_arg_meta meta;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10133  	struct bpf_insn_aux_data *insn_aux;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10134  	int err, insn_idx = *insn_idx_p;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10135  	const struct btf_param *args;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10136  	const struct btf_type *ret_t;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10137  	struct btf *desc_btf;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10138  
07236eab7a3139 Andrii Nakryiko         2023-03-08  10139  	/* skip for now, but return error when we find this in fixup_kfunc_call */
07236eab7a3139 Andrii Nakryiko         2023-03-08  10140  	if (!insn->imm)
07236eab7a3139 Andrii Nakryiko         2023-03-08  10141  		return 0;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10142  
07236eab7a3139 Andrii Nakryiko         2023-03-08  10143  	err = fetch_kfunc_meta(env, insn, &meta, &func_name);
07236eab7a3139 Andrii Nakryiko         2023-03-08  10144  	if (err == -EACCES && func_name)
07236eab7a3139 Andrii Nakryiko         2023-03-08  10145  		verbose(env, "calling kernel function %s is not allowed\n", func_name);
07236eab7a3139 Andrii Nakryiko         2023-03-08  10146  	if (err)
07236eab7a3139 Andrii Nakryiko         2023-03-08  10147  		return err;
07236eab7a3139 Andrii Nakryiko         2023-03-08 @10148  	desc_btf = meta.btf;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10149  	insn_aux = &env->insn_aux_data[insn_idx];
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10150  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10151  	if (is_kfunc_destructive(&meta) && !capable(CAP_SYS_BOOT)) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10152  		verbose(env, "destructive kfunc calls require CAP_SYS_BOOT capability\n");
4dd48c6f1f8329 Artem Savkov            2022-08-10  10153  		return -EACCES;
4dd48c6f1f8329 Artem Savkov            2022-08-10  10154  	}
4dd48c6f1f8329 Artem Savkov            2022-08-10  10155  
9bb00b2895cbfe Yonghong Song           2022-11-23  10156  	sleepable = is_kfunc_sleepable(&meta);
9bb00b2895cbfe Yonghong Song           2022-11-23  10157  	if (sleepable && !env->prog->aux->sleepable) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10158  		verbose(env, "program must be sleepable to call sleepable kfunc %s\n", func_name);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10159  		return -EACCES;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10160  	}
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10161  
9bb00b2895cbfe Yonghong Song           2022-11-23  10162  	rcu_lock = is_kfunc_bpf_rcu_read_lock(&meta);
9bb00b2895cbfe Yonghong Song           2022-11-23  10163  	rcu_unlock = is_kfunc_bpf_rcu_read_unlock(&meta);
9bb00b2895cbfe Yonghong Song           2022-11-23  10164  
9bb00b2895cbfe Yonghong Song           2022-11-23  10165  	if (env->cur_state->active_rcu_lock) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10166  		struct bpf_func_state *state;
9bb00b2895cbfe Yonghong Song           2022-11-23  10167  		struct bpf_reg_state *reg;
9bb00b2895cbfe Yonghong Song           2022-11-23  10168  
9bb00b2895cbfe Yonghong Song           2022-11-23  10169  		if (rcu_lock) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10170  			verbose(env, "nested rcu read lock (kernel function %s)\n", func_name);
9bb00b2895cbfe Yonghong Song           2022-11-23  10171  			return -EINVAL;
9bb00b2895cbfe Yonghong Song           2022-11-23  10172  		} else if (rcu_unlock) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10173  			bpf_for_each_reg_in_vstate(env->cur_state, state, reg, ({
9bb00b2895cbfe Yonghong Song           2022-11-23  10174  				if (reg->type & MEM_RCU) {
fca1aa75518c03 Yonghong Song           2022-12-03  10175  					reg->type &= ~(MEM_RCU | PTR_MAYBE_NULL);
9bb00b2895cbfe Yonghong Song           2022-11-23  10176  					reg->type |= PTR_UNTRUSTED;
9bb00b2895cbfe Yonghong Song           2022-11-23  10177  				}
9bb00b2895cbfe Yonghong Song           2022-11-23  10178  			}));
9bb00b2895cbfe Yonghong Song           2022-11-23  10179  			env->cur_state->active_rcu_lock = false;
9bb00b2895cbfe Yonghong Song           2022-11-23  10180  		} else if (sleepable) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10181  			verbose(env, "kernel func %s is sleepable within rcu_read_lock region\n", func_name);
9bb00b2895cbfe Yonghong Song           2022-11-23  10182  			return -EACCES;
9bb00b2895cbfe Yonghong Song           2022-11-23  10183  		}
9bb00b2895cbfe Yonghong Song           2022-11-23  10184  	} else if (rcu_lock) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10185  		env->cur_state->active_rcu_lock = true;
9bb00b2895cbfe Yonghong Song           2022-11-23  10186  	} else if (rcu_unlock) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10187  		verbose(env, "unmatched rcu read unlock (kernel function %s)\n", func_name);
9bb00b2895cbfe Yonghong Song           2022-11-23  10188  		return -EINVAL;
9bb00b2895cbfe Yonghong Song           2022-11-23  10189  	}
9bb00b2895cbfe Yonghong Song           2022-11-23  10190  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10191  	/* Check the arguments */
1d18feb2c915c5 Joanne Koong            2023-03-01  10192  	err = check_kfunc_args(env, &meta, insn_idx);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10193  	if (err < 0)
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10194  		return err;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10195  	/* In case of release function, we get register number of refcounted
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10196  	 * PTR_TO_BTF_ID in bpf_kfunc_arg_meta, do the release now.
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10197  	 */
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10198  	if (meta.release_regno) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10199  		err = release_reference(env, regs[meta.release_regno].ref_obj_id);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10200  		if (err) {
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10201  			verbose(env, "kfunc %s#%d reference has not been acquired before\n",
07236eab7a3139 Andrii Nakryiko         2023-03-08  10202  				func_name, meta.func_id);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10203  			return err;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10204  		}
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10205  	}
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10206  
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10207  	if (meta.func_id == special_kfunc_list[KF_bpf_list_push_front] ||
bd1279ae8a691d Dave Marchevsky         2023-02-13  10208  	    meta.func_id == special_kfunc_list[KF_bpf_list_push_back] ||
bd1279ae8a691d Dave Marchevsky         2023-02-13  10209  	    meta.func_id == special_kfunc_list[KF_bpf_rbtree_add]) {
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10210  		release_ref_obj_id = regs[BPF_REG_2].ref_obj_id;
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10211  		err = ref_convert_owning_non_owning(env, release_ref_obj_id);
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10212  		if (err) {
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10213  			verbose(env, "kfunc %s#%d conversion of owning ref to non-owning failed\n",
07236eab7a3139 Andrii Nakryiko         2023-03-08  10214  				func_name, meta.func_id);
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10215  			return err;
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10216  		}
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10217  
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10218  		err = release_reference(env, release_ref_obj_id);
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10219  		if (err) {
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10220  			verbose(env, "kfunc %s#%d reference has not been acquired before\n",
07236eab7a3139 Andrii Nakryiko         2023-03-08  10221  				func_name, meta.func_id);
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10222  			return err;
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10223  		}
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10224  	}
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10225  
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10226  	if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_add]) {
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10227  		err = __check_func_call(env, insn, insn_idx_p, meta.subprogno,
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10228  					set_rbtree_add_callback_state);
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10229  		if (err) {
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10230  			verbose(env, "kfunc %s#%d failed callback verification\n",
07236eab7a3139 Andrii Nakryiko         2023-03-08  10231  				func_name, meta.func_id);
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10232  			return err;
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10233  		}
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10234  	}
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10235  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10236  	for (i = 0; i < CALLER_SAVED_REGS; i++)
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10237  		mark_reg_not_init(env, regs, caller_saved[i]);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10238  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10239  	/* Check return type */
07236eab7a3139 Andrii Nakryiko         2023-03-08  10240  	t = btf_type_skip_modifiers(desc_btf, meta.func_proto->type, NULL);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10241  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10242  	if (is_kfunc_acquire(&meta) && !btf_type_is_struct_ptr(meta.btf, t)) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10243  		/* Only exception is bpf_obj_new_impl */
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10244  		if (meta.btf != btf_vmlinux || meta.func_id != special_kfunc_list[KF_bpf_obj_new_impl]) {
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10245  			verbose(env, "acquire kernel function does not return PTR_TO_BTF_ID\n");
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10246  			return -EINVAL;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10247  		}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10248  	}
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10249  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10250  	if (btf_type_is_scalar(t)) {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10251  		mark_reg_unknown(env, regs, BPF_REG_0);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10252  		mark_btf_func_reg_size(env, BPF_REG_0, t->size);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10253  	} else if (btf_type_is_ptr(t)) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10254  		ptr_type = btf_type_skip_modifiers(desc_btf, t->type, &ptr_type_id);
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10255  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10256  		if (meta.btf == btf_vmlinux && btf_id_set_contains(&special_kfunc_set, meta.func_id)) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10257  			if (meta.func_id == special_kfunc_list[KF_bpf_obj_new_impl]) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10258  				struct btf *ret_btf;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10259  				u32 ret_btf_id;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10260  
e181d3f143f795 Kumar Kartikeya Dwivedi 2022-11-21  10261  				if (unlikely(!bpf_global_ma_set))
e181d3f143f795 Kumar Kartikeya Dwivedi 2022-11-21  10262  					return -ENOMEM;
e181d3f143f795 Kumar Kartikeya Dwivedi 2022-11-21  10263  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10264  				if (((u64)(u32)meta.arg_constant.value) != meta.arg_constant.value) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10265  					verbose(env, "local type ID argument must be in range [0, U32_MAX]\n");
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10266  					return -EINVAL;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10267  				}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10268  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10269  				ret_btf = env->prog->aux->btf;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10270  				ret_btf_id = meta.arg_constant.value;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10271  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10272  				/* This may be NULL due to user not supplying a BTF */
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10273  				if (!ret_btf) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10274  					verbose(env, "bpf_obj_new requires prog BTF\n");
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10275  					return -EINVAL;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10276  				}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10277  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10278  				ret_t = btf_type_by_id(ret_btf, ret_btf_id);
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10279  				if (!ret_t || !__btf_type_is_struct(ret_t)) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10280  					verbose(env, "bpf_obj_new type ID argument must be of a struct\n");
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10281  					return -EINVAL;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10282  				}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10283  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10284  				mark_reg_known_zero(env, regs, BPF_REG_0);
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10285  				regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10286  				regs[BPF_REG_0].btf = ret_btf;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10287  				regs[BPF_REG_0].btf_id = ret_btf_id;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10288  
07236eab7a3139 Andrii Nakryiko         2023-03-08  10289  				insn_aux->obj_new_size = ret_t->size;
07236eab7a3139 Andrii Nakryiko         2023-03-08  10290  				insn_aux->kptr_struct_meta =
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10291  					btf_find_struct_meta(ret_btf, ret_btf_id);
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  10292  			} else if (meta.func_id == special_kfunc_list[KF_bpf_obj_drop_impl]) {
07236eab7a3139 Andrii Nakryiko         2023-03-08  10293  				insn_aux->kptr_struct_meta =
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  10294  					btf_find_struct_meta(meta.arg_obj_drop.btf,
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  10295  							     meta.arg_obj_drop.btf_id);
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  10296  			} else if (meta.func_id == special_kfunc_list[KF_bpf_list_pop_front] ||
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  10297  				   meta.func_id == special_kfunc_list[KF_bpf_list_pop_back]) {
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  10298  				struct btf_field *field = meta.arg_list_head.field;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  10299  
a40d3632436b16 Dave Marchevsky         2023-02-13  10300  				mark_reg_graph_node(regs, BPF_REG_0, &field->graph_root);
a40d3632436b16 Dave Marchevsky         2023-02-13  10301  			} else if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
a40d3632436b16 Dave Marchevsky         2023-02-13  10302  				   meta.func_id == special_kfunc_list[KF_bpf_rbtree_first]) {
a40d3632436b16 Dave Marchevsky         2023-02-13  10303  				struct btf_field *field = meta.arg_rbtree_root.field;
a40d3632436b16 Dave Marchevsky         2023-02-13  10304  
a40d3632436b16 Dave Marchevsky         2023-02-13  10305  				mark_reg_graph_node(regs, BPF_REG_0, &field->graph_root);
fd264ca020948a Yonghong Song           2022-11-20  10306  			} else if (meta.func_id == special_kfunc_list[KF_bpf_cast_to_kern_ctx]) {
fd264ca020948a Yonghong Song           2022-11-20  10307  				mark_reg_known_zero(env, regs, BPF_REG_0);
fd264ca020948a Yonghong Song           2022-11-20  10308  				regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_TRUSTED;
fd264ca020948a Yonghong Song           2022-11-20  10309  				regs[BPF_REG_0].btf = desc_btf;
fd264ca020948a Yonghong Song           2022-11-20  10310  				regs[BPF_REG_0].btf_id = meta.ret_btf_id;
a35b9af4ec2c7f Yonghong Song           2022-11-20  10311  			} else if (meta.func_id == special_kfunc_list[KF_bpf_rdonly_cast]) {
a35b9af4ec2c7f Yonghong Song           2022-11-20  10312  				ret_t = btf_type_by_id(desc_btf, meta.arg_constant.value);
a35b9af4ec2c7f Yonghong Song           2022-11-20  10313  				if (!ret_t || !btf_type_is_struct(ret_t)) {
a35b9af4ec2c7f Yonghong Song           2022-11-20  10314  					verbose(env,
a35b9af4ec2c7f Yonghong Song           2022-11-20  10315  						"kfunc bpf_rdonly_cast type ID argument must be of a struct\n");
a35b9af4ec2c7f Yonghong Song           2022-11-20  10316  					return -EINVAL;
a35b9af4ec2c7f Yonghong Song           2022-11-20  10317  				}
a35b9af4ec2c7f Yonghong Song           2022-11-20  10318  
a35b9af4ec2c7f Yonghong Song           2022-11-20  10319  				mark_reg_known_zero(env, regs, BPF_REG_0);
a35b9af4ec2c7f Yonghong Song           2022-11-20  10320  				regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_UNTRUSTED;
a35b9af4ec2c7f Yonghong Song           2022-11-20  10321  				regs[BPF_REG_0].btf = desc_btf;
a35b9af4ec2c7f Yonghong Song           2022-11-20  10322  				regs[BPF_REG_0].btf_id = meta.arg_constant.value;
66e3a13e7c2c44 Joanne Koong            2023-03-01  10323  			} else if (meta.func_id == special_kfunc_list[KF_bpf_dynptr_slice] ||
66e3a13e7c2c44 Joanne Koong            2023-03-01  10324  				   meta.func_id == special_kfunc_list[KF_bpf_dynptr_slice_rdwr]) {
66e3a13e7c2c44 Joanne Koong            2023-03-01  10325  				enum bpf_type_flag type_flag = get_dynptr_type_flag(meta.initialized_dynptr.type);
66e3a13e7c2c44 Joanne Koong            2023-03-01  10326  
66e3a13e7c2c44 Joanne Koong            2023-03-01  10327  				mark_reg_known_zero(env, regs, BPF_REG_0);
66e3a13e7c2c44 Joanne Koong            2023-03-01  10328  
66e3a13e7c2c44 Joanne Koong            2023-03-01  10329  				if (!meta.arg_constant.found) {
66e3a13e7c2c44 Joanne Koong            2023-03-01  10330  					verbose(env, "verifier internal error: bpf_dynptr_slice(_rdwr) no constant size\n");
66e3a13e7c2c44 Joanne Koong            2023-03-01  10331  					return -EFAULT;
66e3a13e7c2c44 Joanne Koong            2023-03-01  10332  				}
66e3a13e7c2c44 Joanne Koong            2023-03-01  10333  
66e3a13e7c2c44 Joanne Koong            2023-03-01  10334  				regs[BPF_REG_0].mem_size = meta.arg_constant.value;
66e3a13e7c2c44 Joanne Koong            2023-03-01  10335  
66e3a13e7c2c44 Joanne Koong            2023-03-01  10336  				/* PTR_MAYBE_NULL will be added when is_kfunc_ret_null is checked */
66e3a13e7c2c44 Joanne Koong            2023-03-01  10337  				regs[BPF_REG_0].type = PTR_TO_MEM | type_flag;
66e3a13e7c2c44 Joanne Koong            2023-03-01  10338  
66e3a13e7c2c44 Joanne Koong            2023-03-01  10339  				if (meta.func_id == special_kfunc_list[KF_bpf_dynptr_slice]) {
66e3a13e7c2c44 Joanne Koong            2023-03-01  10340  					regs[BPF_REG_0].type |= MEM_RDONLY;
66e3a13e7c2c44 Joanne Koong            2023-03-01  10341  				} else {
66e3a13e7c2c44 Joanne Koong            2023-03-01  10342  					/* this will set env->seen_direct_write to true */
66e3a13e7c2c44 Joanne Koong            2023-03-01  10343  					if (!may_access_direct_pkt_data(env, NULL, BPF_WRITE)) {
66e3a13e7c2c44 Joanne Koong            2023-03-01  10344  						verbose(env, "the prog does not allow writes to packet data\n");
66e3a13e7c2c44 Joanne Koong            2023-03-01  10345  						return -EINVAL;
66e3a13e7c2c44 Joanne Koong            2023-03-01  10346  					}
66e3a13e7c2c44 Joanne Koong            2023-03-01  10347  				}
66e3a13e7c2c44 Joanne Koong            2023-03-01  10348  
66e3a13e7c2c44 Joanne Koong            2023-03-01  10349  				if (!meta.initialized_dynptr.id) {
66e3a13e7c2c44 Joanne Koong            2023-03-01  10350  					verbose(env, "verifier internal error: no dynptr id\n");
66e3a13e7c2c44 Joanne Koong            2023-03-01  10351  					return -EFAULT;
66e3a13e7c2c44 Joanne Koong            2023-03-01  10352  				}
66e3a13e7c2c44 Joanne Koong            2023-03-01  10353  				regs[BPF_REG_0].dynptr_id = meta.initialized_dynptr.id;
66e3a13e7c2c44 Joanne Koong            2023-03-01  10354  
66e3a13e7c2c44 Joanne Koong            2023-03-01  10355  				/* we don't need to set BPF_REG_0's ref obj id
66e3a13e7c2c44 Joanne Koong            2023-03-01  10356  				 * because packet slices are not refcounted (see
66e3a13e7c2c44 Joanne Koong            2023-03-01  10357  				 * dynptr_type_refcounted)
66e3a13e7c2c44 Joanne Koong            2023-03-01  10358  				 */
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10359  			} else {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10360  				verbose(env, "kernel function %s unhandled dynamic return type\n",
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10361  					meta.func_name);
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10362  				return -EFAULT;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10363  			}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10364  		} else if (!__btf_type_is_struct(ptr_type)) {
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  10365  			if (!meta.r0_size) {
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  10366  				__u32 sz;
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  10367  
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  10368  				if (!IS_ERR(btf_resolve_size(desc_btf, ptr_type, &sz))) {
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  10369  					meta.r0_size = sz;
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  10370  					meta.r0_rdonly = true;
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  10371  				}
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  10372  			}
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10373  			if (!meta.r0_size) {
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  10374  				ptr_type_name = btf_name_by_offset(desc_btf,
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10375  								   ptr_type->name_off);
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10376  				verbose(env,
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10377  					"kernel function %s returns pointer type %s %s is not supported\n",
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10378  					func_name,
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10379  					btf_type_str(ptr_type),
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10380  					ptr_type_name);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10381  				return -EINVAL;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10382  			}
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10383  
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10384  			mark_reg_known_zero(env, regs, BPF_REG_0);
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10385  			regs[BPF_REG_0].type = PTR_TO_MEM;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10386  			regs[BPF_REG_0].mem_size = meta.r0_size;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10387  
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10388  			if (meta.r0_rdonly)
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10389  				regs[BPF_REG_0].type |= MEM_RDONLY;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10390  
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10391  			/* Ensures we don't access the memory after a release_reference() */
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10392  			if (meta.ref_obj_id)
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10393  				regs[BPF_REG_0].ref_obj_id = meta.ref_obj_id;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10394  		} else {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10395  			mark_reg_known_zero(env, regs, BPF_REG_0);
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  10396  			regs[BPF_REG_0].btf = desc_btf;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10397  			regs[BPF_REG_0].type = PTR_TO_BTF_ID;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10398  			regs[BPF_REG_0].btf_id = ptr_type_id;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10399  		}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10400  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10401  		if (is_kfunc_ret_null(&meta)) {
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10402  			regs[BPF_REG_0].type |= PTR_MAYBE_NULL;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10403  			/* For mark_ptr_or_null_reg, see 93c230e3f5bd6 */
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10404  			regs[BPF_REG_0].id = ++env->id_gen;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10405  		}
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10406  		mark_btf_func_reg_size(env, BPF_REG_0, sizeof(void *));
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10407  		if (is_kfunc_acquire(&meta)) {
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10408  			int id = acquire_reference_state(env, insn_idx);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10409  
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10410  			if (id < 0)
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10411  				return id;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10412  			if (is_kfunc_ret_null(&meta))
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10413  				regs[BPF_REG_0].id = id;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10414  			regs[BPF_REG_0].ref_obj_id = id;
a40d3632436b16 Dave Marchevsky         2023-02-13  10415  		} else if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_first]) {
a40d3632436b16 Dave Marchevsky         2023-02-13  10416  			ref_set_non_owning(env, &regs[BPF_REG_0]);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10417  		}
a40d3632436b16 Dave Marchevsky         2023-02-13  10418  
a40d3632436b16 Dave Marchevsky         2023-02-13  10419  		if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_remove])
a40d3632436b16 Dave Marchevsky         2023-02-13  10420  			invalidate_non_owning_refs(env);
a40d3632436b16 Dave Marchevsky         2023-02-13  10421  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10422  		if (reg_may_point_to_spin_lock(&regs[BPF_REG_0]) && !regs[BPF_REG_0].id)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10423  			regs[BPF_REG_0].id = ++env->id_gen;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10424  	} /* else { add_kfunc_call() ensures it is btf_type_is_void(t) } */
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10425  
07236eab7a3139 Andrii Nakryiko         2023-03-08  10426  	nargs = btf_type_vlen(meta.func_proto);
07236eab7a3139 Andrii Nakryiko         2023-03-08  10427  	args = (const struct btf_param *)(meta.func_proto + 1);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10428  	for (i = 0; i < nargs; i++) {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10429  		u32 regno = i + 1;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10430  
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  10431  		t = btf_type_skip_modifiers(desc_btf, args[i].type, NULL);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10432  		if (btf_type_is_ptr(t))
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10433  			mark_btf_func_reg_size(env, regno, sizeof(void *));
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10434  		else
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10435  			/* scalar. ensured by btf_check_kfunc_arg_match() */
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10436  			mark_btf_func_reg_size(env, regno, t->size);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10437  	}
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10438  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10439  	return 0;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10440  }
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10441  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
