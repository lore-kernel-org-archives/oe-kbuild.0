Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C077B209F2E
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Jul 2025 19:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753730374; cv=none; b=HJj8L5N8z3l4s7Z5eD4bHYJG8vfNE+nH7ee5EELnEAeZcEXhYR6aLfG/5Ukkgzdq8JjDSUxFAdtGRQfrxsvyfMITlZj/ZY6K18nESKlyzN6apIuZtiavjudREY2I9xnP3vz+gQ8pqx6g1YZyPvQo9JVojFN0wDpLYkTkBoQuc8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753730374; c=relaxed/simple;
	bh=UFV8dkZCLj9hdIXhfysUX4m6OTtzNuwvk+f9jPVeuZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mQibcD3mZOENBaUrj3fYFkpWAZP1ahVyzxOfDGcmrcmVL4c9X54K3MqBX1NCjQuri31PLV+2QjldRExeR4P6nV9H495Vq9/liWgPtyv9Zo9k5xu5uKtMfQ0N+I6H+6nTmA6DNbqHJW+GsGA+n0Lea+oPGxJZ2nvU5L5MJCpNAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dh8Kmu5M; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dh8Kmu5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753730372; x=1785266372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UFV8dkZCLj9hdIXhfysUX4m6OTtzNuwvk+f9jPVeuZc=;
  b=dh8Kmu5MgPhN9EdQuEMu+LTlKJZexe2wAq5omqmoJQkXG16qf8/BAHgX
   KiGhjFwemdXlW+nMk9Xr5n/kn+2wegYTpJZQBNvA89ZeA2FI2RFYeV1+J
   K7CQHhvx/JjgbZf/fgqcLsyy4Z7V3+seKjvgopwsO179zaJkOLSExiDB6
   IToBvTW/DmdVdz1iBZ+2Mc90Dyp+ATlS/BpcyhtwxmTtl17Q8Bk8nO5ge
   52Ktaf5XJ54WOHBTfxAjRq4PzKdpzsPtNbpnpYHQGux4fWjj43kCyWD7T
   /lxkxHMCwx+sGOp1W8UmZ4OHTr8y1VxTNGV0FL4hANvbkACBNGoJyylVo
   Q==;
X-CSE-ConnectionGUID: 6jZpiXfJRni7LOUxELTxfg==
X-CSE-MsgGUID: SnzpAmt6QIKclOcWrn9ssg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55193406"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55193406"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 12:19:32 -0700
X-CSE-ConnectionGUID: 62WTYW28QrOAvM2MtarfXw==
X-CSE-MsgGUID: U/5zJk9ZSkKlkIAEN+VP6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166748151"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jul 2025 12:19:31 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugTNh-0000hf-0Q;
	Mon, 28 Jul 2025 19:19:29 +0000
Date: Tue, 29 Jul 2025 03:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [vkoul-dmaengine:next 25/25]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dma-controller@1dc4000
 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
Message-ID: <202507290343.nb8tV5Ah-lkp@intel.com>
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
TO: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   b04b950fddfcf2f7b0e6f789499c256d15b70720
commit: b04b950fddfcf2f7b0e6f789499c256d15b70720 [25/25] dt-bindings: dma: qcom: bam-dma: Add missing required properties
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-052-20250728 (https://download.01.org/0day-ci/archive/20250729/202507290343.nb8tV5Ah-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507290343.nb8tV5Ah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507290343.nb8tV5Ah-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dma-controller@1dc4000 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
   	'qcom,powered-remotely' is a required property
   	'num-channels' is a required property
   	'qcom,num-ees' is a required property
   	'clocks' is a required property
   	'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dma-controller@1dc4000 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
   	'qcom,powered-remotely' is a required property
   	'num-channels' is a required property
   	'qcom,num-ees' is a required property
   	'clocks' is a required property
   	'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
