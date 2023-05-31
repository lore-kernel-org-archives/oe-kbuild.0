Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9664718C3B
	for <oe-kbuild@lists.linux.dev>; Wed, 31 May 2023 23:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685574588; x=1717110588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pVIsEpnC+N+4NxzGyiPayQYU0kE1OFpqJEuAGbOH8Q8=;
  b=cXtwBXCF5aA5qbKgfYyn2VlIa/CvyBzo8JRsJo3Ht9cAsd3+xnwOaJFh
   pAYLjWM07+uoHn6EUvH9zIGk+eajzAlUnrjqm6ryn3UsM1J2tGv75d0JI
   jbyaFcFV8LSyxjQsjwp+BWkg8jf66rBq/WKRLWyQFtnhsikrxt5AvW4Oa
   n5ggM5Ua+IoUJcmgPvqXMuRycokDawGM8WC+VY6H+NxLD0K4Fp6I8Ss3/
   mEOElTRMyEHdjo62EoonhL6lo2mpKeZgFbae2K6xzf/Pv2Huhr3OsscAS
   TcnIVQVGtzUDochdNaHuwJ4W2xwiDUZZKyOgWCbHogU6MzSJ275nCSPgL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="418887664"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="418887664"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="701301008"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="701301008"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 May 2023 16:09:44 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Uwp-0001fx-2K;
	Wed, 31 May 2023 23:09:43 +0000
Date: Thu, 1 Jun 2023 07:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/9] drm/panel: Add a way for other devices to follow
 panel state
Message-ID: <202306010624.wU8Y9Ndn-lkp@intel.com>
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
In-Reply-To: <20230523122802.3.Icd5f96342d2242051c754364f4bee13ef2b986d4@changeid>
References: <20230523122802.3.Icd5f96342d2242051c754364f4bee13ef2b986d4@changeid>
TO: Douglas Anderson <dianders@chromium.org>
TO: Jiri Kosina <jikos@kernel.org>
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: devicetree@vger.kernel.org
CC: cros-qcom-dts-watchers@chromium.org
CC: linux-arm-msm@vger.kernel.org
CC: yangcong5@huaqin.corp-partner.google.com
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: Douglas Anderson <dianders@chromium.org>
CC: linux-input@vger.kernel.org
CC: hsinyi@google.com

Hi Douglas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on hid/for-next drm-misc/drm-misc-next linus/master v6.4-rc4 next-20230531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/dt-bindings-HID-i2c-hid-Add-panel-property-to-i2c-hid-backed-panels/20230524-034323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230523122802.3.Icd5f96342d2242051c754364f4bee13ef2b986d4%40changeid
patch subject: [PATCH 3/9] drm/panel: Add a way for other devices to follow panel state
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m021-20230530 (https://download.01.org/0day-ci/archive/20230601/202306010624.wU8Y9Ndn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306010624.wU8Y9Ndn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_panel.c:407 drm_panel_add_follower() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +407 drivers/gpu/drm/drm_panel.c

aead40ea0b53a0 Thierry Reding   2013-08-30  374  
9a09b2671db0a0 Douglas Anderson 2023-05-23  375  /**
9a09b2671db0a0 Douglas Anderson 2023-05-23  376   * drm_panel_add_follower() - Register something to follow panel enable state.
9a09b2671db0a0 Douglas Anderson 2023-05-23  377   * @follower_dev: The 'struct device' for the follower.
9a09b2671db0a0 Douglas Anderson 2023-05-23  378   * @follower:     The panel follower descriptor for the follower.
9a09b2671db0a0 Douglas Anderson 2023-05-23  379   *
9a09b2671db0a0 Douglas Anderson 2023-05-23  380   * A panel follower is called right after preparing the panel and right before
9a09b2671db0a0 Douglas Anderson 2023-05-23  381   * unpreparing the panel. It's primary intention is to power on an associated
9a09b2671db0a0 Douglas Anderson 2023-05-23  382   * touchscreen, though it could be used for any similar devices. Multiple
9a09b2671db0a0 Douglas Anderson 2023-05-23  383   * devices are allowed the follow the same panel.
9a09b2671db0a0 Douglas Anderson 2023-05-23  384   *
9a09b2671db0a0 Douglas Anderson 2023-05-23  385   * If a follower is added to a panel that's already been turned on, the
9a09b2671db0a0 Douglas Anderson 2023-05-23  386   * follower's prepare callback is called right away.
9a09b2671db0a0 Douglas Anderson 2023-05-23  387   *
9a09b2671db0a0 Douglas Anderson 2023-05-23  388   * At the moment panels can only be followed on device tree enabled systems.
9a09b2671db0a0 Douglas Anderson 2023-05-23  389   * The "panel" property of the follower points to the panel to be followed.
9a09b2671db0a0 Douglas Anderson 2023-05-23  390   *
9a09b2671db0a0 Douglas Anderson 2023-05-23  391   * Return: 0 or an error code.
9a09b2671db0a0 Douglas Anderson 2023-05-23  392   */
9a09b2671db0a0 Douglas Anderson 2023-05-23  393  int drm_panel_add_follower(struct device *follower_dev,
9a09b2671db0a0 Douglas Anderson 2023-05-23  394  			   struct drm_panel_follower *follower)
9a09b2671db0a0 Douglas Anderson 2023-05-23  395  {
9a09b2671db0a0 Douglas Anderson 2023-05-23  396  	struct device_node *panel_np;
9a09b2671db0a0 Douglas Anderson 2023-05-23  397  	struct drm_panel *panel;
9a09b2671db0a0 Douglas Anderson 2023-05-23  398  	int ret;
9a09b2671db0a0 Douglas Anderson 2023-05-23  399  
9a09b2671db0a0 Douglas Anderson 2023-05-23  400  	panel_np = of_parse_phandle(follower_dev->of_node, "panel", 0);
9a09b2671db0a0 Douglas Anderson 2023-05-23  401  	if (!panel_np)
9a09b2671db0a0 Douglas Anderson 2023-05-23  402  		return -ENODEV;
9a09b2671db0a0 Douglas Anderson 2023-05-23  403  
9a09b2671db0a0 Douglas Anderson 2023-05-23  404  	panel = of_drm_find_panel(panel_np);
9a09b2671db0a0 Douglas Anderson 2023-05-23  405  	of_node_put(panel_np);
9a09b2671db0a0 Douglas Anderson 2023-05-23  406  	if (IS_ERR(panel))
9a09b2671db0a0 Douglas Anderson 2023-05-23 @407  		return PTR_ERR(panel);
9a09b2671db0a0 Douglas Anderson 2023-05-23  408  
9a09b2671db0a0 Douglas Anderson 2023-05-23  409  	get_device(panel->dev);
9a09b2671db0a0 Douglas Anderson 2023-05-23  410  	follower->panel = panel;
9a09b2671db0a0 Douglas Anderson 2023-05-23  411  
9a09b2671db0a0 Douglas Anderson 2023-05-23  412  	mutex_lock(&panel->follower_lock);
9a09b2671db0a0 Douglas Anderson 2023-05-23  413  
9a09b2671db0a0 Douglas Anderson 2023-05-23  414  	list_add_tail(&follower->list, &panel->followers);
9a09b2671db0a0 Douglas Anderson 2023-05-23  415  	if (panel->prepared) {
9a09b2671db0a0 Douglas Anderson 2023-05-23  416  		ret = follower->funcs->panel_prepared(follower);
9a09b2671db0a0 Douglas Anderson 2023-05-23  417  		if (ret < 0)
9a09b2671db0a0 Douglas Anderson 2023-05-23  418  			dev_info(panel->dev, "%ps failed: %d\n",
9a09b2671db0a0 Douglas Anderson 2023-05-23  419  				 follower->funcs->panel_prepared, ret);
9a09b2671db0a0 Douglas Anderson 2023-05-23  420  	}
9a09b2671db0a0 Douglas Anderson 2023-05-23  421  
9a09b2671db0a0 Douglas Anderson 2023-05-23  422  	mutex_unlock(&panel->follower_lock);
9a09b2671db0a0 Douglas Anderson 2023-05-23  423  
9a09b2671db0a0 Douglas Anderson 2023-05-23  424  	return 0;
9a09b2671db0a0 Douglas Anderson 2023-05-23  425  }
9a09b2671db0a0 Douglas Anderson 2023-05-23  426  EXPORT_SYMBOL(drm_panel_add_follower);
9a09b2671db0a0 Douglas Anderson 2023-05-23  427  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
