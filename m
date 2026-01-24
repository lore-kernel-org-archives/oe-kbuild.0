Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F684AEE2
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 00:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769215852; cv=none; b=AKrPuSk5pyswryImzKujSuF7GnyTFpH1o8roHF6FbVwzg3T+yyMeTJIQOezJpR+QO0Fy/eF/kcE1/kzMwf/zTDjq+lR6FUvzfeJpRJJdN6upxTAoVAVUsXanCNoOJ7WdVn3I3udGSK4rA+DbCq7TJdsVoQXbEetzsIM0T/VDuCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769215852; c=relaxed/simple;
	bh=W5nClZANPO/K8MzqlcMJgS3s963hoPScQAJK0OTA1zE=;
	h=Date:From:To:Subject:Message-ID; b=AjX3thbyRjRrK4kd88yWIrtjYLyKxOevK/jvyjKNeUpmoWtIZaOt/tdXeO9kgLn0EGqs15IyNTJwpPHrx9x2Vq5b9pE4frVspl3NvZt4ytGp206MiEBk7ysFD41JCD2e+JHn2z7229rR1a2sIgFMtDbjxlcrMLaF5XLt9gSS+Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLuM/ZTA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLuM/ZTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769215851; x=1800751851;
  h=date:from:to:subject:message-id;
  bh=W5nClZANPO/K8MzqlcMJgS3s963hoPScQAJK0OTA1zE=;
  b=QLuM/ZTA7wq8kHzg4XxzRrLz8tfCVVanR+Pq/moxqExeN4sZHST3p+8p
   KaMOvLa7d59ZBiP5+20o00NGvtz+G4zYql6tePB/f1ixLA659bGi0/UoD
   YZ9V6W2zt+2vzX1CaAeg2pLDS8Fx6sBFBxJXa73DglSXuj8L40PtUhad+
   MEt8UFY1AQA86YqP37dLtHWxaLRLLO7ZHoAWG3XWH+hl897qFhGcopKBQ
   2+A0l2kqA4tmsrzRrbfDBE+RFo3BQjeZmTnlvtdrAyEMkEcMOBTBedF19
   6nyLHGyint7gtTG7mwi88iycbl0DMnr70jvtx1V7vcvl5z/TaF+1P+b34
   A==;
X-CSE-ConnectionGUID: zeECTHp5QLe+Mw3WIHxJ6Q==
X-CSE-MsgGUID: DdG6lQZART+P36qy64VKvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70368873"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70368873"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 16:50:50 -0800
X-CSE-ConnectionGUID: yZrohH5zS6WdkvDxyG2LtA==
X-CSE-MsgGUID: p5XBYy1wShmhQ5iHTxlf1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="211620217"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2026 16:50:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjRrT-000000000qT-2lOV
	for oe-kbuild@lists.linux.dev;
	Sat, 24 Jan 2026 00:50:47 +0000
Date: Sat, 24 Jan 2026 01:50:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:timers/clocksource 7/7] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202601240110.t6BUTckU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/clocksource
head:   b0d625cda6d12b60b10a0018c784fe42be4a9604
commit: b0d625cda6d12b60b10a0018c784fe42be4a9604 [7/7] clocksource: Rewrite watchdog code completely
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601240110.t6BUTckU-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#864: FILE: kernel/time/clocksource.c:279:
+	for(int cnt = 0; atomic_read(&wd->seq) < seq; cnt++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
