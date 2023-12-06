Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5143FB12
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdpUf6qF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701888677; x=1733424677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eWDrVMoZ7rMqolznZoj0bpw3y4nGr9CqFWP1/Q2axTM=;
  b=GdpUf6qFbDG93XG5JaDRjnsQqhkj42rXr7HN+CDfrmuwP8yH4tc719GC
   vwmYgHCukOznUszAFiOYunsktVl1jg/U/JDnad3pPRIjFvcMoHEN5WY5y
   7SdIj3utNT0CQf6GVLEGl5Oby+IQ36mnV5KJw41X33z7OYcz3Y11DATep
   b+ZfL8ue6izmQa6xaN6sQpJY7zaI5Y4carMlqCWQyyZ1i8LCXtC0iMrSy
   LwuW40OLva6D1Lcuhj2WGiNPOXdKXdj7LwCsFYtttVilyg2VQdYGUVck6
   t62Tksotm1VG4BqLqM6GROgTHtS78lWGWq/8GRwcgiXjcHuxrRgllpwva
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="392982550"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="392982550"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 10:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="747694564"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="747694564"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Dec 2023 10:51:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAwzI-000BIY-2a;
	Wed, 06 Dec 2023 18:51:12 +0000
Date: Thu, 7 Dec 2023 02:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 06/10] drm/panel: Add Synaptics R63353 panel driver
Message-ID: <202312070214.Eyi9T4eq-lkp@intel.com>
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
In-Reply-To: <20231205105341.4100896-7-dario.binacchi@amarulasolutions.com>
References: <20231205105341.4100896-7-dario.binacchi@amarulasolutions.com>
TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
TO: linux-kernel@vger.kernel.org
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Amarula patchwork <linux-amarula@amarulasolutions.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: Jessica Zhang <quic_jesszhan@quicinc.com>
CC: michael@amarulasolutions.com

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on robh/for-next krzk/for-next linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/drm-bridge-Fix-bridge-disable-logic/20231205-185455
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231205105341.4100896-7-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH v4 06/10] drm/panel: Add Synaptics R63353 panel driver
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-r071-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070214.Eyi9T4eq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070214.Eyi9T4eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312070214.Eyi9T4eq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-synaptics-r63353.c:132 r63353_panel_activate() warn: missing unwind goto?

vim +132 drivers/gpu/drm/panel/panel-synaptics-r63353.c

64f91a53613aea Michael Trimarchi 2023-12-05  106  
64f91a53613aea Michael Trimarchi 2023-12-05  107  static int r63353_panel_activate(struct r63353_panel *rpanel)
64f91a53613aea Michael Trimarchi 2023-12-05  108  {
64f91a53613aea Michael Trimarchi 2023-12-05  109  	struct mipi_dsi_device *dsi = rpanel->dsi;
64f91a53613aea Michael Trimarchi 2023-12-05  110  	struct device *dev = &dsi->dev;
64f91a53613aea Michael Trimarchi 2023-12-05  111  	int i, ret;
64f91a53613aea Michael Trimarchi 2023-12-05  112  
64f91a53613aea Michael Trimarchi 2023-12-05  113  	ret = mipi_dsi_dcs_soft_reset(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  114  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  115  		dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  116  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  117  	}
64f91a53613aea Michael Trimarchi 2023-12-05  118  
64f91a53613aea Michael Trimarchi 2023-12-05  119  	usleep_range(15000, 17000);
64f91a53613aea Michael Trimarchi 2023-12-05  120  
64f91a53613aea Michael Trimarchi 2023-12-05  121  	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  122  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  123  		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  124  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  125  	}
64f91a53613aea Michael Trimarchi 2023-12-05  126  
64f91a53613aea Michael Trimarchi 2023-12-05  127  	for (i = 0; i < rpanel->pdata->init_length; i++) {
64f91a53613aea Michael Trimarchi 2023-12-05  128  		const struct r63353_instr *instr = &rpanel->pdata->init[i];
64f91a53613aea Michael Trimarchi 2023-12-05  129  
64f91a53613aea Michael Trimarchi 2023-12-05  130  		ret = mipi_dsi_dcs_write_buffer(dsi, instr->data, instr->len);
64f91a53613aea Michael Trimarchi 2023-12-05  131  		if (ret < 0)
64f91a53613aea Michael Trimarchi 2023-12-05 @132  			return ret;
64f91a53613aea Michael Trimarchi 2023-12-05  133  	}
64f91a53613aea Michael Trimarchi 2023-12-05  134  
64f91a53613aea Michael Trimarchi 2023-12-05  135  	msleep(120);
64f91a53613aea Michael Trimarchi 2023-12-05  136  
64f91a53613aea Michael Trimarchi 2023-12-05  137  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  138  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  139  		dev_err(dev, "Failed to exit sleep mode (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  140  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  141  	}
64f91a53613aea Michael Trimarchi 2023-12-05  142  
64f91a53613aea Michael Trimarchi 2023-12-05  143  	usleep_range(5000, 10000);
64f91a53613aea Michael Trimarchi 2023-12-05  144  
64f91a53613aea Michael Trimarchi 2023-12-05  145  	ret = mipi_dsi_dcs_set_display_on(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  146  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  147  		dev_err(dev, "Failed to set display ON (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  148  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  149  	}
64f91a53613aea Michael Trimarchi 2023-12-05  150  
64f91a53613aea Michael Trimarchi 2023-12-05  151  	return 0;
64f91a53613aea Michael Trimarchi 2023-12-05  152  
64f91a53613aea Michael Trimarchi 2023-12-05  153  fail:
64f91a53613aea Michael Trimarchi 2023-12-05  154  	gpiod_set_value(rpanel->reset_gpio, 0);
64f91a53613aea Michael Trimarchi 2023-12-05  155  
64f91a53613aea Michael Trimarchi 2023-12-05  156  	return ret;
64f91a53613aea Michael Trimarchi 2023-12-05  157  }
64f91a53613aea Michael Trimarchi 2023-12-05  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
