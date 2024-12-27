Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4273E45C14
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735299401; cv=none; b=DZw0JtVCzt28cPVO1OA8QUvpRHPBHotBcpsIKbO4PnGFIywyuROxZplhv6pXlr/7z28/IF+vKOZCQceRd2E68bQcicuyGdOvy1aQ1ItdKThQUJdl0i2qAh8R5kCmKmJXAi6bPQao+4CHNg9A4i3S/wUg/1cUxFU3fAMEAFXyQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735299401; c=relaxed/simple;
	bh=NetzlpGRHyIf1T9sDGAWNNA0HlmpewqkMKXAndjPQ5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fzSpxZ03QqsdxIsraUZrgcu5Z1e9XX/65jCrb8z34lULUVnaqnONB1GFcOUeHTUwTA2ugOOteSNawToff+PucqSOjbsbA4AS6oEFpTvBZ9sNn5V5Ixt7N/WJcErnQ7T4Lc2ASsdbXw4Unbpkl1v8V9ewEBVnYFb1aRsrgSvcthY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+HFfqBB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+HFfqBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735299399; x=1766835399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NetzlpGRHyIf1T9sDGAWNNA0HlmpewqkMKXAndjPQ5o=;
  b=e+HFfqBBZPQFBVVeRWsVWsJU0RCZB4A/moHq1mSYFhX0sin6ISoPRU8q
   0L3KsgbtYhkTBWQ2Ps5e29DcKWOvbjcidv3138WMmfMsyzgCtYn4Pkoa6
   6EdbvO+S0zrfdimFN44PuceQtlb2Dju3NxsBWzMSW7b8rWV2bQH3KWO00
   1iTex5LuD1nLBntkKP0OP35PNMf8/yK1ymiyF+ROoeBs9mT0+sQan2E9H
   ZUsqq7Z8vcc44eyMVBX3R+vzWoz925WtT15duAJCC1yjtV0B98lMRW3eG
   yQpTw4qoEWQPgTL3PsghwseEwqa1mJ1N/9UbGSdOa10TlyCWQvwn2OsY/
   A==;
X-CSE-ConnectionGUID: 9SEMhekYR/WpFXRYGecZ5A==
X-CSE-MsgGUID: ATYhl0Y/QiGacbdyn4yM3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="61081182"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="61081182"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 03:36:38 -0800
X-CSE-ConnectionGUID: R645Iyv5T8q8bA31AKMyOg==
X-CSE-MsgGUID: 4sp1kB0cQqOw05CSu2zpZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100263941"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Dec 2024 03:36:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR8dv-0003A6-15;
	Fri, 27 Dec 2024 11:36:35 +0000
Date: Fri, 27 Dec 2024 19:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 34/123]
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2: pwm:nvmem: [[345,
 346]] is too short
Message-ID: <202412271926.6OVY86xr-lkp@intel.com>
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
TO: Konrad Dybcio <quic_kdybcio@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: 703b23b802be6432059ad2b56cbee943f7c25865 [34/123] arm64: dts: qcom: qcs6490-rb3gen2: Configure onboard LEDs
:::::: branch date: 7 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271926.6OVY86xr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412271926.6OVY86xr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412271926.6OVY86xr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4582.26-4653.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4035.10-4045.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2: pwm:nvmem: [[345, 346]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm: nvmem: [[345, 346]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
