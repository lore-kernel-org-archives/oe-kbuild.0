Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629352;
	b=uqVb3Nqv4L4GYbFHWW0Y+1hG8VPTtK9o4VIXBUdO0lEXfzYETJNAnv1BjEzbaYvU6EtL
	 VNBzGw9WP5Har3awb7/0mUNc9NO+OJqkbPM2CERRHE9OWPGQmY8IQ+DWy61oYvtgDpUc8
	 wxswhHQm+OQyJGxgApgWEAR8TvTOCPugDFLTYKzRylUdo/Gwk4iFmNVcE19BiGROjM4mf
	 cVugwgC/y6Gku/mAnEt8HYP7jvTkIKIYre4Y8qzPD6DJa9hYiPGNpDFMV8/KW69SHbSF8
	 vkOD5JzDyt6Jahd9YYzmTiDtzSz9vUz6EBFqq1H2WV8V0K4xu7stFozRJ8yMr8mHtbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629352;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=O+tZeLMj7AB3nPeOlllTVyeFOtFd3xxvp5gW1+sfvjg=;
	b=mbFSCE+CbaqP6S4KP1sHevTLruTV75aY8FjP9dxxXywOZ6MKvn4/jttcXictWxRrxmYX
	 acK+ffDJVE8wykhFKzo0cwj4TALcbr9baD4UteatRj4LI/ETwVK6acgtMcwBNVzmfz+ci
	 wDQayMhjteEwMY2M9pSdHNFua4+KTGo0JXSYiKX3clvjx4gJGOA00UAT7PoHvIQm0qUs2
	 m26tKL1kH54n22NPlcY3O7KwYfE+wMknWu0IGymvCvu4SLQt1Z0eE+gj582mTPvIIYQCf
	 7u2GAjp8/MUBeU6fYwZBU+guyJLFw17UxnWP71eQ6r1KcmxZ0225uQeBecnLz8UCTEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oHd6w9OK;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968F606A32E
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 17:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4968F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oHd6w9OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795629352; x=1827165352;
  h=date:from:to:cc:subject:message-id;
  bh=b0l82r8/SocfLrewX4h2dEYJaXbHN/moDBY5yz0JULY=;
  b=oHd6w9OKvOeRiZBsMFJ1hJEkG4xhLjRy08tvpNQkRFUajBwkngcn8S8R
   B5H8o6s2kjvBrOFB+GKhmrZPQm2Kg2n7y1PD4bF7cAAXJePRF46tIrYMA
   e6jexTC2oXly0lGlr+wfNvG2HjGAY3KmkeTQ+IaJ3p3jX1jwdsxgC+Gyo
   I1dtSe2flBcWshyV4hRzYelHMXOXbUPXQkFQE3uLcxKvDxqk6l+HWx0ns
   Wkf4ZTq2cEvOD0jnB7TQfgOSzPFr7QGaXIvM2ZotC7HadK/8SyYLFMUPh
   3815Vk7W7vrMYx9NIjAGXfPPk8BAqEVsyZHxjnHrovt59KTnS9Jy9i5Qy
   A==;
X-CSE-ConnectionGUID: E21X3dYmT9yi7F6RmG6KUg==
X-CSE-MsgGUID: sbkSQyCHT9qA8W1D1o9Ijw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4410595"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4410595"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:55:52 -0800
X-CSE-ConnectionGUID: LqKYLG68R32G3M7ECKXAzQ==
X-CSE-MsgGUID: ewvb5YKnRGi37V4wTZxGHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11817065"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 25 Nov 2026 09:55:51 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWHDf-0000000002p-1UAu;
	Wed, 25 Nov 2026 17:55:47 +0000
Date: Wed, 25 Nov 2026 18:55:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-regulator:for-7.5 6/6]
 drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq()
 warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines: 444.
Message-ID: <20261125184601.R647t8Sj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yaohan Li <shunsheng1218@gmail.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5
head:   d23ba232a8fefe909aeb9366e3905a95a429ebfc
commit: d23ba232a8fefe909aeb9366e3905a95a429ebfc [6/6] regulator: qcom-labibb: stop the recovery workers on teardown
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: openrisc-randconfig-2200-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125184601.R647t8Sj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261125184601.R647t8Sj-lkp@intel.com/

smatch warnings:
drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq() warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines: 444.

vim +444 drivers/regulator/qcom-labibb-regulator.c

d23ba232a8fefe9 Yaohan Li 2026-11-18  384  
d23ba232a8fefe9 Yaohan Li 2026-11-18  385  /*
d23ba232a8fefe9 Yaohan Li 2026-11-18  386   * Request the over-current interrupt once the regulator is registered.
d23ba232a8fefe9 Yaohan Li 2026-11-18  387   * Requesting it from ->set_over_current_protection() is not possible: the
d23ba232a8fefe9 Yaohan Li 2026-11-18  388   * regulator core calls that op from set_machine_constraints(), inside
d23ba232a8fefe9 Yaohan Li 2026-11-18  389   * regulator_register(), and a devres node created there is released after
d23ba232a8fefe9 Yaohan Li 2026-11-18  390   * the regulator itself.  The recovery worker would then still be runnable
d23ba232a8fefe9 Yaohan Li 2026-11-18  391   * while vreg->rdev is already gone.
d23ba232a8fefe9 Yaohan Li 2026-11-18  392   */
d23ba232a8fefe9 Yaohan Li 2026-11-18  393  static int qcom_labibb_setup_ocp_irq(struct labibb_regulator *vreg)
d23ba232a8fefe9 Yaohan Li 2026-11-18  394  {
d23ba232a8fefe9 Yaohan Li 2026-11-18  395  	u32 irq_flags = IRQF_ONESHOT;
d23ba232a8fefe9 Yaohan Li 2026-11-18  396  	int ret;
d23ba232a8fefe9 Yaohan Li 2026-11-18  397  
d23ba232a8fefe9 Yaohan Li 2026-11-18  398  	lockdep_assert_held(&vreg->ocp_lock);
d23ba232a8fefe9 Yaohan Li 2026-11-18  399  
d23ba232a8fefe9 Yaohan Li 2026-11-18  400  	if (vreg->shutting_down)
d23ba232a8fefe9 Yaohan Li 2026-11-18  401  		return -ESHUTDOWN;
d23ba232a8fefe9 Yaohan Li 2026-11-18  402  
d23ba232a8fefe9 Yaohan Li 2026-11-18  403  	if (!vreg->ocp_requested)
d23ba232a8fefe9 Yaohan Li 2026-11-18  404  		return 0;
d23ba232a8fefe9 Yaohan Li 2026-11-18  405  
d23ba232a8fefe9 Yaohan Li 2026-11-18  406  	if (!vreg->ocp_irq_done) {
d23ba232a8fefe9 Yaohan Li 2026-11-18  407  		/* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
d23ba232a8fefe9 Yaohan Li 2026-11-18  408  		switch (vreg->type) {
d23ba232a8fefe9 Yaohan Li 2026-11-18  409  		case QCOM_LAB_TYPE:
d23ba232a8fefe9 Yaohan Li 2026-11-18  410  			irq_flags |= IRQF_TRIGGER_LOW;
d23ba232a8fefe9 Yaohan Li 2026-11-18  411  			break;
d23ba232a8fefe9 Yaohan Li 2026-11-18  412  		case QCOM_IBB_TYPE:
d23ba232a8fefe9 Yaohan Li 2026-11-18  413  			irq_flags |= IRQF_TRIGGER_HIGH;
d23ba232a8fefe9 Yaohan Li 2026-11-18  414  			break;
d23ba232a8fefe9 Yaohan Li 2026-11-18  415  		default:
d23ba232a8fefe9 Yaohan Li 2026-11-18  416  			return -EINVAL;
d23ba232a8fefe9 Yaohan Li 2026-11-18  417  		}
d23ba232a8fefe9 Yaohan Li 2026-11-18  418  
d23ba232a8fefe9 Yaohan Li 2026-11-18  419  		/*
d23ba232a8fefe9 Yaohan Li 2026-11-18  420  		 * The interrupt is owned and released by the cleanup
d23ba232a8fefe9 Yaohan Li 2026-11-18  421  		 * action, so its name has to outlive the interrupt:
d23ba232a8fefe9 Yaohan Li 2026-11-18  422  		 * devres would release a name allocated here before the
d23ba232a8fefe9 Yaohan Li 2026-11-18  423  		 * action runs, while vreg->desc.name is owned by the
d23ba232a8fefe9 Yaohan Li 2026-11-18  424  		 * driver data.
d23ba232a8fefe9 Yaohan Li 2026-11-18  425  		 */
d23ba232a8fefe9 Yaohan Li 2026-11-18  426  		ret = request_threaded_irq(vreg->ocp_irq, NULL,
d23ba232a8fefe9 Yaohan Li 2026-11-18  427  					   qcom_labibb_ocp_isr, irq_flags,
d23ba232a8fefe9 Yaohan Li 2026-11-18  428  					   vreg->desc.name, vreg);
d23ba232a8fefe9 Yaohan Li 2026-11-18  429  		if (ret)
d23ba232a8fefe9 Yaohan Li 2026-11-18  430  			return ret;
d23ba232a8fefe9 Yaohan Li 2026-11-18  431  
d23ba232a8fefe9 Yaohan Li 2026-11-18  432  		vreg->ocp_irq_done = true;
d23ba232a8fefe9 Yaohan Li 2026-11-18  433  	}
d23ba232a8fefe9 Yaohan Li 2026-11-18  434  
d23ba232a8fefe9 Yaohan Li 2026-11-18  435  	/*
d23ba232a8fefe9 Yaohan Li 2026-11-18  436  	 * Enable the hardware source only once a handler exists, and turn
d23ba232a8fefe9 Yaohan Li 2026-11-18  437  	 * it back off if that failed, so that a later attempt can retry
d23ba232a8fefe9 Yaohan Li 2026-11-18  438  	 * without leaving the source enabled on its own.
d23ba232a8fefe9 Yaohan Li 2026-11-18  439  	 */
d23ba232a8fefe9 Yaohan Li 2026-11-18  440  	ret = qcom_labibb_ocp_hw_enable(vreg->rdev);
d23ba232a8fefe9 Yaohan Li 2026-11-18  441  	if (ret)
d23ba232a8fefe9 Yaohan Li 2026-11-18  442  		qcom_labibb_ocp_hw_disable(vreg->rdev);
d23ba232a8fefe9 Yaohan Li 2026-11-18  443  
d23ba232a8fefe9 Yaohan Li 2026-11-18 @444  	return ret;
d23ba232a8fefe9 Yaohan Li 2026-11-18  445  }
d23ba232a8fefe9 Yaohan Li 2026-11-18  446  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
