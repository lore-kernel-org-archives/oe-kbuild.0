Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F4B3A1A37
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768940814; cv=none; b=jf8ClU1EVbEH1cm1wZYwHWCA4JLLRcRrMlZDVSOsKGbsCrgNLhFh2c1uqy4HeyJ+WdZbAzyu6NJCQkXPZhNRf1Wtf3Nko6icGk4dQRUURS1HX1WUCymIfQpjY/EHM99ZeJgccL9vdbX5il8C+MwDaoxU4IdtHlykVpYj/3eAaYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768940814; c=relaxed/simple;
	bh=+qL5BcgfAv+ZLmrRo+obOHe5p0tRts24D17meGO6yNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R8yngO2cz+Fu5xFRr1UkFzkqnwKB1ncIT7JSNjeZKSLi7mn4mCNF9SyHSdsZLaTfLYJTIuy1wO7zFtwbtqJk1nQohCXLsvyFx6AIMxcHlf8fiUlCT6uvUUODggihsg8ZFE7gcUK/x/ICKdF2mlq6wNk9MH1oAhPJz8RCsR2OojE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTfjasKk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTfjasKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768940813; x=1800476813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+qL5BcgfAv+ZLmrRo+obOHe5p0tRts24D17meGO6yNk=;
  b=YTfjasKkyPp85K4r5uJavXHqUHTiT1e7JaZO/7P8p3OLWroYBrW6IaZ5
   rcypGWfay6KvqNyDlxcdBkqKABA86+mjzzjXaBjvfLNxXK8lRn+AVy9dC
   3oF4KhofEn9kDyasVzN7Q4Bs4ViiNuVgiFTb6n4FPpAV2Cw5b1f9LIUND
   IvtK/ReyxZ+Xgtram8WrXDUM/AE8Up7/JEkrayjUdECnoCaJrJa/+uZf7
   P0eSHIFKu2fATOq1cllbC4RIBl4pwJQIvjKKfkqkWMWS4M0ecpsmZiA0f
   3cIOIV0uBL5wr8V5M4XTNpRHWsczXbLfU1NAw74Ja87z0atO8A9Sn8BAj
   g==;
X-CSE-ConnectionGUID: DTlmwfyhT6GOr7/IxjBfeA==
X-CSE-MsgGUID: 41VMpu+iQMe0Y+wxGmhkMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92827971"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="92827971"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 12:26:52 -0800
X-CSE-ConnectionGUID: GCpDgWSDTWeL+oiRzsZmgQ==
X-CSE-MsgGUID: M2Q4X5mVShmqbnP1A0pQfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205357520"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jan 2026 12:26:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viIJL-00000000PUr-3oRe;
	Tue, 20 Jan 2026 20:26:47 +0000
Date: Wed, 21 Jan 2026 04:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Message-ID: <202601210400.sh4kp3k9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/leds/leds-ltc3220.c:455:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260120-ltc3220-driver-v3-2-fef612ec4faa@analog.com>
References: <20260120-ltc3220-driver-v3-2-fef612ec4faa@analog.com>
TO: Edelweise Escala <edelweise.escala@analog.com>
TO: Lee Jones <lee@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Edelweise Escala <edelweise.escala@analog.com>

Hi Edelweise,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8856d7fe1758937ac528770f552ec58c388c255b]

url:    https://github.com/intel-lab-lkp/linux/commits/Edelweise-Escala/dt-bindings-leds-Add-LTC3220-18-channel-LED-Driver/20260120-133819
base:   8856d7fe1758937ac528770f552ec58c388c255b
patch link:    https://lore.kernel.org/r/20260120-ltc3220-driver-v3-2-fef612ec4faa%40analog.com
patch subject: [PATCH v3 2/2] leds: ltc3220: Add Support for LTC3220 18 channel LED Driver
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: parisc-randconfig-r123-20260120 (https://download.01.org/0day-ci/archive/20260121/202601210400.sh4kp3k9-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210400.sh4kp3k9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601210400.sh4kp3k9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/leds/leds-ltc3220.c:455:1: sparse: sparse: bad integer constant expression
   drivers/leds/leds-ltc3220.c:455:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/leds/leds-ltc3220.c:456:1: sparse: sparse: bad integer constant expression
   drivers/leds/leds-ltc3220.c:456:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/leds/leds-ltc3220.c:457:1: sparse: sparse: bad integer constant expression
   drivers/leds/leds-ltc3220.c:457:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +455 drivers/leds/leds-ltc3220.c

24b811c65a0bb42 Edelweise Escala 2026-01-20  454  
24b811c65a0bb42 Edelweise Escala 2026-01-20 @455  MODULE_AUTHOR("Edelweise Escala <edelweise.escala@analog.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
