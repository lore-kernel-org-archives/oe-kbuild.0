Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B45277113
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jun 2024 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718786775; cv=none; b=fD+Iszltl5zzMFNHu7Et+2XVbZ1SJCc3CWWGWp60Wagq7F2K09yv1GTdDE3bvNT9A5xznpLtJ80P8uREWDnceVm4UVeLzwqkb+zhK0+qm74kzzIiXg/7QnwZzp54chx9MNBP1ujMW3ImXebAD2MVVAw/kP3Hza/lcMIbPOxeE/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718786775; c=relaxed/simple;
	bh=ppHk6xT8IO5uRs0koNEogxRZ1/WkOukyHyASrB2y4NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bxPJJagQ73Mnu0CTzrpB1EmMexPCTYV5Z8U5HXwUm3hX1M25Pel3z9OH4u/gAa5iwyt1lWxWrkaTIG3XhIjpkT4svisAuATecTAYVFxq53ck+obAh+0wCN0UplyMQc66QUqXfHaTKX3Js6JrC72fjMgPty6faX68lf86c+Oe7C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRZL66hz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRZL66hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718786773; x=1750322773;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ppHk6xT8IO5uRs0koNEogxRZ1/WkOukyHyASrB2y4NQ=;
  b=QRZL66hzt03OesN/wYiz9GDoAKJNmE7aYsWfDAxYs47SnHDsTcHYWGpH
   AQTYy/Z5DrgUtVWq64EVZWVcOGfGd9QYJkkC75kIV6BIA2bA6++Ndgiu6
   3lhPa5IhWf7rFL3I5ZcRLjt4E27AhJ1P6LYHroFc8kK3E0/pzdPh2UAWc
   cHErMvvHVwoc0s6ZPY4mT9AKbvvZgQK4mMqorN45wTH0sWWytRUIgS8Da
   /4Tq9pTZaeE3b/OiHIBMIQDi6YA0z6O1AuRw69jKNc9CqZ3ElZcUJOWca
   1sIYI/r/Qig7pnvF0NtVO59vFMkqCMjCyQLhHRriOGohlkhx0IhfUOq9o
   A==;
X-CSE-ConnectionGUID: JK3jIDG6T/OfDhNDalCrGw==
X-CSE-MsgGUID: b/r4dxwMQBqpTWOGn613AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15678705"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="15678705"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 01:46:13 -0700
X-CSE-ConnectionGUID: 68ZkyF0aQKSEXv9xwlnYGQ==
X-CSE-MsgGUID: 0QU2VGq5QGO/tycEdcX77w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="46219371"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jun 2024 01:46:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJqxF-0006Rl-2G;
	Wed, 19 Jun 2024 08:46:09 +0000
Date: Wed, 19 Jun 2024 16:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 18/23] regulator: add s2dos05 regulator support
Message-ID: <202406191516.nzayiXgL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-18-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-18-e3f6662017ac@gmail.com>
TO: Dzmitry Sankouski <dsankouski@gmail.com>
TO: Sebastian Reichel <sre@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <quic_jesszhan@quicinc.com>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Pavel Machek <pavel@ucw.cz>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: "Uwe Kleine-König" <ukleinek@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: phone-devel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6906a84c482f098d31486df8dc98cead21cce2d0]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/power-supply-add-undervoltage-health-status-property/20240618-222456
base:   6906a84c482f098d31486df8dc98cead21cce2d0
patch link:    https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-18-e3f6662017ac%40gmail.com
patch subject: [PATCH v3 18/23] regulator: add s2dos05 regulator support
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406191516.nzayiXgL-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/regulator/s2dos05-regulator.c: linux/module.h is included more than once.

vim +10 drivers/regulator/s2dos05-regulator.c

  > 10	#include <linux/module.h>
    11	#include <linux/bug.h>
    12	#include <linux/delay.h>
    13	#include <linux/err.h>
    14	#include <linux/slab.h>
  > 15	#include <linux/module.h>
    16	#include <linux/regmap.h>
    17	#include <linux/interrupt.h>
    18	#include <linux/platform_device.h>
    19	#include <linux/regulator/driver.h>
    20	#include <linux/regulator/machine.h>
    21	#include <linux/regulator/of_regulator.h>
    22	#include <linux/mfd/samsung/s2dos-core.h>
    23	#include <linux/mfd/samsung/s2dos05.h>
    24	#include <linux/i2c.h>
    25	#include <linux/debugfs.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
