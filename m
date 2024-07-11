Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D58801
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 01:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720659966; cv=none; b=gzEk8vCE1+8/zlsGWVqb5m21/i8ImyT+VMTfphcypdAp7nXdRKlMy69qM7JiRvqVMKZjRI0B8YnqCVNcXjypMZjH/cEmniz37tU4hHYAoMWEPbbrdA9JRtD7T8CMabIxjcm4a6vVyjtjkuSxFcTt3toerafrQuXLS2qAqTYVRgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720659966; c=relaxed/simple;
	bh=+DWjc1IISHspEKBZIxrVQNZxAMsqiTf3VejRN3Eaq1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FhH/taHdCf6CTp3GxqAeyYV6NABgk0hy6qaIO3UINTe4zNbhUggiq0KvbWwOuX11Kp9GXt7XgYdiXbrW3H2RghVdjca61LTAG/NmO+OKouDLNmFYK8ZcMhS2hCgTRf/yzBnIeOFpG9Twh0FYtf+OqmXQTJGO1D5yfZBWX2pqzqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndZiM2Cm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndZiM2Cm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720659964; x=1752195964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+DWjc1IISHspEKBZIxrVQNZxAMsqiTf3VejRN3Eaq1E=;
  b=ndZiM2CmrPzmT4YNg+RBPft3qkcNzYZZB/N57ausM5UFy1PmM6HrRIt0
   ic3rv/vJKp/n/iZHTaUru7ZZHE/LEDo06Kj7HfN0Yui/SStpzaBVxFTlp
   sH2rwgHU65TL/yRtNlSqzM0J5Z0BEeapeES3rv6J/V1H7mJCsNV6DkjAF
   L29uhxompyOmJEmY4sXCa1gbGh4f/y6XTXtpr7afIy/8xvgcklFdRbAj0
   W3FM/VrnwSFCv9mg3OxrnsXMcipjVqy9O5ei2Np2wBgV3/MDNlqTR59P9
   kXWjU+dlPaDtkPx03XmW4CjTLe4nJQpF7M8QuXaesfV/PqC5+gieCKvk/
   A==;
X-CSE-ConnectionGUID: OsAd3W1IR7q8ip+qM98vOw==
X-CSE-MsgGUID: DCRlHAWrRRSEvcJ9kViCdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17835377"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17835377"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:05:58 -0700
X-CSE-ConnectionGUID: GXsR3Kn5T86HFvUV/IzcLg==
X-CSE-MsgGUID: zlUEqknzRHGWzvejHMitqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="85893178"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jul 2024 18:05:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRiFu-000YZ4-0D;
	Thu, 11 Jul 2024 01:05:54 +0000
Date: Thu, 11 Jul 2024 09:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-2.0.x-imx 11267/11381]
 Documentation/devicetree/bindings/phy/ti,ds125df111.yaml: title: 'TI
 DS125DF111 Retimer PHY binding' should not be valid under {'pattern':
 '([Bb]inding| [Ss]chema)'}
Message-ID: <202407110859.rhACSp9M-lkp@intel.com>
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
commit: 48678b6fd03e459a0000e23fed8ae8f4c664c2d7 [11267/11381] dt-bindings: phy: add PHY bindings for the TI DS125DF111 Retimer PHY
:::::: branch date: 9 hours ago
:::::: commit date: 2 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110859.rhACSp9M-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110859.rhACSp9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110859.rhACSp9M-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/mfd/nxp,imx8ulp-sim.yaml: title: 'NXP i.MX8ulp System Integration Module Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/phy/ti,ds125df111.yaml: title: 'TI DS125DF111 Retimer PHY binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml: ^(DCDC_REG[1-4]|LDO_REG[1-8]|SWITCH_REG[1-2])$: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
