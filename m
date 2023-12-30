Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9592569
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Dec 2023 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBDs+Sqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703930265; x=1735466265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LA8DNDwgQ4xyqdyweKXZpZc9nlBWgV96BMziaIMV1Mw=;
  b=aBDs+SqrdZ/awTWv0R/Nkz+0+4eDAA30NyamrogXY5z1WHjaHB2101Hk
   1NWdfqFD/yMC1SdKEvTs3I2h5jpRgYr6GqGYbAhFftm+YieeS3sif7VRb
   S/sufhVksJjS0vW+qOZPFqlXu6FcN7I+8ambsq7wsLMrgzi0gIDy2HCsk
   4CngBWH3J/YX1jXf9dZJXyZhsZQkuxZEKFAByi+8Yc1D53Fhj96ZuqUh/
   0FQ9OLifjIEenYMQTSMNfeFB1fN0gVk1UsT2uqWDr5E3NuUSNyYhGQIoF
   Aj5Q+gdqOwOGzW4NMVrrb1vWjut+x25e7gceeuZFRjbbsAzB9c30VwXPR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3484449"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="3484449"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 01:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="844893011"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="844893011"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Dec 2023 01:57:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJW5i-000IL3-0h;
	Sat, 30 Dec 2023 09:57:27 +0000
Date: Sat, 30 Dec 2023 17:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
Message-ID: <202312301748.2BRGs7Xs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml:21:7: [error] duplication of key "items" in mapping (key-duplicates)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231229135154.675946-6-dario.binacchi@amarulasolutions.com>
References: <20231229135154.675946-6-dario.binacchi@amarulasolutions.com>
TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
TO: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: devicetree@vger.kernel.org
CC: linux-amarula@amarulasolutions.com
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: David Airlie <airlied@gmail.com>

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on drm-misc/drm-misc-next lee-mfd/for-mfd-next robh/for-next linus/master v6.7-rc7 next-20231222]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/dt-bindings-mfd-stm32f7-Add-binding-definition-for-DSI/20231229-215601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231229135154.675946-6-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH 5/8] dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231230/202312301748.2BRGs7Xs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312301748.2BRGs7Xs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml:21:7: [error] duplication of key "items" in mapping (key-duplicates)
--
>> Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml:21:7: found duplicate key "items" with value "[]" (original value: "[]")
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
--
>> Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

vim +/items +21 Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml

5ce96fe032f43e Linus Walleij  2020-02-23   8  
5ce96fe032f43e Linus Walleij  2020-02-23   9  maintainers:
5ce96fe032f43e Linus Walleij  2020-02-23  10    - Linus Walleij <linus.walleij@linaro.org>
5ce96fe032f43e Linus Walleij  2020-02-23  11  
5ce96fe032f43e Linus Walleij  2020-02-23  12  allOf:
5ce96fe032f43e Linus Walleij  2020-02-23  13    - $ref: panel-common.yaml#
5ce96fe032f43e Linus Walleij  2020-02-23  14  
5ce96fe032f43e Linus Walleij  2020-02-23  15  properties:
5ce96fe032f43e Linus Walleij  2020-02-23  16    compatible:
859f1d9e26606c Dario Binacchi 2023-12-29  17      oneOf:
5ce96fe032f43e Linus Walleij  2020-02-23  18        items:
5ce96fe032f43e Linus Walleij  2020-02-23  19          - const: hydis,hva40wv1
5ce96fe032f43e Linus Walleij  2020-02-23  20          - const: novatek,nt35510
859f1d9e26606c Dario Binacchi 2023-12-29 @21        items:
859f1d9e26606c Dario Binacchi 2023-12-29  22          - const: frida,frd400b25025
859f1d9e26606c Dario Binacchi 2023-12-29  23          - const: novatek,nt35510
5ce96fe032f43e Linus Walleij  2020-02-23  24        description: This indicates the panel manufacturer of the panel
5ce96fe032f43e Linus Walleij  2020-02-23  25          that is in turn using the NT35510 panel driver. The compatible
5ce96fe032f43e Linus Walleij  2020-02-23  26          string determines how the NT35510 panel driver shall be configured
5ce96fe032f43e Linus Walleij  2020-02-23  27          to work with the indicated panel. The novatek,nt35510 compatible shall
5ce96fe032f43e Linus Walleij  2020-02-23  28          always be provided as a fallback.
5ce96fe032f43e Linus Walleij  2020-02-23  29    reg: true
5ce96fe032f43e Linus Walleij  2020-02-23  30    reset-gpios: true
5ce96fe032f43e Linus Walleij  2020-02-23  31    vdd-supply:
5ce96fe032f43e Linus Walleij  2020-02-23  32      description: regulator that supplies the vdd voltage
5ce96fe032f43e Linus Walleij  2020-02-23  33    vddi-supply:
5ce96fe032f43e Linus Walleij  2020-02-23  34      description: regulator that supplies the vddi voltage
5ce96fe032f43e Linus Walleij  2020-02-23  35    backlight: true
5ce96fe032f43e Linus Walleij  2020-02-23  36  
5ce96fe032f43e Linus Walleij  2020-02-23  37  required:
5ce96fe032f43e Linus Walleij  2020-02-23  38    - compatible
5ce96fe032f43e Linus Walleij  2020-02-23  39    - reg
5ce96fe032f43e Linus Walleij  2020-02-23  40  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
