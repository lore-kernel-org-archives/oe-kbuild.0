Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7E522B8B6
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Aug 2025 02:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755656751; cv=none; b=RPCPg+u7lI3S+d6TpWDkZrBbtlP1V9gtelG6/0TjpU3tRQhjFpa/8IQxoOr/CGTiXZJmGMD8VcyV5vpHgkzmiTTXTK3jogPACjn5xQzE76fKjsPp/QsBznDp9x1At7/8yTmLrmE/PvZTYDyvDOLCyVlkPG0d/f+vt1ipOFkoadA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755656751; c=relaxed/simple;
	bh=4mLO2tAwwrLnmW38FnIYDiJwRNaK5z5SsLrKLNgByd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thzwySfrYZPpwUHTEpH9J60R/pCP6+RckEJqvtLfPrUs2nzR4nSwDnaHCfi0x9WE/zh5CAxO7M13N+N8smqFeTp0Yywujm2wGt2U/qE7tDFztqLqqqFtqUD1Y9AGnxQduXspuxEMu6ua2W/zSNsyALBg7THYiVZl3aXGCaRzdog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjPiTE7P; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjPiTE7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755656749; x=1787192749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4mLO2tAwwrLnmW38FnIYDiJwRNaK5z5SsLrKLNgByd0=;
  b=VjPiTE7P80v++yYHFAmCaJKlmw71a7yCbX7PhWb+1SSoPIIM7dGlWNI2
   WWMF4OPWhQcKG+IC7/38wc1BIu6PqrIl3dRSmrcLzUQ3YNJhfY6zpb3ue
   kMhVqDHdl+D4ckJ2tv+MlCQIv8Fe5PfVR9WuhUVk/KUWBTJIiIaNWYRZV
   A1vOHd7ji1YLhxocy99Uw1kLS9Z6vlp6m3wq3chbMvokcv/6lAlPTyK9W
   wbnp3JAm/SkXjl8i92GE/2zEgyQ3uoQCEjHriMU2gnvbI4IdNUUqgfQQK
   Y4uUfXGVaPnzz5SwYdGJyQ2oSKjGPHby6A1ijfsDYEx7XMHSrmaIzpJ19
   Q==;
X-CSE-ConnectionGUID: zFp5FKyKTUGt8Yo/xdWMPQ==
X-CSE-MsgGUID: Sk/jkb+nQSGoSFlTQCHkTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57776273"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57776273"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 19:25:49 -0700
X-CSE-ConnectionGUID: KZs5pbevQBexRMVc/CtbqQ==
X-CSE-MsgGUID: y3Cp7aB0QD+AiqVoLSSNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167967269"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 Aug 2025 19:25:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoYVg-000HyF-0f;
	Wed, 20 Aug 2025 02:25:17 +0000
Date: Wed, 20 Aug 2025 10:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v3 3/5] dpll: zl3073x: Add firmware loading
 functionality
Message-ID: <202508200929.zEY4ejFt-lkp@intel.com>
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
In-Reply-To: <20250813174408.1146717-4-ivecera@redhat.com>
References: <20250813174408.1146717-4-ivecera@redhat.com>
TO: Ivan Vecera <ivecera@redhat.com>
TO: netdev@vger.kernel.org
CC: Jiri Pirko <jiri@resnulli.us>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Prathosh Satish <Prathosh.Satish@microchip.com>
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Michal Schmidt <mschmidt@redhat.com>
CC: Petr Oros <poros@redhat.com>
CC: Przemek Kitszel <przemyslaw.kitszel@intel.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/dpll-zl3073x-Add-functions-to-access-hardware-registers/20250814-014831
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250813174408.1146717-4-ivecera%40redhat.com
patch subject: [PATCH net-next v3 3/5] dpll: zl3073x: Add firmware loading functionality
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: xtensa-randconfig-r073-20250819 (https://download.01.org/0day-ci/archive/20250820/202508200929.zEY4ejFt-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508200929.zEY4ejFt-lkp@intel.com/

smatch warnings:
drivers/dpll/zl3073x/fw.c:239 zl3073x_fw_component_load() warn: potential user controlled sizeof overflow 'count * 4' '0-u32max * 4'

vim +239 drivers/dpll/zl3073x/fw.c

cd5cfd9ddd76800 Ivan Vecera 2025-08-13  183  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  184  /**
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  185   * zl3073x_fw_component_load - Load component from firmware source
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  186   * @zldev: zl3073x device structure
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  187   * @pcomp: pointer to loaded component
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  188   * @psrc: data pointer to load component from
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  189   * @psize: remaining bytes in buffer
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  190   * @extack: netlink extack pointer to report errors
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  191   *
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  192   * The function allocates single firmware component and loads the data from
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  193   * the buffer specified by @psrc and @psize. Pointer to allocated component
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  194   * is stored in output @pcomp. Source data pointer @psrc and remaining bytes
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  195   * @psize are updated accordingly.
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  196   *
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  197   * Return:
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  198   * * 1 when component was allocated and loaded
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  199   * * 0 when there is no component to load
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  200   * * <0 on error
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  201   */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  202  static ssize_t
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  203  zl3073x_fw_component_load(struct zl3073x_dev *zldev,
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  204  			  struct zl3073x_fw_component **pcomp,
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  205  			  const char **psrc, size_t *psize,
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  206  			  struct netlink_ext_ack *extack)
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  207  {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  208  	const struct zl3073x_fw_component_info *info;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  209  	struct zl3073x_fw_component *comp = NULL;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  210  	struct device *dev = zldev->dev;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  211  	enum zl3073x_fw_component_id id;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  212  	char buf[32], name[16];
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  213  	u32 count, size, *dest;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  214  	int pos, rc;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  215  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  216  	/* Fetch image name and size from input */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  217  	strscpy(buf, *psrc, min(sizeof(buf), *psize));
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  218  	rc = sscanf(buf, "%15s %u %n", name, &count, &pos);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  219  	if (!rc) {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  220  		/* No more data */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  221  		return 0;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  222  	} else if (rc == 1) {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  223  		ZL3073X_FW_ERR_MSG(zldev, extack, "invalid component size");
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  224  		return -EINVAL;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  225  	}
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  226  	*psrc += pos;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  227  	*psize -= pos;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  228  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  229  	dev_dbg(dev, "Firmware component '%s' found\n", name);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  230  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  231  	id = zl3073x_fw_component_id_get(name);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  232  	if (id == ZL_FW_COMPONENT_INVALID) {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  233  		ZL3073X_FW_ERR_MSG(zldev, extack, "unknown component type '%s'",
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  234  				   name);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  235  		return -EINVAL;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  236  	}
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  237  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  238  	info = &component_info[id];
cd5cfd9ddd76800 Ivan Vecera 2025-08-13 @239  	size = count * sizeof(u32); /* get size in bytes */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  240  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  241  	/* Check image size validity */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  242  	if (size > component_info[id].max_size) {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  243  		ZL3073X_FW_ERR_MSG(zldev, extack,
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  244  				   "[%s] component is too big (%u bytes)\n",
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  245  				   info->name, size);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  246  		return -EINVAL;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  247  	}
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  248  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  249  	dev_dbg(dev, "Indicated component image size: %u bytes\n", size);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  250  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  251  	/* Alloc component */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  252  	comp = zl3073x_fw_component_alloc(size);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  253  	if (!comp) {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  254  		ZL3073X_FW_ERR_MSG(zldev, extack, "failed to alloc memory");
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  255  		return -ENOMEM;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  256  	}
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  257  	comp->id = id;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  258  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  259  	/* Load component data from firmware source */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  260  	for (dest = comp->data; count; count--, dest++) {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  261  		strscpy(buf, *psrc, min(sizeof(buf), *psize));
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  262  		rc = sscanf(buf, "%x %n", dest, &pos);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  263  		if (!rc)
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  264  			goto err_data;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  265  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  266  		*psrc += pos;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  267  		*psize -= pos;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  268  	}
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  269  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  270  	*pcomp = comp;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  271  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  272  	return 1;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  273  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  274  err_data:
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  275  	ZL3073X_FW_ERR_MSG(zldev, extack, "[%s] invalid or missing data",
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  276  			   info->name);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  277  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  278  	zl3073x_fw_component_free(comp);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  279  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  280  	return -ENODATA;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  281  }
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  282  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
