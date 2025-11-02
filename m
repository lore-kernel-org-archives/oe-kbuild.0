Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEBA8C11
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Nov 2025 01:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762045511; cv=none; b=uPc4Zk3Zcz3dVQ0O4xv3cSClB0cB525ZeZAuLEDTrFI60kZ8EIyHeqiA6NlLt1gmGf5U13J2hfU4TkETA4GQWRMenVs7Hk2cyvDaWmKT1sda4Pjnsw6gbfaFuYPIzgfgN78Qi8UUsU9dNTD/Aqh7JwKaBz5fQalTPxfh/VVSy8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762045511; c=relaxed/simple;
	bh=RP/j5gItOJevMdif/nLUPwL2RtC7Rz2XXkl2MNx/avk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NoYa939BDlj6yUh+1+y9C9ASn49kCjo4IkR8/y0hfSUzKhdQYZ2L9sfaxnPEUAbeISSG6/3a1hdfAHMowqHQpOU8RRmZ8LPE8LsrFJNLucF+baa+K49EnAIjPvTq/XQ8/e76xKVvAQaqxGm/dV1qZPCsQ7yhJG/HEptmDfr8oVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXL4IlCs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXL4IlCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762045510; x=1793581510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RP/j5gItOJevMdif/nLUPwL2RtC7Rz2XXkl2MNx/avk=;
  b=WXL4IlCsJWi08ab4UT7WHTjA099NyHdCCakdj8jRBZRNzeGojP+rSztU
   ZkaOS/UU8M/Znrcz7SDLXZD5Y8S9BJdn4u+rBE/C14fQX5VBNyZeWrkAD
   Rl+pRdRxDOQm0Hrf+WPJuvOj6sIbiMPVKTiouPj5Gipstb8OTiRlOpZPz
   Th0Wa0ykYdV17L4TmYD5K2HCebyivffp6DhsaS4FSQ8tltLXSQDa1FMDJ
   6LoLInwC0bCNlybgOdv9nAmS+teOoDEOpY4krb944c94Pg8iOS2NWJDnY
   FfQFtKO7Z303la0wPLHXkUEPFmezhmiLt7YnpfA9FwcCHCjpM4OfR4s5I
   g==;
X-CSE-ConnectionGUID: O9uNp18WQbKYmPF6ihmigQ==
X-CSE-MsgGUID: vFkMroADTfqT4tWp+3L/Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="74459109"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="74459109"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 18:05:06 -0700
X-CSE-ConnectionGUID: 0Uaw1I1xR+uphy77zGeWEw==
X-CSE-MsgGUID: pRLJD18yRfm9ssbgI6o5vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186502443"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2025 18:05:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFMWk-000OrI-0d;
	Sun, 02 Nov 2025 01:05:02 +0000
Date: Sun, 2 Nov 2025 09:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 32/32] drm/vkms: Introduce configfs for dynamic
 connector creation
Message-ID: <202511020805.EYA4N7yV-lkp@intel.com>
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
In-Reply-To: <20251029-vkms-all-config-v2-32-be20b9bf146e@bootlin.com>
References: <20251029-vkms-all-config-v2-32-be20b9bf146e@bootlin.com>
TO: Louis Chauvet <louis.chauvet@bootlin.com>
TO: Haneen Mohammed <hamohammed.sa@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Melissa Wen <melissa.srw@gmail.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: jose.exposito89@gmail.com
TO: Jonathan Corbet <corbet@lwn.net>
CC: victoria@system76.com
CC: sebastian.wick@redhat.com
CC: thomas.petazzoni@bootlin.com
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: Louis Chauvet <louis.chauvet@bootlin.com>

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 57fe8285dc4764171fa9eb1f153cae3bb313d6fc]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-drm_mode_config-Add-helper-to-get-plane-type-name/20251030-023647
base:   57fe8285dc4764171fa9eb1f153cae3bb313d6fc
patch link:    https://lore.kernel.org/r/20251029-vkms-all-config-v2-32-be20b9bf146e%40bootlin.com
patch subject: [PATCH v2 32/32] drm/vkms: Introduce configfs for dynamic connector creation
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020805.EYA4N7yV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511020805.EYA4N7yV-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:1409 connector_enabled_store() warn: inconsistent returns '&connector->dev->lock'.

Old smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:226 make_crtc_group() error: dereferencing freed memory 'crtc' (line 225)
drivers/gpu/drm/vkms/vkms_configfs.c:986 make_plane_group() error: dereferencing freed memory 'plane' (line 985)
drivers/gpu/drm/vkms/vkms_configfs.c:1100 make_encoder_group() error: dereferencing freed memory 'encoder' (line 1099)
drivers/gpu/drm/vkms/vkms_configfs.c:1577 make_connector_group() error: dereferencing freed memory 'connector' (line 1576)
drivers/gpu/drm/vkms/vkms_configfs.c:1693 make_device_group() error: dereferencing freed memory 'dev' (line 1692)

vim +1409 drivers/gpu/drm/vkms/vkms_configfs.c

6dc93929c68749 Louis Chauvet 2025-10-29  1360  
6dc93929c68749 Louis Chauvet 2025-10-29  1361  static ssize_t connector_enabled_store(struct config_item *item,
6dc93929c68749 Louis Chauvet 2025-10-29  1362  				       const char *page, size_t count)
6dc93929c68749 Louis Chauvet 2025-10-29  1363  {
6dc93929c68749 Louis Chauvet 2025-10-29  1364  	struct vkms_configfs_connector *connector;
6dc93929c68749 Louis Chauvet 2025-10-29  1365  	struct vkms_config_connector *connector_cfg;
6dc93929c68749 Louis Chauvet 2025-10-29  1366  	bool enabled, was_enabled;
6dc93929c68749 Louis Chauvet 2025-10-29  1367  
6dc93929c68749 Louis Chauvet 2025-10-29  1368  	connector = connector_item_to_vkms_configfs_connector(item);
6dc93929c68749 Louis Chauvet 2025-10-29  1369  	connector_cfg = connector->config;
6dc93929c68749 Louis Chauvet 2025-10-29  1370  
6dc93929c68749 Louis Chauvet 2025-10-29  1371  	if (kstrtobool(page, &enabled))
6dc93929c68749 Louis Chauvet 2025-10-29  1372  		return -EINVAL;
6dc93929c68749 Louis Chauvet 2025-10-29  1373  	scoped_guard(mutex, &connector->dev->lock) {
6dc93929c68749 Louis Chauvet 2025-10-29  1374  		if (!connector->dev->enabled) {
6dc93929c68749 Louis Chauvet 2025-10-29  1375  			vkms_config_connector_set_enabled(connector_cfg, enabled);
6dc93929c68749 Louis Chauvet 2025-10-29  1376  		} else {
6dc93929c68749 Louis Chauvet 2025-10-29  1377  			// Only dynamic connector can be enabled/disabled at runtime
6dc93929c68749 Louis Chauvet 2025-10-29  1378  			if (!connector_cfg->dynamic)
6dc93929c68749 Louis Chauvet 2025-10-29  1379  				return -EBUSY;
6dc93929c68749 Louis Chauvet 2025-10-29  1380  
6dc93929c68749 Louis Chauvet 2025-10-29  1381  			was_enabled = vkms_config_connector_is_enabled(connector_cfg);
6dc93929c68749 Louis Chauvet 2025-10-29  1382  			vkms_config_connector_set_enabled(connector_cfg, enabled);
6dc93929c68749 Louis Chauvet 2025-10-29  1383  
6dc93929c68749 Louis Chauvet 2025-10-29  1384  			// Resulting configuration is invalid (missing encoder for example)
6dc93929c68749 Louis Chauvet 2025-10-29  1385  			// Early return to avoid drm core issue
6dc93929c68749 Louis Chauvet 2025-10-29  1386  			if (!vkms_config_is_valid(connector->dev->config)) {
6dc93929c68749 Louis Chauvet 2025-10-29  1387  				count = -EINVAL;
6dc93929c68749 Louis Chauvet 2025-10-29  1388  				goto rollback;
6dc93929c68749 Louis Chauvet 2025-10-29  1389  			}
6dc93929c68749 Louis Chauvet 2025-10-29  1390  
6dc93929c68749 Louis Chauvet 2025-10-29  1391  			if (!was_enabled && enabled) {
6dc93929c68749 Louis Chauvet 2025-10-29  1392  				// Adding the connector
6dc93929c68749 Louis Chauvet 2025-10-29  1393  				connector_cfg->connector = vkms_connector_hot_add(connector->dev->config->dev,
6dc93929c68749 Louis Chauvet 2025-10-29  1394  										  connector_cfg);
6dc93929c68749 Louis Chauvet 2025-10-29  1395  				if (IS_ERR(connector_cfg->connector)) {
6dc93929c68749 Louis Chauvet 2025-10-29  1396  					count = PTR_ERR(connector_cfg->connector);
6dc93929c68749 Louis Chauvet 2025-10-29  1397  					goto rollback;
6dc93929c68749 Louis Chauvet 2025-10-29  1398  				}
6dc93929c68749 Louis Chauvet 2025-10-29  1399  			} else if (was_enabled && !enabled) {
6dc93929c68749 Louis Chauvet 2025-10-29  1400  				vkms_connector_hot_remove(connector->dev->config->dev,
6dc93929c68749 Louis Chauvet 2025-10-29  1401  							  connector_cfg->connector);
6dc93929c68749 Louis Chauvet 2025-10-29  1402  			}
6dc93929c68749 Louis Chauvet 2025-10-29  1403  		}
6dc93929c68749 Louis Chauvet 2025-10-29  1404  	}
6dc93929c68749 Louis Chauvet 2025-10-29  1405  	return count;
6dc93929c68749 Louis Chauvet 2025-10-29  1406  
6dc93929c68749 Louis Chauvet 2025-10-29  1407  rollback:
6dc93929c68749 Louis Chauvet 2025-10-29  1408  	vkms_config_connector_set_enabled(connector_cfg, was_enabled);
6dc93929c68749 Louis Chauvet 2025-10-29 @1409  	return count;
6dc93929c68749 Louis Chauvet 2025-10-29  1410  }
6dc93929c68749 Louis Chauvet 2025-10-29  1411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
