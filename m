Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131335;
	b=PbwRUNBdUMMPX6Vbebrni8cukd3/9qS3n3oWJQ2pt+waqwLla6ehUdLASoJkeXfJrxlY
	 JlCULaAosPJDnRTCGgAU2lSq3RmqSP2Gq+zn1FJDkhxQ5z9m8rG7GRiVy5iTrdzuSM5MF
	 N7im2ngr9PHTM5pN3EQrylmWVft8SdCeMYucIbZkBsgN6wbtVzVBdConxehKN55Z8+YzN
	 JymmHUUHK9QbPX5FnzCN6VtvBq9msD0y4uM4oemsF0rcb3sCKvJantILLHk4ziO03PB/U
	 HXTZFBme/u1WLeG3zVEwPiNGKEMY6ZNiT7ZEMr3nn0Ihjq5BcY1IiIeOkjeGs1CsgYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131335;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vtMxEWT0DZmgy4AFYQ3dHmnAiMWLiwJQaiifZBGeN14=;
	b=021lxH7Y+jsQUv/pmY7gbaJ1lU1KuuLPVemQA/QWp2wEkyMeVpieC4K0p1d2WYRseGG0
	 HAjpKBsZpuqjNwa7fAdXTgjKNDPrp/SZRBGUzFYAQL1QIXzigIITQ35mqyGN+rSn/SWAq
	 NDGJVHRy7CrASLWqByYAGnmjYoN1G768nyCvQjZR2CwpkqXtG0XxNfWV0cJcS1tX2oBrY
	 KDZh1of5DDqpBwmUjChnp7KO34L63HU7DhyYUY8HGwB/4AAuI4FBXFh2vERBhnaCGBYvK
	 7FvH3XVUvBpe0bcPL3kz7jTccVobXp0Pq3w16yd7ejtf4kTjEWLxA5tjr9emM5lseQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CS1+a4VA;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F1606A31C
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 09:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CS1+a4VA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794131333; x=1825667333;
  h=date:from:to:cc:subject:message-id;
  bh=9txPS64aB/hbzodCqQ0zjQLyRzonRgazEwvcjNBsvXE=;
  b=CS1+a4VAy5T7+XVY8ChbVX+eqjbsJUaFbxx2qEOgJcX0qnm8Nsm2lH8y
   ulL9npf2ItZdmK5mOQdEDzB2WbbeGgBZwwUw80k8ck3xxodbwASUCgJT3
   5mLq15TtBTw2bpmCwfe6xnU8sZH79KIXyFTqjaSTbBPD5xUcJTFoLjSyg
   WRoSlCFfXjSumogPUhwNBsato5thRxk0A98DKw0BWXGWggfjcNUN9nslL
   uvEN7wV5L1XbQrA92i0+kQZhwoHHxqQlvBz3pke0cK652mGH9J8Li4P4D
   SanY+JT6odkQmHvkD9l0hUsTq9tAknpKK0eCQtOJuqnw7yFdDSVj1gA2c
   Q==;
X-CSE-ConnectionGUID: 2vKv53mSTSCUEYE70Oc/8g==
X-CSE-MsgGUID: /OJsI9elQ/u1brzVC/K85Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2915741"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2915741"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 01:48:53 -0800
X-CSE-ConnectionGUID: UoH/8gS4Qn23UVOwJeepyg==
X-CSE-MsgGUID: NcN3K5KPRcGUYEp55Eh+9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7532436"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 Nov 2026 01:48:52 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPzW5-00000000BOb-2vqX;
	Sun, 08 Nov 2026 09:48:49 +0000
Date: Sun, 08 Nov 2026 10:48:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.15 54/54]
 kernel/bpf/verifier.c:11878 resolve_pseudo_ldimm64() warn: fd re-used after
 fget(): 'fd'
Message-ID: <202611081043.Rw3Ohxt0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   a5a9930e03c61e245e77f94ef4d0fef4d57c5092
commit: 396df2b9394313079c6a7baab89b42cb6550dcc6 [54/54] bpf: Fix a verifier verbose message
:::::: branch date: 33 hours ago
:::::: commit date: 2 years, 6 months ago
config: arm-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261108/202611081043.Rw3Ohxt0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611081043.Rw3Ohxt0-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:11878 resolve_pseudo_ldimm64() warn: fd re-used after fget(): 'fd'

vim +/fd +11878 kernel/bpf/verifier.c

b741f1630346de Roman Gushchin     2018-09-28  11784  
4976b718c3551f Hao Luo            2020-09-29  11785  /* find and rewrite pseudo imm in ld_imm64 instructions:
4976b718c3551f Hao Luo            2020-09-29  11786   *
4976b718c3551f Hao Luo            2020-09-29  11787   * 1. if it accesses map FD, replace it with actual map pointer.
4976b718c3551f Hao Luo            2020-09-29  11788   * 2. if it accesses btf_id of a VAR, replace it with pointer to the var.
4976b718c3551f Hao Luo            2020-09-29  11789   *
4976b718c3551f Hao Luo            2020-09-29  11790   * NOTE: btf_vmlinux is required for converting pseudo btf_id.
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11791   */
4976b718c3551f Hao Luo            2020-09-29  11792  static int resolve_pseudo_ldimm64(struct bpf_verifier_env *env)
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11793  {
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11794  	struct bpf_insn *insn = env->prog->insnsi;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11795  	int insn_cnt = env->prog->len;
fdc15d388d600d Alexei Starovoitov 2016-09-01  11796  	int i, j, err;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11797  
f1f7714ea51c56 Daniel Borkmann    2017-01-13  11798  	err = bpf_prog_calc_tag(env->prog);
aafe6ae9cee32d Daniel Borkmann    2016-12-18  11799  	if (err)
aafe6ae9cee32d Daniel Borkmann    2016-12-18  11800  		return err;
aafe6ae9cee32d Daniel Borkmann    2016-12-18  11801  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11802  	for (i = 0; i < insn_cnt; i++, insn++) {
9bac3d6d548e5c Alexei Starovoitov 2015-03-13  11803  		if (BPF_CLASS(insn->code) == BPF_LDX &&
d691f9e8d4405c Alexei Starovoitov 2015-06-04  11804  		    (BPF_MODE(insn->code) != BPF_MEM || insn->imm != 0)) {
61bd5218eef349 Jakub Kicinski     2017-10-09  11805  			verbose(env, "BPF_LDX uses reserved fields\n");
d691f9e8d4405c Alexei Starovoitov 2015-06-04  11806  			return -EINVAL;
d691f9e8d4405c Alexei Starovoitov 2015-06-04  11807  		}
d691f9e8d4405c Alexei Starovoitov 2015-06-04  11808  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11809  		if (insn[0].code == (BPF_LD | BPF_IMM | BPF_DW)) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11810  			struct bpf_insn_aux_data *aux;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11811  			struct bpf_map *map;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11812  			struct fd f;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11813  			u64 addr;
387544bfa291a2 Alexei Starovoitov 2021-05-13  11814  			u32 fd;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11815  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11816  			if (i == insn_cnt - 1 || insn[1].code != 0 ||
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11817  			    insn[1].dst_reg != 0 || insn[1].src_reg != 0 ||
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11818  			    insn[1].off != 0) {
61bd5218eef349 Jakub Kicinski     2017-10-09  11819  				verbose(env, "invalid bpf_ld_imm64 insn\n");
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11820  				return -EINVAL;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11821  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11822  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11823  			if (insn[0].src_reg == 0)
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11824  				/* valid generic load 64-bit imm */
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11825  				goto next_insn;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11826  
4976b718c3551f Hao Luo            2020-09-29  11827  			if (insn[0].src_reg == BPF_PSEUDO_BTF_ID) {
4976b718c3551f Hao Luo            2020-09-29  11828  				aux = &env->insn_aux_data[i];
4976b718c3551f Hao Luo            2020-09-29  11829  				err = check_pseudo_btf_id(env, insn, aux);
4976b718c3551f Hao Luo            2020-09-29  11830  				if (err)
4976b718c3551f Hao Luo            2020-09-29  11831  					return err;
4976b718c3551f Hao Luo            2020-09-29  11832  				goto next_insn;
4976b718c3551f Hao Luo            2020-09-29  11833  			}
4976b718c3551f Hao Luo            2020-09-29  11834  
69c087ba6225b5 Yonghong Song      2021-02-26  11835  			if (insn[0].src_reg == BPF_PSEUDO_FUNC) {
69c087ba6225b5 Yonghong Song      2021-02-26  11836  				aux = &env->insn_aux_data[i];
69c087ba6225b5 Yonghong Song      2021-02-26  11837  				aux->ptr_type = PTR_TO_FUNC;
69c087ba6225b5 Yonghong Song      2021-02-26  11838  				goto next_insn;
69c087ba6225b5 Yonghong Song      2021-02-26  11839  			}
69c087ba6225b5 Yonghong Song      2021-02-26  11840  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11841  			/* In final convert_pseudo_ld_imm64() step, this is
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11842  			 * converted into regular 64-bit imm load insn.
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11843  			 */
387544bfa291a2 Alexei Starovoitov 2021-05-13  11844  			switch (insn[0].src_reg) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  11845  			case BPF_PSEUDO_MAP_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  11846  			case BPF_PSEUDO_MAP_IDX_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  11847  				break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  11848  			case BPF_PSEUDO_MAP_FD:
387544bfa291a2 Alexei Starovoitov 2021-05-13  11849  			case BPF_PSEUDO_MAP_IDX:
387544bfa291a2 Alexei Starovoitov 2021-05-13  11850  				if (insn[1].imm == 0)
387544bfa291a2 Alexei Starovoitov 2021-05-13  11851  					break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  11852  				fallthrough;
387544bfa291a2 Alexei Starovoitov 2021-05-13  11853  			default:
387544bfa291a2 Alexei Starovoitov 2021-05-13  11854  				verbose(env, "unrecognized bpf_ld_imm64 insn\n");
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11855  				return -EINVAL;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11856  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11857  
387544bfa291a2 Alexei Starovoitov 2021-05-13  11858  			switch (insn[0].src_reg) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  11859  			case BPF_PSEUDO_MAP_IDX_VALUE:
387544bfa291a2 Alexei Starovoitov 2021-05-13  11860  			case BPF_PSEUDO_MAP_IDX:
387544bfa291a2 Alexei Starovoitov 2021-05-13  11861  				if (bpfptr_is_null(env->fd_array)) {
387544bfa291a2 Alexei Starovoitov 2021-05-13  11862  					verbose(env, "fd_idx without fd_array is invalid\n");
387544bfa291a2 Alexei Starovoitov 2021-05-13  11863  					return -EPROTO;
387544bfa291a2 Alexei Starovoitov 2021-05-13  11864  				}
387544bfa291a2 Alexei Starovoitov 2021-05-13  11865  				if (copy_from_bpfptr_offset(&fd, env->fd_array,
387544bfa291a2 Alexei Starovoitov 2021-05-13  11866  							    insn[0].imm * sizeof(fd),
387544bfa291a2 Alexei Starovoitov 2021-05-13  11867  							    sizeof(fd)))
387544bfa291a2 Alexei Starovoitov 2021-05-13  11868  					return -EFAULT;
387544bfa291a2 Alexei Starovoitov 2021-05-13  11869  				break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  11870  			default:
387544bfa291a2 Alexei Starovoitov 2021-05-13  11871  				fd = insn[0].imm;
387544bfa291a2 Alexei Starovoitov 2021-05-13  11872  				break;
387544bfa291a2 Alexei Starovoitov 2021-05-13  11873  			}
387544bfa291a2 Alexei Starovoitov 2021-05-13  11874  
387544bfa291a2 Alexei Starovoitov 2021-05-13  11875  			f = fdget(fd);
c210129760a010 Daniel Borkmann    2015-10-29  11876  			map = __bpf_map_get(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11877  			if (IS_ERR(map)) {
396df2b9394313 Anton Protopopov   2024-04-12 @11878  				verbose(env, "fd %d is not pointing to valid bpf_map\n", fd);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11879  				return PTR_ERR(map);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11880  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11881  
61bd5218eef349 Jakub Kicinski     2017-10-09  11882  			err = check_map_prog_compatibility(env, map, env->prog);
fdc15d388d600d Alexei Starovoitov 2016-09-01  11883  			if (err) {
fdc15d388d600d Alexei Starovoitov 2016-09-01  11884  				fdput(f);
fdc15d388d600d Alexei Starovoitov 2016-09-01  11885  				return err;
fdc15d388d600d Alexei Starovoitov 2016-09-01  11886  			}
fdc15d388d600d Alexei Starovoitov 2016-09-01  11887  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11888  			aux = &env->insn_aux_data[i];
387544bfa291a2 Alexei Starovoitov 2021-05-13  11889  			if (insn[0].src_reg == BPF_PSEUDO_MAP_FD ||
387544bfa291a2 Alexei Starovoitov 2021-05-13  11890  			    insn[0].src_reg == BPF_PSEUDO_MAP_IDX) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11891  				addr = (unsigned long)map;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11892  			} else {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11893  				u32 off = insn[1].imm;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11894  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11895  				if (off >= BPF_MAX_VAR_OFF) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11896  					verbose(env, "direct value offset of %u is not allowed\n", off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11897  					fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11898  					return -EINVAL;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11899  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11900  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11901  				if (!map->ops->map_direct_value_addr) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11902  					verbose(env, "no direct value access support for this map type\n");
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11903  					fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11904  					return -EINVAL;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11905  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11906  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11907  				err = map->ops->map_direct_value_addr(map, &addr, off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11908  				if (err) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11909  					verbose(env, "invalid access to map value pointer, value_size=%u off=%u\n",
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11910  						map->value_size, off);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11911  					fdput(f);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11912  					return err;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11913  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11914  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11915  				aux->map_off = off;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11916  				addr += off;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11917  			}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11918  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11919  			insn[0].imm = (u32)addr;
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11920  			insn[1].imm = addr >> 32;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11921  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11922  			/* check whether we recorded this map already */
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11923  			for (j = 0; j < env->used_map_cnt; j++) {
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11924  				if (env->used_maps[j] == map) {
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11925  					aux->map_index = j;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11926  					fdput(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11927  					goto next_insn;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11928  				}
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11929  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11930  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11931  			if (env->used_map_cnt >= MAX_USED_MAPS) {
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11932  				fdput(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11933  				return -E2BIG;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11934  			}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11935  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11936  			/* hold the map. If the program is rejected by verifier,
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11937  			 * the map will be released by release_maps() or it
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11938  			 * will be used by the valid program until it's unloaded
ab7f5bf0928be2 Jakub Kicinski     2018-05-03  11939  			 * and all maps are released in free_used_maps()
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11940  			 */
1e0bd5a091e5d9 Andrii Nakryiko    2019-11-17  11941  			bpf_map_inc(map);
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11942  
d8eca5bbb2be9b Daniel Borkmann    2019-04-09  11943  			aux->map_index = env->used_map_cnt;
92117d8443bc5a Alexei Starovoitov 2016-04-27  11944  			env->used_maps[env->used_map_cnt++] = map;
92117d8443bc5a Alexei Starovoitov 2016-04-27  11945  
b741f1630346de Roman Gushchin     2018-09-28  11946  			if (bpf_map_is_cgroup_storage(map) &&
e47304232b3733 Daniel Borkmann    2019-12-17  11947  			    bpf_cgroup_storage_assign(env->prog->aux, map)) {
b741f1630346de Roman Gushchin     2018-09-28  11948  				verbose(env, "only one cgroup storage of each type is allowed\n");
de9cbbaadba5ad Roman Gushchin     2018-08-02  11949  				fdput(f);
de9cbbaadba5ad Roman Gushchin     2018-08-02  11950  				return -EBUSY;
de9cbbaadba5ad Roman Gushchin     2018-08-02  11951  			}
de9cbbaadba5ad Roman Gushchin     2018-08-02  11952  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11953  			fdput(f);
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11954  next_insn:
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11955  			insn++;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11956  			i++;
5e581dad4fec0e Daniel Borkmann    2018-01-26  11957  			continue;
5e581dad4fec0e Daniel Borkmann    2018-01-26  11958  		}
5e581dad4fec0e Daniel Borkmann    2018-01-26  11959  
5e581dad4fec0e Daniel Borkmann    2018-01-26  11960  		/* Basic sanity check before we invest more work here. */
5e581dad4fec0e Daniel Borkmann    2018-01-26  11961  		if (!bpf_opcode_in_insntable(insn->code)) {
5e581dad4fec0e Daniel Borkmann    2018-01-26  11962  			verbose(env, "unknown opcode %02x\n", insn->code);
5e581dad4fec0e Daniel Borkmann    2018-01-26  11963  			return -EINVAL;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11964  		}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11965  	}
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11966  
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11967  	/* now all pseudo BPF_LD_IMM64 instructions load valid
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11968  	 * 'struct bpf_map *' into a register instead of user map_fd.
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11969  	 * These pointers will be used later by verifier to validate map access.
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11970  	 */
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11971  	return 0;
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11972  }
0246e64d9a5fcd Alexei Starovoitov 2014-09-26  11973  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
