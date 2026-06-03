Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E5423A80
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jun 2026 07:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471813; cv=none; b=RTCk3LL7Kjyv8+dm9bWFcv1kofH+KWd49rhXJXAaoynpVWJNVkPVREPvPet0t9lhPHGKvJQaFI2zoM7A5gEuxyFJPG2e4UMDpedS4nus1eMnMSMSB7M632f+Ir4zQ3DnIVxAKy7+dFrV9rtCUM9yLbiPLhFq7/KbtcVmva8poDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471813; c=relaxed/simple;
	bh=QB7kLhJHWBjXKIt7cVr8nTtoXhMzUFUBfMGw9bO1k3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bOsWkLSh4ONJ1T6Wary7RpkVWIZRJGTxei7R4ZJM6nCmzIFjrUcsgT3D6OvdhVNbj3RHYqqGH6VnP35xleKn+lIXQlo3blVxSvWzN+SR7s9KJLzDbDIxIyw3eksbcIFi8akKHhEGUgH/zc35l4vRcnZQbytr1R0xYUEUCI43R/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUvXGxyc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUvXGxyc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780471806; x=1812007806;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QB7kLhJHWBjXKIt7cVr8nTtoXhMzUFUBfMGw9bO1k3U=;
  b=JUvXGxycEMELQS06enTCQ8Mrkk6jFEIu21bZ8AXZflNw1rZt4WnS2sSy
   7ttmrZWRyK1/uLcLX7/Diz7OIpQzDEXN+A7jQamVBiaWP1becS/SL+3Zp
   mn64bvPTiNDZLlooM2/Wytin7PpTdLHtDZqmAXwssC6KqfYWOC4XC0/3l
   wMdyWYSuBGsXGFpwzRQDVAEsz7v69UkgehxeECA1Q0ivDLDDdjzLQfW4f
   UWjT553UwQ5fyOe/DJQULvfev5cQXAOB//W1GNcd86ijV59YouY+gIxjb
   QWS9pUbKLuZ7GkexJF/CoNhuikIBapPZmTHndGYMEbT8TY3eb7ZV8bSX4
   Q==;
X-CSE-ConnectionGUID: l3omnjjsRk+XZGoj8NEPqg==
X-CSE-MsgGUID: lvF/2+2BT9Ce1KzR2LUhuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81129479"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81129479"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:30:05 -0700
X-CSE-ConnectionGUID: puj71nqJR6y5wjfBBDCCQA==
X-CSE-MsgGUID: 5ynNFY8SQWiR5UXpVhpAYg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jun 2026 00:30:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUg37-00000000D5N-4B73;
	Wed, 03 Jun 2026 07:30:01 +0000
Date: Wed, 03 Jun 2026 15:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/verifier.c:24400:1-7: preceding lock on line
 24147
Message-ID: <202606031512.KcHb0vEo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>

Hi Alexei,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: 449f08fa59dda5da40317b6976604b877c4ecd63 bpf: Move fixup/post-proce=
ssing logic from verifier.c into fixups.c
date:   7 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 weeks ago
config: sparc-randconfig-r061-20260603 (https://download.01.org/0day-ci/arc=
hive/20260603/202606031512.KcHb0vEo-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 449f08fa59dd ("bpf: Move fixup/post-processing logic from verifier=
.c into fixups.c")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606031512.KcHb0vEo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/verifier.c:24400:1-7: preceding lock on line 24147

vim +24400 kernel/bpf/verifier.c

449f08fa59dda5 Alexei Starovoitov      2026-04-12  24099 =20
47a71c1f9af0a3 Andrii Nakryiko         2023-04-06  24100  int bpf_check(str=
uct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u32 uattr_size)
51580e798cb61b Alexei Starovoitov      2014-09-26  24101  {
06ee7115b0d174 Alexei Starovoitov      2019-04-01  24102  	u64 start_time =
=3D ktime_get_ns();
58e2af8b3a6b58 Jakub Kicinski          2016-09-21  24103  	struct bpf_verif=
ier_env *env;
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24104  	int i, len, ret =
=3D -EINVAL, err;
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24105  	u32 log_true_siz=
e;
e2ae4ca266a1c9 Jakub Kicinski          2019-01-22  24106  	bool is_priv;
51580e798cb61b Alexei Starovoitov      2014-09-26  24107 =20
b23e97ffc25294 Eduard Zingerman        2025-06-25  24108  	BTF_TYPE_EMIT(en=
um bpf_features);
b23e97ffc25294 Eduard Zingerman        2025-06-25  24109 =20
eba0c929d1d0f1 Arnd Bergmann           2017-11-02  24110  	/* no program is=
 valid */
eba0c929d1d0f1 Arnd Bergmann           2017-11-02  24111  	if (ARRAY_SIZE(b=
pf_verifier_ops) =3D=3D 0)
eba0c929d1d0f1 Arnd Bergmann           2017-11-02  24112  		return -EINVAL;
eba0c929d1d0f1 Arnd Bergmann           2017-11-02  24113 =20
58e2af8b3a6b58 Jakub Kicinski          2016-09-21  24114  	/* 'struct bpf_v=
erifier_env' can be global, but since it's not small,
cbd35700860492 Alexei Starovoitov      2014-09-26  24115  	 * allocate/free=
 it every time bpf_check() is called
cbd35700860492 Alexei Starovoitov      2014-09-26  24116  	 */
69050f8d6d075d Kees Cook               2026-02-20  24117  	env =3D kvzalloc=
_obj(struct bpf_verifier_env, GFP_KERNEL_ACCOUNT);
cbd35700860492 Alexei Starovoitov      2014-09-26  24118  	if (!env)
cbd35700860492 Alexei Starovoitov      2014-09-26  24119  		return -ENOMEM;
cbd35700860492 Alexei Starovoitov      2014-09-26  24120 =20
407958a0e980b9 Andrii Nakryiko         2023-05-04  24121  	env->bt.env =3D =
env;
407958a0e980b9 Andrii Nakryiko         2023-05-04  24122 =20
9e4c24e7ee7dfd Jakub Kicinski          2019-01-22  24123  	len =3D (*prog)-=
>len;
fad953ce0b22cf Kees Cook               2018-06-12  24124  	env->insn_aux_da=
ta =3D
9e4c24e7ee7dfd Jakub Kicinski          2019-01-22  24125  		vzalloc(array_s=
ize(sizeof(struct bpf_insn_aux_data), len));
3df126f35f88dc Jakub Kicinski          2016-09-21  24126  	ret =3D -ENOMEM;
3df126f35f88dc Jakub Kicinski          2016-09-21  24127  	if (!env->insn_a=
ux_data)
3df126f35f88dc Jakub Kicinski          2016-09-21  24128  		goto err_free_e=
nv;
9e4c24e7ee7dfd Jakub Kicinski          2019-01-22  24129  	for (i =3D 0; i =
< len; i++)
9e4c24e7ee7dfd Jakub Kicinski          2019-01-22  24130  		env->insn_aux_d=
ata[i].orig_idx =3D i;
2f69c568542730 Anton Protopopov        2025-10-19  24131  	env->succ =3D ia=
rray_realloc(NULL, 2);
2f69c568542730 Anton Protopopov        2025-10-19  24132  	if (!env->succ)
2f69c568542730 Anton Protopopov        2025-10-19  24133  		goto err_free_e=
nv;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  24134  	env->prog =3D *p=
rog;
00176a34d9e27a Jakub Kicinski          2017-10-16  24135  	env->ops =3D bpf=
_verifier_ops[env->prog->type];
d79a3549754725 Andrii Nakryiko         2024-01-23  24136 =20
d79a3549754725 Andrii Nakryiko         2024-01-23  24137  	env->allow_ptr_l=
eaks =3D bpf_allow_ptr_leaks(env->prog->aux->token);
d79a3549754725 Andrii Nakryiko         2024-01-23  24138  	env->allow_unini=
t_stack =3D bpf_allow_uninit_stack(env->prog->aux->token);
d79a3549754725 Andrii Nakryiko         2024-01-23  24139  	env->bypass_spec=
_v1 =3D bpf_bypass_spec_v1(env->prog->aux->token);
d79a3549754725 Andrii Nakryiko         2024-01-23  24140  	env->bypass_spec=
_v4 =3D bpf_bypass_spec_v4(env->prog->aux->token);
d79a3549754725 Andrii Nakryiko         2024-01-23  24141  	env->bpf_capable=
 =3D is_priv =3D bpf_token_capable(env->prog->aux->token, CAP_BPF);
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24142 =20
76654e67f3a01c Alan Maguire            2020-09-28  24143  	bpf_get_btf_vmli=
nux();
8580ac9404f624 Alexei Starovoitov      2019-10-15  24144 =20
cbd35700860492 Alexei Starovoitov      2014-09-26  24145  	/* grab the mute=
x to protect few globals used by verifier */
45a73c17bfb92c Alexei Starovoitov      2019-04-19  24146  	if (!is_priv)
cbd35700860492 Alexei Starovoitov      2014-09-26  24147  		mutex_lock(&bpf=
_verifier_lock);
cbd35700860492 Alexei Starovoitov      2014-09-26  24148 =20
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24149  	/* user could ha=
ve requested verbose verifier output
cbd35700860492 Alexei Starovoitov      2014-09-26  24150  	 * and supplied =
buffer to store the verification trace
cbd35700860492 Alexei Starovoitov      2014-09-26  24151  	 */
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24152  	ret =3D bpf_vlog=
_init(&env->log, attr->log_level,
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24153  			    (char __us=
er *) (unsigned long) attr->log_buf,
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24154  			    attr->log_=
size);
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24155  	if (ret)
3df126f35f88dc Jakub Kicinski          2016-09-21  24156  		goto err_unlock;
1ad2f5838d345e Daniel Borkmann         2017-05-25  24157 =20
4d3ae294f900fb Anton Protopopov        2024-12-13  24158  	ret =3D process_=
fd_array(env, attr, uattr);
4d3ae294f900fb Anton Protopopov        2024-12-13  24159  	if (ret)
4d3ae294f900fb Anton Protopopov        2024-12-13  24160  		goto skip_full_=
check;
4d3ae294f900fb Anton Protopopov        2024-12-13  24161 =20
0f55f9ed21f966 Christy Lee             2021-12-16  24162  	mark_verifier_st=
ate_clean(env);
0f55f9ed21f966 Christy Lee             2021-12-16  24163 =20
8580ac9404f624 Alexei Starovoitov      2019-10-15  24164  	if (IS_ERR(btf_v=
mlinux)) {
8580ac9404f624 Alexei Starovoitov      2019-10-15  24165  		/* Either gcc o=
r pahole or kernel are broken. */
8580ac9404f624 Alexei Starovoitov      2019-10-15  24166  		verbose(env, "i=
n-kernel BTF is malformed\n");
8580ac9404f624 Alexei Starovoitov      2019-10-15  24167  		ret =3D PTR_ERR=
(btf_vmlinux);
38207291604401 Martin KaFai Lau        2019-10-24  24168  		goto skip_full_=
check;
8580ac9404f624 Alexei Starovoitov      2019-10-15  24169  	}
8580ac9404f624 Alexei Starovoitov      2019-10-15  24170 =20
1ad2f5838d345e Daniel Borkmann         2017-05-25  24171  	env->strict_alig=
nment =3D !!(attr->prog_flags & BPF_F_STRICT_ALIGNMENT);
1ad2f5838d345e Daniel Borkmann         2017-05-25  24172  	if (!IS_ENABLED(=
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
e07b98d9bffe41 David S. Miller         2017-05-10  24173  		env->strict_ali=
gnment =3D true;
e9ee9efc0d1765 David Miller            2018-11-30  24174  	if (attr->prog_f=
lags & BPF_F_ANY_ALIGNMENT)
e9ee9efc0d1765 David Miller            2018-11-30  24175  		env->strict_ali=
gnment =3D false;
cbd35700860492 Alexei Starovoitov      2014-09-26  24176 =20
10d274e880eb20 Alexei Starovoitov      2019-08-22  24177  	if (is_priv)
10d274e880eb20 Alexei Starovoitov      2019-08-22  24178  		env->test_state=
_freq =3D attr->prog_flags & BPF_F_TEST_STATE_FREQ;
ff8867af01daa7 Andrii Nakryiko         2023-11-17  24179  	env->test_reg_in=
variants =3D attr->prog_flags & BPF_F_TEST_REG_INVARIANTS;
10d274e880eb20 Alexei Starovoitov      2019-08-22  24180 =20
69050f8d6d075d Kees Cook               2026-02-20  24181  	env->explored_st=
ates =3D kvzalloc_objs(struct list_head,
69050f8d6d075d Kees Cook               2026-02-20  24182  					     state_h=
tab_size(env),
43736ec3e02789 Eduard Zingerman        2025-06-13  24183  					     GFP_KER=
NEL_ACCOUNT);
f1bca824dabba4 Alexei Starovoitov      2014-09-29  24184  	ret =3D -ENOMEM;
f1bca824dabba4 Alexei Starovoitov      2014-09-29  24185  	if (!env->explor=
ed_states)
f1bca824dabba4 Alexei Starovoitov      2014-09-29  24186  		goto skip_full_=
check;
f1bca824dabba4 Alexei Starovoitov      2014-09-29  24187 =20
5564ee3abb2ebe Eduard Zingerman        2025-02-15  24188  	for (i =3D 0; i =
< state_htab_size(env); i++)
5564ee3abb2ebe Eduard Zingerman        2025-02-15  24189  		INIT_LIST_HEAD(=
&env->explored_states[i]);
5564ee3abb2ebe Eduard Zingerman        2025-02-15  24190  	INIT_LIST_HEAD(&=
env->free_list);
5564ee3abb2ebe Eduard Zingerman        2025-02-15  24191 =20
aaa619ebccb2b7 Kumar Kartikeya Dwivedi 2023-09-13  24192  	ret =3D check_bt=
f_info_early(env, attr, uattr);
aaa619ebccb2b7 Kumar Kartikeya Dwivedi 2023-09-13  24193  	if (ret < 0)
aaa619ebccb2b7 Kumar Kartikeya Dwivedi 2023-09-13  24194  		goto skip_full_=
check;
aaa619ebccb2b7 Kumar Kartikeya Dwivedi 2023-09-13  24195 =20
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  24196  	ret =3D add_subp=
rog_and_kfunc(env);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  24197  	if (ret < 0)
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  24198  		goto skip_full_=
check;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  24199 =20
d9762e84ede3ea Martin KaFai Lau        2018-12-13  24200  	ret =3D check_su=
bprogs(env);
475fb78fbf4859 Alexei Starovoitov      2014-09-26  24201  	if (ret < 0)
475fb78fbf4859 Alexei Starovoitov      2014-09-26  24202  		goto skip_full_=
check;
475fb78fbf4859 Alexei Starovoitov      2014-09-26  24203 =20
c454a46b5efd8e Martin KaFai Lau        2018-12-07  24204  	ret =3D check_bt=
f_info(env, attr, uattr);
838e96904ff3fc Yonghong Song           2018-11-19  24205  	if (ret < 0)
838e96904ff3fc Yonghong Song           2018-11-19  24206  		goto skip_full_=
check;
838e96904ff3fc Yonghong Song           2018-11-19  24207 =20
ae3f8ca2ba505d Alexei Starovoitov      2026-04-11  24208  	ret =3D check_an=
d_resolve_insns(env);
4976b718c3551f Hao Luo                 2020-09-29  24209  	if (ret < 0)
4976b718c3551f Hao Luo                 2020-09-29  24210  		goto skip_full_=
check;
4976b718c3551f Hao Luo                 2020-09-29  24211 =20
9d03ebc71a027c Stanislav Fomichev      2023-01-19  24212  	if (bpf_prog_is_=
offloaded(env->prog->aux)) {
ceb11679d9fcf3 Yinjun Zhang            2021-05-20  24213  		ret =3D bpf_pro=
g_offload_verifier_prep(env->prog);
ceb11679d9fcf3 Yinjun Zhang            2021-05-20  24214  		if (ret)
ceb11679d9fcf3 Yinjun Zhang            2021-05-20  24215  			goto skip_full=
_check;
ceb11679d9fcf3 Yinjun Zhang            2021-05-20  24216  	}
ceb11679d9fcf3 Yinjun Zhang            2021-05-20  24217 =20
d9762e84ede3ea Martin KaFai Lau        2018-12-13  24218  	ret =3D check_cf=
g(env);
d9762e84ede3ea Martin KaFai Lau        2018-12-13  24219  	if (ret < 0)
d9762e84ede3ea Martin KaFai Lau        2018-12-13  24220  		goto skip_full_=
check;
d9762e84ede3ea Martin KaFai Lau        2018-12-13  24221 =20
f1606dd0ac4923 Alexei Starovoitov      2026-04-02  24222  	ret =3D bpf_comp=
ute_postorder(env);
efcda22aa541bb Eduard Zingerman        2025-09-18  24223  	if (ret < 0)
efcda22aa541bb Eduard Zingerman        2025-09-18  24224  		goto skip_full_=
check;
efcda22aa541bb Eduard Zingerman        2025-09-18  24225 =20
e41c237953b36c Eduard Zingerman        2025-09-18  24226  	ret =3D bpf_stac=
k_liveness_init(env);
e41c237953b36c Eduard Zingerman        2025-09-18  24227  	if (ret)
e41c237953b36c Eduard Zingerman        2025-09-18  24228  		goto skip_full_=
check;
e41c237953b36c Eduard Zingerman        2025-09-18  24229 =20
81f6d0530ba031 Eduard Zingerman        2024-12-09  24230  	ret =3D check_at=
tach_btf_id(env);
81f6d0530ba031 Eduard Zingerman        2024-12-09  24231  	if (ret)
81f6d0530ba031 Eduard Zingerman        2024-12-09  24232  		goto skip_full_=
check;
e6898ec751e4d8 Alexei Starovoitov      2026-04-02  24233 =20
f1606dd0ac4923 Alexei Starovoitov      2026-04-02  24234  	ret =3D bpf_comp=
ute_const_regs(env);
f1606dd0ac4923 Alexei Starovoitov      2026-04-02  24235  	if (ret < 0)
f1606dd0ac4923 Alexei Starovoitov      2026-04-02  24236  		goto skip_full_=
check;
f1606dd0ac4923 Alexei Starovoitov      2026-04-02  24237 =20
f1606dd0ac4923 Alexei Starovoitov      2026-04-02  24238  	ret =3D bpf_prun=
e_dead_branches(env);
f1606dd0ac4923 Alexei Starovoitov      2026-04-02  24239  	if (ret < 0)
f1606dd0ac4923 Alexei Starovoitov      2026-04-02  24240  		goto skip_full_=
check;
f1606dd0ac4923 Alexei Starovoitov      2026-04-02  24241 =20
e6898ec751e4d8 Alexei Starovoitov      2026-04-02  24242  	ret =3D sort_sub=
progs_topo(env);
e6898ec751e4d8 Alexei Starovoitov      2026-04-02  24243  	if (ret < 0)
e6898ec751e4d8 Alexei Starovoitov      2026-04-02  24244  		goto skip_full_=
check;
81f6d0530ba031 Eduard Zingerman        2024-12-09  24245 =20
96c6aa4c63af0b Eduard Zingerman        2025-06-11  24246  	ret =3D compute_=
scc(env);
96c6aa4c63af0b Eduard Zingerman        2025-06-11  24247  	if (ret < 0)
96c6aa4c63af0b Eduard Zingerman        2025-06-11  24248  		goto skip_full_=
check;
96c6aa4c63af0b Eduard Zingerman        2025-06-11  24249 =20
14c8552db64476 Eduard Zingerman        2025-03-04  24250  	ret =3D compute_=
live_registers(env);
14c8552db64476 Eduard Zingerman        2025-03-04  24251  	if (ret < 0)
14c8552db64476 Eduard Zingerman        2025-03-04  24252  		goto skip_full_=
check;
14c8552db64476 Eduard Zingerman        2025-03-04  24253 =20
ae010757a55b57 Eduard Zingerman        2024-08-22  24254  	ret =3D mark_fas=
tcall_patterns(env);
5b5f51bff1b66c Eduard Zingerman        2024-07-22  24255  	if (ret < 0)
5b5f51bff1b66c Eduard Zingerman        2024-07-22  24256  		goto skip_full_=
check;
5b5f51bff1b66c Eduard Zingerman        2024-07-22  24257 =20
2afae08c9dcb8a Andrii Nakryiko         2023-11-23  24258  	ret =3D do_check=
_main(env);
2afae08c9dcb8a Andrii Nakryiko         2023-11-23  24259  	ret =3D ret ?: d=
o_check_subprogs(env);
cbd35700860492 Alexei Starovoitov      2014-09-26  24260 =20
9d03ebc71a027c Stanislav Fomichev      2023-01-19  24261  	if (ret =3D=3D 0=
 && bpf_prog_is_offloaded(env->prog->aux))
c941ce9c282cc6 Quentin Monnet          2018-10-07  24262  		ret =3D bpf_pro=
g_offload_finalize(env);
c941ce9c282cc6 Quentin Monnet          2018-10-07  24263 =20
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24264  skip_full_check:
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  24265  	kvfree(env->expl=
ored_states);
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24266 =20
5b5f51bff1b66c Eduard Zingerman        2024-07-22  24267  	/* might decreas=
e stack depth, keep it before passes that
5b5f51bff1b66c Eduard Zingerman        2024-07-22  24268  	 * allocate addi=
tional slots.
5b5f51bff1b66c Eduard Zingerman        2024-07-22  24269  	 */
5b5f51bff1b66c Eduard Zingerman        2024-07-22  24270  	if (ret =3D=3D 0)
449f08fa59dda5 Alexei Starovoitov      2026-04-12  24271  		ret =3D bpf_rem=
ove_fastcall_spills_fills(env);
5b5f51bff1b66c Eduard Zingerman        2024-07-22  24272 =20
c131187db2d3fa Alexei Starovoitov      2017-11-22  24273  	if (ret =3D=3D 0)
9b38c4056b2736 Jakub Kicinski          2018-12-19  24274  		ret =3D check_m=
ax_stack_depth(env);
c131187db2d3fa Alexei Starovoitov      2017-11-22  24275 =20
9b38c4056b2736 Jakub Kicinski          2018-12-19  24276  	/* instruction r=
ewrites happen after this point */
1ade23711971b0 Eduard Zingerman        2022-06-21  24277  	if (ret =3D=3D 0)
449f08fa59dda5 Alexei Starovoitov      2026-04-12  24278  		ret =3D bpf_opt=
imize_bpf_loop(env);
1ade23711971b0 Eduard Zingerman        2022-06-21  24279 =20
e2ae4ca266a1c9 Jakub Kicinski          2019-01-22  24280  	if (is_priv) {
e2ae4ca266a1c9 Jakub Kicinski          2019-01-22  24281  		if (ret =3D=3D =
0)
449f08fa59dda5 Alexei Starovoitov      2026-04-12  24282  			bpf_opt_hard_w=
ire_dead_code_branches(env);
52875a04f4b26e Jakub Kicinski          2019-01-22  24283  		if (ret =3D=3D =
0)
449f08fa59dda5 Alexei Starovoitov      2026-04-12  24284  			ret =3D bpf_op=
t_remove_dead_code(env);
a1b14abc009d9c Jakub Kicinski          2019-01-22  24285  		if (ret =3D=3D =
0)
449f08fa59dda5 Alexei Starovoitov      2026-04-12  24286  			ret =3D bpf_op=
t_remove_nops(env);
52875a04f4b26e Jakub Kicinski          2019-01-22  24287  	} else {
70a87ffea8acc3 Alexei Starovoitov      2017-12-25  24288  		if (ret =3D=3D =
0)
9b38c4056b2736 Jakub Kicinski          2018-12-19  24289  			sanitize_dead_=
code(env);
52875a04f4b26e Jakub Kicinski          2019-01-22  24290  	}
70a87ffea8acc3 Alexei Starovoitov      2017-12-25  24291 =20
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  24292  	if (ret =3D=3D 0)
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  24293  		/* program is v=
alid, convert *(u32*)(ctx + off) accesses */
449f08fa59dda5 Alexei Starovoitov      2026-04-12  24294  		ret =3D bpf_con=
vert_ctx_accesses(env);
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  24295 =20
e245c5c6a5656e Alexei Starovoitov      2017-03-15  24296  	if (ret =3D=3D 0)
449f08fa59dda5 Alexei Starovoitov      2026-04-12  24297  		ret =3D bpf_do_=
misc_fixups(env);
e245c5c6a5656e Alexei Starovoitov      2017-03-15  24298 =20
a4b1d3c1ddf6cb Jiong Wang              2019-05-24  24299  	/* do 32-bit opt=
imization after insn patching has done so those patched
a4b1d3c1ddf6cb Jiong Wang              2019-05-24  24300  	 * insns could b=
e handled correctly.
a4b1d3c1ddf6cb Jiong Wang              2019-05-24  24301  	 */
9d03ebc71a027c Stanislav Fomichev      2023-01-19  24302  	if (ret =3D=3D 0=
 && !bpf_prog_is_offloaded(env->prog->aux)) {
449f08fa59dda5 Alexei Starovoitov      2026-04-12  24303  		ret =3D bpf_opt=
_subreg_zext_lo32_rnd_hi32(env, attr);
d6c2308c742a65 Jiong Wang              2019-05-24  24304  		env->prog->aux-=
>verifier_zext =3D bpf_jit_needs_zext() ? !ret
d6c2308c742a65 Jiong Wang              2019-05-24  24305  								     : fa=
lse;
a4b1d3c1ddf6cb Jiong Wang              2019-05-24  24306  	}
a4b1d3c1ddf6cb Jiong Wang              2019-05-24  24307 =20
1ea47e01ad6ea0 Alexei Starovoitov      2017-12-14  24308  	if (ret =3D=3D 0)
449f08fa59dda5 Alexei Starovoitov      2026-04-12  24309  		ret =3D bpf_fix=
up_call_args(env);
1ea47e01ad6ea0 Alexei Starovoitov      2017-12-14  24310 =20
06ee7115b0d174 Alexei Starovoitov      2019-04-01  24311  	env->verificatio=
n_time =3D ktime_get_ns() - start_time;
06ee7115b0d174 Alexei Starovoitov      2019-04-01  24312  	print_verificati=
on_stats(env);
aba64c7da98330 Dave Marchevsky         2021-10-20  24313  	env->prog->aux->=
verified_insns =3D env->insn_processed;
06ee7115b0d174 Alexei Starovoitov      2019-04-01  24314 =20
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24315  	/* preserve orig=
inal error even if log finalization is successful */
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24316  	err =3D bpf_vlog=
_finalize(&env->log, &log_true_size);
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24317  	if (err)
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24318  		ret =3D err;
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24319 =20
47a71c1f9af0a3 Andrii Nakryiko         2023-04-06  24320  	if (uattr_size >=
=3D offsetofend(union bpf_attr, log_true_size) &&
47a71c1f9af0a3 Andrii Nakryiko         2023-04-06  24321  	    copy_to_bpfp=
tr_offset(uattr, offsetof(union bpf_attr, log_true_size),
bdcab4144f5da9 Andrii Nakryiko         2023-04-06  24322  				  &log_true_s=
ize, sizeof(log_true_size))) {
47a71c1f9af0a3 Andrii Nakryiko         2023-04-06  24323  		ret =3D -EFAULT;
47a71c1f9af0a3 Andrii Nakryiko         2023-04-06  24324  		goto err_releas=
e_maps;
47a71c1f9af0a3 Andrii Nakryiko         2023-04-06  24325  	}
cbd35700860492 Alexei Starovoitov      2014-09-26  24326 =20
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24327  	if (ret)
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24328  		goto err_releas=
e_maps;
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24329 =20
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24330  	if (env->used_ma=
p_cnt) {
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24331  		/* if program p=
assed verifier, update used_maps in bpf_prog_info */
69050f8d6d075d Kees Cook               2026-02-20  24332  		env->prog->aux-=
>used_maps =3D kmalloc_objs(env->used_maps[0],
69050f8d6d075d Kees Cook               2026-02-20  24333  							 env->used=
_map_cnt,
43736ec3e02789 Eduard Zingerman        2025-06-13  24334  							 GFP_KERNE=
L_ACCOUNT);
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24335 =20
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  24336  		if (!env->prog-=
>aux->used_maps) {
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24337  			ret =3D -ENOME=
M;
a2a7d570105254 Jakub Kicinski          2017-10-09  24338  			goto err_relea=
se_maps;
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24339  		}
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24340 =20
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  24341  		memcpy(env->pro=
g->aux->used_maps, env->used_maps,
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24342  		       sizeof(e=
nv->used_maps[0]) * env->used_map_cnt);
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  24343  		env->prog->aux-=
>used_map_cnt =3D env->used_map_cnt;
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24344  	}
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24345  	if (env->used_bt=
f_cnt) {
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24346  		/* if program p=
assed verifier, update used_btfs in bpf_prog_aux */
69050f8d6d075d Kees Cook               2026-02-20  24347  		env->prog->aux-=
>used_btfs =3D kmalloc_objs(env->used_btfs[0],
69050f8d6d075d Kees Cook               2026-02-20  24348  							 env->used=
_btf_cnt,
43736ec3e02789 Eduard Zingerman        2025-06-13  24349  							 GFP_KERNE=
L_ACCOUNT);
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24350  		if (!env->prog-=
>aux->used_btfs) {
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24351  			ret =3D -ENOME=
M;
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24352  			goto err_relea=
se_maps;
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24353  		}
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24354 =20
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24355  		memcpy(env->pro=
g->aux->used_btfs, env->used_btfs,
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24356  		       sizeof(e=
nv->used_btfs[0]) * env->used_btf_cnt);
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24357  		env->prog->aux-=
>used_btf_cnt =3D env->used_btf_cnt;
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24358  	}
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24359  	if (env->used_ma=
p_cnt || env->used_btf_cnt) {
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24360  		/* program is v=
alid. Convert pseudo bpf_ld_imm64 into generic
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24361  		 * bpf_ld_imm64=
 instructions
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24362  		 */
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24363  		convert_pseudo_=
ld_imm64(env);
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24364  	}
cbd35700860492 Alexei Starovoitov      2014-09-26  24365 =20
ba64e7d8525236 Yonghong Song           2018-11-24  24366  	adjust_btf_func(=
env);
ba64e7d8525236 Yonghong Song           2018-11-24  24367 =20
a2a7d570105254 Jakub Kicinski          2017-10-09  24368  err_release_maps:
b4ce5923e780d6 Anton Protopopov        2025-11-05  24369  	if (ret)
b4ce5923e780d6 Anton Protopopov        2025-11-05  24370  		release_insn_ar=
rays(env);
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  24371  	if (!env->prog->=
aux->used_maps)
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24372  		/* if we didn't=
 copy map pointers into bpf_prog_info, release
ab7f5bf0928be2 Jakub Kicinski          2018-05-03  24373  		 * them now. Ot=
herwise free_used_maps() will release them.
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24374  		 */
0246e64d9a5fcd Alexei Starovoitov      2014-09-26  24375  		release_maps(en=
v);
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24376  	if (!env->prog->=
aux->used_btfs)
541c3bad8dc51b Andrii Nakryiko         2021-01-11  24377  		release_btfs(en=
v);
03f87c0b45b177 Toke H=C3=B8iland-J=C3=B8rgensen  2020-04-24  24378 =20
03f87c0b45b177 Toke H=C3=B8iland-J=C3=B8rgensen  2020-04-24  24379  	/* ext=
ension progs temporarily inherit the attach_type of their targets
03f87c0b45b177 Toke H=C3=B8iland-J=C3=B8rgensen  2020-04-24  24380  	   for=
 verification purposes, so set it back to zero before returning
03f87c0b45b177 Toke H=C3=B8iland-J=C3=B8rgensen  2020-04-24  24381  	 */
03f87c0b45b177 Toke H=C3=B8iland-J=C3=B8rgensen  2020-04-24  24382  	if (en=
v->prog->type =3D=3D BPF_PROG_TYPE_EXT)
03f87c0b45b177 Toke H=C3=B8iland-J=C3=B8rgensen  2020-04-24  24383  		env->=
prog->expected_attach_type =3D 0;
03f87c0b45b177 Toke H=C3=B8iland-J=C3=B8rgensen  2020-04-24  24384 =20
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  24385  	*prog =3D env->p=
rog;
e3f87fdfed7b77 Kui-Feng Lee            2024-01-19  24386 =20
e3f87fdfed7b77 Kui-Feng Lee            2024-01-19  24387  	module_put(env->=
attach_btf_mod);
3df126f35f88dc Jakub Kicinski          2016-09-21  24388  err_unlock:
45a73c17bfb92c Alexei Starovoitov      2019-04-19  24389  	if (!is_priv)
cbd35700860492 Alexei Starovoitov      2014-09-26  24390  		mutex_unlock(&b=
pf_verifier_lock);
449f08fa59dda5 Alexei Starovoitov      2026-04-12  24391  	bpf_clear_insn_a=
ux_data(env, 0, env->prog->len);
3df126f35f88dc Jakub Kicinski          2016-09-21  24392  	vfree(env->insn_=
aux_data);
3df126f35f88dc Jakub Kicinski          2016-09-21  24393  err_free_env:
e41c237953b36c Eduard Zingerman        2025-09-18  24394  	bpf_stack_livene=
ss_free(env);
14c8552db64476 Eduard Zingerman        2025-03-04  24395  	kvfree(env->cfg.=
insn_postorder);
c9e31900b54cad Eduard Zingerman        2025-06-11  24396  	kvfree(env->scc_=
info);
2f69c568542730 Anton Protopopov        2025-10-19  24397  	kvfree(env->succ=
);
493d9e0d608339 Anton Protopopov        2025-11-05  24398  	kvfree(env->goto=
x_tmp_buf);
434247637c66e1 Rik van Riel            2024-10-08  24399  	kvfree(env);
51580e798cb61b Alexei Starovoitov      2014-09-26 @24400  	return ret;

:::::: The code at line 24400 was first introduced by commit
:::::: 51580e798cb61b0fc63fa3aa6c5c975375aa0550 bpf: verifier (add docs)

:::::: TO: Alexei Starovoitov <ast@plumgrid.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
