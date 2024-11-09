Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C597D1DFFC
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731164451; cv=none; b=Q/Wqp3zpsk7KhAExQfnY79NtSLgv6jJIyfCVBqiMT8Lcy5/bU0Gbr4lmVcuGz6umhFrs3gaah73rStrnhq94x50OTZVo7WXW69rPeMgyogGetdaNVJ7u0ie/5jIxtOyaStlZ0uYaR3o5EVIisk4ix1ca8hPxovLhYPtyIkHcI4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731164451; c=relaxed/simple;
	bh=KIzzeBW6LCwHoo2SZOXQwSC0E1h6oe3rOPZzwsQGJWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aIBqSfbdtNvhhGcbyPsoxrhBiX9EoDe85y3daF47sx+ua/9WId5zhcU0xcz9McpMnspT1m/0fLgkFnoBdTkOEAV4S2fDEBK2ovX45H7ypwXEdAJImtBRegtH95YroUhPUoUxrUU7wFQaGN+dxDaEaX6gZ1FdjnNityqFfZ7LjT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTQyZEKc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTQyZEKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731164450; x=1762700450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KIzzeBW6LCwHoo2SZOXQwSC0E1h6oe3rOPZzwsQGJWo=;
  b=HTQyZEKcXFxYXQ5CO07yOBSFM8kzib7OesepZIJ6JPwy791nMzoJBlGe
   Xv0Lm83Phm7iqDVVRIeuwvcNsHuuKgIah1zIVh+MG07jrOa0dEc2s9oLz
   O/Xq+/kgIwMgBeyKrh322TtT3UmgZsVepfOMcIkPNsekLTPsiI6+O2N1N
   RcHPH7oyT9Y1U7SkiNRISWg+fhRIkbqeVwtC2dn0cmAvnBzwdSEBn7GGx
   SL1weX6xKDqAl2qG21vypa5rj2Nlf2n68/D3LNL8XM83UGY3c0l6lABrj
   BZJD5q6vYK6wCn0511YrVYTDi2l3efF6+WZIPg7fLHFhLuNJbG70Re8DA
   Q==;
X-CSE-ConnectionGUID: wwZK2UMpQ5KviI4Gj/Bp8g==
X-CSE-MsgGUID: bIa0nA9UTB6TwoYLumNkxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="30913979"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="30913979"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 07:00:49 -0800
X-CSE-ConnectionGUID: +vOt0EWJQwySZ2Oc6nb+mA==
X-CSE-MsgGUID: iTGKEMOeQWaM2CEBLQX+cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="90760552"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2024 07:00:48 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9mxC-000sQI-1O;
	Sat, 09 Nov 2024 15:00:46 +0000
Date: Sat, 9 Nov 2024 23:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/4] dt-bindings: power: supply: max17042: add share-irq
 node
Message-ID: <202411092202.oMUq9Rrm-lkp@intel.com>
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
In-Reply-To: <20241109-b4-max17042-v1-1-9e2b07e54e76@gmail.com>
References: <20241109-b4-max17042-v1-1-9e2b07e54e76@gmail.com>
TO: Dzmitry Sankouski <dsankouski@gmail.com>
TO: Hans de Goede <hdegoede@redhat.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
TO: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
TO: Purism Kernel Team <kernel@puri.sm>
TO: Sebastian Reichel <sre@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-msm@vger.kernel.org
CC: Dzmitry Sankouski <dsankouski@gmail.com>

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 929beafbe7acce3267c06115e13e03ff6e50548a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/dt-bindings-power-supply-max17042-add-share-irq-node/20241109-204639
base:   929beafbe7acce3267c06115e13e03ff6e50548a
patch link:    https://lore.kernel.org/r/20241109-b4-max17042-v1-1-9e2b07e54e76%40gmail.com
patch subject: [PATCH 1/4] dt-bindings: power: supply: max17042: add share-irq node
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: csky-randconfig-051-20241109 (https://download.01.org/0day-ci/archive/20241109/202411092202.oMUq9Rrm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411092202.oMUq9Rrm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411092202.oMUq9Rrm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml: shared-irq: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
