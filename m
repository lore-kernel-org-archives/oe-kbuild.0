Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983AC41AAC
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 20:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754599160; cv=none; b=VEMN2D8vZRmt/LnE3ghi9DDBHEmfid3dRkTdEp8vgHIZRKRglsGVXmvWTFrunV+iXQMv3FfvconssOpOqH4s4CFiy4BuxSQFrkg4dZN0VO+FomPkuj7/AOp4w3JL1i+4+ADM0Td5V+W1AcjRuLqKrgDkwgK677vJvXm/ga8YUS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754599160; c=relaxed/simple;
	bh=hLD+7ZlIBytK2b2EIpZx8oWtyNZJGeRF3D9Puku4FIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=USK8RCQ64FCc2UwrQkaqk6LzH4A6EHOv6X9rl9yc+k9Ey/LK/efkuyROCqB5w1J17QXNeVP/XnmhMfrxLDULveqnMfCXmX/mfSMNcT4H7YibhTbk7ZeW0E9j8mvDmZTiExhLm34V5Ja0Wj2A8UZok0dyOkvGrSmdEjOD3VnmlsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkDkXVfm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkDkXVfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754599159; x=1786135159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLD+7ZlIBytK2b2EIpZx8oWtyNZJGeRF3D9Puku4FIA=;
  b=kkDkXVfmu50ck/zWlmefdxYGdSY1tZNvKQaQgqssyhnowMBNafd2yqXN
   fTN4yI1ugKin7wpncBALi5E4MV6pPuM7HrLkEcWUoBKu3tJh7TUzN8ZYc
   AENDzlaXL6SvHu/ipKrvtEAuGRAGbJjrrcQ9nc0c6lpQgeH8Rx+H3Lm8A
   SI6vq9P3GTklclhq4fLp99pMz5KJ9NgTm6zNSNhdxRW+TFeyAljN+3Kbt
   XUzCbKKqTAw9nTNNuETBunF4DZL2ITKH7heYqDnCqx4nCL1dqxpiGt1MP
   w8eXJKwshrvHT4fkDARlYA85GqKj9isO9wuXsaNclwBPsNfR0jKMCx9m7
   g==;
X-CSE-ConnectionGUID: 7U0qTRHHQK2UcYkE43j0oQ==
X-CSE-MsgGUID: Patzb2dUSk2ozbuaoAuVWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="55982986"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="55982986"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 13:39:18 -0700
X-CSE-ConnectionGUID: ZR4fZHAeRj6JwP6RX+qkyg==
X-CSE-MsgGUID: pi5JLnurRLW97v9F4Z8f7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="196154670"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2025 13:39:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk7OH-0003DC-1Z;
	Thu, 07 Aug 2025 20:39:10 +0000
Date: Fri, 8 Aug 2025 04:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 417/801]
 Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-tx-channel: missing
 type definition
Message-ID: <202508080414.sX4uYhwR-lkp@intel.com>
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
commit: 21cac1455063c0a9e0aa50a727b027e02693466d [417/801] dt-bindings: net: Convert ibm,emac to DT schema
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080414.sX4uYhwR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080414.sX4uYhwR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080414.sX4uYhwR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-tx-channel: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-rx-channel: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: rx-fifo-size: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: tx-fifo-size: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: fifo-entry-size: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-burst-size: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: zmii-channel: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: rgmii-channel: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: phy-address: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: phy-map: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: rx-fifo-size-gige: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: tx-fifo-size-gige: missing type definition
>> Documentation/devicetree/bindings/net/ibm,emac.yaml: tah-channel: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Documentation/devicetree/bindings/arm/vexpress-config.yaml: arm,vexpress-sysreg,func: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/hwmon/vexpress.yaml: arm,vexpress-sysreg,func: multiple incompatible types: phandle-array
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "brcm,bcm7445-switch-v4.0" found in schemas matching "$id":
   	http://devicetree.org/schemas/net/dsa/brcm,sf2.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
