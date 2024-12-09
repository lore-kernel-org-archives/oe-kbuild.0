Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDADB184556
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 20:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733774943; cv=none; b=cNCaTR7L0aG134Zb4+Ka/wH4aJywnQ0inrwBZ9TIVi56ohZnc/GgRDPH84dOq5DLFU/ID23+ybByMijnwgSHYYZzJum1pjP8IwisKb0dcZmssd1505mX0txBrpcN0tvR7Oq7gyaWuRgywpMp4dIBbTUpdjZKq7tFgavPcDmXa6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733774943; c=relaxed/simple;
	bh=HKuUjVMOpVdAYgVYucOrokrRMLyFRITVybGOi2yVyCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QUy2JIbA4OTKwy5IhqsaJ/01TeAjHgxHHxJ0z3yyIRePpA4Z8bB8DroyRoEBteYG/pfyjABOxJJKYzOgOmtjwa/YCZWfJLPULS9CGC1OJv4TgdsTII23zlnRu13Qej+CKgFvmUx3BjLHNUApWPfzBvZMaqyHBgWyxAD6FelsFJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SfgB29I+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SfgB29I+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733774941; x=1765310941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HKuUjVMOpVdAYgVYucOrokrRMLyFRITVybGOi2yVyCY=;
  b=SfgB29I+6Yu6dbrNmcr3aztls2YA6TvuhD4Mcl+TniJO1P25lALz8PnZ
   z7NtV5qmvl4SbXQiP+dOzRPGJgZAEzChAaZoVmXnMWwcBV3ZsGi0PQ/Hz
   MDeeyGuHQV3IZSW61LyFRh1kyDQWNYQASswPrD3PUBh7DX1pHObDOmusb
   RHOfoQM5rHsibbkA+HIk+4ftKjJ9NzEUvJUItkTwhSyj+8uHI9vf+ltKm
   qQVqq/53uKnEFK/urhSMYgDz0oknuo7/1gnwlWQ4MH3BiknEi9RNNao/X
   HNHEr1uiZLnVIUwCkZpc7PqVuotxscmQ2wl58F4k1WqAqdElWpu8qDmDU
   Q==;
X-CSE-ConnectionGUID: zzdzj2kURZ6W8nWoZO1hgQ==
X-CSE-MsgGUID: ByuXFBL2SxW3B8P3H2loHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44697375"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="44697375"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 12:09:01 -0800
X-CSE-ConnectionGUID: oFFxL/8zSQC2a3RFM+N6kQ==
X-CSE-MsgGUID: eFHq2A0lSzGq5IhFyeO99w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="99659082"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Dec 2024 12:09:00 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKk3t-0004mS-26;
	Mon, 09 Dec 2024 20:08:57 +0000
Date: Tue, 10 Dec 2024 04:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCHv12 11/12] nvme: register fdp parameters with the block
 layer
Message-ID: <202412100319.Y5vv98P8-lkp@intel.com>
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
In-Reply-To: <20241206221801.790690-12-kbusch@meta.com>
References: <20241206221801.790690-12-kbusch@meta.com>
TO: Keith Busch <kbusch@meta.com>
TO: axboe@kernel.dk
TO: hch@lst.de
TO: linux-block@vger.kernel.org
TO: linux-nvme@lists.infradead.org
TO: linux-fsdevel@vger.kernel.org
TO: io-uring@vger.kernel.org
CC: sagi@grimberg.me
CC: asml.silence@gmail.com
CC: anuj20.g@samsung.com
CC: joshi.k@samsung.com
CC: Keith Busch <kbusch@kernel.org>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20241209]
[cannot apply to brauner-vfs/vfs.all hch-configfs/for-next linus/master v6.13-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/fs-add-write-stream-information-to-statx/20241207-063826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20241206221801.790690-12-kbusch%40meta.com
patch subject: [PATCHv12 11/12] nvme: register fdp parameters with the block layer
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: csky-randconfig-r072-20241209 (https://download.01.org/0day-ci/archive/20241210/202412100319.Y5vv98P8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412100319.Y5vv98P8-lkp@intel.com/

New smatch warnings:
drivers/nvme/host/core.c:2187 nvme_check_fdp() error: uninitialized symbol 'i'.
drivers/nvme/host/core.c:2232 nvme_query_fdp_info() warn: missing error code 'ret'

Old smatch warnings:
drivers/nvme/host/core.c:4864 nvme_free_cels() warn: iterator 'i' not incremented

vim +/i +2187 drivers/nvme/host/core.c

eb867ee995bd68 Joel Granados 2022-07-12  2153  
04ca0849938146 Keith Busch   2024-12-06  2154  static int nvme_check_fdp(struct nvme_ns *ns, struct nvme_ns_info *info,
04ca0849938146 Keith Busch   2024-12-06  2155  			  u8 fdp_idx)
04ca0849938146 Keith Busch   2024-12-06  2156  {
04ca0849938146 Keith Busch   2024-12-06  2157  	struct nvme_fdp_config_log hdr, *h;
04ca0849938146 Keith Busch   2024-12-06  2158  	struct nvme_fdp_config_desc *desc;
04ca0849938146 Keith Busch   2024-12-06  2159  	size_t size = sizeof(hdr);
04ca0849938146 Keith Busch   2024-12-06  2160  	int i, n, ret;
04ca0849938146 Keith Busch   2024-12-06  2161  	void *log;
04ca0849938146 Keith Busch   2024-12-06  2162  
04ca0849938146 Keith Busch   2024-12-06  2163  	info->runs = 0;
04ca0849938146 Keith Busch   2024-12-06  2164  	ret = nvme_get_log_lsi(ns->ctrl, 0, NVME_LOG_FDP_CONFIGS, 0, NVME_CSI_NVM,
04ca0849938146 Keith Busch   2024-12-06  2165  			   (void *)&hdr, size, 0, info->endgid);
04ca0849938146 Keith Busch   2024-12-06  2166  	if (ret)
04ca0849938146 Keith Busch   2024-12-06  2167  		return ret;
04ca0849938146 Keith Busch   2024-12-06  2168  
04ca0849938146 Keith Busch   2024-12-06  2169  	size = le32_to_cpu(hdr.sze);
04ca0849938146 Keith Busch   2024-12-06  2170  	h = kzalloc(size, GFP_KERNEL);
04ca0849938146 Keith Busch   2024-12-06  2171  	if (!h)
04ca0849938146 Keith Busch   2024-12-06  2172  		return 0;
04ca0849938146 Keith Busch   2024-12-06  2173  
04ca0849938146 Keith Busch   2024-12-06  2174  	ret = nvme_get_log_lsi(ns->ctrl, 0, NVME_LOG_FDP_CONFIGS, 0, NVME_CSI_NVM,
04ca0849938146 Keith Busch   2024-12-06  2175  			   h, size, 0, info->endgid);
04ca0849938146 Keith Busch   2024-12-06  2176  	if (ret)
04ca0849938146 Keith Busch   2024-12-06  2177  		goto out;
04ca0849938146 Keith Busch   2024-12-06  2178  
04ca0849938146 Keith Busch   2024-12-06  2179  	n = le16_to_cpu(h->numfdpc) + 1;
04ca0849938146 Keith Busch   2024-12-06  2180  	if (fdp_idx > n)
04ca0849938146 Keith Busch   2024-12-06  2181  		goto out;
04ca0849938146 Keith Busch   2024-12-06  2182  
04ca0849938146 Keith Busch   2024-12-06  2183  	log = h + 1;
04ca0849938146 Keith Busch   2024-12-06  2184  	do {
04ca0849938146 Keith Busch   2024-12-06  2185  		desc = log;
04ca0849938146 Keith Busch   2024-12-06  2186  		log += le16_to_cpu(desc->dsze);
04ca0849938146 Keith Busch   2024-12-06 @2187  	} while (i++ < fdp_idx);
04ca0849938146 Keith Busch   2024-12-06  2188  
04ca0849938146 Keith Busch   2024-12-06  2189  	info->runs = le64_to_cpu(desc->runs);
04ca0849938146 Keith Busch   2024-12-06  2190  out:
04ca0849938146 Keith Busch   2024-12-06  2191  	kfree(h);
04ca0849938146 Keith Busch   2024-12-06  2192  	return ret;
04ca0849938146 Keith Busch   2024-12-06  2193  }
04ca0849938146 Keith Busch   2024-12-06  2194  
04ca0849938146 Keith Busch   2024-12-06  2195  static int nvme_query_fdp_info(struct nvme_ns *ns, struct nvme_ns_info *info)
04ca0849938146 Keith Busch   2024-12-06  2196  {
04ca0849938146 Keith Busch   2024-12-06  2197  	struct nvme_ns_head *head = ns->head;
04ca0849938146 Keith Busch   2024-12-06  2198  	struct nvme_fdp_ruh_status *ruhs;
04ca0849938146 Keith Busch   2024-12-06  2199  	struct nvme_fdp_config fdp;
04ca0849938146 Keith Busch   2024-12-06  2200  	struct nvme_command c = {};
04ca0849938146 Keith Busch   2024-12-06  2201  	int size, ret;
04ca0849938146 Keith Busch   2024-12-06  2202  
04ca0849938146 Keith Busch   2024-12-06  2203  	ret = nvme_get_features(ns->ctrl, NVME_FEAT_FDP, info->endgid, NULL, 0,
04ca0849938146 Keith Busch   2024-12-06  2204  				&fdp);
04ca0849938146 Keith Busch   2024-12-06  2205  	if (ret)
04ca0849938146 Keith Busch   2024-12-06  2206  		goto err;
04ca0849938146 Keith Busch   2024-12-06  2207  
04ca0849938146 Keith Busch   2024-12-06  2208  	if (!(fdp.flags & FDPCFG_FDPE))
04ca0849938146 Keith Busch   2024-12-06  2209  		goto err;
04ca0849938146 Keith Busch   2024-12-06  2210  
04ca0849938146 Keith Busch   2024-12-06  2211  	ret = nvme_check_fdp(ns, info, fdp.fdpcidx);
04ca0849938146 Keith Busch   2024-12-06  2212  	if (ret || !info->runs)
04ca0849938146 Keith Busch   2024-12-06  2213  		goto err;
04ca0849938146 Keith Busch   2024-12-06  2214  
04ca0849938146 Keith Busch   2024-12-06  2215  	size = struct_size(ruhs, ruhsd, NVME_MAX_PLIDS);
04ca0849938146 Keith Busch   2024-12-06  2216  	ruhs = kzalloc(size, GFP_KERNEL);
04ca0849938146 Keith Busch   2024-12-06  2217  	if (!ruhs) {
04ca0849938146 Keith Busch   2024-12-06  2218  		ret = -ENOMEM;
04ca0849938146 Keith Busch   2024-12-06  2219  		goto err;
04ca0849938146 Keith Busch   2024-12-06  2220  	}
04ca0849938146 Keith Busch   2024-12-06  2221  
04ca0849938146 Keith Busch   2024-12-06  2222  	c.imr.opcode = nvme_cmd_io_mgmt_recv;
04ca0849938146 Keith Busch   2024-12-06  2223  	c.imr.nsid = cpu_to_le32(head->ns_id);
04ca0849938146 Keith Busch   2024-12-06  2224  	c.imr.mo = NVME_IO_MGMT_RECV_MO_RUHS;
04ca0849938146 Keith Busch   2024-12-06  2225  	c.imr.numd = cpu_to_le32(nvme_bytes_to_numd(size));
04ca0849938146 Keith Busch   2024-12-06  2226  	ret = nvme_submit_sync_cmd(ns->queue, &c, ruhs, size);
04ca0849938146 Keith Busch   2024-12-06  2227  	if (ret)
04ca0849938146 Keith Busch   2024-12-06  2228  		goto free;
04ca0849938146 Keith Busch   2024-12-06  2229  
04ca0849938146 Keith Busch   2024-12-06  2230  	head->nr_plids = le16_to_cpu(ruhs->nruhsd);
04ca0849938146 Keith Busch   2024-12-06  2231  	if (!head->nr_plids)
04ca0849938146 Keith Busch   2024-12-06 @2232  		goto free;
04ca0849938146 Keith Busch   2024-12-06  2233  
04ca0849938146 Keith Busch   2024-12-06  2234  	kfree(ruhs);
04ca0849938146 Keith Busch   2024-12-06  2235  	return 0;
04ca0849938146 Keith Busch   2024-12-06  2236  
04ca0849938146 Keith Busch   2024-12-06  2237  free:
04ca0849938146 Keith Busch   2024-12-06  2238  	kfree(ruhs);
04ca0849938146 Keith Busch   2024-12-06  2239  err:
04ca0849938146 Keith Busch   2024-12-06  2240  	head->nr_plids = 0;
04ca0849938146 Keith Busch   2024-12-06  2241  	info->runs = 0;
04ca0849938146 Keith Busch   2024-12-06  2242  	return ret;
04ca0849938146 Keith Busch   2024-12-06  2243  }
04ca0849938146 Keith Busch   2024-12-06  2244  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
