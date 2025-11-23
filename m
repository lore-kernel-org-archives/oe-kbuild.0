Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7990772627
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 02:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763863410; cv=none; b=sCY/y1LrIQf4eDmUkfnFRxPGz/8sL8GZTzA4qMYSDTXTrArT+9cyf5Bjg8HWkI+yO5EXqPBaXBot7nXbsST20z/6kUE0cSLz1XlAsUobl4qB+cByECdQrs1YTl83t2xnk3M6JAgIzhtZeBJuIhibHiL8S9+48kEK5NJAUa0DNts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763863410; c=relaxed/simple;
	bh=Il+ONZp/rxzig3b1yI5B34GCRp6BOIuj/pUjHbGQX7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ddC6cDVyK6nHFlHiOdiJCAntmb94x4dKzRF3/J1SpztaLwnPO3Hw4MiEmGCTQXYlo77U9Dq3npQWIMceLMAkoJsP26XW7bVYumDCDXnLzEk1i3DNhR7tWpD1byDS6FYoCcvgb08NHMMe3fpGZUY8Z5lTOb3yp7gYCTzrmnqBHE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxF1ctQL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxF1ctQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763863408; x=1795399408;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Il+ONZp/rxzig3b1yI5B34GCRp6BOIuj/pUjHbGQX7w=;
  b=WxF1ctQLv2arJOQfBsSj5wU8o0O84k4XxBPstasbD9AvrHfur4BV+lVh
   CXMS3w0ylfPD5gt2m2FMtjE4PY0sdNDy1pw+aXy0fSXTIsSlL2TBRoVO4
   qiQkHFunTj+aiI+na1GHpglSTcKV5CWdHst58gH7OQv4j29dxTHh6wK/U
   ESibe5j+GkLHIQo9/dc/CzvSv6k1iE2ik/5ZJqtySdMC3+K8jO3rA2+mo
   mqcOM7U7GDHudT5xKDn2NSZYKBnrZt3jQLJEcBEFl12u4o3vPC6h5DEsR
   Oh1IfKjExycJPcoTFfTrBFwbbprrYzmfXdE58cujRvqauSK9gxFKSI+YZ
   Q==;
X-CSE-ConnectionGUID: 5kwR02jrQiGgo1IBOtn5fA==
X-CSE-MsgGUID: ax077AXGSRu1/SlZ98wEIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69774601"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="69774601"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 18:03:27 -0800
X-CSE-ConnectionGUID: D/iEISg7TbO0Rc4DNTrKtQ==
X-CSE-MsgGUID: ZaGj2UNaRmaZ6D7j0Z7RmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192042546"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2025 18:03:25 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMzRi-0007z7-3A;
	Sun, 23 Nov 2025 02:03:22 +0000
Date: Sun, 23 Nov 2025 10:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 27/49]
 drivers/platform/x86/asus-armoury.c:200 armoury_set_devstate() error:
 uninitialized symbol 'result'.
Message-ID: <202511231021.U7HIKvbq-lkp@intel.com>
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
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
TO: "Luke D. Jones" <luke@ljones.dev>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Denis Benato <denis.benato@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   2643187ccb8628144246ee9d44da5e3ac428f9c3
commit: f99eb098090e4c8bfca4190b545e20450fee8250 [27/49] platform/x86: asus-armoury: move existing tunings to asus-armoury module
:::::: branch date: 34 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-141-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231021.U7HIKvbq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511231021.U7HIKvbq-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/asus-armoury.c:200 armoury_set_devstate() error: uninitialized symbol 'result'.
drivers/platform/x86/asus-armoury.c:358 mini_led_mode_current_value_store() warn: potential spectre issue 'mini_led_mode_map' [r] (local cap)
drivers/platform/x86/asus-armoury.c:496 egpu_enable_current_value_store() warn: potential spectre issue 'egpu_status_map' [r] (local cap)
drivers/platform/x86/asus-armoury.c:500 egpu_enable_current_value_store() warn: possible spectre second half.  'enable'

Old smatch warnings:
drivers/platform/x86/asus-armoury.c:316 mini_led_mode_current_value_show() warn: iterator 'i' not incremented

vim +/result +200 drivers/platform/x86/asus-armoury.c

f99eb098090e4c8 Luke D. Jones 2025-11-02  157  
f99eb098090e4c8 Luke D. Jones 2025-11-02  158  /**
f99eb098090e4c8 Luke D. Jones 2025-11-02  159   * armoury_set_devstate() - Set the WMI function state.
f99eb098090e4c8 Luke D. Jones 2025-11-02  160   * @attr: The kobj_attribute associated to called WMI function.
f99eb098090e4c8 Luke D. Jones 2025-11-02  161   * @dev_id: The WMI method ID to call.
f99eb098090e4c8 Luke D. Jones 2025-11-02  162   * @value: The new value to be set.
f99eb098090e4c8 Luke D. Jones 2025-11-02  163   * @retval: Where to store the value returned from WMI or NULL.
f99eb098090e4c8 Luke D. Jones 2025-11-02  164   *
f99eb098090e4c8 Luke D. Jones 2025-11-02  165   * Intended usage is from sysfs attribute setting associated WMI function.
f99eb098090e4c8 Luke D. Jones 2025-11-02  166   * Before calling the presence of the function should be checked.
f99eb098090e4c8 Luke D. Jones 2025-11-02  167   *
f99eb098090e4c8 Luke D. Jones 2025-11-02  168   * Every WMI write MUST go through this function to enforce safety checks.
f99eb098090e4c8 Luke D. Jones 2025-11-02  169   *
f99eb098090e4c8 Luke D. Jones 2025-11-02  170   * Results !1 is usually considered a fail by ASUS, but some WMI methods
f99eb098090e4c8 Luke D. Jones 2025-11-02  171   * (like eGPU or CPU cores) do use > 1 to return a status code or similar:
f99eb098090e4c8 Luke D. Jones 2025-11-02  172   * in these cases caller is interested in the actual return value
f99eb098090e4c8 Luke D. Jones 2025-11-02  173   * and should perform relevant checks.
f99eb098090e4c8 Luke D. Jones 2025-11-02  174   *
f99eb098090e4c8 Luke D. Jones 2025-11-02  175   * Returns:
f99eb098090e4c8 Luke D. Jones 2025-11-02  176   * * %-EIO	- WMI function returned an error.
f99eb098090e4c8 Luke D. Jones 2025-11-02  177   * * %0		- successful and retval is filled.
f99eb098090e4c8 Luke D. Jones 2025-11-02  178   * * %other	- error from WMI call.
f99eb098090e4c8 Luke D. Jones 2025-11-02  179   */
f99eb098090e4c8 Luke D. Jones 2025-11-02  180  static int armoury_set_devstate(struct kobj_attribute *attr,
f99eb098090e4c8 Luke D. Jones 2025-11-02  181  				     u32 value, u32 *retval, u32 dev_id)
f99eb098090e4c8 Luke D. Jones 2025-11-02  182  {
f99eb098090e4c8 Luke D. Jones 2025-11-02  183  	u32 result;
f99eb098090e4c8 Luke D. Jones 2025-11-02  184  	int err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  185  
f99eb098090e4c8 Luke D. Jones 2025-11-02  186  	err = asus_wmi_set_devstate(dev_id, value, retval ? retval : &result);
f99eb098090e4c8 Luke D. Jones 2025-11-02  187  	if (err) {
f99eb098090e4c8 Luke D. Jones 2025-11-02  188  		if (attr)
f99eb098090e4c8 Luke D. Jones 2025-11-02  189  			pr_err("Failed to set %s: %d\n", attr->attr.name, err);
f99eb098090e4c8 Luke D. Jones 2025-11-02  190  		else
f99eb098090e4c8 Luke D. Jones 2025-11-02  191  			pr_err("Failed to set devstate for 0x%x: %d\n", dev_id, err);
f99eb098090e4c8 Luke D. Jones 2025-11-02  192  
f99eb098090e4c8 Luke D. Jones 2025-11-02  193  		return err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  194  	}
f99eb098090e4c8 Luke D. Jones 2025-11-02  195  
f99eb098090e4c8 Luke D. Jones 2025-11-02  196  	/*
f99eb098090e4c8 Luke D. Jones 2025-11-02  197  	 * If retval == NULL caller is uninterested in return value:
f99eb098090e4c8 Luke D. Jones 2025-11-02  198  	 * perform the most common result check here.
f99eb098090e4c8 Luke D. Jones 2025-11-02  199  	 */
f99eb098090e4c8 Luke D. Jones 2025-11-02 @200  	if ((retval == NULL) && (result == 0)) {
f99eb098090e4c8 Luke D. Jones 2025-11-02  201  		pr_err("Failed to set %s: (result): 0x%x\n", attr->attr.name, result);
f99eb098090e4c8 Luke D. Jones 2025-11-02  202  		return -EIO;
f99eb098090e4c8 Luke D. Jones 2025-11-02  203  	}
f99eb098090e4c8 Luke D. Jones 2025-11-02  204  
f99eb098090e4c8 Luke D. Jones 2025-11-02  205  	return 0;
f99eb098090e4c8 Luke D. Jones 2025-11-02  206  }
f99eb098090e4c8 Luke D. Jones 2025-11-02  207  
f99eb098090e4c8 Luke D. Jones 2025-11-02  208  static int armoury_attr_enum_list(char *buf, size_t enum_values)
f99eb098090e4c8 Luke D. Jones 2025-11-02  209  {
f99eb098090e4c8 Luke D. Jones 2025-11-02  210  	size_t i;
f99eb098090e4c8 Luke D. Jones 2025-11-02  211  	int len = 0;
f99eb098090e4c8 Luke D. Jones 2025-11-02  212  
f99eb098090e4c8 Luke D. Jones 2025-11-02  213  	for (i = 0; i < enum_values; i++) {
f99eb098090e4c8 Luke D. Jones 2025-11-02  214  		if (i == 0)
f99eb098090e4c8 Luke D. Jones 2025-11-02  215  			len += sysfs_emit_at(buf, len, "%zu", i);
f99eb098090e4c8 Luke D. Jones 2025-11-02  216  		else
f99eb098090e4c8 Luke D. Jones 2025-11-02  217  			len += sysfs_emit_at(buf, len, ";%zu", i);
f99eb098090e4c8 Luke D. Jones 2025-11-02  218  	}
f99eb098090e4c8 Luke D. Jones 2025-11-02  219  	len += sysfs_emit_at(buf, len, "\n");
f99eb098090e4c8 Luke D. Jones 2025-11-02  220  
f99eb098090e4c8 Luke D. Jones 2025-11-02  221  	return len;
f99eb098090e4c8 Luke D. Jones 2025-11-02  222  }
f99eb098090e4c8 Luke D. Jones 2025-11-02  223  
f99eb098090e4c8 Luke D. Jones 2025-11-02  224  ssize_t armoury_attr_uint_store(struct kobject *kobj, struct kobj_attribute *attr,
f99eb098090e4c8 Luke D. Jones 2025-11-02  225  				const char *buf, size_t count, u32 min, u32 max,
f99eb098090e4c8 Luke D. Jones 2025-11-02  226  				u32 *store_value, u32 wmi_dev)
f99eb098090e4c8 Luke D. Jones 2025-11-02  227  {
f99eb098090e4c8 Luke D. Jones 2025-11-02  228  	u32 value;
f99eb098090e4c8 Luke D. Jones 2025-11-02  229  	int err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  230  
f99eb098090e4c8 Luke D. Jones 2025-11-02  231  	err = kstrtou32(buf, 10, &value);
f99eb098090e4c8 Luke D. Jones 2025-11-02  232  	if (err)
f99eb098090e4c8 Luke D. Jones 2025-11-02  233  		return err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  234  
f99eb098090e4c8 Luke D. Jones 2025-11-02  235  	if (value < min || value > max)
f99eb098090e4c8 Luke D. Jones 2025-11-02  236  		return -EINVAL;
f99eb098090e4c8 Luke D. Jones 2025-11-02  237  
f99eb098090e4c8 Luke D. Jones 2025-11-02  238  	err = armoury_set_devstate(attr, value, NULL, wmi_dev);
f99eb098090e4c8 Luke D. Jones 2025-11-02  239  	if (err)
f99eb098090e4c8 Luke D. Jones 2025-11-02  240  		return err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  241  
f99eb098090e4c8 Luke D. Jones 2025-11-02  242  	if (store_value != NULL)
f99eb098090e4c8 Luke D. Jones 2025-11-02  243  		*store_value = value;
f99eb098090e4c8 Luke D. Jones 2025-11-02  244  	sysfs_notify(kobj, NULL, attr->attr.name);
f99eb098090e4c8 Luke D. Jones 2025-11-02  245  
f99eb098090e4c8 Luke D. Jones 2025-11-02  246  	if (asus_bios_requires_reboot(attr))
f99eb098090e4c8 Luke D. Jones 2025-11-02  247  		asus_set_reboot_and_signal_event();
f99eb098090e4c8 Luke D. Jones 2025-11-02  248  
f99eb098090e4c8 Luke D. Jones 2025-11-02  249  	return count;
f99eb098090e4c8 Luke D. Jones 2025-11-02  250  }
f99eb098090e4c8 Luke D. Jones 2025-11-02  251  
f99eb098090e4c8 Luke D. Jones 2025-11-02  252  ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr,
f99eb098090e4c8 Luke D. Jones 2025-11-02  253  				char *buf, u32 wmi_dev)
f99eb098090e4c8 Luke D. Jones 2025-11-02  254  {
f99eb098090e4c8 Luke D. Jones 2025-11-02  255  	u32 result;
f99eb098090e4c8 Luke D. Jones 2025-11-02  256  	int err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  257  
f99eb098090e4c8 Luke D. Jones 2025-11-02  258  	err = armoury_get_devstate(attr, &result, wmi_dev);
f99eb098090e4c8 Luke D. Jones 2025-11-02  259  	if (err)
f99eb098090e4c8 Luke D. Jones 2025-11-02  260  		return err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  261  
f99eb098090e4c8 Luke D. Jones 2025-11-02  262  	return sysfs_emit(buf, "%u\n", result);
f99eb098090e4c8 Luke D. Jones 2025-11-02  263  }
f99eb098090e4c8 Luke D. Jones 2025-11-02  264  
f99eb098090e4c8 Luke D. Jones 2025-11-02  265  static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
f99eb098090e4c8 Luke D. Jones 2025-11-02  266  			      char *buf)
f99eb098090e4c8 Luke D. Jones 2025-11-02  267  {
f99eb098090e4c8 Luke D. Jones 2025-11-02  268  	return sysfs_emit(buf, "enumeration\n");
f99eb098090e4c8 Luke D. Jones 2025-11-02  269  }
f99eb098090e4c8 Luke D. Jones 2025-11-02  270  
f99eb098090e4c8 Luke D. Jones 2025-11-02  271  /* Mini-LED mode **************************************************************/
f99eb098090e4c8 Luke D. Jones 2025-11-02  272  
f99eb098090e4c8 Luke D. Jones 2025-11-02  273  /* Values map for mini-led modes on 2023 and earlier models. */
f99eb098090e4c8 Luke D. Jones 2025-11-02  274  static u32 mini_led_mode1_map[] = {
f99eb098090e4c8 Luke D. Jones 2025-11-02  275  	[0] = ASUS_MINI_LED_OFF,
f99eb098090e4c8 Luke D. Jones 2025-11-02  276  	[1] = ASUS_MINI_LED_ON,
f99eb098090e4c8 Luke D. Jones 2025-11-02  277  };
f99eb098090e4c8 Luke D. Jones 2025-11-02  278  
f99eb098090e4c8 Luke D. Jones 2025-11-02  279  /* Values map for mini-led modes on 2024 and later models. */
f99eb098090e4c8 Luke D. Jones 2025-11-02  280  static u32 mini_led_mode2_map[] = {
f99eb098090e4c8 Luke D. Jones 2025-11-02  281  	[0] = ASUS_MINI_LED_2024_OFF,
f99eb098090e4c8 Luke D. Jones 2025-11-02  282  	[1] = ASUS_MINI_LED_2024_WEAK,
f99eb098090e4c8 Luke D. Jones 2025-11-02  283  	[2] = ASUS_MINI_LED_2024_STRONG,
f99eb098090e4c8 Luke D. Jones 2025-11-02  284  };
f99eb098090e4c8 Luke D. Jones 2025-11-02  285  
f99eb098090e4c8 Luke D. Jones 2025-11-02  286  static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
f99eb098090e4c8 Luke D. Jones 2025-11-02  287  						struct kobj_attribute *attr, char *buf)
f99eb098090e4c8 Luke D. Jones 2025-11-02  288  {
f99eb098090e4c8 Luke D. Jones 2025-11-02  289  	u32 *mini_led_mode_map;
f99eb098090e4c8 Luke D. Jones 2025-11-02  290  	size_t mini_led_mode_map_size;
f99eb098090e4c8 Luke D. Jones 2025-11-02  291  	u32 i, mode;
f99eb098090e4c8 Luke D. Jones 2025-11-02  292  	int err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  293  
f99eb098090e4c8 Luke D. Jones 2025-11-02  294  	switch (asus_armoury.mini_led_dev_id) {
f99eb098090e4c8 Luke D. Jones 2025-11-02  295  	case ASUS_WMI_DEVID_MINI_LED_MODE:
f99eb098090e4c8 Luke D. Jones 2025-11-02  296  		mini_led_mode_map = mini_led_mode1_map;
f99eb098090e4c8 Luke D. Jones 2025-11-02  297  		mini_led_mode_map_size = ARRAY_SIZE(mini_led_mode1_map);
f99eb098090e4c8 Luke D. Jones 2025-11-02  298  		break;
f99eb098090e4c8 Luke D. Jones 2025-11-02  299  
f99eb098090e4c8 Luke D. Jones 2025-11-02  300  	case ASUS_WMI_DEVID_MINI_LED_MODE2:
f99eb098090e4c8 Luke D. Jones 2025-11-02  301  		mini_led_mode_map = mini_led_mode2_map;
f99eb098090e4c8 Luke D. Jones 2025-11-02  302  		mini_led_mode_map_size = ARRAY_SIZE(mini_led_mode2_map);
f99eb098090e4c8 Luke D. Jones 2025-11-02  303  		break;
f99eb098090e4c8 Luke D. Jones 2025-11-02  304  
f99eb098090e4c8 Luke D. Jones 2025-11-02  305  	default:
f99eb098090e4c8 Luke D. Jones 2025-11-02  306  		pr_err("Unrecognized mini-LED device: %u\n", asus_armoury.mini_led_dev_id);
f99eb098090e4c8 Luke D. Jones 2025-11-02  307  		return -ENODEV;
f99eb098090e4c8 Luke D. Jones 2025-11-02  308  	}
f99eb098090e4c8 Luke D. Jones 2025-11-02  309  
f99eb098090e4c8 Luke D. Jones 2025-11-02  310  	err = armoury_get_devstate(attr, &mode, asus_armoury.mini_led_dev_id);
f99eb098090e4c8 Luke D. Jones 2025-11-02  311  	if (err)
f99eb098090e4c8 Luke D. Jones 2025-11-02  312  		return err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  313  
f99eb098090e4c8 Luke D. Jones 2025-11-02  314  	mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);
f99eb098090e4c8 Luke D. Jones 2025-11-02  315  
f99eb098090e4c8 Luke D. Jones 2025-11-02  316  	for (i = 0; i < mini_led_mode_map_size; i++)
f99eb098090e4c8 Luke D. Jones 2025-11-02  317  		return sysfs_emit(buf, "%u\n", mini_led_mode_map[i]);
f99eb098090e4c8 Luke D. Jones 2025-11-02  318  
f99eb098090e4c8 Luke D. Jones 2025-11-02  319  	pr_warn("Unrecognized mini-LED mode: %u", mode);
f99eb098090e4c8 Luke D. Jones 2025-11-02  320  	return -EINVAL;
f99eb098090e4c8 Luke D. Jones 2025-11-02  321  }
f99eb098090e4c8 Luke D. Jones 2025-11-02  322  
f99eb098090e4c8 Luke D. Jones 2025-11-02  323  static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
f99eb098090e4c8 Luke D. Jones 2025-11-02  324  						 struct kobj_attribute *attr,
f99eb098090e4c8 Luke D. Jones 2025-11-02  325  						 const char *buf, size_t count)
f99eb098090e4c8 Luke D. Jones 2025-11-02  326  {
f99eb098090e4c8 Luke D. Jones 2025-11-02  327  	u32 *mini_led_mode_map;
f99eb098090e4c8 Luke D. Jones 2025-11-02  328  	size_t mini_led_mode_map_size;
f99eb098090e4c8 Luke D. Jones 2025-11-02  329  	u32 mode;
f99eb098090e4c8 Luke D. Jones 2025-11-02  330  	int err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  331  
f99eb098090e4c8 Luke D. Jones 2025-11-02  332  	err = kstrtou32(buf, 10, &mode);
f99eb098090e4c8 Luke D. Jones 2025-11-02  333  	if (err)
f99eb098090e4c8 Luke D. Jones 2025-11-02  334  		return err;
f99eb098090e4c8 Luke D. Jones 2025-11-02  335  
f99eb098090e4c8 Luke D. Jones 2025-11-02  336  	switch (asus_armoury.mini_led_dev_id) {
f99eb098090e4c8 Luke D. Jones 2025-11-02  337  	case ASUS_WMI_DEVID_MINI_LED_MODE:
f99eb098090e4c8 Luke D. Jones 2025-11-02  338  		mini_led_mode_map = mini_led_mode1_map;
f99eb098090e4c8 Luke D. Jones 2025-11-02  339  		mini_led_mode_map_size = ARRAY_SIZE(mini_led_mode1_map);
f99eb098090e4c8 Luke D. Jones 2025-11-02  340  		break;
f99eb098090e4c8 Luke D. Jones 2025-11-02  341  
f99eb098090e4c8 Luke D. Jones 2025-11-02  342  	case ASUS_WMI_DEVID_MINI_LED_MODE2:
f99eb098090e4c8 Luke D. Jones 2025-11-02  343  		mini_led_mode_map = mini_led_mode2_map;
f99eb098090e4c8 Luke D. Jones 2025-11-02  344  		mini_led_mode_map_size = ARRAY_SIZE(mini_led_mode2_map);
f99eb098090e4c8 Luke D. Jones 2025-11-02  345  		break;
f99eb098090e4c8 Luke D. Jones 2025-11-02  346  
f99eb098090e4c8 Luke D. Jones 2025-11-02  347  	default:
f99eb098090e4c8 Luke D. Jones 2025-11-02  348  		pr_err("Unrecognized mini-LED devid: %u\n", asus_armoury.mini_led_dev_id);
f99eb098090e4c8 Luke D. Jones 2025-11-02  349  		return -EINVAL;
f99eb098090e4c8 Luke D. Jones 2025-11-02  350  	}
f99eb098090e4c8 Luke D. Jones 2025-11-02  351  
f99eb098090e4c8 Luke D. Jones 2025-11-02  352  	if (mode >= mini_led_mode_map_size) {
f99eb098090e4c8 Luke D. Jones 2025-11-02  353  		return pr_warn("mini-LED mode unrecognized device: %u\n", mode);
f99eb098090e4c8 Luke D. Jones 2025-11-02  354  		return -ENODEV;
f99eb098090e4c8 Luke D. Jones 2025-11-02  355  	}
f99eb098090e4c8 Luke D. Jones 2025-11-02  356  
f99eb098090e4c8 Luke D. Jones 2025-11-02  357  	return armoury_attr_uint_store(kobj, attr, buf, count,
f99eb098090e4c8 Luke D. Jones 2025-11-02 @358  				       0, mini_led_mode_map[mode],
f99eb098090e4c8 Luke D. Jones 2025-11-02  359  				       NULL, asus_armoury.mini_led_dev_id);
f99eb098090e4c8 Luke D. Jones 2025-11-02  360  }
f99eb098090e4c8 Luke D. Jones 2025-11-02  361  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
