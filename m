Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4007B230BEC
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Feb 2026 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771986581; cv=none; b=uNwaSh2j/umFsDbSmx1PCCw+2QOHZhld50IKiDZqnDy9aIJdyFoVMBrnlyFEGg68pC/MptWxeiEeIy1756v8oUlw7I0pbBMirFY5MY452CEQMv41h7nuJGp+56JCjpBoin1RMD/a3geKjiM3/TQDePa3yBTx/nZ+27USKYBGWmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771986581; c=relaxed/simple;
	bh=9A1HMrdJs7zmUTAvE5yeDXx7Qq7jM0zRUIlMGNS0PPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qaKUn1EGSeCXNOzjWWc6d/DgACGsPiJj25xyytS+o5lCfSObqkNRtpUG7eBkSira8T2Ac9HmU7W4IhHUbOYreTPfjrm4zLek73JX828+Tfm94GaeEaUEtXzmvUHJbScD6EFF7WcYnikRwrc9aA2dJB3vejiJbiPmxs2htRyK9DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdyPr4dN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdyPr4dN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771986579; x=1803522579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9A1HMrdJs7zmUTAvE5yeDXx7Qq7jM0zRUIlMGNS0PPU=;
  b=PdyPr4dNiHzNRFt8oXwID+R4hgBqBQGm+Y8hIrQ7R4L67YuwzG/dyG/3
   kUHTL1HNh4WCYr4OULT4UJoJY8YgAM9HL0HP7dByo34mAxqL8IdrMpAcP
   ZmJEf2CkvP2TLdB2vXBtx9NKMj0FpgLag4BXv5f57aqLN9TfNh0xUihPV
   N8KVSP9o6X22K/fAe/L1W0sJUDlFKkY2pLaH54nqeu45iQ/Aua4DCWYmF
   NQnEsDffejTqNv7KZ75RNIwpmtO0Qha1x/m7OtxfChLBz7ATgM/UbJDQz
   IftnnOK3iy402E2rHB65V54yGuofwOPyFJLGnEDXpXNNlReyC/nTPlI7w
   w==;
X-CSE-ConnectionGUID: pbYfo0jgQTW2H0ftOGorJw==
X-CSE-MsgGUID: FHJvPxppSKKNw/FsHoclqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="90597024"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="90597024"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 18:29:38 -0800
X-CSE-ConnectionGUID: 22OnVRSaRti6TM1xu4tRBg==
X-CSE-MsgGUID: eNlum0vwSI2YnjA3tFQ5IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="214257895"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 18:29:37 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv4ed-000000003oT-0nqR;
	Wed, 25 Feb 2026 02:29:35 +0000
Date: Wed, 25 Feb 2026 10:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback
 for GPIO device lookup
Message-ID: <202602251030.c7iVKF8b-lkp@intel.com>
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
In-Reply-To: <20260224163234.653438-1-pranavkharche7@gmail.com>
References: <20260224163234.653438-1-pranavkharche7@gmail.com>
TO: Pranav Kharche <pranavkharche7@gmail.com>
TO: linus.walleij@kernel.org
TO: brgl@kernel.org
CC: linux-gpio@vger.kernel.org
CC: Pranav Kharche <pranavkharche7@gmail.com>

Hi Pranav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v7.0-rc1 next-20260224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranav-Kharche/gpio-gpiolib-swnode-Remove-deprecated-label-fallback-for-GPIO-device-lookup/20260225-003353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260224163234.653438-1-pranavkharche7%40gmail.com
patch subject: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback for GPIO device lookup
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: csky-randconfig-r073-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251030.c7iVKF8b-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602251030.c7iVKF8b-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib-swnode.c:45 swnode_get_gpio_device() warn: if statement not indented

vim +45 drivers/gpio/gpiolib-swnode.c

e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  25  
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  26  static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  27  {
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  28  	const struct software_node *gdev_node;
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  29  	struct gpio_device *gdev;
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  30  
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  31  	gdev_node = to_software_node(fwnode);
6774a66d0e103d0 Bartosz Golaszewski 2025-12-15  32  	if (!gdev_node)
216c12047571906 Bartosz Golaszewski 2025-11-20  33  		goto fwnode_lookup;
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  34  
9d50f95bc0d5df5 Charles Keepax      2024-04-16  35  	/*
9d50f95bc0d5df5 Charles Keepax      2024-04-16  36  	 * Check for a special node that identifies undefined GPIOs, this is
9d50f95bc0d5df5 Charles Keepax      2024-04-16  37  	 * primarily used as a key for internal chip selects in SPI bindings.
9d50f95bc0d5df5 Charles Keepax      2024-04-16  38  	 */
9d50f95bc0d5df5 Charles Keepax      2024-04-16  39  	if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
6774a66d0e103d0 Bartosz Golaszewski 2025-12-15  40  	    gdev_node == &swnode_gpio_undefined)
9d50f95bc0d5df5 Charles Keepax      2024-04-16  41  		return ERR_PTR(-ENOENT);
9d50f95bc0d5df5 Charles Keepax      2024-04-16  42  
216c12047571906 Bartosz Golaszewski 2025-11-20  43  fwnode_lookup:
e5d527be7e69848 Bartosz Golaszewski 2025-11-03  44  	gdev = gpio_device_find_by_fwnode(fwnode);
ff91965ad8b214e Bartosz Golaszewski 2026-02-11 @45  	if (!gdev && gdev_node && gdev_node->name)
7969c87da8f4a6f Pranav Kharche      2026-02-24  46  		
ff91965ad8b214e Bartosz Golaszewski 2026-02-11  47  
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  48  	return gdev ?: ERR_PTR(-EPROBE_DEFER);
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  49  }
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
