Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07771757D
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Aug 2024 06:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722579066; cv=none; b=HX4iUt2dC8iEa23NzKSA3/NXnQ6lVhw0emG0/oPys+OnBr/L2AULsm11TsDz9aFrPoEHXiMA14VJB1XULZlrfvvafCikfXiFCdxqFm6QT7kGvb6ml6xRwQI7FAG9xOZ6usdBd//96OAxG2VhkBDHkqBolDVFfGEosYjJFVnmYVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722579066; c=relaxed/simple;
	bh=Ow2SzV4nfcRoFGEzo31AfLElRwyVdHb3My1ys+O0kGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qcgqitz4BTaVE6Je1Wi5pZglyYkuYY8QW67Ve9jc1YbiZ1T/0DA006WJVdynl0ooTeEoCLDyloaaEdeoJJ08nZfYomNEFBmAJf83qUm8bqSNLLx5cGlCgoOh8b1GmHeZ2XgHsDImvb2AbYS/agjZVVpWHQZg8YV2gIXNOGwIn1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnPR7V1l; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnPR7V1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722579064; x=1754115064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ow2SzV4nfcRoFGEzo31AfLElRwyVdHb3My1ys+O0kGE=;
  b=bnPR7V1lodoiUoJURTFjeESyGLPrfLUfXjk2IWmZ9mMbSRzOyPSYnvTq
   lNI55Ms5FB0M8RB0vrIODmymUaZgHp39bX+0lQMQOtlOq7IJYpTwkwrWl
   78Z6+LPkZVyuz6/DoRkPGOHkNJXE9pFDn4bhLaKTD0yPD14C1Vc1J3PWi
   RDo3nUacZTFHFn6KqbcBUii2Te0Flz8mrgl3K0L+XSMmJ1vWG7gHdUT9c
   hR1FzZoWnn1eOSt9ZHlO4G5wMzO2b5rTKKEhjQdlrQatV2sfheejiAF/W
   68AqOwwMau1cmGeivngbxD7lsyzt1nsmRl8u24RzKFpppPEsn7wR6NBnz
   Q==;
X-CSE-ConnectionGUID: H97t6xpZQLW9cm0VzrkBrg==
X-CSE-MsgGUID: 8ujCsOFJS9u2LVSCqdk28g==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31157446"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="31157446"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 23:11:03 -0700
X-CSE-ConnectionGUID: Wvn2631KTNaEQmPu/lFcbw==
X-CSE-MsgGUID: T8eJqSlyRmuhIW7Y+6EB0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="85877715"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Aug 2024 23:11:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZlVD-000wVI-0K;
	Fri, 02 Aug 2024 06:10:59 +0000
Date: Fri, 2 Aug 2024 14:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [viro-vfs:work.fd 17/39] kernel/bpf/verifier.c:18476
 do_one_ldimm64() warn: fd re-used after fget(): 'fd'
Message-ID: <202408021459.h4nqNiBJ-lkp@intel.com>
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
CC: linux-fsdevel@vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.fd
head:   a2303c1df65cfa7933b43246c298d558ad70dbce
commit: cdf3eeda2fbcb51ac54f9fd4fa8667bbd70bca65 [17/39] bpf: resolve_pseudo_ldimm64(): take handling of a single ldimm64 insn into helper
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240802 (https://download.01.org/0day-ci/archive/20240802/202408021459.h4nqNiBJ-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408021459.h4nqNiBJ-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:18476 do_one_ldimm64() warn: fd re-used after fget(): 'fd'

vim +/fd +18476 kernel/bpf/verifier.c

b741f1630346de Roman Gushchin     2018-09-28  18409  
4976b718c3551f Hao Luo            2020-09-29  18410  /* find and rewrite pseudo imm in ld_imm64 instructions:
4976b718c3551f Hao Luo            2020-09-29  18411   *
4976b718c3551f Hao Luo            2020-09-29  18412   * 1. if it accesses map FD, replace it with actual map pointer.
4976b718c3551f Hao Luo            2020-09-29  18413   * 2. if it accesses btf_id of a VAR, replace it with pointer to the var.
4976b718c3551f Hao Luo            2020-09-29  18414   *
4976b718c3551f Hao Luo            2020-09-29  18415   * NOTE: btf_vmlinux is required for converting pseudo btf_id.
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18416   */
cdf3eeda2fbcb5 Al Viro            2024-07-18  18417  static int do_one_ldimm64(struct bpf_verifier_env *env,
cdf3eeda2fbcb5 Al Viro            2024-07-18  18418  			  struct bpf_insn *insn,
cdf3eeda2fbcb5 Al Viro            2024-07-18  18419  			  struct bpf_insn_aux_data *aux)
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18420  {
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18421  	struct bpf_map *map;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18422  	struct fd f;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18423  	u64 addr;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18424  	u32 fd;
cdf3eeda2fbcb5 Al Viro            2024-07-18  18425  	int err;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18426  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18427  	if (insn[0].src_reg == 0)
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18428  		/* valid generic load 64-bit imm */
cdf3eeda2fbcb5 Al Viro            2024-07-18  18429  		return 0;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18430  
cdf3eeda2fbcb5 Al Viro            2024-07-18  18431  	if (insn[0].src_reg == BPF_PSEUDO_BTF_ID)
cdf3eeda2fbcb5 Al Viro            2024-07-18  18432  		return check_pseudo_btf_id(env, insn, aux);
4976b718c3551f Hao Luo            2020-09-29  18433  
69c087ba6225b5 Yonghong Song      2021-02-26  18434  	if (insn[0].src_reg == BPF_PSEUDO_FUNC) {
69c087ba6225b5 Yonghong Song      2021-02-26  18435  		aux->ptr_type = PTR_TO_FUNC;
cdf3eeda2fbcb5 Al Viro            2024-07-18  18436  		return 0;
69c087ba6225b5 Yonghong Song      2021-02-26  18437  	}
69c087ba6225b5 Yonghong Song      2021-02-26  18438  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18439  	/* In final convert_pseudo_ld_imm64() step, this is
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18440  	 * converted into regular 64-bit imm load insn.
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18441  	 */
387544bfa291a2 Alexei Starovoitov 2021-05-13  18442  	switch (insn[0].src_reg) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  18443  	case BPF_PSEUDO_MAP_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18444  	case BPF_PSEUDO_MAP_IDX_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18445  		break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18446  	case BPF_PSEUDO_MAP_FD:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18447  	case BPF_PSEUDO_MAP_IDX:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18448  		if (insn[1].imm == 0)
387544bfa291a2 Alexei Starovoitov 2021-05-13  18449  			break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18450  		fallthrough;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18451  	default:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18452  		verbose(env, "unrecognized bpf_ld_imm64 insn\n");
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18453  		return -EINVAL;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18454  	}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18455  
387544bfa291a2 Alexei Starovoitov 2021-05-13  18456  	switch (insn[0].src_reg) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  18457  	case BPF_PSEUDO_MAP_IDX_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18458  	case BPF_PSEUDO_MAP_IDX:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18459  		if (bpfptr_is_null(env->fd_array)) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  18460  			verbose(env, "fd_idx without fd_array is invalid\n");
387544bfa291a2 Alexei Starovoitov 2021-05-13  18461  			return -EPROTO;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18462  		}
387544bfa291a2 Alexei Starovoitov 2021-05-13  18463  		if (copy_from_bpfptr_offset(&fd, env->fd_array,
387544bfa291a2 Alexei Starovoitov 2021-05-13  18464  					    insn[0].imm * sizeof(fd),
387544bfa291a2 Alexei Starovoitov 2021-05-13  18465  					    sizeof(fd)))
387544bfa291a2 Alexei Starovoitov 2021-05-13  18466  			return -EFAULT;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18467  		break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18468  	default:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18469  		fd = insn[0].imm;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18470  		break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18471  	}
387544bfa291a2 Alexei Starovoitov 2021-05-13  18472  
387544bfa291a2 Alexei Starovoitov 2021-05-13  18473  	f = fdget(fd);
c210129760a010 Daniel Borkmann    2015-10-29  18474  	map = __bpf_map_get(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18475  	if (IS_ERR(map)) {
37eacb9f6e89fb Anton Protopopov   2024-04-12 @18476  		verbose(env, "fd %d is not pointing to valid bpf_map\n", fd);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18477  		return PTR_ERR(map);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18478  	}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18479  
61bd5218eef349 Jakub Kicinski     2017-10-09  18480  	err = check_map_prog_compatibility(env, map, env->prog);
fdc15d388d600d Alexei Starovoitov 2016-09-01  18481  	if (err) {
fdc15d388d600d Alexei Starovoitov 2016-09-01  18482  		fdput(f);
fdc15d388d600d Alexei Starovoitov 2016-09-01  18483  		return err;
fdc15d388d600d Alexei Starovoitov 2016-09-01  18484  	}
fdc15d388d600d Alexei Starovoitov 2016-09-01  18485  
387544bfa291a2 Alexei Starovoitov 2021-05-13  18486  	if (insn[0].src_reg == BPF_PSEUDO_MAP_FD ||
387544bfa291a2 Alexei Starovoitov 2021-05-13  18487  	    insn[0].src_reg == BPF_PSEUDO_MAP_IDX) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18488  		addr = (unsigned long)map;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18489  	} else {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18490  		u32 off = insn[1].imm;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18491  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18492  		if (off >= BPF_MAX_VAR_OFF) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18493  			verbose(env, "direct value offset of %u is not allowed\n", off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18494  			fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18495  			return -EINVAL;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18496  		}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18497  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18498  		if (!map->ops->map_direct_value_addr) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18499  			verbose(env, "no direct value access support for this map type\n");
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18500  			fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18501  			return -EINVAL;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18502  		}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18503  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18504  		err = map->ops->map_direct_value_addr(map, &addr, off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18505  		if (err) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18506  			verbose(env, "invalid access to map value pointer, value_size=%u off=%u\n",
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18507  				map->value_size, off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18508  			fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18509  			return err;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18510  		}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18511  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18512  		aux->map_off = off;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18513  		addr += off;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18514  	}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18515  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18516  	insn[0].imm = (u32)addr;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18517  	insn[1].imm = addr >> 32;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18518  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18519  	/* check whether we recorded this map already */
cdf3eeda2fbcb5 Al Viro            2024-07-18  18520  	for (int i = 0; i < env->used_map_cnt; i++) {
cdf3eeda2fbcb5 Al Viro            2024-07-18  18521  		if (env->used_maps[i] == map) {
cdf3eeda2fbcb5 Al Viro            2024-07-18  18522  			aux->map_index = i;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18523  			fdput(f);
cdf3eeda2fbcb5 Al Viro            2024-07-18  18524  			return 0;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18525  		}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18526  	}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18527  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18528  	if (env->used_map_cnt >= MAX_USED_MAPS) {
9dc182c58b5f5d Anton Protopopov   2024-04-02  18529  		verbose(env, "The total number of maps per program has reached the limit of %u\n",
9dc182c58b5f5d Anton Protopopov   2024-04-02  18530  			MAX_USED_MAPS);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18531  		fdput(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18532  		return -E2BIG;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18533  	}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18534  
66c8473135c62f Andrii Nakryiko    2024-03-08  18535  	if (env->prog->sleepable)
af66bfd3c8538e Hou Tao            2023-12-04  18536  		atomic64_inc(&map->sleepable_refcnt);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18537  	/* hold the map. If the program is rejected by verifier,
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18538  	 * the map will be released by release_maps() or it
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18539  	 * will be used by the valid program until it's unloaded
af66bfd3c8538e Hou Tao            2023-12-04  18540  	 * and all maps are released in bpf_free_used_maps()
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18541  	 */
1e0bd5a091e5d9 Andrii Nakryiko    2019-11-17  18542  	bpf_map_inc(map);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18543  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18544  	aux->map_index = env->used_map_cnt;
92117d8443bc5a Alexei Starovoitov 2016-04-27  18545  	env->used_maps[env->used_map_cnt++] = map;
92117d8443bc5a Alexei Starovoitov 2016-04-27  18546  
b741f1630346de Roman Gushchin     2018-09-28  18547  	if (bpf_map_is_cgroup_storage(map) &&
e47304232b3733 Daniel Borkmann    2019-12-17  18548  	    bpf_cgroup_storage_assign(env->prog->aux, map)) {
b741f1630346de Roman Gushchin     2018-09-28  18549  		verbose(env, "only one cgroup storage of each type is allowed\n");
de9cbbaadba5ad Roman Gushchin     2018-08-02  18550  		fdput(f);
de9cbbaadba5ad Roman Gushchin     2018-08-02  18551  		return -EBUSY;
de9cbbaadba5ad Roman Gushchin     2018-08-02  18552  	}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18553  	if (map->map_type == BPF_MAP_TYPE_ARENA) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18554  		if (env->prog->aux->arena) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18555  			verbose(env, "Only one arena per program\n");
6082b6c328b548 Alexei Starovoitov 2024-03-07  18556  			fdput(f);
6082b6c328b548 Alexei Starovoitov 2024-03-07  18557  			return -EBUSY;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18558  		}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18559  		if (!env->allow_ptr_leaks || !env->bpf_capable) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18560  			verbose(env, "CAP_BPF and CAP_PERFMON are required to use arena\n");
6082b6c328b548 Alexei Starovoitov 2024-03-07  18561  			fdput(f);
6082b6c328b548 Alexei Starovoitov 2024-03-07  18562  			return -EPERM;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18563  		}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18564  		if (!env->prog->jit_requested) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18565  			verbose(env, "JIT is required to use arena\n");
6dae957c8eef6e Anton Protopopov   2024-03-29  18566  			fdput(f);
6082b6c328b548 Alexei Starovoitov 2024-03-07  18567  			return -EOPNOTSUPP;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18568  		}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18569  		if (!bpf_jit_supports_arena()) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18570  			verbose(env, "JIT doesn't support arena\n");
6dae957c8eef6e Anton Protopopov   2024-03-29  18571  			fdput(f);
6082b6c328b548 Alexei Starovoitov 2024-03-07  18572  			return -EOPNOTSUPP;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18573  		}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18574  		env->prog->aux->arena = (void *)map;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18575  		if (!bpf_arena_get_user_vm_start(env->prog->aux->arena)) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18576  			verbose(env, "arena's user address must be set via map_extra or mmap()\n");
6dae957c8eef6e Anton Protopopov   2024-03-29  18577  			fdput(f);
6082b6c328b548 Alexei Starovoitov 2024-03-07  18578  			return -EINVAL;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18579  		}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18580  	}
de9cbbaadba5ad Roman Gushchin     2018-08-02  18581  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18582  	fdput(f);
cdf3eeda2fbcb5 Al Viro            2024-07-18  18583  	return 0;
cdf3eeda2fbcb5 Al Viro            2024-07-18  18584  }
cdf3eeda2fbcb5 Al Viro            2024-07-18  18585  

:::::: The code at line 18476 was first introduced by commit
:::::: 37eacb9f6e89fb399a79e952bc9c78eb3e16290e bpf: Fix a verifier verbose message

:::::: TO: Anton Protopopov <aspsk@isovalent.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
