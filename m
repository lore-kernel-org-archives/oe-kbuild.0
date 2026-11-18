Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974966;
	b=axfYoVP8cmQbos97K+c6kpubq/SLh+T8QGsN0syOYtGQMJshKIu/fUHOy4ZpaRnPe9Wf
	 OEt9L5VfCTnhlJvrUgsf07igK+I+TFYjIoZEGyPThe6SmWg5aKCnuY9PvDJaXSTl1MH/B
	 rETstcLVt7WAaYDNErUhMhPLkXPWjVfNgL2te3o4vhJOwcVnxapoSclnQtTIPNsXhee6Y
	 /k5aW5AsgCdPpwy8KP5QB1Ie8lEMQvqlSMDwsRJE0c5RMw+Pcb5HQwSKbcEkHfOOzX0fB
	 RMbBXamnuwYOd7M6cWrJNHn38o+m/8hgtTP6SC8jHBcJNgic8ofaQ2KAi4ZzWzDDCng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974966;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=liYRl8LAhe8LTI1hVgszuKD30MMZ4km1UBx4fGOgS9I=;
	b=WW8+gJ7cGSWW4iBJoeH/rGHlF4lrnXB/cy23aN/NNhiqzMnaFnaMPPtdWDvKti7HTHNX
	 dqRzF61fJQCMuLIQqzfg1KpFLMsqXaodad9/AwGdZaZ7GgBIeUakjarcNEVudJX1B1O9X
	 OxN4xRG2L25AO+pQJnS7Wf++sW4/r59XKIK/XDraHK2t6WZLPc1h9/TeEb9yVr4Kwa3kd
	 xd5hjVBsszXO/6VXsLYB7iaT55/YY28uHao5U6QaWVJeTOrY9omX0ZbwEyYo0Gmj4geTO
	 1n02xq2VWmdB26vagP9SlKmXMFTS9MdTbSzX2KAhEETsCBbmRQKFWDzGxQj0IUCGQ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hl3rlLVI;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CEE606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 04:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99CEE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hl3rlLVI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794974966; x=1826510966;
  h=date:from:to:cc:subject:message-id;
  bh=YuVANDBvQHdJo4BsChi6ml4iZVacHLuCSLp/cjwBX1w=;
  b=hl3rlLVIN2CLwIMiOmSwPgo4XoKWFG1604VML6NdgRaziT/W/JdkudMl
   /Tw+2lY2NtRtNIERQd9vrGXT06dn01Mx7J7iVTmJ+ifVdDhwXwiua/CRM
   s3kUTMiF/e6lb3AUhW7pasr2Gp8qMjXFa7jBW5pykb0Sfdq4Rj4g3EF4/
   dTVCsx9voTU1Nw0Y7V5ldQu3lJgevbkaM1pRHdwmfryh4OX0qelWnfVuP
   yukY1cQB7mQ8qZtrxcDPv2iowL6qAD0WgD3PQAe9bEmeBcPxIsjwc30bv
   qem1GAKL6V8LLedC0Wa6qz3m6eM6T+N1hhd73g46+UiMVPTaIIU/zC1e4
   g==;
X-CSE-ConnectionGUID: TFC7BgrtQHqaDaieuJu4tw==
X-CSE-MsgGUID: dHBCU1h0Syiepj62edF3FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3790347"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3790347"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 20:09:26 -0800
X-CSE-ConnectionGUID: Et/4zZslTqmZ80egAZwlHA==
X-CSE-MsgGUID: oh0OldRZSeeojPLSsd2n7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="11737189"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 17 Nov 2026 20:09:24 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTWz4-000000003K4-0JDF;
	Wed, 18 Nov 2026 04:09:22 +0000
Date: Wed, 18 Nov 2026 05:08:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [superna9999:topic/sm8650/el2-reboot 1/4]
 Documentation/devicetree/bindings/power/reset/qcom,pon.yaml:45:1: [warning]
 too many blank lines (2 > 1) (empty-lines)
Message-ID: <20261118050731.DkyRPWiB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/superna9999/linux topic/sm8650/el2-reboot
head:   127b5bbcefff0cffb21eea90b05a8cac30951c4e
commit: 13055a84200377fe69eed6287248c3163e09f76b [1/4] dt-bindings: power: reset: qcom-pon: Document the qcom,el2-reset-config property
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20261118/20261118050731.DkyRPWiB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118050731.DkyRPWiB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118050731.DkyRPWiB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/power/reset/qcom,pon.yaml:45:1: [warning] too many blank lines (2 > 1) (empty-lines)

vim +45 Documentation/devicetree/bindings/power/reset/qcom,pon.yaml

76ba1900cb6739 satya priya         2021-07-23   8  
76ba1900cb6739 satya priya         2021-07-23   9  maintainers:
76ba1900cb6739 satya priya         2021-07-23  10    - Vinod Koul <vkoul@kernel.org>
76ba1900cb6739 satya priya         2021-07-23  11  
76ba1900cb6739 satya priya         2021-07-23  12  description: |
76ba1900cb6739 satya priya         2021-07-23  13    The Power On device for Qualcomm PM8xxx is MFD supporting pwrkey
76ba1900cb6739 satya priya         2021-07-23  14    and resin along with the Android reboot-mode.
76ba1900cb6739 satya priya         2021-07-23  15  
76ba1900cb6739 satya priya         2021-07-23  16    This DT node has pwrkey and resin as sub nodes.
76ba1900cb6739 satya priya         2021-07-23  17  
76ba1900cb6739 satya priya         2021-07-23  18  properties:
76ba1900cb6739 satya priya         2021-07-23  19    compatible:
84b3a9353e3f32 Rakesh Kota         2026-07-24  20      oneOf:
84b3a9353e3f32 Rakesh Kota         2026-07-24  21        - enum:
76ba1900cb6739 satya priya         2021-07-23  22            - qcom,pm8916-pon
7a54cf02d7176a Dmitry Baryshkov    2023-06-09  23            - qcom,pm8941-pon
76ba1900cb6739 satya priya         2021-07-23  24            - qcom,pms405-pon
76ba1900cb6739 satya priya         2021-07-23  25            - qcom,pm8998-pon
03fccdc76dce96 David Collins       2022-09-09  26            - qcom,pmk8350-pon
84b3a9353e3f32 Rakesh Kota         2026-07-24  27        - items:
84b3a9353e3f32 Rakesh Kota         2026-07-24  28            - const: qcom,pmm8654au-pon
84b3a9353e3f32 Rakesh Kota         2026-07-24  29            - const: qcom,pmk8350-pon
76ba1900cb6739 satya priya         2021-07-23  30  
76ba1900cb6739 satya priya         2021-07-23  31    reg:
03fccdc76dce96 David Collins       2022-09-09  32      description: |
03fccdc76dce96 David Collins       2022-09-09  33        Specifies the SPMI base address for the PON (power-on) peripheral.  For
03fccdc76dce96 David Collins       2022-09-09  34        PMICs that have the PON peripheral (GEN3) split into PON_HLOS and PON_PBS
03fccdc76dce96 David Collins       2022-09-09  35        (e.g. PMK8350), this can hold addresses of both PON_HLOS and PON_PBS
03fccdc76dce96 David Collins       2022-09-09  36        peripherals.  In that case, the PON_PBS address needs to be specified to
03fccdc76dce96 David Collins       2022-09-09  37        facilitate software debouncing on some PMIC.
03fccdc76dce96 David Collins       2022-09-09  38      minItems: 1
03fccdc76dce96 David Collins       2022-09-09  39      maxItems: 2
03fccdc76dce96 David Collins       2022-09-09  40  
03fccdc76dce96 David Collins       2022-09-09  41    reg-names:
03fccdc76dce96 David Collins       2022-09-09  42      minItems: 1
03fccdc76dce96 David Collins       2022-09-09  43      maxItems: 2
76ba1900cb6739 satya priya         2021-07-23  44  
13055a84200377 Neil Armstrong      2026-11-16 @45  
13055a84200377 Neil Armstrong      2026-11-16  46    qcom,el2-reset-config:
13055a84200377 Neil Armstrong      2026-11-16  47      type: boolean
13055a84200377 Neil Armstrong      2026-11-16  48      description:
13055a84200377 Neil Armstrong      2026-11-16  49        Specifies the PBS control registers should be set to indicate the
13055a84200377 Neil Armstrong      2026-11-16  50        reboot type (Warm Reset, Power Off, Hard Reset) when booted the HLOS
13055a84200377 Neil Armstrong      2026-11-16  51        in EL2 without an Hypervisor.
13055a84200377 Neil Armstrong      2026-11-16  52  
76ba1900cb6739 satya priya         2021-07-23  53    pwrkey:
76ba1900cb6739 satya priya         2021-07-23  54      type: object
99cab201fc634f Krzysztof Kozlowski 2022-07-26  55      $ref: /schemas/input/qcom,pm8941-pwrkey.yaml#
76ba1900cb6739 satya priya         2021-07-23  56  
76ba1900cb6739 satya priya         2021-07-23  57    resin:
76ba1900cb6739 satya priya         2021-07-23  58      type: object
99cab201fc634f Krzysztof Kozlowski 2022-07-26  59      $ref: /schemas/input/qcom,pm8941-pwrkey.yaml#
76ba1900cb6739 satya priya         2021-07-23  60  
60320e6ef48507 Krzysztof Kozlowski 2022-07-26  61    watchdog:
60320e6ef48507 Krzysztof Kozlowski 2022-07-26  62      type: object
60320e6ef48507 Krzysztof Kozlowski 2022-07-26  63      $ref: /schemas/watchdog/qcom,pm8916-wdt.yaml
60320e6ef48507 Krzysztof Kozlowski 2022-07-26  64  
76ba1900cb6739 satya priya         2021-07-23  65  required:
76ba1900cb6739 satya priya         2021-07-23  66    - compatible
76ba1900cb6739 satya priya         2021-07-23  67    - reg
76ba1900cb6739 satya priya         2021-07-23  68  
05d9044177c3e9 Elliot Berman       2024-11-07  69  patternProperties:
05d9044177c3e9 Elliot Berman       2024-11-07  70    "^mode-.*$":
05d9044177c3e9 Elliot Berman       2024-11-07  71      maxItems: 1
05d9044177c3e9 Elliot Berman       2024-11-07  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
