Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749762D321B
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 19:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767987149; cv=none; b=JdTKV3HTstIPjpedA3tV7AGNk+8VvN9ql1TT4NBVxGB/69LMg73DlJyeyy/jedfd3cjJ2RnpxB2GwL4bJtA9/gLHTjGkHvSLVLwCJdlkUdECkqjsdNAqKWDFp7Xq1w3T9jnaAvSFYIVZNVVJFrVd6yto62IG62R6kQKQIUWJx6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767987149; c=relaxed/simple;
	bh=nazNJoVHa0zSrT44/ZW2EcLDLFUNGefAFh+iiCbT+i0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBfX98O99khF0JeZqr5tPHj2jAha+MquEH4/T9E+MAgrJjAUcrAkGZzMhljndKEKnG9ogpmuJ7Zx+dOQqNBOfAKrdH+tORCFRdXnNLLEyrT4si5jBalSzdl38E0fiHqYKOPP7RSylYLcpjI7tfGC3UkwVdy+G1Tln1PA18woQnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqZZhO13; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqZZhO13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767987147; x=1799523147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nazNJoVHa0zSrT44/ZW2EcLDLFUNGefAFh+iiCbT+i0=;
  b=SqZZhO13gRm3FeWdJym4Dl8TNfUs9kCZ4p2mg34VrwnigbBt3wS8ok83
   QJuxcYJ6mjpWQO6MHz3uY3ShwErfFW6kre2tf/CwHqR7qVTdCsH/Ldlwe
   jRP5A6vaQFXYIaVhqZjJFwipeFov8wV7bLkoYzka4lsNzTOAkP2YFPLQa
   juof07CQZ8brFiIXcKwHRyzBc/GqPRg0qDQulX9cFU+oYBTdTSyjYPp3s
   GFR4Efj8vo/L9khmoSXB0Db2YLCXiMvITlTdff59PE4//6XH0uZgQTItD
   lvPyJGe9f4AwOgoCac8ohKXwjVLuzu14948+oPMQvsL8Pv6H0PHf1xCIn
   A==;
X-CSE-ConnectionGUID: 4bPlb5F3TMGruQ4cRQHbPw==
X-CSE-MsgGUID: fYwsc6nuSRyWCHPhe0DyVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80825560"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="80825560"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 11:32:27 -0800
X-CSE-ConnectionGUID: AfsUdQYTRiqOeNU2VubfVw==
X-CSE-MsgGUID: jdZmhkhlRwuIzqwB5oRBYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="202754359"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Jan 2026 11:32:27 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veIDf-0000000028C-3ovI;
	Fri, 09 Jan 2026 19:32:23 +0000
Date: Fri, 9 Jan 2026 20:32:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado
 eMMC PHY
Message-ID: <202601092011.t5B2m6pp-lkp@intel.com>
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
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-1-dd43459dbfea@axiado.com>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-1-dd43459dbfea@axiado.com>
TO: "Tzu-Hao Wei" <twei@axiado.com>
TO: SriNavmani A <srinavmani@axiado.com>
TO: Prasad Bolisetty <pbolisetty@axiado.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: "Tzu-Hao Wei" <twei@axiado.com>

Hi Tzu-Hao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzu-Hao-Wei/dt-bindings-phy-axiado-ax3000-emmc-phy-add-Axiado-eMMC-PHY/20260109-174938
base:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
patch link:    https://lore.kernel.org/r/20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-1-dd43459dbfea%40axiado.com
patch subject: [PATCH 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado eMMC PHY
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: microblaze-randconfig-2051-20260109 (https://download.01.org/0day-ci/archive/20260109/202601092011.t5B2m6pp-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601092011.t5B2m6pp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601092011.t5B2m6pp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml: properties:compatible:const: ['axiado,ax3000-emmc-phy'] is not of type 'integer', 'string'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml: properties:compatible:const: ['axiado,ax3000-emmc-phy'] is not of type 'string'
   	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
