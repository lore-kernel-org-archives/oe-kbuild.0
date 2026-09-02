Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A133D47B4
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Sep 2026 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374094; cv=none; b=gcliTK64+dp/1J3YIV9duJvpUPo7p1bxsU0Hl7Gd9ziekJXNg0ICYD+GpYSEK7e3TodqwCGkxjR7oXT22LcwsTvgdXW+XE04jBtaXSlzHO4fWyagtBf8YymvCUAIQzmc3lV37m5MrWJ80fBZt6V802QtmIFoUXFC0TjVoa8gakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374094; c=relaxed/simple;
	bh=0wnKOugAVwdGFVRCqKlq8jKsifc5eWBSxltwDmu7tG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uuzwnPAGrhiY2KXH3/e6FWpGJ8oVCQNAON/Z+/LlXnScRXA6Urq277Dc006Hx6ARhAweAxBn0ksGmt0sFPBPM91XBBr5uD7OfYu7nGmzW4iYEJxHeyb/KP9vlRDYhIRj+BntBU5Y02t/uBezD7af7d9qwlAsO0CQigmyghxMA18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VF6njLEW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VF6njLEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788374091; x=1819910091;
  h=date:from:to:cc:subject:message-id;
  bh=0wnKOugAVwdGFVRCqKlq8jKsifc5eWBSxltwDmu7tG0=;
  b=VF6njLEWk4vag2zakStuAvq9xivu7bWBaenAu/fAiCcFmf586BaYjPpl
   C1YheyNAMqg4LPU8dpU/M9CMUXEw8/etvQxlB06fkdG773HyYEpHvCMYL
   YWwqXSz+ZEl+hr+lgGkdBQLPCk+/szsLzPvay0rQ1pgXTGuPrvndNebsc
   xIjvhGHYZfPUWJFSXLexf9MYUM4C143KwClLKS7YGEwN2Y9Pd71JaBeQW
   VkCdv2yrM+M40dYaJ8919VuTxH3q8nM+YbVnlfGCR0SPL8J4fnm3PoV+/
   /+PLLNqNmcwq6EGeMXO3WXl3BpcJvvAVRb1vdhCz1ViC6ohi3DOrhR61v
   g==;
X-CSE-ConnectionGUID: n+ZYxu7MQpuUUsRT24SPAw==
X-CSE-MsgGUID: wvhDA+CEQOavf2QeoS1Iew==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100358411"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100358411"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 11:34:49 -0700
X-CSE-ConnectionGUID: 0P2LS+rPQG2JVfVTgoesDQ==
X-CSE-MsgGUID: +e2V6+ZBRb6GbCwhG+uDOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="265174772"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2026 11:34:47 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1pnI-0000000039I-39cw;
	Wed, 02 Sep 2026 18:34:44 +0000
Date: Thu, 03 Sep 2026 02:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iio/accel/adxl380.c:1763:8-33: WARNING: Threaded IRQ
 with no primary handler requested without IRQF_ONESHOT (unless it is nested
 IRQ)
Message-ID: <202609030222.a7bv52e2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Ramona Gradinariu <ramona.gradinariu@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89a312991dc6e638a36adc43ccb91dbc25504c04
commit: df36de13677a0ebd3ab31dd2c603f9eafdf8de7d iio: accel: add ADXL380 driver
date:   2 years, 1 month ago
:::::: branch date: 22 hours ago
:::::: commit date: 2 years, 1 month ago
config: mips-randconfig-r051-20260823 (https://download.01.org/0day-ci/archive/20260903/202609030222.a7bv52e2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: df36de13677a ("iio: accel: add ADXL380 driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609030222.a7bv52e2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/accel/adxl380.c:1763:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +1763 drivers/iio/accel/adxl380.c

df36de13677a0e Antoniu Miclaus 2024-07-08  1717  
df36de13677a0e Antoniu Miclaus 2024-07-08  1718  static int adxl380_config_irq(struct iio_dev *indio_dev)
df36de13677a0e Antoniu Miclaus 2024-07-08  1719  {
df36de13677a0e Antoniu Miclaus 2024-07-08  1720  	struct adxl380_state *st = iio_priv(indio_dev);
df36de13677a0e Antoniu Miclaus 2024-07-08  1721  	unsigned long irq_flag;
df36de13677a0e Antoniu Miclaus 2024-07-08  1722  	struct irq_data *desc;
df36de13677a0e Antoniu Miclaus 2024-07-08  1723  	u32 irq_type;
df36de13677a0e Antoniu Miclaus 2024-07-08  1724  	u8 polarity;
df36de13677a0e Antoniu Miclaus 2024-07-08  1725  	int ret;
df36de13677a0e Antoniu Miclaus 2024-07-08  1726  
df36de13677a0e Antoniu Miclaus 2024-07-08  1727  	st->irq = fwnode_irq_get_byname(dev_fwnode(st->dev), "INT0");
df36de13677a0e Antoniu Miclaus 2024-07-08  1728  	if (st->irq > 0) {
df36de13677a0e Antoniu Miclaus 2024-07-08  1729  		st->int_map[0] = ADXL380_INT0_MAP0_REG;
df36de13677a0e Antoniu Miclaus 2024-07-08  1730  		st->int_map[1] = ADXL380_INT0_MAP1_REG;
df36de13677a0e Antoniu Miclaus 2024-07-08  1731  	} else {
df36de13677a0e Antoniu Miclaus 2024-07-08  1732  		st->irq = fwnode_irq_get_byname(dev_fwnode(st->dev), "INT1");
df36de13677a0e Antoniu Miclaus 2024-07-08  1733  		if (st->irq > 0)
df36de13677a0e Antoniu Miclaus 2024-07-08  1734  			return dev_err_probe(st->dev, -ENODEV,
df36de13677a0e Antoniu Miclaus 2024-07-08  1735  					     "no interrupt name specified");
df36de13677a0e Antoniu Miclaus 2024-07-08  1736  		st->int_map[0] = ADXL380_INT1_MAP0_REG;
df36de13677a0e Antoniu Miclaus 2024-07-08  1737  		st->int_map[1] = ADXL380_INT1_MAP1_REG;
df36de13677a0e Antoniu Miclaus 2024-07-08  1738  	}
df36de13677a0e Antoniu Miclaus 2024-07-08  1739  
df36de13677a0e Antoniu Miclaus 2024-07-08  1740  	desc = irq_get_irq_data(st->irq);
df36de13677a0e Antoniu Miclaus 2024-07-08  1741  	if (!desc)
df36de13677a0e Antoniu Miclaus 2024-07-08  1742  		return dev_err_probe(st->dev, -EINVAL, "Could not find IRQ %d\n", st->irq);
df36de13677a0e Antoniu Miclaus 2024-07-08  1743  
df36de13677a0e Antoniu Miclaus 2024-07-08  1744  	irq_type = irqd_get_trigger_type(desc);
df36de13677a0e Antoniu Miclaus 2024-07-08  1745  	if (irq_type == IRQ_TYPE_LEVEL_HIGH) {
df36de13677a0e Antoniu Miclaus 2024-07-08  1746  		polarity = 0;
df36de13677a0e Antoniu Miclaus 2024-07-08  1747  		irq_flag = IRQF_TRIGGER_HIGH | IRQF_ONESHOT;
df36de13677a0e Antoniu Miclaus 2024-07-08  1748  	} else if (irq_type == IRQ_TYPE_LEVEL_LOW) {
df36de13677a0e Antoniu Miclaus 2024-07-08  1749  		polarity = 1;
df36de13677a0e Antoniu Miclaus 2024-07-08  1750  		irq_flag = IRQF_TRIGGER_LOW | IRQF_ONESHOT;
df36de13677a0e Antoniu Miclaus 2024-07-08  1751  	} else {
df36de13677a0e Antoniu Miclaus 2024-07-08  1752  		return dev_err_probe(st->dev, -EINVAL,
df36de13677a0e Antoniu Miclaus 2024-07-08  1753  				     "Invalid interrupt 0x%x. Only level interrupts supported\n",
df36de13677a0e Antoniu Miclaus 2024-07-08  1754  				     irq_type);
df36de13677a0e Antoniu Miclaus 2024-07-08  1755  	}
df36de13677a0e Antoniu Miclaus 2024-07-08  1756  
df36de13677a0e Antoniu Miclaus 2024-07-08  1757  	ret = regmap_update_bits(st->regmap, ADXL380_INT0_REG,
df36de13677a0e Antoniu Miclaus 2024-07-08  1758  				 ADXL380_INT0_POL_MSK,
df36de13677a0e Antoniu Miclaus 2024-07-08  1759  				 FIELD_PREP(ADXL380_INT0_POL_MSK, polarity));
df36de13677a0e Antoniu Miclaus 2024-07-08  1760  	if (ret)
df36de13677a0e Antoniu Miclaus 2024-07-08  1761  		return ret;
df36de13677a0e Antoniu Miclaus 2024-07-08  1762  
df36de13677a0e Antoniu Miclaus 2024-07-08 @1763  	return devm_request_threaded_irq(st->dev, st->irq, NULL,
df36de13677a0e Antoniu Miclaus 2024-07-08  1764  					 adxl380_irq_handler, irq_flag,
df36de13677a0e Antoniu Miclaus 2024-07-08  1765  					 indio_dev->name, indio_dev);
df36de13677a0e Antoniu Miclaus 2024-07-08  1766  }
df36de13677a0e Antoniu Miclaus 2024-07-08  1767  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
