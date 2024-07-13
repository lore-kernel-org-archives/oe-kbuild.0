Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F83F47A62
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720860677; cv=none; b=Klr7TO7pE8L32ZGtJExtUxuJt75VL4CP0LVShGW1UskYjGTXV+lAcCpz1VeMZP+ZfryALlVUJv7qDdbvUvTigRVV0Uw503J5lXmbJKYDjMH83MHL2PPSQTSnfvoRskSi+cVOONQTnJlpVWu9xJ4R4ctZj5G2W100lEu0MWTFqkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720860677; c=relaxed/simple;
	bh=dfxGiiT2tvfhoj3yF/IfTpfvXK20Oh44nxFzFuB/uXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUtDMabWigkCK8LgcLDxmDif0B1MFpKgf6TmJSQDNaS1ZuduB5w8R3edyOkiTmhmRBrSSHe2RKT2KkQWIRPk/bndShWmM5IWJDfbLTH6SYZncbpm2Q08WHZ8NZm7WAHgNE4LKM01M9SWo6mHH+1kwSI+tMUe+SDdmxjbNSNDbnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YF09kEKs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YF09kEKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720860675; x=1752396675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dfxGiiT2tvfhoj3yF/IfTpfvXK20Oh44nxFzFuB/uXo=;
  b=YF09kEKsZh8xTOhOXrhUZPMETUe2JzvSuq0wB7sn87DktnaF9uDkdctA
   cP4008xXaLSIo8rjcEHxt9OQH+9pthC38B/BaFwyAGcjeq3HR+oxwmy9n
   rLOviTzNGHImALgypTa8JCGJoJxyKuH8I0odsb+ta4J1yXqchtMqcr2iA
   3dKgPzbrOGWSImSlkLtleFAZkFF8NLhO+jp40nXwyDGDhLPiPdatk5bYN
   QKLx3b1zpqpC1hZjjp3zp64bfGELpj0/JMWr1wHfdgHYWY640mIhze9X0
   p9ECFYmqp/FPh4f66E5UQYyrW942Eud1WgGMKwMXshveX4bIe/n/u7p5J
   A==;
X-CSE-ConnectionGUID: bQqt17tmRa69bbgFUG7sog==
X-CSE-MsgGUID: BMyoaYNnTU+rsUy+bgtYZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18175584"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="18175584"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 01:51:12 -0700
X-CSE-ConnectionGUID: dPGyh9xySJKPUVwxwhgf8Q==
X-CSE-MsgGUID: /Ijz8GQRSNeHtQGcjB6gbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="54317319"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jul 2024 01:51:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSYTE-000btc-0a;
	Sat, 13 Jul 2024 08:51:08 +0000
Date: Sat, 13 Jul 2024 16:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vbabka:slub-percpu-sheaves-v1r0 8/12] mm/slub.c:5029
 free_to_pcs_bulk() error: uninitialized symbol 'i'.
Message-ID: <202407131609.zTNeF569-lkp@intel.com>
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
TO: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r0
head:   9cb4096680ee90fe6be1b22ff3961174fa8e3ee4
commit: 6912a14dbbe63891a545d4cd35b60bcd3dee3d40 [8/12] mm/slub: add opt-in caching layer of percpu sheaves
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r071-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131609.zTNeF569-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407131609.zTNeF569-lkp@intel.com/

smatch warnings:
mm/slub.c:5029 free_to_pcs_bulk() error: uninitialized symbol 'i'.

vim +/i +5029 mm/slub.c

6912a14dbbe638 Vlastimil Babka 2023-11-15  5013  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5014  /*
6912a14dbbe638 Vlastimil Babka 2023-11-15  5015   * Bulk free objects to the percpu sheaves.
6912a14dbbe638 Vlastimil Babka 2023-11-15  5016   * Unlike free_to_pcs() this has includes the calls to all necessary hooks
6912a14dbbe638 Vlastimil Babka 2023-11-15  5017   * and the fallback to freeing to slab pages.
6912a14dbbe638 Vlastimil Babka 2023-11-15  5018   */
6912a14dbbe638 Vlastimil Babka 2023-11-15  5019  static void free_to_pcs_bulk(struct kmem_cache *s, size_t size, void **p)
6912a14dbbe638 Vlastimil Babka 2023-11-15  5020  {
6912a14dbbe638 Vlastimil Babka 2023-11-15  5021  	struct slub_percpu_sheaves *pcs;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5022  	struct slab_sheaf *main;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5023  	unsigned long flags;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5024  	unsigned batch, i;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5025  	bool init;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5026  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5027  	init = slab_want_init_on_free(s);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5028  
6912a14dbbe638 Vlastimil Babka 2023-11-15 @5029  	while (i < size) {
6912a14dbbe638 Vlastimil Babka 2023-11-15  5030  		struct slab *slab = virt_to_slab(p[i]);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5031  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5032  		memcg_slab_free_hook(s, slab, p[i], 1);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5033  		alloc_tagging_slab_free_hook(s, slab, p[i], 1);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5034  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5035  		if (unlikely(!slab_free_hook(s, p[i], init))) {
6912a14dbbe638 Vlastimil Babka 2023-11-15  5036  			p[i] = p[--size];
6912a14dbbe638 Vlastimil Babka 2023-11-15  5037  			if (!size)
6912a14dbbe638 Vlastimil Babka 2023-11-15  5038  				return;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5039  			continue;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5040  		}
6912a14dbbe638 Vlastimil Babka 2023-11-15  5041  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5042  		i++;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5043  	}
6912a14dbbe638 Vlastimil Babka 2023-11-15  5044  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5045  next_batch:
6912a14dbbe638 Vlastimil Babka 2023-11-15  5046  	local_lock_irqsave(&s->cpu_sheaves->lock, flags);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5047  	pcs = this_cpu_ptr(s->cpu_sheaves);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5048  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5049  	if (unlikely(pcs->main->size == s->sheaf_capacity)) {
6912a14dbbe638 Vlastimil Babka 2023-11-15  5050  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5051  		struct slab_sheaf *empty;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5052  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5053  		if (!pcs->spare) {
6912a14dbbe638 Vlastimil Babka 2023-11-15  5054  			empty = barn_get_empty_sheaf(pcs->barn);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5055  			if (empty) {
6912a14dbbe638 Vlastimil Babka 2023-11-15  5056  				pcs->spare = pcs->main;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5057  				pcs->main = empty;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5058  				goto do_free;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5059  			}
6912a14dbbe638 Vlastimil Babka 2023-11-15  5060  			goto no_empty;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5061  		}
6912a14dbbe638 Vlastimil Babka 2023-11-15  5062  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5063  		if (pcs->spare->size < s->sheaf_capacity) {
6912a14dbbe638 Vlastimil Babka 2023-11-15  5064  			stat(s, SHEAF_SWAP);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5065  			swap(pcs->main, pcs->spare);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5066  			goto do_free;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5067  		}
6912a14dbbe638 Vlastimil Babka 2023-11-15  5068  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5069  		empty = barn_replace_full_sheaf(pcs->barn, pcs->main);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5070  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5071  		if (!IS_ERR(empty)) {
6912a14dbbe638 Vlastimil Babka 2023-11-15  5072  			pcs->main = empty;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5073  			goto do_free;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5074  		}
6912a14dbbe638 Vlastimil Babka 2023-11-15  5075  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5076  no_empty:
6912a14dbbe638 Vlastimil Babka 2023-11-15  5077  		local_unlock_irqrestore(&s->cpu_sheaves->lock, flags);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5078  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5079  		/*
6912a14dbbe638 Vlastimil Babka 2023-11-15  5080  		 * if we depleted all empty sheafs in the barn or there are to
6912a14dbbe638 Vlastimil Babka 2023-11-15  5081  		 * many full sheafs, free the rest to slab pages
6912a14dbbe638 Vlastimil Babka 2023-11-15  5082  		 */
6912a14dbbe638 Vlastimil Babka 2023-11-15  5083  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5084  		__kmem_cache_free_bulk(s, size, p);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5085  		return;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5086  	}
6912a14dbbe638 Vlastimil Babka 2023-11-15  5087  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5088  do_free:
6912a14dbbe638 Vlastimil Babka 2023-11-15  5089  	main = pcs->main;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5090  	batch = min(size, s->sheaf_capacity - main->size);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5091  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5092  	memcpy(main->objects + main->size, p, batch * sizeof(void *));
6912a14dbbe638 Vlastimil Babka 2023-11-15  5093  	main->size += batch;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5094  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5095  	local_unlock_irqrestore(&s->cpu_sheaves->lock, flags);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5096  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5097  	stat_add(s, FREE_PCS, batch);
6912a14dbbe638 Vlastimil Babka 2023-11-15  5098  
6912a14dbbe638 Vlastimil Babka 2023-11-15  5099  	if (batch < size) {
6912a14dbbe638 Vlastimil Babka 2023-11-15  5100  		p += batch;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5101  		size -= batch;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5102  		goto next_batch;
6912a14dbbe638 Vlastimil Babka 2023-11-15  5103  	}
6912a14dbbe638 Vlastimil Babka 2023-11-15  5104  }
6912a14dbbe638 Vlastimil Babka 2023-11-15  5105  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
