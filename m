Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67438171CD
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 05:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726378297; cv=none; b=RP3oJ9/bmuUiW1cQRu7ZDaZOVqGTEMYhOHS6gjT5WoHKPuvqQkS0x9xSW/bK2Y9EFIG+T7TIKOVnONqwfelEjWAp6dHmpIBnw9QL+/POMByFdryRIqsdfx+nSJPt/J4Y0EvFLOQDNmsssLxrI/NJZYBj47iBQw4GA1i55Q3Mmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726378297; c=relaxed/simple;
	bh=DWsM/JorsZMDtdWceXTpsOqJKPadvU1VN1RmjOecqAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KE1Q6NgwerW55aDeqOzRGCZsezotI9twBLpkb5nowaSRVGJX7RVqovZ7MYVRX3OUuwta3xOEjLqd16dS5ymVAV8MjIj67yDE8vsXX/7IYt10FprcJdfZWKsCMMyyyfIvzeYKbW1BhzdD2Y0l+qKpMV/6l9W7i3wd43SrVj779YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jd5jfypK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jd5jfypK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726378296; x=1757914296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWsM/JorsZMDtdWceXTpsOqJKPadvU1VN1RmjOecqAc=;
  b=Jd5jfypKAcAKr/TF94GNjGs7K7zDIm/7/zEknkIoqy1HEDkStpEY7PrQ
   mODzypeuUvr9d2+0kTp9ARzNjcNOMFUdIOj43uGorJi924+/fmZpJbo8h
   KgakdaaDlfcqH1ADLWx4mblQKsMKcO0H4yePiK5qnjEX19EkTUQF9pg56
   8pC20AubSjC2bcBHMtA/ClhidPdVtE4duAVQ/IykflNlR9CUVtgWc1VLi
   yG7YvcbJIv9XhMLWoY/PmFEhnCq1+YZ5Xcoys6HV5Fkcd8DlCjzpsCDYK
   YY5qGzJ7NjlNhjMenTKOU9ZwN5UozEPkR4qgqqo2gJFjUnkts9Jp+GtU2
   A==;
X-CSE-ConnectionGUID: 3wMKSkriRHa4rXLgPAADEA==
X-CSE-MsgGUID: HjCaM+y7QlyJfEtrXj0qsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35814728"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="35814728"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 22:31:35 -0700
X-CSE-ConnectionGUID: QmCqF2CRRDKIGuHvvGxTRw==
X-CSE-MsgGUID: 0N/Q7NjnQ66UqgIo2lLsaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="72647179"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2024 22:31:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sphr9-0008RG-17;
	Sun, 15 Sep 2024 05:31:31 +0000
Date: Sun, 15 Sep 2024 13:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/btf.c:6790:1-7: preceding lock on line 6751
Message-ID: <202409151356.ZtWnhDij-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0babf683783ddca06551537c6781e413cfe8d27b
commit: 1e89106da25390826608ad6ac0edfb7c9952eff3 bpf: Add bpf_core_add_cands() and wire it into bpf_core_apply_relo_insn().
date:   2 years, 9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 2 years, 9 months ago
config: i386-randconfig-052-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151356.ZtWnhDij-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409151356.ZtWnhDij-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/btf.c:6790:1-7: preceding lock on line 6751

vim +6790 kernel/bpf/btf.c

1e89106da25390 Alexei Starovoitov 2021-12-01  6739  
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  6740  int bpf_core_apply(struct bpf_core_ctx *ctx, const struct bpf_core_relo *relo,
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  6741  		   int relo_idx, void *insn)
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  6742  {
1e89106da25390 Alexei Starovoitov 2021-12-01  6743  	bool need_cands = relo->kind != BPF_CORE_TYPE_ID_LOCAL;
1e89106da25390 Alexei Starovoitov 2021-12-01  6744  	struct bpf_core_cand_list cands = {};
1e89106da25390 Alexei Starovoitov 2021-12-01  6745  	int err;
1e89106da25390 Alexei Starovoitov 2021-12-01  6746  
1e89106da25390 Alexei Starovoitov 2021-12-01  6747  	if (need_cands) {
1e89106da25390 Alexei Starovoitov 2021-12-01  6748  		struct bpf_cand_cache *cc;
1e89106da25390 Alexei Starovoitov 2021-12-01  6749  		int i;
1e89106da25390 Alexei Starovoitov 2021-12-01  6750  
1e89106da25390 Alexei Starovoitov 2021-12-01 @6751  		mutex_lock(&cand_cache_mutex);
1e89106da25390 Alexei Starovoitov 2021-12-01  6752  		cc = bpf_core_find_cands(ctx, relo->type_id);
1e89106da25390 Alexei Starovoitov 2021-12-01  6753  		if (IS_ERR(cc)) {
1e89106da25390 Alexei Starovoitov 2021-12-01  6754  			bpf_log(ctx->log, "target candidate search failed for %d\n",
1e89106da25390 Alexei Starovoitov 2021-12-01  6755  				relo->type_id);
1e89106da25390 Alexei Starovoitov 2021-12-01  6756  			err = PTR_ERR(cc);
1e89106da25390 Alexei Starovoitov 2021-12-01  6757  			goto out;
1e89106da25390 Alexei Starovoitov 2021-12-01  6758  		}
1e89106da25390 Alexei Starovoitov 2021-12-01  6759  		if (cc->cnt) {
1e89106da25390 Alexei Starovoitov 2021-12-01  6760  			cands.cands = kcalloc(cc->cnt, sizeof(*cands.cands), GFP_KERNEL);
1e89106da25390 Alexei Starovoitov 2021-12-01  6761  			if (!cands.cands) {
1e89106da25390 Alexei Starovoitov 2021-12-01  6762  				err = -ENOMEM;
1e89106da25390 Alexei Starovoitov 2021-12-01  6763  				goto out;
1e89106da25390 Alexei Starovoitov 2021-12-01  6764  			}
1e89106da25390 Alexei Starovoitov 2021-12-01  6765  		}
1e89106da25390 Alexei Starovoitov 2021-12-01  6766  		for (i = 0; i < cc->cnt; i++) {
1e89106da25390 Alexei Starovoitov 2021-12-01  6767  			bpf_log(ctx->log,
1e89106da25390 Alexei Starovoitov 2021-12-01  6768  				"CO-RE relocating %s %s: found target candidate [%d]\n",
1e89106da25390 Alexei Starovoitov 2021-12-01  6769  				btf_kind_str[cc->kind], cc->name, cc->cands[i].id);
1e89106da25390 Alexei Starovoitov 2021-12-01  6770  			cands.cands[i].btf = cc->cands[i].btf;
1e89106da25390 Alexei Starovoitov 2021-12-01  6771  			cands.cands[i].id = cc->cands[i].id;
1e89106da25390 Alexei Starovoitov 2021-12-01  6772  		}
1e89106da25390 Alexei Starovoitov 2021-12-01  6773  		cands.len = cc->cnt;
1e89106da25390 Alexei Starovoitov 2021-12-01  6774  		/* cand_cache_mutex needs to span the cache lookup and
1e89106da25390 Alexei Starovoitov 2021-12-01  6775  		 * copy of btf pointer into bpf_core_cand_list,
1e89106da25390 Alexei Starovoitov 2021-12-01  6776  		 * since module can be unloaded while bpf_core_apply_relo_insn
1e89106da25390 Alexei Starovoitov 2021-12-01  6777  		 * is working with module's btf.
1e89106da25390 Alexei Starovoitov 2021-12-01  6778  		 */
1e89106da25390 Alexei Starovoitov 2021-12-01  6779  	}
1e89106da25390 Alexei Starovoitov 2021-12-01  6780  
1e89106da25390 Alexei Starovoitov 2021-12-01  6781  	err = bpf_core_apply_relo_insn((void *)ctx->log, insn, relo->insn_off / 8,
1e89106da25390 Alexei Starovoitov 2021-12-01  6782  				       relo, relo_idx, ctx->btf, &cands);
1e89106da25390 Alexei Starovoitov 2021-12-01  6783  out:
1e89106da25390 Alexei Starovoitov 2021-12-01  6784  	if (need_cands) {
1e89106da25390 Alexei Starovoitov 2021-12-01  6785  		kfree(cands.cands);
1e89106da25390 Alexei Starovoitov 2021-12-01  6786  		mutex_unlock(&cand_cache_mutex);
1e89106da25390 Alexei Starovoitov 2021-12-01  6787  		if (ctx->log->level & BPF_LOG_LEVEL2)
1e89106da25390 Alexei Starovoitov 2021-12-01  6788  			print_cand_cache(ctx->log);
1e89106da25390 Alexei Starovoitov 2021-12-01  6789  	}
1e89106da25390 Alexei Starovoitov 2021-12-01 @6790  	return err;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
