Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1218A3375A1
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Aug 2025 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755726655; cv=none; b=BQjdLhYBOXTLE/rqKwyUYyuHfGpbTMVlP/dIPv/NkIz3hJODbGtuYHCpKIQksIm8n5QfiYdm3v4eDNraDB6XH90b4l+7v3yNJk5JxqDRnX/Brc6KId+ARSIB3LKB/xK3/iaURhLzrNkOAa8BWCA7BJmyHnbtsf57emC1ANgVFfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755726655; c=relaxed/simple;
	bh=Alw7xCJQ2y3c8muHy+kV5L6q1VS4ClbsssG0EYsG7RA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9PcE2iduNPq1RzzHP2+IuM+sLApvDPImQ3KWd7kD8kKS7p1NVBkSc69KyjMnixNT13n8IiyBxD7Ivm9XAuRaWK3fg/vm98TANMQC6/VsApSeRTdWYS5zOACztEM6WObz9LPOSKrNxpzCvmRmdKWFno/UGrlOJIDfRd6c6/UDRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c40S0KTT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c40S0KTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755726653; x=1787262653;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Alw7xCJQ2y3c8muHy+kV5L6q1VS4ClbsssG0EYsG7RA=;
  b=c40S0KTT07PdlB3dPbU11OD0hyzA3CcZwu63/lhGIxSd7ZsmR3FvSsl2
   y5woRxh86TYLqCm/LDkfmOXe4h+7LQYCKpKplbpX/pttr4CGe7ywVG3cI
   afYMIeNFxPQQx8i/4jIL6LIrdXZKTJrqER6blIj770qzcvM+AZOLuEQ9z
   KNQ2+xv2RKASXdZXLpf6xrEE7LZSIpWe9KZlQJ5Ip95uxqZAfjj95hnEo
   36bSS0iBlidSO1AviJhrxDpa65ngzOA/JQYW2JMtBR0tzHu3d11RQdEH0
   2NRzuHCZCqqkT3ZM3aex7viVKoy240M/GBePnfwNhCrLi8/jzbrwbffEw
   A==;
X-CSE-ConnectionGUID: 9FpA8czDS/OI3e9GwDK1ew==
X-CSE-MsgGUID: q9dvvuTUTGutANNnKOfWeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="45581474"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="45581474"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 14:50:52 -0700
X-CSE-ConnectionGUID: CdT6XalERFGdmasv6dJVaA==
X-CSE-MsgGUID: 3Wzc/wvATmG0/Tn3qzM08g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="169024572"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Aug 2025 14:50:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoqhj-000Jha-00;
	Wed, 20 Aug 2025 21:50:48 +0000
Date: Thu, 21 Aug 2025 05:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/6] Input: mc13783-pwrbutton: convert members to array
Message-ID: <202508210551.VzAtE5re-lkp@intel.com>
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
In-Reply-To: <20250817102751.29709-5-akurz@blala.de>
References: <20250817102751.29709-5-akurz@blala.de>
TO: Alexander Kurz <akurz@blala.de>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Dzmitry Sankouski <dsankouski@gmail.com>
TO: "Dr. David Alan Gilbert" <linux@treblig.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
TO: devicetree@vger.kernel.org
TO: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Alexander Kurz <akurz@blala.de>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes robh/for-next linus/master v6.17-rc2 next-20250820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Kurz/Input-mc13783-pwrbutton-fix-irq-mixup/20250817-182649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250817102751.29709-5-akurz%40blala.de
patch subject: [PATCH 4/6] Input: mc13783-pwrbutton: convert members to array
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20250820 (https://download.01.org/0day-ci/archive/20250821/202508210551.VzAtE5re-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508210551.VzAtE5re-lkp@intel.com/

New smatch warnings:
drivers/input/misc/mc13783-pwrbutton.c:185 mc13783_pwrbutton_probe() error: buffer overflow 'pdata->b_on_key' 3 <= 3

Old smatch warnings:
drivers/input/misc/mc13783-pwrbutton.c:186 mc13783_pwrbutton_probe() error: buffer overflow 'pdata->b_on_key' 3 <= 3
drivers/input/misc/mc13783-pwrbutton.c:187 mc13783_pwrbutton_probe() error: buffer overflow 'pdata->b_on_key' 3 <= 3

vim +185 drivers/input/misc/mc13783-pwrbutton.c

4eeb8abb43c2b7 Alexander Kurz    2025-08-17  107  
5298cc4cc753bb Bill Pemberton    2012-11-23  108  static int mc13783_pwrbutton_probe(struct platform_device *pdev)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  109  {
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  110  	const struct mc13xxx_buttons_platform_data *pdata;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  111  	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
739ba46c8b2ddb Alexander Kurz    2025-08-17  112  	enum mc13xxx_chip_type chip = platform_get_device_id(pdev)->driver_data;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  113  	struct input_dev *pwr;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  114  	struct mc13783_pwrb *priv;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  115  	int err = 0;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  116  	int reg = 0;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  117  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  118  	pdata = dev_get_platdata(&pdev->dev);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  119  	if (!pdata) {
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  120  		dev_err(&pdev->dev, "missing platform data\n");
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  121  		return -ENODEV;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  122  	}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  123  
173a22b931fb1b Alexander Kurz    2025-08-17  124  	pwr = devm_input_allocate_device(&pdev->dev);
173a22b931fb1b Alexander Kurz    2025-08-17  125  	if (!pwr)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  126  		return -ENOMEM;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  127  
173a22b931fb1b Alexander Kurz    2025-08-17  128  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
173a22b931fb1b Alexander Kurz    2025-08-17  129  	if (!priv)
173a22b931fb1b Alexander Kurz    2025-08-17  130  		return -ENOMEM;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  131  
739ba46c8b2ddb Alexander Kurz    2025-08-17  132  	/* ONOFD3 is only supported for MC13783. */
fc0cc88dc308bc Alexander Kurz    2025-08-17  133  	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE &&
739ba46c8b2ddb Alexander Kurz    2025-08-17  134  		chip != MC13XXX_CHIP_TYPE_MC13783)
739ba46c8b2ddb Alexander Kurz    2025-08-17  135  		return -ENODEV;
739ba46c8b2ddb Alexander Kurz    2025-08-17  136  
fc0cc88dc308bc Alexander Kurz    2025-08-17  137  	reg |= (pdata->b_on_flags[0] & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
fc0cc88dc308bc Alexander Kurz    2025-08-17  138  	reg |= (pdata->b_on_flags[1] & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
fc0cc88dc308bc Alexander Kurz    2025-08-17  139  	reg |= (pdata->b_on_flags[2] & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  140  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  141  	priv->pwr = pwr;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  142  	priv->mc13783 = mc13783;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  143  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  144  	mc13xxx_lock(mc13783);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  145  
fc0cc88dc308bc Alexander Kurz    2025-08-17  146  	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE) {
fc0cc88dc308bc Alexander Kurz    2025-08-17  147  		priv->keymap[0] = pdata->b_on_key[0];
fc0cc88dc308bc Alexander Kurz    2025-08-17  148  		if (pdata->b_on_key[0] != KEY_RESERVED)
fc0cc88dc308bc Alexander Kurz    2025-08-17  149  			__set_bit(pdata->b_on_key[0], pwr->keybit);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  150  
fc0cc88dc308bc Alexander Kurz    2025-08-17  151  		if (pdata->b_on_flags[0] & MC13783_BUTTON_POL_INVERT)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  152  			priv->flags |= MC13783_PWRB_B1_POL_INVERT;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  153  
fc0cc88dc308bc Alexander Kurz    2025-08-17  154  		if (pdata->b_on_flags[0] & MC13783_BUTTON_RESET_EN)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  155  			reg |= MC13783_POWER_CONTROL_2_ON1BRSTEN;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  156  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  157  		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD1,
4eeb8abb43c2b7 Alexander Kurz    2025-08-17  158  					  button1_irq, "b1on", priv);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  159  		if (err) {
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  160  			dev_dbg(&pdev->dev, "Can't request irq\n");
173a22b931fb1b Alexander Kurz    2025-08-17  161  			goto free_mc13xxx_lock;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  162  		}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  163  	}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  164  
fc0cc88dc308bc Alexander Kurz    2025-08-17  165  	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE) {
fc0cc88dc308bc Alexander Kurz    2025-08-17  166  		priv->keymap[1] = pdata->b_on_key[1];
fc0cc88dc308bc Alexander Kurz    2025-08-17  167  		if (pdata->b_on_key[1] != KEY_RESERVED)
fc0cc88dc308bc Alexander Kurz    2025-08-17  168  			__set_bit(pdata->b_on_key[1], pwr->keybit);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  169  
fc0cc88dc308bc Alexander Kurz    2025-08-17  170  		if (pdata->b_on_flags[1] & MC13783_BUTTON_POL_INVERT)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  171  			priv->flags |= MC13783_PWRB_B2_POL_INVERT;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  172  
fc0cc88dc308bc Alexander Kurz    2025-08-17  173  		if (pdata->b_on_flags[1] & MC13783_BUTTON_RESET_EN)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  174  			reg |= MC13783_POWER_CONTROL_2_ON2BRSTEN;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  175  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  176  		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD2,
4eeb8abb43c2b7 Alexander Kurz    2025-08-17  177  					  button2_irq, "b2on", priv);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  178  		if (err) {
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  179  			dev_dbg(&pdev->dev, "Can't request irq\n");
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  180  			goto free_irq_b1;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  181  		}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  182  	}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  183  
fc0cc88dc308bc Alexander Kurz    2025-08-17  184  	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE) {
fc0cc88dc308bc Alexander Kurz    2025-08-17 @185  		priv->keymap[2] = pdata->b_on_key[3];
fc0cc88dc308bc Alexander Kurz    2025-08-17  186  		if (pdata->b_on_key[3] != KEY_RESERVED)
fc0cc88dc308bc Alexander Kurz    2025-08-17  187  			__set_bit(pdata->b_on_key[3], pwr->keybit);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  188  
fc0cc88dc308bc Alexander Kurz    2025-08-17  189  		if (pdata->b_on_flags[2] & MC13783_BUTTON_POL_INVERT)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  190  			priv->flags |= MC13783_PWRB_B3_POL_INVERT;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  191  
fc0cc88dc308bc Alexander Kurz    2025-08-17  192  		if (pdata->b_on_flags[2] & MC13783_BUTTON_RESET_EN)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  193  			reg |= MC13783_POWER_CONTROL_2_ON3BRSTEN;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  194  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  195  		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD3,
4eeb8abb43c2b7 Alexander Kurz    2025-08-17  196  					  button3_irq, "b3on", priv);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  197  		if (err) {
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  198  			dev_dbg(&pdev->dev, "Can't request irq: %d\n", err);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  199  			goto free_irq_b2;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  200  		}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  201  	}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  202  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  203  	mc13xxx_reg_rmw(mc13783, MC13783_REG_POWER_CONTROL_2, 0x3FE, reg);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  204  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  205  	mc13xxx_unlock(mc13783);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  206  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  207  	pwr->name = "mc13783_pwrbutton";
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  208  	pwr->phys = "mc13783_pwrbutton/input0";
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  209  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  210  	pwr->keycode = priv->keymap;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  211  	pwr->keycodemax = ARRAY_SIZE(priv->keymap);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  212  	pwr->keycodesize = sizeof(priv->keymap[0]);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  213  	__set_bit(EV_KEY, pwr->evbit);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  214  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  215  	err = input_register_device(pwr);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  216  	if (err) {
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  217  		dev_dbg(&pdev->dev, "Can't register power button: %d\n", err);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  218  		goto free_irq;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  219  	}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  220  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  221  	platform_set_drvdata(pdev, priv);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  222  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  223  	return 0;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  224  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  225  free_irq:
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  226  	mc13xxx_lock(mc13783);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  227  
fc0cc88dc308bc Alexander Kurz    2025-08-17  228  	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  229  		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD3, priv);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  230  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  231  free_irq_b2:
fc0cc88dc308bc Alexander Kurz    2025-08-17  232  	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  233  		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD2, priv);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  234  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  235  free_irq_b1:
fc0cc88dc308bc Alexander Kurz    2025-08-17  236  	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  237  		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD1, priv);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  238  
173a22b931fb1b Alexander Kurz    2025-08-17  239  free_mc13xxx_lock:
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  240  	mc13xxx_unlock(mc13783);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  241  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  242  	return err;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  243  }
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  244  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
