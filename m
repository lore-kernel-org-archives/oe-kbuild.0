Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E780F1FBF58
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729791493; cv=none; b=qYQfJu8Q0YYAx3XQBoyUXCBwQMma6RPHv5ONQiMRJUmdfS80kK8Z6dQmMYOJ9vleDSCn5MNm+1rt7pNEDRY7Nsh7Uk1bXl/JT8aGgRTZyKao2SoPobEpZV6h5+5ohs/F8Z77lfIuhUPnlSyQfYAqs71nx4ObcUP4N1yTnNJPdZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729791493; c=relaxed/simple;
	bh=D6aDcIYlC4BPFl5BW+TwCiGv2xdW7TLbgT12maPABDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LsJOnnmqMmSQqiBkhHqyItIQmQjb7yLinz4BdKPV+Z4qPV8GTzdUYWWYWV7hSNZTEkvvVLpWamcxDroLilkrgAum88yBaXjrRSI5VCh3IhY9KN6UYm3pPKaVgvDiLM1U/GBbcgyADj4Qm/xk5ckujKy/p/dWC2VPS6u2K3hxj4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4oNyvY0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4oNyvY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729791491; x=1761327491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D6aDcIYlC4BPFl5BW+TwCiGv2xdW7TLbgT12maPABDM=;
  b=G4oNyvY0+LyIdNIc02zwShoFN6bffteFnuqxI6S+upYqne7QvbpWVk0L
   IHMi9LzC3ASN/DNm5GYwXq09P9Qq0U84ogke4JIYtO0SsbX/lGOrLNqTs
   NSi7mJSA5A5yqMC2E1scwz+PQPRxt+SS+hRuE9uhuyTGwyYblFcmCPtQf
   w+b9wc6M1IppMgnenz3/gUi6V4truCANOecPSl/Jagt1zM/2oK/jSadS5
   A4iQqXbYIsmfYxgjfAHtpUiUvABw8eQdjzjFxRDTXGiAtp7YA1skWtWhq
   nzn/8T8kmiUZsyBPhIvn002HIIRK94LLA7enxxIJYN/pTkcKch2uzqFdy
   Q==;
X-CSE-ConnectionGUID: XuJZIoTOSQiKj6FlAp9aRw==
X-CSE-MsgGUID: C8wDvHtSRySnKSPWBWsMXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40028692"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="40028692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 10:38:10 -0700
X-CSE-ConnectionGUID: GklBHC6aQ6i2Q5pVgMYH4g==
X-CSE-MsgGUID: 6XL6TUvCQPicgUriK7Ko5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80247302"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Oct 2024 10:38:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t41mh-000Wn8-0K;
	Thu, 24 Oct 2024 17:38:07 +0000
Date: Fri, 25 Oct 2024 01:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.13 71/99]
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: nfc@28: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202410250103.k50330rH-lkp@intel.com>
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
TO: Eugene Lepshy <fekz115@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Danila Tikhonov <danila@jiaxyga.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.13
head:   267643b3e3a4e6cb7996da77f6d7f89ed8f5d554
commit: 6b3d104e52893493964a5eefa50dd0fdb472515a [71/99] arm64: dts: qcom: sm7325: Add device-tree for Nothing Phone 1
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250103.k50330rH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250103.k50330rH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410250103.k50330rH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4582.26-4653.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4035.10-4045.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: nfc@28: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nxp,pn553', 'nxp,nxp-nci-i2c'] is too long
   	'nxp,nxp-nci-i2c' was expected
   	'nxp,pn553' is not one of ['nxp,nq310', 'nxp,pn547']
   	from schema $id: http://devicetree.org/schemas/net/nfc/nxp,nci.yaml#
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: /soc@0/geniqup@ac0000/i2c@a84000/nfc@28: failed to match any schema with compatible: ['nxp,pn553', 'nxp,nxp-nci-i2c']
   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: usb@8cf8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
