Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3785741C62
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jan 2026 14:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769784429; cv=none; b=ZLgof4yFlRcKDiofvoflCy8djO7/SZSgQfSTMdiS/rjOyg9IZzfRGEEaw4wkDu9c77/uSik6yflIEfesdptURXN7TKBpGOx6yIva7V84A4W+rJ45m5NnKs1FxNesPeJQ56W9ATCgFtpk/zj+dyOdtLRfDpVmEnFebLQ2BLOkcZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769784429; c=relaxed/simple;
	bh=nl0idiVdiZfM6N+INhxuZ8E9K9Fm2a7a5eDgod/VTWI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+zoqrAmymBkDPOdWw2DH583oDOtEBufUeaCasPpPuKLcGM7FJQc7+hFRf5nQdvkz4DK1NuJQmJFadsbDq4MWBOSjqcgiZ0buz01N0sZQz+tpTTm3sdiB2mIbsfM8lYganWS0CoYy0Xj70aCFTzQ+Jp1ov7ZbA5xpLLnik+ewQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QThlX9In; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QThlX9In"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769784429; x=1801320429;
  h=date:from:to:subject:message-id:mime-version;
  bh=nl0idiVdiZfM6N+INhxuZ8E9K9Fm2a7a5eDgod/VTWI=;
  b=QThlX9InELUudcdxGgaArjUN6wSsGoRCK6rNEG+AX4mnQ3q8mMqY01uy
   DZKzZXHPNzQ2NHhKqtKXWdBRNH9Qfi9vB8BLGSR4zyhz4QFvA5pvIPqb9
   xLEKMtGKk+5yGaFn827nKk9hs6DnHg/cY4JBM3Iyd6sWjpnqiH9WcFqZj
   96xXL9Ey4XorL+GwIMkxwsd6WvWplY/SN2ncIBYRUoiwgKltq6fS3bOpO
   laCZd9zNsj9xM21LE/okz3rx2TIKH3ML5d1ne7Zy/XaO/KKgv0soGhLdh
   9hdj1fOeGTHClGwumqhwSgAvS7yskh6aXUT9M+lqzlCpgxfEYVK2JUGHa
   A==;
X-CSE-ConnectionGUID: eUDwh5a4T+uZVALv0aHNyQ==
X-CSE-MsgGUID: Hxqo1aYiSmWz7F/ykH+V0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71199178"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71199178"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 06:47:08 -0800
X-CSE-ConnectionGUID: OMzyH1pVQoSVs2pqlBz5Gw==
X-CSE-MsgGUID: Ajt9elJKRI+mMVine9T1tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="213766960"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jan 2026 06:47:07 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlpm4-000000002Vf-2zGj
	for oe-kbuild@lists.linux.dev;
	Fri, 30 Jan 2026 14:47:04 +0000
Date: Fri, 30 Jan 2026 15:46:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v9 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
Message-ID: <202601301551.4pVWvR3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260130025941.2140582-5-zhangtianyang@loongson.cn>
References: <20260130025941.2140582-5-zhangtianyang@loongson.cn>
TO: Tianyang Zhang <zhangtianyang@loongson.cn>
TO: chenhuacai@kernel.org
TO: kernel@xen0n.name
TO: corbet@lwn.net
TO: alexs@kernel.org
TO: si.yanteng@linux.dev
TO: tglx@linutronix.de
TO: jiaxun.yang@flygoat.com
TO: maobibo@loongson.cn

Hi Tianyang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyang-Zhang/Docs-LoongArch-Add-Advanced-Extended-Redirect-IRQ-model-description/20260130-110249
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260130025941.2140582-5-zhangtianyang%40loongson.cn
patch subject: [PATCH v9 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip support
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260130/202601301551.4pVWvR3Z-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited before semicolon
#341: FILE: drivers/irqchip/irq-loongarch-ir.c:274:
+	msg->address_lo = (msi_base_addr | 1 << 2) ;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
