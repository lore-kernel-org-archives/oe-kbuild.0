Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363F23ABA8
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 05:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781241667; cv=none; b=DnLC7jCo5x7TZWk73CndrFio4bJ/9XfBQnWi6CsxTn3OBTXT494a9RM28piYN0aa7sreXGXbFvy+zZc5T+3plDE6vUc8/ms7rLOqO6FGkboBldRC+4VT7J7bx991eQMrF5uh9nEO+o0rP2AMFVnfLPtEYkkFqlSV7iTx5TR4Gf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781241667; c=relaxed/simple;
	bh=uqqplr01VlCvLeUSEO/+2122M6YWglhYvnDC0nL5igw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ul+/xI5CHdZsPYedxnoVrHo8C065HDNnxb6kmzj21t4+7Bn52hUcl70TdqAvqY9fMmH9466Jgm5r3kKqG/cVSduD6/HzSPuHQ2ewshSu0OwJaD0+WQriZVk9XbdDielfNE/EREiUsYm7oNtHcQAU5AmH2/p6TYiRZTfug43LrcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTbDVlem; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTbDVlem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781241665; x=1812777665;
  h=date:from:to:cc:subject:message-id;
  bh=uqqplr01VlCvLeUSEO/+2122M6YWglhYvnDC0nL5igw=;
  b=VTbDVlemf3F6PuH3R9dtWKI5lvf9LNcxy3KnrlYhX5oxATpg2aUj0aSh
   s62E1OCSxidGfFzeL8wG6YkNNSWAPZJrgC83qbHO48foQ0Wr27Sp5EfCQ
   8K1GoccIfoU+pKTCgS+EDzgFgiUTnshaiJhZpJk2lEGQKDrYwPguOQzq7
   tHRVLu9utsd+skD+hMMwJlmPjEICfEqG9A0uSHXR+yLkiLx30GrBCC3qL
   +S+a5ZMQAV8vE1dl8Wj9E2Ymql7f5H9j0tvmJ6mwOvm/MZnLRKmHuRd1L
   CvzSrXT+vpp29rVrxD1mFylp0TBRnGKbBhk0RUVNOfCR1uSkJPYlaqt4S
   Q==;
X-CSE-ConnectionGUID: CGoxJvvUQVmKPUzRzIXEPg==
X-CSE-MsgGUID: hunf8JRWRmKdqqZ4Z2+fFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92388862"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="92388862"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 22:21:04 -0700
X-CSE-ConnectionGUID: H2MJtC3zRuupI9vpGAmJDw==
X-CSE-MsgGUID: Q3puzPkxT9a4lngej8C9dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="243783761"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2026 22:21:03 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXuKC-000000004DR-48lq;
	Fri, 12 Jun 2026 05:21:00 +0000
Date: Fri, 12 Jun 2026 07:20:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: title:
 'STMicroelectronics LIS302DL/LIS3LV02D 3-Axis Accelerometer (Legacy Binding)'
 should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202606120752.V2POeraR-lkp@intel.com>
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
TO: Md Shofiqul Islam <shofiqtest@gmail.com>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Md-Shofiqul-Islam/misc-lis3lv02d-set-default-click-detection-thresholds/20260611-235537
head:   1ed09427ad494ebff7be964518b15b027434280f
commit: 1ed09427ad494ebff7be964518b15b027434280f dt-bindings: iio: accel: convert lis302 binding to YAML schema (v2)
date:   13 hours ago
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arc-randconfig-2051-20260612 (https://download.01.org/0day-ci/archive/20260612/202606120752.V2POeraR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120752.V2POeraR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606120752.V2POeraR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Duplicate compatible "st,lis302dl" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/accel/st,lis302dl.yaml
   	http://devicetree.org/schemas/iio/st,st-sensors.yaml#

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: title: 'STMicroelectronics LIS302DL/LIS3LV02D 3-Axis Accelerometer (Legacy Binding)' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq2-click: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq1-disable: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq2-disable: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,default-rate: 'anyOf' conditional failed, one must be fixed:
   	'description' is a dependency of '$ref'
   	'/schemas/types.yaml#/definitions/uint32' does not match '^#\\/(definitions|\\$defs)\\/'
   		hint: A vendor property can have a $ref to a a $defs schema
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup2-z-lo: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq1-click: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq1-data-ready: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup-x-lo: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup-threshold: 'anyOf' conditional failed, one must be fixed:
   	'description' is a dependency of '$ref'
   	'/schemas/types.yaml#/definitions/uint32' does not match '^#\\/(definitions|\\$defs)\\/'
   		hint: A vendor property can have a $ref to a a $defs schema
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup2-x-lo: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup2-y-lo: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq2-ff-wu-1: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup-z-lo: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup2-threshold: 'anyOf' conditional failed, one must be fixed:
   	'description' is a dependency of '$ref'
   	'/schemas/types.yaml#/definitions/uint32' does not match '^#\\/(definitions|\\$defs)\\/'
   		hint: A vendor property can have a $ref to a a $defs schema
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq1-ff-wu-1: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq2-data-ready: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,click-window: 'anyOf' conditional failed, one must be fixed:
   	'description' is a dependency of '$ref'
   	'/schemas/types.yaml#/definitions/uint32' does not match '^#\\/(definitions|\\$defs)\\/'
   		hint: A vendor property can have a $ref to a a $defs schema
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup-x-hi: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup2-x-hi: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wu-duration-2: 'anyOf' conditional failed, one must be fixed:
   	'description' is a dependency of '$ref'
   	'/schemas/types.yaml#/definitions/uint32' does not match '^#\\/(definitions|\\$defs)\\/'
   		hint: A vendor property can have a $ref to a a $defs schema
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
   Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq2-ff-wu-2: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup2-z-hi: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
   Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wu-duration-1: 'anyOf' conditional failed, one must be fixed:
   	'description' is a dependency of '$ref'
   	'/schemas/types.yaml#/definitions/uint32' does not match '^#\\/(definitions|\\$defs)\\/'
   		hint: A vendor property can have a $ref to a a $defs schema
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
   Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq1-ff-wu-2: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup-z-hi: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup2-y-hi: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup-y-hi: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,hipass2-disable: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq-active-low: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,wakeup-y-lo: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,hipass1-disable: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml: properties:st,irq-open-drain: 'description' is a dependency of 'type'
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
   Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
