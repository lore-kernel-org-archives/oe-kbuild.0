Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE2220687
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 16:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764694606; cv=none; b=YHBtOavt2gE15ZrOrejGa715V5bPuC4cMfZZJDfsnkz5Fmroe5qL+6TOpZJhflKZzP++kdVp/XNgBFdffIIR7HBnk1tYnVYFwnWi5uDx4rkQ6QGcyPI3ZuS1LAuPCOSQAPe4h6Uer+7qSZdXQmt9qA3WGlBnfoJjzYLfdk043YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764694606; c=relaxed/simple;
	bh=YDLk7Ttye3scOLgfBXK2JXYIipHjyL3ChAquwKRA9OU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQls48jsmKTEj8RBFX3YmcoqmCsaL/8+yS5IMDOAA9nSUiX9ImE51JhNEZdizpRk5z/UMlUSKPXdJKHnXh2Thnm4ar1LfRkNY+MdUxfdFwE0m/cwVZtyBos/qVE2boX2Qi1EI2yZKLGM/QrDF4DoEsvnDNMWQ2gLuuTfHhq4ki0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/9ch2EW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/9ch2EW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764694604; x=1796230604;
  h=date:from:to:subject:message-id:mime-version;
  bh=YDLk7Ttye3scOLgfBXK2JXYIipHjyL3ChAquwKRA9OU=;
  b=Z/9ch2EWxySUEucgRpsa8fU5swTkkS43iVdhFzLOQ7ejsQx526iVTVe+
   SwvVan/RtW3D+RJ8vFNWOySVZ2ih7aINw6fyjO31NVRUBvauxAF3u6sl0
   avF1nug+8WxtN1RkyzK0jGC7BWWHTj7Wi9t3SyEoXqBAVQ9fLtw/nzaTp
   M4O1eZXMiSlVnte7S5xq8b+Q+cV/SiK1P/lC+kmcEk9nqTYfZ606LZrBA
   4eej835GcCKLxwBy0viJfphoWLtvtEbNdcgA7lwflrHpFg1A13yuOBbov
   kQycKJeMAhyAGAuScVs417jZxYeDdmJsqV09AAFnAbD6PHUFhCWejR0KQ
   A==;
X-CSE-ConnectionGUID: UcgMysuPQ8S4ZrVraz40nA==
X-CSE-MsgGUID: /NSYDQjSQNiELoY6aIt2fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66557101"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66557101"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:56:37 -0800
X-CSE-ConnectionGUID: XCODN8qBR86+lg92YtFv1g==
X-CSE-MsgGUID: vLqQruowTKG7gCqWxASj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194519045"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 02 Dec 2025 08:56:36 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQTg2-000000002vO-3ktD
	for oe-kbuild@lists.linux.dev;
	Tue, 02 Dec 2025 16:56:34 +0000
Date: Tue, 2 Dec 2025 17:56:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [perf-tools-next:perf-tools-next 9/151] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'none'
Message-ID: <202512021741.bGNYKX5O-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
head:   267c2e633af6e9461477bed91e428993f8b36ee8
commit: 4bb55de4ff03db3e8b204c9c804cef3cad29a271 [9/151] perf jevents: Support copying the source json files to OUTPUT
:::::: branch date: 3 days ago
:::::: commit date: 7 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251202/202512021741.bGNYKX5O-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'none'
#102: FILE: tools/perf/pmu-events/Build:44:
+	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) none none $(OUTPUT)pmu-events/arch $@

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
