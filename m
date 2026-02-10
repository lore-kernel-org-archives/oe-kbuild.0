Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4842733D505
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714435; cv=none; b=X8rOxpqWHTe3w2GoHzry6CFXaNKema5Y30z2jn3Yi1NjBeVJ6uNw0o5YRNfhLaGU29yn6MUsb4YsrIe0FB6bnZVOrMdZYlqx1r7ZrEfX6hu2OyyogXp8wLPp+hyjXyuJMqJIewQsLSKDu0BuVaJGwCsGZEn7cjqyxlqoLsDfk/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714435; c=relaxed/simple;
	bh=WRC/0Q4JC+YI7P/Y6DOfNGdG2OILdYrmE1hNHYwwpzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nO+hgCFviAgIMzBys5BvfSdzviZR8vhkfDfaHF+kewMXmT/ZS7xLJGo1OTm+ci+On70rKujZI940aElp1SY3nZTfmiQKi+u9Axivl+SfnSM9p87nQLPt1dBUOwiYEohiseNRyuq+6zN5H17DOVgeayE1QY6I6YNwdzLEmz452oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vd6rMQTB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vd6rMQTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770714433; x=1802250433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WRC/0Q4JC+YI7P/Y6DOfNGdG2OILdYrmE1hNHYwwpzM=;
  b=Vd6rMQTBK1pWVy2bIQX7ZXae5NNvZPITzSFE8ZBoU0zEEejixg+GQeew
   llVL2st+qJY2ENLKN14Fxmt5pXNZLvRTnPUV4R1oOIBY7ltSji8WKB/nX
   azyADeNe+KtRN+unnMpjoNCo9ijM20B4AbdAUFLfe0CH4Tbl2igZrpfj3
   0HglqrzFSuAmRlQZql32HciD8srh4IHOeb7xgANoUnt20UysbsLO+oX+M
   KBFSR3Ybfy59KZwIo/iYONyi9AbyB6nCeSTt42MMbFXWihRhfKHPu0ER2
   ErKA/AiH84CpqiCbyc15Gx7kQdC0ftYTEXUnWAX/e/gJ1YguiUfFJMEWF
   Q==;
X-CSE-ConnectionGUID: PgZd6e2cTmqHYh9MmL7aOw==
X-CSE-MsgGUID: iiEBY1VPRaepoP6Ed+ZLUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75464175"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75464175"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:07:12 -0800
X-CSE-ConnectionGUID: DSABnAz8TVmwQsRAeAQWjQ==
X-CSE-MsgGUID: iaxBls3ERZeEj7R64uVPQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210941133"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2026 01:07:12 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpji9-000000000kL-2Nq2;
	Tue, 10 Feb 2026 09:07:09 +0000
Date: Tue, 10 Feb 2026 10:06:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
Message-ID: <202602101056.gdC9yt4u-lkp@intel.com>
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
In-Reply-To: <20260209042700.1186392-1-xin.liu@oss.qualcomm.com>
References: <20260209042700.1186392-1-xin.liu@oss.qualcomm.com>
TO: Xin Liu <xin.liu@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: xin.liu@oss.qualcomm.com
CC: tingwei.zhang@oss.qualcomm.com
CC: jie.gan@oss.qualcomm.com

Hi Xin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Liu/arm64-dts-qcom-hamoa-Add-PSCI-SYSTEM_RESET2-types/20260209-122910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260209042700.1186392-1-xin.liu%40oss.qualcomm.com
patch subject: [PATCH] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-2051-20260209 (https://download.01.org/0day-ci/archive/20260210/202602101056.gdC9yt4u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101056.gdC9yt4u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602101056.gdC9yt4u-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
