Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E458D23C8AE
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Oct 2025 12:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619159; cv=none; b=Ix0J0UXWD4o92VaX6bsc3rMyjoWBXNfO4XXOJK9t0I9l/4BWpgxHqLPGwyclsgBg8wRbiC6JpGzzC68odVDY8MkcJJmhRNTCRuTX9JgqFcCkiEOdxwLhWW41IJP4L4u1FHr4zHlL50lFH5bNS6K3v4utSi16TgSaQ//aJr27boY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619159; c=relaxed/simple;
	bh=EXuTbstLDbGYWfV5Hp6DzOqpXN8DDU1BWeT1iAk60Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQyl0iXeGzbLm9zOCChBQ/T8J1PIOEisOXfHMR08fB9uYAezXtfCvSfywJ4OkRq3mGRcrs1vqbR5slbZL9LOy+xVoj07PipWF2jMWXEKwUqtIv+PR5LLJcyxBK5ZUkj+w25shBhUTO7t90KZ140MSXUira7u/sGO26NyAGfuVJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKDO6SAZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKDO6SAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760619157; x=1792155157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EXuTbstLDbGYWfV5Hp6DzOqpXN8DDU1BWeT1iAk60Ls=;
  b=RKDO6SAZYNC4+g4C1XtQIawhe88BrA7iNIKANaAjG3N1lBirbVOXu58f
   WIqNb/kZCFU7gIabHLvmS7JVLG683Ml9AFUEgowKE94LgBbp/rwsNE6t8
   /xGFXk+yNF3HsTzz6OeckPRZu5CXqjuiMC8sIGxNs6eYb+LPgW4g8Va1e
   awzn1559iDrC3QDUih2OPaowSdkdDwf9ERTNYu0rMLvD434A5/9UqM97i
   IsSk7h706AyyqUZYdOY8ogkJMEMWGFtfLtexsGFB8AH2+ULt6MAntY6tN
   gKSO3w4M4F0lXCfqc6J7xKD8FavWGdTTqp312WSYoUuKjrWbb/Ozf0iIM
   w==;
X-CSE-ConnectionGUID: J4sqP8/3TKStZbhl0FkkrQ==
X-CSE-MsgGUID: qGI7dMMdSH+F5tCgy2W87A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62708342"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62708342"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 05:52:36 -0700
X-CSE-ConnectionGUID: ZYrvxwObRd6QvvoeuPkVMg==
X-CSE-MsgGUID: nevfFVrZRDi+UM9vfIITJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213405670"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 05:52:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9NT1-0004p1-0d;
	Thu, 16 Oct 2025 12:52:28 +0000
Date: Thu, 16 Oct 2025 20:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for QCS615 talos
 evk board
Message-ID: <202510162054.8aqg5QwE-lkp@intel.com>
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
In-Reply-To: <20251014120223.1914790-3-tessolveupstream@gmail.com>
References: <20251014120223.1914790-3-tessolveupstream@gmail.com>
TO: Sudarshan Shetty <tessolveupstream@gmail.com>
TO: andersson@kernel.org
CC: konradybcio@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: tessolveupstream@gmail.com

Hi Sudarshan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.18-rc1]
[also build test WARNING on linus/master next-20251015]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sudarshan-Shetty/dt-bindings-arm-qcom-Add-QCS615-Talos-EVK-SMARC-platform/20251014-200319
base:   v6.18-rc1
patch link:    https://lore.kernel.org/r/20251014120223.1914790-3-tessolveupstream%40gmail.com
patch subject: [PATCH v3 2/2] arm64: dts: qcom: Add support for QCS615 talos evk board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20251015 (https://download.01.org/0day-ci/archive/20251016/202510162054.8aqg5QwE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510162054.8aqg5QwE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510162054.8aqg5QwE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/talos-evk.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
   arch/arm64/boot/dts/qcom/talos-evk.dtb: mcp2515@0 (microchip,mcp2515): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/net/can/microchip,mcp2510.yaml#
   arch/arm64/boot/dts/qcom/talos-evk.dtb: mcp2515@0 (microchip,mcp2515): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/microchip,mcp2510.yaml#
>> arch/arm64/boot/dts/qcom/talos-evk.dtb: extcon-usb-1 (linux,extcon-usb-gpio): 'id-gpio', 'vbus-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/extcon/linux,extcon-usb-gpio.yaml#
   arch/arm64/boot/dts/qcom/talos-evk.dtb: extcon-usb-1 (linux,extcon-usb-gpio): 'anyOf' conditional failed, one must be fixed:
   	'id-gpios' is a required property
   	'vbus-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/extcon/linux,extcon-usb-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
