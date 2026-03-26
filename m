Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A53521B9DA
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 08:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512043; cv=none; b=kxWt3Hq4cRyoKdscQIsxNOvIpBfjI+Jbx6ltIDxkJ0jJatnGdZMkazKpo4cQb4X1wjrpeCVhA1ILYzmnSXNFwVn7J74etiPcdTGIbH5f8SzTmFH2j2zgEwTKELxCqCwaCN0leW7y2P/RwYeGpXZ+BF1uoRbwZwK4pRAwBiwrPsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512043; c=relaxed/simple;
	bh=NP38tNgpUAuHwEhb0VpbRgB5hw3gKdJmMO4rw5zcsDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HBNLR7PXLrPXlHM1deCAZXQ54pGC4LKn0W8K08xIYzpWzUN7Ri8Z8UJWxqLfdBAuddsubhiRlMn0xsTMlGk10+QxfabzyUjZOr4etAs9pSbfsTIlMoAeZiM+cLp9VckY8vnhI8MK7Uc1OahFyjlTTyVhknWGlmTNruTBIO8kMus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cS3qXGxO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cS3qXGxO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774512041; x=1806048041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NP38tNgpUAuHwEhb0VpbRgB5hw3gKdJmMO4rw5zcsDg=;
  b=cS3qXGxOpsLDAm1SbxAGyhs3tZZ3kQnWvyhY5pEcE4bguURGW+Nb0G5d
   TRXprPHCfF6gBQgMtK8ztWE+cshOOITVLRYxoEmRqM8G095DKsPRDyQmo
   WdAFDmWkvJY1qzkDuC7n1N5MQMoOg5o+udSJQBgyb0P1y3YDqKjeFzWHn
   qq9nRrshCjw5sjdo06DNsNpSYBp6sjJb9C5s7w/+H5XH/M6IiDb4sr94y
   LPy5PMxFp8cFpri2nsRFEQUELihCaSABh6yBSM4qBIUgtXQ3sXJAmTPSd
   5EUZ6O7D69JmmUdQa8QbpHLhnQXLDmRsu1ohAZIftHyIh4lNvgE9aNNz/
   w==;
X-CSE-ConnectionGUID: KpLFfC9TRxW3Tu0pAyWfpg==
X-CSE-MsgGUID: RlziYIGxR5e8LKeY3CCrAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="63113999"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="63113999"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 01:00:40 -0700
X-CSE-ConnectionGUID: 1xz0Wua8QTS1c9wIoK3AHQ==
X-CSE-MsgGUID: h0Ty4yGIQnykuVh53C40UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="222028920"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Mar 2026 01:00:39 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5fdt-000000007F3-0o4v;
	Thu, 26 Mar 2026 08:00:37 +0000
Date: Thu, 26 Mar 2026 08:59:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] dt-bindings: iio: adc: xlnx,axi-xadc: convert to
 DT schema
Message-ID: <202603260807.GBSeWCi1-lkp@intel.com>
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
In-Reply-To: <20260323074505.3853353-5-sai.krishna.potthuri@amd.com>
References: <20260323074505.3853353-5-sai.krishna.potthuri@amd.com>
TO: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: Nuno Sa <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Michal Simek <monstr@monstr.eu>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: saikrishna12468@gmail.com
CC: git@amd.com
CC: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

Hi Sai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v7.0-rc5 next-20260325]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Krishna-Potthuri/iio-adc-xilinx-xadc-Split-driver-into-core-and-platform-files/20260326-024045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260323074505.3853353-5-sai.krishna.potthuri%40amd.com
patch subject: [PATCH v2 4/4] dt-bindings: iio: adc: xlnx,axi-xadc: convert to DT schema
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: microblaze-randconfig-2051-20260326 (https://download.01.org/0day-ci/archive/20260326/202603260807.GBSeWCi1-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260807.GBSeWCi1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603260807.GBSeWCi1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/xlnx,axi-xadc.yaml: properties:xlnx,channels:type: 'boolean' was expected
   	hint: A vendor boolean property can use "type: boolean"
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
