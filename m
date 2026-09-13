Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE62437F8DC
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Sep 2026 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310153; cv=none; b=XW+fMzaX7I6ebwMngc0+iyAKizOhb9f5aavSBIl+vd747qC++Q8ARviqI46R8IxPs+cwsqvQCUU4CYJ+sMuxtEAvOYzIIQi2wtsa9ul4GEhtzO7WZ1NcEJqDftfCazG9GHiiD74R9HWpjqxsyZWTRVT6VZ5rw0/+4RTnqdQslPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310153; c=relaxed/simple;
	bh=YchZQOaP+2ePvtozqJmVLKB89P7uOm00L/V3m7jZ0mw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iy75cFFRsyPisQgi9UEzey4Cb1FFgwezEHvK8/S/OBzfXoJqC26+gX7dSvxtjkm02+I7sRS33QnnEXzlWyD+qE4TTEndwlG4hVC5Os1IO5Godu3aE7gIjrbCoSNNttz2BsqiUzZ8vsXIRdRlBQbBhIVoJMff6G922fFHZZ1dbM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MalAquN/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MalAquN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789310151; x=1820846151;
  h=date:from:to:cc:subject:message-id;
  bh=YchZQOaP+2ePvtozqJmVLKB89P7uOm00L/V3m7jZ0mw=;
  b=MalAquN/JhUR1j0+mlaBvLNYHyp3illp+k4IgdoUmpkZdqz0rKaSVKYa
   RBNWs4h6j+FIeuOVAjbc1POfqNSujRrs/omdz7n1u0zMB7DFMtvVRmmy7
   wNFNbAIwCyHNSZkNoyciRHiQo+rs6AdPQiqMT9Qow4HQrWYh58LSVju7B
   VsAjBdcEcaDzK3BbPZoTCh0iuMyKyO8h6ViPNqSUBSftzrcj07eNgAMaZ
   goU4t0xKEY8/C7/0rQZxxeT6ZRuyAN5LhCfEJ5lCOw1lbpMj9szPWKKbf
   KyJZI6bHb9sRAtnY+Bkj3lN9lcNPDLTMLgmVPOSFtUqtOK1Mze/bOAJkF
   A==;
X-CSE-ConnectionGUID: jz3BZXl6Qa6LjmFMtEB+OA==
X-CSE-MsgGUID: 8bLV5MkFQuiW1rJnhfiGhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="101043922"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="101043922"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 07:35:51 -0700
X-CSE-ConnectionGUID: ph7RpRDVQSGrCW7SiLn1ag==
X-CSE-MsgGUID: Gmu/DkDITsG0fvIIvkKXYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="274323673"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2026 07:35:49 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5lJ5-000000001d5-239q;
	Sun, 13 Sep 2026 14:35:47 +0000
Date: Sun, 13 Sep 2026 16:35:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bpf-next:master 33/40] kernel/bpf/verifier.c:12762:17-18:
 WARNING opportunity for max()
Message-ID: <202609131635.g284ODRz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yonghong Song <yonghong.song@linux.dev>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   a41c69c6ea14596cfd95978483166d4eff52435e
commit: 1e6c598b02e72ddd62b4d4e0c05159794b8bddbf [33/40] bpf: Prepare kfunc arguments for the JIT from an ABI description
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: hexagon-randconfig-r062-20260913 (https://download.01.org/0day-ci/archive/20260913/202609131635.g284ODRz-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609131635.g284ODRz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/verifier.c:12762:17-18: WARNING opportunity for max()

vim +12762 kernel/bpf/verifier.c

1e6c598b02e72d Yonghong Song 2026-09-12  12751  
1e6c598b02e72d Yonghong Song 2026-09-12  12752  static u32 __btf_func_arg_align(const struct btf *btf, const struct btf_type *t, int rec)
1e6c598b02e72d Yonghong Song 2026-09-12  12753  {
1e6c598b02e72d Yonghong Song 2026-09-12  12754  	const struct btf_member *member;
1e6c598b02e72d Yonghong Song 2026-09-12  12755  	const struct btf_type *mt;
1e6c598b02e72d Yonghong Song 2026-09-12  12756  	u32 align, i;
1e6c598b02e72d Yonghong Song 2026-09-12  12757  
1e6c598b02e72d Yonghong Song 2026-09-12  12758  	while (btf_type_is_array(t))
1e6c598b02e72d Yonghong Song 2026-09-12  12759  		t = btf_type_skip_modifiers(btf, btf_array(t)->type, NULL);
1e6c598b02e72d Yonghong Song 2026-09-12  12760  
1e6c598b02e72d Yonghong Song 2026-09-12  12761  	if (btf_type_is_int(t))
1e6c598b02e72d Yonghong Song 2026-09-12 @12762  		return t->size > BPF_REG_SIZE ? t->size : BPF_REG_SIZE;
1e6c598b02e72d Yonghong Song 2026-09-12  12763  	if (!btf_type_is_struct(t))
1e6c598b02e72d Yonghong Song 2026-09-12  12764  		return BPF_REG_SIZE;
1e6c598b02e72d Yonghong Song 2026-09-12  12765  	if (rec >= BTF_MEMBER_MAX_DEPTH)
1e6c598b02e72d Yonghong Song 2026-09-12  12766  		return 0;
1e6c598b02e72d Yonghong Song 2026-09-12  12767  
1e6c598b02e72d Yonghong Song 2026-09-12  12768  	for_each_member(i, t, member) {
1e6c598b02e72d Yonghong Song 2026-09-12  12769  		mt = btf_type_skip_modifiers(btf, member->type, NULL);
1e6c598b02e72d Yonghong Song 2026-09-12  12770  		align = __btf_func_arg_align(btf, mt, rec + 1);
1e6c598b02e72d Yonghong Song 2026-09-12  12771  		if (!align)
1e6c598b02e72d Yonghong Song 2026-09-12  12772  			return 0;
1e6c598b02e72d Yonghong Song 2026-09-12  12773  		if (align > BPF_REG_SIZE)
1e6c598b02e72d Yonghong Song 2026-09-12  12774  			return 2 * BPF_REG_SIZE;
1e6c598b02e72d Yonghong Song 2026-09-12  12775  	}
1e6c598b02e72d Yonghong Song 2026-09-12  12776  	return BPF_REG_SIZE;
1e6c598b02e72d Yonghong Song 2026-09-12  12777  }
1e6c598b02e72d Yonghong Song 2026-09-12  12778  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
