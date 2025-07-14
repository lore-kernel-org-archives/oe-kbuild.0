Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A52223A58B
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 21:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752527182; cv=none; b=WCC7Qf/ChgmNbSrcljOa+cOCn6iApTe9fSa9UMMM/fenBfNbkRtYivp6KFl4rNAbv+eNDUrCPXnRgeMu3WJfa84XJQhzJrQ+zSZuWPoN1GPfbZzJE5Hvj6eDc8R6m7LS9mT8LloDbCMax+FUvC9COvZGny2xOJ9nmiB1lkCvUMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752527182; c=relaxed/simple;
	bh=90ef4z0opIlQqNvpZ76P9YQ2TgD7bm2QWWvuIMhzXKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TRuWJgySxIL81U5wbIY2q6odsVZ+m2DiGVrEmKFbDvrFtAwOx2Bu4P1HDKHmkr/fX0GA0NmIp/e6tg4oZ3RVz4P8ZUO9XnNxve2CcPwk573vp5+YrncUc5fnf/Xw2A2CbHYALFKDMkmlYPBZsGCiIkhEVXQxrGcC73bGn9CEw7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKC1LDp3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKC1LDp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752527180; x=1784063180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=90ef4z0opIlQqNvpZ76P9YQ2TgD7bm2QWWvuIMhzXKc=;
  b=cKC1LDp3hbkzt37r1Sz3m6utwLQ5GsOJNd4azX+9izNaqgifoR3aw0Jr
   6FMrbfF6U7bYaskpYH/XF5oh6F2cdfpq+XW8yQ1z7UEqK1IND9QVsROuA
   q3TICoDbosA6ML6VFMqHmTTOjqR4juI7QcQdwXs0b0hLv1jHD0X0i92pO
   Nk5eppIeUNa8i0jPy/yIKUcpQklAY5QJ4lbFRa0mtsyn3Hp59dnT9cXPi
   Pz+km4B/k8XLWGzgQvl96FL6uxkSNx1AbRigzqBZtUOyTDVCtG5kM4RrM
   oSlzMVDC8iecTIaeswGHnhHUvNb3hW7nifhz7dYf0yJ2bRh0bjm85aids
   g==;
X-CSE-ConnectionGUID: t7wONdCVSDKcyBdyqChjqw==
X-CSE-MsgGUID: 3RqoQ3HLTS6zb6yfJBx8xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66089951"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="66089951"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 14:06:19 -0700
X-CSE-ConnectionGUID: +26iPzEWShymDQXOTj13KA==
X-CSE-MsgGUID: ZB3SNpNzQW6hwyHJpZvAlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157132702"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jul 2025 14:06:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubQNK-0009LT-36;
	Mon, 14 Jul 2025 21:06:14 +0000
Date: Tue, 15 Jul 2025 05:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-ci:v2_20250711_ckeepax_update_sdca_kconfig 12/13]
 sound/soc/sdca/sdca_interrupts.c:278 sdca_irq_request() error: buffer
 overflow 'info->irqs' 31 <= 31
Message-ID: <202507150415.M1tCgi3p-lkp@intel.com>
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
TO: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20250711_ckeepax_update_sdca_kconfig
head:   5030abcb0aa3304bf91497844ffa9607a2d4ad5d
commit: 6894e49b7b62cdb0edbcaaa23ea0218edb3b02dd [12/13] ASoC: SDCA: Kconfig/Makefile fixups
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-141-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150415.M1tCgi3p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507150415.M1tCgi3p-lkp@intel.com/

smatch warnings:
sound/soc/sdca/sdca_interrupts.c:278 sdca_irq_request() error: buffer overflow 'info->irqs' 31 <= 31
sound/soc/sdca/sdca_interrupts.c:387 sdca_irq_populate() error: uninitialized symbol 'name'.

vim +278 sound/soc/sdca/sdca_interrupts.c

b126394d9ec6f9 Maciej Strozek 2025-06-24  243  
b126394d9ec6f9 Maciej Strozek 2025-06-24  244  /**
b126394d9ec6f9 Maciej Strozek 2025-06-24  245   * sdca_request_irq - request an individual SDCA interrupt
b126394d9ec6f9 Maciej Strozek 2025-06-24  246   * @dev: Pointer to the struct device against which things should be allocated.
b126394d9ec6f9 Maciej Strozek 2025-06-24  247   * @interrupt_info: Pointer to the interrupt information structure.
b126394d9ec6f9 Maciej Strozek 2025-06-24  248   * @sdca_irq: SDCA interrupt position.
b126394d9ec6f9 Maciej Strozek 2025-06-24  249   * @name: Name to be given to the IRQ.
b126394d9ec6f9 Maciej Strozek 2025-06-24  250   * @handler: A callback thread function to be called for the IRQ.
b126394d9ec6f9 Maciej Strozek 2025-06-24  251   * @data: Private data pointer that will be passed to the handler.
b126394d9ec6f9 Maciej Strozek 2025-06-24  252   *
b126394d9ec6f9 Maciej Strozek 2025-06-24  253   * Typically this is handled internally by sdca_irq_populate, however if
b126394d9ec6f9 Maciej Strozek 2025-06-24  254   * a device requires custom IRQ handling this can be called manually before
b126394d9ec6f9 Maciej Strozek 2025-06-24  255   * calling sdca_irq_populate, which will then skip that IRQ whilst processing.
b126394d9ec6f9 Maciej Strozek 2025-06-24  256   *
b126394d9ec6f9 Maciej Strozek 2025-06-24  257   * Return: Zero on success, and a negative error code on failure.
b126394d9ec6f9 Maciej Strozek 2025-06-24  258   */
b126394d9ec6f9 Maciej Strozek 2025-06-24  259  int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
b126394d9ec6f9 Maciej Strozek 2025-06-24  260  		     int sdca_irq, const char *name, irq_handler_t handler,
b126394d9ec6f9 Maciej Strozek 2025-06-24  261  		     void *data)
b126394d9ec6f9 Maciej Strozek 2025-06-24  262  {
b126394d9ec6f9 Maciej Strozek 2025-06-24  263  	int ret;
b126394d9ec6f9 Maciej Strozek 2025-06-24  264  
b126394d9ec6f9 Maciej Strozek 2025-06-24  265  	if (sdca_irq < 0 || sdca_irq > SDCA_MAX_INTERRUPTS) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  266  		dev_err(dev, "bad irq request: %d\n", sdca_irq);
b126394d9ec6f9 Maciej Strozek 2025-06-24  267  		return -EINVAL;
b126394d9ec6f9 Maciej Strozek 2025-06-24  268  	}
b126394d9ec6f9 Maciej Strozek 2025-06-24  269  
b126394d9ec6f9 Maciej Strozek 2025-06-24  270  	guard(mutex)(&info->irq_lock);
b126394d9ec6f9 Maciej Strozek 2025-06-24  271  
b126394d9ec6f9 Maciej Strozek 2025-06-24  272  	ret = sdca_irq_request_locked(dev, info, sdca_irq, name, handler, data);
b126394d9ec6f9 Maciej Strozek 2025-06-24  273  	if (ret) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  274  		dev_err(dev, "failed to request irq %s: %d\n", name, ret);
b126394d9ec6f9 Maciej Strozek 2025-06-24  275  		return ret;
b126394d9ec6f9 Maciej Strozek 2025-06-24  276  	}
b126394d9ec6f9 Maciej Strozek 2025-06-24  277  
b126394d9ec6f9 Maciej Strozek 2025-06-24 @278  	info->irqs[sdca_irq].externally_requested = true;
b126394d9ec6f9 Maciej Strozek 2025-06-24  279  
b126394d9ec6f9 Maciej Strozek 2025-06-24  280  	return 0;
b126394d9ec6f9 Maciej Strozek 2025-06-24  281  }
b126394d9ec6f9 Maciej Strozek 2025-06-24  282  EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA_IRQ");
b126394d9ec6f9 Maciej Strozek 2025-06-24  283  
b126394d9ec6f9 Maciej Strozek 2025-06-24  284  /**
b126394d9ec6f9 Maciej Strozek 2025-06-24  285   * sdca_irq_data_populate - Populate common interrupt data
b126394d9ec6f9 Maciej Strozek 2025-06-24  286   * @component: Pointer to the ASoC component for the Function.
b126394d9ec6f9 Maciej Strozek 2025-06-24  287   * @function: Pointer to the SDCA Function.
b126394d9ec6f9 Maciej Strozek 2025-06-24  288   * @entity: Pointer to the SDCA Entity.
b126394d9ec6f9 Maciej Strozek 2025-06-24  289   * @control: Pointer to the SDCA Control.
b126394d9ec6f9 Maciej Strozek 2025-06-24  290   * @interrupt: Pointer to the SDCA interrupt for this IRQ.
b126394d9ec6f9 Maciej Strozek 2025-06-24  291   *
b126394d9ec6f9 Maciej Strozek 2025-06-24  292   * Return: Zero on success, and a negative error code on failure.
b126394d9ec6f9 Maciej Strozek 2025-06-24  293   */
b126394d9ec6f9 Maciej Strozek 2025-06-24  294  int sdca_irq_data_populate(struct snd_soc_component *component,
b126394d9ec6f9 Maciej Strozek 2025-06-24  295  			   struct sdca_function_data *function,
b126394d9ec6f9 Maciej Strozek 2025-06-24  296  			   struct sdca_entity *entity,
b126394d9ec6f9 Maciej Strozek 2025-06-24  297  			   struct sdca_control *control,
b126394d9ec6f9 Maciej Strozek 2025-06-24  298  			   struct sdca_interrupt *interrupt)
b126394d9ec6f9 Maciej Strozek 2025-06-24  299  {
b126394d9ec6f9 Maciej Strozek 2025-06-24  300  	struct device *dev = component->dev;
b126394d9ec6f9 Maciej Strozek 2025-06-24  301  	const char *name;
b126394d9ec6f9 Maciej Strozek 2025-06-24  302  
b126394d9ec6f9 Maciej Strozek 2025-06-24  303  	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s %s", function->desc->name,
b126394d9ec6f9 Maciej Strozek 2025-06-24  304  			      entity->label, control->label);
b126394d9ec6f9 Maciej Strozek 2025-06-24  305  	if (!name)
b126394d9ec6f9 Maciej Strozek 2025-06-24  306  		return -ENOMEM;
b126394d9ec6f9 Maciej Strozek 2025-06-24  307  
b126394d9ec6f9 Maciej Strozek 2025-06-24  308  	interrupt->name = name;
b126394d9ec6f9 Maciej Strozek 2025-06-24  309  	interrupt->component = component;
b126394d9ec6f9 Maciej Strozek 2025-06-24  310  	interrupt->function = function;
b126394d9ec6f9 Maciej Strozek 2025-06-24  311  	interrupt->entity = entity;
b126394d9ec6f9 Maciej Strozek 2025-06-24  312  	interrupt->control = control;
b126394d9ec6f9 Maciej Strozek 2025-06-24  313  
b126394d9ec6f9 Maciej Strozek 2025-06-24  314  	return 0;
b126394d9ec6f9 Maciej Strozek 2025-06-24  315  }
b126394d9ec6f9 Maciej Strozek 2025-06-24  316  EXPORT_SYMBOL_NS_GPL(sdca_irq_data_populate, "SND_SOC_SDCA_IRQ");
b126394d9ec6f9 Maciej Strozek 2025-06-24  317  
b126394d9ec6f9 Maciej Strozek 2025-06-24  318  /**
b126394d9ec6f9 Maciej Strozek 2025-06-24  319   * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
b126394d9ec6f9 Maciej Strozek 2025-06-24  320   * @function: Pointer to the SDCA Function.
b126394d9ec6f9 Maciej Strozek 2025-06-24  321   * @component: Pointer to the ASoC component for the Function.
b126394d9ec6f9 Maciej Strozek 2025-06-24  322   * @info: Pointer to the SDCA interrupt info for this device.
b126394d9ec6f9 Maciej Strozek 2025-06-24  323   *
b126394d9ec6f9 Maciej Strozek 2025-06-24  324   * Typically this would be called from the driver for a single SDCA Function.
b126394d9ec6f9 Maciej Strozek 2025-06-24  325   *
b126394d9ec6f9 Maciej Strozek 2025-06-24  326   * Return: Zero on success, and a negative error code on failure.
b126394d9ec6f9 Maciej Strozek 2025-06-24  327   */
b126394d9ec6f9 Maciej Strozek 2025-06-24  328  int sdca_irq_populate(struct sdca_function_data *function,
b126394d9ec6f9 Maciej Strozek 2025-06-24  329  		      struct snd_soc_component *component,
b126394d9ec6f9 Maciej Strozek 2025-06-24  330  		      struct sdca_interrupt_info *info)
b126394d9ec6f9 Maciej Strozek 2025-06-24  331  {
b126394d9ec6f9 Maciej Strozek 2025-06-24  332  	struct device *dev = component->dev;
b126394d9ec6f9 Maciej Strozek 2025-06-24  333  	int i, j;
b126394d9ec6f9 Maciej Strozek 2025-06-24  334  
b126394d9ec6f9 Maciej Strozek 2025-06-24  335  	guard(mutex)(&info->irq_lock);
b126394d9ec6f9 Maciej Strozek 2025-06-24  336  
b126394d9ec6f9 Maciej Strozek 2025-06-24  337  	for (i = 0; i < function->num_entities; i++) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  338  		struct sdca_entity *entity = &function->entities[i];
b126394d9ec6f9 Maciej Strozek 2025-06-24  339  
b126394d9ec6f9 Maciej Strozek 2025-06-24  340  		for (j = 0; j < entity->num_controls; j++) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  341  			struct sdca_control *control = &entity->controls[j];
b126394d9ec6f9 Maciej Strozek 2025-06-24  342  			int irq = control->interrupt_position;
b126394d9ec6f9 Maciej Strozek 2025-06-24  343  			struct sdca_interrupt *interrupt;
b9ab3b61824190 Charles Keepax 2025-06-24  344  			irq_handler_t handler;
b126394d9ec6f9 Maciej Strozek 2025-06-24  345  			const char *name;
b126394d9ec6f9 Maciej Strozek 2025-06-24  346  			int ret;
b126394d9ec6f9 Maciej Strozek 2025-06-24  347  
b126394d9ec6f9 Maciej Strozek 2025-06-24  348  			if (irq == SDCA_NO_INTERRUPT) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  349  				continue;
b126394d9ec6f9 Maciej Strozek 2025-06-24  350  			} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  351  				dev_err(dev, "bad irq position: %d\n", irq);
b126394d9ec6f9 Maciej Strozek 2025-06-24  352  				return -EINVAL;
b126394d9ec6f9 Maciej Strozek 2025-06-24  353  			}
b126394d9ec6f9 Maciej Strozek 2025-06-24  354  
b126394d9ec6f9 Maciej Strozek 2025-06-24  355  			interrupt = &info->irqs[irq];
b126394d9ec6f9 Maciej Strozek 2025-06-24  356  
b126394d9ec6f9 Maciej Strozek 2025-06-24  357  			if (interrupt->externally_requested) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  358  				dev_dbg(dev,
b126394d9ec6f9 Maciej Strozek 2025-06-24  359  					"skipping irq %d, externally requested\n",
b126394d9ec6f9 Maciej Strozek 2025-06-24  360  					irq);
b126394d9ec6f9 Maciej Strozek 2025-06-24  361  				continue;
b126394d9ec6f9 Maciej Strozek 2025-06-24  362  			}
b126394d9ec6f9 Maciej Strozek 2025-06-24  363  
b126394d9ec6f9 Maciej Strozek 2025-06-24  364  			ret = sdca_irq_data_populate(component, function, entity,
b126394d9ec6f9 Maciej Strozek 2025-06-24  365  						     control, interrupt);
b126394d9ec6f9 Maciej Strozek 2025-06-24  366  			if (ret)
b126394d9ec6f9 Maciej Strozek 2025-06-24  367  				return ret;
b126394d9ec6f9 Maciej Strozek 2025-06-24  368  
b9ab3b61824190 Charles Keepax 2025-06-24  369  			handler = base_handler;
b9ab3b61824190 Charles Keepax 2025-06-24  370  
b9ab3b61824190 Charles Keepax 2025-06-24  371  			switch (entity->type) {
b9ab3b61824190 Charles Keepax 2025-06-24  372  			case SDCA_ENTITY_TYPE_ENTITY_0:
b9ab3b61824190 Charles Keepax 2025-06-24  373  				if (control->sel == SDCA_CTL_ENTITY_0_FUNCTION_STATUS)
b9ab3b61824190 Charles Keepax 2025-06-24  374  					handler = function_status_handler;
b9ab3b61824190 Charles Keepax 2025-06-24  375  				break;
b9ab3b61824190 Charles Keepax 2025-06-24  376  			case SDCA_ENTITY_TYPE_GE:
b9ab3b61824190 Charles Keepax 2025-06-24  377  				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
b9ab3b61824190 Charles Keepax 2025-06-24  378  					handler = detected_mode_handler;
b9ab3b61824190 Charles Keepax 2025-06-24  379  				break;
b9ab3b61824190 Charles Keepax 2025-06-24  380  			default:
b9ab3b61824190 Charles Keepax 2025-06-24  381  				break;
b9ab3b61824190 Charles Keepax 2025-06-24  382  			}
b9ab3b61824190 Charles Keepax 2025-06-24  383  
b126394d9ec6f9 Maciej Strozek 2025-06-24  384  			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
b9ab3b61824190 Charles Keepax 2025-06-24  385  						      handler, interrupt);
b126394d9ec6f9 Maciej Strozek 2025-06-24  386  			if (ret) {
b126394d9ec6f9 Maciej Strozek 2025-06-24 @387  				dev_err(dev, "failed to request irq %s: %d\n",
b126394d9ec6f9 Maciej Strozek 2025-06-24  388  					name, ret);
b126394d9ec6f9 Maciej Strozek 2025-06-24  389  				return ret;
b126394d9ec6f9 Maciej Strozek 2025-06-24  390  			}
b126394d9ec6f9 Maciej Strozek 2025-06-24  391  		}
b126394d9ec6f9 Maciej Strozek 2025-06-24  392  	}
b126394d9ec6f9 Maciej Strozek 2025-06-24  393  
b126394d9ec6f9 Maciej Strozek 2025-06-24  394  	return 0;
b126394d9ec6f9 Maciej Strozek 2025-06-24  395  }
b126394d9ec6f9 Maciej Strozek 2025-06-24  396  EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA_IRQ");
b126394d9ec6f9 Maciej Strozek 2025-06-24  397  

:::::: The code at line 278 was first introduced by commit
:::::: b126394d9ec6f9d8322cf392ba23d4a5f96faf5a ASoC: SDCA: Generic interrupt support

:::::: TO: Maciej Strozek <mstrozek@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
