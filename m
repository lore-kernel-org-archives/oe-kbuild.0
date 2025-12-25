Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAF01AAE17
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766665321; cv=none; b=X9mrHTlk7e4p9+ICHFHTs8TpZHfbIFrbcowN3SXN533/7dBCM4kAN60FU0PoalWNK5aiyWyGloQR2fXzWf3E66DjCvCdHzJg93TqPiyz6yoIRs4YHyVjZqZT8f71SelJoI52QsUsbjt75aofeN7erSAi/c4EjSlnTOT45CRCWUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766665321; c=relaxed/simple;
	bh=Wsd6oIYhuwVY+2TOHDYHkc/N9IvhAyuLUHFt1o1UoR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qw/bnWFMP3RAun3fhdCBxZ1uU3WmvXSp0LbTtS2tTu4G9ykZs4H8VQ6XbknVh2vAxz+7Hde/K+/KEfPTonvhwcidLcRn4mKewWT6RPS/0lPifoEsLjjtOzb7cIMEaA87BW7pFeWT+KgSNQMHDjTkpn9g+FAif3rnyZOF9VcgWJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oyg+Emzd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oyg+Emzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766665319; x=1798201319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wsd6oIYhuwVY+2TOHDYHkc/N9IvhAyuLUHFt1o1UoR4=;
  b=Oyg+EmzdDzz6C6Dprwizi5taFRnifjexpRvRiJD1RRofjZhjTUPpYaJT
   owhN4CwTgumx6fsiQJGcEWpcVoefF9c5bXJl9mktCHWGkhQMishQ3csZp
   ijhDItGTaylu88RqQrsCs710EpDo0W0L1LaB82mol9CxHL56CbVCkEjuT
   T0LUlylXvbm2dbqw9TCI6+eMlv4brysEYDs8bixO0/ixd+AaOmKUy/QKa
   S1ua9c4DwTO9x5KfcufBEdt1NOiKBalKM+SCeG9e43wcuG0cfKI7iYOz2
   YvVTO+0s/3bHHeiay7S7nlB4wRF76/sn1x/lReyvQKeh7F6asUms1h+th
   w==;
X-CSE-ConnectionGUID: TNVHQ6iTRYahK6sd47hKgg==
X-CSE-MsgGUID: F8vaWxmsQnOeKIyKvQsUAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68625746"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68625746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 04:21:58 -0800
X-CSE-ConnectionGUID: 9Ezk3kSpSGeO0q+RyzQHww==
X-CSE-MsgGUID: OyqEb7atT9OKR+4xzMR03g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="199854557"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Dec 2025 04:21:57 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYkLm-00000000453-2Gv6;
	Thu, 25 Dec 2025 12:21:51 +0000
Date: Thu, 25 Dec 2025 20:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 5/9] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Message-ID: <202512252008.HSCDbE5W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/bridge/th1520-dw-hdmi.c:171:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251224161205.1132149-6-zhengxingda@iscas.ac.cn>
References: <20251224161205.1132149-6-zhengxingda@iscas.ac.cn>
TO: Icenowy Zheng <zhengxingda@iscas.ac.cn>
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
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Han Gao <rabenda.cn@gmail.com>
CC: Yao Zi <ziyao@disroot.org>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: Icenowy Zheng <uwu@icenowy.me>

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm/drm-next linus/master v6.19-rc2]
[cannot apply to drm-misc/drm-misc-next next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/dt-bindings-vendor-prefixes-add-verisilicon/20251225-001940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251224161205.1132149-6-zhengxingda%40iscas.ac.cn
patch subject: [PATCH v4 5/9] drm/bridge: add a driver for T-Head TH1520 HDMI controller
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: csky-randconfig-r111-20251225 (https://download.01.org/0day-ci/archive/20251225/202512252008.HSCDbE5W-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512252008.HSCDbE5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512252008.HSCDbE5W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/th1520-dw-hdmi.c:171:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/th1520-dw-hdmi.c:171:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/bridge/th1520-dw-hdmi.c:172:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/th1520-dw-hdmi.c:172:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/bridge/th1520-dw-hdmi.c:173:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/th1520-dw-hdmi.c:173:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +171 drivers/gpu/drm/bridge/th1520-dw-hdmi.c

f6cfaf05df47d5 Icenowy Zheng 2025-12-25  170  
f6cfaf05df47d5 Icenowy Zheng 2025-12-25 @171  MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
