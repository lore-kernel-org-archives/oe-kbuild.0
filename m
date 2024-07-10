Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548A319538B
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720640326; cv=none; b=FXfPKeUaDAsMZdEBRMcvUNTvELMSM8z5IcWtog7FiLC+EOwb9iggUUi5gW/GkJ8/j+ptSROw9tYOLx6tqv7+Fojltti75ivBzCL4jxTK8QUviYZ9G5/jXTlgzs9ON0JPfnTwsVYqqzFI0Qtfi5sF8ezRcm0AfKuiSimp+Osx65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720640326; c=relaxed/simple;
	bh=ScYGqfoKQ3JOkg6FbYVBAGAIFs0goDZZ6+V1n0N+MoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FvOZkp6Flwz5qqGImugTtejUoCcjUceYJ5KdI9SfmRAWgOJivmzrpJYg2fdkrdot/7cU9zb9VgGKtxVzy6iA69QgVUUPnkJGp3D86TVj6I3C53GE5mv0xTJaRoxV2s9PNgJpTS3UaeZXYjgszeRnmNazA1UjpxHhmxLlvjz+NmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nb8qfb4z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nb8qfb4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720640324; x=1752176324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ScYGqfoKQ3JOkg6FbYVBAGAIFs0goDZZ6+V1n0N+MoQ=;
  b=Nb8qfb4znbfmwuAyHNlleigASM32bmldlqHSp0ncrONQwiajz6cjmieg
   Il9Xerkw6q+6bOidvTwVM3VOnlCFyUXVEnyjDHMMJjDqNwJX+tlSSE2Hm
   WWCEvWwaaqRxHtMTSSsvmZH4ZgBXI2KFS3Oovji1IA3ON7w/3fcY2ecSr
   fSIcqDhwbxya6/cvQcjYQA9fSO02OOhqU/wj9Wm1OK1pLEtz6mJ/JkrXD
   7BthFEfuGN8cWk4NGmA39/Krh9eu9C7gf93kRG77mAg/fCG2XarEkIlqD
   9TqZyjtgjigJwvgFOgCawAl5cRlbJ5lGZ4xbwWdfaDwiHJiUjST1YvFyG
   w==;
X-CSE-ConnectionGUID: 4L2eXMpFQ2esPr+ni5XSUw==
X-CSE-MsgGUID: tPBwsK+ATSmJPcVmK5j+Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17933992"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17933992"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:38:43 -0700
X-CSE-ConnectionGUID: YFBFsR2hT9eq10VE+CmxkQ==
X-CSE-MsgGUID: fFXVNIjTS8WvuiYebGUPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="52713158"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2024 12:38:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRd9E-000YE0-16;
	Wed, 10 Jul 2024 19:38:40 +0000
Date: Thu, 11 Jul 2024 03:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-1.0.x-imx 3473/11740]
 Documentation/devicetree/bindings/phy/fsl,imx8mp-lvds-phy.yaml: port@0:
 Missing additionalProperties/unevaluatedProperties constraint
Message-ID: <202407110359.6EPJ9ANz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/phy/fsl,imx8mp-lvds-phy.yaml: port@0: Missing additionalProperties/unevaluatedProperties constraint"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   13ed4e83694299049a3d4449fdb61471292ef19b
commit: 1deece590adeda0de30270d217597a921831f853 [3473/11740] MLK-23252-5 dt-bindings: phy: Add binding for Freescale i.MX8mp LVDS PHY
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: csky-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110359.6EPJ9ANz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110359.6EPJ9ANz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110359.6EPJ9ANz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/phy/fsl,imx8mp-lvds-phy.yaml: title: 'Freescale i.MX8MP LVDS PHY Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/phy/fsl,imx8mp-lvds-phy.yaml: port@0: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
