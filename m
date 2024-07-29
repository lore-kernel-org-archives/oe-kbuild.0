Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA681154C0A
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jul 2024 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722266275; cv=none; b=aLK+uveVllIPo0jUIWNQu5L+w0cOcaIEwCCmhOcqQnlzGk0TJs6D8QQtB2FyLqNOhXwS06NaKdBwl1w2eqJAaKKz119P3jNN3jkT3AIDZMipDvu2/0FgaE2gW+PvxRPeoW1jBXfDteOrj/H3c7EU9qtHzMqPPX/1mX4iYcqZeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722266275; c=relaxed/simple;
	bh=X6NYJ8qt9PlsRlziKFIoreMyoBb7CAyGT1ymoVLe04U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXez+unpWX5DRDqzNuWbESSt2N0Dh7KGewrHUIXKDzbWmNuhajBvI7M94H4Jt0eDFLtK4R2jkx0AzuFQA8sH2IXyZQFnG92pirYzk8l+TsHGx4ZLEfJz6I2EADOuLCl1qI8H2szKfofVy6LgS8g3fpOnkbhHoapGk9YbJgwqoj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTfQhgS8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTfQhgS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722266274; x=1753802274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X6NYJ8qt9PlsRlziKFIoreMyoBb7CAyGT1ymoVLe04U=;
  b=aTfQhgS8JL/EJ5D0ITMvGKb7dq3bAGZz6qXBSiO9nxEaw6T6C3nlEMlr
   lWcvCk0cipYmEdm9CYPPW05aOXhZl6cwaC3RJYB3USZm5UGzYhMoZiBlu
   RxbUiyw69h4pRBWZUBGunwoDV/Fi6p/pCc0fd/V5qQUiwOx396xy05sLG
   bFvYqyRQdNaNlW7mK3Nuq8hBtrWsfRYKnbKe2hdr8BFCfkcKdnTmzcA8T
   zZ53YE5EvAcU4FwjRruo0ZFStbKPNnSV8j91JVJRACe7MPXVtLn4LaDXj
   6OgfB9Z1gpxn3/nMNKvmHp+3/y1zBTWPpoN/4D8ipk7Hopgyjr3A2eSTU
   w==;
X-CSE-ConnectionGUID: n+469CR+Qzuu6P/QYuLccQ==
X-CSE-MsgGUID: 1i6LDLqyQbG0szD9dOh1ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37535649"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="37535649"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 08:17:53 -0700
X-CSE-ConnectionGUID: pugUzVoST3aKI25/bvE0WA==
X-CSE-MsgGUID: nUl9MO6/Rh6VVCcc8nijsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="84648480"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jul 2024 08:17:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYS8D-000rnx-0o;
	Mon, 29 Jul 2024 15:17:49 +0000
Date: Mon, 29 Jul 2024 23:17:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jic23-iio:testing 81/170] drivers/iio/accel/adxl380.c:1763:8-33:
 WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
 (unless it is nested IRQ)
Message-ID: <202407292305.jhqtAUOj-lkp@intel.com>
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
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Ramona Gradinariu <ramona.gradinariu@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   2ef3f47cfc51f2629d4587814f4c8adcf26e6853
commit: c8f527ed6f92011d4f2891ed11e9d0819c30aae6 [81/170] iio: accel: add ADXL380 driver
:::::: branch date: 26 hours ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r063-20240729 (https://download.01.org/0day-ci/archive/20240729/202407292305.jhqtAUOj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202407292305.jhqtAUOj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/accel/adxl380.c:1763:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +1763 drivers/iio/accel/adxl380.c

c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1717  
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1718  static int adxl380_config_irq(struct iio_dev *indio_dev)
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1719  {
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1720  	struct adxl380_state *st = iio_priv(indio_dev);
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1721  	unsigned long irq_flag;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1722  	struct irq_data *desc;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1723  	u32 irq_type;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1724  	u8 polarity;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1725  	int ret;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1726  
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1727  	st->irq = fwnode_irq_get_byname(dev_fwnode(st->dev), "INT0");
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1728  	if (st->irq > 0) {
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1729  		st->int_map[0] = ADXL380_INT0_MAP0_REG;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1730  		st->int_map[1] = ADXL380_INT0_MAP1_REG;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1731  	} else {
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1732  		st->irq = fwnode_irq_get_byname(dev_fwnode(st->dev), "INT1");
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1733  		if (st->irq > 0)
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1734  			return dev_err_probe(st->dev, -ENODEV,
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1735  					     "no interrupt name specified");
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1736  		st->int_map[0] = ADXL380_INT1_MAP0_REG;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1737  		st->int_map[1] = ADXL380_INT1_MAP1_REG;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1738  	}
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1739  
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1740  	desc = irq_get_irq_data(st->irq);
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1741  	if (!desc)
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1742  		return dev_err_probe(st->dev, -EINVAL, "Could not find IRQ %d\n", st->irq);
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1743  
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1744  	irq_type = irqd_get_trigger_type(desc);
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1745  	if (irq_type == IRQ_TYPE_LEVEL_HIGH) {
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1746  		polarity = 0;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1747  		irq_flag = IRQF_TRIGGER_HIGH | IRQF_ONESHOT;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1748  	} else if (irq_type == IRQ_TYPE_LEVEL_LOW) {
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1749  		polarity = 1;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1750  		irq_flag = IRQF_TRIGGER_LOW | IRQF_ONESHOT;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1751  	} else {
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1752  		return dev_err_probe(st->dev, -EINVAL,
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1753  				     "Invalid interrupt 0x%x. Only level interrupts supported\n",
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1754  				     irq_type);
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1755  	}
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1756  
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1757  	ret = regmap_update_bits(st->regmap, ADXL380_INT0_REG,
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1758  				 ADXL380_INT0_POL_MSK,
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1759  				 FIELD_PREP(ADXL380_INT0_POL_MSK, polarity));
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1760  	if (ret)
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1761  		return ret;
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1762  
c8f527ed6f9201 Antoniu Miclaus 2024-07-08 @1763  	return devm_request_threaded_irq(st->dev, st->irq, NULL,
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1764  					 adxl380_irq_handler, irq_flag,
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1765  					 indio_dev->name, indio_dev);
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1766  }
c8f527ed6f9201 Antoniu Miclaus 2024-07-08  1767  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
