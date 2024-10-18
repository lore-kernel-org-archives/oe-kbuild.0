Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB5B282F1
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729257343; cv=none; b=AVwabhxVm91yxmK795uyCEzU1CuTJJgpbrJ0PU1EzI4EkoQuegrGcOCPO7qnI4roHWV+nJxZNrWaibb6L54hxKBwDhFfmClECKUbwPI7b/vJVW8kwum9rPzQluFQdIev3yxVw7HwqMwqjW4bxEF3lmIJrdmC3bIy558ZZNVDgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729257343; c=relaxed/simple;
	bh=tmOLjoX++Ego0311wYpeA1fPzQ6FWFhDrZGbKn4gg2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/jk6uQ9gI2+Et3unVxWAs5c9coIAXSnau7s3YNm5BFvz4HVfJUeokRyOEBeEHJTKzgclK19GJGgK5RTOEKfQYSDICxjlJ1BBdO2aPTwDABclg0H3H0dN3nbFv3UmuaT4OlSZfIkCC2yWXtFNpb0LXyliLNGS5kOfQ2AfHzUMZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFHIxu3f; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFHIxu3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729257341; x=1760793341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmOLjoX++Ego0311wYpeA1fPzQ6FWFhDrZGbKn4gg2Y=;
  b=VFHIxu3fNm+cI0zyLrrkDrKygPjtEhU3Xjr0iu9wVWWS+leNwkEIh9t8
   Hs2ICkhOCaITFxKiXF18ao15NT9bKYE6K8YwU/tZ8I30Cs2L7XNUiU36t
   D2bgYpQOooUN1AJegouvdj+USS6Gd2NBg7lwHHxxa5dwjE4xL+aBv2iuD
   MKEw4k8msG3YFLFKfynJVL1pIxyHBDiBcw1tbSheJGZrxqWnwrxU0e/Kv
   ANQ/PF/AAIj7axY07khNAOkFjA0Q4upQ3TKixEkkB5QzExEhk4DToc1Rn
   ZwzSCfKiZCiiCF0RZc/Ntt6HmUCnmNFkYRxxiZmiNY/o85gQHR6u2i+Ce
   Q==;
X-CSE-ConnectionGUID: wDHvOMJ8QzqZrfu/cjF4fw==
X-CSE-MsgGUID: l7s0gyP8TK+0O6wqjkFsnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28666035"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28666035"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:15:39 -0700
X-CSE-ConnectionGUID: /os780fJSZOtdalRzc3tIg==
X-CSE-MsgGUID: h9k4iM91TiK/jr8Vh6hhIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="78467167"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2024 06:15:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1mpL-000Nqh-2d;
	Fri, 18 Oct 2024 13:15:35 +0000
Date: Fri, 18 Oct 2024 21:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpio/gpio-rtd.c:394 rtd_gpio_irq_handle() error:
 uninitialized symbol 'get_reg_offset'.
Message-ID: <202410182143.ArtCZQYs-lkp@intel.com>
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
TO: Tzuyi Chang <tychang@realtek.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4d939780b70592e0f4bc6c397e52e518f8fb7916
commit: eee636bff0dcb52c39300dd88ff7e8ecaff4492a gpio: rtd: Add support for Realtek DHC(Digital Home Center) RTD SoCs
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r072-20241017 (https://download.01.org/0day-ci/archive/20241018/202410182143.ArtCZQYs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410182143.ArtCZQYs-lkp@intel.com/

New smatch warnings:
drivers/gpio/gpio-rtd.c:394 rtd_gpio_irq_handle() error: uninitialized symbol 'get_reg_offset'.

Old smatch warnings:
drivers/gpio/gpio-rtd.c:534 rtd_gpio_probe() warn: unsigned 'data->irqs[0]' is never less than zero.
drivers/gpio/gpio-rtd.c:538 rtd_gpio_probe() warn: unsigned 'data->irqs[1]' is never less than zero.

vim +/get_reg_offset +394 drivers/gpio/gpio-rtd.c

eee636bff0dcb5 Tzuyi Chang 2023-12-28  373  
eee636bff0dcb5 Tzuyi Chang 2023-12-28  374  static void rtd_gpio_irq_handle(struct irq_desc *desc)
eee636bff0dcb5 Tzuyi Chang 2023-12-28  375  {
eee636bff0dcb5 Tzuyi Chang 2023-12-28  376  	int (*get_reg_offset)(struct rtd_gpio *gpio, unsigned int offset);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  377  	struct rtd_gpio *data = irq_desc_get_handler_data(desc);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  378  	struct irq_domain *domain = data->gpio_chip.irq.domain;
eee636bff0dcb5 Tzuyi Chang 2023-12-28  379  	struct irq_chip *chip = irq_desc_get_chip(desc);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  380  	unsigned int irq = irq_desc_get_irq(desc);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  381  	unsigned long status;
eee636bff0dcb5 Tzuyi Chang 2023-12-28  382  	int reg_offset, i, j;
eee636bff0dcb5 Tzuyi Chang 2023-12-28  383  	unsigned int hwirq;
eee636bff0dcb5 Tzuyi Chang 2023-12-28  384  
eee636bff0dcb5 Tzuyi Chang 2023-12-28  385  	if (irq == data->irqs[0])
eee636bff0dcb5 Tzuyi Chang 2023-12-28  386  		get_reg_offset = &rtd_gpio_gpa_offset;
eee636bff0dcb5 Tzuyi Chang 2023-12-28  387  	else if (irq == data->irqs[1])
eee636bff0dcb5 Tzuyi Chang 2023-12-28  388  		get_reg_offset = &rtd_gpio_gpda_offset;
eee636bff0dcb5 Tzuyi Chang 2023-12-28  389  
eee636bff0dcb5 Tzuyi Chang 2023-12-28  390  	chained_irq_enter(chip, desc);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  391  
eee636bff0dcb5 Tzuyi Chang 2023-12-28  392  	/* Each GPIO interrupt status register contains 31 GPIOs. */
eee636bff0dcb5 Tzuyi Chang 2023-12-28  393  	for (i = 0; i < data->info->num_gpios; i += 31) {
eee636bff0dcb5 Tzuyi Chang 2023-12-28 @394  		reg_offset = get_reg_offset(data, i);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  395  
eee636bff0dcb5 Tzuyi Chang 2023-12-28  396  		/*
eee636bff0dcb5 Tzuyi Chang 2023-12-28  397  		 * Bit 0 is the write_en bit, bit 0 to 31 corresponds to 31 GPIOs.
eee636bff0dcb5 Tzuyi Chang 2023-12-28  398  		 * When bit 0 is set to 0, write 1 to the other bits to clear the status.
eee636bff0dcb5 Tzuyi Chang 2023-12-28  399  		 * When bit 0 is set to 1, write 1 to the other bits to set the status.
eee636bff0dcb5 Tzuyi Chang 2023-12-28  400  		 */
eee636bff0dcb5 Tzuyi Chang 2023-12-28  401  		status = readl_relaxed(data->irq_base + reg_offset);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  402  		status &= ~BIT(0);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  403  		writel_relaxed(status, data->irq_base + reg_offset);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  404  
eee636bff0dcb5 Tzuyi Chang 2023-12-28  405  		for_each_set_bit(j, &status, 32) {
eee636bff0dcb5 Tzuyi Chang 2023-12-28  406  			hwirq = i + j - 1;
eee636bff0dcb5 Tzuyi Chang 2023-12-28  407  			if (rtd_gpio_check_ie(data, hwirq)) {
eee636bff0dcb5 Tzuyi Chang 2023-12-28  408  				int girq = irq_find_mapping(domain, hwirq);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  409  				u32 irq_type = irq_get_trigger_type(girq);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  410  
eee636bff0dcb5 Tzuyi Chang 2023-12-28  411  				if ((irq == data->irqs[1]) && (irq_type != IRQ_TYPE_EDGE_BOTH))
eee636bff0dcb5 Tzuyi Chang 2023-12-28  412  					break;
eee636bff0dcb5 Tzuyi Chang 2023-12-28  413  				generic_handle_domain_irq(domain, hwirq);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  414  			}
eee636bff0dcb5 Tzuyi Chang 2023-12-28  415  		}
eee636bff0dcb5 Tzuyi Chang 2023-12-28  416  	}
eee636bff0dcb5 Tzuyi Chang 2023-12-28  417  
eee636bff0dcb5 Tzuyi Chang 2023-12-28  418  	chained_irq_exit(chip, desc);
eee636bff0dcb5 Tzuyi Chang 2023-12-28  419  }
eee636bff0dcb5 Tzuyi Chang 2023-12-28  420  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
