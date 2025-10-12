Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589134BA34
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Oct 2025 05:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760246736; cv=none; b=ViO+5m4kSo3VayxJc+/OYpkQ0ZgKkHuHH199XBPDh1lRKx3uISJBMBmqslihBSNPpR8LgrWSyIJMf2DtT2TM1ampS47CmegmDYLKI8zE4QZeM6dNKHn2MAtPEFooTgVjmSvn7cwvW98Rxlhgws6Ia+lzUZmY5L5pDaEHatLc/YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760246736; c=relaxed/simple;
	bh=oGvGZWYwfiTLS/ORrYBRDXxHmV3Clv6nv8U0EToLr9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdk/JXhFUBp9wQ24A1rW+mcg9AbhCMTEqEQMYqfAxjOY4srynmvHJGgEsrx2RfYJqljcNNpCZ2DOWoXkFC6pvdlugmXZ0JEpnetO/I4HKGWIu171CQDNgfDPK4eanikNu8BZemVpIO3r4C1fOmwXDsxNyhrFn6LFGTgoqJrWJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgzO7Uei; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgzO7Uei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760246734; x=1791782734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oGvGZWYwfiTLS/ORrYBRDXxHmV3Clv6nv8U0EToLr9w=;
  b=bgzO7UeiahWvZeCLu+h81IH1JLsCrGNRdZ63dD4AQDkliWqnbq5H3ICk
   82b9Zkdp5whjcGCwFfp7x4VuvpoZNh1BDrniy/bAeMpGJn1nwcBCkuCX6
   sESCohRH/YaGXaeorbHgyHKC9b4VVHGDsD2kQ0tPoPdaXEWFxm8iVybAl
   rIbGWF87WMQwggzZpIElugw/KwyOosFMVFKh4sp/RRPJOfJuoXR1dSUfa
   laIu4RuL5qeM5SPVO9tFgkt6TnE7hrmUiPUjJ2jrpSIyRpzs3k9IfcmI0
   txZieAo8HXekuCzhoHTqAHeh+/wJQr3Cp1j0KSDk/+7acj/0VCWgUdXTk
   Q==;
X-CSE-ConnectionGUID: 4RrnHlxoRjm0UC35lYxBlQ==
X-CSE-MsgGUID: HX64l0awR/uMphI4zLpedg==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="85041237"
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="85041237"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 22:25:33 -0700
X-CSE-ConnectionGUID: GotMqF6ATPWKkOXrS4ZlVQ==
X-CSE-MsgGUID: 02VFvhziSmOJCi+T5cW53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="211952564"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Oct 2025 22:25:32 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7oaH-0004Db-0x;
	Sun, 12 Oct 2025 05:25:29 +0000
Date: Sun, 12 Oct 2025 13:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
Message-ID: <202510121103.VfZ0TrJh-lkp@intel.com>
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
In-Reply-To: <20251008-s6e3fc2x01-v2-4-21eca1d5c289@ixit.cz>
References: <20251008-s6e3fc2x01-v2-4-21eca1d5c289@ixit.cz>
TO: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Casey Connolly <casey.connolly@linaro.org>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: phone-devel@vger.kernel.org
CC: David Heidelberg <david@ixit.cz>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7c3ba4249a3604477ea9c077e10089ba7ddcaa03]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/dt-bindings-panel-Add-Samsung-S6E3FC2X01-DDIC-with-panel/20251010-093626
base:   7c3ba4249a3604477ea9c077e10089ba7ddcaa03
patch link:    https://lore.kernel.org/r/20251008-s6e3fc2x01-v2-4-21eca1d5c289%40ixit.cz
patch subject: [PATCH v2 4/7] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20251011 (https://download.01.org/0day-ci/archive/20251012/202510121103.VfZ0TrJh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121103.VfZ0TrJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510121103.VfZ0TrJh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): 'poc-supply', 'te-gpios', 'vci-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
