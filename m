Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5421CDFD4
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Feb 2025 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941444; cv=none; b=Oa6iWOoAWqSL50nCSLhkUmu3y1jPpsU5SBfqGRSKE5MdiDUk4GIiEpkBp/Ko1lGhrOVMVryrsB6a1ZrkV9dLFsy8eY075tV/oqWnF8xARmsMxRILsmMYa/UOHnZDjar7trEHQrlr6D6fVFX+myBdXlkvUC0ZnPA5Uiznu1KRI5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941444; c=relaxed/simple;
	bh=HVeHNq8Pf4BBQLwGJExcOscywwPjnbVToFdos6mjpro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BSXIALQJPbLI7OLOqHSAs2YoPR9VsTemWSn/b9FMRF8gEP5LzygIrT3hO2TmJtxg5pomaXE76J4IV84kxi59VKLX16Jk/zLdKo6gRxiF34xihJRDNcGvPpW8BZ+aNYkhqf7ivaB1sx7S9aONKm1DN8k4icQ9CG3cFnat7RprXVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlH9HfkW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlH9HfkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941443; x=1770477443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HVeHNq8Pf4BBQLwGJExcOscywwPjnbVToFdos6mjpro=;
  b=LlH9HfkWLxgRoQhwflR36kNrio0yWMgn9bNwh6ZHkP85WCWMkow8LCWq
   Uvusv5itzYUTOglOnuK2VQLrKos1B53ThCocjpUrxSfqSPSZ7ns+48h/H
   Rfjq9jd5HHxBbC0k0zsFmYNx7Em7LCruGfXwL0b7Tvg4kRW8q120Oy7Sq
   zw/u9m2Bs7O0dCVZyQ/C4GRNXVtGOJT03GFpgqkw0pRkAkpF5FTlxS/sK
   lux9n0MCt8NchCFiX0x2wuZpSAyswPrzcDGKOnxdoZQOd4BKdJPmHbFSq
   9Fj1aBRK3A4Vsp69YD9jBJ6ghxqDKNff1h/ZrD3RQ6IaywddVWyXTSwgU
   Q==;
X-CSE-ConnectionGUID: eChkHmdBQk6ROZ/Xkkyl+g==
X-CSE-MsgGUID: qJgRNEwXS5SPL17Isge3/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57000471"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="57000471"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:17:20 -0800
X-CSE-ConnectionGUID: OiGy7mc8T2WGPxTbPKTjJg==
X-CSE-MsgGUID: 40Y7A2VYRNeblwMfh4bsPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111756914"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Feb 2025 07:17:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgQ6W-000yVb-2f;
	Fri, 07 Feb 2025 15:17:16 +0000
Date: Fri, 7 Feb 2025 23:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 535/2219]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:364:12-13: WARNING kvmalloc
 is used to allocate this memory at line 339
Message-ID: <202502072302.0LtlLytB-lkp@intel.com>
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
TO: Zhi Wang <zhiw@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed58d103e6da15a442ff87567898768dc3a66987
commit: 50f290053d79e3b1d108f181c0ba6b8e30ca94c9 [535/2219] drm/nouveau: support handling the return of large GSP message
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: alpha-randconfig-r064-20250207 (https://download.01.org/0day-ci/archive/20250207/202502072302.0LtlLytB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502072302.0LtlLytB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:364:12-13: WARNING kvmalloc is used to allocate this memory at line 339
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:373:12-13: WARNING kvmalloc is used to allocate this memory at line 339

vim +364 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

3c48ecb38a736bf Zhi Wang   2025-01-24  322  
3c48ecb38a736bf Zhi Wang   2025-01-24  323  static void *
3c48ecb38a736bf Zhi Wang   2025-01-24  324  r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
3c48ecb38a736bf Zhi Wang   2025-01-24  325  {
50f290053d79e3b Zhi Wang   2025-01-24  326  	struct r535_gsp_msg *mqe;
50f290053d79e3b Zhi Wang   2025-01-24  327  	const u32 max_rpc_size = GSP_MSG_MAX_SIZE - sizeof(*mqe);
50f290053d79e3b Zhi Wang   2025-01-24  328  	struct nvfw_gsp_rpc *rpc;
3c48ecb38a736bf Zhi Wang   2025-01-24  329  	struct r535_gsp_msg_info info = {0};
50f290053d79e3b Zhi Wang   2025-01-24  330  	u32 expected = gsp_rpc_len;
3c48ecb38a736bf Zhi Wang   2025-01-24  331  	void *buf;
3c48ecb38a736bf Zhi Wang   2025-01-24  332  
50f290053d79e3b Zhi Wang   2025-01-24  333  	mqe = r535_gsp_msgq_get_entry(gsp);
50f290053d79e3b Zhi Wang   2025-01-24  334  	rpc = (struct nvfw_gsp_rpc *)mqe->data;
50f290053d79e3b Zhi Wang   2025-01-24  335  
50f290053d79e3b Zhi Wang   2025-01-24  336  	if (WARN_ON(rpc->length > max_rpc_size))
50f290053d79e3b Zhi Wang   2025-01-24  337  		return NULL;
50f290053d79e3b Zhi Wang   2025-01-24  338  
50f290053d79e3b Zhi Wang   2025-01-24 @339  	buf = kvmalloc(max_t(u32, rpc->length, expected), GFP_KERNEL);
3c48ecb38a736bf Zhi Wang   2025-01-24  340  	if (!buf)
3c48ecb38a736bf Zhi Wang   2025-01-24  341  		return ERR_PTR(-ENOMEM);
3c48ecb38a736bf Zhi Wang   2025-01-24  342  
3c48ecb38a736bf Zhi Wang   2025-01-24  343  	info.gsp_rpc_buf = buf;
3c48ecb38a736bf Zhi Wang   2025-01-24  344  	info.retries = retries;
50f290053d79e3b Zhi Wang   2025-01-24  345  	info.gsp_rpc_len = rpc->length;
3c48ecb38a736bf Zhi Wang   2025-01-24  346  
3c48ecb38a736bf Zhi Wang   2025-01-24  347  	buf = r535_gsp_msgq_recv_one_elem(gsp, &info);
3c48ecb38a736bf Zhi Wang   2025-01-24  348  	if (IS_ERR(buf)) {
3c48ecb38a736bf Zhi Wang   2025-01-24  349  		kvfree(info.gsp_rpc_buf);
3c48ecb38a736bf Zhi Wang   2025-01-24  350  		info.gsp_rpc_buf = NULL;
3c48ecb38a736bf Zhi Wang   2025-01-24  351  	}
3c48ecb38a736bf Zhi Wang   2025-01-24  352  
50f290053d79e3b Zhi Wang   2025-01-24  353  	if (expected <= max_rpc_size)
50f290053d79e3b Zhi Wang   2025-01-24  354  		return buf;
50f290053d79e3b Zhi Wang   2025-01-24  355  
50f290053d79e3b Zhi Wang   2025-01-24  356  	info.gsp_rpc_buf += info.gsp_rpc_len;
50f290053d79e3b Zhi Wang   2025-01-24  357  	expected -= info.gsp_rpc_len;
50f290053d79e3b Zhi Wang   2025-01-24  358  
50f290053d79e3b Zhi Wang   2025-01-24  359  	while (expected) {
50f290053d79e3b Zhi Wang   2025-01-24  360  		u32 size;
50f290053d79e3b Zhi Wang   2025-01-24  361  
50f290053d79e3b Zhi Wang   2025-01-24  362  		rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), info.retries);
50f290053d79e3b Zhi Wang   2025-01-24  363  		if (IS_ERR_OR_NULL(rpc)) {
50f290053d79e3b Zhi Wang   2025-01-24 @364  			kfree(buf);
50f290053d79e3b Zhi Wang   2025-01-24  365  			return rpc;
50f290053d79e3b Zhi Wang   2025-01-24  366  		}
50f290053d79e3b Zhi Wang   2025-01-24  367  
50f290053d79e3b Zhi Wang   2025-01-24  368  		info.gsp_rpc_len = rpc->length;
50f290053d79e3b Zhi Wang   2025-01-24  369  		info.continuation = true;
50f290053d79e3b Zhi Wang   2025-01-24  370  
50f290053d79e3b Zhi Wang   2025-01-24  371  		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
50f290053d79e3b Zhi Wang   2025-01-24  372  		if (IS_ERR_OR_NULL(rpc)) {
50f290053d79e3b Zhi Wang   2025-01-24  373  			kfree(buf);
50f290053d79e3b Zhi Wang   2025-01-24  374  			return rpc;
50f290053d79e3b Zhi Wang   2025-01-24  375  		}
50f290053d79e3b Zhi Wang   2025-01-24  376  
50f290053d79e3b Zhi Wang   2025-01-24  377  		size = info.gsp_rpc_len - sizeof(*rpc);
50f290053d79e3b Zhi Wang   2025-01-24  378  		expected -= size;
50f290053d79e3b Zhi Wang   2025-01-24  379  		info.gsp_rpc_buf += size;
50f290053d79e3b Zhi Wang   2025-01-24  380  	}
50f290053d79e3b Zhi Wang   2025-01-24  381  
50f290053d79e3b Zhi Wang   2025-01-24  382  	rpc = buf;
50f290053d79e3b Zhi Wang   2025-01-24  383  	rpc->length = gsp_rpc_len;
3c48ecb38a736bf Zhi Wang   2025-01-24  384  	return buf;
176fdcbddfd2884 Ben Skeggs 2023-09-19  385  }
176fdcbddfd2884 Ben Skeggs 2023-09-19  386  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
