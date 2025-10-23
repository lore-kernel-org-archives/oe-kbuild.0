Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7714301486
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761214852; cv=none; b=XnRzQGSwoTFmkmG7OzDj9GsivWd2zJMnDSUrdZpuMGX+e5/BpPZtVeZEddLAXIRDSUOe/olTduIKmF9It6WO56N//NP1mK6FrEebd+j6few6xVHqDCZmYThcT0QxYUdnDJYgY5jRvw9U5tpNy3G+FTMSj5/9I5GYC6mthYvo+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761214852; c=relaxed/simple;
	bh=hiS+xVNDeU8GExRhxD9OeaVtKf1Q/ua4Ky/W4u9sI9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VdpX1oUz3pzUwUzmN/YtIRD2/pksPNEgJvQzr0jTPepGbFa3lR9AXAvox1m0awejt+rKBIL7gYd8qk90H1xFrCP3DJQ4qM93Y6enXwnCeOe5dGbNXKrmPB5n50fOSddOdU5IdWjrDaXKyLvrBC1kognXKnFY3o0+BD/TJ3lO6H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuT3/+3L; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuT3/+3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761214851; x=1792750851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hiS+xVNDeU8GExRhxD9OeaVtKf1Q/ua4Ky/W4u9sI9U=;
  b=KuT3/+3LvlQVXX7nLxK1yVtPTwZNom4Mve4qTt9oIt5j9UeEZ3B0kgqY
   7MUQufj8YJsIFLIhsg9xotZ6+C/r5fqRAWny6/QyHn0+vrFpCH0GTxowD
   UmFy/Jn9nMKplq5eP5N/p0+9z8CiQpHp5Mtd2lyGO3GH83P68McePvT4V
   UR5Twb0VZl1HA/9YgmvU5eOSD/UAbWJMTPF/TmoX3W0LbldfofRm5wilm
   om34fS3/7l/W+bytBX6WoSRqc4ljQr/iKfDbxiwBhhs1s/Km59MWPg87f
   lJIzhMi1Kdg0MC8k0uRUmn6l745TBwH7oFra4+in1cYv6tul8Dzsbuium
   w==;
X-CSE-ConnectionGUID: GIw7MR9RSDCMzldLO3I6nw==
X-CSE-MsgGUID: fFY1r0dNRfWaPqm9WpF5lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63302553"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63302553"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:20:50 -0700
X-CSE-ConnectionGUID: bGfFOxG+TSO6RqFpixoV0g==
X-CSE-MsgGUID: fZ9Sraj4TieakZMuF7U3AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="221313437"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2025 03:20:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBsR2-000DLX-2E;
	Thu, 23 Oct 2025 10:20:45 +0000
Date: Thu, 23 Oct 2025 18:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/4] leds: Add Virtual Color LED Group driver
Message-ID: <202510231653.3V9E5oxE-lkp@intel.com>
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
In-Reply-To: <20251013120955.227572-5-professorjonny98@gmail.com>
References: <20251013120955.227572-5-professorjonny98@gmail.com>
TO: Jonathan Brophy <professorjonny98@gmail.com>
TO: lee Jones <lee@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: Jonathan Brophy <professor_jonny@hotmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-leds@vger.kernel.org

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/dt-bindings-leds-Add-YAML-bindings-for-Virtual-Color-LED-Group-driver/20251013-201353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251013120955.227572-5-professorjonny98%40gmail.com
patch subject: [PATCH v2 4/4] leds: Add Virtual Color LED Group driver
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251023/202510231653.3V9E5oxE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510231653.3V9E5oxE-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-group-virtualcolor.c:239 leds_virtualcolor_init_vled() warn: 'phandle_count' unsigned <= 0

vim +/phandle_count +239 drivers/leds/rgb/leds-group-virtualcolor.c

793ec9b4ba92eea Jonathan Brophy 2025-10-14  217  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  218  static int leds_virtualcolor_init_vled(struct device *dev, struct device_node *child,
793ec9b4ba92eea Jonathan Brophy 2025-10-14  219  				       struct virtual_led *vled, struct leds_virtualcolor *vc_data)
793ec9b4ba92eea Jonathan Brophy 2025-10-14  220  {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  221  	struct led_init_data init_data = {};
793ec9b4ba92eea Jonathan Brophy 2025-10-14  222  	u32 blink_interval;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  223  	u32 phandle_count;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  224  	u32 max_brightness;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  225  	int ret;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  226  	int i;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  227  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  228  	ret = of_property_read_u32(child, "priority", &vled->priority);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  229  	if (ret)
793ec9b4ba92eea Jonathan Brophy 2025-10-14  230  		vled->priority = 0;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  231  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  232  	ret = of_property_read_u32(child, "blink", &blink_interval);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  233  	if (!ret) {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  234  		vled->blink_delay_on = blink_interval;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  235  		vled->blink_delay_off = blink_interval;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  236  	}
793ec9b4ba92eea Jonathan Brophy 2025-10-14  237  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  238  	phandle_count = of_property_count_elems_of_size(child, "leds", sizeof(u32));
793ec9b4ba92eea Jonathan Brophy 2025-10-14 @239  	if (phandle_count <= 0) {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  240  		dev_err(dev, "No monochromatic LEDs specified for virtual LED %s\n",
793ec9b4ba92eea Jonathan Brophy 2025-10-14  241  			vled->cdev.name);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  242  		return -EINVAL;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  243  	}
793ec9b4ba92eea Jonathan Brophy 2025-10-14  244  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  245  	vled->num_monochromatics = phandle_count;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  246  	vled->monochromatics = devm_kcalloc(dev, vled->num_monochromatics,
793ec9b4ba92eea Jonathan Brophy 2025-10-14  247  					    sizeof(*vled->monochromatics), GFP_KERNEL);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  248  	if (!vled->monochromatics)
793ec9b4ba92eea Jonathan Brophy 2025-10-14  249  		return -ENOMEM;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  250  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  251  	for (i = 0; i < vled->num_monochromatics; i++) {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  252  		struct led_classdev *led_cdev;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  253  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  254  		led_cdev = devm_of_led_get_optional(dev, i);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  255  		if (IS_ERR(led_cdev)) {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  256  			/*
793ec9b4ba92eea Jonathan Brophy 2025-10-14  257  			 * If the LED is not available yet, defer the probe.
793ec9b4ba92eea Jonathan Brophy 2025-10-14  258  			 * The probe will be retried when it becomes available.
793ec9b4ba92eea Jonathan Brophy 2025-10-14  259  			 */
793ec9b4ba92eea Jonathan Brophy 2025-10-14  260  			if (PTR_ERR(led_cdev) == -EPROBE_DEFER)
793ec9b4ba92eea Jonathan Brophy 2025-10-14  261  				return -EPROBE_DEFER;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  262  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  263  			ret = PTR_ERR(led_cdev);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  264  			dev_err(dev, "Failed to get monochromatic LED for %s, error %d\n",
793ec9b4ba92eea Jonathan Brophy 2025-10-14  265  				vled->cdev.name, ret);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  266  			return ret;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  267  		}
793ec9b4ba92eea Jonathan Brophy 2025-10-14  268  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  269  		vled->monochromatics[i] = led_cdev;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  270  	}
793ec9b4ba92eea Jonathan Brophy 2025-10-14  271  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  272  	ret = of_property_read_u32(child, "max-brightness", &max_brightness);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  273  	if (ret)
793ec9b4ba92eea Jonathan Brophy 2025-10-14  274  		vled->cdev.max_brightness = LED_FULL;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  275  	else
793ec9b4ba92eea Jonathan Brophy 2025-10-14  276  		vled->cdev.max_brightness = max_brightness;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  277  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  278  	vled->cdev.brightness_set_blocking = virtual_led_brightness_set;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  279  	vled->cdev.flags = LED_CORE_SUSPENDRESUME;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  280  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  281  	init_data.fwnode = NULL; // Use OF, not fwnode
793ec9b4ba92eea Jonathan Brophy 2025-10-14  282  	ret = devm_led_classdev_register_ext(dev, &vled->cdev, &init_data);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  283  	if (ret) {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  284  		dev_err(dev, "Failed to register virtual LED %s\n", vled->cdev.name);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  285  		return ret;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  286  	}
793ec9b4ba92eea Jonathan Brophy 2025-10-14  287  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  288  	ret = device_create_file(vled->cdev.dev, &dev_attr_priority);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  289  	if (ret) {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  290  		dev_err(dev, "Failed to create sysfs attribute for priority\n");
793ec9b4ba92eea Jonathan Brophy 2025-10-14  291  		return ret;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  292  	}
793ec9b4ba92eea Jonathan Brophy 2025-10-14  293  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  294  	ret = device_create_file(vled->cdev.dev, &dev_attr_blink_delay_on);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  295  	if (ret) {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  296  		dev_err(dev, "Failed to create sysfs attribute for blink_delay_on\n");
793ec9b4ba92eea Jonathan Brophy 2025-10-14  297  		return ret;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  298  	}
793ec9b4ba92eea Jonathan Brophy 2025-10-14  299  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  300  	ret = device_create_file(vled->cdev.dev, &dev_attr_blink_delay_off);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  301  	if (ret) {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  302  		dev_err(dev, "Failed to create sysfs attribute for blink_delay_off\n");
793ec9b4ba92eea Jonathan Brophy 2025-10-14  303  		return ret;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  304  	}
793ec9b4ba92eea Jonathan Brophy 2025-10-14  305  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  306  	vled->vc_data = vc_data;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  307  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  308  	return 0;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  309  }
793ec9b4ba92eea Jonathan Brophy 2025-10-14  310  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
