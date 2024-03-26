Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283711CAAE
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 22:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491910; cv=none; b=g99mfzszG8MTMVc8Qt+7RW8XT+t2aqtz4tYrcmc8bZdaHZPJ+QfRyuMPy1heAwSeDpg6+FZb3OFFSQvwRgkbgYHWo2UgLQ0UgcPHy4qra3C/DNTlNKW97vZxLVBuoQycFjAW1F8neDrY31ijuKxvZUp9spDMElshINtFcIYp+AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491910; c=relaxed/simple;
	bh=WnJE3uP/rTDr67mn4/xW7TncVxbPt1/kSEZENGKHrsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hxRYOT6gNyLurGlCLq0OBNhZ4CFiOmZdtVR0ZRTphCmll9HBZ/cYy1vBToqReo96p2f0zvUiAsGPzMvlSABei503t0T56dW+l/xnREvKukyBt5YoadtOjSlp7i4Lz1HcuRdef49mbnFIarq44hL6YlWX4cnLUYxGd2lWdOm7ZvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cN5wx18Y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cN5wx18Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711491908; x=1743027908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WnJE3uP/rTDr67mn4/xW7TncVxbPt1/kSEZENGKHrsw=;
  b=cN5wx18Y5WAHNSkuLnYlT6Pi+eY35Ra4ZhJSe0mMV5Vv9d72WWDhsWXs
   CDJWZNBG8DJ8TCd3NCW6m0TSnkKbSrKdtfWkJ2MpHGCQhzivXxV8LuqaT
   5Imwz9JLCB4cCUR+owLhEbs5wQcY4FH5EY5uM0oOet4UyqRMxftm3UJ4M
   LgM9CEGEhzwS1/ieQr6YeqnOCHvFbwMujpKh+Lkoi15lpRQHXc81iCVoV
   nKL+yc81QpidZZc+TjUan6NgGI1oIqhPFfosn/UeEEheUDiT7XKCQCzmu
   Xmqw8x9OHQKSCuMokIi4rv1yPP+rc9p2p9svBsnYCa9XribO2v835dGrn
   Q==;
X-CSE-ConnectionGUID: qtD1CwtLT/W/PWzH3JMhQA==
X-CSE-MsgGUID: kN10PqmfSvuqVyHvuKJLGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17114576"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="17114576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 15:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20747829"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2024 15:25:03 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpFE4-0000Tm-30;
	Tue, 26 Mar 2024 22:25:00 +0000
Date: Wed, 27 Mar 2024 06:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [opencloudos:next 4551/4624]
 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:398:2-4: WARNING: possible
 condition with no effect (if == else)
Message-ID: <202403270629.YTbah9F0-lkp@intel.com>
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
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   52ae166cfe3d5af2e826d4bc7f68dd3f4b1bf410
commit: 8dbc23037c4680d1ddda68ae70ad6cd2975e6f91 [4551/4624] Add support Zhaoxin GPIO pinctrl
:::::: branch date: 21 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-102-20240327 (https://download.01.org/0day-ci/archive/20240327/202403270629.YTbah9F0-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403270629.YTbah9F0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:398:2-4: WARNING: possible condition with no effect (if == else)

vim +398 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c

8dbc23037c4680 leoliu-oc 2024-02-05  359  
8dbc23037c4680 leoliu-oc 2024-02-05  360  static void zhaoxin_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
8dbc23037c4680 leoliu-oc 2024-02-05  361  {
8dbc23037c4680 leoliu-oc 2024-02-05  362  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
8dbc23037c4680 leoliu-oc 2024-02-05  363  	struct zhaoxin_pinctrl *pctrl = gpiochip_get_data(gc);
8dbc23037c4680 leoliu-oc 2024-02-05  364  	const struct reg_calibrate *int_cal;
8dbc23037c4680 leoliu-oc 2024-02-05  365  	const struct reg_calibrate *mod_sel_cal;
8dbc23037c4680 leoliu-oc 2024-02-05  366  	int gpio = irqd_to_hwirq(d);
8dbc23037c4680 leoliu-oc 2024-02-05  367  	int i, j;
8dbc23037c4680 leoliu-oc 2024-02-05  368  	int offset = 0;
8dbc23037c4680 leoliu-oc 2024-02-05  369  	int base_offset = 0;
8dbc23037c4680 leoliu-oc 2024-02-05  370  	const struct reg_cal_array *reg_off, *mod;
8dbc23037c4680 leoliu-oc 2024-02-05  371  	int bit_off = 0;
8dbc23037c4680 leoliu-oc 2024-02-05  372  	u16 value;
8dbc23037c4680 leoliu-oc 2024-02-05  373  	u16 value1;
8dbc23037c4680 leoliu-oc 2024-02-05  374  
8dbc23037c4680 leoliu-oc 2024-02-05  375  	int_cal = pctrl->pin_topologys->int_cal;
8dbc23037c4680 leoliu-oc 2024-02-05  376  	mod_sel_cal = pctrl->pin_topologys->mod_sel_cal;
8dbc23037c4680 leoliu-oc 2024-02-05  377  
8dbc23037c4680 leoliu-oc 2024-02-05  378  	if (gpio >= 0) {
8dbc23037c4680 leoliu-oc 2024-02-05  379  		for (i = 0; i < int_cal->size; i++)
8dbc23037c4680 leoliu-oc 2024-02-05  380  			if (gpio == int_cal->cal_array[i])
8dbc23037c4680 leoliu-oc 2024-02-05  381  				break;
8dbc23037c4680 leoliu-oc 2024-02-05  382  		for (j = 0; j < int_cal->reg_cal_size; j++) {
8dbc23037c4680 leoliu-oc 2024-02-05  383  			if (offset > i)
8dbc23037c4680 leoliu-oc 2024-02-05  384  				break;
8dbc23037c4680 leoliu-oc 2024-02-05  385  			offset += int_cal->reg[j].size;
8dbc23037c4680 leoliu-oc 2024-02-05  386  		}
8dbc23037c4680 leoliu-oc 2024-02-05  387  		reg_off = &(int_cal->reg[j-1]);
8dbc23037c4680 leoliu-oc 2024-02-05  388  		mod = &(mod_sel_cal->reg[j-1]);
8dbc23037c4680 leoliu-oc 2024-02-05  389  		bit_off = i-(offset-reg_off->size);
8dbc23037c4680 leoliu-oc 2024-02-05  390  		base_offset = reg_off->pmio_offset;
8dbc23037c4680 leoliu-oc 2024-02-05  391  		value = inw(pctrl->pmio_base+reg_off->pmio_offset);
8dbc23037c4680 leoliu-oc 2024-02-05  392  		if (mask)
8dbc23037c4680 leoliu-oc 2024-02-05  393  			value &= (~(1<<bit_off));
8dbc23037c4680 leoliu-oc 2024-02-05  394  		else
8dbc23037c4680 leoliu-oc 2024-02-05  395  			value |= (1<<bit_off);
8dbc23037c4680 leoliu-oc 2024-02-05  396  
8dbc23037c4680 leoliu-oc 2024-02-05  397  		outw(value, pctrl->pmio_base+reg_off->pmio_offset);
8dbc23037c4680 leoliu-oc 2024-02-05 @398  		if (mask) {
8dbc23037c4680 leoliu-oc 2024-02-05  399  			value1 = readw(pctrl->pm_pmio_base+mod->pmio_offset);
8dbc23037c4680 leoliu-oc 2024-02-05  400  			value1 |= (1<<bit_off);
8dbc23037c4680 leoliu-oc 2024-02-05  401  			writew(value1, pctrl->pm_pmio_base+mod->pmio_offset);
8dbc23037c4680 leoliu-oc 2024-02-05  402  		} else {
8dbc23037c4680 leoliu-oc 2024-02-05  403  			value1 = readw(pctrl->pm_pmio_base+mod->pmio_offset);
8dbc23037c4680 leoliu-oc 2024-02-05  404  			value1 |= (1<<bit_off);
8dbc23037c4680 leoliu-oc 2024-02-05  405  			writew(value1, pctrl->pm_pmio_base+mod->pmio_offset);
8dbc23037c4680 leoliu-oc 2024-02-05  406  		}
8dbc23037c4680 leoliu-oc 2024-02-05  407  	}
8dbc23037c4680 leoliu-oc 2024-02-05  408  }
8dbc23037c4680 leoliu-oc 2024-02-05  409  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
