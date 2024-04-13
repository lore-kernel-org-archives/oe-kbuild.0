Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B133C5
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Apr 2024 06:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712991250; cv=none; b=LOZ070lNBxDonogNSkjYEFV0kHjg6YDAOZlyKxLQ00emPFXsD2DQFt5xuKCX/DPoZy+bMtiqbXhUTax+oaSykf9d9mgZP0bMvm/7cuOEBqkoHvh8HAiKgB2n07ISB4Rb8lpBH+o4+XG7POn5LnbFsZF/gpT8jkf8GYLUgOS/2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712991250; c=relaxed/simple;
	bh=NSVRpx3d0mEC05Y8Y+gnwXVrkMSHf9bC32Wx8SASRuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O4MQ7h0r9XJqw1Ynhn/nnwGx4KJ1p9j/w4axxt+3hGeT3S+zHdwXkK+HoBGhaSsU+rGZULMkYPys8T+XFlMHd+Lbpj8nXQC9Yz4s1DNQTF1N0DWTYkNQe/X++47j80+EswSvfZ5/q+Y5jrfiw21IZzElNlixV6uIkSHTvaHQ8cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7E7er2R; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7E7er2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712991249; x=1744527249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NSVRpx3d0mEC05Y8Y+gnwXVrkMSHf9bC32Wx8SASRuA=;
  b=Y7E7er2RCC0tjFSrdzRZQZrJiM1MnT0lkOQY/vqMYEbDLxNb7n0CTu1F
   B81NBaW956X/o/OuQWQQlc3Yk+foG8W+A7tyVGWhmZMbZXCBbPQbgIvee
   CRdlMVQr5kz6nZpISXm/bXda+PxnFdmJPUn/GvU3to3aIF5DYC7Cx63Bc
   /biYhEi2Vzl6MS2/KVOrNGS8iqK5wY6qKpsAvHkpQzcpNrBmDqPVOxPcx
   VZVg9Set6tzMWXPxpmMLMidI8l3lY2GJCQR7FcIglc0gZ7qizaUhu9HK/
   m0OYWhVJtx9APalni7Mgsw47ZntkKGOYVgpaFavEDrrxl7670AihkJgPe
   A==;
X-CSE-ConnectionGUID: RorZqJzFTJufy1vbBBqGrA==
X-CSE-MsgGUID: WHZXTdegRx2LSTeWQgCuDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8294202"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="8294202"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 23:54:08 -0700
X-CSE-ConnectionGUID: qRSt4r3ATt+Ezy6nklLh6g==
X-CSE-MsgGUID: PlqKWTPgTbiQEKJNPCKTHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21501124"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 23:54:06 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvXH1-0001zI-2z;
	Sat, 13 Apr 2024 06:54:03 +0000
Date: Sat, 13 Apr 2024 14:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bpf:master 2/2] kernel/bpf/verifier.c:18292
 resolve_pseudo_ldimm64() warn: fd re-used after fget(): 'fd'
Message-ID: <202404131458.W4JBfJoP-lkp@intel.com>
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
TO: Anton Protopopov <aspsk@isovalent.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
head:   37eacb9f6e89fb399a79e952bc9c78eb3e16290e
commit: 37eacb9f6e89fb399a79e952bc9c78eb3e16290e [2/2] bpf: Fix a verifier verbose message
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: mips-randconfig-r071-20240413 (https://download.01.org/0day-ci/archive/20240413/202404131458.W4JBfJoP-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404131458.W4JBfJoP-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:18292 resolve_pseudo_ldimm64() warn: fd re-used after fget(): 'fd'

vim +/fd +18292 kernel/bpf/verifier.c

b741f1630346de Roman Gushchin     2018-09-28  18197  
4976b718c3551f Hao Luo            2020-09-29  18198  /* find and rewrite pseudo imm in ld_imm64 instructions:
4976b718c3551f Hao Luo            2020-09-29  18199   *
4976b718c3551f Hao Luo            2020-09-29  18200   * 1. if it accesses map FD, replace it with actual map pointer.
4976b718c3551f Hao Luo            2020-09-29  18201   * 2. if it accesses btf_id of a VAR, replace it with pointer to the var.
4976b718c3551f Hao Luo            2020-09-29  18202   *
4976b718c3551f Hao Luo            2020-09-29  18203   * NOTE: btf_vmlinux is required for converting pseudo btf_id.
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18204   */
4976b718c3551f Hao Luo            2020-09-29  18205  static int resolve_pseudo_ldimm64(struct bpf_verifier_env *env)
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18206  {
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18207  	struct bpf_insn *insn = env->prog->insnsi;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18208  	int insn_cnt = env->prog->len;
fdc15d388d600d Alexei Starovoitov 2016-09-01  18209  	int i, j, err;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18210  
f1f7714ea51c56 Daniel Borkmann    2017-01-13  18211  	err = bpf_prog_calc_tag(env->prog);
aafe6ae9cee32d Daniel Borkmann    2016-12-18  18212  	if (err)
aafe6ae9cee32d Daniel Borkmann    2016-12-18  18213  		return err;
aafe6ae9cee32d Daniel Borkmann    2016-12-18  18214  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18215  	for (i = 0; i < insn_cnt; i++, insn++) {
9bac3d6d548e5c Alexei Starovoitov 2015-03-13  18216  		if (BPF_CLASS(insn->code) == BPF_LDX &&
1f9a1ea821ff25 Yonghong Song      2023-07-27  18217  		    ((BPF_MODE(insn->code) != BPF_MEM && BPF_MODE(insn->code) != BPF_MEMSX) ||
1f9a1ea821ff25 Yonghong Song      2023-07-27  18218  		    insn->imm != 0)) {
61bd5218eef349 Jakub Kicinski     2017-10-09  18219  			verbose(env, "BPF_LDX uses reserved fields\n");
d691f9e8d4405c Alexei Starovoitov 2015-06-04  18220  			return -EINVAL;
d691f9e8d4405c Alexei Starovoitov 2015-06-04  18221  		}
d691f9e8d4405c Alexei Starovoitov 2015-06-04  18222  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18223  		if (insn[0].code == (BPF_LD | BPF_IMM | BPF_DW)) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18224  			struct bpf_insn_aux_data *aux;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18225  			struct bpf_map *map;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18226  			struct fd f;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18227  			u64 addr;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18228  			u32 fd;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18229  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18230  			if (i == insn_cnt - 1 || insn[1].code != 0 ||
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18231  			    insn[1].dst_reg != 0 || insn[1].src_reg != 0 ||
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18232  			    insn[1].off != 0) {
61bd5218eef349 Jakub Kicinski     2017-10-09  18233  				verbose(env, "invalid bpf_ld_imm64 insn\n");
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18234  				return -EINVAL;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18235  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18236  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18237  			if (insn[0].src_reg == 0)
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18238  				/* valid generic load 64-bit imm */
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18239  				goto next_insn;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18240  
4976b718c3551f Hao Luo            2020-09-29  18241  			if (insn[0].src_reg == BPF_PSEUDO_BTF_ID) {
4976b718c3551f Hao Luo            2020-09-29  18242  				aux = &env->insn_aux_data[i];
4976b718c3551f Hao Luo            2020-09-29  18243  				err = check_pseudo_btf_id(env, insn, aux);
4976b718c3551f Hao Luo            2020-09-29  18244  				if (err)
4976b718c3551f Hao Luo            2020-09-29  18245  					return err;
4976b718c3551f Hao Luo            2020-09-29  18246  				goto next_insn;
4976b718c3551f Hao Luo            2020-09-29  18247  			}
4976b718c3551f Hao Luo            2020-09-29  18248  
69c087ba6225b5 Yonghong Song      2021-02-26  18249  			if (insn[0].src_reg == BPF_PSEUDO_FUNC) {
69c087ba6225b5 Yonghong Song      2021-02-26  18250  				aux = &env->insn_aux_data[i];
69c087ba6225b5 Yonghong Song      2021-02-26  18251  				aux->ptr_type = PTR_TO_FUNC;
69c087ba6225b5 Yonghong Song      2021-02-26  18252  				goto next_insn;
69c087ba6225b5 Yonghong Song      2021-02-26  18253  			}
69c087ba6225b5 Yonghong Song      2021-02-26  18254  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18255  			/* In final convert_pseudo_ld_imm64() step, this is
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18256  			 * converted into regular 64-bit imm load insn.
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18257  			 */
387544bfa291a2 Alexei Starovoitov 2021-05-13  18258  			switch (insn[0].src_reg) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  18259  			case BPF_PSEUDO_MAP_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18260  			case BPF_PSEUDO_MAP_IDX_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18261  				break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18262  			case BPF_PSEUDO_MAP_FD:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18263  			case BPF_PSEUDO_MAP_IDX:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18264  				if (insn[1].imm == 0)
387544bfa291a2 Alexei Starovoitov 2021-05-13  18265  					break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18266  				fallthrough;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18267  			default:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18268  				verbose(env, "unrecognized bpf_ld_imm64 insn\n");
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18269  				return -EINVAL;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18270  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18271  
387544bfa291a2 Alexei Starovoitov 2021-05-13  18272  			switch (insn[0].src_reg) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  18273  			case BPF_PSEUDO_MAP_IDX_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18274  			case BPF_PSEUDO_MAP_IDX:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18275  				if (bpfptr_is_null(env->fd_array)) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  18276  					verbose(env, "fd_idx without fd_array is invalid\n");
387544bfa291a2 Alexei Starovoitov 2021-05-13  18277  					return -EPROTO;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18278  				}
387544bfa291a2 Alexei Starovoitov 2021-05-13  18279  				if (copy_from_bpfptr_offset(&fd, env->fd_array,
387544bfa291a2 Alexei Starovoitov 2021-05-13  18280  							    insn[0].imm * sizeof(fd),
387544bfa291a2 Alexei Starovoitov 2021-05-13  18281  							    sizeof(fd)))
387544bfa291a2 Alexei Starovoitov 2021-05-13  18282  					return -EFAULT;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18283  				break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18284  			default:
387544bfa291a2 Alexei Starovoitov 2021-05-13  18285  				fd = insn[0].imm;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18286  				break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  18287  			}
387544bfa291a2 Alexei Starovoitov 2021-05-13  18288  
387544bfa291a2 Alexei Starovoitov 2021-05-13  18289  			f = fdget(fd);
c210129760a010 Daniel Borkmann    2015-10-29  18290  			map = __bpf_map_get(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18291  			if (IS_ERR(map)) {
37eacb9f6e89fb Anton Protopopov   2024-04-12 @18292  				verbose(env, "fd %d is not pointing to valid bpf_map\n", fd);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18293  				return PTR_ERR(map);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18294  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18295  
61bd5218eef349 Jakub Kicinski     2017-10-09  18296  			err = check_map_prog_compatibility(env, map, env->prog);
fdc15d388d600d Alexei Starovoitov 2016-09-01  18297  			if (err) {
fdc15d388d600d Alexei Starovoitov 2016-09-01  18298  				fdput(f);
fdc15d388d600d Alexei Starovoitov 2016-09-01  18299  				return err;
fdc15d388d600d Alexei Starovoitov 2016-09-01  18300  			}
fdc15d388d600d Alexei Starovoitov 2016-09-01  18301  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18302  			aux = &env->insn_aux_data[i];
387544bfa291a2 Alexei Starovoitov 2021-05-13  18303  			if (insn[0].src_reg == BPF_PSEUDO_MAP_FD ||
387544bfa291a2 Alexei Starovoitov 2021-05-13  18304  			    insn[0].src_reg == BPF_PSEUDO_MAP_IDX) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18305  				addr = (unsigned long)map;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18306  			} else {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18307  				u32 off = insn[1].imm;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18308  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18309  				if (off >= BPF_MAX_VAR_OFF) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18310  					verbose(env, "direct value offset of %u is not allowed\n", off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18311  					fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18312  					return -EINVAL;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18313  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18314  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18315  				if (!map->ops->map_direct_value_addr) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18316  					verbose(env, "no direct value access support for this map type\n");
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18317  					fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18318  					return -EINVAL;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18319  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18320  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18321  				err = map->ops->map_direct_value_addr(map, &addr, off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18322  				if (err) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18323  					verbose(env, "invalid access to map value pointer, value_size=%u off=%u\n",
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18324  						map->value_size, off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18325  					fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18326  					return err;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18327  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18328  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18329  				aux->map_off = off;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18330  				addr += off;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18331  			}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18332  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18333  			insn[0].imm = (u32)addr;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18334  			insn[1].imm = addr >> 32;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18335  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18336  			/* check whether we recorded this map already */
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18337  			for (j = 0; j < env->used_map_cnt; j++) {
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18338  				if (env->used_maps[j] == map) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18339  					aux->map_index = j;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18340  					fdput(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18341  					goto next_insn;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18342  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18343  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18344  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18345  			if (env->used_map_cnt >= MAX_USED_MAPS) {
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18346  				fdput(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18347  				return -E2BIG;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18348  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18349  
66c8473135c62f Andrii Nakryiko    2024-03-08  18350  			if (env->prog->sleepable)
af66bfd3c8538e Hou Tao            2023-12-04  18351  				atomic64_inc(&map->sleepable_refcnt);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18352  			/* hold the map. If the program is rejected by verifier,
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18353  			 * the map will be released by release_maps() or it
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18354  			 * will be used by the valid program until it's unloaded
af66bfd3c8538e Hou Tao            2023-12-04  18355  			 * and all maps are released in bpf_free_used_maps()
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18356  			 */
1e0bd5a091e5d9 Andrii Nakryiko    2019-11-17  18357  			bpf_map_inc(map);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18358  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  18359  			aux->map_index = env->used_map_cnt;
92117d8443bc5a Alexei Starovoitov 2016-04-27  18360  			env->used_maps[env->used_map_cnt++] = map;
92117d8443bc5a Alexei Starovoitov 2016-04-27  18361  
b741f1630346de Roman Gushchin     2018-09-28  18362  			if (bpf_map_is_cgroup_storage(map) &&
e47304232b3733 Daniel Borkmann    2019-12-17  18363  			    bpf_cgroup_storage_assign(env->prog->aux, map)) {
b741f1630346de Roman Gushchin     2018-09-28  18364  				verbose(env, "only one cgroup storage of each type is allowed\n");
de9cbbaadba5ad Roman Gushchin     2018-08-02  18365  				fdput(f);
de9cbbaadba5ad Roman Gushchin     2018-08-02  18366  				return -EBUSY;
de9cbbaadba5ad Roman Gushchin     2018-08-02  18367  			}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18368  			if (map->map_type == BPF_MAP_TYPE_ARENA) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18369  				if (env->prog->aux->arena) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18370  					verbose(env, "Only one arena per program\n");
6082b6c328b548 Alexei Starovoitov 2024-03-07  18371  					fdput(f);
6082b6c328b548 Alexei Starovoitov 2024-03-07  18372  					return -EBUSY;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18373  				}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18374  				if (!env->allow_ptr_leaks || !env->bpf_capable) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18375  					verbose(env, "CAP_BPF and CAP_PERFMON are required to use arena\n");
6082b6c328b548 Alexei Starovoitov 2024-03-07  18376  					fdput(f);
6082b6c328b548 Alexei Starovoitov 2024-03-07  18377  					return -EPERM;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18378  				}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18379  				if (!env->prog->jit_requested) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18380  					verbose(env, "JIT is required to use arena\n");
6dae957c8eef6e Anton Protopopov   2024-03-29  18381  					fdput(f);
6082b6c328b548 Alexei Starovoitov 2024-03-07  18382  					return -EOPNOTSUPP;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18383  				}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18384  				if (!bpf_jit_supports_arena()) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18385  					verbose(env, "JIT doesn't support arena\n");
6dae957c8eef6e Anton Protopopov   2024-03-29  18386  					fdput(f);
6082b6c328b548 Alexei Starovoitov 2024-03-07  18387  					return -EOPNOTSUPP;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18388  				}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18389  				env->prog->aux->arena = (void *)map;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18390  				if (!bpf_arena_get_user_vm_start(env->prog->aux->arena)) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  18391  					verbose(env, "arena's user address must be set via map_extra or mmap()\n");
6dae957c8eef6e Anton Protopopov   2024-03-29  18392  					fdput(f);
6082b6c328b548 Alexei Starovoitov 2024-03-07  18393  					return -EINVAL;
6082b6c328b548 Alexei Starovoitov 2024-03-07  18394  				}
6082b6c328b548 Alexei Starovoitov 2024-03-07  18395  			}
de9cbbaadba5ad Roman Gushchin     2018-08-02  18396  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18397  			fdput(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18398  next_insn:
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18399  			insn++;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18400  			i++;
5e581dad4fec0e Daniel Borkmann    2018-01-26  18401  			continue;
5e581dad4fec0e Daniel Borkmann    2018-01-26  18402  		}
5e581dad4fec0e Daniel Borkmann    2018-01-26  18403  
5e581dad4fec0e Daniel Borkmann    2018-01-26  18404  		/* Basic sanity check before we invest more work here. */
5e581dad4fec0e Daniel Borkmann    2018-01-26  18405  		if (!bpf_opcode_in_insntable(insn->code)) {
5e581dad4fec0e Daniel Borkmann    2018-01-26  18406  			verbose(env, "unknown opcode %02x\n", insn->code);
5e581dad4fec0e Daniel Borkmann    2018-01-26  18407  			return -EINVAL;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18408  		}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18409  	}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18410  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18411  	/* now all pseudo BPF_LD_IMM64 instructions load valid
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18412  	 * 'struct bpf_map *' into a register instead of user map_fd.
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18413  	 * These pointers will be used later by verifier to validate map access.
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18414  	 */
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18415  	return 0;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18416  }
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  18417  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
