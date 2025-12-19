Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4370D1D86FF
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 20:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766174540; cv=none; b=TKr3VkvYh+o3uO+EJZNeR1fxtb1S9H20cX8qC0bsciqZ/Eh9w72CltkLCn5dUh+X2hNKAmegpbdzp/CW49xDKs1SO9mGFWalu8RRmKWBgjRwzIfZQmZ502hYNKWUq5kjNjk7PjwIGlaR0uyGgSvk6mo2NFzl3Fhgy6/3vHHbxXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766174540; c=relaxed/simple;
	bh=TLTFyIImEvPr+pIW02bKvwCGJ1Ds5nK5V3ZQL3PuU4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jYy4Hw6MHpNxtIVOh2c6y5hLgSOLt8+sBzjEWQbHhzizTQ+DdGYfjCCx83kaM9e3o2hEsLhI4WtvAZFziVZ+O+jslsXmtb/hQkmtwY5UFI/So2qFh8HvywuD5FYIwFnGfkvtpA3xjp2FXF4UesFSvbungZ10yhxR5Tex9J6fCBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMc/GMET; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMc/GMET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766174538; x=1797710538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TLTFyIImEvPr+pIW02bKvwCGJ1Ds5nK5V3ZQL3PuU4w=;
  b=AMc/GMETyz9FBKVhL28LwrFmU8mfEe0XbjIRpRBm3ibeWqWdUVpmGw0k
   KwyOjdOQ2NjABvXL5FPAtU6701w/j6RLn2WGUwXzMFr8/CLG1D7x4NyoA
   1FxgOSgzcj8lwO7SNd31Mmz4cHRrb9fvpfNOD/UEfrEdpxCRgW/zm9rKw
   wWgf9lLQcNXQazX9B+36QAGKorJYYp57eBZqLSUDEVgSq4J0BA4fW2y6X
   T2I4zHhMwvsLwCQOJ94xy6sCsMaUBsH0izijfqx/q+EPOFX8etsf2XOxV
   C9yeIsAQl+9lPtDwBw3W/vkKa9AebjBBRpleQRPFPTLc5Qj5KGnLq5o/F
   Q==;
X-CSE-ConnectionGUID: +NtGX/gpQD+4N26t5Q3dCA==
X-CSE-MsgGUID: XLLHUnlZSm+ABZIf/HvcHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71984848"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="71984848"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 12:02:17 -0800
X-CSE-ConnectionGUID: ecL1iQG6ToibpgtLVqDI6Q==
X-CSE-MsgGUID: wcTD9Y17S629yt7s1JrAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198098132"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Dec 2025 12:02:13 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWgfy-000000003x3-2ByT;
	Fri, 19 Dec 2025 20:02:10 +0000
Date: Sat, 20 Dec 2025 04:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 43/43]
 kernel/bpf/verifier.c:13180 resolve_pseudo_ldimm64() warn: fd re-used after
 fget(): 'fd'
Message-ID: <202512200437.NUbAJaxx-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 77fe00227f2e2613299cafb71ce68d84b50712d6 [43/43] bpf: Fix a verifier verbose message
:::::: branch date: 34 hours ago
:::::: commit date: 1 year, 7 months ago
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251220/202512200437.NUbAJaxx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512200437.NUbAJaxx-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:13180 resolve_pseudo_ldimm64() warn: fd re-used after fget(): 'fd'

vim +/fd +13180 kernel/bpf/verifier.c

b741f1630346de Roman Gushchin     2018-09-28  13086  
4976b718c3551f Hao Luo            2020-09-29  13087  /* find and rewrite pseudo imm in ld_imm64 instructions:
4976b718c3551f Hao Luo            2020-09-29  13088   *
4976b718c3551f Hao Luo            2020-09-29  13089   * 1. if it accesses map FD, replace it with actual map pointer.
4976b718c3551f Hao Luo            2020-09-29  13090   * 2. if it accesses btf_id of a VAR, replace it with pointer to the var.
4976b718c3551f Hao Luo            2020-09-29  13091   *
4976b718c3551f Hao Luo            2020-09-29  13092   * NOTE: btf_vmlinux is required for converting pseudo btf_id.
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13093   */
4976b718c3551f Hao Luo            2020-09-29  13094  static int resolve_pseudo_ldimm64(struct bpf_verifier_env *env)
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13095  {
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13096  	struct bpf_insn *insn = env->prog->insnsi;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13097  	int insn_cnt = env->prog->len;
fdc15d388d600d Alexei Starovoitov 2016-09-01  13098  	int i, j, err;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13099  
f1f7714ea51c56 Daniel Borkmann    2017-01-13  13100  	err = bpf_prog_calc_tag(env->prog);
aafe6ae9cee32d Daniel Borkmann    2016-12-18  13101  	if (err)
aafe6ae9cee32d Daniel Borkmann    2016-12-18  13102  		return err;
aafe6ae9cee32d Daniel Borkmann    2016-12-18  13103  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13104  	for (i = 0; i < insn_cnt; i++, insn++) {
9bac3d6d548e5c Alexei Starovoitov 2015-03-13  13105  		if (BPF_CLASS(insn->code) == BPF_LDX &&
d691f9e8d4405c Alexei Starovoitov 2015-06-04  13106  		    (BPF_MODE(insn->code) != BPF_MEM || insn->imm != 0)) {
61bd5218eef349 Jakub Kicinski     2017-10-09  13107  			verbose(env, "BPF_LDX uses reserved fields\n");
d691f9e8d4405c Alexei Starovoitov 2015-06-04  13108  			return -EINVAL;
d691f9e8d4405c Alexei Starovoitov 2015-06-04  13109  		}
d691f9e8d4405c Alexei Starovoitov 2015-06-04  13110  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13111  		if (insn[0].code == (BPF_LD | BPF_IMM | BPF_DW)) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13112  			struct bpf_insn_aux_data *aux;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13113  			struct bpf_map *map;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13114  			struct fd f;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13115  			u64 addr;
387544bfa291a2 Alexei Starovoitov 2021-05-13  13116  			u32 fd;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13117  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13118  			if (i == insn_cnt - 1 || insn[1].code != 0 ||
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13119  			    insn[1].dst_reg != 0 || insn[1].src_reg != 0 ||
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13120  			    insn[1].off != 0) {
61bd5218eef349 Jakub Kicinski     2017-10-09  13121  				verbose(env, "invalid bpf_ld_imm64 insn\n");
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13122  				return -EINVAL;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13123  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13124  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13125  			if (insn[0].src_reg == 0)
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13126  				/* valid generic load 64-bit imm */
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13127  				goto next_insn;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13128  
4976b718c3551f Hao Luo            2020-09-29  13129  			if (insn[0].src_reg == BPF_PSEUDO_BTF_ID) {
4976b718c3551f Hao Luo            2020-09-29  13130  				aux = &env->insn_aux_data[i];
4976b718c3551f Hao Luo            2020-09-29  13131  				err = check_pseudo_btf_id(env, insn, aux);
4976b718c3551f Hao Luo            2020-09-29  13132  				if (err)
4976b718c3551f Hao Luo            2020-09-29  13133  					return err;
4976b718c3551f Hao Luo            2020-09-29  13134  				goto next_insn;
4976b718c3551f Hao Luo            2020-09-29  13135  			}
4976b718c3551f Hao Luo            2020-09-29  13136  
69c087ba6225b5 Yonghong Song      2021-02-26  13137  			if (insn[0].src_reg == BPF_PSEUDO_FUNC) {
69c087ba6225b5 Yonghong Song      2021-02-26  13138  				aux = &env->insn_aux_data[i];
69c087ba6225b5 Yonghong Song      2021-02-26  13139  				aux->ptr_type = PTR_TO_FUNC;
69c087ba6225b5 Yonghong Song      2021-02-26  13140  				goto next_insn;
69c087ba6225b5 Yonghong Song      2021-02-26  13141  			}
69c087ba6225b5 Yonghong Song      2021-02-26  13142  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13143  			/* In final convert_pseudo_ld_imm64() step, this is
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13144  			 * converted into regular 64-bit imm load insn.
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13145  			 */
387544bfa291a2 Alexei Starovoitov 2021-05-13  13146  			switch (insn[0].src_reg) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  13147  			case BPF_PSEUDO_MAP_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  13148  			case BPF_PSEUDO_MAP_IDX_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  13149  				break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  13150  			case BPF_PSEUDO_MAP_FD:
387544bfa291a2 Alexei Starovoitov 2021-05-13  13151  			case BPF_PSEUDO_MAP_IDX:
387544bfa291a2 Alexei Starovoitov 2021-05-13  13152  				if (insn[1].imm == 0)
387544bfa291a2 Alexei Starovoitov 2021-05-13  13153  					break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  13154  				fallthrough;
387544bfa291a2 Alexei Starovoitov 2021-05-13  13155  			default:
387544bfa291a2 Alexei Starovoitov 2021-05-13  13156  				verbose(env, "unrecognized bpf_ld_imm64 insn\n");
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13157  				return -EINVAL;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13158  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13159  
387544bfa291a2 Alexei Starovoitov 2021-05-13  13160  			switch (insn[0].src_reg) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  13161  			case BPF_PSEUDO_MAP_IDX_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  13162  			case BPF_PSEUDO_MAP_IDX:
387544bfa291a2 Alexei Starovoitov 2021-05-13  13163  				if (bpfptr_is_null(env->fd_array)) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  13164  					verbose(env, "fd_idx without fd_array is invalid\n");
387544bfa291a2 Alexei Starovoitov 2021-05-13  13165  					return -EPROTO;
387544bfa291a2 Alexei Starovoitov 2021-05-13  13166  				}
387544bfa291a2 Alexei Starovoitov 2021-05-13  13167  				if (copy_from_bpfptr_offset(&fd, env->fd_array,
387544bfa291a2 Alexei Starovoitov 2021-05-13  13168  							    insn[0].imm * sizeof(fd),
387544bfa291a2 Alexei Starovoitov 2021-05-13  13169  							    sizeof(fd)))
387544bfa291a2 Alexei Starovoitov 2021-05-13  13170  					return -EFAULT;
387544bfa291a2 Alexei Starovoitov 2021-05-13  13171  				break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  13172  			default:
387544bfa291a2 Alexei Starovoitov 2021-05-13  13173  				fd = insn[0].imm;
387544bfa291a2 Alexei Starovoitov 2021-05-13  13174  				break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  13175  			}
387544bfa291a2 Alexei Starovoitov 2021-05-13  13176  
387544bfa291a2 Alexei Starovoitov 2021-05-13  13177  			f = fdget(fd);
c210129760a010 Daniel Borkmann    2015-10-29  13178  			map = __bpf_map_get(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13179  			if (IS_ERR(map)) {
77fe00227f2e26 Anton Protopopov   2024-04-12 @13180  				verbose(env, "fd %d is not pointing to valid bpf_map\n", fd);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13181  				return PTR_ERR(map);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13182  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13183  
61bd5218eef349 Jakub Kicinski     2017-10-09  13184  			err = check_map_prog_compatibility(env, map, env->prog);
fdc15d388d600d Alexei Starovoitov 2016-09-01  13185  			if (err) {
fdc15d388d600d Alexei Starovoitov 2016-09-01  13186  				fdput(f);
fdc15d388d600d Alexei Starovoitov 2016-09-01  13187  				return err;
fdc15d388d600d Alexei Starovoitov 2016-09-01  13188  			}
fdc15d388d600d Alexei Starovoitov 2016-09-01  13189  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13190  			aux = &env->insn_aux_data[i];
387544bfa291a2 Alexei Starovoitov 2021-05-13  13191  			if (insn[0].src_reg == BPF_PSEUDO_MAP_FD ||
387544bfa291a2 Alexei Starovoitov 2021-05-13  13192  			    insn[0].src_reg == BPF_PSEUDO_MAP_IDX) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13193  				addr = (unsigned long)map;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13194  			} else {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13195  				u32 off = insn[1].imm;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13196  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13197  				if (off >= BPF_MAX_VAR_OFF) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13198  					verbose(env, "direct value offset of %u is not allowed\n", off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13199  					fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13200  					return -EINVAL;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13201  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13202  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13203  				if (!map->ops->map_direct_value_addr) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13204  					verbose(env, "no direct value access support for this map type\n");
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13205  					fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13206  					return -EINVAL;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13207  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13208  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13209  				err = map->ops->map_direct_value_addr(map, &addr, off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13210  				if (err) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13211  					verbose(env, "invalid access to map value pointer, value_size=%u off=%u\n",
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13212  						map->value_size, off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13213  					fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13214  					return err;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13215  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13216  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13217  				aux->map_off = off;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13218  				addr += off;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13219  			}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13220  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13221  			insn[0].imm = (u32)addr;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13222  			insn[1].imm = addr >> 32;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13223  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13224  			/* check whether we recorded this map already */
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13225  			for (j = 0; j < env->used_map_cnt; j++) {
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13226  				if (env->used_maps[j] == map) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13227  					aux->map_index = j;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13228  					fdput(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13229  					goto next_insn;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13230  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13231  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13232  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13233  			if (env->used_map_cnt >= MAX_USED_MAPS) {
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13234  				fdput(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13235  				return -E2BIG;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13236  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13237  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13238  			/* hold the map. If the program is rejected by verifier,
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13239  			 * the map will be released by release_maps() or it
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13240  			 * will be used by the valid program until it's unloaded
ab7f5bf0928be2 Jakub Kicinski     2018-05-03  13241  			 * and all maps are released in free_used_maps()
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13242  			 */
1e0bd5a091e5d9 Andrii Nakryiko    2019-11-17  13243  			bpf_map_inc(map);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13244  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  13245  			aux->map_index = env->used_map_cnt;
92117d8443bc5a Alexei Starovoitov 2016-04-27  13246  			env->used_maps[env->used_map_cnt++] = map;
92117d8443bc5a Alexei Starovoitov 2016-04-27  13247  
b741f1630346de Roman Gushchin     2018-09-28  13248  			if (bpf_map_is_cgroup_storage(map) &&
e47304232b3733 Daniel Borkmann    2019-12-17  13249  			    bpf_cgroup_storage_assign(env->prog->aux, map)) {
b741f1630346de Roman Gushchin     2018-09-28  13250  				verbose(env, "only one cgroup storage of each type is allowed\n");
de9cbbaadba5ad Roman Gushchin     2018-08-02  13251  				fdput(f);
de9cbbaadba5ad Roman Gushchin     2018-08-02  13252  				return -EBUSY;
de9cbbaadba5ad Roman Gushchin     2018-08-02  13253  			}
de9cbbaadba5ad Roman Gushchin     2018-08-02  13254  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13255  			fdput(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13256  next_insn:
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13257  			insn++;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13258  			i++;
5e581dad4fec0e Daniel Borkmann    2018-01-26  13259  			continue;
5e581dad4fec0e Daniel Borkmann    2018-01-26  13260  		}
5e581dad4fec0e Daniel Borkmann    2018-01-26  13261  
5e581dad4fec0e Daniel Borkmann    2018-01-26  13262  		/* Basic sanity check before we invest more work here. */
5e581dad4fec0e Daniel Borkmann    2018-01-26  13263  		if (!bpf_opcode_in_insntable(insn->code)) {
5e581dad4fec0e Daniel Borkmann    2018-01-26  13264  			verbose(env, "unknown opcode %02x\n", insn->code);
5e581dad4fec0e Daniel Borkmann    2018-01-26  13265  			return -EINVAL;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13266  		}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13267  	}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13268  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13269  	/* now all pseudo BPF_LD_IMM64 instructions load valid
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13270  	 * 'struct bpf_map *' into a register instead of user map_fd.
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13271  	 * These pointers will be used later by verifier to validate map access.
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13272  	 */
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13273  	return 0;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13274  }
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  13275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
