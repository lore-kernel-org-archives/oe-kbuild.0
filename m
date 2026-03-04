Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463DD336883
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632233; cv=none; b=YQf1fKS9QzkKLosWY6HStlYeRve8ykxZG03g5FMuqwcFM4/51lcSnni8cU0V5R7r3R5LyT/k/Ci43Gn0YzfIhaHfij3kjljufK7CAJTCxNNbL99FOhHG+mRPI2a68pQ5dvZSvbazkfrB90FNPo29pk80fmRaBFNRiECKtEHch6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632233; c=relaxed/simple;
	bh=thZ/lYUYknsWBbvZE5VDblXAujdneB8OAHdDAkYOoWU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EF2ecpl3Z9FRx86/M8Pab1xpmpw2E7m+7hLavbnZ4KTdevK0z6znve8gCcAAAh36FLmZsY8rkY7tdRyxzxlpzQkin80WJi60jsq1MDreNiILds9tZUa9u5Gz1BDE6prsw3p5NVA5oh2kJoTaBP1yKtNUhoRQAqwnIIHW/mnmPmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/h05SZT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/h05SZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772632231; x=1804168231;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=thZ/lYUYknsWBbvZE5VDblXAujdneB8OAHdDAkYOoWU=;
  b=F/h05SZT7oIE529vpCdwVlEeKa96rGeAxaAZMmbNI/+DFUQVnK0CUUfH
   WJhtDl8zX1B0LOoe+AHNVmvqiJ0KKAwXzlcUi0ceYqMouqUqCpTbZFdUf
   CCOi7wmsy3r2WJrGRzxY897BcdSRBVZ7vFhzeGyf9aTrtarh00RSca2SF
   j6yOHXgGbb8lRCBhaOSsYqDTXyUBswdBur2lSc2k0BbTvnv68kHwLt9SS
   iE67ulnidliOQz54GX1uhTLVRYymhKnMIpbqNlHoC1JGAPpXKRIpHq5Dm
   6FuM2VYhiMp3T+DAiqnI2m8YXdHqru2bM/jTZC1kXC51h+Cxl5dJ3dXDO
   Q==;
X-CSE-ConnectionGUID: b5TZZdO7RZO+Efopt5y8UA==
X-CSE-MsgGUID: h9ZFPyXoQmmztr2W5HMIzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72716429"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72716429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:50:31 -0800
X-CSE-ConnectionGUID: VBry23qZS/mmi+btkhTtCg==
X-CSE-MsgGUID: JJB/8qZjStqh1NgPwUeUUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217502193"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 04 Mar 2026 05:50:31 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmcN-000000001iT-38Ct
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:50:27 +0000
Date: Wed, 4 Mar 2026 14:50:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] watch_queue: Add a DRM_XE_NOTIFY watch type and
 export init_watch()
Message-ID: <202603041426.yJHdM1mZ-lkp@intel.com>
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
In-Reply-To: <20260304125220.165004-2-thomas.hellstrom@linux.intel.com>
References: <20260304125220.165004-2-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/watch_queue-Add-a-DRM_XE_NOTIFY-watch-type-and-export-init_watch/20260304-205630
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260304125220.165004-2-thomas.hellstrom%40linux.intel.com
patch subject: [RFC PATCH 1/2] watch_queue: Add a DRM_XE_NOTIFY watch type and export init_watch()
:::::: branch date: 49 minutes ago
:::::: commit date: 49 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041426.yJHdM1mZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
