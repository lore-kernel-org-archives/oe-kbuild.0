Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CEE2B2CF
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734905563; cv=none; b=LL/QKW8VTotFauP1JQY88Vo2I4hnNjrxzXvGmcymgGLGWm4XiMpGEkuoLeooxUcoGhg71rquKeB0eohIt/OPmpKgymVWUZTNB1K2dAR3omHarRnOorYgSu8x//C/qox4HAp42V1AB7SuRmpeZa8QtZu+05/nWJ7fAgrCK1TvNeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734905563; c=relaxed/simple;
	bh=p/+T4Hw7mymsiZ0tuKLqtgs9m2lHnLWwkICa/+XsDSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NkdHLGX0uC0WlDQKtTyzg/lvLc2se5KdAuVo851AGt0Pft8jlZvyW5YvkBqm9H2X04Dyeq16MNfphy/nYWlbeOY7Rc80/4y5PkcM8kv4pJLFN0Hg2zHea2EDKOSajriRs3ZbJYYKPLUG2XfpXTa33L2lhDaK5I3sH1PmQo8kUug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeOcbJQq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeOcbJQq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734905561; x=1766441561;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p/+T4Hw7mymsiZ0tuKLqtgs9m2lHnLWwkICa/+XsDSE=;
  b=MeOcbJQqbJtWV4gxQC3IG1Nb/GQFQsIJEiPcohXljnmgAxMuemhrOvjw
   CSbOQAWoCwQCHUPk1KQOXX7u0ZdGSHmekd3M2wewF2iXbY7StnegYpOoG
   iOFZG1Cu4dp5pWMOd1ZiDvpQvu7fCf6ZHFnu0XrBxUDajhFGekoi72Xz8
   YX2XA06Rqh1i5Xwu3/5FovkuqU3aH9Wvq/lhw+a/0VxNe67W8oyjGlbEB
   6zAKM+VJ1JC48BAvcJgdKpzo4lGJRy1/1Hgq9K2noehGSfkdwTNUg8bks
   NODhH78Aqw0DCbZhjf4bOYlFlZtEPP6u6M75nw/mrlzsPnu+OFPNsu6Od
   A==;
X-CSE-ConnectionGUID: Un770oBeSj+NUDbp4RcwTQ==
X-CSE-MsgGUID: +u6Jb8I3T6y+R2lgAP0cIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="45976929"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="45976929"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 14:12:40 -0800
X-CSE-ConnectionGUID: QDKVFcNPQ2Gn/MK/bdaPIA==
X-CSE-MsgGUID: zqPGCChwSEi9HYvS8Y2L1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="98909642"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Dec 2024 14:12:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPUBh-0003Cl-12;
	Sun, 22 Dec 2024 22:12:37 +0000
Date: Mon, 23 Dec 2024 06:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/8] gpio: max7360: Add MAX7360 gpio support
Message-ID: <202412230526.xbsyoRYK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241219-mdb-max7360-support-v1-5-8e8317584121@bootlin.com>
References: <20241219-mdb-max7360-support-v1-5-8e8317584121@bootlin.com>
TO: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Kamel Bouhara <kamel.bouhara@bootlin.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: "Uwe Kleine-König" <ukleinek@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-input@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: "Grégory Clement" <gregory.clement@bootlin.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>

Hi Mathieu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Dubois-Briand/dt-bindings-Add-MAX7360-MFD-device/20241220-002541
base:   78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
patch link:    https://lore.kernel.org/r/20241219-mdb-max7360-support-v1-5-8e8317584121%40bootlin.com
patch subject: [PATCH 5/8] gpio: max7360: Add MAX7360 gpio support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-r071-20241222 (https://download.01.org/0day-ci/archive/20241223/202412230526.xbsyoRYK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412230526.xbsyoRYK-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-max7360.c:56 max7360_gpio_set_value() error: uninitialized symbol 'val'.
drivers/gpio/gpio-max7360.c:388 max7360_gpio_probe() warn: inconsistent indenting

vim +/val +56 drivers/gpio/gpio-max7360.c

19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  37  
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  38  static void max7360_gpio_set_value(struct gpio_chip *gc,
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  39  				   unsigned int pin, int state)
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  40  {
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  41  	struct max7360_gpio *max7360_gpio = gpiochip_get_data(gc);
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  42  	unsigned int val;
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  43  	int ret;
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  44  
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  45  	if (max7360_gpio->gpio_function == MAX7360_GPIO_COL) {
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  46  		int off = MAX7360_MAX_GPIO - (gc->ngpio - pin);
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  47  
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  48  		ret = regmap_write_bits(max7360_gpio->regmap, MAX7360_REG_PORTS,
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  49  					BIT(off), state ? BIT(off) : 0);
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  50  	} else {
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  51  		ret = regmap_write(max7360_gpio->regmap,
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  52  				   MAX7360_REG_PWMBASE + pin, state ? 0xFF : 0);
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  53  	}
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  54  
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  55  	if (ret)
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19 @56  		dev_err(max7360_gpio->dev,
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  57  			"failed to set value %d on gpio-%d", val, pin);
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  58  }
19f89f1d3446db Mathieu Dubois-Briand 2024-12-19  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
