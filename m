Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C06E29A1
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Aug 2025 00:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756601701; cv=none; b=Y7fG216zg73w0FGtSFMQwJL/aVpQ3PoNvVacTz7nXd/MPHpIXZ6Ij2e4eG2lWxvpK/w/Mdz/E5SAu6rUhXOC7+BJnpPCX33Gbfq3M3O20294fhM/QQ2+m3r/5vw1b/r31ZNQZ5TVvG2l7OpDPmuK+K/U6ocKj6cLdw79J8+FJFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756601701; c=relaxed/simple;
	bh=O3KFwkdmAy4Fcw1rfA7tPR/RK7HVkUSbEwUA22dlX7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttvumYNpEH3wYsFkTRm/8YAZ7Wma0703L67DWJ6cm0jba3edI+8GGl4Z+zvp4LNilf6GVZTC5F9gSaWng84gmd15om0YsvFHHZImsRk035wz5puwM8788qDfq+zVs8ZxfT/pjxYtrK5s3lkLiUboWxfkQMqSwGqjIQ5HmEXRmfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVgTuyub; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVgTuyub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756601699; x=1788137699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O3KFwkdmAy4Fcw1rfA7tPR/RK7HVkUSbEwUA22dlX7Y=;
  b=ZVgTuyubnOq/y33RaXcvq9hVXloE4ihw2IlK22x37B0bIEgJvMRWKcFX
   oem2G4xZECu1dSZr/Jbd7Lk7xtwsJbHCginpymYKQXWTW8UeMEst8Bw9A
   ISETApjxZGNNjElqDQFFgknqGaVgHkM735s7m2KK72QqL6ieuIUrsdYlR
   ugPlqNBrp56LOVvHvvuf1dQrZVroIzLzpsSn7kenlSKxiK0len+TW78UJ
   B3poAsqCU0GzGfTTYNT+3ghINDDrWTomOYnm77o6w3Hs4/VbV0fZpP7pr
   2v7hT5urUOhhxcoI48Ku9Nv5S6rBmv6nOkvUA7D8CQkv/ZkR8MKXwiJrX
   A==;
X-CSE-ConnectionGUID: AWJDEH0WSi2vnwk0oBaz7Q==
X-CSE-MsgGUID: ZYY6KYLfR+GQhOzVxVCgOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="62484401"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="62484401"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 17:54:59 -0700
X-CSE-ConnectionGUID: o6pCWZr5Tv60QXk5M+T+zg==
X-CSE-MsgGUID: hJvO6/qBQX68zg6qgZ2tmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="174837902"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Aug 2025 17:54:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usWL6-000VoZ-38;
	Sun, 31 Aug 2025 00:54:44 +0000
Date: Sun, 31 Aug 2025 08:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:thinkpad-t14s-x1e 19/19]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: ec@28
 (lenovo,thinkpad-t14s-ec): 'wakeup-source' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508310853.ypWG1dQS-lkp@intel.com>
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
TO: Sebastian Reichel <sre@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   74c3d2a2ffeb14162b3b66023a059a1ed5252d07
commit: 0e21f1dbce44bad4bb05c2541344ff3fb9643230 [19/19] arm64: dts: qcom: x1e80100-t14s: add EC
:::::: branch date: 3 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-051-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310853.ypWG1dQS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508310853.ypWG1dQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508310853.ypWG1dQS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4884.11-4894.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: ec@28 (lenovo,thinkpad-t14s-ec): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/platform/lenovo,thinkpad-t14s-ec.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4884.11-4894.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: ec@28 (lenovo,thinkpad-t14s-ec): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/platform/lenovo,thinkpad-t14s-ec.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: ec@28 (lenovo,thinkpad-t14s-ec): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/platform/lenovo,thinkpad-t14s-ec.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: ec@28 (lenovo,thinkpad-t14s-ec): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/platform/lenovo,thinkpad-t14s-ec.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
