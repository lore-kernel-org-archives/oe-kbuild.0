Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE732951A7
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331186; cv=none; b=DIAvh2o4z2okwP+Pn0K1/KttsLEWFYL7qv3QnEnOGlENcDtGRuF+9QFsBQXS7rMmuqMdZnoBL/vFy6y7cqawGolQozJCwF5ZkJKu5vCLCxNK95XToVusMQR+08OeVig+TI786t/Q2ZnZ3gVHd10OfTfTwfQuSz6BOxO0zsRkWKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331186; c=relaxed/simple;
	bh=231W7g+ARV1y/fBNrG9yZoKqnhn+vk5Yw4IIEyQgCLU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fRWGjvIRlOxJxHnlh4Da9NH9ZlU/dHi2V0TJaJpkzT6MydwCQUFTUqSJic7fynFH9k7QojDL40G+kLhWkOwcq+ocfocW8FGAivA9GXYR5e/4eK2PAh7CwL8ZVx9g8JNiGTRu/boWuJuJj+NVk/2+O9ryUGxAHRMRwaLzlIZLKGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbIX0HH8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbIX0HH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331184; x=1797867184;
  h=date:from:to:subject:message-id:mime-version;
  bh=231W7g+ARV1y/fBNrG9yZoKqnhn+vk5Yw4IIEyQgCLU=;
  b=HbIX0HH8eeGScCAJK7sxdnLNfkMNY+NIOWFRrkmJ1a+k5pQKPxyRutpZ
   uu+T8UaYq9Wnn6V0lABWlm5NBrT10wURd+MbY1XVw42vU5CzGUCjBJZkN
   a70uIcCkxvIAP34Pb035xr8E4kHel8k2cm/PVzZTFq1BqnAs59sQLdRiG
   BI89ILbdALFYJJgE0VBSO5TzB5ZGyFUEFHEjmiqGu5SNfFrg1jEvyXKVv
   f9vj1r55iiOkwZvnJUZQUuCHV7N22/2oKUGpT5IPzPvcZ6BqxWlgOV1U2
   WcoPSsywlaPn5VpvFBb0h4DdAbpt3VyOgtZXtgqCsj+LL6rqWh8wDKPj/
   w==;
X-CSE-ConnectionGUID: 0vOjD8GCS2qXizF8+Qokww==
X-CSE-MsgGUID: dHXwdcmRQaOJhUNqoSUK5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72058728"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="72058728"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:33:04 -0800
X-CSE-ConnectionGUID: hAB4XESkSAO7AlfzdE0uSw==
X-CSE-MsgGUID: 8Lw47lizTyOMHzxGicNwcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199837522"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2025 07:33:02 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLQa-0000000057Y-2d55
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:33:00 +0000
Date: Sun, 21 Dec 2025 16:32:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 58/246] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'initial'
Message-ID: <202512211650.PzT9Tk66-lkp@intel.com>
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
commit: 41d8f709b29145d298eb0be97c70cf3222b8f088 [58/246] drm/apple: register backlight device after IOMFB start
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211650.PzT9Tk66-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'initial'
#47: FILE: drivers/gpu/drm/apple/dcp-internal.h:159:
+	/* Workqueue for updating the initial initial brightness */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
