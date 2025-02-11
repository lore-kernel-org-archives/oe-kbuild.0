Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF379CD
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287108; cv=none; b=UovDnJwlhICdu544SdZ58S/Hgx/p3hn/MYMZWsZCnNEogcC4NPB5VyCjcOPDWvWYRgFjjH1z8t4Dx4V20WfdbkYBWfl743Elj9tFCh6S+4m1kql38nSekxi9i++bt5T6zycOVPg/JGWY87WjlvuD3C/XnMEPJgq9YSkSRweTkl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287108; c=relaxed/simple;
	bh=LEplvMcylPfAs4MLLRY2TYwy0hJWFOd1cguEQXUPO/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G54VW0uNiB0K0RpCbNQfFggi9O7PVJILUU6rUdJ4L+vagVU4xQFUta+9ejUK+cmc7A5zBPD/mNERRBtIZimhy/Ig0z76w3Tk8/ptagb0JmPlmlAY8emjyMMycE3ZV3H5NHpjR7yyBDyTiKglr6BD9TV+qq5WhgCCNHeNsSaUX18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyVpHFo+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyVpHFo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739287107; x=1770823107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEplvMcylPfAs4MLLRY2TYwy0hJWFOd1cguEQXUPO/I=;
  b=HyVpHFo+lZ8n/DY2zGJfwYNDEMNM6E8Oin95Ke8q7bYM34J5RKeF3xjt
   1NViEGcsHmG7Xch55M7KSFi9oB1wVCxobLERnviwD48CE6PFKud9jTSaN
   5r90xZUv2r4vrGLL48Bcq7AXXdkp7mFkQg2Qjw99g3M8szI+4rkc3K/JF
   v2eoGQK0Zc25MhbbHTEWljrb2HMMMHlca/MdkoaFRJAa9vXO9AwWfkzvl
   aP7IdCRJfFQp4hwTZFxQzXRxwncWulBJC8nvvwE+14ql168OUhMllL3At
   rGYCGUNwvkF56uMuQ3DTs3OYB/OVQ28924uRvyzcYrG61A79oWYQjb5t7
   A==;
X-CSE-ConnectionGUID: CJrK4XywTEuDhn6iqICj+Q==
X-CSE-MsgGUID: s/DjO1+aRRqJE2jIbTSF3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39106274"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39106274"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 07:18:26 -0800
X-CSE-ConnectionGUID: E/n9ABpYQRCVRtH9+Km4vw==
X-CSE-MsgGUID: KvVAahhfSkaLPxcf5tlQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="113056477"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Feb 2025 07:18:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ths1m-0014LV-1R;
	Tue, 11 Feb 2025 15:18:22 +0000
Date: Tue, 11 Feb 2025 23:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-ci:v8_20250207_dlechner_spi_axi_spi_engine_add_offload_support
 7/7] drivers/spi/spi-offload.c:127 devm_spi_offload_get() error:
 dereferencing freed memory 'resource' (line 126)
Message-ID: <202502112344.7ggtFzyn-lkp@intel.com>
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
CC: Mark Brown <broonie@kernel.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Nuno Sa <nuno.sa@analog.com>

Hi David,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v8_20250207_dlechner_spi_axi_spi_engine_add_offload_support
head:   5a19e1985d014fab9892348f6175a19143cec810
commit: 5a19e1985d014fab9892348f6175a19143cec810 [7/7] spi: axi-spi-engine: implement offload support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112344.7ggtFzyn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502112344.7ggtFzyn-lkp@intel.com/

smatch warnings:
drivers/spi/spi-offload.c:127 devm_spi_offload_get() error: dereferencing freed memory 'resource' (line 126)
drivers/spi/spi-offload.c:183 spi_offload_trigger_get() warn: variable dereferenced before check 'trigger->ops' (see line 173)
drivers/spi/spi-offload.c:300 spi_offload_trigger_enable() error: we previously assumed 'offload->ops' could be null (see line 291)

vim +/resource +127 drivers/spi/spi-offload.c

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
d7231be4b4657e David Lechner 2025-02-07  169  	list_for_each_entry(trigger, &spi_offload_triggers, list) {
d7231be4b4657e David Lechner 2025-02-07  170  		if (trigger->fwnode != args->fwnode)
d7231be4b4657e David Lechner 2025-02-07  171  			continue;
d7231be4b4657e David Lechner 2025-02-07  172  
d7231be4b4657e David Lechner 2025-02-07 @173  		match = trigger->ops->match(trigger, type, args->args, args->nargs);
d7231be4b4657e David Lechner 2025-02-07  174  		if (match)
d7231be4b4657e David Lechner 2025-02-07  175  			break;
d7231be4b4657e David Lechner 2025-02-07  176  	}
d7231be4b4657e David Lechner 2025-02-07  177  
d7231be4b4657e David Lechner 2025-02-07  178  	if (!match)
d7231be4b4657e David Lechner 2025-02-07  179  		return ERR_PTR(-EPROBE_DEFER);
d7231be4b4657e David Lechner 2025-02-07  180  
d7231be4b4657e David Lechner 2025-02-07  181  	guard(mutex)(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  182  
d7231be4b4657e David Lechner 2025-02-07 @183  	if (!trigger->ops)
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
d7231be4b4657e David Lechner 2025-02-07  197  /**
d7231be4b4657e David Lechner 2025-02-07  198   * devm_spi_offload_trigger_get() - Get an offload trigger instance
d7231be4b4657e David Lechner 2025-02-07  199   * @dev: Device for devm purposes.
d7231be4b4657e David Lechner 2025-02-07  200   * @offload: Offload instance connected to a trigger.
d7231be4b4657e David Lechner 2025-02-07  201   * @type: Trigger type to get.
d7231be4b4657e David Lechner 2025-02-07  202   *
d7231be4b4657e David Lechner 2025-02-07  203   * Return: Offload trigger instance or error on failure.
d7231be4b4657e David Lechner 2025-02-07  204   */
d7231be4b4657e David Lechner 2025-02-07  205  struct spi_offload_trigger
d7231be4b4657e David Lechner 2025-02-07  206  *devm_spi_offload_trigger_get(struct device *dev,
d7231be4b4657e David Lechner 2025-02-07  207  			      struct spi_offload *offload,
d7231be4b4657e David Lechner 2025-02-07  208  			      enum spi_offload_trigger_type type)
d7231be4b4657e David Lechner 2025-02-07  209  {
d7231be4b4657e David Lechner 2025-02-07  210  	struct spi_offload_trigger *trigger;
d7231be4b4657e David Lechner 2025-02-07  211  	struct fwnode_reference_args args;
d7231be4b4657e David Lechner 2025-02-07  212  	int ret;
d7231be4b4657e David Lechner 2025-02-07  213  
d7231be4b4657e David Lechner 2025-02-07  214  	ret = fwnode_property_get_reference_args(dev_fwnode(offload->provider_dev),
d7231be4b4657e David Lechner 2025-02-07  215  						 "trigger-sources",
d7231be4b4657e David Lechner 2025-02-07  216  						 "#trigger-source-cells", 0, 0,
d7231be4b4657e David Lechner 2025-02-07  217  						 &args);
d7231be4b4657e David Lechner 2025-02-07  218  	if (ret)
d7231be4b4657e David Lechner 2025-02-07  219  		return ERR_PTR(ret);
d7231be4b4657e David Lechner 2025-02-07  220  
d7231be4b4657e David Lechner 2025-02-07  221  	trigger = spi_offload_trigger_get(type, &args);
d7231be4b4657e David Lechner 2025-02-07  222  	fwnode_handle_put(args.fwnode);
d7231be4b4657e David Lechner 2025-02-07  223  	if (IS_ERR(trigger))
d7231be4b4657e David Lechner 2025-02-07  224  		return trigger;
d7231be4b4657e David Lechner 2025-02-07  225  
d7231be4b4657e David Lechner 2025-02-07  226  	ret = devm_add_action_or_reset(dev, spi_offload_trigger_put, trigger);
d7231be4b4657e David Lechner 2025-02-07  227  	if (ret)
d7231be4b4657e David Lechner 2025-02-07  228  		return ERR_PTR(ret);
d7231be4b4657e David Lechner 2025-02-07  229  
d7231be4b4657e David Lechner 2025-02-07  230  	return trigger;
d7231be4b4657e David Lechner 2025-02-07  231  }
d7231be4b4657e David Lechner 2025-02-07  232  EXPORT_SYMBOL_GPL(devm_spi_offload_trigger_get);
d7231be4b4657e David Lechner 2025-02-07  233  
d7231be4b4657e David Lechner 2025-02-07  234  /**
d7231be4b4657e David Lechner 2025-02-07  235   * spi_offload_trigger_validate - Validate the requested trigger
d7231be4b4657e David Lechner 2025-02-07  236   * @trigger: Offload trigger instance
d7231be4b4657e David Lechner 2025-02-07  237   * @config: Trigger config to validate
d7231be4b4657e David Lechner 2025-02-07  238   *
d7231be4b4657e David Lechner 2025-02-07  239   * On success, @config may be modifed to reflect what the hardware can do.
d7231be4b4657e David Lechner 2025-02-07  240   * For example, the frequency of a periodic trigger may be adjusted to the
d7231be4b4657e David Lechner 2025-02-07  241   * nearest supported value.
d7231be4b4657e David Lechner 2025-02-07  242   *
d7231be4b4657e David Lechner 2025-02-07  243   * Callers will likely need to do additional validation of the modified trigger
d7231be4b4657e David Lechner 2025-02-07  244   * parameters.
d7231be4b4657e David Lechner 2025-02-07  245   *
d7231be4b4657e David Lechner 2025-02-07  246   * Return: 0 on success, negative error code on failure.
d7231be4b4657e David Lechner 2025-02-07  247   */
d7231be4b4657e David Lechner 2025-02-07  248  int spi_offload_trigger_validate(struct spi_offload_trigger *trigger,
d7231be4b4657e David Lechner 2025-02-07  249  				 struct spi_offload_trigger_config *config)
d7231be4b4657e David Lechner 2025-02-07  250  {
d7231be4b4657e David Lechner 2025-02-07  251  	guard(mutex)(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  252  
d7231be4b4657e David Lechner 2025-02-07  253  	if (!trigger->ops)
d7231be4b4657e David Lechner 2025-02-07  254  		return -ENODEV;
d7231be4b4657e David Lechner 2025-02-07  255  
d7231be4b4657e David Lechner 2025-02-07  256  	if (!trigger->ops->validate)
d7231be4b4657e David Lechner 2025-02-07  257  		return -EOPNOTSUPP;
d7231be4b4657e David Lechner 2025-02-07  258  
d7231be4b4657e David Lechner 2025-02-07  259  	return trigger->ops->validate(trigger, config);
d7231be4b4657e David Lechner 2025-02-07  260  }
d7231be4b4657e David Lechner 2025-02-07  261  EXPORT_SYMBOL_GPL(spi_offload_trigger_validate);
d7231be4b4657e David Lechner 2025-02-07  262  
d7231be4b4657e David Lechner 2025-02-07  263  /**
d7231be4b4657e David Lechner 2025-02-07  264   * spi_offload_trigger_enable - enables trigger for offload
d7231be4b4657e David Lechner 2025-02-07  265   * @offload: Offload instance
d7231be4b4657e David Lechner 2025-02-07  266   * @trigger: Offload trigger instance
d7231be4b4657e David Lechner 2025-02-07  267   * @config: Trigger config to validate
d7231be4b4657e David Lechner 2025-02-07  268   *
d7231be4b4657e David Lechner 2025-02-07  269   * There must be a prepared offload instance with the specified ID (i.e.
d7231be4b4657e David Lechner 2025-02-07  270   * spi_optimize_message() was called with the same offload assigned to the
d7231be4b4657e David Lechner 2025-02-07  271   * message). This will also reserve the bus for exclusive use by the offload
d7231be4b4657e David Lechner 2025-02-07  272   * instance until the trigger is disabled. Any other attempts to send a
d7231be4b4657e David Lechner 2025-02-07  273   * transfer or lock the bus will fail with -EBUSY during this time.
d7231be4b4657e David Lechner 2025-02-07  274   *
d7231be4b4657e David Lechner 2025-02-07  275   * Calls must be balanced with spi_offload_trigger_disable().
d7231be4b4657e David Lechner 2025-02-07  276   *
d7231be4b4657e David Lechner 2025-02-07  277   * Context: can sleep
d7231be4b4657e David Lechner 2025-02-07  278   * Return: 0 on success, else a negative error code.
d7231be4b4657e David Lechner 2025-02-07  279   */
d7231be4b4657e David Lechner 2025-02-07  280  int spi_offload_trigger_enable(struct spi_offload *offload,
d7231be4b4657e David Lechner 2025-02-07  281  			       struct spi_offload_trigger *trigger,
d7231be4b4657e David Lechner 2025-02-07  282  			       struct spi_offload_trigger_config *config)
d7231be4b4657e David Lechner 2025-02-07  283  {
d7231be4b4657e David Lechner 2025-02-07  284  	int ret;
d7231be4b4657e David Lechner 2025-02-07  285  
d7231be4b4657e David Lechner 2025-02-07  286  	guard(mutex)(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  287  
d7231be4b4657e David Lechner 2025-02-07  288  	if (!trigger->ops)
d7231be4b4657e David Lechner 2025-02-07  289  		return -ENODEV;
d7231be4b4657e David Lechner 2025-02-07  290  
d7231be4b4657e David Lechner 2025-02-07 @291  	if (offload->ops && offload->ops->trigger_enable) {
d7231be4b4657e David Lechner 2025-02-07  292  		ret = offload->ops->trigger_enable(offload);
d7231be4b4657e David Lechner 2025-02-07  293  		if (ret)
d7231be4b4657e David Lechner 2025-02-07  294  			return ret;
d7231be4b4657e David Lechner 2025-02-07  295  	}
d7231be4b4657e David Lechner 2025-02-07  296  
d7231be4b4657e David Lechner 2025-02-07  297  	if (trigger->ops->enable) {
d7231be4b4657e David Lechner 2025-02-07  298  		ret = trigger->ops->enable(trigger, config);
d7231be4b4657e David Lechner 2025-02-07  299  		if (ret) {
d7231be4b4657e David Lechner 2025-02-07 @300  			if (offload->ops->trigger_disable)
d7231be4b4657e David Lechner 2025-02-07  301  				offload->ops->trigger_disable(offload);
d7231be4b4657e David Lechner 2025-02-07  302  			return ret;
d7231be4b4657e David Lechner 2025-02-07  303  		}
d7231be4b4657e David Lechner 2025-02-07  304  	}
d7231be4b4657e David Lechner 2025-02-07  305  
d7231be4b4657e David Lechner 2025-02-07  306  	return 0;
d7231be4b4657e David Lechner 2025-02-07  307  }
d7231be4b4657e David Lechner 2025-02-07  308  EXPORT_SYMBOL_GPL(spi_offload_trigger_enable);
d7231be4b4657e David Lechner 2025-02-07  309  

:::::: The code at line 127 was first introduced by commit
:::::: 8e02d188698851436f76038ea998b726193d1b10 spi: add basic support for SPI offloading

:::::: TO: David Lechner <dlechner@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
