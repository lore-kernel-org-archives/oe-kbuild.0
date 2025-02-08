Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7137F125D6
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 01:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738978604; cv=none; b=ihIqb4/2hIzU81wok4EvAf4uzM4Z0CAqKZE66PT/eTf7rZA5KpRqzbdZSHa+TxS/NZESvJ37JVJ5oWzP3uapXoAYKa45+YmlLoFumx/518LezbFerFhzjLGgL6ewISER4aM3j+3xrB4bxTtr0RkZmFMdxUOy9TwKcXxN+zg7GTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738978604; c=relaxed/simple;
	bh=GEmTr0/l2vgpwsXvizWVTXRoTyxZb8kdAbOcJTZYxv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HskpFCKy8uJ8sfEuSzCjMJC02h8Tse8qwgSe9Ygsb/ixne3dn/G7ivyB7W4hDB2s/JwH7qTU3A6/KRnsrBztEsFBE/oWJNNxz2KcKAi0JzUmeejvGrPN95QGVNI8L0OBKUjYUnxcYmQvc/zwNrr3B1GjGMcBkmyfL9r0KA9lr9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1HB/bEw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1HB/bEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738978602; x=1770514602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GEmTr0/l2vgpwsXvizWVTXRoTyxZb8kdAbOcJTZYxv4=;
  b=X1HB/bEwYLROH0erdI30/jz9Qw58nrMyLrKJ7x+dFLq9bJKjJxy4zuaZ
   4D8tsQc46BnGkdJdDNzH1VcJkHgh/k/UdqbsOCBHkP5idSWNaXABfy3jb
   G0aP/Ud0mlx6uRj7wczve297O/M4Py0BwsNywo3bsAtLGadGKedhcu1Pd
   z0O5U2EstmN0Xs1B/kus5HG6FN2PTIxG+AAmsOHD209qWDc6kCgBgX6TZ
   Igp+fDnhmMIyvcxtSsYlf5A/cHQL3HzavbzDeh93YnVS5o+q73LG+MTSz
   O6L8i+Qfodo5Beq7lWgCrDPhnPv4hWQB2OPFDrREcQebBFglIjTdxUO+A
   A==;
X-CSE-ConnectionGUID: tH2sW8kfRMO4LAFlasZVEg==
X-CSE-MsgGUID: O3mYPeJvQ/WUtX0P2KMC8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39323498"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="39323498"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 17:36:42 -0800
X-CSE-ConnectionGUID: +/+xAJUjSW2ZthM7+eXJ4w==
X-CSE-MsgGUID: uPqOuTF4R3OkQz0WO9L/pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116280093"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Feb 2025 17:36:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgZlu-000zMY-1S;
	Sat, 08 Feb 2025 01:36:38 +0000
Date: Sat, 8 Feb 2025 09:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rgushchin:sframe_unwinder.rfc 4/8] kernel/sframe_lookup.c:119
 find_fre() error: uninitialized symbol 'next_row_ip_off'.
Message-ID: <202502080943.kK5a7xH5-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git sframe_unwinder.rfc
head:   0cc3157743fd72033cfa5de243943249f9d67cea
commit: 1ef915ef47cd2f4bbdaa9b10266c281d663d6e03 [4/8] unwind: Implement generic sframe unwinder library
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm64-randconfig-r072-20250208 (https://download.01.org/0day-ci/archive/20250208/202502080943.kK5a7xH5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502080943.kK5a7xH5-lkp@intel.com/

smatch warnings:
kernel/sframe_lookup.c:119 find_fre() error: uninitialized symbol 'next_row_ip_off'.
kernel/sframe_lookup.c:130 find_fre() error: uninitialized symbol 'fre_info'.
kernel/sframe_lookup.c:134 find_fre() error: uninitialized symbol 'offsets_loc'.
kernel/sframe_lookup.c:134 find_fre() error: uninitialized symbol 'offsets_loc'.
kernel/sframe_lookup.c:134 find_fre() error: uninitialized symbol 'offsets_loc'.

vim +/next_row_ip_off +119 kernel/sframe_lookup.c

1ef915ef47cd2f Weinan Liu 2025-01-25   90  
1ef915ef47cd2f Weinan Liu 2025-01-25   91  static int find_fre(const struct sframe_table *tbl, unsigned long pc,
1ef915ef47cd2f Weinan Liu 2025-01-25   92  		const struct sframe_fde *fdep, struct sframe_ip_entry *entry)
1ef915ef47cd2f Weinan Liu 2025-01-25   93  {
1ef915ef47cd2f Weinan Liu 2025-01-25   94  	int i, offset_size, offset_count;
1ef915ef47cd2f Weinan Liu 2025-01-25   95  	char *fres, *offsets_loc;
1ef915ef47cd2f Weinan Liu 2025-01-25   96  	int32_t ip_off;
1ef915ef47cd2f Weinan Liu 2025-01-25   97  	uint32_t next_row_ip_off;
1ef915ef47cd2f Weinan Liu 2025-01-25   98  	uint8_t fre_info, fde_type = SFRAME_FUNC_FDE_TYPE(fdep->info),
1ef915ef47cd2f Weinan Liu 2025-01-25   99  			fre_type = SFRAME_FUNC_FRE_TYPE(fdep->info);
1ef915ef47cd2f Weinan Liu 2025-01-25  100  
1ef915ef47cd2f Weinan Liu 2025-01-25  101  	fres = tbl->fre_p + fdep->fres_off;
1ef915ef47cd2f Weinan Liu 2025-01-25  102  
1ef915ef47cd2f Weinan Liu 2025-01-25  103  	/*  Whether PCs in the FREs should be treated as masks or not */
1ef915ef47cd2f Weinan Liu 2025-01-25  104  	if (fde_type == SFRAME_FDE_TYPE_PCMASK)
1ef915ef47cd2f Weinan Liu 2025-01-25  105  		ip_off = pc % fdep->rep_size;
1ef915ef47cd2f Weinan Liu 2025-01-25  106  	else
1ef915ef47cd2f Weinan Liu 2025-01-25  107  		ip_off = (int32_t)(pc - (unsigned long)tbl->sfhdr_p) - fdep->start_addr;
1ef915ef47cd2f Weinan Liu 2025-01-25  108  
1ef915ef47cd2f Weinan Liu 2025-01-25  109  	if (ip_off < 0 || ip_off >= fdep->size)
1ef915ef47cd2f Weinan Liu 2025-01-25  110  		return -EINVAL;
1ef915ef47cd2f Weinan Liu 2025-01-25  111  
1ef915ef47cd2f Weinan Liu 2025-01-25  112  	/*
1ef915ef47cd2f Weinan Liu 2025-01-25  113  	 * FRE structure starts by address of the entry with variants length. Use
1ef915ef47cd2f Weinan Liu 2025-01-25  114  	 * two pointers to track current head(fres) and the address of last
1ef915ef47cd2f Weinan Liu 2025-01-25  115  	 * offset(offsets_loc)
1ef915ef47cd2f Weinan Liu 2025-01-25  116  	 */
1ef915ef47cd2f Weinan Liu 2025-01-25  117  	for (i = 0; i < fdep->fres_num; i++) {
1ef915ef47cd2f Weinan Liu 2025-01-25  118  		SFRAME_READ_ROW_ADDR(fres, next_row_ip_off, fre_type);
1ef915ef47cd2f Weinan Liu 2025-01-25 @119  		if (ip_off < next_row_ip_off)
1ef915ef47cd2f Weinan Liu 2025-01-25  120  			break;
1ef915ef47cd2f Weinan Liu 2025-01-25  121  		SFRAME_READ_TYPE(fres, fre_info, u8);
1ef915ef47cd2f Weinan Liu 2025-01-25  122  		offsets_loc = fres;
1ef915ef47cd2f Weinan Liu 2025-01-25  123  		/*
1ef915ef47cd2f Weinan Liu 2025-01-25  124  		 * jump to the start of next fre
1ef915ef47cd2f Weinan Liu 2025-01-25  125  		 * fres += fre_offets_cnt*offset_size
1ef915ef47cd2f Weinan Liu 2025-01-25  126  		 */
1ef915ef47cd2f Weinan Liu 2025-01-25  127  		fres += SFRAME_FRE_OFFSET_COUNT(fre_info) << SFRAME_FRE_OFFSET_SIZE(fre_info);
1ef915ef47cd2f Weinan Liu 2025-01-25  128  	}
1ef915ef47cd2f Weinan Liu 2025-01-25  129  
1ef915ef47cd2f Weinan Liu 2025-01-25 @130  	offset_size = 1 << SFRAME_FRE_OFFSET_SIZE(fre_info);
1ef915ef47cd2f Weinan Liu 2025-01-25  131  	offset_count = SFRAME_FRE_OFFSET_COUNT(fre_info);
1ef915ef47cd2f Weinan Liu 2025-01-25  132  
1ef915ef47cd2f Weinan Liu 2025-01-25  133  	if (offset_count > 0) {
1ef915ef47cd2f Weinan Liu 2025-01-25 @134  		SFRAME_READ_ROW_OFFSETS(offsets_loc, entry->cfa_offset, offset_size);
1ef915ef47cd2f Weinan Liu 2025-01-25  135  		offset_count--;
1ef915ef47cd2f Weinan Liu 2025-01-25  136  	}
1ef915ef47cd2f Weinan Liu 2025-01-25  137  	if (offset_count > 0 && !entry->ra_offset) {
1ef915ef47cd2f Weinan Liu 2025-01-25  138  		SFRAME_READ_ROW_OFFSETS(offsets_loc, entry->ra_offset, offset_size);
1ef915ef47cd2f Weinan Liu 2025-01-25  139  		offset_count--;
1ef915ef47cd2f Weinan Liu 2025-01-25  140  	}
1ef915ef47cd2f Weinan Liu 2025-01-25  141  	if (offset_count > 0 && !entry->fp_offset) {
1ef915ef47cd2f Weinan Liu 2025-01-25  142  		SFRAME_READ_ROW_OFFSETS(offsets_loc, entry->fp_offset, offset_size);
1ef915ef47cd2f Weinan Liu 2025-01-25  143  		offset_count--;
1ef915ef47cd2f Weinan Liu 2025-01-25  144  	}
1ef915ef47cd2f Weinan Liu 2025-01-25  145  	if (offset_count)
1ef915ef47cd2f Weinan Liu 2025-01-25  146  		return -EINVAL;
1ef915ef47cd2f Weinan Liu 2025-01-25  147  
1ef915ef47cd2f Weinan Liu 2025-01-25  148  	entry->use_fp = SFRAME_FRE_CFA_BASE_REG_ID(fre_info) == SFRAME_BASE_REG_FP;
1ef915ef47cd2f Weinan Liu 2025-01-25  149  
1ef915ef47cd2f Weinan Liu 2025-01-25  150  	return 0;
1ef915ef47cd2f Weinan Liu 2025-01-25  151  }
1ef915ef47cd2f Weinan Liu 2025-01-25  152  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
