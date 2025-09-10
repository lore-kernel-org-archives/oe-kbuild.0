Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880053101D9
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493294; cv=none; b=IMe3wEfUj1Q13E21rod5iXmAbwM3Zy4eEZfbxE16LIX0r8dSVg0ba3mdXJ7sXy0cfUuO+YtzJOCg0XIux6VcpiVVWv8bS2pb2gTQefjp9FUSXVQvyE7FFDQG74VBBPrwRHLeh/n9aUhdIe/gYA8rbl61nf1YzASoEzJQQKGEuFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493294; c=relaxed/simple;
	bh=Oc4uQ2z6sFh+9fSsIIfR8niJdiQlEiUWAMSgZg068KU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5t8DUts4bnreFM52Q9oWz/TOh7To3KbY6qEzqfQ5FXY+qndcmRVWipPIDp7D+MQvaldSdjEcVsHPqIQr9G6KuoC+M2h4kTMytE42cn6DoZgbH3CEMXF/emE9gZ64jS/T8b6wdj/BEUUj8MDjiIaLKEmjVOzIxjMOEd5V4PtXeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNeCp0gA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNeCp0gA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757493293; x=1789029293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oc4uQ2z6sFh+9fSsIIfR8niJdiQlEiUWAMSgZg068KU=;
  b=GNeCp0gABjykrhwPbVhUUjmRkmnn9OXymE/cwLj9ggGIJF5M9Dz3FYVu
   0J7rg7wdEOKu/w6+lxEZc/ww6nuxAAbFbShihTXDVuSS5e4YPC7zwIKGw
   fQe10amlxlMqxt1JUZCcrkZFVh8AnhMtD78jVXyBstk1Tat1tLkQIB7Y1
   l7bHNq3d9govaCtttlBDt4cgi0PuPuUIHVBSmokbVN+fLsPlyj7ZZqR/S
   XMnAMyDSevbPOwyXMt5o5oCskPtxRv28nzdq1hRt7xxr7pv3n78dLh27n
   y4eUtsbtp+sVgeO9QlrH/WVbiNaT5NXskrRpTgkmiAHs6N17NRX//Iu4V
   A==;
X-CSE-ConnectionGUID: n2kDn2RRQzqeMMToEepgww==
X-CSE-MsgGUID: f3yuyZFNSPSV2ctMLwvrWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59735458"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="59735458"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 01:34:52 -0700
X-CSE-ConnectionGUID: ZchMRxd2SbumrwPfOeek8w==
X-CSE-MsgGUID: bNn990/rQ2OJIDueUwAFsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="177598250"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Sep 2025 01:34:51 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwGHw-0005gt-0Q;
	Wed, 10 Sep 2025 08:34:48 +0000
Date: Wed, 10 Sep 2025 16:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/3] LoongArch: dts: Add uart new compatible string
Message-ID: <202509101629.t1aJOo0f-lkp@intel.com>
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
In-Reply-To: <2f93b8f20c6e93a15258888998e926814bfd0adf.1757318368.git.zhoubinbin@loongson.cn>
References: <2f93b8f20c6e93a15258888998e926814bfd0adf.1757318368.git.zhoubinbin@loongson.cn>
TO: Binbin Zhou <zhoubinbin@loongson.cn>
TO: Binbin Zhou <zhoubb.aaron@gmail.com>
TO: Huacai Chen <chenhuacai@loongson.cn>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Haowei Zheng <zhenghaowei@loongson.cn>
CC: Xuerui Wang <kernel@xen0n.name>
CC: loongarch@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-serial@vger.kernel.org

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b601e1f41edd4667062aa7cccb4e5199814979a3]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/dt-bindings-serial-Add-Loongson-UART-controller/20250909-201640
base:   b601e1f41edd4667062aa7cccb4e5199814979a3
patch link:    https://lore.kernel.org/r/2f93b8f20c6e93a15258888998e926814bfd0adf.1757318368.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v4 3/3] LoongArch: dts: Add uart new compatible string
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: loongarch-randconfig-051-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101629.t1aJOo0f-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101629.t1aJOo0f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509101629.t1aJOo0f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: serial@1ff40800 (loongson,ls2k0500-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['loongson,ls2k0500-uart', 'ns16550a'] is too long
   	'loongson,ls2k0500-uart' is not one of ['loongson,ls2k1000-uart']
   	'loongson,ls2k0500-uart' is not one of ['loongson,ls3a5000-uart', 'loongson,ls3a6000-uart', 'loongson,ls2k2000-uart']
   	'loongson,ls2k0500-uart' was expected
   	'loongson,ls2k1500-uart' was expected
   	from schema $id: http://devicetree.org/schemas/loongson,ls2k0500-uart.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: serial@1ff40800 (loongson,ls2k0500-uart): Unevaluated properties are not allowed ('compatible', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/loongson,ls2k0500-uart.yaml#
--
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: serial@1fe20000 (loongson,ls2k1000-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['loongson,ls2k1000-uart', 'loongson,ls2k0500-uart', 'ns16550a'] is too long
   	'loongson,ls2k1000-uart' is not one of ['loongson,ls2k0500-uart', 'loongson,ls2k1500-uart']
   	'loongson,ls2k1000-uart' is not one of ['loongson,ls3a5000-uart', 'loongson,ls3a6000-uart', 'loongson,ls2k2000-uart']
   	'loongson,ls2k1500-uart' was expected
   	from schema $id: http://devicetree.org/schemas/loongson,ls2k0500-uart.yaml#
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: serial@1fe20000 (loongson,ls2k1000-uart): Unevaluated properties are not allowed ('compatible', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/loongson,ls2k0500-uart.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0: [14, 4] is too long
--
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: serial@1fe001e0 (loongson,ls2k2000-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['loongson,ls2k2000-uart', 'loongson,ls2k1500-uart', 'ns16550a'] is too long
   	'loongson,ls2k2000-uart' is not one of ['loongson,ls2k0500-uart', 'loongson,ls2k1500-uart']
   	'loongson,ls2k2000-uart' is not one of ['loongson,ls2k1000-uart']
   	'loongson,ls2k0500-uart' was expected
   	from schema $id: http://devicetree.org/schemas/loongson,ls2k0500-uart.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: serial@1fe001e0 (loongson,ls2k2000-uart): Unevaluated properties are not allowed ('compatible', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/loongson,ls2k0500-uart.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0: [14, 4] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
