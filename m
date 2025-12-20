Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0E2E6CD2
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 16:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249613; cv=none; b=uNX0MBD+3dL92Lyul+H4EQ1YrJNQXpycKPFp1HPmQOjQ+ABRvm/JWcZdP3yYifUFp6/5rzu46GZzFP1GfUtt/NA59ZBVojZWDGMuKVvDysICutQvRtdQLdZZ8tCkqQBe1CWE+EB1NpO5iSHdInPVA20bJ7lgRnLBMhoFrnTWBJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249613; c=relaxed/simple;
	bh=c/Luftslvovu6zGpNphcDYIczHPMlYOPruxY/utuqZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6fx8NW9Lf3m5up/XfRwOfvyItlMMu6BVLfatfKwmEVTJQbh0adJ9B1bXbjg1fwRSkmRi+1ebWzZR51O9U4E7SyFP4VwoJjoBpGK+WAauD/e/tOtwNCU9CuWRXnH6hegjTjLvBUVdlaq0GGxwW1yrdNkiNQbvfDaNNLcg4KVqNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aumqLbCp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aumqLbCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766249612; x=1797785612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/Luftslvovu6zGpNphcDYIczHPMlYOPruxY/utuqZk=;
  b=aumqLbCpiewB6XWfn/AP2WU9AjkzGSfnElcJ6TjPQZZgsi3XUL3lClWE
   yB65Cy6tl7cXsYNU4Keo0XQCwtP8FjP2LsvQpSjHE/ehsgx1mK/fhlQhV
   1hpF6oxxjriC40201wKgpC0NuuF1j5u7eA1GOfMm9Jw9mXUkFaZxTEXDT
   hrnKTw0jk6zob0yUfsqgQi3UjBA0KXemKerTsB6eepQ/VX2uRALDSt/DE
   daQxSutKRYTlwzNhrLVIyl08/D2XPv6HJY/m0IpMIw6UKBGtoYTqK+RAZ
   zEhyWd/4RcQazrisffigDgI7ILRKLZK9mqM90i5IXBzbkUBUGv/NECBcg
   g==;
X-CSE-ConnectionGUID: F4FzESbZSPen1R7OoVuwNA==
X-CSE-MsgGUID: 3xPwPLkVQuW6fcizaOf1Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79546032"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79546032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:53:29 -0800
X-CSE-ConnectionGUID: nSmN+EC6Rv66XRl2pQutJg==
X-CSE-MsgGUID: VxHxx7wxSPuS3RQQFzatqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204190306"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2025 08:53:28 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX0Cr-000000004uL-1wtD;
	Sat, 20 Dec 2025 16:53:25 +0000
Date: Sun, 21 Dec 2025 00:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/6] clk: anlogic: add cru support for Anlogic DR1V90
 SoC
Message-ID: <202512210013.se8syKIn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/anlogic/cru-dr1v90.c:188:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251216-dr1v90-cru-v3-3-52cc938d1db0@pigmoral.tech>
References: <20251216-dr1v90-cru-v3-3-52cc938d1db0@pigmoral.tech>
TO: Junhui Liu <junhui.liu@pigmoral.tech>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Junhui Liu <junhui.liu@pigmoral.tech>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/clk-correct-clk_div_mask-return-value-for-width-32/20251216-115101
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251216-dr1v90-cru-v3-3-52cc938d1db0%40pigmoral.tech
patch subject: [PATCH v3 3/6] clk: anlogic: add cru support for Anlogic DR1V90 SoC
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r133-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210013.se8syKIn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210013.se8syKIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512210013.se8syKIn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/anlogic/cru-dr1v90.c:188:1: sparse: sparse: bad integer constant expression
   drivers/clk/anlogic/cru-dr1v90.c:188:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/clk/anlogic/cru-dr1v90.c:189:1: sparse: sparse: bad integer constant expression
   drivers/clk/anlogic/cru-dr1v90.c:189:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/clk/anlogic/cru-dr1v90.c:190:1: sparse: sparse: bad integer constant expression
   drivers/clk/anlogic/cru-dr1v90.c:190:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/anlogic/cru-dr1v90.c:191:1: sparse: sparse: bad integer constant expression
   drivers/clk/anlogic/cru-dr1v90.c:191:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/anlogic/cru-dr1v90.c:191:1: sparse: sparse: bad integer constant expression
   drivers/clk/anlogic/cru-dr1v90.c:191:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +188 drivers/clk/anlogic/cru-dr1v90.c

5b693e572aff2d3 Junhui Liu 2025-12-16  187  
5b693e572aff2d3 Junhui Liu 2025-12-16 @188  MODULE_AUTHOR("Fushan Zeng <fushan.zeng@anlogic.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
