Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965066;
	b=RjT/xphWqLYj2vKMAMQoHa35z8xaW1oq4jVGRZ8zWCxPwfQKc9wbQnXHYI+P0PHOSBRz
	 zUKdJyD9yC5OkgHKh5bGVAoV24KyJaoRlF7XXnGv1qB+2n6qH3J5GuHDE+oFFYXNRivdb
	 iDIKBuSkhD0UHX4o612wZzUdx+nUbjGcrxWxgM1yElQ5fNF+NKFkh35vYfknVmWmDXtwE
	 TBl6L8UPr2dT5jeo6DJQwtHknYMWjGFADT9w+Welar+0n16742JU2YDGbPm6uIWLbfbIW
	 gjF+9DGMHpTvlIbWXX5H/L7+7Ic33loMWDkaeALq3a05AHe8rHIgneGlWtCTlyqxYiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965066;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=V8n0mfoBByeXoJHOCCMCKyNzXC1cfkh8eyRzUal17tg=;
	b=BQerAedpp4xdkBlJsniJTAgqbv5oR4BqesotiyPJNyA2gAqgUn21C0OfDwg1LXbylgcW
	 xgh1QbXvx3T2oHGZ2o/jgr/aBDyOmWYDlINSfXUjRbDKsK2XrJcOyVM5FMWFmeC68t7n5
	 fNyKsdwETiU8Oc/0/0QYOObxgalcMiGINCr1PvqbmTgyqATvrCYvCzVdBBKsba0eneAHG
	 +UiTLJ6gExTGkwC/6ERAt9howIV31JfEs3OJOMsRXBKHdR8SFztTytsuTe/D10GH9vbNw
	 N5MukJ9x8ALVKKyF5/rixtEEB+WuTXyX/35odtFohcx+/z7w9zn2PVEeDjuNdaSHThA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RS7Z10UK;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11327606A33C
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 11:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11327606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RS7Z10UK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793965065; x=1825501065;
  h=date:from:to:cc:subject:message-id;
  bh=sqnVZ14CV7LEdL1Dun6O3dS2oWnrmBR5EDI+M2CcE68=;
  b=RS7Z10UKCr8FD0QJjc6l2kQrkzkvtfbVrZGw2gw8MydfSGe8skNPRnjt
   BgSkNjl58om416iE1xajNymc0c3zi4qzaKv0cy5IAUel2errm8JosfigG
   zfnu2cylFgZtcOsUEQNDUtwysQmLlbxsgze5rRSMFYAJrCLY2MX1FEYwj
   8nRxEj1xv/n2oFcq9sD4+5DA98lvo9zaFElhddrcu+rmo92Fj88ljw7jC
   69uIVCsDXUBNDt/pa6PDPpEdzoDmp5BpDmhhT5J9AqtuZ/Gb8EtLmFoxm
   iqXn+vm5dBIMW1K3zbPLcCj9MYk6pJlyWxP8dfZ6qdW0frLQkGnLpaMtk
   A==;
X-CSE-ConnectionGUID: EgBimjvsSn+6uxN87e0IVg==
X-CSE-MsgGUID: aX04yHhhQlG4BcU9+0Gbsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2807602"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2807602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 03:37:44 -0800
X-CSE-ConnectionGUID: HCNxEtX5Rqu2RRgeamKPxQ==
X-CSE-MsgGUID: Q+y9+ZDXRCK5zeCeg+OEQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7124843"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2026 03:37:43 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPIGK-00000000AER-13dy;
	Fri, 06 Nov 2026 11:37:40 +0000
Date: Fri, 06 Nov 2026 12:37:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 3743/4145]
 kernel/bpf/verifier.c:6161:6-7: ERROR: iterator variable bound on line 6117
 cannot be NULL
Message-ID: <202611061232.EN7hTOoR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
commit: abbf6b7c6626abfbce5bfd2cf2801aca9259c070 [3743/4145] bpf: Use the call graph to compute the depth of chains of calls
:::::: branch date: 21 hours ago
:::::: commit date: 34 hours ago
config: arm-randconfig-r2109-20261106 (https://download.01.org/0day-ci/archive/20261106/202611061232.EN7hTOoR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611061232.EN7hTOoR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/verifier.c:6161:6-7: ERROR: iterator variable bound on line 6117 cannot be NULL

vim +6161 kernel/bpf/verifier.c

ad95d3c758d875 Emil Tsalapatis         2026-03-16  6105  
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6106  static int check_call_depth(struct bpf_verifier_env *env, struct bpf_call_graph *cg)
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6107  {
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6108  	struct bpf_subprog_info *si = env->subprog_info;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6109  	struct bpf_subprog_call_depth_info *dinfo;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6110  	int depth, total, tmp, s, err;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6111  
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6112  	dinfo = kvzalloc_objs(*dinfo, cg->cnt, GFP_KERNEL_ACCOUNT);
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6113  	if (!dinfo)
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6114  		return -ENOMEM;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6115  	compute_call_depth(env, cg, dinfo);
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6116  
abbf6b7c6626ab Alexei Starovoitov      2026-11-04 @6117  	for_each_set_bit(s, cg->live, cg->cnt) {
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6118  		/* A caller of it is over a limit. That one is reported, not what it calls. */
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6119  		if (dinfo[s].frame > MAX_CALL_FRAMES || dinfo[s].depth > env->stack_limit ||
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6120  		    dinfo[s].arena_depth > BPF_ARENA_STACK_MAX)
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6121  			continue;
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  6122  
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6123  		err = -E2BIG;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6124  		if (dinfo[s].frame >= MAX_CALL_FRAMES) {
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6125  			verbose(env, "the call stack of %d frames is too deep !\n",
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6126  				dinfo[s].frame);
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6127  			goto out;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6128  		}
e7d28823c66212 Kumar Kartikeya Dwivedi 2026-09-03  6129  
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6130  		err = -EACCES;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6131  		depth = dinfo[s].arena_depth + si[s].arena_stack_depth;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6132  		if (depth > env->max_arena_stack_depth)
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6133  			env->max_arena_stack_depth = depth;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6134  		if (depth > BPF_ARENA_STACK_MAX) {
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6135  			verbose(env, "combined size of the frames in the stack in arena is %d. Too large\n",
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6136  				depth);
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6137  			goto out;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6138  		}
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6139  
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6140  		/*
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6141  		 * protect against potential stack overflow that might happen when
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6142  		 * bpf2bpf calls get combined with tailcalls. Limit the caller's stack
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6143  		 * depth for such case down to 256 so that the worst case scenario
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6144  		 * would result in 8k stack size (32 which is tailcall limit * 256 =
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6145  		 * 8k).
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6146  		 *
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6147  		 * To get the idea what might happen, see an example:
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6148  		 * func1 -> sub rsp, 128
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6149  		 *  subfunc1 -> sub rsp, 256
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6150  		 *  tailcall1 -> add rsp, 256
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6151  		 *   func2 -> sub rsp, 192 (total stack size = 128 + 192 = 320)
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6152  		 *   subfunc2 -> sub rsp, 64
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6153  		 *   subfunc22 -> sub rsp, 128
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6154  		 *   tailcall2 -> add rsp, 128
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6155  		 *    func3 -> sub rsp, 32 (total stack size 128 + 192 + 64 + 32 = 416)
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6156  		 *
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6157  		 * tailcall will unwind the current stack frame but it will not get rid
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6158  		 * of caller's stack as shown on the example above.
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6159  		 */
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6160  		depth = dinfo[s].depth;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04 @6161  		if (s && si[s].has_tail_call && depth >= 256) {
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6162  			verbose(env,
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6163  				"tail_calls are not allowed when call stack of previous frames is %d bytes. Too large\n",
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6164  				depth);
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6165  			goto out;
7f6e4312e15a5c Maciej Fijalkowski      2020-09-16  6166  		}
a76ab5731e32d5 Yonghong Song           2024-11-12  6167  
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6168  		if (si[s].priv_stack_mode == PRIV_STACK_ADAPTIVE) {
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6169  			depth = round_up_stack_depth(env, si[s].stack_depth);
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6170  			if (depth > env->max_stack_depth)
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6171  				env->max_stack_depth = depth;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6172  			if (depth > env->stack_limit) {
a76ab5731e32d5 Yonghong Song           2024-11-12  6173  				verbose(env, "stack size of subprog %d is %d. Too large\n",
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6174  					s, depth);
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6175  				goto out;
a76ab5731e32d5 Yonghong Song           2024-11-12  6176  			}
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6177  			continue;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6178  		}
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6179  		depth = dinfo[s].depth + subprog_stack_size(env, s);
f41f34ec64748e Paul Chaignon           2026-05-13  6180  		if (depth > env->max_stack_depth)
f41f34ec64748e Paul Chaignon           2026-05-13  6181  			env->max_stack_depth = depth;
9cfc28c9a8e621 Kumar Kartikeya Dwivedi 2026-09-24  6182  		if (depth > env->stack_limit) {
ad95d3c758d875 Emil Tsalapatis         2026-03-16  6183  			total = 0;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6184  			for (tmp = s; tmp >= 0; tmp = dinfo[tmp].caller)
ad95d3c758d875 Emil Tsalapatis         2026-03-16  6185  				total++;
ad95d3c758d875 Emil Tsalapatis         2026-03-16  6186  
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  6187  			verbose(env, "combined stack size of %d calls is %d. Too large\n",
ad95d3c758d875 Emil Tsalapatis         2026-03-16  6188  				total, depth);
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6189  			goto out;
70a87ffea8acc3 Alexei Starovoitov      2017-12-25  6190  		}
70a87ffea8acc3 Alexei Starovoitov      2017-12-25  6191  	}
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6192  	err = 0;
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6193  out:
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6194  	kvfree(dinfo);
abbf6b7c6626ab Alexei Starovoitov      2026-11-04  6195  	return err;
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  6196  }
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  6197  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
