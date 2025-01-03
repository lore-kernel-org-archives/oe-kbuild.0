Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D19833991
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 05:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735881855; cv=none; b=tXpMk/jqJQpzc5SH6c7uEc2U8z1UUdMDypEWm0/FLncefP5Maxx7AF/oKHa5Xdj2LwsIAQVKQ5Zq5R1l0oDzMw0nHyBDpz9aU/QM/f+oZtZIYiBNO52t9EPpYhdkOGmFv4rX7i9EFO8Q+dxgiYXZQtNj81XxQoWZjnayZjifdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735881855; c=relaxed/simple;
	bh=zYDxr5LwmghOpdp5tc9u2KY6ocUdUtKnJ3q/xjOQ4qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nYs5fe5mJ7PkE+nS5fcLQVDo9xFPaRI6w+FJH5OOSziVLqvUSfYYGbp0sFQ+DqhYV90tgcOkKqmB4eta5Z8D3fdlWNKInARpSqjL1Huq1HgritTiLcT2PIpyb9ELZCnkHjKS3p+fPIYs+3n9nPOytHTZj3oSlSckIXyBgthNjfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aa26Pd5o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aa26Pd5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735881854; x=1767417854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zYDxr5LwmghOpdp5tc9u2KY6ocUdUtKnJ3q/xjOQ4qw=;
  b=Aa26Pd5o92KvUdqmbR5Zt5qG0bpKK5Pmp12mGzzeHOdG2nOCJSWjiQxR
   KXCqeAyL4rMpfuulWV3ZyjSp3CLOIAA09UTr3MzF96ay91JX59fISgPda
   qsLsdnr2uNeE7xgbsbNIBIKX9RcsPhjjZgXsImPQelvU/FYsmFUdGkzdS
   p7GX38CLMpyhAxBIG5zt0wzpAfe3r/cJX3Yg1NjKRbqBMVAJW+JJJBdjr
   IRHBoX+GV7ii8AhbKh87/mQVBNoao79U/FmcmsWVgDqYI2Y7yQHoNe8ze
   LjSF1J4Kh4rrzn4IvwxWSsCWhTJJIrfhv0jsJkp7ghap9j4yYQJkAxcgy
   Q==;
X-CSE-ConnectionGUID: b3fRdIUbR/SMHMN8taw+Ag==
X-CSE-MsgGUID: 4xw09zkPSsuN2qtHkFTPSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="58596232"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="58596232"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 21:24:14 -0800
X-CSE-ConnectionGUID: dRbQCRzHS2So/V/wKoAiGg==
X-CSE-MsgGUID: +MtJCx5hSUydcpcjagOWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101547769"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jan 2025 21:24:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTaAK-0009Fn-1Z;
	Fri, 03 Jan 2025 05:24:08 +0000
Date: Fri, 3 Jan 2025 13:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
Message-ID: <202501031337.HF9C5T1I-lkp@intel.com>
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
In-Reply-To: <20250102175041.822977-1-peter@korsgaard.com>
References: <20250102175041.822977-1-peter@korsgaard.com>
TO: Peter Korsgaard <peter@korsgaard.com>
TO: Guenter Roeck <linux@roeck-us.net>
TO: devicetree@vger.kernel.org
TO: linux-hwmon@vger.kernel.org
CC: Peter Korsgaard <peter@korsgaard.com>
CC: Jean Delvare <jdelvare@suse.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: open list <linux-kernel@vger.kernel.org>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Korsgaard/hwmon-pwm-fan-Make-default-PWM-duty-cycle-configurable/20250103-015336
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250102175041.822977-1-peter%40korsgaard.com
patch subject: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm property
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: csky-randconfig-052-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031337.HF9C5T1I-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031337.HF9C5T1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501031337.HF9C5T1I-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/hwmon/pwm-fan.yaml: default-pwm: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
