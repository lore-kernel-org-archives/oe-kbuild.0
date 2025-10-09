Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9425B2556E
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760031073; cv=none; b=Lj41i0Qnu6yGTu6ABMNt26k2FbkmiGbfgJBQGsjvmHa+yKGsRH2RJy8gvGv89V/s0BVQYlD+kRfEEQefDJVRwHaEmVyuFOLZKkxM4wRK2uV1tWJEnuurRenPB/wJulROAWcUaup8MHYE+qXMMB3rcrGn8AvLhfF4ulp/veWD8mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760031073; c=relaxed/simple;
	bh=3sihRTnYL5BtiYj1VEKqKC/F4Se5tuK3adDExQ1ro5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OrAsWwFvFeG3R6U3OTCxebhUTthLwu7KMHxbHV/cQsJ3hpyEhnPpZxJBcsnt4zkYacXGpv0bztbP0Yh4zizAQAngiSI34GHKhcGgheAE5jBSeCg/NIfWpLtlnjKzoyfx9fgnzqfWE1LQKAtvZLx9ydGz6BpVb/d1GN75vOwUeTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2NBpdmH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2NBpdmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760031071; x=1791567071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3sihRTnYL5BtiYj1VEKqKC/F4Se5tuK3adDExQ1ro5M=;
  b=Z2NBpdmHLssYgng/oTFcRsLiHQZACc3HrGMZPKcsqOKnJ0cU+/e5oDD9
   4bJbJVvsgLw8vYPUSNjXnPwOOf1YogCKFUNNFKGRGlP9mAopaKsgsUSJO
   nauLnBPA6Nom11WopiZGe2OvPTXA1bH6b2qZ953blZZ+wQSdmM47e9MKF
   viGR2vvMU0ODajl08VpENS5lsU6QWEcYAP7CJx2LWQLxPBnEO0/Ts9Je7
   xQPJaArJNY8Qft5VPOMPe4y6QB+gSwDhncOwkDa2zdUB7qramDBpNZQZy
   0CgAKCmuhAuPfkHa8/0CCITGWer3rXxdDn9scwzCliR5D319L65c+DmJu
   Q==;
X-CSE-ConnectionGUID: bLSydWqVQZ6l0rARrKJLvg==
X-CSE-MsgGUID: 2DlEzQRUTXy4lyqPgRXp4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66079344"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66079344"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 10:31:11 -0700
X-CSE-ConnectionGUID: Z1jSgWIqR5+4iSGXVbvznQ==
X-CSE-MsgGUID: /la7T7RASI6RoY8Gn+Dotw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="180797333"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Oct 2025 10:31:10 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6uTr-00016Z-2y;
	Thu, 09 Oct 2025 17:31:07 +0000
Date: Fri, 10 Oct 2025 01:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: iio: max30100: Add pulse-width property
Message-ID: <202510100150.GBDQTIaM-lkp@intel.com>
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
In-Reply-To: <20251004015623.7019-2-raskar.shree97@gmail.com>
References: <20251004015623.7019-2-raskar.shree97@gmail.com>
TO: Shrikant Raskar <raskar.shree97@gmail.com>
TO: jic23@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: dlechner@baylibre.com
CC: nuno.sa@analog.com
CC: andy@kernel.org
CC: matt@ranostay.sg
CC: skhan@linuxfoundation.org
CC: david.hunter.linux@gmail.com
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-kernel-mentees@lists.linux.dev
CC: Shrikant Raskar <raskar.shree97@gmail.com>

Hi Shrikant,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.17 next-20251008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shrikant-Raskar/dt-bindings-iio-max30100-Add-pulse-width-property/20251004-095849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20251004015623.7019-2-raskar.shree97%40gmail.com
patch subject: [PATCH 1/2] dt-bindings: iio: max30100: Add pulse-width property
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-053-20251004 (https://download.01.org/0day-ci/archive/20251010/202510100150.GBDQTIaM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100150.GBDQTIaM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510100150.GBDQTIaM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml: maxim,pulse-width: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
