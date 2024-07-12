Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C0612E4D
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 21:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720819132; cv=none; b=sKRPLoOBYfNnhKOUAOY7Poc7oJmSyzeM3gOQ+7sMU84R9rP8XgBMHf1mqp+5mRg9zturodxy/Plk61ld8WjcDm58l9Tvoe8bTs/eAtZT1/oGuVfmxRrrVC5hsWqwgdRnUktcUlWGxsGvdol4mJ+Larnww85p0zbvHdo5rD73AL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720819132; c=relaxed/simple;
	bh=5OXMz2ahjyqhF5999qxg/irrmY8Est5eaHtbul6fOXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tv6QLWwCJggzXrkZIcfJw0cKXrhUG+9vusf87TNQLDn+yNYXYV9wApslMtqXPXnC12AWVAobyROszQ1wvqwa+8Mb0xHjnN4xlIfbTjatdyrtUaJ/wxmT0AiZHXI7B2sEVP5OnkNHFS5sxO0jjhGm4twMy+A/6n7A8ajRPbzTb7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxUXTD73; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxUXTD73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720819130; x=1752355130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5OXMz2ahjyqhF5999qxg/irrmY8Est5eaHtbul6fOXo=;
  b=LxUXTD73hOn5i1COO/NGy7ATo9ywYYx0/3JEvAon9tFxlB9RPln/FPgJ
   nHpvSiJXcxa6yTT8jJeZM+cf+JXZy//PMWshtuxUCXzL1DMptumxPzipU
   xnqR5VQ7e3WxS0047IGZw+t7dL/ZOKL72cEe/1VXatUei3v3cI6Xspg6N
   gCpdS+a5AxNXOlTOtnJZdZNC6OylcOYI0FVJvoOdh/GTzDZq7AVjST8KL
   9Apt8hSrO9Fv0S6FjKkOmXBCanDwgrjtwKN5WAeqvZaMf725DQF5GSFYT
   qpg+dI9IWExGshLsq9gtiu48yeIJ3E5+9jjwsIHfUr1goAWhfv3rBFzTF
   g==;
X-CSE-ConnectionGUID: z0X/iujOQaaw18Fb4KbMyQ==
X-CSE-MsgGUID: 6kg22JcoSeun5Eao0HsOLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28871194"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="28871194"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 14:18:49 -0700
X-CSE-ConnectionGUID: HdGX+3fmQgStB2MktWjOUg==
X-CSE-MsgGUID: tTNiVqpDTxafSVM4CiW0Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="53979279"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jul 2024 14:18:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSNfB-000bJ1-3D;
	Fri, 12 Jul 2024 21:18:45 +0000
Date: Sat, 13 Jul 2024 05:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V3 1/2] dt-bindings: iio: Add YAML to Awinic proximity
 sensor
Message-ID: <202407130548.nreRjeKS-lkp@intel.com>
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
In-Reply-To: <20240712113200.2468249-2-wangshuaijie@awinic.com>
References: <20240712113200.2468249-2-wangshuaijie@awinic.com>
TO: wangshuaijie@awinic.com
TO: jic23@kernel.org
TO: lars@metafoo.de
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: waqar.hameed@axis.com
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: wangshuaijie@awinic.com
CC: liweilei@awinic.com
CC: kangjiajun@awinic.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 43db1e03c086ed20cc75808d3f45e780ec4ca26e]

url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-iio-Add-YAML-to-Awinic-proximity-sensor/20240712-194024
base:   43db1e03c086ed20cc75808d3f45e780ec4ca26e
patch link:    https://lore.kernel.org/r/20240712113200.2468249-2-wangshuaijie%40awinic.com
patch subject: [PATCH V3 1/2] dt-bindings: iio: Add YAML to Awinic proximity sensor
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130548.nreRjeKS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130548.nreRjeKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407130548.nreRjeKS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/proximity/awinic,aw96xxx.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
