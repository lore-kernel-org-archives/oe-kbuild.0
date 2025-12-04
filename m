Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5EC1FC7FB
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 19:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764876332; cv=none; b=A83EIa663gp11wY/SKmsyIcqpiG78m9ZfFt7c2h88SgB3Ry4dBai1TZvopkPd0K4z+A/rI+uTwmtsxXvB6jGHZtaWrVWk1cyI94h1lQxD8yufgcndKZMKw+dLcV0qOK1u5ebnsRl0+FjfWyE47/cnpBSQadKAPwk1cfk+b/Hw1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764876332; c=relaxed/simple;
	bh=8VHVOONYIMsi72bWIOpQ4Q72Kl5BmpqwZoplBy6BY2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHXDU8EnuYMa0SRMyZ95vNkleYi13PJOr0C3F1Vw7Y+hIgP/EdtyTz8ELBrB3xDxPiiqqVbVqrRLSQ0sx7tWU1GVtNpvQz1WIHZUaiCu38x1XfKluHpgpYp1m7goYZRYTbAmBIZKqwATSY2lA+SkvLLHvDdAZfHBJeKMHtAbXvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYMeyxdM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYMeyxdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764876330; x=1796412330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8VHVOONYIMsi72bWIOpQ4Q72Kl5BmpqwZoplBy6BY2A=;
  b=NYMeyxdM7a96bX7rIDjLBOgADebf5Xvk87yqaZRL7XE5Gu3WXd9QMiBd
   N0SpHivMnpq5t9gXcRGEuIwe3AGpY1GjkJzVIA2GRnVufm/XcZhknbit8
   3ORtKQYX/eB0L876stdDfpHc2YO/B2s/f+UwCTOap9xHVVVHRvGs4mMYt
   xpxtnioptzjbxSntXsjiAAAbKbM5EwxZafYgxxzvgKMQidj5VkOG1MAHa
   +csSgASgBXBPz/oZvWc6vo6tqW6J/YBtINvRD4KjjKkhyz+h4v7XgwSQf
   IwV44pFuJEiNn64WOtw3ZShGMkDCrn6Q0atobDltuHGryo54N+a6Y61sW
   A==;
X-CSE-ConnectionGUID: 5szX7pFBRnGgwtp/3iEtNA==
X-CSE-MsgGUID: QHUTF62IRAaVbrIZED3BZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66800079"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="66800079"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 11:25:30 -0800
X-CSE-ConnectionGUID: 410KfTBiTkyoijdrc0J+zw==
X-CSE-MsgGUID: 5VmNEv0sRXyteTxPtnZUCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="194142693"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Dec 2025 11:25:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRExB-00000000E73-3QUa;
	Thu, 04 Dec 2025 19:25:25 +0000
Date: Fri, 5 Dec 2025 03:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202512050233.R9hAWsJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>
References: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>
TO: Brian Masney <bmasney@redhat.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Maxime Ripard <mripard@kernel.org>
TO: Claudiu Beznea <claudiu.beznea@tuxon.dev>
TO: Conor Dooley <conor@kernel.org>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Brian Masney <bmasney@redhat.com>

Hi Brian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 92fd6e84175befa1775e5c0ab682938eca27c0b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251202-060924
base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
patch link:    https://lore.kernel.org/r/20251201-clk-microchip-fixes-v2-3-9d5a0daadd98%40redhat.com
patch subject: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251205/202512050233.R9hAWsJN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512050233.R9hAWsJN-lkp@intel.com/

smatch warnings:
drivers/clk/microchip/clk-core.c:300 roclk_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/microchip/clk-core.c:833 sclk_get_parent() warn: signedness bug returning '(-22)'

vim +300 drivers/clk/microchip/clk-core.c

ce6e11884659988 Purna Chandra Mandal 2016-05-13  285  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  286  static u8 roclk_get_parent(struct clk_hw *hw)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  287  {
ce6e11884659988 Purna Chandra Mandal 2016-05-13  288  	struct pic32_ref_osc *refo = clkhw_to_refosc(hw);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  289  	u32 v, i;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  290  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  291  	v = (readl(refo->ctrl_reg) >> REFO_SEL_SHIFT) & REFO_SEL_MASK;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  292  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  293  	if (!refo->parent_map)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  294  		return v;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  295  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  296  	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  297  		if (refo->parent_map[i] == v)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  298  			return i;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  299  
ce6e11884659988 Purna Chandra Mandal 2016-05-13 @300  	return -EINVAL;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  301  }
ce6e11884659988 Purna Chandra Mandal 2016-05-13  302  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
