Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB1622C32D
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740659155; cv=none; b=jw+EqbYZ3tnW4e86sLdf0CtBpfyCBaxJ7QoC+QGcI6EHs4cXiXxeX9m4jpuJEZw+My6ma22plfQ/c7SnsNqhUEhv91zy+EkC5hWpsnXiZLTbTETt4p/3oc+T81L/LzCHcD3zfHI0WO3RERmqEQNl7+OSsQ6E9lk4rR7pyEfPxXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740659155; c=relaxed/simple;
	bh=qI3xSYhzygHzJyhhSU8UQTZC5B+/hQldwQNa+jEtKtA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dHANPiNM2E8jDaR8Sqiuu15rIwSf0SxN8IQX/9nxFg5zPbakZCZzM2bMFiS51UcIZH8yxxyQp1ft/uLnrsaw0+5tTuRMu7D/MbFbHjb8ssSrUUIf5S55ndVA4ZS0BIHGPRcZhucyevWnfT+IcD54aZT36TZNZNbCLEuwljar0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeUbIg6+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeUbIg6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740659152; x=1772195152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qI3xSYhzygHzJyhhSU8UQTZC5B+/hQldwQNa+jEtKtA=;
  b=SeUbIg6+t83o1+ZqlmeD8RrCI0JIyluFPe1icT43qi25KKdB/TCCWmfN
   wPnZrJ9fLNfeYi8rXWgkZji4hgha8p6NG+0VpBghuaPW2YxvMYckrmeBw
   FGNaJdjUVA6zBbfJvNe96kVamBofbzzlxq9elHvQXyn9G4bV+5ilzs4Of
   BoaP5sS3hAm5Rv7AhzFKUlBlov4lvC0DY0sv5A7cBhDyMChjrUvS2FwdQ
   hiH0rpjn7xKWyF4XD+xmuAuZlm1trZ2MvDdnY+ZMPGk5cZzAWmZLgp6Fo
   2eq3syLBBkMMBVSaGrPU6PMw6gNBr0UFbisklUuM2fKHacCiT4/Oft+5r
   g==;
X-CSE-ConnectionGUID: gWwEtKCUSKWhmUhfk+bTZw==
X-CSE-MsgGUID: 74hA/yrgSFCgu+QQIYuP1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41428736"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41428736"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 04:25:51 -0800
X-CSE-ConnectionGUID: vs5CgAeWREqTkLvzXEbQ9w==
X-CSE-MsgGUID: +DAjrYtRRpaXxSRvbPiWXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121140999"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2025 04:25:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tncxX-000DLG-2L;
	Thu, 27 Feb 2025 12:25:47 +0000
Date: Thu, 27 Feb 2025 20:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Message-ID: <202502272019.a37Bi8kD-lkp@intel.com>
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
In-Reply-To: <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
References: <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
TO: Ryan Chen <ryan_chen@aspeedtech.com>
TO: ryan_chen@aspeedtech.com
TO: benh@kernel.crashing.org
TO: joel@jms.id.au
TO: andi.shyti@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: andrew@codeconstruct.com.au
TO: p.zabel@pengutronix.de
TO: andriy.shevchenko@linux.intel.com
TO: linux-i2c@vger.kernel.org
TO: openbmc@lists.ozlabs.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org
TO: linux-kernel@vger.kernel.org

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20250224-140221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250224055936.1804279-2-ryan_chen%40aspeedtech.com
patch subject: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: csky-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272019.a37Bi8kD-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272019.a37Bi8kD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502272019.a37Bi8kD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
