Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43F12AD13
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 04:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736225025; cv=none; b=lzIXG0fVxmK+x711rZCnu7Dv6GFLEslVpWjb0mZBE4lrs1+WUNnKvtU9G1I42MlzBx6dhXLz6GnMvuY3rULksbs13F7lWYLl85G78JNtyCZr84ISkJWvmvaaq27JzqRSjuUR9F0G7sCqepo7pgLNVFoDjCN2Ep3ONX4KXbi34CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736225025; c=relaxed/simple;
	bh=tnVOgnilAZTNdgS58PmLxY0avU0AOAm1Y6Qz9XOAs5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ch02JEMDWyRwOwcND0vlJjhjd41QIgNmHb5de92JjvIQE7rWfQOFvGDIyeh2+Po0fJQK9ncssHlBhuHNtiSoct9H2flxPefpIQOudwDXG3OifCRGPD5TWuFYyq4EskQKSW1jvOAbx6QEGc1Bs56t4torIzsDt/sMfHokjCF2vB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IevQ6BF4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IevQ6BF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736225022; x=1767761022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tnVOgnilAZTNdgS58PmLxY0avU0AOAm1Y6Qz9XOAs5A=;
  b=IevQ6BF4tA8F12d/tSCLS3kIIFX7pfnt/rpqNoKSef24C83zU58oaju0
   xECVjYNgvhpHmZoSseWag120XBOqnUqUmeBbUgbQoMa5GF4p4lblaobh6
   By2rl8SAuMTGf0t/+TSs/uMnaCgXZTVxJpEpqol80CVkue/fjSGsmP8R1
   arrjMFuAvkAitR4cFy8lboCli9goz2u8rINNw7m3JXXBqI6slF16D7IUz
   AtrRyDOwsZw8nYywaTGsqfjbJZdN78VNbkNPCpUsCmy0o8zJDFRcl4lMW
   BY1ZZCsCzpUakUlNDqy1wUSnqA8B96HEB0zthX2ed2TlPpdXaCZV1JKlw
   A==;
X-CSE-ConnectionGUID: MePxPKTIQSaBJRJO0aPQFw==
X-CSE-MsgGUID: u5wAZJKmS7qU6YIJgG3yyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="35689222"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="35689222"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 20:43:42 -0800
X-CSE-ConnectionGUID: rMfKH4MDQ0Ch7tKrh3jyTA==
X-CSE-MsgGUID: 49cARoIRSqSWvNDP/PWdWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="133507279"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jan 2025 20:43:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV1RK-000EFr-2U;
	Tue, 07 Jan 2025 04:43:38 +0000
Date: Tue, 7 Jan 2025 12:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: Add INA233 device
Message-ID: <202501071224.EDGORMWK-lkp@intel.com>
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
In-Reply-To: <20250106071337.3017926-2-Leo-Yang@quantatw.com>
References: <20250106071337.3017926-2-Leo-Yang@quantatw.com>
TO: Leo Yang <leo.yang.sy0@gmail.com>
TO: jdelvare@suse.com
TO: linux@roeck-us.net
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: Leo-Yang@quantatw.com
TO: corbet@lwn.net
TO: Delphine_CC_Chiu@Wiwynn.com
TO: linux-hwmon@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org

Hi Leo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.13-rc6 next-20250106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yang/dt-bindings-Add-INA233-device/20250106-151934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250106071337.3017926-2-Leo-Yang%40quantatw.com
patch subject: [PATCH 1/2] dt-bindings: Add INA233 device
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: csky-randconfig-051-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071224.EDGORMWK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071224.EDGORMWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501071224.EDGORMWK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
