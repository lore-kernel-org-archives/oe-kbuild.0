Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7827A2236E8
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 19:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765481396; cv=none; b=sl7tyzfSoSvoWpDtP+V6UK/e6je4HPZtC3tDbyfyOG++6Nkv5UX+hoDCjUgRFYqSPHz6M7xXS0lrhEaVHol5s9O/0fjCKr1nCMpBkZG16H3tJGhe+RAYlgcET1vjfXeRACxx+r0KRU/izxKpN6KzyEkU3ndHw6GxhxGuKv/dTgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765481396; c=relaxed/simple;
	bh=kB62AhE/aaaNTmp1tcIKmlLxdfczITeTt4nr8CFoZcg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ys/zt9lPp7KFgC2qeBbkQRSbJvx5GIZIlcrwn9xTwdf/1ZL8SBlgEl0Baz5YsSNOFAIywinH9/JRRjWhUHpe77fwq6V4lvro9+ltFM1a4qNEpnmBGYoUcTo2e73+PKmpjFU4vAadu9lcxAIcw/raHBypw78Os0If543WUGddNSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJkHNZVZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJkHNZVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765481393; x=1797017393;
  h=date:from:to:subject:message-id:mime-version;
  bh=kB62AhE/aaaNTmp1tcIKmlLxdfczITeTt4nr8CFoZcg=;
  b=LJkHNZVZXdwq3mnfgsNnChU5ZDo9rHV56YJGs4Z8AzGQJO70w0R47+9K
   za+nk41CGaRsLNxN6a5si0CjSAke/LOJBVG2pxx497MH6DXT+znFi6dD7
   D5HmM9V0PW1InQevQR6d0g0Dm9IP4pBeZZY5dBSQmTgnbrautm1o64Peh
   d/fbxxnI4JKFYrQ/MeeKJMulHwXo4WHwU400WOwaCrKvK0JnXZhMLdn0F
   ykaX6EGQNAv4ddlkBj2b6I+jPi6knzjuqhVtTfNk0KKbqqKjSWKNe8siD
   kP9NLN56ufoTeXW6KBc8GOZWYb7KU5/Qy3auPFIcdJ2yD9DN3I3QdcL1n
   A==;
X-CSE-ConnectionGUID: VRTxhzcETkeMO+wqyhloIw==
X-CSE-MsgGUID: FnxUQ9E4SaWvwrUyOz7sWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="90125135"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="90125135"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 11:29:53 -0800
X-CSE-ConnectionGUID: S4ZQpyScTyyrxKRyxBT5/w==
X-CSE-MsgGUID: 6V2fR8INRQiW3xEaT9L07g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201791276"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Dec 2025 11:29:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTmMH-000000001Bl-25JU
	for oe-kbuild@lists.linux.dev;
	Thu, 11 Dec 2025 19:29:49 +0000
Date: Thu, 11 Dec 2025 20:29:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Tianyang-Zhang/irqchip-irq-loongarch-ir-Add-Redirect-irqchip-support/20251211-172347
 1/1] checkpatch: WARNING:SPACING: space prohibited before semicolon
Message-ID: <202512112047.UrtJpaeN-lkp@intel.com>
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
TO: Tianyang Zhang <zhangtianyang@loongson.cn>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tianyang-Zhang/irqchip-irq-loongarch-ir-Add-Redirect-irqchip-support/20251211-172347
head:   261cc525b48b2580824bb00d7b53c9dfe4743463
commit: 261cc525b48b2580824bb00d7b53c9dfe4743463 [1/1] irqchip/irq-loongarch-ir:Add Redirect irqchip support
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512112047.UrtJpaeN-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited before semicolon
#335: FILE: drivers/irqchip/irq-loongarch-ir.c:268:
+	msg->address_lo = (msi_base_addr | 1 << 2) ;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
