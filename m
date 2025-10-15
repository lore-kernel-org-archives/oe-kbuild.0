Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35729156678
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Oct 2025 00:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760489977; cv=none; b=SjN7KadRwinDlCbKMa8fTCFBe8g5H+Q9anNjJ8G+ngh5OvOem9ycz0IhYoAPyW3XeaggfszaGE993lJbV57ipe3rwB974rxiO7ShgS0a72I9BGPTQvV/iirprOL5dhi2GuqVR7k5RXFYoe9Qwiv70XlkCKWb7Szga05UcAHCzlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760489977; c=relaxed/simple;
	bh=7XIU6bVVWg9z+xZ1Q679M6vYOyWJb2XGpkoVJOEbT0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VJyiMuRtQC1dds7ROS8HuWucM0hgZjhAI07hOpWc2iIKr2oqZqGn6wX8CAxakn7es7bG/V/aA/znEsxjEi7P3llg7uqpH36Af2aXClM/MgjkSOy8noRMCX0XqitHg0zyf+AE/8FAkNfMqX5Jkx4e+5B3WqWR9xfCZYVV8vxgrcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7A8dQWI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7A8dQWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760489976; x=1792025976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7XIU6bVVWg9z+xZ1Q679M6vYOyWJb2XGpkoVJOEbT0Y=;
  b=P7A8dQWIMs9N7uAbz9fwhrHdqoUSa663lbSJu0JS9qN4UuSYF13MbLpJ
   NAlqc/5Y3h1AEIaFqoRFGFc/elC2agfVM1TUoYibGP4WpUViJHlrj4SG8
   ANAyueAij+nzmw5Y9vaOuFVVDwubv2KPKzdRzYUxHA3eG5yqQGvKA9c7N
   QRKlZ86pNp5q6efUZmoCbV6YhfitIC1wLq6zb/R+5VDbNkt83U/bcscsk
   YWD8Y7kyio6sgbtnOskAGOdetIvhFHkVAtcKP2C8woAOPw+SwE0RRAmS6
   G87bqcQ1thiWCs5bhpkqW7LAz/V6IUmQ7VYPqZapLl62TqnjbuPL2pFil
   Q==;
X-CSE-ConnectionGUID: mXFFrWrWRIe7E01eMnO//g==
X-CSE-MsgGUID: 32HlF41vSEe+ASScHCqZAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62694057"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="62694057"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 17:59:36 -0700
X-CSE-ConnectionGUID: wQBraVt0R9qPh8PBxJ9+0A==
X-CSE-MsgGUID: ktHQZft0S3ijTnpn/HR9Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="187117743"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Oct 2025 17:59:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8prY-0003Jz-0S;
	Wed, 15 Oct 2025 00:59:32 +0000
Date: Wed, 15 Oct 2025 08:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: dma: Convert apm,xgene-storm-dma to DT
 schema
Message-ID: <202510150836.kCq2PhCR-lkp@intel.com>
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
In-Reply-To: <20251013213037.684981-1-robh@kernel.org>
References: <20251013213037.684981-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Khuong Dinh <khuong@os.amperecomputing.com>
CC: dmaengine@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on krzk-dt/for-next linus/master v6.18-rc1 next-20251014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-dma-Convert-apm-xgene-storm-dma-to-DT-schema/20251014-053233
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20251013213037.684981-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: dma: Convert apm,xgene-storm-dma to DT schema
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20251014 (https://download.01.org/0day-ci/archive/20251015/202510150836.kCq2PhCR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510150836.kCq2PhCR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510150836.kCq2PhCR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: mmc@1c000000 (arasan,sdhci-4.9a): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/apm,xgene-enet.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): Unevaluated properties are not allowed ('local-mac-address', 'phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/apm,xgene-enet.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: dma@1f270000 (apm,xgene-storm-dma): 'device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/apm,xgene-storm-dma.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
