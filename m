Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4FE1990A2
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 21:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734212008; cv=none; b=fAFVDG9v7oHDrOOinbuxLPBBseowjTn18qI3BJx8y5HWM6b/xRwyQJm7vw7EWk2pA1N3CwvJ2gTxBkO0qzLqXyWV1Nmx2N91J63iPbP40kvzs6klnvhsNm4AYmx9zKJGD3rwY8yxKP6nuVeqENj23VejBl9+UgOQOUorPKeRJfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734212008; c=relaxed/simple;
	bh=o31ielEwfL8q+t9bKuPvPJyOyDODHDTf0XYSBh6HtDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TALR6jZ3BAawyBB44zaNqaLyJrmWj090N5CsfRWqPjO1omCJmRR561tYabxFwEfQ9U7Mb72gEx/EksDmFNG+ykMfVSY6Mm+Yja8WMP1SPP66OlfieUNKsnr2vK/UqOpodHhfBgrmliAhfRdKyxjhu8ah3QiPNtWdlQeOrJMJj/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJeJxYAV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJeJxYAV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734212006; x=1765748006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o31ielEwfL8q+t9bKuPvPJyOyDODHDTf0XYSBh6HtDM=;
  b=VJeJxYAVZLgv0JdESjrlaak9ArKbMpFCTTtzN0dY7NOu5VaaJm0AfmkU
   cOEaZT9srf9rcU7GqWib243V7zee+C8kH0pIEpfkp9GuDDpTS0sweCxZn
   zgwGPLJRbf+rN9o4dhZunNrpNHpm6daDCKZEQtbtjO6r9HmimmbuCaoEZ
   LAZqYFWuoI3ue07nKBgJ3ICiDJJQH85eleyCYlldSQW/zbEtc5SzSp3tq
   yL4lwubRG/0gbDTcKPl8+IG0MNgpksf7CjD0QjgGQzho2dlZr9Kn0ThkK
   yEODYHI947OIhmTfop+pwo3ijXnqIIT/PIWoB9vldUb0p1XJGSWpmxHrT
   Q==;
X-CSE-ConnectionGUID: tdWIQ8NcTRuSJiiyXaIL7A==
X-CSE-MsgGUID: cppHo2LkTMi6v3lEskvyGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34777684"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34777684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 13:33:26 -0800
X-CSE-ConnectionGUID: 4X+NelVdQiyIhcBuJ2lXMQ==
X-CSE-MsgGUID: Vb54k1odRoKQv+17Iqxfig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="127665157"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2024 13:33:25 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMZlK-000DFb-1T;
	Sat, 14 Dec 2024 21:33:22 +0000
Date: Sun, 15 Dec 2024 05:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c:297
 gve_alloc_buffer() warn: missing unwind goto?
Message-ID: <202412150520.CZcvVxsU-lkp@intel.com>
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
TO: Harshitha Ramamurthy <hramamurthy@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Praveen Kaligineedi <pkaligineedi@google.com>
CC: Shailend Chand <shailend@google.com>
CC: Willem de Bruijn <willemb@google.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a0e3919a2df29b373b19a8fbd6e4c4c38fc10d87
commit: ebdfae0d377b487eabb739c55a13a2ab29f21f36 gve: adopt page pool for DQ RDA mode
date:   9 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-161-20241212 (https://download.01.org/0day-ci/archive/20241215/202412150520.CZcvVxsU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150520.CZcvVxsU-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c:297 gve_alloc_buffer() warn: missing unwind goto?

vim +297 drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c

ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  280  
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  281  int gve_alloc_buffer(struct gve_rx_ring *rx, struct gve_rx_desc_dqo *desc)
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  282  {
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  283  	struct gve_rx_buf_state_dqo *buf_state;
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  284  
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  285  	if (rx->dqo.page_pool) {
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  286  		buf_state = gve_alloc_buf_state(rx);
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  287  		if (WARN_ON_ONCE(!buf_state))
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  288  			return -ENOMEM;
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  289  
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  290  		if (gve_alloc_from_page_pool(rx, buf_state))
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  291  			goto free_buf_state;
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  292  	} else {
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  293  		buf_state = gve_get_recycled_buf_state(rx);
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  294  		if (unlikely(!buf_state)) {
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  295  			buf_state = gve_alloc_buf_state(rx);
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14  296  			if (unlikely(!buf_state))
ebdfae0d377b487 Harshitha Ramamurthy 2024-10-14 @297  				return -ENOMEM;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
