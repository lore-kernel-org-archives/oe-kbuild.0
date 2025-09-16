Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3445E286435
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 05:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758000349; cv=none; b=rrU/ygY7Qw4lC/IfVvTKWFwWqyMaTBsGdI3WCPWlYYXTEZh38voI3wXSMClFH1MlAXA0Nx4z23v8M0eqgiDASbiRn/57si/D3oXFZ23fpWwGbdQPP9e8amkvoLtLWKybe0Fy+ZCjN9/2Q3qsJ5KG77K3jaX7QvHODB6zwQEzFI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758000349; c=relaxed/simple;
	bh=9v2PbL51iUi5Dfdg6tAHaBe0qV5wXBTCTgBAnlmmDMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p1BzGHBWSpeiZ3ImhCzHKOqckzN1usyc+efgqDSVOxKTkmDBR9mvSvZiXGIAZPzm7gfi4O+LgpbznIzlLwAWy8/itBKjgtJ/zIazGpBvROQx0CWOSEmDmQyk/zjsMM2r1EOhRP9Bu7Hc42EZ2SlNmfXdaqp3gMHm6MhY5Fpm7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXoRqw8b; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXoRqw8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758000347; x=1789536347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9v2PbL51iUi5Dfdg6tAHaBe0qV5wXBTCTgBAnlmmDMY=;
  b=EXoRqw8buz0xuhTcl9AXr1b0nQ86ZldZpYpKQOgBvA8dYnsFIn13fX3f
   vR1J9r/9Dz7ZmmmVNki6pWpdEhmJWAQKNQDuDy5i0ZpEQguZfkix97MJT
   ah4blHdQup2ne5QKi5ytpivC0pAOI1u7DkZghDyLkl98BaKN+60wpfx7K
   KiGRFQlHCSjlZTSA0J+yEb4E5QKRpZPMmE5qKSC/fAoSSd3Kd/v9VPsCw
   925BUhwqs0/e/p3D/niITxlTXrVBoWo7LG2RhcpLTYoLcOWdWWYmrUFuM
   941MEcwdmmcICRGY2IaQckZlrwUr4OrnV3341L8+RoSo+65piCEOOvhAt
   A==;
X-CSE-ConnectionGUID: swxSICYaTGawrm/1sp19pw==
X-CSE-MsgGUID: fNwUwBCUSZyw+FrHUZnFpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59491734"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="59491734"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 22:25:46 -0700
X-CSE-ConnectionGUID: JfBuQr2SRxif6AVA0ZPobQ==
X-CSE-MsgGUID: ZRvT4KDlTWecXK8LZsN+9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="174445131"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2025 22:25:45 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyOCE-000111-2o;
	Tue, 16 Sep 2025 05:25:42 +0000
Date: Tue, 16 Sep 2025 13:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
Message-ID: <202509161344.FPfsjq01-lkp@intel.com>
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
In-Reply-To: <20250910183353.2045339-1-john.ripple@keysight.com>
References: <20250910183353.2045339-1-john.ripple@keysight.com>
TO: John Ripple <john.ripple@keysight.com>
TO: john.ripple@keysight.com
CC: Laurent.pinchart@ideasonboard.com
CC: airlied@gmail.com
CC: andrzej.hajda@intel.com
CC: blake.vermeer@keysight.com
CC: dianders@chromium.org
CC: dri-devel@lists.freedesktop.org
CC: jernej.skrabec@gmail.com
CC: jonas@kwiboo.se
CC: linux-kernel@vger.kernel.org
CC: maarten.lankhorst@linux.intel.com
CC: matt_laubhan@keysight.com
CC: mripard@kernel.org
CC: neil.armstrong@linaro.org
CC: rfoss@kernel.org
CC: simona@ffwll.ch
CC: tzimmermann@suse.de

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.17-rc6 next-20250915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20250911-023707/John-Ripple/drm-bridge-ti-sn65dsi86-break-probe-dependency-loop/20250820-235209
base:   linus/master
patch link:    https://lore.kernel.org/r/20250910183353.2045339-1-john.ripple%40keysight.com
patch subject: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161344.FPfsjq01-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509161344.FPfsjq01-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/ti-sn65dsi86.c:1385 ti_sn_bridge_interrupt() error: uninitialized symbol 'status'.

vim +/status +1385 drivers/gpu/drm/bridge/ti-sn65dsi86.c

982f589bde7a7f Stephen Boyd 2020-11-02  1364  
b8670cf7e6a41b John Ripple  2025-09-10  1365  static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
b8670cf7e6a41b John Ripple  2025-09-10  1366  {
b8670cf7e6a41b John Ripple  2025-09-10  1367  	struct ti_sn65dsi86 *pdata = private;
b8670cf7e6a41b John Ripple  2025-09-10  1368  	struct drm_device *dev = pdata->bridge.dev;
b8670cf7e6a41b John Ripple  2025-09-10  1369  	u8 status;
b8670cf7e6a41b John Ripple  2025-09-10  1370  	int ret;
b8670cf7e6a41b John Ripple  2025-09-10  1371  	bool hpd_event = false;
b8670cf7e6a41b John Ripple  2025-09-10  1372  
b8670cf7e6a41b John Ripple  2025-09-10  1373  	mutex_lock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1374  	if (!pdata->hpd_enabled) {
b8670cf7e6a41b John Ripple  2025-09-10  1375  		mutex_unlock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1376  		return IRQ_HANDLED;
b8670cf7e6a41b John Ripple  2025-09-10  1377  	}
b8670cf7e6a41b John Ripple  2025-09-10  1378  
b8670cf7e6a41b John Ripple  2025-09-10  1379  	ret = ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
b8670cf7e6a41b John Ripple  2025-09-10  1380  	if (ret)
b8670cf7e6a41b John Ripple  2025-09-10  1381  		pr_err("Failed to read IRQ status: %d\n", ret);
b8670cf7e6a41b John Ripple  2025-09-10  1382  	else
b8670cf7e6a41b John Ripple  2025-09-10  1383  		hpd_event = status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
b8670cf7e6a41b John Ripple  2025-09-10  1384  
b8670cf7e6a41b John Ripple  2025-09-10 @1385  	if (status) {
b8670cf7e6a41b John Ripple  2025-09-10  1386  		drm_dbg(dev, "(SN_IRQ_STATUS_REG = %#x)\n", status);
b8670cf7e6a41b John Ripple  2025-09-10  1387  		ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
b8670cf7e6a41b John Ripple  2025-09-10  1388  		if (ret)
b8670cf7e6a41b John Ripple  2025-09-10  1389  			pr_err("Failed to clear IRQ status: %d\n", ret);
b8670cf7e6a41b John Ripple  2025-09-10  1390  	} else {
b8670cf7e6a41b John Ripple  2025-09-10  1391  		mutex_unlock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1392  		return IRQ_NONE;
b8670cf7e6a41b John Ripple  2025-09-10  1393  	}
b8670cf7e6a41b John Ripple  2025-09-10  1394  
b8670cf7e6a41b John Ripple  2025-09-10  1395  	/* Only send the HPD event if we are bound with a device. */
b8670cf7e6a41b John Ripple  2025-09-10  1396  	if (dev && hpd_event)
b8670cf7e6a41b John Ripple  2025-09-10  1397  		drm_kms_helper_hotplug_event(dev);
b8670cf7e6a41b John Ripple  2025-09-10  1398  	mutex_unlock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1399  
b8670cf7e6a41b John Ripple  2025-09-10  1400  	return IRQ_HANDLED;
b8670cf7e6a41b John Ripple  2025-09-10  1401  }
b8670cf7e6a41b John Ripple  2025-09-10  1402  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
