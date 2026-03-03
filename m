Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378D4371886
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772546666; cv=none; b=ncK1L0j+wg9XtEJzQAJ3vgcJewFLcaj//qEEW3RdV24bFlzP6+P7naZiIomPtKh6wCWBPztyFB8Nt5jWLdIgINYAoRAEz7wmlStgXWLNq7sJMvGnCARlDkMR/fmkQbrPGs8EP+mSmdrAwXK7hQuNiGe0fq7X1j6D5WnMpnzeGic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772546666; c=relaxed/simple;
	bh=1rMok+qHoCLv6C3cQ7OIScJPAF6x782P9uuR9QWwos4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o3fLq936HgHuErmothoqiWEXN0sPIfjdjzbVWOdYA6jzAvT+TC+TWXpj3pBDjzus1dJhJHq3OU+fkbWdSby4/1varWGsNGr0ll73F7LAfN0aJcncyawU4AiQc1HagMppy6dPp3i5sAfwerG8pySQb6dZkZ0pIbJ5OBZOLQBKQGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1S196NG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1S196NG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772546664; x=1804082664;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1rMok+qHoCLv6C3cQ7OIScJPAF6x782P9uuR9QWwos4=;
  b=I1S196NG8j/OkoPcBHO8vZffnyw7TklrHziZxf3PMAEQkMh6Qs36VdJs
   4ATRvknHAdnaeXGioD+TLWu6UuhwPliQl2YkMSV8rOHKLu8LrHNT4rUvz
   IuDId4aE//U2Rz+1vwSnsFFlJWo4wxcYiB8BdCU4CFgrdfBWkWbFFHWCj
   l0H88XCd7XtFv3b95FXt27rST6X+lyGR48Nu7RhIcQIdMIQ/LVUr+iK0s
   ja162mqoRdxphYsDdNasEenNchduZ5B0dorEd2j3/kk+Gir3vRelHNHuu
   bZBMzBX+2XxbA9FCtdLV9ehU+O+x7jrLVFuez2tsyZiclMe8g+j18kzCU
   A==;
X-CSE-ConnectionGUID: h2YcJM+jSkivRI6SIS/YQw==
X-CSE-MsgGUID: bDkTfq5CQNCJIV+8HRjKrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73494945"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73494945"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 06:04:18 -0800
X-CSE-ConnectionGUID: 8G+2PcS8R7u+DEiCgbqVrg==
X-CSE-MsgGUID: fConml1PTOiLlsOyJo93nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="215514774"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2026 06:04:17 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxQMB-000000001T7-2625
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 14:04:15 +0000
Date: Tue, 3 Mar 2026 15:03:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 1/4] mm/mmu_notifier: Allow two-pass struct
 mmu_interval_notifiers
Message-ID: <202603031521.dDrjcXQG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260303133409.11609-2-thomas.hellstrom@linux.intel.com>
References: <20260303133409.11609-2-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
TO: intel-xe@lists.freedesktop.org

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/mm-mmu_notifier-Allow-two-pass-struct-mmu_interval_notifiers/20260303-213841
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260303133409.11609-2-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v3 1/4] mm/mmu_notifier: Allow two-pass struct mmu_interval_notifiers
:::::: branch date: 23 minutes ago
:::::: commit date: 23 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603031521.dDrjcXQG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6 # Documentation only.'
#53: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
