Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3172535A39D
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 07:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646233; cv=none; b=mZ5MdxGM8ZF3cVGQTK6NoTP9mwKPfxCOQg8CD/tIpbIlbd+q8fR3KtZG7oaxsT+RajOHpzVtxiM4rIjT6P3wbfsb94dCye2OSQL6I2/pbT3txQFD2Qf5XT/oUPs/OuONQl4YZ0AP/yCSXlG+K9gmCZxKyfVYB8XAicIS95vXZTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646233; c=relaxed/simple;
	bh=jA5Y4RCe1MyIZxYyyXZg331bk4ASp7WIO6gIcrSG0V0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jmSjcoeHOi7HpZA0UcdsvIHsy8osnml55tDZ+XNTA/Zh/fGFEQuDrFoJ5AhhxidsGzx/R2sFFdHnfQyacZcRx1t2IHYkjSR2rM5v+yg0sVG6v3vKHonjqysUOZuippDkSaoAx2v6pThqWwliw1t3Kby1x5CkHTNTE5FO9Ztuolo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faaMeQYs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faaMeQYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780646233; x=1812182233;
  h=date:from:to:cc:subject:message-id;
  bh=jA5Y4RCe1MyIZxYyyXZg331bk4ASp7WIO6gIcrSG0V0=;
  b=faaMeQYsJJgz/SjJK8St+91Y87kY+vFwuXGTCdYGQEAnc4EJzqxRrj28
   8uwqgVXdwly4WfzvmJ03TseH5zpiLJK0ZvMxauywAs8eCoghznxBQYgoR
   V9TPWYHT9KxhgUgKml9ORhMsN5H5i7N5gLDq8NqQ9iwsfKayE6FXpBq4s
   /aw89UdVncvlCLg7Z6Vp5+wP0jFUwH6AuPPE7YilrC/A88/jkbSgjMYsq
   7ySchmA7SrPVSGW1U7Nt3dob6k9k6lkOFVFYZgkZeR23GCOf/eRtCIBTX
   ZvPJNs8CMi2NEzTrDMuNgpS7aq9ozb/WzJzdmD1DEKs9KRB+0hhV0VdXu
   g==;
X-CSE-ConnectionGUID: fDmQxmXURCGiRJVfmitzXA==
X-CSE-MsgGUID: X6X7ZlhJSf684H3igDdT3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98897373"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="98897373"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:57:12 -0700
X-CSE-ConnectionGUID: GtbsUfMkQqa9QO2vt6yHbQ==
X-CSE-MsgGUID: oDZAs+Z0RXW4AyaUwKHArg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="240328683"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2026 00:57:11 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVPQS-000000002Vp-47tS;
	Fri, 05 Jun 2026 07:57:08 +0000
Date: Fri, 05 Jun 2026 09:56:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml: gpio:
 Missing additionalProperties/unevaluatedProperties constraint
Message-ID: <202606050941.c6VMNIGV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Thompson <daniel@riscstar.com>
CC: 0day robot <lkp@intel.com>
CC: Alex Elder <elder@riscstar.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-net-qca-qca808x-Add-regulator-properties/20260605-091912
head:   a2cf643cd5401eea03d3f1a49d81e7d066ae6047
commit: b6d9c722ce11c43b1e14ca3a15d993e470299502 dt-bindings: net: toshiba,tc9654-dwmac: add TC9564 Ethernet bridge
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: microblaze-randconfig-2052-20260605 (https://download.01.org/0day-ci/archive/20260605/202606050941.c6VMNIGV-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050941.c6VMNIGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606050941.c6VMNIGV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml: gpio: Missing additionalProperties/unevaluatedProperties constraint
>> Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml: ethernet: Missing additionalProperties/unevaluatedProperties constraint
   Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml: properties:phy-select:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
