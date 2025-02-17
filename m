Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB5C194C8B
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 11:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739792251; cv=none; b=p6SMluey7s2M3NOasJPuTZPgWnaRXUv0svn+280kw4czzqP1prUE1JP3N4Pc3E6JBkIPKHwb2jWVtHzE2YX2bQbK+QK0U9WY3eWLAN1oWybisfW9P+GYLSZmmy7YrSgtcLEWfhriNxU23dJkZVwAPynDRMzfiOUbCJuhQZXJG84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739792251; c=relaxed/simple;
	bh=cS4o9oEhsgDeHMFG6o59nGRR81PR2gOjzssDmDioaCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SvWOlcemgS4docSB/d9R3WVRjNgghxlRZBfcV7cnesuJ5A60uHdBfH9PmvoHRSbbEVkM23DOXCM85cMRzyFXqefbs0p9T5SyKHlV1hWZkOJK4u32kuBQitt30AWDZBSBa3yd+COYxub8DdVAdhaHNW4oBnX2lmITH48nuOcA1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQbjky3l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQbjky3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739792249; x=1771328249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cS4o9oEhsgDeHMFG6o59nGRR81PR2gOjzssDmDioaCs=;
  b=RQbjky3ltHN5x6nkBtHkUkLgg/DF+lBwtm6kPq3GwTfZPY3diBAHJufX
   3DKrPiLvnwEYUq4uSGonHpeWn00kMnivFeEEHk9b/nBuyX6TrLbfA3Z/N
   imbY5NOq86pdSjkKaPyWt4Xt1InVlZdr1PXdKK/mj/cNzh3MwkKapgLqb
   6+6c3i/L1DEq947s7POaE/rOAoohEjmK1dRHwhALCLSZ76XmR66kFcUrU
   0Pqx+bjBpPIWfzBQJNBOpHAee4Os4jgUyaj+erR3SBsbN/mroaxPmidaI
   3P44rU9XNLVWz/O5iXmTG/SUw8g44tkmq7cNelO1y4Rql3JEWmUAQlm8p
   Q==;
X-CSE-ConnectionGUID: M4EbVd+vRCGkefLZYuaTjw==
X-CSE-MsgGUID: bxUKOItBQkaXpRD2/SxB9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40336568"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="40336568"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 03:37:28 -0800
X-CSE-ConnectionGUID: 9OPzQwEfS5+mkf47Av4RnQ==
X-CSE-MsgGUID: ga8Nq24zRNaD3Teioi7zJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="119021011"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Feb 2025 03:37:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjzRE-001D2N-2y;
	Mon, 17 Feb 2025 11:37:24 +0000
Date: Mon, 17 Feb 2025 19:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2779/4577] drivers/spi/spi-offload.c:127:9-17:
 ERROR: reference preceded by free on line 126
Message-ID: <202502171956.DsCx3n8E-lkp@intel.com>
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
TO: David Lechner <dlechner@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Nuno Sa <nuno.sa@analog.com>

Hi David,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   253c82b3a2cec22bf9db65645f934fbe095899a3
commit: f09f140e3ea8f4c1b2990cdd72848f4083388ad8 [2779/4577] iio: adc: ad4695: Add support for SPI offload
:::::: branch date: 4 hours ago
:::::: commit date: 6 days ago
config: xtensa-randconfig-r062-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171956.DsCx3n8E-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502171956.DsCx3n8E-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-offload.c:127:9-17: ERROR: reference preceded by free on line 126
--
>> drivers/spi/spi-offload.c:181:15-22: ERROR: invalid reference to the index variable of the iterator on line 169

vim +127 drivers/spi/spi-offload.c

8e02d188698851 David Lechner 2025-02-07   93  
8e02d188698851 David Lechner 2025-02-07   94  /**
8e02d188698851 David Lechner 2025-02-07   95   * devm_spi_offload_get() - Get an offload instance
8e02d188698851 David Lechner 2025-02-07   96   * @dev: Device for devm purposes
8e02d188698851 David Lechner 2025-02-07   97   * @spi: SPI device to use for the transfers
8e02d188698851 David Lechner 2025-02-07   98   * @config: Offload configuration
8e02d188698851 David Lechner 2025-02-07   99   *
8e02d188698851 David Lechner 2025-02-07  100   * Peripheral drivers call this function to get an offload instance that meets
8e02d188698851 David Lechner 2025-02-07  101   * the requirements specified in @config. If no suitable offload instance is
8e02d188698851 David Lechner 2025-02-07  102   * available, -ENODEV is returned.
8e02d188698851 David Lechner 2025-02-07  103   *
8e02d188698851 David Lechner 2025-02-07  104   * Return: Offload instance or error on failure.
8e02d188698851 David Lechner 2025-02-07  105   */
8e02d188698851 David Lechner 2025-02-07  106  struct spi_offload *devm_spi_offload_get(struct device *dev,
8e02d188698851 David Lechner 2025-02-07  107  					 struct spi_device *spi,
8e02d188698851 David Lechner 2025-02-07  108  					 const struct spi_offload_config *config)
8e02d188698851 David Lechner 2025-02-07  109  {
8e02d188698851 David Lechner 2025-02-07  110  	struct spi_controller_and_offload *resource;
8e02d188698851 David Lechner 2025-02-07  111  	int ret;
8e02d188698851 David Lechner 2025-02-07  112  
8e02d188698851 David Lechner 2025-02-07  113  	if (!spi || !config)
8e02d188698851 David Lechner 2025-02-07  114  		return ERR_PTR(-EINVAL);
8e02d188698851 David Lechner 2025-02-07  115  
8e02d188698851 David Lechner 2025-02-07  116  	if (!spi->controller->get_offload)
8e02d188698851 David Lechner 2025-02-07  117  		return ERR_PTR(-ENODEV);
8e02d188698851 David Lechner 2025-02-07  118  
8e02d188698851 David Lechner 2025-02-07  119  	resource = kzalloc(sizeof(*resource), GFP_KERNEL);
8e02d188698851 David Lechner 2025-02-07  120  	if (!resource)
8e02d188698851 David Lechner 2025-02-07  121  		return ERR_PTR(-ENOMEM);
8e02d188698851 David Lechner 2025-02-07  122  
8e02d188698851 David Lechner 2025-02-07  123  	resource->controller = spi->controller;
8e02d188698851 David Lechner 2025-02-07  124  	resource->offload = spi->controller->get_offload(spi, config);
8e02d188698851 David Lechner 2025-02-07  125  	if (IS_ERR(resource->offload)) {
8e02d188698851 David Lechner 2025-02-07 @126  		kfree(resource);
8e02d188698851 David Lechner 2025-02-07 @127  		return resource->offload;
8e02d188698851 David Lechner 2025-02-07  128  	}
8e02d188698851 David Lechner 2025-02-07  129  
8e02d188698851 David Lechner 2025-02-07  130  	ret = devm_add_action_or_reset(dev, spi_offload_put, resource);
8e02d188698851 David Lechner 2025-02-07  131  	if (ret)
8e02d188698851 David Lechner 2025-02-07  132  		return ERR_PTR(ret);
8e02d188698851 David Lechner 2025-02-07  133  
8e02d188698851 David Lechner 2025-02-07  134  	return resource->offload;
8e02d188698851 David Lechner 2025-02-07  135  }
8e02d188698851 David Lechner 2025-02-07  136  EXPORT_SYMBOL_GPL(devm_spi_offload_get);
d7231be4b4657e David Lechner 2025-02-07  137  
d7231be4b4657e David Lechner 2025-02-07  138  static void spi_offload_trigger_free(struct kref *ref)
d7231be4b4657e David Lechner 2025-02-07  139  {
d7231be4b4657e David Lechner 2025-02-07  140  	struct spi_offload_trigger *trigger =
d7231be4b4657e David Lechner 2025-02-07  141  		container_of(ref, struct spi_offload_trigger, ref);
d7231be4b4657e David Lechner 2025-02-07  142  
d7231be4b4657e David Lechner 2025-02-07  143  	mutex_destroy(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  144  	fwnode_handle_put(trigger->fwnode);
d7231be4b4657e David Lechner 2025-02-07  145  	kfree(trigger);
d7231be4b4657e David Lechner 2025-02-07  146  }
d7231be4b4657e David Lechner 2025-02-07  147  
d7231be4b4657e David Lechner 2025-02-07  148  static void spi_offload_trigger_put(void *data)
d7231be4b4657e David Lechner 2025-02-07  149  {
d7231be4b4657e David Lechner 2025-02-07  150  	struct spi_offload_trigger *trigger = data;
d7231be4b4657e David Lechner 2025-02-07  151  
d7231be4b4657e David Lechner 2025-02-07  152  	scoped_guard(mutex, &trigger->lock)
d7231be4b4657e David Lechner 2025-02-07  153  		if (trigger->ops && trigger->ops->release)
d7231be4b4657e David Lechner 2025-02-07  154  			trigger->ops->release(trigger);
d7231be4b4657e David Lechner 2025-02-07  155  
d7231be4b4657e David Lechner 2025-02-07  156  	kref_put(&trigger->ref, spi_offload_trigger_free);
d7231be4b4657e David Lechner 2025-02-07  157  }
d7231be4b4657e David Lechner 2025-02-07  158  
d7231be4b4657e David Lechner 2025-02-07  159  static struct spi_offload_trigger
d7231be4b4657e David Lechner 2025-02-07  160  *spi_offload_trigger_get(enum spi_offload_trigger_type type,
d7231be4b4657e David Lechner 2025-02-07  161  			 struct fwnode_reference_args *args)
d7231be4b4657e David Lechner 2025-02-07  162  {
d7231be4b4657e David Lechner 2025-02-07  163  	struct spi_offload_trigger *trigger;
d7231be4b4657e David Lechner 2025-02-07  164  	bool match = false;
d7231be4b4657e David Lechner 2025-02-07  165  	int ret;
d7231be4b4657e David Lechner 2025-02-07  166  
d7231be4b4657e David Lechner 2025-02-07  167  	guard(mutex)(&spi_offload_triggers_lock);
d7231be4b4657e David Lechner 2025-02-07  168  
d7231be4b4657e David Lechner 2025-02-07 @169  	list_for_each_entry(trigger, &spi_offload_triggers, list) {
d7231be4b4657e David Lechner 2025-02-07  170  		if (trigger->fwnode != args->fwnode)
d7231be4b4657e David Lechner 2025-02-07  171  			continue;
d7231be4b4657e David Lechner 2025-02-07  172  
d7231be4b4657e David Lechner 2025-02-07  173  		match = trigger->ops->match(trigger, type, args->args, args->nargs);
d7231be4b4657e David Lechner 2025-02-07  174  		if (match)
d7231be4b4657e David Lechner 2025-02-07  175  			break;
d7231be4b4657e David Lechner 2025-02-07  176  	}
d7231be4b4657e David Lechner 2025-02-07  177  
d7231be4b4657e David Lechner 2025-02-07  178  	if (!match)
d7231be4b4657e David Lechner 2025-02-07  179  		return ERR_PTR(-EPROBE_DEFER);
d7231be4b4657e David Lechner 2025-02-07  180  
d7231be4b4657e David Lechner 2025-02-07 @181  	guard(mutex)(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  182  
d7231be4b4657e David Lechner 2025-02-07  183  	if (!trigger->ops)
d7231be4b4657e David Lechner 2025-02-07  184  		return ERR_PTR(-ENODEV);
d7231be4b4657e David Lechner 2025-02-07  185  
d7231be4b4657e David Lechner 2025-02-07  186  	if (trigger->ops->request) {
d7231be4b4657e David Lechner 2025-02-07  187  		ret = trigger->ops->request(trigger, type, args->args, args->nargs);
d7231be4b4657e David Lechner 2025-02-07  188  		if (ret)
d7231be4b4657e David Lechner 2025-02-07  189  			return ERR_PTR(ret);
d7231be4b4657e David Lechner 2025-02-07  190  	}
d7231be4b4657e David Lechner 2025-02-07  191  
d7231be4b4657e David Lechner 2025-02-07  192  	kref_get(&trigger->ref);
d7231be4b4657e David Lechner 2025-02-07  193  
d7231be4b4657e David Lechner 2025-02-07  194  	return trigger;
d7231be4b4657e David Lechner 2025-02-07  195  }
d7231be4b4657e David Lechner 2025-02-07  196  

:::::: The code at line 127 was first introduced by commit
:::::: 8e02d188698851436f76038ea998b726193d1b10 spi: add basic support for SPI offloading

:::::: TO: David Lechner <dlechner@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
