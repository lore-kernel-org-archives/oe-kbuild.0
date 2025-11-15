Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931451C84BD
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763195983; cv=none; b=KUbT4upXbIKkzRx8ODZ1GuByNlJNeNSGkb0Oi/Ym+8fa8BMlH8l70FnfhA6ivUQ4zQGZQuwD/oMbO203lXs1VVZiAGSJjMo7ifaTWNDF6abYak5n8Si+VaC7sCBEZLwiqaHP4/tF+qJOFNIpAsiacC7BFRU4RTgmNt/ZUGu4kAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763195983; c=relaxed/simple;
	bh=/uXHNjpsr/7i9QjzoYxiOCjKoMQMC34I4Dj1Xiw7aVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LhnzLHbRMpv/jvjStB99o+zOhLttrPQRQJ+/TasFH9RfITLO3950i+DZjAT/psUs+OnylpRZvsRcK3O1D/IrXdxHQ0EOJ0wwBtvLgDZRzdjaPzhCfnCHMHaOdAC0Y6C7097YOkKQwkvWubFNXZOyJZF6nzgHG8j6RySLFC6g9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KShjrM6F; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KShjrM6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763195982; x=1794731982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/uXHNjpsr/7i9QjzoYxiOCjKoMQMC34I4Dj1Xiw7aVw=;
  b=KShjrM6FRUA/M5TghrqKyZ8q9M7J2TFpocxh8K3assyDX0N7gItRBWlb
   owVi6SgykPjdDmeOYYtmVIlk81ESxMJthTGGrQR0xcms6oUabbpWVidYm
   dGQ+xEljQQheuPT/a76Bg0ayADO4hySeg7qgPDKfDQtzqremlNTjuLNu8
   y9wkqqqRn/TbLkrNtcRw/cZ9iygtL1NRa9xUOuQ1kEgBY+OjqhhA1Cvih
   /gDLN6o3bBcKPAm+aA53rOnBn9Oq3dM/Bd/LRvfqXtKPaTmgVcigryTGx
   67DFeD0orRsEb/fN6h/PVT4XrMtx27+wBy8+SMEHjhlqxGw5+ddm+ONMT
   A==;
X-CSE-ConnectionGUID: Ztv+R9O5SK2oxTSfQNPQEQ==
X-CSE-MsgGUID: JkFsZR9SRrGAdFOHzN8utQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76382331"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="76382331"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 00:39:42 -0800
X-CSE-ConnectionGUID: vYnrd0GwQzWh+uvS3lg4JQ==
X-CSE-MsgGUID: RSPyHgLsSsmT3U+ZlcA0EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="190028485"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Nov 2025 00:39:40 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKBon-0007ox-1I;
	Sat, 15 Nov 2025 08:39:37 +0000
Date: Sat, 15 Nov 2025 16:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] mm/huge_memory: consolidate order-related checks into
 folio_split_supported()
Message-ID: <202511151652.GKPwEctt-lkp@intel.com>
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
In-Reply-To: <20251114075703.10434-1-richard.weiyang@gmail.com>
References: <20251114075703.10434-1-richard.weiyang@gmail.com>
TO: Wei Yang <richard.weiyang@gmail.com>
TO: willy@infradead.org
TO: akpm@linux-foundation.org
TO: david@kernel.org
TO: lorenzo.stoakes@oracle.com
TO: Liam.Howlett@oracle.com
TO: vbabka@suse.cz
TO: rppt@kernel.org
TO: surenb@google.com
TO: mhocko@suse.com
TO: ziy@nvidia.com
TO: baolin.wang@linux.alibaba.com
TO: npache@redhat.com
TO: ryan.roberts@arm.com
TO: dev.jain@arm.com
TO: baohua@kernel.org
TO: lance.yang@linux.dev
CC: linux-fsdevel@vger.kernel.org
CC: linux-mm@kvack.org
CC: Wei Yang <richard.weiyang@gmail.com>

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-huge_memory-consolidate-order-related-checks-into-folio_split_supported/20251114-155833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251114075703.10434-1-richard.weiyang%40gmail.com
patch subject: [PATCH] mm/huge_memory: consolidate order-related checks into folio_split_supported()
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-141-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151652.GKPwEctt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511151652.GKPwEctt-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:3696 folio_split_supported() warn: signedness bug returning '(-22)'

vim +3696 mm/huge_memory.c

00527733d0dc80 Zi Yan   2025-03-07  3689  
aa27253af32c74 Wei Yang 2025-11-06  3690  bool folio_split_supported(struct folio *folio, unsigned int new_order,
aa27253af32c74 Wei Yang 2025-11-06  3691  		enum split_type split_type, bool warns)
58729c04cf1092 Zi Yan   2025-03-07  3692  {
ab62f1bb0caaa5 Wei Yang 2025-11-14  3693  	const int old_order = folio_order(folio);
ab62f1bb0caaa5 Wei Yang 2025-11-14  3694  
ab62f1bb0caaa5 Wei Yang 2025-11-14  3695  	if (new_order >= old_order)
ab62f1bb0caaa5 Wei Yang 2025-11-14 @3696  		return -EINVAL;
ab62f1bb0caaa5 Wei Yang 2025-11-14  3697  
58729c04cf1092 Zi Yan   2025-03-07  3698  	if (folio_test_anon(folio)) {
58729c04cf1092 Zi Yan   2025-03-07  3699  		/* order-1 is not supported for anonymous THP. */
58729c04cf1092 Zi Yan   2025-03-07  3700  		VM_WARN_ONCE(warns && new_order == 1,
58729c04cf1092 Zi Yan   2025-03-07  3701  				"Cannot split to order-1 folio");
28753037121116 Zi Yan   2025-11-05  3702  		if (new_order == 1)
28753037121116 Zi Yan   2025-11-05  3703  			return false;
ab62f1bb0caaa5 Wei Yang 2025-11-14  3704  	} else {
ab62f1bb0caaa5 Wei Yang 2025-11-14  3705  		const struct address_space *mapping = NULL;
ab62f1bb0caaa5 Wei Yang 2025-11-14  3706  
ab62f1bb0caaa5 Wei Yang 2025-11-14  3707  		mapping = folio->mapping;
ab62f1bb0caaa5 Wei Yang 2025-11-14  3708  
ab62f1bb0caaa5 Wei Yang 2025-11-14  3709  		/* Truncated ? */
ab62f1bb0caaa5 Wei Yang 2025-11-14  3710  		/*
ab62f1bb0caaa5 Wei Yang 2025-11-14  3711  		 * TODO: add support for large shmem folio in swap cache.
ab62f1bb0caaa5 Wei Yang 2025-11-14  3712  		 * When shmem is in swap cache, mapping is NULL and
ab62f1bb0caaa5 Wei Yang 2025-11-14  3713  		 * folio_test_swapcache() is true.
ab62f1bb0caaa5 Wei Yang 2025-11-14  3714  		 */
ab62f1bb0caaa5 Wei Yang 2025-11-14  3715  		if (!mapping)
ab62f1bb0caaa5 Wei Yang 2025-11-14  3716  			return false;
ab62f1bb0caaa5 Wei Yang 2025-11-14  3717  
58729c04cf1092 Zi Yan   2025-03-07  3718  		/*
ab62f1bb0caaa5 Wei Yang 2025-11-14  3719  		 * We have two types of split:
ab62f1bb0caaa5 Wei Yang 2025-11-14  3720  		 *
ab62f1bb0caaa5 Wei Yang 2025-11-14  3721  		 *   a) uniform split: split folio directly to new_order.
ab62f1bb0caaa5 Wei Yang 2025-11-14  3722  		 *   b) non-uniform split: create after-split folios with
ab62f1bb0caaa5 Wei Yang 2025-11-14  3723  		 *      orders from (old_order - 1) to new_order.
ab62f1bb0caaa5 Wei Yang 2025-11-14  3724  		 *
ab62f1bb0caaa5 Wei Yang 2025-11-14  3725  		 * For file system, we encodes it supported folio order in
ab62f1bb0caaa5 Wei Yang 2025-11-14  3726  		 * mapping->flags, which could be checked by
ab62f1bb0caaa5 Wei Yang 2025-11-14  3727  		 * mapping_folio_order_supported().
aa27253af32c74 Wei Yang 2025-11-06  3728  		 *
ab62f1bb0caaa5 Wei Yang 2025-11-14  3729  		 * With these knowledge, we can know whether folio support
ab62f1bb0caaa5 Wei Yang 2025-11-14  3730  		 * split to new_order by:
aa27253af32c74 Wei Yang 2025-11-06  3731  		 *
ab62f1bb0caaa5 Wei Yang 2025-11-14  3732  		 *   1. check new_order is supported first
ab62f1bb0caaa5 Wei Yang 2025-11-14  3733  		 *   2. check (old_order - 1) is supported if
ab62f1bb0caaa5 Wei Yang 2025-11-14  3734  		 *      SPLIT_TYPE_NON_UNIFORM
58729c04cf1092 Zi Yan   2025-03-07  3735  		 */
ab62f1bb0caaa5 Wei Yang 2025-11-14  3736  		if (!mapping_folio_order_supported(mapping, new_order)) {
58729c04cf1092 Zi Yan   2025-03-07  3737  			VM_WARN_ONCE(warns,
ab62f1bb0caaa5 Wei Yang 2025-11-14  3738  				"Cannot split file folio to unsupported order: %d", new_order);
ab62f1bb0caaa5 Wei Yang 2025-11-14  3739  			return false;
ab62f1bb0caaa5 Wei Yang 2025-11-14  3740  		}
ab62f1bb0caaa5 Wei Yang 2025-11-14  3741  		if (split_type == SPLIT_TYPE_NON_UNIFORM
ab62f1bb0caaa5 Wei Yang 2025-11-14  3742  		    && !mapping_folio_order_supported(mapping, old_order - 1)) {
ab62f1bb0caaa5 Wei Yang 2025-11-14  3743  			VM_WARN_ONCE(warns,
ab62f1bb0caaa5 Wei Yang 2025-11-14  3744  				"Cannot split file folio to unsupported order: %d", old_order - 1);
58729c04cf1092 Zi Yan   2025-03-07  3745  			return false;
58729c04cf1092 Zi Yan   2025-03-07  3746  		}
58729c04cf1092 Zi Yan   2025-03-07  3747  	}
58729c04cf1092 Zi Yan   2025-03-07  3748  
aa27253af32c74 Wei Yang 2025-11-06  3749  	/*
aa27253af32c74 Wei Yang 2025-11-06  3750  	 * swapcache folio could only be split to order 0
aa27253af32c74 Wei Yang 2025-11-06  3751  	 *
aa27253af32c74 Wei Yang 2025-11-06  3752  	 * non-uniform split creates after-split folios with orders from
aa27253af32c74 Wei Yang 2025-11-06  3753  	 * folio_order(folio) - 1 to new_order, making it not suitable for any
aa27253af32c74 Wei Yang 2025-11-06  3754  	 * swapcache folio split. Only uniform split to order-0 can be used
aa27253af32c74 Wei Yang 2025-11-06  3755  	 * here.
aa27253af32c74 Wei Yang 2025-11-06  3756  	 */
aa27253af32c74 Wei Yang 2025-11-06  3757  	if ((split_type == SPLIT_TYPE_NON_UNIFORM || new_order) && folio_test_swapcache(folio)) {
58729c04cf1092 Zi Yan   2025-03-07  3758  		VM_WARN_ONCE(warns,
58729c04cf1092 Zi Yan   2025-03-07  3759  			"Cannot split swapcache folio to non-0 order");
58729c04cf1092 Zi Yan   2025-03-07  3760  		return false;
58729c04cf1092 Zi Yan   2025-03-07  3761  	}
58729c04cf1092 Zi Yan   2025-03-07  3762  
58729c04cf1092 Zi Yan   2025-03-07  3763  	return true;
58729c04cf1092 Zi Yan   2025-03-07  3764  }
58729c04cf1092 Zi Yan   2025-03-07  3765  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
