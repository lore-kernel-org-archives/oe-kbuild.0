Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709B26C3B6
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 22:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764453615; cv=none; b=J4yBPmW361+5x87KwcMDncka+sT4mpMgifq4tzmz89AQ/igG4weqpwFCTbp6HBTo+rx/3wrkJiHu6vQKksByW/iurjILZdMBNuKuA6MuBXAmoGhw5pA32hyBgsal4HABOR6RO+m61GI3ims3bB5V87KDb64de1WofWuNWs9G9O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764453615; c=relaxed/simple;
	bh=zHSybDNmUADZD+jE0g7cHNyz4AT7pIFuFt0Gifcvo/I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ExNJgWdW6fIKEcpaxOzQl7W3EVZ9GxBtpne72N1xM5xeO8ENmKLwtz06alC7yZszezrMDir39j2/QPJKMIo1UITtCN6W9vHg4n7IF2aPc7K4JD+cX7OaPhw9BPIEenFsfbjrM3z7FRg1+93gAJeBmIUXdqgjkIzJoObHgTacBcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jm0Gab4q; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jm0Gab4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764453612; x=1795989612;
  h=date:from:to:subject:message-id:mime-version;
  bh=zHSybDNmUADZD+jE0g7cHNyz4AT7pIFuFt0Gifcvo/I=;
  b=jm0Gab4qsmkXgK1Pyq2SP48cr1b6OSfLaNXpksSwe7mydr68RYn7zhd1
   vv8FiyE+4jx8cIi18uOSkwSfLSUxkXZxvt0V84MKeHTyTafMsn3bWw4Dz
   Mj/ZV7QtgyMatTVEg2Ebd+/dkfq4gVoZTVZ8G5ti6UUegz/mpRt+wryfn
   nssvLMGJoUWhpiE/XvJ1826kTz5ComRsuL/lYNwd81TyseyvDmKOJjrzV
   ngzgGOrNt1Bonl/CyuimK8QoZsQZ7/eu5fj8SJMlVUQWaY6B9cOGyg6FW
   lDU0F5B5PFcC5jVaJpD56lKLEfDdNv3JMFiLUxQ2x4eWuR56ct3cjZl1A
   g==;
X-CSE-ConnectionGUID: gLErVxWSTrmCeVkJd9dP2A==
X-CSE-MsgGUID: hUMCpff9T4i0EkuyK/ZKpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="70294952"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="70294952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 14:00:12 -0800
X-CSE-ConnectionGUID: DvfozW7gQvOt11EaQ/tbWg==
X-CSE-MsgGUID: F+uMBMjbRECOUimIrhwfDA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 29 Nov 2025 14:00:12 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPSzC-000000002QF-3EV5
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 22:00:10 +0000
Date: Sat, 29 Nov 2025 22:59:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [perf-tools-next:tmp.perf-tools-next 9/151] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'none'
Message-ID: <202511292224.u2SfwM5X-lkp@intel.com>
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
head:   267c2e633af6e9461477bed91e428993f8b36ee8
commit: 4bb55de4ff03db3e8b204c9c804cef3cad29a271 [9/151] perf jevents: Support copying the source json files to OUTPUT
:::::: branch date: 2 hours ago
:::::: commit date: 6 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511292224.u2SfwM5X-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'none'
#102: FILE: tools/perf/pmu-events/Build:44:
+	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) none none $(OUTPUT)pmu-events/arch $@

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
