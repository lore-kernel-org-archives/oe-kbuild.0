Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B712E74
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Feb 2024 05:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707282345; cv=none; b=OtF3c1HAcsuG90S5DjUQzS1WJSLGFKQ6fi2jy22+SbNE74tRpmrMeEug7dlSKhaeSqQuUNRnjKdyyufIxNUycEeeARXTKTlzHFT1OORT9xzCiK+RA09LmtUEjVNlz+v8m6Ot8Q86iXwrTEYdd/27ZYpb7xe3LbG6GLRVJ7qY91Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707282345; c=relaxed/simple;
	bh=XTrNlXHj3PZ62U18qjSnZcUsX/EVVw8a03ONMnorLIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jnqqhUv+a8QpMszwdNiLqu+xJi55Yu2tYy1EX458EVtwWkEKJDPAKvMcGTia3h5UjNO4PeB2coUKDJVPhia/S4Mu+HLqUojGbpnAwlGYoItbEpsl5i5mlID120wY7yfY4rQ/uUs5G+7YVppAzfPRo/nGoldUce0YgsqSlXvIg6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TE2PHSun; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TE2PHSun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707282343; x=1738818343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XTrNlXHj3PZ62U18qjSnZcUsX/EVVw8a03ONMnorLIU=;
  b=TE2PHSuni82VVnecCZyd9AnN06PIHSKOk+teV38Ush0l789qm5L/JmWw
   DPaq3s/09Yl4zAaghHF1FHXJGNjdpe9n+25ldMSNA17P2gP6Y7LMT2Pr6
   Eh++FRv2ghtrOa4x18VvXDkrVPb3QdpImtOIpzK/tV13Iiozx8GQdhWrH
   0Mc3W9rMSPXzwSl36hFSYspk3e75tcptvgmGuw7FtsGZLtRH0Y0Vh90CC
   W/NH/AOnz/C3poe946XmKMvSNY6KJ3iNrpnF4P6wu5f60YoGfxO7T3qLc
   e3HehQOhdw7dkftGpDVQO7s1tgQpwbFKtMKsx5QPpfiI81IJvsnt/xLJV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="23389788"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="23389788"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 21:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="6001424"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2024 21:05:38 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXa7s-0002Dy-0s;
	Wed, 07 Feb 2024 05:05:36 +0000
Date: Wed, 7 Feb 2024 13:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v7 02/12] firmware: qcom: scm: enable the TZ mem allocator
Message-ID: <202402071202.pfJl5XPM-lkp@intel.com>
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
In-Reply-To: <20240205182810.58382-3-brgl@bgdev.pl>
References: <20240205182810.58382-3-brgl@bgdev.pl>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Elliot Berman <quic_eberman@quicinc.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Guru Das Srinagesh <quic_gurus@quicinc.com>
TO: Andrew Halaney <ahalaney@redhat.com>
TO: Maximilian Luz <luzmaximilian@gmail.com>
TO: Alex Elder <elder@linaro.org>
TO: Srini Kandagatla <srinivas.kandagatla@linaro.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: kernel@quicinc.com
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Deepti Jaggi <quic_djaggi@quicinc.com>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-dt/for-next]
[also build test WARNING on linus/master v6.8-rc3 next-20240206]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/firmware-qcom-add-a-dedicated-TrustZone-buffer-allocator/20240206-024031
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git for-next
patch link:    https://lore.kernel.org/r/20240205182810.58382-3-brgl%40bgdev.pl
patch subject: [PATCH v7 02/12] firmware: qcom: scm: enable the TZ mem allocator
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: openrisc-randconfig-r052-20240206 (https://download.01.org/0day-ci/archive/20240207/202402071202.pfJl5XPM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402071202.pfJl5XPM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/qcom/qcom_tzmem.c:112:47-52: ERROR: pool is NULL but dereferenced.
   drivers/firmware/qcom/qcom_tzmem.c:112:60-65: ERROR: pool is NULL but dereferenced.

vim +112 drivers/firmware/qcom/qcom_tzmem.c

6b7881b749c152 Bartosz Golaszewski 2024-02-05   59  
6b7881b749c152 Bartosz Golaszewski 2024-02-05   60  /**
6b7881b749c152 Bartosz Golaszewski 2024-02-05   61   * qcom_tzmem_pool_new() - Create a new TZ memory pool.
6b7881b749c152 Bartosz Golaszewski 2024-02-05   62   * @size: Size of the new pool in bytes.
6b7881b749c152 Bartosz Golaszewski 2024-02-05   63   *
6b7881b749c152 Bartosz Golaszewski 2024-02-05   64   * Create a new pool of memory suitable for sharing with the TrustZone.
6b7881b749c152 Bartosz Golaszewski 2024-02-05   65   *
6b7881b749c152 Bartosz Golaszewski 2024-02-05   66   * Must not be used in atomic context.
6b7881b749c152 Bartosz Golaszewski 2024-02-05   67   *
6b7881b749c152 Bartosz Golaszewski 2024-02-05   68   * Returns:
6b7881b749c152 Bartosz Golaszewski 2024-02-05   69   * New memory pool address or ERR_PTR() on error.
6b7881b749c152 Bartosz Golaszewski 2024-02-05   70   */
6b7881b749c152 Bartosz Golaszewski 2024-02-05   71  struct qcom_tzmem_pool *qcom_tzmem_pool_new(size_t size)
6b7881b749c152 Bartosz Golaszewski 2024-02-05   72  {
6b7881b749c152 Bartosz Golaszewski 2024-02-05   73  	struct qcom_tzmem_pool *pool;
6b7881b749c152 Bartosz Golaszewski 2024-02-05   74  	int ret = -ENOMEM;
6b7881b749c152 Bartosz Golaszewski 2024-02-05   75  
6b7881b749c152 Bartosz Golaszewski 2024-02-05   76  	if (!size)
6b7881b749c152 Bartosz Golaszewski 2024-02-05   77  		return ERR_PTR(-EINVAL);
6b7881b749c152 Bartosz Golaszewski 2024-02-05   78  
6b7881b749c152 Bartosz Golaszewski 2024-02-05   79  	size = PAGE_ALIGN(size);
6b7881b749c152 Bartosz Golaszewski 2024-02-05   80  
6b7881b749c152 Bartosz Golaszewski 2024-02-05   81  	pool = kzalloc(sizeof(*pool), GFP_KERNEL);
6b7881b749c152 Bartosz Golaszewski 2024-02-05   82  	if (!pool)
6b7881b749c152 Bartosz Golaszewski 2024-02-05   83  		return ERR_PTR(-ENOMEM);
6b7881b749c152 Bartosz Golaszewski 2024-02-05   84  
6b7881b749c152 Bartosz Golaszewski 2024-02-05   85  	pool->size = size;
6b7881b749c152 Bartosz Golaszewski 2024-02-05   86  
6b7881b749c152 Bartosz Golaszewski 2024-02-05   87  	pool->vbase = dma_alloc_coherent(qcom_tzmem_dev, size, &pool->pbase,
6b7881b749c152 Bartosz Golaszewski 2024-02-05   88  					 GFP_KERNEL);
6b7881b749c152 Bartosz Golaszewski 2024-02-05   89  	if (!pool->vbase)
6b7881b749c152 Bartosz Golaszewski 2024-02-05   90  		goto err_kfree_pool;
6b7881b749c152 Bartosz Golaszewski 2024-02-05   91  
6b7881b749c152 Bartosz Golaszewski 2024-02-05   92  	pool->pool = gen_pool_create(PAGE_SHIFT, -1);
6b7881b749c152 Bartosz Golaszewski 2024-02-05   93  	if (!pool)
6b7881b749c152 Bartosz Golaszewski 2024-02-05   94  		goto err_dma_free;
6b7881b749c152 Bartosz Golaszewski 2024-02-05   95  
6b7881b749c152 Bartosz Golaszewski 2024-02-05   96  	gen_pool_set_algo(pool->pool, gen_pool_best_fit, NULL);
6b7881b749c152 Bartosz Golaszewski 2024-02-05   97  
6b7881b749c152 Bartosz Golaszewski 2024-02-05   98  	ret = gen_pool_add_virt(pool->pool, (unsigned long)pool->vbase,
6b7881b749c152 Bartosz Golaszewski 2024-02-05   99  				(phys_addr_t)pool->pbase, size, -1);
6b7881b749c152 Bartosz Golaszewski 2024-02-05  100  	if (ret)
6b7881b749c152 Bartosz Golaszewski 2024-02-05  101  		goto err_destroy_genpool;
6b7881b749c152 Bartosz Golaszewski 2024-02-05  102  
6b7881b749c152 Bartosz Golaszewski 2024-02-05  103  	ret = qcom_tzmem_init_pool(pool);
6b7881b749c152 Bartosz Golaszewski 2024-02-05  104  	if (ret)
6b7881b749c152 Bartosz Golaszewski 2024-02-05  105  		goto err_destroy_genpool;
6b7881b749c152 Bartosz Golaszewski 2024-02-05  106  
6b7881b749c152 Bartosz Golaszewski 2024-02-05  107  	return pool;
6b7881b749c152 Bartosz Golaszewski 2024-02-05  108  
6b7881b749c152 Bartosz Golaszewski 2024-02-05  109  err_destroy_genpool:
6b7881b749c152 Bartosz Golaszewski 2024-02-05  110  	gen_pool_destroy(pool->pool);
6b7881b749c152 Bartosz Golaszewski 2024-02-05  111  err_dma_free:
6b7881b749c152 Bartosz Golaszewski 2024-02-05 @112  	dma_free_coherent(qcom_tzmem_dev, size, pool->vbase, pool->pbase);
6b7881b749c152 Bartosz Golaszewski 2024-02-05  113  err_kfree_pool:
6b7881b749c152 Bartosz Golaszewski 2024-02-05  114  	kfree(pool);
6b7881b749c152 Bartosz Golaszewski 2024-02-05  115  	return ERR_PTR(ret);
6b7881b749c152 Bartosz Golaszewski 2024-02-05  116  }
6b7881b749c152 Bartosz Golaszewski 2024-02-05  117  EXPORT_SYMBOL_GPL(qcom_tzmem_pool_new);
6b7881b749c152 Bartosz Golaszewski 2024-02-05  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
