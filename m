Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558905;
	b=ITzDsjChigzCFiMriAB8WRwBHbi+/rmGs7tNANb4fyde7NbDlNdaSpJHH/DOMs8xmjBE
	 jG2+aZ1o3PHWoMzAzF0BkMngH4pw5ay62YeJ7itBbl8PuhwBW5H98bmLW1i4xeeIXP+C+
	 EyRBX6nP4IyG1tEkGGXSpaC5whmphtyPeScS/qX7PqbbCT+XHvsfkEidNzBKrgfJB2K6a
	 8ja8raNtYpaN0wf1ujXixuY45G64hjle7Vsc7ovRfwQj8skquzh+0wsF6r/Og/PT1mAcB
	 HlAUU8kYpV7m/k8gNCJJTCvVo1ZnIaxjJ+6IUdutCusLWl5lf2x1N6UshvWgn9cCc0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558905;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3Bgjt3qmImZXheK4ePtTrax89UdQ6vnU//lOP9/qijA=;
	b=Q5FTGvxLAkJYtvwyAkVk/wA2SMOJyjlf6PtGYOOfxQBufG5FdS8frqDcKHPs733VDHgr
	 zHMaNc3Yw67C32g6Q3hPgoD7PPDw9G4HwBxj79XIsHDSRmSW1ZwWFuH82hyiobq5X26h2
	 pCsL1QLATOnmYhDOdYqpIUj5YvDwcGd7zLITPt/kd5mCsVkNvHznoEDx3L/CWuJ1+3G5Q
	 2tXmKLKOK9MZz1lIy2L5NxeHdUG35soOaI/TJSqcvv7RXoDbd2Q4A3+SCbXsyEc8uxM0B
	 w9zyvoi+DB4LANGh5hKIQuL49Tue9pC3Tmfqwx50hFEhwH+vFu+2jSbPsI/1NVMHOMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cXAp2MXa;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE0606A31E
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 22:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cXAp2MXa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795558905; x=1827094905;
  h=date:from:to:cc:subject:message-id;
  bh=QGbvVptfb5pyIewPzmrbwPTiw45DNq/o2ydzhbUAPGg=;
  b=cXAp2MXa1jrnmizfTjGv0UC/yTh17yG8DLLUoEgaV7MaarHI73R6Mp4E
   GxM5kSPlcvAZ17BSrzyztuq4Y89RXZWSupKBBtx5v34nj3IUBvZdtJoQh
   JssBzUpyQNpg1XnzXCmw6Mex1SI/e8CbXMgn4aLxKlFo84JcE5cQtaDj0
   s1eeHhIUhYgn8TslaFsKzPxQd5z9jtj9/t2vYIJLnQYcCXjGhTWllS4Da
   Mr5MvSIHMebhFsjnpSMsn6i74AdCMaotD1f88Fqa/ST0H9MhebG9YYX3L
   lsnu3PXzFmITHW7+M9dt2WfzQRxMpPuV1mxNGkoUat+8W3Nd+KtW9qzUX
   g==;
X-CSE-ConnectionGUID: nSVLZyL3QROlslPGw28c/A==
X-CSE-MsgGUID: wufAUMp1S1OkAJ8n/rvhMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4394095"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4394095"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 14:21:44 -0800
X-CSE-ConnectionGUID: 1sBHWG9GTcKZIkIumDbUFw==
X-CSE-MsgGUID: +L1qjL08SIW+DDZxDOKUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11890067"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Nov 2026 14:21:42 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVytP-000000005Hx-401a;
	Tue, 24 Nov 2026 22:21:39 +0000
Date: Tue, 24 Nov 2026 23:21:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:for-next 16/18]
 arch/arm/boot/dts/st/ste-snowball.dtb: timer@a0410600
 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <20261124231703.K9o3yjbC-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git for-next
head:   8d354fe6facff246e8a7e513a57f1ffb83a19d3b
commit: d6ee7c68142743075b1153e81252d75514524013 [16/18] ARM: dts: ux500: Add power domains
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261124/20261124231703.K9o3yjbC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124231703.K9o3yjbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261124231703.K9o3yjbC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-snowball.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x003' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg3: ste,config: b'\x00\x00\x00+' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x00)' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg3: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: dma-controller@801C0000 (stericsson,db8500-dma40): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/stericsson,dma40.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: proximity@44 (sharp,gp2ap002a00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg2: ste,config: b'\x00\x00\x003' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg1: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg2: ste,config: b'\x00\x00\x00+' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg3: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg1: ste,config: b'\x00\x00\x00+' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg1: ste,config: b'\x00\x00\x00)' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg2: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg3: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: dma-controller@801C0000 (stericsson,db8500-dma40): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/stericsson,dma40.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/i2c@80004000/proximity@39: failed to match any schema with compatible: ['sharp,gp2a030s00f']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: sram@40060000 (mmio-sram): 'power-domains' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: scu@a0410000 (arm,cortex-a9-scu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,scu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: clocks (stericsson,u8500-clks): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: mtu@a03c6000 (st,nomadik-mtu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/st,nomadik-mtu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: timer@a0410600 (arm,cortex-a9-twd-timer): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: watchdog@a0410620 (arm,cortex-a9-twd-wdt): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
