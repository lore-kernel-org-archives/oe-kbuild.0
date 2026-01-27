Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB172135C5
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501913; cv=none; b=fVZlHKf57GsrZZo9Ueox4aupwIvVPKSpZey5HpO8wYdiMWWqPywAQuJFkAQhZQxbaqHnA7/8XNhnknTIspugQzK6vIDm7PcY139syn1w6dcfyopZ/xzxt/9jlFCGdq1V++R/PFOt++SmuU6XUpGTL62FH4uCYyO1QbyooYkhZoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501913; c=relaxed/simple;
	bh=BjpRymknzErrkmuQgn2RLstbLE0dnfSjIoOEXZH2LkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENuE7Qg5xpsZnAumi4FQkyiN4yUKI/IjFhxU/xHAzfS2vIHYBxlTlTUjx5MM7Mal7fizxf00ycIa0pAK1VUJ4uyd9nwNH9Rq8GieGP4UgZy2RCj75hlVR/rdUfqrLIiSSTRN0KDe++g/d78oD1zqFxahw2mzIOVrWCCVXKSvpV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcxkXgrP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcxkXgrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769501912; x=1801037912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BjpRymknzErrkmuQgn2RLstbLE0dnfSjIoOEXZH2LkA=;
  b=KcxkXgrPCe6H2zaY7c8vN+hTb9qlOMN8ipn9OgZQaP0FydzmfC109bHC
   Rh0YzRBhJTAdGnhKsUJbLD6CZ/IDMoIKJcExF6onSKgdPmxIIPq93Dzw4
   jZLY/iTkdzZvuBOuqNNULRmgjP0oAdMfkRTNmU8yerp3HHthCHPivju2C
   rjTFCMId76S4+5b419ByK786b9zqsk8GLlQYlN4LylMvRqJpEu9bQtlJU
   /Loj4tzTytNC29AsGMQVbfgTPdc3Ra+lqtuYRNafuUoa2vgDrrAkpesd7
   d1uEuYRigM4Pcst/sY9yZmgsGbSLjTxtVIhFp3PwuqR9csWyZmumUkSDI
   A==;
X-CSE-ConnectionGUID: BTJM5JlZR+KwOxJoFlisjg==
X-CSE-MsgGUID: NKv21POTSoSY2/7u5bAQZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70748534"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70748534"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:18:31 -0800
X-CSE-ConnectionGUID: xmHYqtIIRjymqk5Efgqh3A==
X-CSE-MsgGUID: 6w1H39n8Sl6z4G3g4e5ssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208155769"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 00:18:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkeHM-000000001k1-1K5W;
	Tue, 27 Jan 2026 08:18:28 +0000
Date: Tue, 27 Jan 2026 09:18:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add Asrock Paul IPMI card
Message-ID: <202601270919.F407QuO4-lkp@intel.com>
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
In-Reply-To: <20260125-asrock-paul-v1-2-956085a4bd06@gmail.com>
References: <20260125-asrock-paul-v1-2-956085a4bd06@gmail.com>
TO: Anirudh Srinivasan <anirudhsriniv@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: Zev Weiss <zev@bewilderbeest.net>
CC: Renze Nicolai <renze@rnplus.nl>
CC: Anirudh Srinivasan <anirudhsriniv@gmail.com>

Hi Anirudh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Anirudh-Srinivasan/dt-bindings-arm-aspeed-Add-Asrock-Paul-IPMI-card/20260126-050544
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20260125-asrock-paul-v1-2-956085a4bd06%40gmail.com
patch subject: [PATCH 2/2] ARM: dts: aspeed: Add Asrock Paul IPMI card
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-2051-20260126 (https://download.01.org/0day-ci/archive/20260127/202601270919.F407QuO4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270919.F407QuO4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601270919.F407QuO4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-card.dtb: /ahb/apb/pwm-tacho-controller@1e786000: failed to match any schema with compatible: ['aspeed,ast2500-pwm-tacho']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-card.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
