Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2802A58104
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Feb 2024 22:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707689181; cv=none; b=Cb50pfBPRT3Vwp5V1/xl3yhTrRjZV4ViZO6eL1JA9qCDXJI/fLlQMS1vjqhNXuGdXGKKU3D+KJwvjMw3KwNpDx0YDg9Oxm8nb51vWsYEefJIh0YXd+cgM3Wm+JrYkTP+FkmADtf3PwSD6QSfbr04TdAA/XDtBNtP14nDN5awecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707689181; c=relaxed/simple;
	bh=u5Jojz08buxzLt/WYSHVD/lv0SQJCfIAEHTOWTXdjEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NH61K8BpYJkzhH5ePZqAu5LGrhDoLhH5R+cM7Ykp/ZVZlOY/vgBlrPAxw++wunBYftit2aeu2gI5RPKw5WLAU1g38aXV+l7scigliXfaLv6gQmAeGgHwCLP+O6zOtavRwpDm5N0C1vgwIKNAWSqVi6m0itStmpGehlkt042d/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icVB+rkD; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icVB+rkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707689179; x=1739225179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u5Jojz08buxzLt/WYSHVD/lv0SQJCfIAEHTOWTXdjEo=;
  b=icVB+rkDwqqFzywmJHFvpaSAi4UtEPSfXv2nk7LXH5BHdpkGqV5klFT2
   sVk/Sgm075a5bKaFyasaEIYQ7pD0OGKve1/0VgXATVHGuyKZSgc/Id8al
   zGJ/0rniRwHRuPJLKWil6IpK88mErlL2LvN02dhpS3zfFfocm71mpDLHK
   w4TRBMSOSXzgekbRtNQUktWtysVHRDa4wd8oN1OQaMQTc4p75YO7Yik/1
   GCNBEuhYf9Z1Ws9B++nQ9Vq6Iuo3qRvoEh0W6eBtd9ce2EwIfID2h+UeT
   +fGWX84bqvZWmMcXdbHXANRQoPBJHygqD3Cv7Xfk7zKOzkERI7PWoCjAs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="436797320"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="436797320"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 14:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="7065562"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2024 14:06:17 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZHxn-0006mQ-0f;
	Sun, 11 Feb 2024 22:06:15 +0000
Date: Mon, 12 Feb 2024 06:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 03/10] dt-bindings: display: bridge: tc358775: Add
 support for tc358765
Message-ID: <202402120510.uIBwAZkI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml:87:8: [error] empty value in block mapping (empty-values)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240211095144.2589-4-tony@atomide.com>
References: <20240211095144.2589-4-tony@atomide.com>
TO: Tony Lindgren <tony@atomide.com>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Simha BN <simhavcs@gmail.com>
TO: Sam Ravnborg <sam@ravnborg.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Michael Walle <mwalle@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.8-rc3 next-20240209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/dt-bindings-display-bridge-tc358775-make-stby-gpio-optional/20240211-180213
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240211095144.2589-4-tony%40atomide.com
patch subject: [PATCH v3 03/10] dt-bindings: display: bridge: tc358775: Add support for tc358765
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240212/202402120510.uIBwAZkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402120510.uIBwAZkI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml:87:8: [error] empty value in block mapping (empty-values)
--
>> Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: allOf:0:if: None is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: allOf:0:then: 'anyOf' conditional failed, one must be fixed:
   	'stby-gpios' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
   	'type' was expected
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
--
>> Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: ignoring, error in schema: allOf: 0: if

vim +87 Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml

8b0d47e879b8fe Vinay Simha BN      2020-07-10    1  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
8b0d47e879b8fe Vinay Simha BN      2020-07-10    2  %YAML 1.2
8b0d47e879b8fe Vinay Simha BN      2020-07-10    3  ---
8b0d47e879b8fe Vinay Simha BN      2020-07-10    4  $id: http://devicetree.org/schemas/display/bridge/toshiba,tc358775.yaml#
8b0d47e879b8fe Vinay Simha BN      2020-07-10    5  $schema: http://devicetree.org/meta-schemas/core.yaml#
8b0d47e879b8fe Vinay Simha BN      2020-07-10    6  
84e85359f4999a Krzysztof Kozlowski 2022-12-16    7  title: Toshiba TC358775 DSI to LVDS bridge
8b0d47e879b8fe Vinay Simha BN      2020-07-10    8  
8b0d47e879b8fe Vinay Simha BN      2020-07-10    9  maintainers:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   10    - Vinay Simha BN <simhavcs@gmail.com>
8b0d47e879b8fe Vinay Simha BN      2020-07-10   11  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   12  description: |
6b27cbab742a1a Tony Lindgren       2024-02-11   13    This binding supports DSI to LVDS bridges TC358765 and TC358775
8b0d47e879b8fe Vinay Simha BN      2020-07-10   14  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   15    MIPI DSI-RX Data 4-lane, CLK 1-lane with data rates up to 800 Mbps/lane.
8b0d47e879b8fe Vinay Simha BN      2020-07-10   16    Video frame size:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   17    Up to 1600x1200 24-bit/pixel resolution for single-link LVDS display panel
8b0d47e879b8fe Vinay Simha BN      2020-07-10   18    limited by 135 MHz LVDS speed
8b0d47e879b8fe Vinay Simha BN      2020-07-10   19    Up to WUXGA (1920x1200 24-bit pixels) resolution for dual-link LVDS display
8b0d47e879b8fe Vinay Simha BN      2020-07-10   20    panel, limited by 270 MHz LVDS speed.
8b0d47e879b8fe Vinay Simha BN      2020-07-10   21  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   22  properties:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   23    compatible:
6b27cbab742a1a Tony Lindgren       2024-02-11   24      enum:
6b27cbab742a1a Tony Lindgren       2024-02-11   25        - toshiba,tc358765
6b27cbab742a1a Tony Lindgren       2024-02-11   26        - toshiba,tc358775
8b0d47e879b8fe Vinay Simha BN      2020-07-10   27  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   28    reg:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   29      maxItems: 1
8b0d47e879b8fe Vinay Simha BN      2020-07-10   30      description: i2c address of the bridge, 0x0f
8b0d47e879b8fe Vinay Simha BN      2020-07-10   31  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   32    vdd-supply:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   33      description: 1.2V LVDS Power Supply
8b0d47e879b8fe Vinay Simha BN      2020-07-10   34  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   35    vddio-supply:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   36      description: 1.8V IO Power Supply
8b0d47e879b8fe Vinay Simha BN      2020-07-10   37  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   38    stby-gpios:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   39      maxItems: 1
8b0d47e879b8fe Vinay Simha BN      2020-07-10   40      description: Standby pin, Low active
8b0d47e879b8fe Vinay Simha BN      2020-07-10   41  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   42    reset-gpios:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   43      maxItems: 1
8b0d47e879b8fe Vinay Simha BN      2020-07-10   44      description: Hardware reset, Low active
8b0d47e879b8fe Vinay Simha BN      2020-07-10   45  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   46    ports:
b67554232307e7 Rob Herring         2021-01-04   47      $ref: /schemas/graph.yaml#/properties/ports
8b0d47e879b8fe Vinay Simha BN      2020-07-10   48  
b67554232307e7 Rob Herring         2021-01-04   49      properties:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   50        port@0:
9a017bf40a32e5 Tony Lindgren       2024-02-11   51          $ref: /schemas/graph.yaml#/$defs/port-base
9a017bf40a32e5 Tony Lindgren       2024-02-11   52          unevaluatedProperties: false
8b0d47e879b8fe Vinay Simha BN      2020-07-10   53          description: |
8b0d47e879b8fe Vinay Simha BN      2020-07-10   54            DSI Input. The remote endpoint phandle should be a
8b0d47e879b8fe Vinay Simha BN      2020-07-10   55            reference to a valid mipi_dsi_host device node.
8b0d47e879b8fe Vinay Simha BN      2020-07-10   56  
9a017bf40a32e5 Tony Lindgren       2024-02-11   57          properties:
9a017bf40a32e5 Tony Lindgren       2024-02-11   58            endpoint:
9a017bf40a32e5 Tony Lindgren       2024-02-11   59              $ref: /schemas/media/video-interfaces.yaml#
9a017bf40a32e5 Tony Lindgren       2024-02-11   60              unevaluatedProperties: false
9a017bf40a32e5 Tony Lindgren       2024-02-11   61  
9a017bf40a32e5 Tony Lindgren       2024-02-11   62              properties:
9a017bf40a32e5 Tony Lindgren       2024-02-11   63                data-lanes:
9a017bf40a32e5 Tony Lindgren       2024-02-11   64                  description: array of physical DSI data lane indexes.
9a017bf40a32e5 Tony Lindgren       2024-02-11   65                  minItems: 1
9a017bf40a32e5 Tony Lindgren       2024-02-11   66                  items:
9a017bf40a32e5 Tony Lindgren       2024-02-11   67                    - const: 1
9a017bf40a32e5 Tony Lindgren       2024-02-11   68                    - const: 2
9a017bf40a32e5 Tony Lindgren       2024-02-11   69                    - const: 3
9a017bf40a32e5 Tony Lindgren       2024-02-11   70                    - const: 4
9a017bf40a32e5 Tony Lindgren       2024-02-11   71  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   72        port@1:
b67554232307e7 Rob Herring         2021-01-04   73          $ref: /schemas/graph.yaml#/properties/port
8b0d47e879b8fe Vinay Simha BN      2020-07-10   74          description: |
8b0d47e879b8fe Vinay Simha BN      2020-07-10   75            Video port for LVDS output (panel or connector).
8b0d47e879b8fe Vinay Simha BN      2020-07-10   76  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   77        port@2:
b67554232307e7 Rob Herring         2021-01-04   78          $ref: /schemas/graph.yaml#/properties/port
8b0d47e879b8fe Vinay Simha BN      2020-07-10   79          description: |
8b0d47e879b8fe Vinay Simha BN      2020-07-10   80            Video port for Dual link LVDS output (panel or connector).
8b0d47e879b8fe Vinay Simha BN      2020-07-10   81  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   82      required:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   83        - port@0
8b0d47e879b8fe Vinay Simha BN      2020-07-10   84        - port@1
8b0d47e879b8fe Vinay Simha BN      2020-07-10   85  
6b27cbab742a1a Tony Lindgren       2024-02-11   86  allOf:
6b27cbab742a1a Tony Lindgren       2024-02-11  @87    - if:
6b27cbab742a1a Tony Lindgren       2024-02-11   88      properties:
6b27cbab742a1a Tony Lindgren       2024-02-11   89        compatible:
6b27cbab742a1a Tony Lindgren       2024-02-11   90          contains:
6b27cbab742a1a Tony Lindgren       2024-02-11   91            const: toshiba,tc358765
6b27cbab742a1a Tony Lindgren       2024-02-11   92      then:
6b27cbab742a1a Tony Lindgren       2024-02-11   93        stby-gpios: false
6b27cbab742a1a Tony Lindgren       2024-02-11   94  
8b0d47e879b8fe Vinay Simha BN      2020-07-10   95  required:
8b0d47e879b8fe Vinay Simha BN      2020-07-10   96    - compatible
8b0d47e879b8fe Vinay Simha BN      2020-07-10   97    - reg
8b0d47e879b8fe Vinay Simha BN      2020-07-10   98    - vdd-supply
8b0d47e879b8fe Vinay Simha BN      2020-07-10   99    - vddio-supply
8b0d47e879b8fe Vinay Simha BN      2020-07-10  100    - reset-gpios
8b0d47e879b8fe Vinay Simha BN      2020-07-10  101    - ports
8b0d47e879b8fe Vinay Simha BN      2020-07-10  102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
