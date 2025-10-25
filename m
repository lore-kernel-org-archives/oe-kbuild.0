Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAA78F54
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 06:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761373976; cv=none; b=p45bJig4YS4UYeo8sMij6oik6yR4zz9YBsuhKTlLElFpP9GAHv9Kv1kKAPgKWOqRZl75dZuz1VFsuyVXLCDieq8LeLtnGLsPEg5sKMEnLsVhw4MamqsE0xNLHyoa6gkY5gtkawVj6AYrbF70KMh2yLc73Zcyo0g7mnMdMChNKnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761373976; c=relaxed/simple;
	bh=dRVd1Xb0xFN3bdTaCmu3D4f4CTPWqTPI9Z5hitpNL+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BM+k4mpVObWSv0/do060Jx9vQD6xaPFgnPpRjXnmuQxeQU3BpbPVX+V7IWWtfqu6/i6QrNJ+xe/wKpuR7hFQMArA0CAGEcF70D0BnmLAS03bNBF2Od1F2n6wifI9AoyHD1xRu1Dacjv1cAQs/GRM8XLMXtAad3AfT2VjYI+aUrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOElBGvN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOElBGvN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761373974; x=1792909974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dRVd1Xb0xFN3bdTaCmu3D4f4CTPWqTPI9Z5hitpNL+U=;
  b=QOElBGvNjJ8fSmhgWG3BCflRGxYPvlkKEEkLlQci+KcKOeaZZmq51J1r
   Mp1iPaUsEKTRTbExtYT0efP9Be5M3MBt4InqHGUgon+T2RdQ6ZjYQYiNj
   4kBKjbooylesLKksZoduZM+5Rz7f0yQCPjye1FxQRvEiV5cLpsuM3iY47
   cvfJ9a4aFj8DiqrLSXqIpA1HV45oWNQRtTnPVQ2a/zqAL7AKYfdqpcWqa
   17hId62wBci+wVVU9PAdZY26i5gUNrBpyYZDuVY6lyonbQaadnXztQGK6
   b4MBDFIEneYZf8Et+vwCwSh7epju8K+9T6tunl6DBl19750CSjSpWTLFX
   g==;
X-CSE-ConnectionGUID: fdX5i08gTjqO9Pd/Ta3Crw==
X-CSE-MsgGUID: OeVyWdx+SneCMraez8haLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63582886"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63582886"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 23:32:54 -0700
X-CSE-ConnectionGUID: jdmAdaoaRka8E0HKd5I4rQ==
X-CSE-MsgGUID: 247Yqn9mS+ynUjWMNSozNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="189835821"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2025 23:32:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCXpa-000F9D-1p;
	Sat, 25 Oct 2025 06:32:50 +0000
Date: Sat, 25 Oct 2025 14:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 8/39]
 Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error
 parsing file
Message-ID: <202510251421.gorLyBlq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   afaa11afb19194ab185bd6dc6674bb42af42e59f
commit: a00547a3d28f0c0c83cae73c54f82a569898abd2 [8/39] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: csky-randconfig-051-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251421.gorLyBlq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251421.gorLyBlq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510251421.gorLyBlq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error parsing file
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: system-clock-frequency: missing type definition
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: system-clock-direction-out: missing type definition
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: system-clock-fixed: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
