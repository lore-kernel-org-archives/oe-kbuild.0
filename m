Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9412E6CC8
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169773; cv=none; b=HA8m1Fkxtb76Lv4pH+OEWeVTdZnAlwwkFsoMfMThr28SpWKcDRUotKb6iNL9p6x78TpRHlb0MlxYQVeiV6wKy8exTZkvOATlqZr+DfGOa95EsRbSRo+wxd1ggK8IzOnedV0EdFwku8/Q8rCLiiS51jSoI93/NjjT5N/vGGZqlYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169773; c=relaxed/simple;
	bh=sDJJt4WIHztQyirsrT/HxAnsOuKVeg1GnYcDKEbWveg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=INUwTfahZjHzmnVf074Ex5Lu32ZegpNvnvybAxrvrN4u/XYlB7mRZXY/i2tGQOB17Hw7faJ0zoRMjVYwjTs1yMlZbtQtJexGA6nNQEOWPU+K+7kPXy+1pmQvLyQ2blS/cezDDHNbGiCtcwSnlaxK6XM7+S2bVWELmP24Y+Lhh84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCOa+MLc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCOa+MLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781169772; x=1812705772;
  h=date:from:to:cc:subject:message-id;
  bh=sDJJt4WIHztQyirsrT/HxAnsOuKVeg1GnYcDKEbWveg=;
  b=hCOa+MLcETV84GR8TILil8PBFysKnAHv2dh9h+kQnypGrEJiM3Z7yCkv
   uGg+lSxXoidohAQA7ep4UVsRPLSF6lD1SXwtQDudqWI70fexsh5bbgJSQ
   YlNI6CscgPdvdaUBIsWkL84kdb3Zfr2XTqWOFltkckKpxPxM7AwnKZd/0
   xTrb4n5aLkFTbEcJRSGO3CN8Eo4Z5OCLcoCD50cMRDhDJEnapS99PXEzb
   ErAOypy81qgh9jCKCtYLjrYAoF6e2nRryFkiLOfhQImUkViOoeU7eH9d8
   zI2ItmDLusUKxbSlRXYJ/BhPDm4UY4mmXwbAIOXLRCfwr+XpVBnfKXByZ
   w==;
X-CSE-ConnectionGUID: WupFW5cXQnqLPE54lOfJHQ==
X-CSE-MsgGUID: rKu0NPhkRCOjCZkaMhxBag==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82085722"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82085722"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 02:22:51 -0700
X-CSE-ConnectionGUID: HHokwFA8TWmputWkVdpRPQ==
X-CSE-MsgGUID: mrXNdJkLTGCDfM4PE42YIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="250713021"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 02:22:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXbcd-000000003zJ-410h;
	Thu, 11 Jun 2026 09:22:47 +0000
Date: Thu, 11 Jun 2026 11:22:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peter-chen-usb:cdns3_kconfig_reorg 3/4]
 Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml: ignoring, error
 parsing file
Message-ID: <202606111133.TIWXziJC-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Peter Chen <peter.chen@cixtech.com>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git cdns3_kconfig_reorg
head:   92f1268518fcc084e175fdfeeadc03f0b9d125f2
commit: 1acd0c6d0cb1ec8d8dc76b7e0f96fc72f5d9757f [3/4] dt-bindings: usb: add CIX Sky1 Cadence USB3 controller
:::::: branch date: 32 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052 (https://download.01.org/0day-ci/archive/20260611/202606111133.TIWXziJC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111133.TIWXziJC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606111133.TIWXziJC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/usb/cix,sky1-cdns3.example.dts] Error 1
   make[3]: *** Deleting file 'Documentation/devicetree/bindings/usb/cix,sky1-cdns3.example.dts'
   make[3]: Target 'dt_binding_check' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml: ignoring, error parsing file
--
   Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml:150:1: found character '\t' that cannot start any token
   Documentation/devicetree/bindings/net/qcom,ipa.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/net/qcom,ipa.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
--
>> Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml:150:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml:150:1: found character '\t' that cannot start any token

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
