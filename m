Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F5D152E12
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729364581; cv=none; b=uSt3do88wciSDZSzpVe1z6usCJGnxbB0W0dxtGeSKcN7N1JWjgh28HkzNVIak3qsiQuqzHZTa4ryrFZXF43JyORFLu0GX2AOfjXX+NQyr5JT+5vQadLUPKnl6EYYJgDk+cT4XPgerH0LOf9kjeejt6LNWOz+Yd+Cn/T6Y19O8zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729364581; c=relaxed/simple;
	bh=e4zBxjjSuCpnvMwNn8eGk6mOBo91wAVTTm0W/c1NOAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c/WzXn3TGQx4TfofZE2t2cS2hOp4IlQ/OGs68CA6uNdVG+IsY4DWp+pZ81FpwMZUS44eG4ZcnvEjb9tXD0Ei6Z/m/XgHpn8e5dL+jaHqVhb692MFrQGGxzxiiHGAoR6DJQDlnMdECQ5c2K1TkW+MSTTIWXmJS7/80EpuvPyqeec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAVBiYQW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAVBiYQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729364579; x=1760900579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4zBxjjSuCpnvMwNn8eGk6mOBo91wAVTTm0W/c1NOAU=;
  b=NAVBiYQWKHB/GEFYFWDGpkuRJY7H5mafASM4WJn5sy46P5EY2l5lDV6A
   hQlAaLUKpdCsTKT3SjeU9Ml2PQU0e8TziOwXf45c++AmEcNABIaQw2D7Y
   EGATl1n5oEsqjIkJWL7vbgBbA1natkyEFk5ot2Qn5BIfwiHLkfix37aux
   QiOx7vO3dThjZbRUi/oQ4w2WniU9lKEtLJUvI0WbtCDpp3y5H5OKKcJzc
   lciLpfu1JmzVxEpLW1Vp66f7rz9Uveq8Zz+sL4l+r0oqJkgMkjhuPE5Yd
   5C5dcqS5J6j7fUANXbv4nPUt6UOqjtAVru9qWvnKkTVYkGu9sWqIXlLHA
   g==;
X-CSE-ConnectionGUID: MuyeLcJcT26SmQazn9J+Bg==
X-CSE-MsgGUID: mZ5DM8zhSTiMTZeOO7u00w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28997000"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28997000"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 12:02:58 -0700
X-CSE-ConnectionGUID: Po/HsJvdQ6K2EKeMVgXlJw==
X-CSE-MsgGUID: YFoosFh1T0aw0ZzbDl8JhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79114020"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Oct 2024 12:02:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Eiv-000PQx-2T;
	Sat, 19 Oct 2024 19:02:49 +0000
Date: Sun, 20 Oct 2024 03:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCHv8 6/6] nvme: enable FDP support
Message-ID: <202410200200.VgMAv2Cj-lkp@intel.com>
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
In-Reply-To: <20241017160937.2283225-7-kbusch@meta.com>
References: <20241017160937.2283225-7-kbusch@meta.com>
TO: Keith Busch <kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.12-rc3]
[cannot apply to brauner-vfs/vfs.all next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/block-fs-restore-kiocb-based-write-hint-processing/20241018-041459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20241017160937.2283225-7-kbusch%40meta.com
patch subject: [PATCHv8 6/6] nvme: enable FDP support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r072-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200200.VgMAv2Cj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410200200.VgMAv2Cj-lkp@intel.com/

New smatch warnings:
drivers/nvme/host/core.c:2150 nvme_fetch_fdp_plids() warn: sizeof(NUMBER)?

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
drivers/nvme/host/core.c:2168 nvme_fetch_fdp_plids() warn: sizeof(NUMBER)?
drivers/nvme/host/core.c:4780 nvme_free_cels() warn: iterator 'i' not incremented

vim +2150 drivers/nvme/host/core.c

eb867ee995bd68 Joel Granados 2022-07-12  2138  
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2139  static int nvme_fetch_fdp_plids(struct nvme_ns *ns, u32 nsid)
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2140  {
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2141  	struct nvme_fdp_ruh_status_desc *ruhsd;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2142  	struct nvme_ns_head *head = ns->head;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2143  	struct nvme_fdp_ruh_status *ruhs;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2144  	struct nvme_command c = {};
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2145  	int size, ret, i;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2146  
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2147  	if (head->plids)
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2148  		return 0;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2149  
b5bb76d576eb00 Kanchan Joshi 2024-10-17 @2150  	size = struct_size(ruhs, ruhsd, NVME_MAX_PLIDS);
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2151  	ruhs = kzalloc(size, GFP_KERNEL);
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2152  	if (!ruhs)
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2153  		return -ENOMEM;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2154  
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2155  	c.imr.opcode = nvme_cmd_io_mgmt_recv;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2156  	c.imr.nsid = cpu_to_le32(nsid);
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2157  	c.imr.mo = 0x1;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2158  	c.imr.numd =  cpu_to_le32((size >> 2) - 1);
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2159  
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2160  	ret = nvme_submit_sync_cmd(ns->queue, &c, ruhs, size);
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2161  	if (ret)
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2162  		goto out;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2163  
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2164  	i = le16_to_cpu(ruhs->nruhsd);
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2165  	if (!i)
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2166  		goto out;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2167  
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2168  	ns->head->nr_plids = min_t(u16, i, NVME_MAX_PLIDS);
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2169  	head->plids = kcalloc(ns->head->nr_plids, sizeof(head->plids),
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2170  			      GFP_KERNEL);
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2171  	if (!head->plids) {
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2172  		ret = -ENOMEM;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2173  		goto out;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2174  	}
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2175  
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2176  	for (i = 0; i < ns->head->nr_plids; i++) {
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2177  		ruhsd = &ruhs->ruhsd[i];
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2178  		head->plids[i] = le16_to_cpu(ruhsd->pid);
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2179  	}
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2180  out:
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2181  	kfree(ruhs);
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2182  	return ret;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2183  }
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2184  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
