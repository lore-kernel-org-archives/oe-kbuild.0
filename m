Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916B6293C44
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764861707; cv=none; b=mIxRAzetOdmRyCdUBrpaDmQCxR17TVOJx7L26gAQNt4UAMGOWlo2m8OwMy1LhTXJ6aPQzlKxV1s6LS081Y6/jACeHZ0EuwWWV64PtkZHUoLCCmq1A5+zffrjgcitP5q9QF3OzQLNDMCexcPMH8TLLQbmcd6zQXzohxOxE/L5M54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764861707; c=relaxed/simple;
	bh=2RzIxJBGBA3DlF5Y6Hfb5KBJgo2x2bDm8AvNOEJe2D4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tavLR/0UwfFsfwhsZS0U0KaTM3Q4uXe+KWCk9fFRZh1Orw4h6BvpyKM5/Auvhtt192WNpJcrG2Ex8pLdoCdTmsqMc5+ikL2vV6mNt6FQ6p47D5MIsI5BGs+qWpmXI2Rwm3fTt4zcGyCJmWaLajyRzcostHvBZZIWseil3R91/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0xDZBE6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0xDZBE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764861706; x=1796397706;
  h=date:from:to:subject:message-id:mime-version;
  bh=2RzIxJBGBA3DlF5Y6Hfb5KBJgo2x2bDm8AvNOEJe2D4=;
  b=K0xDZBE65CHfUqWgLoXaVkc9PfCq50iG9/Gv35X9+htb/vSyhZqDNR1x
   oB5zRAoGx6PwUGOCEJPbbUYcIgo8IVvtxosKaj4PrecO81/OWZH5B6jWN
   4AV+URkD4++KX+I6QQ9Uy9bIqBsQmEDeIhHj5oX606DJ7wuaxeAm5Cvqp
   6Rl/392GfpB/FiRUmHneapYEb330dYULhdYsR4T5ZefiC2zE+JBdtRX94
   zn4mqEvHBhRN8vM2Pfu4sHCFsn0VQoxlK9znC0kiz5OBihGvXbcAh/FKN
   Jv5p0GF29zImQWYiR3T120fHR8h2uosNzg0DQNylUTIlYKXAjPIlDYpmH
   w==;
X-CSE-ConnectionGUID: PEcdRZl3THSXyXbqYypUDg==
X-CSE-MsgGUID: 0x8vN/asTt+4LTY5uQQrkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84284167"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="84284167"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:21:45 -0800
X-CSE-ConnectionGUID: RUchzGOyTaSlLUaaUDOf1w==
X-CSE-MsgGUID: aw0QMjFURgqy8JOmxgsf8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="194899979"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Dec 2025 07:21:44 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRB9K-000000000l3-0fCQ
	for oe-kbuild@lists.linux.dev;
	Thu, 04 Dec 2025 15:21:42 +0000
Date: Thu, 4 Dec 2025 16:21:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [perf-tools-next:tmp.perf-tools-next 9/213] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'none'
Message-ID: <202512041642.PfyHGjuU-lkp@intel.com>
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
TO: Ian Rogers <irogers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git tmp.perf-tools-next
head:   05166a337b3882a3e369366d4cf371177c19f4c5
commit: 4bb55de4ff03db3e8b204c9c804cef3cad29a271 [9/213] perf jevents: Support copying the source json files to OUTPUT
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251204/202512041642.PfyHGjuU-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'none'
#102: FILE: tools/perf/pmu-events/Build:44:
+	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) none none $(OUTPUT)pmu-events/arch $@

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
