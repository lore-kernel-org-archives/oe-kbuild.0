Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D9287272
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 13:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764164359; cv=none; b=mv/jppQsEHvTtxGDaxxoIqJwNtMop91nVp1YuZCY0NtiOfQx8IsV3UpOf0J5mCAdJ3xtVTp0O9RjMenkprSA+D07XKd8GeUfkOlYuvD92bpQO1s9wIuILLYFyhLz2NHkmmUPtr7PjTs7QYq2x9x9d75+Xl8QgNimn/D7uc0vGLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764164359; c=relaxed/simple;
	bh=qc9mP27xwwEQF+sqCxSnLDta1JZ5LjvSr36qi8mYMfg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fc/uZXp+iJe1UhpEX3ExyjnbimYDEXuftkycw0PALTb4JQXMq0SnIOxiQxjTHpp1Tka+IgEn+kwWbT3wTilE7COxzYUn+fwHfpv2kjeHM8FeEXHWJm3cH453E2fw2X4MT9XHQA2+HCD7tbgmficXz52lwgJ4g2ONXJn1ijUDQPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayMLtkJj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayMLtkJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764164357; x=1795700357;
  h=date:from:to:subject:message-id:mime-version;
  bh=qc9mP27xwwEQF+sqCxSnLDta1JZ5LjvSr36qi8mYMfg=;
  b=ayMLtkJjrTu+rV2FSUcmIevwmpByGwka5qNKn5Nvn/DN5+pr8Bxc0Xl8
   AsyIcVAtX5GEtJCirbz3HUr1iT8UH7mrng1r3Odwi6XFpwyVL5Hg7SU2u
   WIbi+a+ZXqx/FTKNCOcsjkfz0pj6ZTLJK7aOtoJgs3thsBn90f9xSfNDY
   /1th0r8yhXgbPnHWgLtdSmWk1/a07JyNT548A0tlROIwq8rKKZ00n5IUF
   5RAHg1fN2OUIJnU41zoen/YvxhivjGHoDyGv5N/VNNoOCJAOzVKl13Zzr
   QKMAvZg9MS5iPtLt3J+Zzi+VxyeO9nTTIiHOHBt28VNnbMG1wf2W0a1b7
   g==;
X-CSE-ConnectionGUID: cO/11BdMR0mZbJ31QsN8Ng==
X-CSE-MsgGUID: CLy0HN6ITRajGr32MsHbTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="53769444"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="53769444"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:39:17 -0800
X-CSE-ConnectionGUID: wUa3N3zrSk69J/FfTjtYNw==
X-CSE-MsgGUID: b8e/YGNSQI+u7MF2KZpjmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197433703"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2025 05:39:17 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOFjm-000000001Br-0qaB
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 13:39:14 +0000
Date: Wed, 26 Nov 2025 14:38:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH] rust: add a function that returns a reference to the IO
 Ports Resource
Message-ID: <202511261436.xZs7i6zW-lkp@intel.com>
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
In-Reply-To: <20251117163112.22515-1-alexandru.radovici@wyliodrin.com>
References: <20251117163112.22515-1-alexandru.radovici@wyliodrin.com>
TO: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Alex Gaynor <alex.gaynor@gmail.com>

Hi Alexandru,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-next]
[cannot apply to driver-core/driver-core-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Radovici/rust-add-a-function-that-returns-a-reference-to-the-IO-Ports-Resource/20251118-004006
base:   driver-core/driver-core-next
patch link:    https://lore.kernel.org/r/20251117163112.22515-1-alexandru.radovici%40wyliodrin.com
patch subject: [PATCH] rust: add a function that returns a reference to the IO Ports Resource
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261436.xZs7i6zW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Alexandru Radovici <alexandru.radovici@wyliodrin.com>'
#25: 
Co-developed-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
