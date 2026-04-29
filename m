Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA68735E94F
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Apr 2026 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494925; cv=none; b=kBXoMcP5E6h3XGmvezEFKpHij7HFXFe8qT8jpxp+aafJA18CA13zVnnjMujAEqoZmlYWPP5AkNGSxshjT3NvjTWMeXdeYkht9cZ6J5JCzTpWQkOVdVKtYuCT4kDqRCUUs1/8j0NVvvTCK4j0kYaB2cZWZhISdawhwe9Q2Ufc9fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494925; c=relaxed/simple;
	bh=ChzjmQIyllHpBrPJRohoTKDHiOgL3JmG92M+hZekezA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BcJTq5YR37ar48YrZBFDfsCTTfyFX85OICHupR3+qUsl6skbgSo4Ri9bsEhQ/CTzsB4/PD3v7nJGvP0hHAJZZzOHneuuaNdG5a053XWzSn6RDB0F14W52fWfun3i73hpCpCVHU0C2VG+yNefZ05/7twNnlwtPsamreYkaGuqiCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApP1jYzT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApP1jYzT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777494924; x=1809030924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ChzjmQIyllHpBrPJRohoTKDHiOgL3JmG92M+hZekezA=;
  b=ApP1jYzT9s0vlvfJ+AbKpVzdnmwjaPhcWrgk4/fyE3jKYzVKiVooU75B
   n26RmHlboZ8oLGCV1Nbkqg3LP0xG13MEpque3YF21saLT5guw+lYxWPS9
   09XLkA4bGEmXt9XFM4FIY826kHYRRIzeYmjITY7Bi+9SR9e2n1FS2YxGm
   uAg+2xDnkBW1NkUxaiWuPcD/r64tr2IBDwzSZ2KJxEBr6H1UIxOxEFkwj
   HjqXAefkbmYrHYKpYm8IUZE5VOkkgb7jhDsxAIlJV7KJ4OmSrm3Waqjk0
   8VHpJma4+gmgYeBXzOuUqnQmb14lzlBH7/5bDIpHILOInJj4x94Yv0CYi
   Q==;
X-CSE-ConnectionGUID: IHwkBQa+SLuGBcYLoXaTvA==
X-CSE-MsgGUID: OFm446tCTSu/ZMfiyr/heA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78456627"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78456627"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 13:35:23 -0700
X-CSE-ConnectionGUID: k+AUOd6FTiKz+6o6/0xxWg==
X-CSE-MsgGUID: K6ZQMwQwTyuAX2XMfEg1Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="236146147"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 29 Apr 2026 13:35:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIBcu-000000004ZR-2Hb5;
	Wed, 29 Apr 2026 20:35:20 +0000
Date: Wed, 29 Apr 2026 22:35:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 RESEND 5/5] leds: is31f132xx: Fix missing
 brightness_steps for is31f13236
Message-ID: <202604292257.DLw8fuiy-lkp@intel.com>
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
In-Reply-To: <20260428003412.322032-6-jerrysteve1101@gmail.com>
References: <20260428003412.322032-6-jerrysteve1101@gmail.com>
TO: Jun Yan <jerrysteve1101@gmail.com>
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-leds@vger.kernel.org
CC: lee@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: luccafachinetti@gmail.com
CC: pzalewski@thegoodpenguin.co.uk
CC: daniel@zonque.org
CC: Jun Yan <jerrysteve1101@gmail.com>

Hi Jun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jun-Yan/dt-bindings-leds-is31fl32xx-convert-the-binding-to-yaml/20260429-120617
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20260428003412.322032-6-jerrysteve1101%40gmail.com
patch subject: [PATCH v1 RESEND 5/5] leds: is31f132xx: Fix missing brightness_steps for is31f13236
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: csky-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260429/202604292257.DLw8fuiy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604292257.DLw8fuiy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604292257.DLw8fuiy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/leds/leds-is31fl32xx.yaml
    	file: Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
