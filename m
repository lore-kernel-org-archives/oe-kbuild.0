Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4ED304BB3
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 23:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766444479; cv=none; b=KxFvrq30BR2MMWPI5wUcM//wLr4tYLvAXBGlib0WcMPC3ozwmY0Pk3+jVGrZQ453nAhVOFlcG/8Z7XiWqNSzIGOLqUUxpDTRK4HnJ46x0/UaQPLPSKGaQr3UGVi0YJ6Fo5xJvVye/drquUYMyYiTA1eo8HglL4mX82LWgMDGps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766444479; c=relaxed/simple;
	bh=c23IqKy+SFggiq3kft/ZWMMbTJcvtbpCw1ap/4JnHow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLqkEuB76X4mDqy4ovh/vL4gaRO2i6Df7c/1TDIjEneHeaEW33M0LTPwsInYYoMx878KvlJ8qMrSpG21Lrn3htJU+KhH+U90oG5myClnjh27ttUhobj6ie7AD8l8d1lFbGMVch50W7R7aKr6Izj25OKXzDZjoZf7l0NfMasT4wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOpBwTZH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOpBwTZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766444476; x=1797980476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c23IqKy+SFggiq3kft/ZWMMbTJcvtbpCw1ap/4JnHow=;
  b=LOpBwTZHUwyOjzuXnm2fjDupYOqfx4rdiZ2vDilx6gikL4TlXY9UZ3rX
   FyyHDFaPmABm6g14qcN8ec7vqEjmZY7lM1CBc40G1SUgZKV7Wap9kffFu
   RzGz7zRy63gzhlLsiNM4Z7ogw31+VAJ9l1NOdeVBLXbFsPi23sYmEDHMD
   R6epFoan1T6LtcTtvybksC+u6wOyEw3oro/kZ0K38jR+9RIO5ecWPxrr5
   +/ai3ZTuA/rN4KulDQr7AnSwBbCyJ5cWxjipiWz260DkQxBitagSy7mvy
   re6BWma+SbTQn4fYuhthD0U9hyz8xmWv/6BJbN0j8E7xGFyK7KK3CqLbS
   w==;
X-CSE-ConnectionGUID: YjIR/MjTRn+t+hcvx5gfqg==
X-CSE-MsgGUID: NsyCrYJHRMSN+l6dYtfRWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68456527"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68456527"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:01:15 -0800
X-CSE-ConnectionGUID: dDaVrhJBQqC/BJ6c5Jqptg==
X-CSE-MsgGUID: o6PbU2LqRGuuRpbZ2BJpZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="237037205"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 15:01:14 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXotr-000000001CD-1lZY;
	Mon, 22 Dec 2025 23:01:11 +0000
Date: Tue, 23 Dec 2025 07:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] HID: asus: add new Asus EC hid device for keyboard
 backlight and FN HotKeys
Message-ID: <202512230655.qcvFdXbC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hid/hid-asus-ec.c:384:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251221-add-support-for-the-asus-hid-ec-v1-1-35d7d70fbbfc@yahoo.com>
References: <20251221-add-support-for-the-asus-hid-ec-v1-1-35d7d70fbbfc@yahoo.com>
TO: Alexandru Marc Serdeliuc via B4 Relay <devnull+serdeliuk.yahoo.com@kernel.org>
TO: Jiri Kosina <jikos@kernel.org>
TO: Benjamin Tissoires <bentiss@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-input@vger.kernel.org
CC: Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>

Hi Alexandru,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Marc-Serdeliuc-via-B4-Relay/HID-asus-add-new-Asus-EC-hid-device-for-keyboard-backlight-and-FN-HotKeys/20251221-192249
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251221-add-support-for-the-asus-hid-ec-v1-1-35d7d70fbbfc%40yahoo.com
patch subject: [PATCH] HID: asus: add new Asus EC hid device for keyboard backlight and FN HotKeys
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-r131-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230655.qcvFdXbC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230655.qcvFdXbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512230655.qcvFdXbC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-asus-ec.c:384:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-asus-ec.c:384:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hid/hid-asus-ec.c:385:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-asus-ec.c:385:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hid/hid-asus-ec.c:386:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-asus-ec.c:386:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +384 drivers/hid/hid-asus-ec.c

95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  300  
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  301  static int asus_hid_probe(struct hid_device *hdev, const struct hid_device_id *id)
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  302  {
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  303  	int ret;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  304  	struct asus_hid_data *data;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  305  
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  306  	data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  307  	if (!data)
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  308  		return -ENOMEM;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  309  	data->hdev = hdev;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  310  	hid_set_drvdata(hdev, data);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  311  	asus_data = data;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  312  	data->saved_brightness = A14_EC_MAX_BACKLIGHT;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  313  	ret = hid_parse(hdev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  314  	if (ret)
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  315  		return ret;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  316  	ret = hid_hw_start(hdev, HID_INPUT_REPORT | HID_OUTPUT_REPORT | HID_FEATURE_REPORT);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  317  	if (ret)
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  318  		return ret;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  319  	data->hotkey_input_dev = input_allocate_device();
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  320  	if (!data->hotkey_input_dev) {
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  321  		dev_err(&hdev->dev, "Failed to allocate hotkey input device\n");
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  322  		hid_hw_stop(hdev); return -ENOMEM;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  323  	}
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  324  	data->hotkey_input_dev->name = "ASUS EC I2C HID hotkeys";
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  325  	data->hotkey_input_dev->phys = "i2c-hid/input1/hotkeys";
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  326  	data->hotkey_input_dev->id.bustype = hdev->bus;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  327  	data->hotkey_input_dev->id.vendor = hdev->vendor;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  328  	data->hotkey_input_dev->id.product = hdev->product;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  329  	data->hotkey_input_dev->dev.parent = &hdev->dev;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  330  	set_bit(EV_KEY, data->hotkey_input_dev->evbit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  331  	set_bit(KEY_FN_ESC, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  332  	set_bit(KEY_KBDILLUMUP, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  333  	set_bit(KEY_KBDILLUMDOWN, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  334  	set_bit(KEY_BRIGHTNESSDOWN, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  335  	set_bit(KEY_BRIGHTNESSUP, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  336  	set_bit(KEY_SWITCHVIDEOMODE, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  337  	set_bit(KEY_EMOJI_PICKER, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  338  	set_bit(KEY_MICMUTE, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  339  	set_bit(KEY_CAMERA_ACCESS_TOGGLE, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  340  	set_bit(KEY_TOUCHPAD_TOGGLE, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  341  	set_bit(KEY_PROG1, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  342  	set_bit(KEY_PERFORMANCE, data->hotkey_input_dev->keybit);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  343  
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  344  	ret = input_register_device(data->hotkey_input_dev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  345  	if (ret) {
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  346  		dev_err(&hdev->dev, "Failed to register hotkey input device\n");
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  347  		input_free_device(data->hotkey_input_dev); hid_hw_stop(hdev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  348  		return ret;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  349  	}
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  350  	asus_kbd_led_init(hdev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  351  	data->kbd_led_cdev.name = "asus::kbd_backlight";
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  352  	data->kbd_led_cdev.brightness_set = asus_kbd_set_brightness;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  353  	data->kbd_led_cdev.max_brightness = A14_EC_MAX_BACKLIGHT;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  354  	ret = led_classdev_register(&hdev->dev, &data->kbd_led_cdev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  355  	if (ret) {
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  356  		input_unregister_device(data->hotkey_input_dev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  357  		hid_hw_stop(hdev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  358  		return ret;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  359  	}
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  360  	dev_info(&hdev->dev,
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  361  		 "ASUS EC HID driver for Zenbook A14 loaded for 0x%04x:0x%04x\n",
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  362  		 ASUS_VENDOR_ID, ASUS_PRODUCT_ID);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  363  	return 0;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  364  }
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  365  static void asus_hid_remove(struct hid_device *hdev)
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  366  {
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  367  	struct asus_hid_data *data = hid_get_drvdata(hdev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  368  
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  369  	led_classdev_unregister(&data->kbd_led_cdev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  370  	input_unregister_device(data->hotkey_input_dev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  371  	hid_hw_stop(hdev);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  372  	asus_data = NULL;
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  373  }
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  374  static struct hid_driver hid_asus_ec_driver = {
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  375  	.name       = "hid-asus-ec",
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  376  	.id_table   = asus_hid_devices,
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  377  	.probe      = asus_hid_probe,
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  378  	.remove     = asus_hid_remove,
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  379  	.raw_event  = asus_raw_event,
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  380  	.suspend    = asus_hid_suspend,
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  381  	.resume     = asus_hid_resume,
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  382  };
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21  383  module_hid_driver(hid_asus_ec_driver);
95f96be982795a Alexandru Marc Serdeliuc 2025-12-21 @384  MODULE_AUTHOR("Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
