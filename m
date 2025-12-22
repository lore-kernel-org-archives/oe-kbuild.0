Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7FC2580D7
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418440; cv=none; b=h2ZiB6qKQMLNx8fzFsP7LG26Yg9TmirTkgPAzj94lCRek3O+O6D6cNolX9s9fAI5sxSZz6tu63G+LJy3TpzkDrpuo+AMGiPCTl+vLyBy47ld8a+WlLAswU+sUb2Mt7GddGMy4nsCxYvk+NtQts7uWISjNpPB3XCMhdERPnb5dyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418440; c=relaxed/simple;
	bh=MD4Q0Jru7nt29GfwnvYtRn+6vFB2JRtniR+/Sey8uuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=URcMn6ld9HweeQJDnAwe+pBhnNAsi2ZfDq0ljAGdyl1iUfgAuYijTzI084aVC15Gl7yeV6KgWe0jBSsEboCVAiONoab5FmWPm/KIvpUK9DHu7OOynL0RhumlS6MyeelKLjEl3AQ9XrJ43u/lxZ0T0DDzCWkUj+jgZDuPznqUofA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MD7z8Snl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MD7z8Snl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766418439; x=1797954439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MD4Q0Jru7nt29GfwnvYtRn+6vFB2JRtniR+/Sey8uuc=;
  b=MD7z8Snlg0JZ5ZhPA+zDJQpPmq8BE+6wngkDRs5Xun7h08McW11VH4CS
   MuVCUXh/L4ZNXq7WiGcLz7Pse180XJXR1CfVZTVcW9XY7vOZayKtHB9zg
   cU98s+CRbe5tIktG7ye/rZ16FX8vX0+Qm0XOCqlOqzxFIJykGMVfNdg3F
   Wp3aVVk4mDj+K2P6pV2OJ722FKYFBeHqTfh5NxKmQdwLapAGH/RWeP1Lq
   +xL6yCvh50STcI96X7SnbTsFggUEdEvwF4lKYAB0ZKgbgOp6MGGhikS6b
   gPgcT8/nUVNAKp+VDX5pAy4cvYZ+QuQsm9EJ6xaKxPjiMekDw5OKYeCNk
   Q==;
X-CSE-ConnectionGUID: RmFVHcKjSVitKcQvpDza1g==
X-CSE-MsgGUID: 1YSZ8HvpRAGuTfZKgoyUyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68213024"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68213024"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 07:47:19 -0800
X-CSE-ConnectionGUID: RB69xcvYRkypNV6nURJ6Hg==
X-CSE-MsgGUID: jAt4jRtyRg+xXSLlGVgoDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204604994"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2025 07:47:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXi7v-000000000lh-0ic1;
	Mon, 22 Dec 2025 15:47:15 +0000
Date: Mon, 22 Dec 2025 23:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] mux: adg1736: add driver support
Message-ID: <202512222339.sIj9kOgU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mux/adg1736.c:141:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251219143554.22793-3-antoniu.miclaus@analog.com>
References: <20251219143554.22793-3-antoniu.miclaus@analog.com>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: Peter Rosin <peda@axentia.se>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Antoniu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/dt-bindings-mux-adg1736-add-support/20251219-224904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251219143554.22793-3-antoniu.miclaus%40analog.com
patch subject: [PATCH 2/2] mux: adg1736: add driver support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r122-20251221 (https://download.01.org/0day-ci/archive/20251222/202512222339.sIj9kOgU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222339.sIj9kOgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512222339.sIj9kOgU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mux/adg1736.c:141:1: sparse: sparse: bad integer constant expression
   drivers/mux/adg1736.c:141:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mux/adg1736.c:142:1: sparse: sparse: bad integer constant expression
   drivers/mux/adg1736.c:142:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mux/adg1736.c:143:1: sparse: sparse: bad integer constant expression
   drivers/mux/adg1736.c:143:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/mux/adg1736.c:143:1: sparse: sparse: bad integer constant expression
   drivers/mux/adg1736.c:143:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +141 drivers/mux/adg1736.c

2259884e2dc7b2 Antoniu Miclaus 2025-12-19  140  
2259884e2dc7b2 Antoniu Miclaus 2025-12-19 @141  MODULE_DESCRIPTION("Analog Devices ADG1736 Dual SPDT Switch Multiplexer driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
