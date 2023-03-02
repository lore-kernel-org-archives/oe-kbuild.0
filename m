Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0249EEC7
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Mar 2023 02:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677725158; x=1709261158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ewl4YjQnwxUS0l1+NSDfrYTPN5iizhBFIXbAJ/Z+6iw=;
  b=bcujAZs4kfDaoqEefauUeOU/EHg+ORlDS+wOTCpSdOHqISKitLTw/Thp
   qiAzMVOOf2UAIsnCEoTIm9cPoPWJ61o2CBd+I/YLcglqZgWIoKsQTftQ3
   W2ljjtaU5j//KktsUXjyv8FHyn1DNesVpKBo7Wa0TINEQnD0LuR4HaIfD
   hlnaWUfsEa5N/5FebGXS3uURR2Em7rjNjRG9wG7bB2Jtv30gEI2jZDuMl
   B0t54SHjdY3QfDHn7EfGfz1MwMf7pA5ucFy2pqo65IBhmnWCa6fe0Jg9x
   7/ny7fkBSZrJVWWeXbFEIo4JVB6/QdxGw6o4L270ORCz1MOgia2uv5wpe
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="399383289"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="399383289"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 18:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="784617312"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="784617312"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2023 18:45:56 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXYxA-00006f-1B;
	Thu, 02 Mar 2023 02:45:56 +0000
Date: Thu, 2 Mar 2023 10:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v13 bpf-next 09/10] bpf: Add bpf_dynptr_slice and
 bpf_dynptr_slice_rdwr
Message-ID: <202303021044.BwRlFiwk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/bpf/verifier.c:10169:70: sparse: sparse: invalid access past the end of 'special_kfunc_list' (64 64)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230301154953.641654-10-joannelkoong@gmail.com>
References: <20230301154953.641654-10-joannelkoong@gmail.com>
TO: Joanne Koong <joannelkoong@gmail.com>
TO: bpf@vger.kernel.org
CC: martin.lau@kernel.org
CC: andrii@kernel.org
CC: ast@kernel.org
CC: memxor@gmail.com
CC: daniel@iogearbox.net
CC: netdev@vger.kernel.org
CC: toke@kernel.org
CC: Joanne Koong <joannelkoong@gmail.com>

Hi Joanne,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Joanne-Koong/bpf-Support-sk_buff-and-xdp_buff-as-valid-kfunc-arg-types/20230301-235341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230301154953.641654-10-joannelkoong%40gmail.com
patch subject: [PATCH v13 bpf-next 09/10] bpf: Add bpf_dynptr_slice and bpf_dynptr_slice_rdwr
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: sparc64-randconfig-s033-20230302 (https://download.01.org/0day-ci/archive/20230302/202303021044.BwRlFiwk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/ab021cad431168baaba04ed320003be30f4deb34
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Joanne-Koong/bpf-Support-sk_buff-and-xdp_buff-as-valid-kfunc-arg-types/20230301-235341
        git checkout ab021cad431168baaba04ed320003be30f4deb34
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303021044.BwRlFiwk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/verifier.c:17058:38: sparse: sparse: subtraction of functions? Share your drugs
>> kernel/bpf/verifier.c:10169:70: sparse: sparse: invalid access past the end of 'special_kfunc_list' (64 64)
   kernel/bpf/verifier.c: note: in included file (through include/linux/bpf.h, include/linux/bpf-cgroup.h):
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar

vim +/special_kfunc_list +10169 kernel/bpf/verifier.c

00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9948  
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14   9949  static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14   9950  			    int *insn_idx_p)
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9951  {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9952  	const struct btf_type *t, *func, *func_proto, *ptr_type;
6a3cd3318ff656 Dave Marchevsky         2023-02-12   9953  	u32 i, nargs, func_id, ptr_type_id, release_ref_obj_id;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9954  	struct bpf_reg_state *regs = cur_regs(env);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9955  	const char *func_name, *ptr_type_name;
9bb00b2895cbfe Yonghong Song           2022-11-23   9956  	bool sleepable, rcu_lock, rcu_unlock;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9957  	struct bpf_kfunc_call_arg_meta meta;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14   9958  	int err, insn_idx = *insn_idx_p;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9959  	const struct btf_param *args;
a35b9af4ec2c7f Yonghong Song           2022-11-20   9960  	const struct btf_type *ret_t;
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02   9961  	struct btf *desc_btf;
a4703e3184320d Kumar Kartikeya Dwivedi 2022-07-21   9962  	u32 *kfunc_flags;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9963  
a5d8272752416e Kumar Kartikeya Dwivedi 2021-10-02   9964  	/* skip for now, but return error when we find this in fixup_kfunc_call */
a5d8272752416e Kumar Kartikeya Dwivedi 2021-10-02   9965  	if (!insn->imm)
a5d8272752416e Kumar Kartikeya Dwivedi 2021-10-02   9966  		return 0;
a5d8272752416e Kumar Kartikeya Dwivedi 2021-10-02   9967  
43bf087848ab79 Yuntao Wang             2022-05-05   9968  	desc_btf = find_kfunc_desc_btf(env, insn->off);
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02   9969  	if (IS_ERR(desc_btf))
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02   9970  		return PTR_ERR(desc_btf);
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02   9971  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9972  	func_id = insn->imm;
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02   9973  	func = btf_type_by_id(desc_btf, func_id);
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02   9974  	func_name = btf_name_by_offset(desc_btf, func->name_off);
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02   9975  	func_proto = btf_type_by_id(desc_btf, func->type);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9976  
a4703e3184320d Kumar Kartikeya Dwivedi 2022-07-21   9977  	kfunc_flags = btf_kfunc_id_set_contains(desc_btf, resolve_prog_type(env->prog), func_id);
a4703e3184320d Kumar Kartikeya Dwivedi 2022-07-21   9978  	if (!kfunc_flags) {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9979  		verbose(env, "calling kernel function %s is not allowed\n",
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9980  			func_name);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9981  		return -EACCES;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24   9982  	}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9983  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9984  	/* Prepare kfunc call metadata */
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9985  	memset(&meta, 0, sizeof(meta));
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9986  	meta.btf = desc_btf;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9987  	meta.func_id = func_id;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9988  	meta.kfunc_flags = *kfunc_flags;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9989  	meta.func_proto = func_proto;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9990  	meta.func_name = func_name;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9991  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9992  	if (is_kfunc_destructive(&meta) && !capable(CAP_SYS_BOOT)) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9993  		verbose(env, "destructive kfunc calls require CAP_SYS_BOOT capability\n");
4dd48c6f1f8329 Artem Savkov            2022-08-10   9994  		return -EACCES;
4dd48c6f1f8329 Artem Savkov            2022-08-10   9995  	}
4dd48c6f1f8329 Artem Savkov            2022-08-10   9996  
9bb00b2895cbfe Yonghong Song           2022-11-23   9997  	sleepable = is_kfunc_sleepable(&meta);
9bb00b2895cbfe Yonghong Song           2022-11-23   9998  	if (sleepable && !env->prog->aux->sleepable) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18   9999  		verbose(env, "program must be sleepable to call sleepable kfunc %s\n", func_name);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10000  		return -EACCES;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10001  	}
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10002  
9bb00b2895cbfe Yonghong Song           2022-11-23  10003  	rcu_lock = is_kfunc_bpf_rcu_read_lock(&meta);
9bb00b2895cbfe Yonghong Song           2022-11-23  10004  	rcu_unlock = is_kfunc_bpf_rcu_read_unlock(&meta);
9bb00b2895cbfe Yonghong Song           2022-11-23  10005  	if ((rcu_lock || rcu_unlock) && !env->rcu_tag_supported) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10006  		verbose(env, "no vmlinux btf rcu tag support for kfunc %s\n", func_name);
9bb00b2895cbfe Yonghong Song           2022-11-23  10007  		return -EACCES;
9bb00b2895cbfe Yonghong Song           2022-11-23  10008  	}
9bb00b2895cbfe Yonghong Song           2022-11-23  10009  
9bb00b2895cbfe Yonghong Song           2022-11-23  10010  	if (env->cur_state->active_rcu_lock) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10011  		struct bpf_func_state *state;
9bb00b2895cbfe Yonghong Song           2022-11-23  10012  		struct bpf_reg_state *reg;
9bb00b2895cbfe Yonghong Song           2022-11-23  10013  
9bb00b2895cbfe Yonghong Song           2022-11-23  10014  		if (rcu_lock) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10015  			verbose(env, "nested rcu read lock (kernel function %s)\n", func_name);
9bb00b2895cbfe Yonghong Song           2022-11-23  10016  			return -EINVAL;
9bb00b2895cbfe Yonghong Song           2022-11-23  10017  		} else if (rcu_unlock) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10018  			bpf_for_each_reg_in_vstate(env->cur_state, state, reg, ({
9bb00b2895cbfe Yonghong Song           2022-11-23  10019  				if (reg->type & MEM_RCU) {
fca1aa75518c03 Yonghong Song           2022-12-03  10020  					reg->type &= ~(MEM_RCU | PTR_MAYBE_NULL);
9bb00b2895cbfe Yonghong Song           2022-11-23  10021  					reg->type |= PTR_UNTRUSTED;
9bb00b2895cbfe Yonghong Song           2022-11-23  10022  				}
9bb00b2895cbfe Yonghong Song           2022-11-23  10023  			}));
9bb00b2895cbfe Yonghong Song           2022-11-23  10024  			env->cur_state->active_rcu_lock = false;
9bb00b2895cbfe Yonghong Song           2022-11-23  10025  		} else if (sleepable) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10026  			verbose(env, "kernel func %s is sleepable within rcu_read_lock region\n", func_name);
9bb00b2895cbfe Yonghong Song           2022-11-23  10027  			return -EACCES;
9bb00b2895cbfe Yonghong Song           2022-11-23  10028  		}
9bb00b2895cbfe Yonghong Song           2022-11-23  10029  	} else if (rcu_lock) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10030  		env->cur_state->active_rcu_lock = true;
9bb00b2895cbfe Yonghong Song           2022-11-23  10031  	} else if (rcu_unlock) {
9bb00b2895cbfe Yonghong Song           2022-11-23  10032  		verbose(env, "unmatched rcu read unlock (kernel function %s)\n", func_name);
9bb00b2895cbfe Yonghong Song           2022-11-23  10033  		return -EINVAL;
9bb00b2895cbfe Yonghong Song           2022-11-23  10034  	}
9bb00b2895cbfe Yonghong Song           2022-11-23  10035  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10036  	/* Check the arguments */
e017eacd263a16 Joanne Koong            2023-03-01  10037  	err = check_kfunc_args(env, &meta, insn_idx);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10038  	if (err < 0)
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10039  		return err;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10040  	/* In case of release function, we get register number of refcounted
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10041  	 * PTR_TO_BTF_ID in bpf_kfunc_arg_meta, do the release now.
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10042  	 */
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10043  	if (meta.release_regno) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10044  		err = release_reference(env, regs[meta.release_regno].ref_obj_id);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10045  		if (err) {
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10046  			verbose(env, "kfunc %s#%d reference has not been acquired before\n",
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10047  				func_name, func_id);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10048  			return err;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10049  		}
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10050  	}
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10051  
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10052  	if (meta.func_id == special_kfunc_list[KF_bpf_list_push_front] ||
bd1279ae8a691d Dave Marchevsky         2023-02-13  10053  	    meta.func_id == special_kfunc_list[KF_bpf_list_push_back] ||
bd1279ae8a691d Dave Marchevsky         2023-02-13  10054  	    meta.func_id == special_kfunc_list[KF_bpf_rbtree_add]) {
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10055  		release_ref_obj_id = regs[BPF_REG_2].ref_obj_id;
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10056  		err = ref_convert_owning_non_owning(env, release_ref_obj_id);
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10057  		if (err) {
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10058  			verbose(env, "kfunc %s#%d conversion of owning ref to non-owning failed\n",
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10059  				func_name, func_id);
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10060  			return err;
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10061  		}
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10062  
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10063  		err = release_reference(env, release_ref_obj_id);
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10064  		if (err) {
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10065  			verbose(env, "kfunc %s#%d reference has not been acquired before\n",
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10066  				func_name, func_id);
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10067  			return err;
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10068  		}
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10069  	}
6a3cd3318ff656 Dave Marchevsky         2023-02-12  10070  
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10071  	if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_add]) {
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10072  		err = __check_func_call(env, insn, insn_idx_p, meta.subprogno,
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10073  					set_rbtree_add_callback_state);
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10074  		if (err) {
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10075  			verbose(env, "kfunc %s#%d failed callback verification\n",
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10076  				func_name, func_id);
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10077  			return err;
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10078  		}
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10079  	}
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  10080  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10081  	for (i = 0; i < CALLER_SAVED_REGS; i++)
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10082  		mark_reg_not_init(env, regs, caller_saved[i]);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10083  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10084  	/* Check return type */
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  10085  	t = btf_type_skip_modifiers(desc_btf, func_proto->type, NULL);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10086  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10087  	if (is_kfunc_acquire(&meta) && !btf_type_is_struct_ptr(meta.btf, t)) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10088  		/* Only exception is bpf_obj_new_impl */
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10089  		if (meta.btf != btf_vmlinux || meta.func_id != special_kfunc_list[KF_bpf_obj_new_impl]) {
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10090  			verbose(env, "acquire kernel function does not return PTR_TO_BTF_ID\n");
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10091  			return -EINVAL;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10092  		}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10093  	}
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10094  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10095  	if (btf_type_is_scalar(t)) {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10096  		mark_reg_unknown(env, regs, BPF_REG_0);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10097  		mark_btf_func_reg_size(env, BPF_REG_0, t->size);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10098  	} else if (btf_type_is_ptr(t)) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10099  		ptr_type = btf_type_skip_modifiers(desc_btf, t->type, &ptr_type_id);
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10100  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10101  		if (meta.btf == btf_vmlinux && btf_id_set_contains(&special_kfunc_set, meta.func_id)) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10102  			if (meta.func_id == special_kfunc_list[KF_bpf_obj_new_impl]) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10103  				struct btf *ret_btf;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10104  				u32 ret_btf_id;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10105  
e181d3f143f795 Kumar Kartikeya Dwivedi 2022-11-21  10106  				if (unlikely(!bpf_global_ma_set))
e181d3f143f795 Kumar Kartikeya Dwivedi 2022-11-21  10107  					return -ENOMEM;
e181d3f143f795 Kumar Kartikeya Dwivedi 2022-11-21  10108  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10109  				if (((u64)(u32)meta.arg_constant.value) != meta.arg_constant.value) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10110  					verbose(env, "local type ID argument must be in range [0, U32_MAX]\n");
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10111  					return -EINVAL;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10112  				}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10113  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10114  				ret_btf = env->prog->aux->btf;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10115  				ret_btf_id = meta.arg_constant.value;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10116  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10117  				/* This may be NULL due to user not supplying a BTF */
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10118  				if (!ret_btf) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10119  					verbose(env, "bpf_obj_new requires prog BTF\n");
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10120  					return -EINVAL;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10121  				}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10122  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10123  				ret_t = btf_type_by_id(ret_btf, ret_btf_id);
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10124  				if (!ret_t || !__btf_type_is_struct(ret_t)) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10125  					verbose(env, "bpf_obj_new type ID argument must be of a struct\n");
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10126  					return -EINVAL;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10127  				}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10128  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10129  				mark_reg_known_zero(env, regs, BPF_REG_0);
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10130  				regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10131  				regs[BPF_REG_0].btf = ret_btf;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10132  				regs[BPF_REG_0].btf_id = ret_btf_id;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10133  
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10134  				env->insn_aux_data[insn_idx].obj_new_size = ret_t->size;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10135  				env->insn_aux_data[insn_idx].kptr_struct_meta =
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10136  					btf_find_struct_meta(ret_btf, ret_btf_id);
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  10137  			} else if (meta.func_id == special_kfunc_list[KF_bpf_obj_drop_impl]) {
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  10138  				env->insn_aux_data[insn_idx].kptr_struct_meta =
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  10139  					btf_find_struct_meta(meta.arg_obj_drop.btf,
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  10140  							     meta.arg_obj_drop.btf_id);
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  10141  			} else if (meta.func_id == special_kfunc_list[KF_bpf_list_pop_front] ||
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  10142  				   meta.func_id == special_kfunc_list[KF_bpf_list_pop_back]) {
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  10143  				struct btf_field *field = meta.arg_list_head.field;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  10144  
a40d3632436b16 Dave Marchevsky         2023-02-13  10145  				mark_reg_graph_node(regs, BPF_REG_0, &field->graph_root);
a40d3632436b16 Dave Marchevsky         2023-02-13  10146  			} else if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
a40d3632436b16 Dave Marchevsky         2023-02-13  10147  				   meta.func_id == special_kfunc_list[KF_bpf_rbtree_first]) {
a40d3632436b16 Dave Marchevsky         2023-02-13  10148  				struct btf_field *field = meta.arg_rbtree_root.field;
a40d3632436b16 Dave Marchevsky         2023-02-13  10149  
a40d3632436b16 Dave Marchevsky         2023-02-13  10150  				mark_reg_graph_node(regs, BPF_REG_0, &field->graph_root);
fd264ca020948a Yonghong Song           2022-11-20  10151  			} else if (meta.func_id == special_kfunc_list[KF_bpf_cast_to_kern_ctx]) {
fd264ca020948a Yonghong Song           2022-11-20  10152  				mark_reg_known_zero(env, regs, BPF_REG_0);
fd264ca020948a Yonghong Song           2022-11-20  10153  				regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_TRUSTED;
fd264ca020948a Yonghong Song           2022-11-20  10154  				regs[BPF_REG_0].btf = desc_btf;
fd264ca020948a Yonghong Song           2022-11-20  10155  				regs[BPF_REG_0].btf_id = meta.ret_btf_id;
a35b9af4ec2c7f Yonghong Song           2022-11-20  10156  			} else if (meta.func_id == special_kfunc_list[KF_bpf_rdonly_cast]) {
a35b9af4ec2c7f Yonghong Song           2022-11-20  10157  				ret_t = btf_type_by_id(desc_btf, meta.arg_constant.value);
a35b9af4ec2c7f Yonghong Song           2022-11-20  10158  				if (!ret_t || !btf_type_is_struct(ret_t)) {
a35b9af4ec2c7f Yonghong Song           2022-11-20  10159  					verbose(env,
a35b9af4ec2c7f Yonghong Song           2022-11-20  10160  						"kfunc bpf_rdonly_cast type ID argument must be of a struct\n");
a35b9af4ec2c7f Yonghong Song           2022-11-20  10161  					return -EINVAL;
a35b9af4ec2c7f Yonghong Song           2022-11-20  10162  				}
a35b9af4ec2c7f Yonghong Song           2022-11-20  10163  
a35b9af4ec2c7f Yonghong Song           2022-11-20  10164  				mark_reg_known_zero(env, regs, BPF_REG_0);
a35b9af4ec2c7f Yonghong Song           2022-11-20  10165  				regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_UNTRUSTED;
a35b9af4ec2c7f Yonghong Song           2022-11-20  10166  				regs[BPF_REG_0].btf = desc_btf;
a35b9af4ec2c7f Yonghong Song           2022-11-20  10167  				regs[BPF_REG_0].btf_id = meta.arg_constant.value;
ab021cad431168 Joanne Koong            2023-03-01  10168  			} else if (meta.func_id == special_kfunc_list[KF_bpf_dynptr_slice] ||
ab021cad431168 Joanne Koong            2023-03-01 @10169  				   meta.func_id == special_kfunc_list[KF_bpf_dynptr_slice_rdwr]) {
ab021cad431168 Joanne Koong            2023-03-01  10170  				enum bpf_type_flag type_flag = get_dynptr_type_flag(meta.initialized_dynptr.type);
ab021cad431168 Joanne Koong            2023-03-01  10171  
ab021cad431168 Joanne Koong            2023-03-01  10172  				mark_reg_known_zero(env, regs, BPF_REG_0);
ab021cad431168 Joanne Koong            2023-03-01  10173  
ab021cad431168 Joanne Koong            2023-03-01  10174  				if (!meta.arg_constant.found) {
ab021cad431168 Joanne Koong            2023-03-01  10175  					verbose(env, "verifier internal error: bpf_dynptr_slice(_rdwr) no constant size\n");
ab021cad431168 Joanne Koong            2023-03-01  10176  					return -EFAULT;
ab021cad431168 Joanne Koong            2023-03-01  10177  				}
ab021cad431168 Joanne Koong            2023-03-01  10178  
ab021cad431168 Joanne Koong            2023-03-01  10179  				regs[BPF_REG_0].mem_size = meta.arg_constant.value;
ab021cad431168 Joanne Koong            2023-03-01  10180  
ab021cad431168 Joanne Koong            2023-03-01  10181  				/* PTR_MAYBE_NULL will be added when is_kfunc_ret_null is checked */
ab021cad431168 Joanne Koong            2023-03-01  10182  				regs[BPF_REG_0].type = PTR_TO_MEM | type_flag;
ab021cad431168 Joanne Koong            2023-03-01  10183  
ab021cad431168 Joanne Koong            2023-03-01  10184  				if (meta.func_id == special_kfunc_list[KF_bpf_dynptr_slice]) {
ab021cad431168 Joanne Koong            2023-03-01  10185  					regs[BPF_REG_0].type |= MEM_RDONLY;
ab021cad431168 Joanne Koong            2023-03-01  10186  				} else {
ab021cad431168 Joanne Koong            2023-03-01  10187  					/* this will set env->seen_direct_write to true */
ab021cad431168 Joanne Koong            2023-03-01  10188  					if (!may_access_direct_pkt_data(env, NULL, BPF_WRITE)) {
ab021cad431168 Joanne Koong            2023-03-01  10189  						verbose(env, "the prog does not allow writes to packet data\n");
ab021cad431168 Joanne Koong            2023-03-01  10190  						return -EINVAL;
ab021cad431168 Joanne Koong            2023-03-01  10191  					}
ab021cad431168 Joanne Koong            2023-03-01  10192  				}
ab021cad431168 Joanne Koong            2023-03-01  10193  
ab021cad431168 Joanne Koong            2023-03-01  10194  				if (!meta.initialized_dynptr.id) {
ab021cad431168 Joanne Koong            2023-03-01  10195  					verbose(env, "verifier internal error: no dynptr id\n");
ab021cad431168 Joanne Koong            2023-03-01  10196  					return -EFAULT;
ab021cad431168 Joanne Koong            2023-03-01  10197  				}
ab021cad431168 Joanne Koong            2023-03-01  10198  				regs[BPF_REG_0].dynptr_id = meta.initialized_dynptr.id;
ab021cad431168 Joanne Koong            2023-03-01  10199  
ab021cad431168 Joanne Koong            2023-03-01  10200  				/* we don't need to set BPF_REG_0's ref obj id
ab021cad431168 Joanne Koong            2023-03-01  10201  				 * because packet slices are not refcounted (see
ab021cad431168 Joanne Koong            2023-03-01  10202  				 * dynptr_type_refcounted)
ab021cad431168 Joanne Koong            2023-03-01  10203  				 */
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10204  			} else {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10205  				verbose(env, "kernel function %s unhandled dynamic return type\n",
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10206  					meta.func_name);
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10207  				return -EFAULT;
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10208  			}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10209  		} else if (!__btf_type_is_struct(ptr_type)) {
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10210  			if (!meta.r0_size) {
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  10211  				ptr_type_name = btf_name_by_offset(desc_btf,
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10212  								   ptr_type->name_off);
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10213  				verbose(env,
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10214  					"kernel function %s returns pointer type %s %s is not supported\n",
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10215  					func_name,
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10216  					btf_type_str(ptr_type),
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10217  					ptr_type_name);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10218  				return -EINVAL;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10219  			}
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10220  
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10221  			mark_reg_known_zero(env, regs, BPF_REG_0);
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10222  			regs[BPF_REG_0].type = PTR_TO_MEM;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10223  			regs[BPF_REG_0].mem_size = meta.r0_size;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10224  
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10225  			if (meta.r0_rdonly)
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10226  				regs[BPF_REG_0].type |= MEM_RDONLY;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10227  
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10228  			/* Ensures we don't access the memory after a release_reference() */
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10229  			if (meta.ref_obj_id)
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10230  				regs[BPF_REG_0].ref_obj_id = meta.ref_obj_id;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10231  		} else {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10232  			mark_reg_known_zero(env, regs, BPF_REG_0);
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  10233  			regs[BPF_REG_0].btf = desc_btf;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10234  			regs[BPF_REG_0].type = PTR_TO_BTF_ID;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10235  			regs[BPF_REG_0].btf_id = ptr_type_id;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  10236  		}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  10237  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10238  		if (is_kfunc_ret_null(&meta)) {
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10239  			regs[BPF_REG_0].type |= PTR_MAYBE_NULL;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10240  			/* For mark_ptr_or_null_reg, see 93c230e3f5bd6 */
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10241  			regs[BPF_REG_0].id = ++env->id_gen;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10242  		}
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10243  		mark_btf_func_reg_size(env, BPF_REG_0, sizeof(void *));
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10244  		if (is_kfunc_acquire(&meta)) {
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10245  			int id = acquire_reference_state(env, insn_idx);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10246  
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10247  			if (id < 0)
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10248  				return id;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10249  			if (is_kfunc_ret_null(&meta))
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10250  				regs[BPF_REG_0].id = id;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10251  			regs[BPF_REG_0].ref_obj_id = id;
a40d3632436b16 Dave Marchevsky         2023-02-13  10252  		} else if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_first]) {
a40d3632436b16 Dave Marchevsky         2023-02-13  10253  			ref_set_non_owning(env, &regs[BPF_REG_0]);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  10254  		}
a40d3632436b16 Dave Marchevsky         2023-02-13  10255  
a40d3632436b16 Dave Marchevsky         2023-02-13  10256  		if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_remove])
a40d3632436b16 Dave Marchevsky         2023-02-13  10257  			invalidate_non_owning_refs(env);
a40d3632436b16 Dave Marchevsky         2023-02-13  10258  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10259  		if (reg_may_point_to_spin_lock(&regs[BPF_REG_0]) && !regs[BPF_REG_0].id)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  10260  			regs[BPF_REG_0].id = ++env->id_gen;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10261  	} /* else { add_kfunc_call() ensures it is btf_type_is_void(t) } */
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10262  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10263  	nargs = btf_type_vlen(func_proto);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10264  	args = (const struct btf_param *)(func_proto + 1);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10265  	for (i = 0; i < nargs; i++) {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10266  		u32 regno = i + 1;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10267  
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  10268  		t = btf_type_skip_modifiers(desc_btf, args[i].type, NULL);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10269  		if (btf_type_is_ptr(t))
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10270  			mark_btf_func_reg_size(env, regno, sizeof(void *));
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10271  		else
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10272  			/* scalar. ensured by btf_check_kfunc_arg_match() */
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10273  			mark_btf_func_reg_size(env, regno, t->size);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10274  	}
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10275  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10276  	return 0;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10277  }
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  10278  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
