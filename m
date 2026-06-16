Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EC13B6C16
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605140; cv=none; b=BCMSU4XjD/WUdYBSgdFa3rSyZ+ooCBb22FuJG8XE0UicgWONr2oZQRj9ihlGx39oAkRfs0J0SbXYlxHSguzT7Al1yrvHVJrhA0hUOEyT9dKaGkKVp2DrSBcrGYdK3tqY9o27Gr6s7R/KKcJ1+qEQpb9bOtuA4HQAhTwZ0RTAO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605140; c=relaxed/simple;
	bh=BwPo7ASAJryuKQqon06HFbgQaSwmlN1nA+n5yvmts4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aVNktoJR/K6uuAI/Ih8nq7o5uCfPkM7GfEBVfyITQoeEV494/YoDQzfoILZAFAGLoz17UZF1QnaeQVSkXzWB2tsA8Dshi+vLGFlWnDPfLCJnAhgdJm7qSjj60XFq9scdvYdZfCvE3r7/wagYiKwJDIfVP+HtA9N3MCG9NXaowko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdquOD9o; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdquOD9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781605139; x=1813141139;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BwPo7ASAJryuKQqon06HFbgQaSwmlN1nA+n5yvmts4w=;
  b=KdquOD9oUeNwNcEt396Z174uJ6uBDmYHFlNOJCyYP7KtXqK6nylD9pEE
   iO3hNclbQ01Plyjo/nckh4G4Fbc+pVTddWdMOW2xt9ssVMZ8/zDZzhYdB
   kXU3DMCPNW26XiCb17Dz7VyzZsNZJRHFmhasNmwCHQ48pax1ws+mSQJF6
   nTlqkSGMTbnYL7R3NcGWaYB37elHFJ9U16zrK46gGUifn0FOuf1X32iwB
   hqAoBiimk1yur6vGWr6p/89b6y3ct55NzN/wtHrErtXBDf55+fIoQAXn4
   aoeTlo4NmfeU+FRJbbDtJV1BXBbh4BMSR5T0YFFgOh7TOrpH4cqH/QPEZ
   Q==;
X-CSE-ConnectionGUID: U0LG//QMS4OhPtRdrFpf5w==
X-CSE-MsgGUID: RekGIfyyQ96NMzKFKIB9SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82351284"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82351284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 03:18:58 -0700
X-CSE-ConnectionGUID: NVH8zx40RfWWlqh3jI1dSw==
X-CSE-MsgGUID: e5wqBFi1TsudBDHTm+LI2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252702895"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2026 03:18:57 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZQsh-0000000055p-2tdY;
	Tue, 16 Jun 2026 10:18:55 +0000
Date: Tue, 16 Jun 2026 12:18:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v19 3/3] pwm: Add OpenCores PTC PWM driver
Message-ID: <202606161251.HZTxFf57-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260615155759.129210-4-hal.feng@starfivetech.com>
References: <20260615155759.129210-4-hal.feng@starfivetech.com>
TO: Hal Feng <hal.feng@starfivetech.com>
TO: "Uwe Kleine-König" <ukleinek@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor@kernel.org>
TO: Emil Renner Berthing <emil.renner.berthing@canonical.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Paul Walmsley <pjw@kernel.org>
TO: Albert Ou <aou@eecs.berkeley.edu>
CC: Hal Feng <hal.feng@starfivetech.com>
CC: linux-pwm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Hal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 95e56f0f293ef797123eb032f78f5b5d56a035a6]

url:    https://github.com/intel-lab-lkp/linux/commits/Hal-Feng/dt-bindings-pwm-opencores-Update-compatibles-examples-and-maintainers/20260616-004009
base:   95e56f0f293ef797123eb032f78f5b5d56a035a6
patch link:    https://lore.kernel.org/r/20260615155759.129210-4-hal.feng%40starfivetech.com
patch subject: [PATCH v19 3/3] pwm: Add OpenCores PTC PWM driver
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: openrisc-randconfig-2051-20260616 (https://download.01.org/0day-ci/archive/20260616/202606161251.HZTxFf57-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161251.HZTxFf57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606161251.HZTxFf57-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pwm/opencores,pwm.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

vim +25 Documentation/devicetree/bindings/pwm/opencores,pwm.yaml

2529085831b01f William Qiu 2023-12-22   8  
2529085831b01f William Qiu 2023-12-22   9  maintainers:
b85565809b38ad Hal Feng    2026-06-15  10    - Hal Feng <hal.feng@starfivetech.com>
2529085831b01f William Qiu 2023-12-22  11  
2529085831b01f William Qiu 2023-12-22  12  description:
2529085831b01f William Qiu 2023-12-22  13    The OpenCores PTC ip core contains a PWM controller. When operating in PWM
2529085831b01f William Qiu 2023-12-22  14    mode, the PTC core generates binary signal with user-programmable low and
2529085831b01f William Qiu 2023-12-22  15    high periods. All PTC counters and registers are 32-bit.
2529085831b01f William Qiu 2023-12-22  16  
2529085831b01f William Qiu 2023-12-22  17  allOf:
2529085831b01f William Qiu 2023-12-22  18    - $ref: pwm.yaml#
2529085831b01f William Qiu 2023-12-22  19  
2529085831b01f William Qiu 2023-12-22  20  properties:
2529085831b01f William Qiu 2023-12-22  21    compatible:
b85565809b38ad Hal Feng    2026-06-15  22      oneOf:
b85565809b38ad Hal Feng    2026-06-15  23        - const: opencores,pwm-v1
b85565809b38ad Hal Feng    2026-06-15  24        - items:
2529085831b01f William Qiu 2023-12-22 @25          - enum:
2529085831b01f William Qiu 2023-12-22  26              - starfive,jh7100-pwm
2529085831b01f William Qiu 2023-12-22  27              - starfive,jh7110-pwm
b85565809b38ad Hal Feng    2026-06-15  28              - starfive,jhb100-pwm
2529085831b01f William Qiu 2023-12-22  29          - const: opencores,pwm-v1
2529085831b01f William Qiu 2023-12-22  30  
2529085831b01f William Qiu 2023-12-22  31    reg:
2529085831b01f William Qiu 2023-12-22  32      maxItems: 1
2529085831b01f William Qiu 2023-12-22  33  
2529085831b01f William Qiu 2023-12-22  34    clocks:
2529085831b01f William Qiu 2023-12-22  35      maxItems: 1
2529085831b01f William Qiu 2023-12-22  36  
2529085831b01f William Qiu 2023-12-22  37    resets:
2529085831b01f William Qiu 2023-12-22  38      maxItems: 1
2529085831b01f William Qiu 2023-12-22  39  
2529085831b01f William Qiu 2023-12-22  40    "#pwm-cells":
2529085831b01f William Qiu 2023-12-22  41      const: 3
2529085831b01f William Qiu 2023-12-22  42  
2529085831b01f William Qiu 2023-12-22  43  required:
2529085831b01f William Qiu 2023-12-22  44    - compatible
2529085831b01f William Qiu 2023-12-22  45    - reg
2529085831b01f William Qiu 2023-12-22  46    - clocks
2529085831b01f William Qiu 2023-12-22  47  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
