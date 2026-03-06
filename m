Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322262745E
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 02:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772762501; cv=none; b=F/GfOU+uwXa02k/trzI2e7g9xmITnb5ZcAF5ZBpqDcRq17G7utBuGUh2FzUtnIjXADvGzIC5LCqr88yF/nMUQ977xOBg76E24+ZJNzL1CrEMtULs9iXhakGNVspcGpD7cxOeJ3MUEI9uVvMJZn5PkmhyQjiSRFgodNTt5o9GffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772762501; c=relaxed/simple;
	bh=EBtvuB7Hk+8R/yK17wtB3U046g3I+iE/um4R9jql6Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L9c6CcAn7EReVKCbts8iF4aHSWdGMHvG99mxkduf+naGBf+6SFfwHGwH95nNhl7SeaQmLBDZHJMQP+E3B16UAM8wiPFXYRUCbjlindI3v3PgaL3UBI5xdHit6AsBJEUlOAObNPOpFr5uxC5EM33VS7S+fN9V6DgcZ0+U+GBJ8WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJOIYlUk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJOIYlUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772762499; x=1804298499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBtvuB7Hk+8R/yK17wtB3U046g3I+iE/um4R9jql6Uo=;
  b=GJOIYlUkpYPScY54fRE1UIb9KoLOkgmoiUDBPuKyxH6h72aD0ylrxz2a
   So6bQT9lD8ziD1REnO8P3DgIINyRUK6EdzSRXJtrSY6Il5sf9ZDeD3TNm
   ESCoM0qhdKB3r44zv5imQQE/B+JMD6IwJBi1tvgD00TtPJmIZYMlAQHIV
   aLzX6J6UlxPQRmParEjetqJJuhOyMpyLfrw/uPbcoEvBvaS8UnYwKq2zm
   9KUs2pmoOSRGlJ3iAzsE0hLwUenR6Pxoa7z5H+zlLcKWb/Xp1MZYmprDH
   fWAH1GW7fdSURUGTOH1b6ruOsHYIhUIZCXZl3YlAOZVDrsBEZeOixU1t8
   Q==;
X-CSE-ConnectionGUID: WLE6c8yZQP23pDTLOf4iLA==
X-CSE-MsgGUID: zRR1hPdsQ5WHTxpglzCobg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73742074"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73742074"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 18:01:39 -0800
X-CSE-ConnectionGUID: jF41Q25oSjCH6N/IbGOruA==
X-CSE-MsgGUID: DA5k7lLATRW9nQ0eAy5L7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223559140"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2026 18:01:37 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyKVS-000000000CH-40kF;
	Fri, 06 Mar 2026 02:01:34 +0000
Date: Fri, 6 Mar 2026 10:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Message-ID: <202603060910.Q5zBquzF-lkp@intel.com>
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
In-Reply-To: <20260304211808.1437846-5-shenwei.wang@nxp.com>
References: <20260304211808.1437846-5-shenwei.wang@nxp.com>
TO: Shenwei Wang <shenwei.wang@nxp.com>
TO: Linus Walleij <linusw@kernel.org>
TO: Bartosz Golaszewski <brgl@kernel.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Frank Li <Frank.Li@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: arnaud.pouliquen@foss.st.com
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: linux-gpio@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: Shenwei Wang <shenwei.wang@nxp.com>
CC: Peng Fan <peng.fan@nxp.com>
CC: devicetree@vger.kernel.org
CC: linux-remoteproc@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-imx@nxp.com

Hi Shenwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on remoteproc/rproc-next robh/for-next linus/master v7.0-rc2 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/docs-driver-api-gpio-rpmsg-gpio-driver-over-rpmsg-bus/20260305-052440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260304211808.1437846-5-shenwei.wang%40nxp.com
patch subject: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware protocol
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-161-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060910.Q5zBquzF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603060910.Q5zBquzF-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-rpmsg.c:188 rpmsg_gpio_imx_send_fixed_up() error: buffer overflow 'imx_std_cmd_map' 7 <= 27

vim +/imx_std_cmd_map +188 drivers/gpio/gpio-rpmsg.c

49a0cb20cd49a59 Shenwei Wang 2026-03-04  175  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  176  static int rpmsg_gpio_imx_send_fixed_up(struct rpmsg_gpio_info *info,
49a0cb20cd49a59 Shenwei Wang 2026-03-04  177  				   struct rpmsg_gpio_packet *msg)
49a0cb20cd49a59 Shenwei Wang 2026-03-04  178  {
49a0cb20cd49a59 Shenwei Wang 2026-03-04  179  	struct rpmsg_gpio_nxp_packet imx_msg;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  180  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  181  	if (msg->cmd >= sizeof(imx_std_cmd_map))
49a0cb20cd49a59 Shenwei Wang 2026-03-04  182  		return -EINVAL;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  183  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  184  	imx_msg.id = IMX_RPMSG_ID;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  185  	imx_msg.vendor = IMX_RPMSG_VENDOR;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  186  	imx_msg.version = IMX_RPMSG_VERSION;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  187  	imx_msg.type = msg->type;
49a0cb20cd49a59 Shenwei Wang 2026-03-04 @188  	imx_msg.cmd = imx_std_cmd_map[msg->cmd];
49a0cb20cd49a59 Shenwei Wang 2026-03-04  189  	imx_msg.port_idx = msg->port_idx;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  190  	imx_msg.line = msg->line;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  191  	imx_msg.val1 = msg->val1;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  192  	imx_msg.val2 = msg->val2;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  193  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  194  	switch (msg->cmd) {
49a0cb20cd49a59 Shenwei Wang 2026-03-04  195  	case VIRTIO_GPIO_MSG_IRQ_TYPE:
49a0cb20cd49a59 Shenwei Wang 2026-03-04  196  		switch (msg->val1) {
49a0cb20cd49a59 Shenwei Wang 2026-03-04  197  		case VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH:
49a0cb20cd49a59 Shenwei Wang 2026-03-04  198  			imx_msg.val1 = IMX_RPMSG_TRI_HIGH_LEVEL;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  199  			break;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  200  		case VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW:
49a0cb20cd49a59 Shenwei Wang 2026-03-04  201  			imx_msg.val1 = IMX_RPMSG_TRI_LOW_LEVEL;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  202  			break;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  203  		default:
49a0cb20cd49a59 Shenwei Wang 2026-03-04  204  			break;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  205  		}
49a0cb20cd49a59 Shenwei Wang 2026-03-04  206  		break;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  207  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  208  	case VIRTIO_GPIO_MSG_SET_DIRECTION:
49a0cb20cd49a59 Shenwei Wang 2026-03-04  209  		imx_msg.val1 = 0;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  210  		if (msg->val1 == VIRTIO_GPIO_DIRECTION_OUT)
49a0cb20cd49a59 Shenwei Wang 2026-03-04  211  			imx_msg.cmd = IMX_RPMSG_CONFIG_OUTPUT;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  212  		break;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  213  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  214  	default:
49a0cb20cd49a59 Shenwei Wang 2026-03-04  215  		break;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  216  	}
49a0cb20cd49a59 Shenwei Wang 2026-03-04  217  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  218  	return rpmsg_send(info->rpdev->ept, &imx_msg, sizeof(imx_msg));
49a0cb20cd49a59 Shenwei Wang 2026-03-04  219  }
49a0cb20cd49a59 Shenwei Wang 2026-03-04  220  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
