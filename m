Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB133F8CF
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 20:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768251357; cv=none; b=fqRBRnJjK1L9N9zEPxpDDB9daOCBISd4Pm0yZHnLpGT/LpRwQkV3gLDJ+o9NO5IzcrLqY0lKnleq/u7p1kY9f/j+b8AmmD9sj5OHfkVKwMn4nSIaoCNMEwMwqc8MBxQhr9+w8nyCK/EKhL62PFpSvLT6gizI5/zyoHCTvb2w0zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768251357; c=relaxed/simple;
	bh=57bN9yMHLlBfppd/EIgmjN1zlM+4QpsPHYfInfh3qx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BX7h+X1OYnyFkYFzF/hKbnu0bMkuJ/kKutn2K6AiJZHFIWdYPhKnsetl+Yxkyckxi2BcD9D/Z0m6JNoDR0dCpFMFG6Mll7uGI7FCVBzfuDcJ9hlJtXWgOdfHZdYdnWM6HN/NNUzVIxm9QKasi7lTwE6RYTDs36TZpemhQNL1ZFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5XlE8Jl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5XlE8Jl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768251355; x=1799787355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=57bN9yMHLlBfppd/EIgmjN1zlM+4QpsPHYfInfh3qx4=;
  b=B5XlE8JlqpsyeRuaXPZ+b0idA1DhHq1eqqEojbE1/23G15PO1o7sWBpD
   hLcefoTyA62l+v+i4rgKUvPx91rIvW3XCRRQYnf+hdN8YhvoRyCWy9Kqq
   +yA9Lc/0bPrL2SBC6WNwPfFS2ZVAjJIsI/9H7qpdMStxOeiiQdqXtCfIY
   8N8LqP6Jad7HYyvQHt+zh7GY1j4CkLAJ6AeL8eiZGJVXA2AsT5A79GKuI
   /BlUqiie18YmP/PHpyxOSo5Tf83OcuqJN+7sbXUWzXvxxnmnmDCC7Q198
   7t/kUJ0U8j5Z2PejCsYkrbtZaEtpJ2ijlbr5LADqFGQARxQ6hwSh4p/Ic
   w==;
X-CSE-ConnectionGUID: hKS2cJLXRcyHNusiY7fNmw==
X-CSE-MsgGUID: Q3AgJg9dRGi+ci/mdwKdmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79828511"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="79828511"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:55:55 -0800
X-CSE-ConnectionGUID: a6nNQGp3TRqglWrmzOlwKg==
X-CSE-MsgGUID: 4NpHFDOCQCiG5rXE+K/NMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204099755"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jan 2026 12:55:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfOx5-00000000DsG-31sg;
	Mon, 12 Jan 2026 20:55:51 +0000
Date: Tue, 13 Jan 2026 04:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
Message-ID: <202601130429.XnM6qkB7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c:40:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
References: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
TO: broonie@kernel.org
CC: alsa-devel@alsa-project.org
CC: lgirdwood@gmail.com
CC: perex@perex.cz
CC: tiwai@suse.com
CC: yung-chuan.liao@linux.intel.com
CC: simont@opensource.cirrus.com
CC: Sunil-kumar.Dommati@amd.com
CC: mario.limonciello@amd.com
CC: linux-sound@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Hi Vijendar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-acp-soc-acpi-add-is_device_rt712_vb-helper/20260110-144723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260110064505.1485927-1-Vijendar.Mukunda%40amd.com
patch subject: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-123-20260112 (https://download.01.org/0day-ci/archive/20260113/202601130429.XnM6qkB7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130429.XnM6qkB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601130429.XnM6qkB7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c:40:1: sparse: sparse: bad integer constant expression
   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c:40:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c:41:1: sparse: sparse: bad integer constant expression
   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c:41:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c:41:1: sparse: sparse: bad integer constant expression
   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c:41:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c:42:1: sparse: sparse: bad integer constant expression
   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c:42:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +40 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c

3c8cde31029f1b Vijendar Mukunda 2026-01-10  39  
3c8cde31029f1b Vijendar Mukunda 2026-01-10 @40  MODULE_DESCRIPTION("ASoC ACPI AMD SDCA quirks");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
