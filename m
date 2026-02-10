Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF874388849
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770745916; cv=none; b=H5yKJ9tVJi0SQmmLtyqiT3OCEmgpYjbQQ6z1eh1xhADJdYj6ChgM1lHJNTag7e+eNHEGF7VcWVjelWd5Wey98T2AjungwONiC3znD56qlEplW3ujmbVYqE9ckBe3WWYY7477+hmMKDzAX9KpKuwtmL3LFmArhMMtU3JYagdeIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770745916; c=relaxed/simple;
	bh=fPGK4peFZfkgUvUON1+rXCW3QlP9CoXj9EcuVxnfFys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X6KNFRu7YaIpnggZcJ6y9msxcyJ3xtNP8ZuA6/Q3J6GAYcg3krjH7XHzthdgWxJD/UrGe1pi4vHSgJjKK0ZNb4i5XMZ/mvQb/OrbfObm4qlzFCFnKlRQ8sr/GYojD0KwOWh946zQOMnWlalI08VQ7fT9FFrRoX44eO24XiX6cZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COMdiLsN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COMdiLsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770745913; x=1802281913;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fPGK4peFZfkgUvUON1+rXCW3QlP9CoXj9EcuVxnfFys=;
  b=COMdiLsNdHYAsBdIZqe3bqcL8vdXWDCUWEwwkwT+DBiAmBU4En+41e3B
   ZR3Zr4TuJ3drhBf+h67Z7wFTFsTw0JmE59rk/x7fu09jNManF+cgxsl2B
   u0/WVkacGKqTkgjeB0aN5vCkH03I9VJxqJsjo5VddOllVwoNm+krbtY4X
   dGU38mpU6s/JqEhrUI7nwt8AW/LPOJPjV+0Szcx9CrMG4Ll/ipRYAaMIe
   lpPKXvXvYiLn6wKa36vs7rH5autkhebxGG7ifW/802Yz5vbGgX2nmbFyr
   2Pko/TrnNKB6umccwhpNy3mKVIHqVj3HSAEyFAv7EU0JviaEhdpHIsB73
   Q==;
X-CSE-ConnectionGUID: rKM6YxgKT1K205qCQv2AnA==
X-CSE-MsgGUID: fQBFSVCkQCKLSJyPRAZl/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89473468"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89473468"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 09:51:52 -0800
X-CSE-ConnectionGUID: xbc/uyAVR9KtB5hjxUNJRQ==
X-CSE-MsgGUID: 1ltQzJTOQ9m6HW862CnXjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216495380"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Feb 2026 09:51:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vprtt-00000000pGy-0GMM;
	Tue, 10 Feb 2026 17:51:49 +0000
Date: Wed, 11 Feb 2026 01:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] gpio: swnode: restore the swnode-name-against-chip-label
 matching
Message-ID: <202602110128.BInRI9un-lkp@intel.com>
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
In-Reply-To: <20260210094806.38146-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260210094806.38146-1-bartosz.golaszewski@oss.qualcomm.com>
TO: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
TO: Linus Walleij <linusw@kernel.org>
TO: Bartosz Golaszewski <brgl@kernel.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Arnd Bergmann <arnd@kernel.org>
TO: Hans de Goede <hansg@kernel.org>
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: platform-driver-x86@vger.kernel.org
CC: stable@vger.kernel.org

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-swnode-restore-the-swnode-name-against-chip-label-matching/20260210-175012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260210094806.38146-1-bartosz.golaszewski%40oss.qualcomm.com
patch subject: [PATCH] gpio: swnode: restore the swnode-name-against-chip-label matching
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: nios2-randconfig-r071-20260210 (https://download.01.org/0day-ci/archive/20260211/202602110128.BInRI9un-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602110128.BInRI9un-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib-swnode.c:62 swnode_get_gpio_device() error: we previously assumed 'gdev_node' could be null (see line 32)

vim +/gdev_node +62 drivers/gpio/gpiolib-swnode.c

e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  25  
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  26  static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  27  {
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  28  	const struct software_node *gdev_node;
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  29  	struct gpio_device *gdev;
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  30  
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  31  	gdev_node = to_software_node(fwnode);
6774a66d0e103d Bartosz Golaszewski 2025-12-15 @32  	if (!gdev_node)
216c1204757190 Bartosz Golaszewski 2025-11-20  33  		goto fwnode_lookup;
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  34  
9d50f95bc0d5df Charles Keepax      2024-04-16  35  	/*
9d50f95bc0d5df Charles Keepax      2024-04-16  36  	 * Check for a special node that identifies undefined GPIOs, this is
9d50f95bc0d5df Charles Keepax      2024-04-16  37  	 * primarily used as a key for internal chip selects in SPI bindings.
9d50f95bc0d5df Charles Keepax      2024-04-16  38  	 */
9d50f95bc0d5df Charles Keepax      2024-04-16  39  	if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
6774a66d0e103d Bartosz Golaszewski 2025-12-15  40  	    gdev_node == &swnode_gpio_undefined)
9d50f95bc0d5df Charles Keepax      2024-04-16  41  		return ERR_PTR(-ENOENT);
9d50f95bc0d5df Charles Keepax      2024-04-16  42  
216c1204757190 Bartosz Golaszewski 2025-11-20  43  fwnode_lookup:
e5d527be7e6984 Bartosz Golaszewski 2025-11-03  44  	gdev = gpio_device_find_by_fwnode(fwnode);
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  45  	if (!gdev)
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  46  		/*
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  47  		 * FIXME: We shouldn't need to compare the GPIO controller's
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  48  		 * label against the software node that is supposedly attached
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  49  		 * to it. However there are currently GPIO users that - knowing
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  50  		 * the expected label of the GPIO chip whose pins they want to
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  51  		 * control - set up dummy software nodes named after those GPIO
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  52  		 * controllers, which aren't actually attached to them. In this
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  53  		 * case gpio_device_find_by_fwnode() will fail as no device on
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  54  		 * the GPIO bus is actually associated with the fwnode we're
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  55  		 * looking for.
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  56  		 *
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  57  		 * As a fallback: continue checking the label if we have no
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  58  		 * match. However, the situation described above is an abuse
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  59  		 * of the software node API and should be phased out and the
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  60  		 * following line - eventually removed.
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  61  		 */
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10 @62  		gdev = gpio_device_find_by_label(gdev_node->name);
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  63  
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  64  	return gdev ?: ERR_PTR(-EPROBE_DEFER);
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  65  }
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  66  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
