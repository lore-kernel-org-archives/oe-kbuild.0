Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D6439844
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 17:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDjjvR5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703008125; x=1734544125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z6+fi7V8QymWruA5M2X5CnSdItb0izRGmy2nnNAtGYI=;
  b=UDjjvR5t1VXbcuVbKsoSquOzfIinntpzGvWKf8UJjDqF0a1F2ro30EQI
   iUUebdtNyrACCUW/B9mOX/FwBBUOD7j5ofgkr6UqL5h5MWDYEWmPR4cDq
   XXxfAqz7nGNRTA7j/IAlJ9wPlTDW0KHT13YO+f9OCM/M8pPZNOB2vhp6L
   M49x3pVBgkyr8bmeafM5GowOIQGguR/wmNsE1DcqQYPBy3ZyjE1C71liI
   GWxCOpNIu1UhNz2LJAgMDhSbIXrr5JeHS6IsUQxRWHiM23JsObpfrReD6
   pXhjEY+Vz1Zxzd+dTGY8VaQ6aK+V8O1+YbsxpmSDPVzmAVrJlSQLJ7uJw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="426830284"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="426830284"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 09:48:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="899448228"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="899448228"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Dec 2023 09:48:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFeCV-0005ll-1e;
	Tue, 19 Dec 2023 17:48:15 +0000
Date: Wed, 20 Dec 2023 01:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
Message-ID: <202312200129.7EYVeOyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231219080021.2048889-2-kcfeng0@nuvoton.com>
References: <20231219080021.2048889-2-kcfeng0@nuvoton.com>
TO: baneric926@gmail.com
TO: jdelvare@suse.com
TO: linux@roeck-us.net
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: corbet@lwn.net
CC: linux-hwmon@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: kwliu@nuvoton.com
CC: kcfeng0@nuvoton.com
CC: DELPHINE_CHIU@wiwynn.com
CC: Bonnie_Lo@wiwynn.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc6 next-20231219]
[cannot apply to groeck-staging/hwmon-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/baneric926-gmail-com/dt-bindings-hwmon-Add-NCT7363Y-documentation/20231219-160534
base:   linus/master
patch link:    https://lore.kernel.org/r/20231219080021.2048889-2-kcfeng0%40nuvoton.com
patch subject: [PATCH v2 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231220/202312200129.7EYVeOyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312200129.7EYVeOyc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/hwmon/fan-common.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
