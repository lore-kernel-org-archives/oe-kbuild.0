Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECF337474C
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211858; cv=none; b=CvYJKUNm4jevQirBCZvz8APv9o3fT+hs2vODrdLcGRkxVc0GCvN8fhiQnApzQ4ijpn/y4gWPR6rUOdvDjdos5+AwWJghxOhswTsHfQDsMURy3PFtQ1Vw/YoTGbfzRCAX+epvVGEdwdmNMVRyfapHTpVMnaP/S84qybxXUlrGyG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211858; c=relaxed/simple;
	bh=xkggLqtSfMqdNsned4VVLzuXXUB7PZDK4Algra1z1Rg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hAnhH8x2pO3mROi3k7Di4TD/m3/CV89GaxJ7YpKIK+W6MAXcJOVVe8288XjoOcOagQfk8/GB0UUZrA5FPzbCzApslk/PWgEQ9Qz4hNW7gDfEUiVinDylCOorHMXCoSq7BFMwJr4UuYTKDnV4GzZS+UnnoizjgLDTph2PQgne4qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sfw10PD+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sfw10PD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773211856; x=1804747856;
  h=date:from:to:cc:subject:message-id;
  bh=xkggLqtSfMqdNsned4VVLzuXXUB7PZDK4Algra1z1Rg=;
  b=Sfw10PD+4LiFXfRXozDt3OXXPJfDCqoCVXGsli7U3ZHbI8iPu68BkhPC
   mRnwMCGQjkdsKWzgS0qRkNQrut6wgXRMLzHMwItDoL6BEBYABu1mvikmZ
   rDtFu+wyqGPBjZna4rNGOMKH/oZk+EPSbcCC1za+KfiU4S1Stbm9pOYiK
   eLQ0uxe5H9Utdp/ZETgiVrN/IA7dZQXRebxfE17Kp58yk81utfXF1RmuO
   ux1HmE5ZwUi0MUz5lv391zClxoTeE700P/N38LJ/uAxQqQ5wN5HjnqZtg
   tTXA9LdBsCWJT5OHlARnpdRxsof2eS43kCQPSwVOLqZQACRYlGEjz7GLE
   g==;
X-CSE-ConnectionGUID: bdlNR6+4RXua03O5XIBSew==
X-CSE-MsgGUID: dGBcrP2dQnCvVnmbzC0Glw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="61844647"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="61844647"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 23:50:53 -0700
X-CSE-ConnectionGUID: hx3m2ZvjRJGvISV/Qt/Jyw==
X-CSE-MsgGUID: SEfTRJTWQ+K8qxyCW5KtSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="243376637"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2026 23:50:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0DP7-000000003H7-0Zov;
	Wed, 11 Mar 2026 06:50:49 +0000
Date: Wed, 11 Mar 2026 07:49:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 315/621]
 Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-tx-channel: missing
 type definition
Message-ID: <202603110704.N9I0kueB-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 04e3793bcc673a20c2872d66aec5512f637ef373 [315/621] dt-bindings: net: Convert ibm,emac to DT schema
:::::: branch date: 14 hours ago
:::::: commit date: 15 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110704.N9I0kueB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110704.N9I0kueB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603110704.N9I0kueB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-tx-channel: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-rx-channel: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: rx-fifo-size: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: tx-fifo-size: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: fifo-entry-size: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-burst-size: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: zmii-channel: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: rgmii-channel: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: phy-address: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: phy-map: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: rx-fifo-size-gige: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: tx-fifo-size-gige: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: tah-channel: missing type definition
   Traceback (most recent call last):
     File "/usr/local/bin/dt-mk-schema", line 8, in <module>
       sys.exit(main())
                ~~~~^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/mk_schema.py", line 28, in main
       schemas = dtschema.DTValidator(args.schemas).schemas
                 ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 399, in __init__
       self.make_property_type_cache()
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
