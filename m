Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A86120ADCF
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741259445; cv=none; b=Cj+a2reHI+0nbXg6hPwtgjpRSgfkDuVwgI6gs+lpS2OlrDGPFNjojhM1hoSTk1RD2V7o6ho1CrZYcMNZiEzuELsKnHrm3pj+Vnpo0auMa30hPkeMRCzGXCIK9F+JLYutbQU1+jZdKgvErCKkMiRxuiPo83G4bACFDIXByE7ayI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741259445; c=relaxed/simple;
	bh=4dv6Ie928LEi4wdrDTfqpL1F6gw2pcPEj7fmhieTrKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qEzM2IFZ48gJfyGuhfwpHpU+F6dPye1JKNalyafdGJF3ZYVBqJ1Wf98iXoYFLa6eACZ0kKc8HP1ztAHgLOT9iSAXaIKFqgBPgUAqgI46lCgmFb0BARXJPRXfrU2/NV9XHjT1iaMWw7NjektYiYcighcFU7uqTY6MraTleJGz3qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRwbj77n; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRwbj77n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741259443; x=1772795443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4dv6Ie928LEi4wdrDTfqpL1F6gw2pcPEj7fmhieTrKs=;
  b=FRwbj77nrs/XUc6XAXNl0kvNXWMBpw26sj32vizS6uP5XF1WmK1cvK1Z
   +RkFzMy8y7eGRXHQr8h5ze7gAmn4fd09z8AGaqk/mQQwon1+1J6IMQhFU
   5aR55xZ8Eu6tR9vyHJnVphJf/th3lJeAw6Fatk6fjQ3F3eRKRFFRjA3pH
   k0fqpa72i5+SSHtLTUXxgLgdVaKWSic240U05Mk3+jfIIyBWKg3FB/DBz
   81BxxCLbKOTyrRASpKssHn4N7PHH2REBCjHsbI3bNEPtaATnJhCt2qZkJ
   fh98c8UHrNr6LhoxEbMQV4xPUHRNx78+hOIFO0aF6Qa9Ef5i8Cg01W2zR
   A==;
X-CSE-ConnectionGUID: 3m3FHPxZRiSUQaA0rEBSYQ==
X-CSE-MsgGUID: PLf5C1pPQMyyHa5xMRG27g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59807172"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="59807172"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 03:10:42 -0800
X-CSE-ConnectionGUID: b4/0Xmf6Sci41Zt1T2LFdw==
X-CSE-MsgGUID: loA5oq2cRm62gF5Yv74IgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="123946411"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2025 03:10:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq97d-000Mx8-10;
	Thu, 06 Mar 2025 11:10:37 +0000
Date: Thu, 6 Mar 2025 19:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 02/15] gpio: adnp: use lock guards for the I2C lock
Message-ID: <202503061847.oZj4Ts21-lkp@intel.com>
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
In-Reply-To: <20250303-gpiochip-set-conversion-v1-2-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-2-1d5cceeebf8b@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Michael Hennerich <michael.hennerich@analog.com>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Mun Yew Tham <mun.yew.tham@intel.com>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: patches@opensource.cirrus.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9778568dede2166c7bd124d473f9ec365f782935]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-74x164-use-new-line-value-setter-callbacks/20250303-212738
base:   9778568dede2166c7bd124d473f9ec365f782935
patch link:    https://lore.kernel.org/r/20250303-gpiochip-set-conversion-v1-2-1d5cceeebf8b%40linaro.org
patch subject: [PATCH 02/15] gpio: adnp: use lock guards for the I2C lock
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061847.oZj4Ts21-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503061847.oZj4Ts21-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-adnp.c:254 adnp_irq() error: uninitialized symbol 'level'.
drivers/gpio/gpio-adnp.c:265 adnp_irq() error: uninitialized symbol 'isr'.
drivers/gpio/gpio-adnp.c:265 adnp_irq() error: uninitialized symbol 'ier'.

vim +/level +254 drivers/gpio/gpio-adnp.c

5e969a401a0126 Thierry Reding      2012-09-18  225  
5e969a401a0126 Thierry Reding      2012-09-18  226  static irqreturn_t adnp_irq(int irq, void *data)
5e969a401a0126 Thierry Reding      2012-09-18  227  {
5e969a401a0126 Thierry Reding      2012-09-18  228  	struct adnp *adnp = data;
5e969a401a0126 Thierry Reding      2012-09-18  229  	unsigned int num_regs, i;
5e969a401a0126 Thierry Reding      2012-09-18  230  
5e969a401a0126 Thierry Reding      2012-09-18  231  	num_regs = 1 << adnp->reg_shift;
5e969a401a0126 Thierry Reding      2012-09-18  232  
5e969a401a0126 Thierry Reding      2012-09-18  233  	for (i = 0; i < num_regs; i++) {
5e969a401a0126 Thierry Reding      2012-09-18  234  		unsigned int base = i << adnp->reg_shift, bit;
5e969a401a0126 Thierry Reding      2012-09-18  235  		u8 changed, level, isr, ier;
5e969a401a0126 Thierry Reding      2012-09-18  236  		unsigned long pending;
5e969a401a0126 Thierry Reding      2012-09-18  237  		int err;
5e969a401a0126 Thierry Reding      2012-09-18  238  
4d84a0d4d000dd Bartosz Golaszewski 2025-03-03  239  		scoped_guard(mutex, &adnp->i2c_lock) {
5e969a401a0126 Thierry Reding      2012-09-18  240  			err = adnp_read(adnp, GPIO_PLR(adnp) + i, &level);
4d84a0d4d000dd Bartosz Golaszewski 2025-03-03  241  			if (err < 0)
5e969a401a0126 Thierry Reding      2012-09-18  242  				continue;
5e969a401a0126 Thierry Reding      2012-09-18  243  
5e969a401a0126 Thierry Reding      2012-09-18  244  			err = adnp_read(adnp, GPIO_ISR(adnp) + i, &isr);
4d84a0d4d000dd Bartosz Golaszewski 2025-03-03  245  			if (err < 0)
5e969a401a0126 Thierry Reding      2012-09-18  246  				continue;
5e969a401a0126 Thierry Reding      2012-09-18  247  
5e969a401a0126 Thierry Reding      2012-09-18  248  			err = adnp_read(adnp, GPIO_IER(adnp) + i, &ier);
4d84a0d4d000dd Bartosz Golaszewski 2025-03-03  249  			if (err < 0)
5e969a401a0126 Thierry Reding      2012-09-18  250  				continue;
5e969a401a0126 Thierry Reding      2012-09-18  251  		}
5e969a401a0126 Thierry Reding      2012-09-18  252  
5e969a401a0126 Thierry Reding      2012-09-18  253  		/* determine pins that changed levels */
5e969a401a0126 Thierry Reding      2012-09-18 @254  		changed = level ^ adnp->irq_level[i];
5e969a401a0126 Thierry Reding      2012-09-18  255  
5e969a401a0126 Thierry Reding      2012-09-18  256  		/* compute edge-triggered interrupts */
5e969a401a0126 Thierry Reding      2012-09-18  257  		pending = changed & ((adnp->irq_fall[i] & ~level) |
5e969a401a0126 Thierry Reding      2012-09-18  258  				     (adnp->irq_rise[i] & level));
5e969a401a0126 Thierry Reding      2012-09-18  259  
5e969a401a0126 Thierry Reding      2012-09-18  260  		/* add in level-triggered interrupts */
5e969a401a0126 Thierry Reding      2012-09-18  261  		pending |= (adnp->irq_high[i] & level) |
5e969a401a0126 Thierry Reding      2012-09-18  262  			   (adnp->irq_low[i] & ~level);
5e969a401a0126 Thierry Reding      2012-09-18  263  
5e969a401a0126 Thierry Reding      2012-09-18  264  		/* mask out non-pending and disabled interrupts */
5e969a401a0126 Thierry Reding      2012-09-18 @265  		pending &= isr & ier;
5e969a401a0126 Thierry Reding      2012-09-18  266  
5e969a401a0126 Thierry Reding      2012-09-18  267  		for_each_set_bit(bit, &pending, 8) {
472f95b93860ef Linus Walleij       2013-10-11  268  			unsigned int child_irq;
f0fbe7bce73356 Thierry Reding      2017-11-07  269  			child_irq = irq_find_mapping(adnp->gpio.irq.domain,
0752e169ba523e Linus Walleij       2014-06-02  270  						     base + bit);
472f95b93860ef Linus Walleij       2013-10-11  271  			handle_nested_irq(child_irq);
5e969a401a0126 Thierry Reding      2012-09-18  272  		}
5e969a401a0126 Thierry Reding      2012-09-18  273  	}
5e969a401a0126 Thierry Reding      2012-09-18  274  
5e969a401a0126 Thierry Reding      2012-09-18  275  	return IRQ_HANDLED;
5e969a401a0126 Thierry Reding      2012-09-18  276  }
5e969a401a0126 Thierry Reding      2012-09-18  277  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
