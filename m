Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FB241691
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Nov 2025 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369735; cv=none; b=TNHV3GWMxZGXEbZmE1crv6egMQPguZihnM7anMaGkXpXH4OEgH+3Is7vT9SsA4V4stPWpe0Y5WhDAXUMG1WeeMVYm+wwrlnayQc3lj2ThuV6G38wi+PV36ZWWwDpvnqyCf6reSNqQ3NUVSVB49e2fw4bIgV/CeEeCZzrHlYjrRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369735; c=relaxed/simple;
	bh=TADkj76ksbSi7aFpTO9F8P06xW3ktyK48L2MxMZkYqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lTp+JQrH2WXLkiHKhc50EOIYGZzjil6h3e1aUR+8UgRN2zPUOKRRxk2Y+xQ0wpodg8bqaKrYtmvNUv0yuEKFVLPLGFBNLXv8rAyu1ZNxvQf1i3kuWY/5TZ5ncA/ar7+p7uH6YbuRkxt9zohaGnfvsP6mzswCKpXUUSm9+LbFGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEh20zy0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEh20zy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763369734; x=1794905734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TADkj76ksbSi7aFpTO9F8P06xW3ktyK48L2MxMZkYqQ=;
  b=gEh20zy06+vOyFaNuhK9hLvg8d6xCLzKXyQZiTr0CYfuUV0HjAuld19r
   CTdHy6cfQejtcm2pVg6a9811xYSTt8OHbF3RC42IJjJKptn8p6htBSZ4u
   o8QUC+FYYACK6AgZPP5bu+YJRqXbZHFYm4h9LdkobKvL8lZEbjNwxHUtW
   k2NKSZ1CNuxoi7GAWKckHNtTIMtQM5X2UFWiU1yG7jLEO+2unxrkw6ZLo
   pKokf0vSdKXfDIOaGMfmYmLwXQxpRsyPx60zrZEZqETke+MUgidvZ0phl
   QcTj+9/W+vFcLd3+ZrX/UlSjcaRsza9Go4w1+rOGCpBaMGDwg/DGBLBxl
   w==;
X-CSE-ConnectionGUID: aukry39FTt2e7/pmIEqldA==
X-CSE-MsgGUID: xVH5QGFETwOF/gFO4b6mPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65264781"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65264781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 00:55:33 -0800
X-CSE-ConnectionGUID: J9tgOrw2TXepf2avNPUKVQ==
X-CSE-MsgGUID: /3cl4xjLTFabTMd4DitZ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190190830"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Nov 2025 00:55:32 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKv1G-0000Kh-1e;
	Mon, 17 Nov 2025 08:55:30 +0000
Date: Mon, 17 Nov 2025 16:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC 2/2] Set steering-tag directly for PCIe P2P memory access
Message-ID: <202511171603.TwX3hgKc-lkp@intel.com>
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
In-Reply-To: <20251113213712.776234-3-zhipingz@meta.com>
References: <20251113213712.776234-3-zhipingz@meta.com>
TO: Zhiping Zhang <zhipingz@meta.com>

Hi Zhiping,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.18-rc6 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhiping-Zhang/Set-steering-tag-directly-for-PCIe-P2P-memory-access/20251114-054930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251113213712.776234-3-zhipingz%40meta.com
patch subject: [RFC 2/2] Set steering-tag directly for PCIe P2P memory access
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171603.TwX3hgKc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511171603.TwX3hgKc-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:139 mlx5_st_alloc_index() error: uninitialized symbol 'ret'.

vim +/ret +139 drivers/net/ethernet/mellanox/mlx5/core/lib/st.c

888a7776f4fb04 Yishai Hadas  2025-07-17   81  
888a7776f4fb04 Yishai Hadas  2025-07-17   82  int mlx5_st_alloc_index(struct mlx5_core_dev *dev, enum tph_mem_type mem_type,
1f035dcb026b8a Zhiping Zhang 2025-11-13   83  			unsigned int cpu_uid, u16 *st_index, u16 direct_st_val)
888a7776f4fb04 Yishai Hadas  2025-07-17   84  {
888a7776f4fb04 Yishai Hadas  2025-07-17   85  	struct mlx5_st_idx_data *idx_data;
888a7776f4fb04 Yishai Hadas  2025-07-17   86  	struct mlx5_st *st = dev->st;
888a7776f4fb04 Yishai Hadas  2025-07-17   87  	unsigned long index;
888a7776f4fb04 Yishai Hadas  2025-07-17   88  	u32 xa_id;
888a7776f4fb04 Yishai Hadas  2025-07-17   89  	u16 tag;
888a7776f4fb04 Yishai Hadas  2025-07-17   90  	int ret;
888a7776f4fb04 Yishai Hadas  2025-07-17   91  
888a7776f4fb04 Yishai Hadas  2025-07-17   92  	if (!st)
888a7776f4fb04 Yishai Hadas  2025-07-17   93  		return -EOPNOTSUPP;
888a7776f4fb04 Yishai Hadas  2025-07-17   94  
1f035dcb026b8a Zhiping Zhang 2025-11-13   95  	if (mem_type == TPH_MEM_TYPE_P2P)
1f035dcb026b8a Zhiping Zhang 2025-11-13   96  		tag = direct_st_val;
1f035dcb026b8a Zhiping Zhang 2025-11-13   97  	else {
888a7776f4fb04 Yishai Hadas  2025-07-17   98  		ret = pcie_tph_get_cpu_st(dev->pdev, mem_type, cpu_uid, &tag);
888a7776f4fb04 Yishai Hadas  2025-07-17   99  		if (ret)
888a7776f4fb04 Yishai Hadas  2025-07-17  100  			return ret;
1f035dcb026b8a Zhiping Zhang 2025-11-13  101  	}
888a7776f4fb04 Yishai Hadas  2025-07-17  102  
888a7776f4fb04 Yishai Hadas  2025-07-17  103  	mutex_lock(&st->lock);
888a7776f4fb04 Yishai Hadas  2025-07-17  104  
888a7776f4fb04 Yishai Hadas  2025-07-17  105  	xa_for_each(&st->idx_xa, index, idx_data) {
888a7776f4fb04 Yishai Hadas  2025-07-17  106  		if (tag == idx_data->tag) {
888a7776f4fb04 Yishai Hadas  2025-07-17  107  			refcount_inc(&idx_data->usecount);
888a7776f4fb04 Yishai Hadas  2025-07-17  108  			*st_index = index;
888a7776f4fb04 Yishai Hadas  2025-07-17  109  			goto end;
888a7776f4fb04 Yishai Hadas  2025-07-17  110  		}
888a7776f4fb04 Yishai Hadas  2025-07-17  111  	}
888a7776f4fb04 Yishai Hadas  2025-07-17  112  
888a7776f4fb04 Yishai Hadas  2025-07-17  113  	idx_data = kzalloc(sizeof(*idx_data), GFP_KERNEL);
888a7776f4fb04 Yishai Hadas  2025-07-17  114  	if (!idx_data) {
888a7776f4fb04 Yishai Hadas  2025-07-17  115  		ret = -ENOMEM;
888a7776f4fb04 Yishai Hadas  2025-07-17  116  		goto end;
888a7776f4fb04 Yishai Hadas  2025-07-17  117  	}
888a7776f4fb04 Yishai Hadas  2025-07-17  118  
888a7776f4fb04 Yishai Hadas  2025-07-17  119  	refcount_set(&idx_data->usecount, 1);
888a7776f4fb04 Yishai Hadas  2025-07-17  120  	idx_data->tag = tag;
888a7776f4fb04 Yishai Hadas  2025-07-17  121  
888a7776f4fb04 Yishai Hadas  2025-07-17  122  	ret = xa_alloc(&st->idx_xa, &xa_id, idx_data, st->index_limit, GFP_KERNEL);
888a7776f4fb04 Yishai Hadas  2025-07-17  123  	if (ret)
888a7776f4fb04 Yishai Hadas  2025-07-17  124  		goto clean_idx_data;
888a7776f4fb04 Yishai Hadas  2025-07-17  125  
888a7776f4fb04 Yishai Hadas  2025-07-17  126  	ret = pcie_tph_set_st_entry(dev->pdev, xa_id, tag);
888a7776f4fb04 Yishai Hadas  2025-07-17  127  	if (ret)
888a7776f4fb04 Yishai Hadas  2025-07-17  128  		goto clean_idx_xa;
888a7776f4fb04 Yishai Hadas  2025-07-17  129  
888a7776f4fb04 Yishai Hadas  2025-07-17  130  	*st_index = xa_id;
888a7776f4fb04 Yishai Hadas  2025-07-17  131  	goto end;
888a7776f4fb04 Yishai Hadas  2025-07-17  132  
888a7776f4fb04 Yishai Hadas  2025-07-17  133  clean_idx_xa:
888a7776f4fb04 Yishai Hadas  2025-07-17  134  	xa_erase(&st->idx_xa, xa_id);
888a7776f4fb04 Yishai Hadas  2025-07-17  135  clean_idx_data:
888a7776f4fb04 Yishai Hadas  2025-07-17  136  	kfree(idx_data);
888a7776f4fb04 Yishai Hadas  2025-07-17  137  end:
888a7776f4fb04 Yishai Hadas  2025-07-17  138  	mutex_unlock(&st->lock);
888a7776f4fb04 Yishai Hadas  2025-07-17 @139  	return ret;
888a7776f4fb04 Yishai Hadas  2025-07-17  140  }
888a7776f4fb04 Yishai Hadas  2025-07-17  141  EXPORT_SYMBOL_GPL(mlx5_st_alloc_index);
888a7776f4fb04 Yishai Hadas  2025-07-17  142  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
