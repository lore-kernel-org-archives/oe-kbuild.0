Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2154815E97
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765832704; cv=none; b=fz0HCzGURgAcdunSX3eiLDjSRXaNeeDTa3DKJSCW5sFOL/PLsVygfm8LTzE5h/0buTOuqrv7+8QLjVXCNhPGUPiqLElNUWJg/BTd0B+cySX4MgJIAXzPvcNcvNnyTiexpdL2rpFkgzIySGA1OFb5JM5qBqtV4weIch9X/Cn8T4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765832704; c=relaxed/simple;
	bh=/Io2Gn8b9oPqtBxsnP8uR7DtN9i2hcr7yqWey5l+M7E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RIuhCZlw4DrrHqci4dEVQtgme82chWUAwQxq+fNhknTkyRg8ws88zMrfA4zlfKKSd8zjnHUwVfn3iE8cr3HnuTM8wu3dIOSa9kKwxK42lge1hc0ogkawbf0BfCbeJBpxr6vtvYXWg+MTcW9ETA6g3oD9qSa7UxmbxhPAD2odtCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8iFAIfg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8iFAIfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765832703; x=1797368703;
  h=date:from:to:subject:message-id:mime-version;
  bh=/Io2Gn8b9oPqtBxsnP8uR7DtN9i2hcr7yqWey5l+M7E=;
  b=k8iFAIfgr14Of5X+85NK42sNkJgZFm0d70BxWlkwddqBUSpQ2L+Yvobi
   pzKury4j+eK1NVmE2SuaY6Jf29/1yENUG/ZAVJIrja8VkZfm6aB3oF6/i
   tvEbQXL96J666qM9Ol9JApX+AWOqgx3fyQJUjTb2WfT2PGpcv9mRM5lCT
   sgmdZ3ioVW4yHYXNlCwGr03HFxD7BCY5m2f7JQbZXNX8DyMjWHmsRDkgO
   RXsg1XqA1tkUl0doSMUMMpMeX5+8Vjhpso5HH/U2R/9v2LxvVjv/0cM59
   OPXepI3UszUj3bclAdNvN+62/u3Hy7qRKazFKqAOeZkayRg8eyhX1Xbix
   Q==;
X-CSE-ConnectionGUID: HSFpONWMQv25sgDVbsbCGA==
X-CSE-MsgGUID: FErChncdTdS7Eaps4c8XBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67627264"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67627264"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 13:05:02 -0800
X-CSE-ConnectionGUID: hZSTXTXvTFOxNUx29/aZXA==
X-CSE-MsgGUID: E3Zga2KmRumz0OxTQ5dtlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="221195922"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Dec 2025 13:05:01 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVFkZ-000000002lG-3M5d
	for oe-kbuild@lists.linux.dev;
	Mon, 15 Dec 2025 21:04:59 +0000
Date: Mon, 15 Dec 2025 22:04:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rafael-pm:acpi-queue 25/29] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202512152237.UmJI6MxH-lkp@intel.com>
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
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git acpi-queue
head:   e88d169a6053918f230dfc78ee0eff2c2a2ca9bf
commit: 685f8a959d00a36e01207e4ea2051259afb226ec [25/29] ACPI: EC: Convert the driver to a platform one
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512152237.UmJI6MxH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#172: FILE: drivers/acpi/scan.c:2753:
+	acpi_default_enumeration(device);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
