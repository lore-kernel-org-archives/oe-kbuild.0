Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B02033290B
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 21:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766437987; cv=none; b=JYE8Wxt6D5uu0u/UeLeTLd656Hmid8zhNtoXIZlEhfVwn8C9tGvmFRfHjFx3ty7x+7UDyfQDvcitlcxUhTzicqo0XtNYak0cuHbY2q7UOCh4PMdDbLXI97yZpbt9WWfzx5XfcrjyN202E5bNwKb+BXZsMgKeCgFsUlecyI4BG2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766437987; c=relaxed/simple;
	bh=qECI2448fGwqDm9disW5wB5HkiH0EvBSABxWi0tlpvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=auB9voPEWw7u1knTEdfaqde0MY08iqNOhxfKH1R04a7VWQp32KgbUdrpTQWxeFWHHInXmoZ7zPuAkEI3HnepfKjyhzBn78Nd1bT79HmsRv0ZcMMd1L+W9C/Pqpimr00fhn9tVTHUXjGObpMlI2eXBp77CHff9fmqU7oOqW5d28o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlxZ48yW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlxZ48yW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766437982; x=1797973982;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qECI2448fGwqDm9disW5wB5HkiH0EvBSABxWi0tlpvM=;
  b=XlxZ48yWpmkjYYzslZJwtxDDVjhVOwSluz3woRuIWQ0HZY7OyIXaySUO
   k1yQyrHMZz0f6IvJAX5BD/YxAjkk6p9+J8k6EwsKt5LXs1KpYGj3UlLmB
   8Qcj0Pf/WNdfKf5C+oev7Kd5f557bEDpTkD0dNIH2eU628rZ/Uc0H13/4
   0mjvHlodKG3eM7Jm02zm8KgsZ/y2GX0JNPcd5OrCOmrRmCx35jKqi5J37
   0w/xk82sadHAAhBbSaXVbHeYn8oBaTbDdcpLZQAWLRqw4VG5Z0UHqaQ6m
   rL3vrBSezxnAxwBpw5D1dpMa2k1s9XgVi1+YftKylkih6i8za2f3dzPF6
   Q==;
X-CSE-ConnectionGUID: uwCjgCw+QFWwYgWDfgZ/LQ==
X-CSE-MsgGUID: UmOG/FodSL+cxPs61D72BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67489861"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="67489861"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:13:01 -0800
X-CSE-ConnectionGUID: JPKsrKXoQ4+uNdiQBuwVWw==
X-CSE-MsgGUID: qqkp6DDxRbK9qBtjbLqj3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="203742507"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Dec 2025 13:13:01 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnD3-0000000017R-2wqA;
	Mon, 22 Dec 2025 21:12:54 +0000
Date: Tue, 23 Dec 2025 05:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/4] pwm: sun50i: Add H616 PWM support
Message-ID: <202512230430.NdRQiynO-lkp@intel.com>
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
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: riscv-randconfig-r133-20251218 (https://download.01.org/0day-ci/archive/20251223/202512230430.NdRQiynO-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230430.NdRQiynO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512230430.NdRQiynO-lkp@intel.com/

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
