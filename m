Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AC727B35F
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 01:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791509715; cv=none; b=nF3snIkcuE8Pve49oeLA6d+ykLYVubcwf9aNJJjOtuor23duGIY2xPAulFBBkobDjVC77ChoFPakbk/NTzUS/7u00xhcywjB6o/marJGEFgSpWZ3B3/OiTOXSwM3j1JzT5+Mv0+7HMJLUdWBM60cN6+35dPHy3usSx+Wpm8dPLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791509715; c=relaxed/simple;
	bh=bGP5XMorEqJzvCsrahGZWiYzXgpI63vK6MSrstf+K2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SjPWlhxuyfcv1GlF+9JZlxXAg5lRFmiPNdqn/EeK9Fy++TFMPn42vVFwSUvuGtwQVLqvSdhuBeIrssSBueK9BOTIpDgfWwofTuxcmTLbCaLDPlOddNMXdisQgv0Vfz9cSJYiE7EDS2Jrr0hcNzeP6nJAWYMEDaVaOvTDcYL8MME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cU8hfChH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cU8hfChH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791509713; x=1823045713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bGP5XMorEqJzvCsrahGZWiYzXgpI63vK6MSrstf+K2E=;
  b=cU8hfChHYjQ5kWhLOQX+225JAinWVD+F99YYvSlqGCILG8p3ibz34l4f
   T6tKb3ju3AgGpeYkHmC3L6DGnaN4Ka6AnOiguyWlw/rVL5AHzWlqSEil+
   xVyi3xhF9q0KaqCvwHkL2IgokAV5DEuJ5pLQ7aZIjPNUBIxo7evyU/bg6
   1r36xRp82I5PAs/Pbax1eHbfkMK6qt8cVbvZVm5vn5ndiUf94S07tyoHh
   KLjBbbBmN053vq3BVBTqaD0B6Sx7oGDck894bK+NjvDWsRz9MC7rb8JHP
   VREM6Y/JjEpbP38v2erDICeLO9lU2+jwCoJIfKaTdazswnSsrBjsHiCjw
   Q==;
X-CSE-ConnectionGUID: VUAolGn/ScqV3BG3uaX5Gw==
X-CSE-MsgGUID: NlfVZXehTGejeLu0IXONFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="184314"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="184314"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 18:35:12 -0700
X-CSE-ConnectionGUID: wOhDuIxoRJKIfVjHbOt6/A==
X-CSE-MsgGUID: wbygKnB2Q+agTMh6ugm19A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="639105"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2026 18:35:11 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEzVt-000000006U7-0mZq;
	Fri, 09 Oct 2026 01:35:09 +0000
Date: Fri, 9 Oct 2026 03:34:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add thermal
 sensors
Message-ID: <202610090328.TIKF13Pn-lkp@intel.com>
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
In-Reply-To: <202610090328.TIKF13Pn-lkp@intel.com>
References: <202610090328.TIKF13Pn-lkp@intel.com>

Hi Anvesh,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Anvesh-Jain-P/dt-bindings-embedded-controller-qcom-hamoa-crd-ec-Add-thermal-sensors/20260928-120637
base:   
patch link:    https://lore.kernel.org/r/202610090328.TIKF13Pn-lkp%40intel.com
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-2402-20260930 (https://download.01.org/0day-ci/archive/20261009/202610090328.TIKF13Pn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090328.TIKF13Pn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610090328.TIKF13Pn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: embedded-controller@76 (qcom,hamoa-iot-evk-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: embedded-controller@76 (qcom,hamoa-iot-evk-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
