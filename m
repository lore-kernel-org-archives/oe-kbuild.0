Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07B8158A2C
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Aug 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513394; cv=none; b=MC0gIBw9O5BkuSGKgk0BfXnxRaEmheZakBraOQlvWUcUyaZqKGlHCH5MNM2zGfIMxxWrxYa+5C4TSjA8bPtnI/R/oZLYpvHyaBFxN+6pol46jU7SXr5s7ncJIjHY9M1MJ6s/1N6UfZ6AKrx/Rno9MVeMoJ0o2A3dX4K+haTnIVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513394; c=relaxed/simple;
	bh=NEfQUcDEnHmRSZV1g2Pq2M9sXVdENYPTLiPyGQqOnn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PYhUfiww/arbfLI77McjN8rJaiNrSzkNBuD82I1hmb6qhwLIaoa9CE4/Cv8sdEkd2dVYB372MSaNhF6crqVSjUXyTK+NJfwKcwfwkH9ZYZun/sleQh0WJgZovlp8JaigtEPPvCrMjC8sDqAQuB9I+mctnuso2r5/N6/1scWWcFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyz101le; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyz101le"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722513392; x=1754049392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NEfQUcDEnHmRSZV1g2Pq2M9sXVdENYPTLiPyGQqOnn8=;
  b=cyz101lecomzxnE1Z9JgbC/XPYMcN1x8rVLfaGOtYcmqkHHuSaGCuw5l
   yhnY4+xTOz/LiTRokClBYhQgr1ZlT6dchuKNsvghqnVCoiZWkjtb4a4/W
   5lkq1V5NakMO9e8iC8DRI6Lq9gDKJ14gezp8vMANfzi7tGNdB7o72f1Jf
   pGF5gJyreYcXbJRNqtiun55W/D0NBvedPSvxFi3lK62hKcsJGWTHHJA+I
   MXFGONwAm0klXuJhKtYlm/MhfIkPH3hrOTMDPrXWwB9yuGIOqjRCNaWmH
   0rimnvSKDwoPcI1kz4rlvPSuRXZhudjNTwwr6aFpU65NytCOqailztrtF
   g==;
X-CSE-ConnectionGUID: r75c3k4bQnyt+iGuOrRb4Q==
X-CSE-MsgGUID: jeP7dIvhTUmuuG5F+O7Mgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20402549"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20402549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 04:56:30 -0700
X-CSE-ConnectionGUID: 74vnOtYETzSkyadtP3BwMQ==
X-CSE-MsgGUID: 2nOcyWicTnufygQmQN/BcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="54673002"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Aug 2024 04:56:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZUPz-000vZ2-1b;
	Thu, 01 Aug 2024 11:56:27 +0000
Date: Thu, 1 Aug 2024 19:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 1040/1093]
 Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml:
 ^r(.*)@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties
 constraint
Message-ID: <202408011925.uhw9lgx0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml: ^r(.*)@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Tanmay Shah <tanmay.shah@amd.com>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   868286d51b5753a66ab89c1c899510c6047b998d
commit: 6691209c2d957b8ca72049bcd49900d12b3b886f [1040/1093] dt-bindings: remoteproc: Add Tightly Coupled Memory (TCM) bindings
:::::: branch date: 29 hours ago
:::::: commit date: 2 weeks ago
config: arc-randconfig-051-20240801 (https://download.01.org/0day-ci/archive/20240801/202408011925.uhw9lgx0-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011925.uhw9lgx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408011925.uhw9lgx0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml: ^r(.*)@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
