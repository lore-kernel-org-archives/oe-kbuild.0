Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6E11CF8B
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 03:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769396657; cv=none; b=X2FQH6qaRZ94lyo3aPEreRXGGFmzm9xRzDr584/0DDM8MvhjYHItZmbRsFd2D3Gf2vWRYWSr6zhynDWNEHLcyDdclBAiZLxvhJQ3c18M3OiFSTtvNTQfU9iZQpbI92CAPTAzQ8tDeukZmz8APwk2GUj54tZlWE2vMPdGtZJywUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769396657; c=relaxed/simple;
	bh=hKXIofUaWK5P9giprBT2LIFITIOITlHipU1RPoMq1Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLBo7YT2YrKVf7SxdXUD/BRdv3gjhiDBieF1lTKTcGQLcLS/uw1v81m+emDmlOdowlEdGLmX0xNtoKNeZeq7pASNG1NXz1UkUbuVYn/VYQfJGbL7fFBQSlBw71gpuhPPP7tjTZRYDlc0vhQG2MXTAi+zyUsfC0NG7lKvqh1xDWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+fRlv3z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+fRlv3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769396654; x=1800932654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hKXIofUaWK5P9giprBT2LIFITIOITlHipU1RPoMq1Ic=;
  b=C+fRlv3zT7v81Hgaa9qkW/jzkGLjexpJQClAOVyCsM8o7sRVxZjKcPo2
   QB2hXK+IQlHdIPhEwi09BDrIAs5V1EJYijBt2Mxea9zMEOVrznUKwrGlO
   TqMjw12eWd4psjP+y9R/YO6HPjKA4h4QTmT6sdlIPsHEpcfBUYyKcE2vE
   +zgSF0v+CqEq1v/1yaZUp/jsoAlLJjg5lgpHe99utrhG7UB3uOauLbZD4
   iRWeAkk0AugGMDxUsVB4s+Nifjaje/Y1uTyiaApcj6BKWxEy7Nk/sQimA
   bsHf3wpzjUecdLnLHKLkoLunE9gOK6xIOUFk2TaxzPfjsIXZ37bwFCqh8
   g==;
X-CSE-ConnectionGUID: Xs18KmKLR5+PU3m8Mym+gA==
X-CSE-MsgGUID: Tj9GXDdaTySHD9vqaORm6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="88158212"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="88158212"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 19:04:14 -0800
X-CSE-ConnectionGUID: jdG9hCqUTjqAiiYe/vQ7pA==
X-CSE-MsgGUID: iQU5Oi4RTAmCvSMVyAZ08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207618633"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Jan 2026 19:04:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkCtd-00000000Wpy-1I5l;
	Mon, 26 Jan 2026 03:04:09 +0000
Date: Mon, 26 Jan 2026 11:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] gpu/drm: panel: add support for DSI panel used in
 Motorola Atrix 4G and Droid X2
Message-ID: <202601261028.Iq9QFH98-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/panel/panel-motorola-mot.c:242:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260125131904.45372-3-clamor95@gmail.com>
References: <20260125131904.45372-3-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.19-rc7 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-display-panel-document-Atrix-4G-and-Droid-X2-DSI-panel/20260125-212020
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260125131904.45372-3-clamor95%40gmail.com
patch subject: [PATCH v1 2/2] gpu/drm: panel: add support for DSI panel used in Motorola Atrix 4G and Droid X2
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: nios2-randconfig-r113-20260126 (https://download.01.org/0day-ci/archive/20260126/202601261028.Iq9QFH98-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261028.Iq9QFH98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601261028.Iq9QFH98-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-motorola-mot.c:242:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/panel/panel-motorola-mot.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/panel/panel-motorola-mot.c:243:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/panel/panel-motorola-mot.c:243:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/panel/panel-motorola-mot.c:244:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/panel/panel-motorola-mot.c:244:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +242 drivers/gpu/drm/panel/panel-motorola-mot.c

bd2f042d3e9e4c Svyatoslav Ryhel 2026-01-25  241  
bd2f042d3e9e4c Svyatoslav Ryhel 2026-01-25 @242  MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
