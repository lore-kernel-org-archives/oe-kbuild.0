Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9503538F97
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730701850; cv=none; b=Q72QrrmnJYL/xRp28ytsSX8qPnS1b3OIFV/H6OWLYjvPxZ00J9a4uKmV2i8pPwd5QYgg6MntzYaSQpWejxeDZ6FCzkGD2D3ox04CPi/rVWi6DV+rTNkyjHWCMqI2yNiEPoFf9RHzINTj54mePAyE59HSSTcBOQ370Ofa3MErLfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730701850; c=relaxed/simple;
	bh=zrC+Xr5VT+/LCo2LHfeOyz7h5sT6RBnFzaH8ZCiM8GA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pwVVay1lNGaLeXcTlCC3KhYUHOsgW0z8w4Rr1Onfi0jE363LJeiRAev5x9Xx2XilH+zBYuzEdEfWcwRn9vD7nQzOsmKYTBeppb55F8J+fUXiUj/NlA3uJACsslTT7NQYpzOoSfAhieK+m/gR1AyYmb7M+0643KTdIHJVFNo6ULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAsYer6k; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAsYer6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730701848; x=1762237848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zrC+Xr5VT+/LCo2LHfeOyz7h5sT6RBnFzaH8ZCiM8GA=;
  b=iAsYer6kcZIMhMRcRw+Qw1eCo7e8TbJPZyZ5B+bs4PUlHAZCGL/YBRje
   Umsh2+f3n2m6OVjVRa/nWrPlz8s6odwfn6PQnZgy0q1Mfgh+PUfYfSMGw
   Nq+bfpKvZ8vQkNJBhSMmGtQZHXfiLLM5x8/Ss4iJ6BnPOF5JpN8nJESbt
   vp9OESJciW7rU1hPVb5nRSQ9ZAihQUmv0uNgEsB8lnVTNJJqCbg76GFC6
   CytObQRuLFEAVWa3X0oA316Fk2vnLJtiQJ59POPn2vJA8Bw5BpRjUB9H9
   HnywggmtqkcRHHm9jPgZp27YrOsG3Bs2JmTDGW/hoNIwMSXB3CjInGLQ0
   g==;
X-CSE-ConnectionGUID: VTl5GIJ4SoyQYdSDguBV6g==
X-CSE-MsgGUID: g/AKpTJLSbeb0tGPW43gsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34080787"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34080787"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 22:30:47 -0800
X-CSE-ConnectionGUID: N662rpDzT1KIaljTT+Iwfw==
X-CSE-MsgGUID: 5XFNo8zsSsa5cKak3/Xshw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83686928"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Nov 2024 22:30:46 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7qbs-000kXj-0D;
	Mon, 04 Nov 2024 06:30:44 +0000
Date: Mon, 4 Nov 2024 14:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 1360/1360]
 Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong
 indentation: expected 2 but found 7 (indentation)
Message-ID: <202411041414.IJjJzikx-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: lishuo <lishuo@phytium.com.cn>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4d3056ab32e02139d7656adf048416e877e283b0
commit: ab9ff1e38569313e41ba5a036591f93cb55e5d87 [1360/1360] DRM: Phytium display DRM doc
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-052-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041414.IJjJzikx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041414.IJjJzikx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411041414.IJjJzikx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong indentation: expected 2 but found 7 (indentation)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:82:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks:items: 'anyOf' conditional failed, one must be fixed:
   ['description:Display controller reference clock source'] is not of type 'object', 'boolean'
   'description:Display controller reference clock source' is not of type 'object', 'boolean'
   from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:reg: 'oneOf' conditional failed, one must be fixed:
   [{'description': 'Offset and length of the memory mapped registers'}] is too short
   False schema does not allow 1
   hint: "minItems" is only needed if less than the "items" list length
   from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
   ['description:Display controller reference clock source'] is too short
   False schema does not allow 1
   hint: "minItems" is only needed if less than the "items" list length
   from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: 'Example' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks: 'anyOf' conditional failed, one must be fixed:
   'maxItems' is a required property
   hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   'minItems' is not one of ['maxItems', 'description', 'deprecated']
   hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   'items' is not one of ['maxItems', 'description', 'deprecated']
   hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   ['description:Display controller reference clock source'] is valid under each of {'type': 'array', 'maxItems': 1, 'items': {'allOf': [{'$ref': '#/array'}], 'required': ['items']}}, {'type': 'array', 'items': {'$ref': '#/single'}}
   hint: "items" can be a list defining each entry or a schema applying to all items. A list has an implicit size. A schema requires minItems/maxItems to define the size.
   hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
   from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
   'minItems' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
   'items' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
   'type' is a required property
   hint: DT nodes ("object" type in schemas) can only use a subset of json-schema keywords
   from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   $id: http://devicetree.org/schemas/dc/snps,dc.yaml
   file: Documentation/devicetree/bindings/gpu/phytium,dc.yaml
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml: ^(DCDC_REG[1-4]|LDO_REG[1-8]|SWITCH_REG[1-2])$: Missing additionalProperties/unevaluatedProperties constraint
--
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: ignoring, error in schema: properties: clocks: items
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition
   Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition
   Documentation/devicetree/bindings/sound/audio-graph-port.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Warning: Duplicate compatible "maxim,max6625" found in schemas matching "$id":

vim +40 Documentation/devicetree/bindings/gpu/phytium,dc.yaml

ab9ff1e3856931 lishuo 2024-01-19  33  
ab9ff1e3856931 lishuo 2024-01-19  34  required:
ab9ff1e3856931 lishuo 2024-01-19  35    - compatible
ab9ff1e3856931 lishuo 2024-01-19  36    - reg
ab9ff1e3856931 lishuo 2024-01-19  37    - interrupts
ab9ff1e3856931 lishuo 2024-01-19  38  
ab9ff1e3856931 lishuo 2024-01-19  39  Example:
ab9ff1e3856931 lishuo 2024-01-19 @40         /memreserve/ 0xf4000000 0x4000000; // (optional)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
