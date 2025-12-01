Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A292F7AD3
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764580948; cv=none; b=N13qCQQMfOyeAbc85qQ5gy/to2UfkdktGDguEwYGO1zCkprkbNpH+eR3sEBqmgd/mEmYS8qFUbluCDrCrk7cIVu3W19j+ouE/77Mhu9MwkHQfrDhvynsKxymse8oaH309dFQlCfiLjRB8we8PiH/jsGakBJZ6DRdEyVmEwdWwZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764580948; c=relaxed/simple;
	bh=7HMyhr3Uu/JHTQAbgo1R2XAHZl5mWlKu1ntoXcqDpC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EvRoP6H5Alxms6/6bjMHWFmhogFxUTqo9cQsoDOX3k7+orgM7IBUGu323qNsWKGVxNxkeFv8TEE2niIJBtW1P61VLWxmpw157SCAOOyo2mAJZtERD3/TCxzzbfdcjoDK9R0Vx1TkXuzWNpNHrHAtBrLB9KpjKY9raV45M32Os4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYtjaz2k; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYtjaz2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764580946; x=1796116946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7HMyhr3Uu/JHTQAbgo1R2XAHZl5mWlKu1ntoXcqDpC8=;
  b=DYtjaz2kJR4QGPiD3jCKvOvY4XM0CGYIkrsGcpZl+D/JKjNj4LAg10ur
   ITDqGBQHVfbCFerkEock4fjf247yjju6L9+ZRAqASHrSZJRpPsZib/0Wk
   NJTPmzt00tODIzZg6WZ6uAUs4w7lWoSRxK+vL/3/F6SZtfFs85iPSQEpd
   9k5UTdCfUcpjaHs5GOrSBdbcXtaIHLrhr4wgyAqEL/pv3dH1fdgzS6luJ
   36RSLMzszdC0wfaW0GZk+/9OBcBkeih6HAMN6mDweGNpJ/Vc/przO8xBQ
   74+pgcN2H3QgcKakQq0UnHeRuaicSv1hDzB0y2xXVewLWmk41zEjzjofZ
   A==;
X-CSE-ConnectionGUID: qiqOqS8RRx+A/bo3JKBCCA==
X-CSE-MsgGUID: YXo6zoqQTe+fG22hARCE7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65520553"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="65520553"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 01:22:25 -0800
X-CSE-ConnectionGUID: aD4c6dvvQrSnfdauxLuucQ==
X-CSE-MsgGUID: pm+6BZASS56ZR0UU0/4/yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="198506717"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Dec 2025 01:22:24 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ06w-000000002fF-1kNk;
	Mon, 01 Dec 2025 09:22:22 +0000
Date: Mon, 1 Dec 2025 10:21:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12842/13171] Warning:
 drivers/cpufreq/longrun.c:20 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512011002.Wl3OKolz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b [12842/13171] docs: kdoc: various fixes for grammar, spelling, punctuation
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20251201/202512011002.Wl3OKolz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011002.Wl3OKolz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512011002.Wl3OKolz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/cpufreq/longrun.c:20 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * longrun_{low,high}_freq is needed for the conversion of cpufreq kHz
   Warning: drivers/cpufreq/longrun.c:125 expecting prototype for longrun_verify_poliy(). Prototype was for longrun_verify_policy() instead
--
>> Warning: drivers/cpufreq/gx-suspmod.c:142 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * we can detect a core multiplier from dir0_lsb
   Warning: drivers/cpufreq/gx-suspmod.c:202 function parameter 'cpu' not described in 'gx_get_cpuspeed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'khz' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'on_duration' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'off_duration' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:250 function parameter 'policy' not described in 'gx_set_cpuspeed'
   Warning: drivers/cpufreq/gx-suspmod.c:250 function parameter 'khz' not described in 'gx_set_cpuspeed'
   Warning: drivers/cpufreq/gx-suspmod.c:202 function parameter 'cpu' not described in 'gx_get_cpuspeed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'khz' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'on_duration' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'off_duration' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:250 function parameter 'policy' not described in 'gx_set_cpuspeed'
   Warning: drivers/cpufreq/gx-suspmod.c:250 function parameter 'khz' not described in 'gx_set_cpuspeed'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
