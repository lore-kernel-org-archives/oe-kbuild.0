Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A09BA53
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Feb 2025 03:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739415622; cv=none; b=NrLoQ0wR7jA5vGoqYZ9i+BYAIGQNvCIxVaLCN9/6CrfaR7FgQrNpkJptKqMWr5cKWHFht7+00JDs4lSjf8oAsX6j1RvMijkGzsKOosdtEiPoLRdHHjhuWSDntyqMo3+kpUpRx6wM7xZF4gxaZo1FKnjyUBIRSOuEwM/belLkk3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739415622; c=relaxed/simple;
	bh=okqOEtaZKOZL+eyfLTJKP1VVzutc3uEq69xR9TH9m6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AzVXdlfOjj2jgdUVQ6RGB9nt5kbrw2jd7USgWNhGFiR1J7SEWvclZptildd0hi79HqEtb0MtVETlj7/Z2Hj+ESfiBVBiti+5casFuN9esErDeuKyxBpBl0pUXAtguB1aFdzvwoXcct0w4lB2qF8cyXh8S2sIGhzbPA/reoljQTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7ur89I9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7ur89I9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739415620; x=1770951620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=okqOEtaZKOZL+eyfLTJKP1VVzutc3uEq69xR9TH9m6Q=;
  b=e7ur89I9240Y8xFVdHDOvcUiLyjmWipmFycDUdKk9QnESOZokg4iocXU
   SgGxMRbpmBinpvW5j5CKtRmrrZfgoFyRoilPnpa6TbFUNTGKbo18RHBST
   o5OEfSClyS+ygkfmOvkUR9ncMqTGW0hX/AExJfFctmnn5Gr/QIMnfkoiW
   nls4ytstqA5j0L2cKjZWWbH5fdfgKHicIteDwk7CVHsFOQfyJ7fv2xNRv
   ZXvWSM7TfiwFeepq1iTdijzwqnuJkFIREPE02m/4Pa1NJvl1WutFvsvY5
   uA+bGICAg6yDDThbjnEubj7oUIEVWUi7e6Zm43xVGi5fhyTNYkLeyOdOk
   w==;
X-CSE-ConnectionGUID: zYxidWyCS8+RYriswtQgKg==
X-CSE-MsgGUID: +rHxtEHTSR2Q8p6PTLvW8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51496749"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="51496749"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 19:00:19 -0800
X-CSE-ConnectionGUID: lvE8oPNzQxKealxIGOzwnQ==
X-CSE-MsgGUID: ju7SV3NXSPegp2KllkAOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136256337"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Feb 2025 19:00:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiPSa-0016Qt-20;
	Thu, 13 Feb 2025 03:00:16 +0000
Date: Thu, 13 Feb 2025 10:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <202502131052.8HFnoETf-lkp@intel.com>
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
In-Reply-To: <20250212132227.1348374-1-aman.kumarpandey@nxp.com>
References: <20250212132227.1348374-1-aman.kumarpandey@nxp.com>
TO: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
TO: linux-kernel@vger.kernel.org
TO: linux-i3c@lists.infradead.org
TO: alexandre.belloni@bootlin.com
TO: krzk+dt@kernel.org
TO: robh@kernel.org
TO: conor+dt@kernel.org
TO: devicetree@vger.kernel.org
CC: vikash.bansal@nxp.com
CC: priyanka.jain@nxp.com
CC: shashank.rebbapragada@nxp.com
CC: Frank.Li@nxp.com
CC: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Hi Aman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc2 next-20250212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/drivers-i3c-Add-driver-for-NXP-P3H2x4x-i3c-hub-device/20250212-213659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250212132227.1348374-1-aman.kumarpandey%40nxp.com
patch subject: [PATCH 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: csky-randconfig-051-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131052.8HFnoETf-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131052.8HFnoETf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502131052.8HFnoETf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
