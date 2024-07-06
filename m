Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6ED7D3FB
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720284246; cv=none; b=D59qJ9FhB1xc0upADg3tlJuJ6oPB1RuQpRd+0YU1C1BDtnJK47W5byLMaSjplzGgKzPfH2fKONZzZRCnIFkGs/BcXqI48DnEwQsCQaAanH3svxRYFVbCBW/yH/qEe7dQSxFXXU/PNlr+FYEUFrH9kdpeSQj3bxderfznC4e7xKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720284246; c=relaxed/simple;
	bh=cn4yITjYI9ZN/b1UP/RHdNpDeI7f0QzwQwNKG1nNVro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMwwfI/nYUbyNBk7MKDhATXISg/oNbPWm5by5fnVD2KPwPXqI1LsoPPcrGplGeeqxymS+LWed3KZxjBEtOxVmqhXlzsgrhib62zCouVfXCWi6lMiO56xfNP2p4s6LBelQ2ErlC0eMfinI1rRcjbGPJ5rSgPqRYTNVyQjNcdDa0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBaqlg8d; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBaqlg8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720284244; x=1751820244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cn4yITjYI9ZN/b1UP/RHdNpDeI7f0QzwQwNKG1nNVro=;
  b=XBaqlg8dHtb66W/jr7irunCVrB+ZYd3T6FYXPjFC0qSVOAyZ/u+ilPR6
   7JtBeM0M1tJWnXNfhaXT49wAS0DdQ7a/CZqrfwSQ/+FDWFp49+WdYXI2i
   1UB920a36Pa/mCmRudgDLW3BoMABugkJA8Xbs1jyVP/KS/Z61jkXR4v3R
   y+4Ia4gz3IeQWIyeH/q0iAOATA3DUBA8nP9FMNtOPwmAbIrZiBt3ruJKJ
   FPfXXPpnbVv0jBbyuFSM47vv0BxKbNLSStHYh3aDjzcdNVGRUkIfbfJyt
   gQu4MAXvRNzz9mU8SnY/G6wxF8Md9ZbpsE9/QOv3kpaBy58j51523VcrT
   g==;
X-CSE-ConnectionGUID: T9n63XFCREOYPCt2Tw8eIQ==
X-CSE-MsgGUID: DrG79rUDQIKE4yrfXZWMvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17356030"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="17356030"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 09:44:03 -0700
X-CSE-ConnectionGUID: V8UM72JmQoaN+JtDZVMrcw==
X-CSE-MsgGUID: Sdcecxl3S2OmnHVhXVqI6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="84652049"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Jul 2024 09:44:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ8W0-000U3B-0y;
	Sat, 06 Jul 2024 16:44:00 +0000
Date: Sun, 7 Jul 2024 00:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: pressure: Add Sensirion SDP500
Message-ID: <202407070030.GI9XWacQ-lkp@intel.com>
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
In-Reply-To: <20240702-mainline_sdp500-v3-1-0902047b3eee@gmail.com>
References: <20240702-mainline_sdp500-v3-1-0902047b3eee@gmail.com>
TO: Petar Stoykov via B4 Relay <devnull+pd.pstoykov.gmail.com@kernel.org>
TO: linux-iio@vger.kernel.org
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Petar Stoykov <pd.pstoykov@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Petar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ab27740f76654ed58dd32ac0ba0031c18a6dea3b]

url:    https://github.com/intel-lab-lkp/linux/commits/Petar-Stoykov-via-B4-Relay/dt-bindings-iio-pressure-Add-Sensirion-SDP500/20240702-235054
base:   ab27740f76654ed58dd32ac0ba0031c18a6dea3b
patch link:    https://lore.kernel.org/r/20240702-mainline_sdp500-v3-1-0902047b3eee%40gmail.com
patch subject: [PATCH v3 1/3] dt-bindings: iio: pressure: Add Sensirion SDP500
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arc-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240707/202407070030.GI9XWacQ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070030.GI9XWacQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407070030.GI9XWacQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/pressure/sensirion,sdp500.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   $id: http://devicetree.org/schemas/iio/pressure/sdp500.yaml
   file: Documentation/devicetree/bindings/iio/pressure/sensirion,sdp500.yaml
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   hint: Standard unit suffix properties don't need a type $ref
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   hint: Standard unit suffix properties don't need a type $ref
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
