Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8247623AB98
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jan 2026 01:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767403393; cv=none; b=HJR++i+tLrRvRnKwjC+CB6nOyyf5U6fTwlgIviTBYsYoD80xFM2NPfZEeQuJmfCu32u4fgf/1AO9IbJdn/okKhvxCVQjvvQdAFkbxfkHrRcMbW2nyrrrBYxxWpkC4KT9Bzy8yq2xrfmEzfVw70VjQUs4y+16lQmKOl9zTzb3v5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767403393; c=relaxed/simple;
	bh=lqLxtmt8pEfJyCqqOnVVuK1qdO3y0zus97Ok5yRS+ps=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s++M8+VGzOp0BV6VzGI9Qe1ZrUb0vVptOfjCRDDhfujGZvwQuyAxWOCGN1vPQsyUxlKGdGBC2pcTNqVggJiRNdcLeO5BAr/hZu/fxpgtMfEyfLFGAMlKyD12/iuxJGCZ1RbuEhREr9UA1qHOYzfeNMUl7sVEEMkOqUZPsOVsh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORo1Zspx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORo1Zspx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767403391; x=1798939391;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lqLxtmt8pEfJyCqqOnVVuK1qdO3y0zus97Ok5yRS+ps=;
  b=ORo1Zspx2jr9yyyZ9du9dFY2mRHBHNvcSV/1dcY2FCgTs6r2L4c26tSP
   udqP1nM1TwQSDcXO2XJQIfP2m+mayP+6eqUzf6md+0dEZXmdziZVANQbO
   3WEbz4zMTEdXTM4q9JPrMSm4c2wceHabSsHjw+OHuUXah4F3qn67xLec0
   r7fALs+5JT+P7mngulLxfuTWcXdD5jvjXrbr4ty5Hw7ocVB7Xf02V86uR
   HivT5huKPFRSRqP3xReuO+hU8V4tPvH31BGcAUknfPMUK/W7z49xk8Qqc
   uQNjf/oU1fobmqXDArM5bjZX5jI1Mup/7CjgzxyuVdMXZTCbWuIuQZ9EM
   w==;
X-CSE-ConnectionGUID: wnPNtgE1Q2q9DdKDqn4ojg==
X-CSE-MsgGUID: ZRnyePWVTPyxXimukvamzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="69041506"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="69041506"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 17:23:10 -0800
X-CSE-ConnectionGUID: A3I3Wr81RRWT0GCrvqvUiQ==
X-CSE-MsgGUID: kwYqEWnuRa2MgVJXrDVOUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202174989"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jan 2026 17:23:09 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbqMF-000000000Ur-1fiS
	for oe-kbuild@lists.linux.dev;
	Sat, 03 Jan 2026 01:23:07 +0000
Date: Sat, 3 Jan 2026 02:22:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 3/4] power: supply: add battery driver for netronix ec
Message-ID: <202601030211.ZTUvPAE7-lkp@intel.com>
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
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260102-kobo-aura-battery-v1-3-501f2a8fa575@jm0.eu>
References: <20260102-kobo-aura-battery-v1-3-501f2a8fa575@jm0.eu>
TO: Josua Mayer <josua.mayer@jm0.eu>
TO: "Jonathan Neuschäfer" <j.neuschaefer@gmx.net>
TO: Lee Jones <lee@kernel.org>
TO: Sebastian Reichel <sre@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>

Hi Josua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/dt-bindings-mfd-netronix-ntxec-add-reference-to-power-supply/20260103-021527
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260102-kobo-aura-battery-v1-3-501f2a8fa575%40jm0.eu
patch subject: [PATCH 3/4] power: supply: add battery driver for netronix ec
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260103/202601030211.ZTUvPAE7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#87: FILE: drivers/power/supply/ntxec-battery.c:38:
+	switch (psp) {
+		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
[...]
+		default:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
