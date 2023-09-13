Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E7B1E51A
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694605038; x=1726141038;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TMZqTO0qV/Vc/1t/X933abdVgbM4sv3N0wKPJmPMBrE=;
  b=JnKo4A9S5gcfteCddNzBOup3ujxyb74N2KHcZL8MZF5OlZDlKVIDttxO
   IpIodg9Z4JOaO7pBMzrwiaZOavfOBewX+lN0QId89hIJSiq+0Yxy/4wXZ
   WEuw594v9EGGL7/FoTUpLVzeb7bXfYo6GtgqegL1716WPrYILNwvnWX1k
   WFd11+kzQGY4mkmvEcmt1/0dtr6QiV1wlOvx6K5DvVJ3xexvPt418Lg7O
   UJYXkgYd+tUcT0hHB6ly2A6r0LhljHRqr2U6ENSmenITrCicDdj5w3Fm9
   MWZUmfMK56HRtycviVzNEBWGknzvXslHFahS8vr0+eJzgxK+Z5orrdFw2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381326073"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="381326073"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 04:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="814204005"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="814204005"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2023 04:37:16 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgOBG-0000S5-1h;
	Wed, 13 Sep 2023 11:37:14 +0000
Date: Wed, 13 Sep 2023 19:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4799/4965] kernel/bpf/verifier.c:19778
 check_attach_btf_id() error: 'tr' dereferencing possible ERR_PTR()
Message-ID: <202309131936.5Nc8eUD0-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Leon Hwang <hffilwlqm@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e143016b56ecb0fcda5bb6026b0a25fe55274f56
commit: 2b5dcb31a19a2e0acd869b12c9db9b2d696ef544 [4799/4965] bpf, x64: Fix tailcall infinite loop
:::::: branch date: 6 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131936.5Nc8eUD0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309131936.5Nc8eUD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309131936.5Nc8eUD0-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:19778 check_attach_btf_id() error: 'tr' dereferencing possible ERR_PTR()

vim +/tr +19778 kernel/bpf/verifier.c

700e6f853eb397 Jiri Olsa              2023-01-17  19699  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19700  static int check_attach_btf_id(struct bpf_verifier_env *env)
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19701  {
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19702  	struct bpf_prog *prog = env->prog;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  19703  	struct bpf_prog *tgt_prog = prog->aux->dst_prog;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19704  	struct bpf_attach_target_info tgt_info = {};
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19705  	u32 btf_id = prog->aux->attach_btf_id;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19706  	struct bpf_trampoline *tr;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19707  	int ret;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19708  	u64 key;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19709  
79a7f8bdb159d9 Alexei Starovoitov     2021-05-13  19710  	if (prog->type == BPF_PROG_TYPE_SYSCALL) {
79a7f8bdb159d9 Alexei Starovoitov     2021-05-13  19711  		if (prog->aux->sleepable)
79a7f8bdb159d9 Alexei Starovoitov     2021-05-13  19712  			/* attach_btf_id checked to be zero already */
79a7f8bdb159d9 Alexei Starovoitov     2021-05-13  19713  			return 0;
79a7f8bdb159d9 Alexei Starovoitov     2021-05-13  19714  		verbose(env, "Syscall programs can only be sleepable\n");
79a7f8bdb159d9 Alexei Starovoitov     2021-05-13  19715  		return -EINVAL;
79a7f8bdb159d9 Alexei Starovoitov     2021-05-13  19716  	}
79a7f8bdb159d9 Alexei Starovoitov     2021-05-13  19717  
700e6f853eb397 Jiri Olsa              2023-01-17  19718  	if (prog->aux->sleepable && !can_be_sleepable(prog)) {
1e12d3ef47d228 David Vernet           2023-01-25  19719  		verbose(env, "Only fentry/fexit/fmod_ret, lsm, iter, uprobe, and struct_ops programs can be sleepable\n");
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19720  		return -EINVAL;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19721  	}
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19722  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19723  	if (prog->type == BPF_PROG_TYPE_STRUCT_OPS)
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19724  		return check_struct_ops_btf_id(env);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19725  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19726  	if (prog->type != BPF_PROG_TYPE_TRACING &&
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19727  	    prog->type != BPF_PROG_TYPE_LSM &&
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19728  	    prog->type != BPF_PROG_TYPE_EXT)
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19729  		return 0;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19730  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19731  	ret = bpf_check_attach_target(&env->log, prog, tgt_prog, btf_id, &tgt_info);
18644cec714aab Alexei Starovoitov     2020-05-28  19732  	if (ret)
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19733  		return ret;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19734  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19735  	if (tgt_prog && prog->type == BPF_PROG_TYPE_EXT) {
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  19736  		/* to make freplace equivalent to their targets, they need to
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  19737  		 * inherit env->ops and expected_attach_type for the rest of the
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  19738  		 * verification
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  19739  		 */
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19740  		env->ops = bpf_verifier_ops[tgt_prog->type];
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19741  		prog->expected_attach_type = tgt_prog->expected_attach_type;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19742  	}
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19743  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19744  	/* store info about the attachment target that will be used later */
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19745  	prog->aux->attach_func_proto = tgt_info.tgt_type;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19746  	prog->aux->attach_func_name = tgt_info.tgt_name;
31bf1dbccfb0a9 Viktor Malik           2023-03-10  19747  	prog->aux->mod = tgt_info.tgt_mod;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19748  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  19749  	if (tgt_prog) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  19750  		prog->aux->saved_dst_prog_type = tgt_prog->type;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  19751  		prog->aux->saved_dst_attach_type = tgt_prog->expected_attach_type;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  19752  	}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  19753  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19754  	if (prog->expected_attach_type == BPF_TRACE_RAW_TP) {
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19755  		prog->aux->attach_btf_trace = true;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19756  		return 0;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19757  	} else if (prog->expected_attach_type == BPF_TRACE_ITER) {
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19758  		if (!bpf_iter_prog_supported(prog))
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19759  			return -EINVAL;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19760  		return 0;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19761  	}
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19762  
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19763  	if (prog->type == BPF_PROG_TYPE_LSM) {
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19764  		ret = bpf_lsm_verify_prog(&env->log, prog);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19765  		if (ret < 0)
fec56f5890d93f Alexei Starovoitov     2019-11-14  19766  			return ret;
35e3815fa8102f Jiri Olsa              2021-04-29  19767  	} else if (prog->type == BPF_PROG_TYPE_TRACING &&
35e3815fa8102f Jiri Olsa              2021-04-29  19768  		   btf_id_set_contains(&btf_id_deny, btf_id)) {
35e3815fa8102f Jiri Olsa              2021-04-29  19769  		return -EINVAL;
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  19770  	}
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19771  
22dc4a0f5ed11b Andrii Nakryiko        2020-12-03  19772  	key = bpf_trampoline_compute_key(tgt_prog, prog->aux->attach_btf, btf_id);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19773  	tr = bpf_trampoline_get(key, &tgt_info);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19774  	if (!tr)
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19775  		return -ENOMEM;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19776  
2b5dcb31a19a2e Leon Hwang             2023-09-12  19777  	if (tgt_prog && tgt_prog->aux->tail_call_reachable)
2b5dcb31a19a2e Leon Hwang             2023-09-12 @19778  		tr->flags = BPF_TRAMP_F_TAIL_CALL_CTX;
2b5dcb31a19a2e Leon Hwang             2023-09-12  19779  
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  19780  	prog->aux->dst_trampoline = tr;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19781  	return 0;
38207291604401 Martin KaFai Lau       2019-10-24  19782  }
38207291604401 Martin KaFai Lau       2019-10-24  19783  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
