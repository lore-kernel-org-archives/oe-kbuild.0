Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A362FE071
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331671; cv=none; b=AmWbrJRFCp+1YAhOevXY1RpqR0jMayZ1UbOUDyHTZkd31nWJZXxrSHF6rkEs8S/YNbT1EkDAazFzPNySfup8PiSeShMoC561BnbemENUYxYrllRENY86lXraPufSEIL7rBpX6vzZD44Fr3oREfwPDGfoDKRRgJvLmNhRRpEHcLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331671; c=relaxed/simple;
	bh=yTE7MeTsDdXlytPjLC56ZoF2gXHn2MFVj9SRYsqfbKA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oCKAa2DjIZt40Od7Gh0zen0rDZhcuhRsewgAeLm3PaQPeH5f9TGocqMZ4Pcet3f1h6/4HI7pCE8gSkup1e3sc8VTmYXaraalYu49TZdikrswtMCKIE2qMMT5GYidAHplwhSvWY0mUZv8co45GbEr5rDpsutvtlXck7a3ADSMSms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyAmUXtn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyAmUXtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331669; x=1797867669;
  h=date:from:to:subject:message-id:mime-version;
  bh=yTE7MeTsDdXlytPjLC56ZoF2gXHn2MFVj9SRYsqfbKA=;
  b=cyAmUXtnsaK+40rvXtD2EZGnha7BPUBa+0I2cw8Bmej4axpsw/YCzNtQ
   7caPOspLzO40mod+kI4fEr1UmwDoC+wmXpYIBrLorWJrslKhfpCU+e5GB
   pDfesJl+ntk44hvau5tOAHAf1iIzAvWAjWeOQjoaMDDc4dXu1MPseJ6OJ
   suV0A/JBcjcRuPOSEvtEWrHpETLWK25NZZn+AHSsbbGDjXf8n0tWYM7Jp
   Gb2zEycPW67zj6Lba9tBWEr7k6LZulqrEvqZDELxHDiJeSZrUqgthpodw
   66Kt/2So7wSiIKdaPc0ZeEu8kCjy4idSQQfUWgqfB1vnSPpEBgru6Y2SI
   A==;
X-CSE-ConnectionGUID: IybxBrZAQZmt5o8azlklig==
X-CSE-MsgGUID: siJm95fOR2GHIc38WES+rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78847599"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78847599"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:41:04 -0800
X-CSE-ConnectionGUID: u5LB3qMCReudHx3teAvYWw==
X-CSE-MsgGUID: Bg2z01fkT16vY6LMwxvSGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199618414"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 07:41:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLYL-0000000059C-2hmy
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:41:01 +0000
Date: Sun, 21 Dec 2025 16:40:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 230/246] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'since'
Message-ID: <202512211622.1DWrDvnd-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: cb7636d60557f5fa675d64dc5912e5cef28c1321 [230/246] drm: apple: afk: Allow replies after service 'teardown'
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211622.1DWrDvnd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'since'
#35: FILE: drivers/gpu/drm/apple/afk.c:345:
+	 * teardown must not disable the service since since it may be sent as

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
