Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8A35E95A
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Apr 2026 02:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011868; cv=none; b=eBxBTKsHala3NU/WHqIYvmytZ5odiIslb0EW22woVFHEn7+0HO9SfYhx0myz4ohh3G99uNQwslTy1aiVtURXwwQL3+oSJHeE4H+FdwFgvUjSkfE5M7e2QgisWGQqFLv85XbgU3mizxmDotHivxhtKJ0XzSb6T83dN58yD7HQ4wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011868; c=relaxed/simple;
	bh=7dPEaQGfhJTlS4rBGZ+32GciFUeExb5O/5RhoweZze4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MH+NHm/cQyAGkb0Bo6LhyKn5liezeZ0raVjsqlJfm80hBy6tZfaaQaWw7qiQkvv0zyrKEDbjBA80R0okzzWBhsy9whz3sSnefE1s16sszKJ4S/elzEVKR6IiG0gyHAN6JWGi1j88zz2uF61uLA2prUz3IH+cz9uMBj2Oy+wUwAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGx5eaxg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGx5eaxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775011858; x=1806547858;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7dPEaQGfhJTlS4rBGZ+32GciFUeExb5O/5RhoweZze4=;
  b=hGx5eaxgaECBYncL1ozCVoA1+Gyc9h6vf9EsCa7hQOu0DkOSIDgf0ckX
   Od+6pKAH2AJDfjfmnZwrjSxFhW3gwzTZL6SjkHjpPM4Viskfxjs91orrq
   56xs/djrIlAMpELgNkpVXe4d6A8ea5zz+tRrp3eiAczadHBbyHIFEml99
   k560njPN8Sc/TFx95KH/NiIjFaveHVTdyBteveUi0LF7uA1gmevCZjuRs
   0Ag3sptCjtpNF+Q4VuLPTVO8SM0hdL0FsEzHJmWCs0dVxDtSamPP1F3YB
   HFdYy+ksl3Sr8MByykiGWgzFMJDSD1bddO0GgQL4iAhamLBMEqHSzyUMO
   Q==;
X-CSE-ConnectionGUID: AEO6LFo7TfezfJnicENtEw==
X-CSE-MsgGUID: 7soTMCH+QTmbCyzQsUJMfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87432739"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="87432739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 19:50:56 -0700
X-CSE-ConnectionGUID: sm4m6p/QToK9fFGyNCmi6g==
X-CSE-MsgGUID: KtsR+2HrQpu6zVRuwgTLcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="230963928"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 31 Mar 2026 19:50:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7lfS-000000008cj-0EXQ
	for oe-kbuild@lists.linux.dev;
	Wed, 01 Apr 2026 02:50:54 +0000
Date: Wed, 1 Apr 2026 04:50:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v1 12/16] drm/i915/buf_trans: compute LT's VS/PE Override
 index
Message-ID: <202604010401.ywwXdvN6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260331183332.1773886-13-michal.grzelak@intel.com>
References: <20260331183332.1773886-13-michal.grzelak@intel.com>
TO: "Michał Grzelak" <michal.grzelak@intel.com>
TO: intel-gfx@lists.freedesktop.org
TO: intel-xe@lists.freedesktop.org

Hi Michał,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Grzelak/drm-i915-lt-align-xe3plpd-with-VS-PE-Override-layout/20260401-092928
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260331183332.1773886-13-michal.grzelak%40intel.com
patch subject: [PATCH v1 12/16] drm/i915/buf_trans: compute LT's VS/PE Override index
:::::: branch date: 80 minutes ago
:::::: commit date: 80 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260401/202604010401.ywwXdvN6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#34: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1796:
+                 /* FIXME need to check correct parsing & table index should
+                 * this ever trigger.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
