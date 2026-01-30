Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3401A378D81
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jan 2026 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769771649; cv=none; b=eXbCM4pZbBtGfOafShYfaNh+A6JA4tLgmm2oeKONGm+TySwCdWmV2ej9JHxeEbGGGtosuXq5B9zBWY+M7MvIllWXp5LNBf9j18GBkZVpU/MVj/Mg4QXkM6sl5MeGveEch7QGkNCkqEAjJsbXmSU56Tu1xJY0Xai6EYWckPLiAv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769771649; c=relaxed/simple;
	bh=rGFxPh934WDY0ExyZs4T5oVI/J22JErU5lQ62z3yzCQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=HrmKCC7Nhb5XdxF/lpEh+13//mYwzb6CZbS5bmAwGqnwMJTglxDIJLQ7DmElBuYqACm08q2AOv40tv74N4nZJUazVVdvxE9ehkLxk00YQwuhCRKqTSPG9k7W4db7EpSjwFFAxPHgsmI8Uc78jCeTWc/yzh+F+p/5sxvx6AZfaRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IuFprVEb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IuFprVEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769771647; x=1801307647;
  h=date:from:to:subject:message-id:mime-version;
  bh=rGFxPh934WDY0ExyZs4T5oVI/J22JErU5lQ62z3yzCQ=;
  b=IuFprVEb291qkkEVVTxlVmnn17p4QJ0gFu3qXXydS7GGNKQy56v+KPxl
   VuPT/aE5PUpYNjUDz8vfThZmOYsX7Xwu95Vqw5AC80vqAf14HKeMevGBc
   nWhuN5oXYL/XTVBZ4nw1nwuR2KvpjT09G1UejBif5MEkT0SAn31iqkr2L
   +aOG57qIbqksxcmsNY8RmCvusOwoVVBB3urPENrPRBdgDQ9JjL9c1X3x3
   XWzN9R7kyqlq9KJ6PjVnCxnh9A+sV8oZD7KqKB2YpPoui6J6WqOdAyNd5
   TxkMPWbq+sRqwheDXk0nLU6zWm/PPJ0CrqmWW4m3KkWxlxSRfOpxVScQO
   w==;
X-CSE-ConnectionGUID: ACxEqameRK29DOYToZKRAQ==
X-CSE-MsgGUID: +rsBELNjTjaVg8CpSVNIPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81336768"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="81336768"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 03:14:07 -0800
X-CSE-ConnectionGUID: 8XLXqeFTRn29AWinpRYENQ==
X-CSE-MsgGUID: q3RViODQTdiCkfEPcEMklA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="213734183"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jan 2026 03:14:05 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlmRv-000000002UL-2r6r
	for oe-kbuild@lists.linux.dev;
	Fri, 30 Jan 2026 11:14:03 +0000
Date: Fri, 30 Jan 2026 12:13:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Arun-T/media-i2c-ov13b10-Support-tps68470-re?=
 =?us-ascii?Q?gulator-and-gpio/20260130-173205?= 2/2] checkpatch:
 ERROR:SPACING: space required before the open brace '{'
Message-ID: <202601301233.nSZRFMbt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arun T <arun.t@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Arun-T/media-i2c-ov13b10-Support-tps68470-regulator-and-gpio/20260130-173205
head:   b5def294573cbd607b911920900c76b3211a5199
commit: b5def294573cbd607b911920900c76b3211a5199 [2/2] media: i2c: ov13b10: Support tps68470 regulator and gpio
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260130/202601301233.nSZRFMbt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#68: FILE: drivers/media/i2c/ov13b10.c:1516:
+	if (strstr(dev_name(ov13b->dev), "OVTI13B1:01")){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
