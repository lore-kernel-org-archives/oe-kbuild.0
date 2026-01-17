Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EC71367
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 12:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768652399; cv=none; b=LWpeBc+6VbsdvObLVKOl1NRgfSBSbXx4/i+gFRF7xo66r582OGgx2CwWrZfgiAvwZKPhWlq3Ez1QToxG9UM9NevwQpFzmHnlUIUUINSJQ+FDBvIg6aqvogkLEGa723OOHRqEiDwx31pOB5J2dy34wNNhzeVAvSDPwxHKf55/AEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768652399; c=relaxed/simple;
	bh=YwHYI/+A6svoBpPoTfA+Jmhni9sh9qm9qRyOK6p1Gso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PbmomesC9E/kvsg7TyCF7H6Yq/VK3ayR+TtxvQZFwCVmsLWeVVbjNNRroeZTb4QCHpXTCvIZRAEYT2fLFroziHzIV7VbIBLbkB5jcEIlTrG5rhhV67rMVhvP3oHc0feoQGoJvwYeqE+wJ6iLO14UHU8D8hyStqK/GRzKQQV0NDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXyXRPmr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXyXRPmr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768652397; x=1800188397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YwHYI/+A6svoBpPoTfA+Jmhni9sh9qm9qRyOK6p1Gso=;
  b=UXyXRPmrg4BJ34pWlfvyvpgMtqUy1wObSukc5wF9vDkwVb0/golSAjG8
   ziHeOwwHh5O3kkhZ5of3PA/YEeAqSfKF5QFX9rLWbtvEu6DdE75dzdTHF
   u5K2efkI4lNOM/tTkpxj5M6uROvbyozvjdekdbWnLoi0fdfZVRBqvuYem
   v2NUMlUms3lbe1lF5kgMBKywjdwGrNkirELjn0Zx3niWDX9D0WHRfFfnQ
   M+VpEKgZxGkpQpEAe6pfNm8rDddd1TiBmG4WkFjPabzdxiRWZGUGxxEHM
   TfOCb9S6zuZOd741lMSls5vxYJIWo8/vTJ6E1T1bfNBKAcCN1Fd92jDau
   g==;
X-CSE-ConnectionGUID: SM/7MiPCQuCio/Pdibsebg==
X-CSE-MsgGUID: sHGHQCy4QYSaD5TqyZUvRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69147491"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69147491"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 04:19:57 -0800
X-CSE-ConnectionGUID: AXg26WoNTNadHMvFEr3scw==
X-CSE-MsgGUID: 42CQ35PLSIqCV14fnx1Whw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205262623"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jan 2026 04:19:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh5HU-00000000Lpg-2nU4;
	Sat, 17 Jan 2026 12:19:52 +0000
Date: Sat, 17 Jan 2026 20:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <202601172003.o7p0DHoA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/verisilicon/vs_dc.c:202:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
References: <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
TO: Icenowy Zheng <zhengxingda@iscas.ac.cn>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Drew Fustini <fustini@kernel.org>
TO: Guo Ren <guoren@kernel.org>
TO: Fu Wei <wefu@redhat.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Han Gao <rabenda.cn@gmail.com>
CC: Yao Zi <ziyao@disroot.org>
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: Icenowy Zheng <uwu@icenowy.me>

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260116]
[cannot apply to drm-misc/drm-misc-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/dt-bindings-vendor-prefixes-add-verisilicon/20260116-124013
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260116043746.336328-4-zhengxingda%40iscas.ac.cn
patch subject: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon display controllers
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: riscv-randconfig-r121-20260117 (https://download.01.org/0day-ci/archive/20260117/202601172003.o7p0DHoA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601172003.o7p0DHoA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601172003.o7p0DHoA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/gpu/drm/verisilicon/vs_dc.c:202:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/verisilicon/vs_dc.c:202:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/verisilicon/vs_dc.c:203:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/verisilicon/vs_dc.c:203:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/verisilicon/vs_dc.c:204:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/verisilicon/vs_dc.c:204:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +202 drivers/gpu/drm/verisilicon/vs_dc.c

985771712428a6 Icenowy Zheng 2026-01-16  201  
985771712428a6 Icenowy Zheng 2026-01-16 @202  MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
