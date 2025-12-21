Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605E244685
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 23:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766358627; cv=none; b=gOJlmQBIRzZ+xRWzL42NYKkoOvj1GaQtovwOy+avdPzc7fbw7okfC7+ipWwoxZ9xP6s1xmbE6EppoJWmP/GbJ9GhpJu17XlVRCJ1sXEnE6cGXlZ1qM77JTbpExN4QxS8H6J35kU16ZK1pUd3J0efRMFZ0fXzwVimjEFRSRuLl1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766358627; c=relaxed/simple;
	bh=n8ZjxeUtzS12KJ0OEDC1OJ+b9FD0QfdCcP4ie2upo+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QUFLAee1DivFCeeHGgTxk7eacPS4COJlMCHSqalGzbuUwlHKWj/zblgkfvME8xzpCPodwql9fjiweKDbtLmEtb2PGf0adbcM/9AcUQ46GVJGM4dw9bCS4Gxau5+uq4+4R54OKhoD3DOKY6xeg2rfqabv8qqF8POz8bWUkDyoB/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDz0/em6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDz0/em6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766358626; x=1797894626;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=n8ZjxeUtzS12KJ0OEDC1OJ+b9FD0QfdCcP4ie2upo+4=;
  b=aDz0/em6fQpJ7u+VH21qlkq9xgIt+8Bjj3h852vVdUMgk4MOdghTtYc/
   FNm/y5jt0HdP1PXBXxLkzB4yeK86mmUrw/q7yG5t2n+uL/f6q1d3l1264
   9JKECsRFvcVULxjv4ZA1LaYeLjLzH317lFZ0x8sMokZz/c4bDM8se6Xp9
   x8eQIpmerMYHvdYbcrlxxjKibYDtl+iyNfLSoZVUBq1wxmSAplPDgyr+m
   h3GsX6UCbIH4UvGc20meDCcqZxh4inuTNsXmasfOjoPl5fcNKdf4S0Xto
   vMTelR5Hc9+XBdpiuNQHNCN0lT50rApAH6Rze6j42Gz/qSHYcyGltjrDf
   Q==;
X-CSE-ConnectionGUID: VlY8m9zpTiq1+saxh7myGg==
X-CSE-MsgGUID: kv5b8z6ATjixjeVaxB3rHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67418570"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67418570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:10:22 -0800
X-CSE-ConnectionGUID: xgBrYcHtQVWTviz58yQjKQ==
X-CSE-MsgGUID: 1dJkdH0qQ4GQkwY7fS/dqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199679070"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 15:10:21 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXSZ9-000000000HB-1SG8;
	Sun, 21 Dec 2025 23:10:19 +0000
Date: Mon, 22 Dec 2025 07:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/4] pwm: sun50i: Add H616 PWM support
Message-ID: <202512220619.F9ap389y-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/pwm/pwm-sun50i-h616.c:890:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251217082504.80226-3-richard.genoud@bootlin.com>
References: <20251217082504.80226-3-richard.genoud@bootlin.com>
TO: Richard Genoud <richard.genoud@bootlin.com>
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: linux-pwm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Richard Genoud <richard.genoud@bootlin.com>
CC: Joao Schim <joao@schimsalabim.eu>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Genoud/dt-bindings-pwm-allwinner-add-h616-pwm-compatible/20251217-162733
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251217082504.80226-3-richard.genoud%40bootlin.com
patch subject: [PATCH v2 2/4] pwm: sun50i: Add H616 PWM support
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r133-20251218 (https://download.01.org/0day-ci/archive/20251222/202512220619.F9ap389y-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220619.F9ap389y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512220619.F9ap389y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pwm/pwm-sun50i-h616.c: note: in included file:
   include/linux/pwm.h:13:1: sparse: sparse: bad integer constant expression
   include/linux/pwm.h:13:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
>> drivers/pwm/pwm-sun50i-h616.c:890:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-sun50i-h616.c:890:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pwm/pwm-sun50i-h616.c:891:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-sun50i-h616.c:891:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pwm/pwm-sun50i-h616.c:892:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-sun50i-h616.c:892:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pwm/pwm-sun50i-h616.c:892:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-sun50i-h616.c:892:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +890 drivers/pwm/pwm-sun50i-h616.c

96d1ec9d04e0577 Richard Genoud 2025-12-17  889  
96d1ec9d04e0577 Richard Genoud 2025-12-17 @890  MODULE_AUTHOR("Richard Genoud <richard.genoud@bootlin.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
