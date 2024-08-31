Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24617125B9
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725111433; cv=none; b=BNtbAkA83zhFBws4ZGA64ba5FMh8pVebs2PCnsgcBiF2+ssNPHo7QwnpPlToflObFohtMZG8z2xmkO+XJqBEWcuCdIjMuSLuAZ804ayoYZfiIFfixlBw10K0mwowFDT0bDdSPGRgALseJBJTZX4dcOrTEvW1iRlyTWQTr/5A4+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725111433; c=relaxed/simple;
	bh=Y9s7G99ICDfnNL0RmoBQTp0GFBcEau2dc4DlnOu3844=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ntszg1tKAQ/18LOYAmQsTRZmsnnbyV8vqbRWPfOfJz0JJ1Af+s5BBr/8vEkjF+Ri8BGBNdBWytcHLNi5591ie3wV2g//Z6F+V89vg4oDIhPhPYBmWxo+ssd2aT2nHbJFeDiIpGPYqC17tTW6PNlj714M/2HuWsnr8yg9+cyQZHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Egr+x6cB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Egr+x6cB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725111431; x=1756647431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y9s7G99ICDfnNL0RmoBQTp0GFBcEau2dc4DlnOu3844=;
  b=Egr+x6cBM3RzpzpzydXGOSYjpWvX+SK9OZe76OHrf84J4PUy02sKKrNf
   ngjbC7USrWqEFuRLM0RLSLDFqKiUugzHIdItXteXCrRT9nZOgDW24nfhi
   f/qYZSKSRLnz28PVHlwUkGOnZd8HvwJA9zDV6QIqM4mVh8v58tMf5InOn
   XQHlvSYOMOBfeU4iILkHdzaVJ+T2/9QNE7mqAKSRKTdDsnFCwVb2jeZdb
   O8rPdr3Jevaw/vgxOGXfKB10R5m812bpWe31/ADsq3OByxEdw3chjUgSp
   sLfmbHYv1nqC+5rZjGTU0OoLfhFlfV/CxEtVSkHatx+cTYojAZ/0m7UqT
   w==;
X-CSE-ConnectionGUID: lZUeeGDBTo+qxNcUifaZzg==
X-CSE-MsgGUID: Ns/2dhq3QdCxd/ES4fgfQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23880260"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23880260"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 06:37:08 -0700
X-CSE-ConnectionGUID: qop4FHiXRvukBaVqMQVehw==
X-CSE-MsgGUID: qkP+yI73SAesz0ldC9k0ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="68996331"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Aug 2024 06:37:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skOHp-0002n0-0c;
	Sat, 31 Aug 2024 13:37:05 +0000
Date: Sat, 31 Aug 2024 21:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vbabka:slub-percpu-sheaves-v1r1 13/13] mm/slub.c:5070 free_to_pcs()
 error: we previously assumed 'pcs' could be null (see line 5069)
Message-ID: <202408312123.B5VrU0tZ-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r1
head:   000f7cce0fe19452a5ecbc350b16d7d8ac68d8ba
commit: 000f7cce0fe19452a5ecbc350b16d7d8ac68d8ba [13/13] mm, slub: cheaper locking for percpu sheaves
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: parisc-randconfig-r071-20240831 (https://download.01.org/0day-ci/archive/20240831/202408312123.B5VrU0tZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408312123.B5VrU0tZ-lkp@intel.com/

smatch warnings:
mm/slub.c:5070 free_to_pcs() error: we previously assumed 'pcs' could be null (see line 5069)

vim +/pcs +5070 mm/slub.c

81819f0fc8285a Christoph Lameter 2007-05-06  5001  
9488f19d44934d Vlastimil Babka   2023-11-15  5002  /*
9488f19d44934d Vlastimil Babka   2023-11-15  5003   * Free an object to the percpu sheaves.
9488f19d44934d Vlastimil Babka   2023-11-15  5004   * The object is expected to have passed slab_free_hook() already.
9488f19d44934d Vlastimil Babka   2023-11-15  5005   */
9488f19d44934d Vlastimil Babka   2023-11-15  5006  static __fastpath_inline
000f7cce0fe194 Vlastimil Babka   2024-08-28  5007  bool free_to_pcs(struct kmem_cache *s, void *object)
9488f19d44934d Vlastimil Babka   2023-11-15  5008  {
9488f19d44934d Vlastimil Babka   2023-11-15  5009  	struct slub_percpu_sheaves *pcs;
9488f19d44934d Vlastimil Babka   2023-11-15  5010  
9488f19d44934d Vlastimil Babka   2023-11-15  5011  restart:
000f7cce0fe194 Vlastimil Babka   2024-08-28  5012  	pcs = cpu_sheaves_trylock(s->cpu_sheaves);
000f7cce0fe194 Vlastimil Babka   2024-08-28  5013  	if (!pcs)
000f7cce0fe194 Vlastimil Babka   2024-08-28  5014  		return false;
9488f19d44934d Vlastimil Babka   2023-11-15  5015  
9488f19d44934d Vlastimil Babka   2023-11-15  5016  	if (unlikely(pcs->main->size == s->sheaf_capacity)) {
9488f19d44934d Vlastimil Babka   2023-11-15  5017  
9488f19d44934d Vlastimil Babka   2023-11-15  5018  		struct slab_sheaf *empty;
9488f19d44934d Vlastimil Babka   2023-11-15  5019  
9488f19d44934d Vlastimil Babka   2023-11-15  5020  		if (!pcs->spare) {
9488f19d44934d Vlastimil Babka   2023-11-15  5021  			empty = barn_get_empty_sheaf(pcs->barn);
9488f19d44934d Vlastimil Babka   2023-11-15  5022  			if (empty) {
9488f19d44934d Vlastimil Babka   2023-11-15  5023  				pcs->spare = pcs->main;
9488f19d44934d Vlastimil Babka   2023-11-15  5024  				pcs->main = empty;
9488f19d44934d Vlastimil Babka   2023-11-15  5025  				goto do_free;
9488f19d44934d Vlastimil Babka   2023-11-15  5026  			}
9488f19d44934d Vlastimil Babka   2023-11-15  5027  			goto alloc_empty;
9488f19d44934d Vlastimil Babka   2023-11-15  5028  		}
9488f19d44934d Vlastimil Babka   2023-11-15  5029  
9488f19d44934d Vlastimil Babka   2023-11-15  5030  		if (pcs->spare->size < s->sheaf_capacity) {
9488f19d44934d Vlastimil Babka   2023-11-15  5031  			stat(s, SHEAF_SWAP);
9488f19d44934d Vlastimil Babka   2023-11-15  5032  			swap(pcs->main, pcs->spare);
9488f19d44934d Vlastimil Babka   2023-11-15  5033  			goto do_free;
9488f19d44934d Vlastimil Babka   2023-11-15  5034  		}
9488f19d44934d Vlastimil Babka   2023-11-15  5035  
9488f19d44934d Vlastimil Babka   2023-11-15  5036  		empty = barn_replace_full_sheaf(pcs->barn, pcs->main);
9488f19d44934d Vlastimil Babka   2023-11-15  5037  
9488f19d44934d Vlastimil Babka   2023-11-15  5038  		if (!IS_ERR(empty)) {
9488f19d44934d Vlastimil Babka   2023-11-15  5039  			pcs->main = empty;
9488f19d44934d Vlastimil Babka   2023-11-15  5040  			goto do_free;
9488f19d44934d Vlastimil Babka   2023-11-15  5041  		}
9488f19d44934d Vlastimil Babka   2023-11-15  5042  
9488f19d44934d Vlastimil Babka   2023-11-15  5043  		if (PTR_ERR(empty) == -E2BIG) {
9488f19d44934d Vlastimil Babka   2023-11-15  5044  			/* Since we got here, spare exists and is full */
9488f19d44934d Vlastimil Babka   2023-11-15  5045  			struct slab_sheaf *to_flush = pcs->spare;
9488f19d44934d Vlastimil Babka   2023-11-15  5046  
9488f19d44934d Vlastimil Babka   2023-11-15  5047  			pcs->spare = NULL;
000f7cce0fe194 Vlastimil Babka   2024-08-28  5048  			cpu_sheaves_unlock(s->cpu_sheaves);
9488f19d44934d Vlastimil Babka   2023-11-15  5049  
9488f19d44934d Vlastimil Babka   2023-11-15  5050  			sheaf_flush(s, to_flush);
9488f19d44934d Vlastimil Babka   2023-11-15  5051  			empty = to_flush;
9488f19d44934d Vlastimil Babka   2023-11-15  5052  			goto got_empty;
9488f19d44934d Vlastimil Babka   2023-11-15  5053  		}
9488f19d44934d Vlastimil Babka   2023-11-15  5054  
9488f19d44934d Vlastimil Babka   2023-11-15  5055  alloc_empty:
000f7cce0fe194 Vlastimil Babka   2024-08-28  5056  		cpu_sheaves_unlock(s->cpu_sheaves);
9488f19d44934d Vlastimil Babka   2023-11-15  5057  
9488f19d44934d Vlastimil Babka   2023-11-15  5058  		empty = alloc_empty_sheaf(s, GFP_NOWAIT);
9488f19d44934d Vlastimil Babka   2023-11-15  5059  
9488f19d44934d Vlastimil Babka   2023-11-15  5060  		if (!empty) {
000f7cce0fe194 Vlastimil Babka   2024-08-28  5061  			if (sheaf_flush_main(s))
9488f19d44934d Vlastimil Babka   2023-11-15  5062  				goto restart;
000f7cce0fe194 Vlastimil Babka   2024-08-28  5063  			else
000f7cce0fe194 Vlastimil Babka   2024-08-28  5064  				return false;
9488f19d44934d Vlastimil Babka   2023-11-15  5065  		}
9488f19d44934d Vlastimil Babka   2023-11-15  5066  
9488f19d44934d Vlastimil Babka   2023-11-15  5067  got_empty:
000f7cce0fe194 Vlastimil Babka   2024-08-28  5068  		pcs = cpu_sheaves_trylock(s->cpu_sheaves);
000f7cce0fe194 Vlastimil Babka   2024-08-28 @5069  		if (!pcs) {
000f7cce0fe194 Vlastimil Babka   2024-08-28 @5070  			barn_put_empty_sheaf(pcs->barn, empty, true);
000f7cce0fe194 Vlastimil Babka   2024-08-28  5071  			return false;
000f7cce0fe194 Vlastimil Babka   2024-08-28  5072  		}
9488f19d44934d Vlastimil Babka   2023-11-15  5073  
9488f19d44934d Vlastimil Babka   2023-11-15  5074  		/*
9488f19d44934d Vlastimil Babka   2023-11-15  5075  		 * if we put any sheaf to barn here, it's because we raced or
9488f19d44934d Vlastimil Babka   2023-11-15  5076  		 * have been migrated to a different cpu, which should be rare
9488f19d44934d Vlastimil Babka   2023-11-15  5077  		 * enough so just ignore the barn's limits to simplify
9488f19d44934d Vlastimil Babka   2023-11-15  5078  		 */
9488f19d44934d Vlastimil Babka   2023-11-15  5079  		if (unlikely(pcs->main->size < s->sheaf_capacity)) {
9488f19d44934d Vlastimil Babka   2023-11-15  5080  			if (!pcs->spare)
9488f19d44934d Vlastimil Babka   2023-11-15  5081  				pcs->spare = empty;
9488f19d44934d Vlastimil Babka   2023-11-15  5082  			else
9488f19d44934d Vlastimil Babka   2023-11-15  5083  				barn_put_empty_sheaf(pcs->barn, empty, true);
9488f19d44934d Vlastimil Babka   2023-11-15  5084  			goto do_free;
9488f19d44934d Vlastimil Babka   2023-11-15  5085  		}
9488f19d44934d Vlastimil Babka   2023-11-15  5086  
9488f19d44934d Vlastimil Babka   2023-11-15  5087  		if (!pcs->spare) {
9488f19d44934d Vlastimil Babka   2023-11-15  5088  			pcs->spare = pcs->main;
9488f19d44934d Vlastimil Babka   2023-11-15  5089  			pcs->main = empty;
9488f19d44934d Vlastimil Babka   2023-11-15  5090  			goto do_free;
9488f19d44934d Vlastimil Babka   2023-11-15  5091  		}
9488f19d44934d Vlastimil Babka   2023-11-15  5092  
9488f19d44934d Vlastimil Babka   2023-11-15  5093  		barn_put_full_sheaf(pcs->barn, pcs->main, true);
9488f19d44934d Vlastimil Babka   2023-11-15  5094  		pcs->main = empty;
9488f19d44934d Vlastimil Babka   2023-11-15  5095  	}
9488f19d44934d Vlastimil Babka   2023-11-15  5096  
9488f19d44934d Vlastimil Babka   2023-11-15  5097  do_free:
9488f19d44934d Vlastimil Babka   2023-11-15  5098  	pcs->main->objects[pcs->main->size++] = object;
9488f19d44934d Vlastimil Babka   2023-11-15  5099  
000f7cce0fe194 Vlastimil Babka   2024-08-28  5100  	cpu_sheaves_unlock(s->cpu_sheaves);
9488f19d44934d Vlastimil Babka   2023-11-15  5101  
9488f19d44934d Vlastimil Babka   2023-11-15  5102  	stat(s, FREE_PCS);
000f7cce0fe194 Vlastimil Babka   2024-08-28  5103  
000f7cce0fe194 Vlastimil Babka   2024-08-28  5104  	return true;
9488f19d44934d Vlastimil Babka   2023-11-15  5105  }
9488f19d44934d Vlastimil Babka   2023-11-15  5106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
