Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA96C2F2619
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 21:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765833166; cv=none; b=JZAI04Q7krbW6QKomBsBQpXDlYGe806vFeaJH8xK8/wGasfuVw+eyUGgFr1HQ6rLcXxwwSQvpOI4W7ziHF9ENN+R7fowD6d8oCD/+bPWVTULrutxhTgqw18L5tgCe63bf4ecxaJUFKiP41lhvWzeszKdI3TCx+0gJCjCFf5caW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765833166; c=relaxed/simple;
	bh=m6aWkBVbenZAiFmfoRf0QZp6Vhlnb0VbHFbBpYUhl2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UB2kfBXeXuG74u304Lj7BIzQ+xBtKfC/cr7ScoYCp3ZSlTyZuhIHQzst38KmxUrUivZi/zXbwFkX2sgA5Xl1czy87yl3/Qx/WF4LKJxAGMUVN1y0hpmnFSTjQhfryDlnvHnLXZ9L+71oeOU8zXiPdNkSh/MU3Gzt+ESnCjK6Rp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIY9GE9I; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIY9GE9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765833164; x=1797369164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m6aWkBVbenZAiFmfoRf0QZp6Vhlnb0VbHFbBpYUhl2U=;
  b=TIY9GE9IFL2qFPetrVea/1qklZmUru3QtdabTLJjUPVND0HFe6lmfZDS
   v35JZik+F7OEZFV8sJMWT+cuJTMCI2YgoIrSu0d6vF4nv7LRGv5rpFi4J
   71UAEJigGVO1Ft5+if6YHbKvPblm6k3cKRY8YBfCEpOAahg+zpHjoxz0K
   MEGVs2sob+GcZfALuUU9sYU7JpD+FwuaXZqoQPfI+o5gKuekwZW/IlKcz
   Xdii4tzx4Ai/U6cOzNK6BsjurULXu2O7STeGq/MJ1GaXx210JmF1ZxRCz
   q4P1AeIR6s91IHsVyO48F1Tfe6+7BfaxQPU9Pwyftqzvqr51ctiZVbmGg
   A==;
X-CSE-ConnectionGUID: yRvLecWiQ7aMESfzh2oYxQ==
X-CSE-MsgGUID: 5bsZRDbORr6+F1MHK45P3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79114433"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="79114433"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 13:12:44 -0800
X-CSE-ConnectionGUID: kIWV82QDSiyZ02/oEJbt7A==
X-CSE-MsgGUID: YAjYro1JR6eHDJxFaLdGXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="198648190"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Dec 2025 13:12:43 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVFs1-000000000mV-0cIj;
	Mon, 15 Dec 2025 21:12:41 +0000
Date: Tue, 16 Dec 2025 05:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 04/21] clk: mediatek: Add MT8189 apmixedsys clock
 support
Message-ID: <202512160407.ZXYudHkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/mediatek/clk-mt8189-apmixedsys.c:191:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251215034944.2973003-5-irving-ch.lin@mediatek.com>
References: <20251215034944.2973003-5-irving-ch.lin@mediatek.com>
TO: "irving.ch.lin" <irving-ch.lin@mediatek.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Richard Cochran <richardcochran@gmail.com>
CC: Qiqi Wang <qiqi.wang@mediatek.com>
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: netdev@vger.kernel.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com
CC: sirius.wang@mediatek.com
CC: vince-wl.liu@mediatek.com
CC: jh.hsu@mediatek.com
CC: irving-ch.lin@mediatek.com

Hi irving.ch.lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc1 next-20251215]
[cannot apply to clk/clk-next robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/irving-ch-lin/dt-bindings-clock-mediatek-Add-MT8189-clock-definitions/20251215-120357
base:   linus/master
patch link:    https://lore.kernel.org/r/20251215034944.2973003-5-irving-ch.lin%40mediatek.com
patch subject: [PATCH v4 04/21] clk: mediatek: Add MT8189 apmixedsys clock support
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-r132-20251216 (https://download.01.org/0day-ci/archive/20251216/202512160407.ZXYudHkU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160407.ZXYudHkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512160407.ZXYudHkU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/mediatek/clk-mt8189-apmixedsys.c:191:1: sparse: sparse: bad integer constant expression
   drivers/clk/mediatek/clk-mt8189-apmixedsys.c:191:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/mediatek/clk-mt8189-apmixedsys.c:192:1: sparse: sparse: bad integer constant expression
   drivers/clk/mediatek/clk-mt8189-apmixedsys.c:192:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/mediatek/clk-mt8189-apmixedsys.c:192:1: sparse: sparse: bad integer constant expression
   drivers/clk/mediatek/clk-mt8189-apmixedsys.c:192:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +191 drivers/clk/mediatek/clk-mt8189-apmixedsys.c

c2083360c4b1eb Irving-CH Lin 2025-12-15  189  
c2083360c4b1eb Irving-CH Lin 2025-12-15  190  module_platform_driver(clk_mt8189_apmixed_drv);
c2083360c4b1eb Irving-CH Lin 2025-12-15 @191  MODULE_DESCRIPTION("MediaTek MT8189 apmixed clocks driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
