Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542E7399004
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 05:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773897740; cv=none; b=jGx6GninTcYcJ3RJjq6437d1AbQlqU+1d/TG59guHCEIl8AkO4YJRuc/gCWZmMGvfFcmpdyqMd4ccRnuTLn7nREZHWtj7GpNOyfCdWYhvJWxx/Sa+vwpVrKkH0HC2+mcJKGwToCvHeb1UcfPilXUbiIGAU+kXjwJMzJVyukRR1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773897740; c=relaxed/simple;
	bh=8RtpEz6RTiqjgV/fS2HNMrBvzcLabhx8eK8lXDoydAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qadEEIzhzOFAFdbk//0rqEtzToO3yZ0/Nua6OjXCPVlrDKxPLEVzxcBHdpaLP5rT7nRlz13jcIX9CR0Ej0k/CearJ6eRksMJF7sy27E0o8Nhe8CGhOQoNZvP9FXOpEBme1xQpiKDdMQn7WWSgpH/VnUZC4drpN7LiQh90zVDI5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ghajegyi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ghajegyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773897739; x=1805433739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8RtpEz6RTiqjgV/fS2HNMrBvzcLabhx8eK8lXDoydAU=;
  b=GhajegyiQTLuS/5T+h4bt0y6057C4w6/LQ81feZApmiIsirZxcjjMpzP
   e+0iAhofcULsPVVTUN3ertsgsB0Qhs3TtSjyvcuj6r7Ui8P5W9QOUkmQG
   5JLokuUFNsgwG10E3yX6EAkE11MGk4tKpYe4cMLcv9LikGqhit/985CaN
   qRFAIEjDld8qX49lqNKiw9F1pA20N+xhca3rVLusWRrWYsw2esS4tYmYB
   fsxT4lFWjZDg2n2LojXR5NZRKUJehx3bEAphtqCvB8dDTSWgSt87bIKku
   80jvkdH2ii1z0VK8xFsVqt8ZUJjWPdkWemHE9DENrF0/KYZJh/ewvor8z
   Q==;
X-CSE-ConnectionGUID: jHuOPdHVTP+UBCIwuRYKJg==
X-CSE-MsgGUID: yVAXXpqoQiG+ecalD15TZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85592526"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="85592526"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 22:22:19 -0700
X-CSE-ConnectionGUID: HcTDz4CmStWwa2+gfw+Uvw==
X-CSE-MsgGUID: PPNoq9M5TByaEeYWdVTvcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="222097954"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 18 Mar 2026 22:22:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w35pm-000000004mf-3pit;
	Thu, 19 Mar 2026 05:22:14 +0000
Date: Thu, 19 Mar 2026 06:21:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] dt-bindings: leds: Document LTC3208 Multidisplay LED
 Driver
Message-ID: <202603190607.lYkxHfOt-lkp@intel.com>
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
In-Reply-To: <20260318-upstream-ltc3208-v1-3-015f1f1e9065@analog.com>
References: <20260318-upstream-ltc3208-v1-3-015f1f1e9065@analog.com>
TO: Jan Carlo Roleda <jancarlo.roleda@analog.com>
TO: Lee Jones <lee@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Jan Carlo Roleda <jancarlo.roleda@analog.com>

Hi Jan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e68f95a51d1a8c1594b536c4d495cbea38d47561]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Carlo-Roleda/Add-Maintainers-to-LTC3208-LED-Driver/20260319-005902
base:   e68f95a51d1a8c1594b536c4d495cbea38d47561
patch link:    https://lore.kernel.org/r/20260318-upstream-ltc3208-v1-3-015f1f1e9065%40analog.com
patch subject: [PATCH 3/3] dt-bindings: leds: Document LTC3208 Multidisplay LED Driver
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: openrisc-randconfig-2051-20260319 (https://download.01.org/0day-ci/archive/20260319/202603190607.lYkxHfOt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190607.lYkxHfOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603190607.lYkxHfOt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/leds/adi,ltc3208.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/leds/leds-ltc3208.yaml
    	file: Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
--
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)
>> Documentation/devicetree/bindings/leds/adi,ltc3208.yaml:20:1: [warning] too many blank lines (2 > 1) (empty-lines)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
