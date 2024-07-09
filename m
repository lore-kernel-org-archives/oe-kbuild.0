Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124021420A8
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 23:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720566607; cv=none; b=bni97ga43zSXgZgEU1r4TQUA443vRGQlvarjv8V3f2CkgcsveG5hN91bNR6VMcX5/U4DXxn8vhd1xM9jBqW5oGv3bCPn0q/g3KkFDx0Bz4YfrBM3ichMDQ3P3MmJroqulTbn6N36c/sbPZImy0QtCUPkthWiPnlXHiISbJ5R4TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720566607; c=relaxed/simple;
	bh=LvXUe9WRuQmJ1mxCkuZd8QSXsBBJ2XEEz9fOoqYchro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QaGCq6pJfOiiA8/BxI4gzTP+Cej+9ae8TxzeYcACEVBpDy8ujYBuwKsTOiyzhhPxa5O1ZzJ252xlG21Nk7d8Kp/hqh5F7NiHHiUEI8NEZIeauptxoE+JFzouUZj2euOjTWu5yX1RAkU3QNLhv4SE5qSQWoCDrQBZ338Vj20tJYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwjvAvRz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwjvAvRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720566606; x=1752102606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LvXUe9WRuQmJ1mxCkuZd8QSXsBBJ2XEEz9fOoqYchro=;
  b=YwjvAvRzsPtPRai6csB2MFifaoz1FPL99tdhIDt4u/M6kEL8yHPH68LW
   rHqXkcAZC8bkbJasiXX3U0BUI9oJSBr2FTF8wyRjcjoc0lBN+wGneifOC
   jRo/YGBfmg/TXW2QFwWSlp/dw6Z5SK19yAju2/7uMGZTBmIlT7XhZzzI0
   fzoFRxV6Ruh7LB2tICFZcr4cSCEI6ur5vPn3DSx5WiYoh7CbXU3r2NRWb
   GL49V+5/IrbToy6phMIX55Iwlmmm9w7pL2CDSpKBX8DMYuBVjiHXHpkTR
   CeqNmo8zG/nLl5WoZCSinD80eWIpV64fOkkyq5V1q57gkFvaJpvJvaWz1
   A==;
X-CSE-ConnectionGUID: fanz4ERhTcOJ661zkrkhmg==
X-CSE-MsgGUID: T9VqWLvqQWGHjuNN93AGUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21675890"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="21675890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 16:09:43 -0700
X-CSE-ConnectionGUID: BqQExSZYTUWDVeeipxWlpg==
X-CSE-MsgGUID: uz1A8y2OSUyx9fWXUxH62Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="48106800"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2024 16:09:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRJxr-000XD0-2Y;
	Tue, 09 Jul 2024 23:09:39 +0000
Date: Wed, 10 Jul 2024 07:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:master 34/61]
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: smsm: 'anyOf' conditional
 failed, one must be fixed:
Message-ID: <202407100741.s2Q7PTBZ-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   bbf0b241d2544f4c172cb6c223541011a12a5fc6
commit: 1074ce02fd18549fe0fe6b84a623ae8c11b1e218 [34/61] Merge remote-tracking branch 'dt-rh/for-next' into renesas-drivers
:::::: branch date: 14 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-051-20240709 (https://download.01.org/0day-ci/archive/20240710/202407100741.s2Q7PTBZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100741.s2Q7PTBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407100741.s2Q7PTBZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: smsm: 'anyOf' conditional failed, one must be fixed:
   	'qcom,ipc-1' is a required property
   	'qcom,ipc-2' is a required property
   	'qcom,ipc-3' is a required property
   	'qcom,ipc-4' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smsm.yaml#
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: smsm: 'mboxes' does not match any of the regexes: '@[0-9a-f]$', '^qcom,ipc-[1-4]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smsm.yaml#
   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/audio-codec@771c000: failed to match any schema with compatible: ['qcom,msm8916-wcd-digital-codec']
   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: bridge@39: #sound-dai-cells:0:0: 0 was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
