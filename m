Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6531A9B32
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Jun 2025 18:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749666081; cv=none; b=cfbmdGaWTZsIdu3XccGjhreNrikyg/CfUaq/2lVmRtJ8VgxTzSZfQtgXc2mqBE4CuP9Vd2lxO+6ia3tcvDiT7GjIgYth4A/dt/TKTk9xIUgkgncFT1QBSZ2MqumfWvccUvpXYpRW03HEWRDfEtqQWmMiFoiv6HNxUapGlaUk/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749666081; c=relaxed/simple;
	bh=d4i7DzIranilRtT3JoU31WJChHBbzToZnIWLUrIqnkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C438QkoGelAEwAtilpxET2o2eJ7F3f8qDLrqsN1LpUNwULmGpopJh1V4lci6RIJNwA12OzMF5Ftxa2pLlZREcX4x6uEqIqqIgw8liOAPnT8nj/jGZHmwCb6yq683cHCZbnq4nNfp+Ek/9S8Fs9qbQ2jnqbCsdkAIQM0BSLcHBig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLOcNun9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLOcNun9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749666080; x=1781202080;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d4i7DzIranilRtT3JoU31WJChHBbzToZnIWLUrIqnkM=;
  b=NLOcNun9ftPfDkghCnqKMh8UNzwiirLMDDGbZmyjpxwBtriOsJsOb/G0
   MsglUOVUxp4FVe9qBXW982MTe/lB07XooQ17UoXwgK2RFirJaIBLyV9RQ
   TtUWnUWo1NeL3YcYGhwxa1UNhElSypgdm9/CuXQzzsZ6q2vmHPrlOr+5q
   SuccwoDo59WSw2YL6mMgJbvzZhQBjSHD9ly5U6Ke7TRYd/Qa7kQq0/q5G
   6jzkqhCIQlfvMipj23XqfLJ4wel+UqqOXN5RSNZeW+JDqzDcwv2fFqljb
   6O3WwYrgggKAuv60Rof3mMODse/6DmcPxFPPuy7SAhpkaiO1adCWWvW6L
   w==;
X-CSE-ConnectionGUID: v98Z10f2Q1ihX+SBmaOE7g==
X-CSE-MsgGUID: +2dAhUnQTVKr/Ggs42yE2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51043780"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51043780"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:21:18 -0700
X-CSE-ConnectionGUID: Ud3si/cmQdCt0Y+uk1OUhQ==
X-CSE-MsgGUID: Tp7NKzmnT46hXZVfRqc3Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147761070"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2025 11:21:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPQ4Z-000Alm-27;
	Wed, 11 Jun 2025 18:21:15 +0000
Date: Thu, 12 Jun 2025 02:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] Input: tca6416-keypad - Add OF support for driver
 instantiation
Message-ID: <202506120200.bJ7HIoQ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250610154609.1382818-1-jurenatomas@gmail.com>
References: <20250610154609.1382818-1-jurenatomas@gmail.com>
TO: "Tomáš Juřena" <jurenatomas@gmail.com>
TO: dmitry.torokhov@gmail.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Tomas Jurena <jurenatomas@gmail.com>

Hi Tomáš,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus linus/master v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Ju-ena/Input-tca6416-keypad-Add-OF-support-for-driver-instantiation/20250611-094643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250610154609.1382818-1-jurenatomas%40gmail.com
patch subject: [PATCH] Input: tca6416-keypad - Add OF support for driver instantiation
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: csky-randconfig-051-20250612 (https://download.01.org/0day-ci/archive/20250612/202506120200.bJ7HIoQ5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120200.bJ7HIoQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506120200.bJ7HIoQ5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/input/tca6416-keypad.yaml: pinmask: missing type definition
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
