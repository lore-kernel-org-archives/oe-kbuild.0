Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780451B0F11
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754563663; cv=none; b=sntJDumvxeEYd5/t/K8YAOCRNZV2hLe+IHdGvcQQCIO5nlKvC2w6GHeOga6ComgvYxqG60+2+RH7kQjbXsgmFOTYgTw1A+z+Dg5dUmkKYX8NyWRlPXGbTsmR+6tIFxRo0qdUk1X9ahBnDdEuPtTyNdypIrHoP5a9Jfjbxw8Uiow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754563663; c=relaxed/simple;
	bh=yZLrbMx8F/Nd4u7eeIkjZFIAgpbPedcTu8dVLaOp9NY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7UzJ7MeAQmJU0U8xxHPVkdAZuxtSexNpdmVJ3gvIRwX9qpoGWevtszdClmGNXkf0ytz0rNwnP+bev8j3n2HfTBWi3S9xJcJNY+idYJO18sLB0Inc69pDUiQc9xxIvwhVM1cPmoLasdf9AVsQaHyC1GoafKRr5UGEF/S+tIqaxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRb7zZOM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRb7zZOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754563661; x=1786099661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZLrbMx8F/Nd4u7eeIkjZFIAgpbPedcTu8dVLaOp9NY=;
  b=DRb7zZOMV8V9hg6hTXSkL8cs+shJBCwC3jkXB8ZiwRXnnAwv0UzfvA+/
   Iw/385hwqjKbcekyLnb4YCO9WMWGEumcKeXviF2/RzRKo3lHSUxgXqs7Z
   uHpNlo9dC+Gmk4FR26oxuYLb6ugsyl0+xNMp+yS9kRRkB9U78Z+f04V4Z
   My16kGQSahd+fami3gzjScr2c3EahnE869l522DY9OC45TVHAm1n+Fk2Q
   MfeYB5ldm3JnYuoN4igEB674dICug9Nkuhszlal9+DzxSVcaGtnJOL833
   k49wGcEUx8AzXv4rMo8WMzIc45QxfkED3T4y4N83l4TDank5BM/tgBYKd
   Q==;
X-CSE-ConnectionGUID: C2zVw9i9RjKaA3CA0l3mAg==
X-CSE-MsgGUID: WX8wneu1Snmgsn+wizs1PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82340259"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="82340259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 03:47:41 -0700
X-CSE-ConnectionGUID: jwDVXvRzTXKrD/vxuB6nRQ==
X-CSE-MsgGUID: Ch2PNm4PRuejCpdW6vFAbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165410730"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2025 03:47:40 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujy9q-0002hO-0A;
	Thu, 07 Aug 2025 10:47:38 +0000
Date: Thu, 7 Aug 2025 18:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 186/801]
 Documentation/devicetree/bindings/hwmon/vexpress.yaml:
 arm,vexpress-sysreg,func: multiple incompatible types: phandle-array
Message-ID: <202508071803.w4nzIpFk-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 8aeff7f162304fd086eb251accbf61a6e5364d7a [186/801] dt-bindings: hwmon: Convert vexpress to DT schema
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071803.w4nzIpFk-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071803.w4nzIpFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071803.w4nzIpFk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
>> Documentation/devicetree/bindings/arm/vexpress-config.yaml: arm,vexpress-sysreg,func: multiple incompatible types: uint32-array
>> Documentation/devicetree/bindings/hwmon/vexpress.yaml: arm,vexpress-sysreg,func: multiple incompatible types: phandle-array
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "fsi-master" found in schemas matching "$id":
   	http://devicetree.org/schemas/aspeed,ast2400-cf-fsi-master.yaml#
   	http://devicetree.org/schemas/fsi-master.yaml#
   Warning: Duplicate compatible "fsi-master" found in schemas matching "$id":
   	http://devicetree.org/schemas/fsi-master.yaml#
   	http://devicetree.org/schemas/fsi-master-gpio.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-sb" found in schemas matching "$id":

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
