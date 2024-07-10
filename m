Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772916C6B2
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 23:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654975; cv=none; b=nO012RnoNTFkZkgHarlzAZ/sNvSOQlgMByR3EsotOivBCcvpzuZFB+DxXnwO/ZZ7i0Ly3OxnZuhu42IbsOSV/o1D1g0lKsFqm4dmg6vpMXNOXkYjqx2DO5efiVtcMgdv/v9DU5cLLyi54zXXEtmT2pNPKdYSV+H3I4Qx4DX8we8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654975; c=relaxed/simple;
	bh=YeZpoTR8EVcVbWwysuunzUNpHSsinHBilyH6siBMhh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nm7B5BaVGhpYzSGXPNMmdSpt9ql+5s0LrnA+9p2ZRFMdphDH/JQLfNz9nuszHHKDtPMhIjUtIMEGUx/tNyKONEhXL7kf2Qmw0VXnSXhaV/6pgRm4qgM9p7XQhQIwVmI7FtGnyPMgac42hn6ofbfJctUnnrTcQ7h/XeDLe30W/+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRNi0r0n; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRNi0r0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720654974; x=1752190974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YeZpoTR8EVcVbWwysuunzUNpHSsinHBilyH6siBMhh8=;
  b=CRNi0r0nzq5j5jMs7Yh9yUX6uTXXAGkLPnTNYVDBxNgdhe1RBxTPx6bt
   XNUWZg2134HsUdfa046tb03v8Q58fiuie+/gxfXp/1iUbQShz/pteCU91
   N4gLHdKem6uZbHSxn9apTGYnE3gughaX124hTlatqZisQ/g/w/fVMmPIY
   PMiOqp+2sYdF07WWhbndGil2eZNgR5Mfpg9ok9onq7LU6GPjv6BRFWurE
   MFgfdiw2hfwt/1+rFMWU+GWEWPQiGyXt3O7MuxhefzjqEegsqzCHd/yt8
   UPLwW9sqMT7asuMT81SRwpnJ2KjA1ue0bru6jTZxvDkJjrWcg87+VG6Gd
   g==;
X-CSE-ConnectionGUID: PhXEesT5T4Gasm4k58MgaA==
X-CSE-MsgGUID: xmEirXMUTIyJHAHzO97N+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18145347"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="18145347"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 16:42:53 -0700
X-CSE-ConnectionGUID: Q5dO7OuFTACFAUNigA00YA==
X-CSE-MsgGUID: 0IYiwoPXSOqNcpM9TjWHYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="71594979"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jul 2024 16:42:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRgxV-000YRq-1l;
	Wed, 10 Jul 2024 23:42:49 +0000
Date: Thu, 11 Jul 2024 07:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-2.0.x-imx 11214/11381]
 Documentation/devicetree/bindings/regulator/nxp,pf9453-regulator.yaml:
 properties:regulators:patternProperties: '^LDO_SNVS$' should not be valid
 under {'pattern': '^\^[a-zA-Z0-9,\-._#@]+\$$'}
Message-ID: <202407110732.6s7YGJpt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ee366aa641d84d61e265cd4f571394aa4e7d4e6d
commit: 4c5b26423d0380a39034fb950e6875310bd4e5ac [11214/11381] LF-12185-2: regulator: dt-bindings: pf9453: add new PMIC PF9453 support
:::::: branch date: 7 hours ago
:::::: commit date: 2 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110732.6s7YGJpt-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110732.6s7YGJpt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110732.6s7YGJpt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/regulator/nxp,pf9453-regulator.yaml: properties:regulators:patternProperties: '^LDO_SNVS$' should not be valid under {'pattern': '^\^[a-zA-Z0-9,\-._#@]+\$$'}
   hint: Fixed strings belong in 'properties', not 'patternProperties'
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/regulator/nxp,pf9453-regulator.yaml: regulators: Missing additionalProperties/unevaluatedProperties constraint
--
>> Documentation/devicetree/bindings/regulator/nxp,pf9453-regulator.yaml: ^LDO[1-2]$: Missing additionalProperties/unevaluatedProperties constraint
--
>> Documentation/devicetree/bindings/regulator/nxp,pf9453-regulator.yaml: ^LDO_SNVS$: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
