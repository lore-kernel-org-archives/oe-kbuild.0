Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375C41607AB
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754157754; cv=none; b=cUsyGa6joydSpobTUvJ+aMy18Cg4FReMs85juahoyKvHJAsC9keS50YoaRY0iG2A77OH7oSis6W3NIbkgA05/+Erq6s+MxGhUkN8w9sxbNT18QAqiFQLJeWI+BALh/HmCYnNxEwWeLT/n+VZ0lewVHf/8taZ4NYsjnU3wfpdnsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754157754; c=relaxed/simple;
	bh=+mqumrkwqsqwuwYrGXyPKsCYu7Dvm1GFjt//X2YH6YY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IEqUcMHPdu0T1ZKpyvvswNjkPerLQ/zT5ZgcsHtq7QAuIojk/nXWe6c7YlMMkLkk7zrnx6ekmNCQOXTlvVlrvduoWNNBibEuUEbeGQC4ySySTv72vEDXf06G+/Yh2D2Adj5dcpk4OzeQC29DP4Fwo6vRzxX+ip96R061Nq0e1HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1YfB0/X; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1YfB0/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754157752; x=1785693752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+mqumrkwqsqwuwYrGXyPKsCYu7Dvm1GFjt//X2YH6YY=;
  b=P1YfB0/X4hkMOhe04DmJuywFXgRTyocJBRTihpdj359GgP1tMCo3JD0V
   lXCTBjMe1XTzjB42RH4R5efs04qricH3olr0M0e3hmGOZ/MMO2+JO8ouS
   HWWVBb9XeZtlB62kx7oiK+I+lAbi5qw2RLhLowfjd2oq/s2zpxjSbQFIK
   rfeo8vJHiA0Bt6Tlhx+aVEacTfmo9EShSDgo5OSjvSDVNwzxMhfFdjrw6
   WsVqSXjQIW9UaKEHVAyKzmLJqQo905HPtQfQm0GB+GmPjgZC8x2aB/THD
   1u0TqdZnvNSsTCGw7XO+21fzThsVzZeywP0yjbYvCnp7SfjLxZg1F/GN7
   g==;
X-CSE-ConnectionGUID: 7gI45F1ZRqyr4KdmeGTOTQ==
X-CSE-MsgGUID: NsZUYRBdT0aeAwsuaAV49w==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="44068825"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44068825"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 11:02:31 -0700
X-CSE-ConnectionGUID: fTPXSyOKT4iObhtgtebPNA==
X-CSE-MsgGUID: hSYGF0GiSYyJbFAjKIiLzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194771411"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Aug 2025 11:02:30 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiGYt-0005Wq-0v;
	Sat, 02 Aug 2025 18:02:27 +0000
Date: Sun, 3 Aug 2025 02:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 10/60]
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss):
 oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202508030137.GFISGT3q-lkp@intel.com>
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
TO: Aradhya Bhatia <a-bhatia1@ti.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: 17047a3326a961f01a2e6de8a6fa0a7ac74ebbb4 [10/60] arm64: dts: ti: k3-am625: Add OLDI support
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-051-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030137.GFISGT3q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030137.GFISGT3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508030137.GFISGT3q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
--
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
--
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
