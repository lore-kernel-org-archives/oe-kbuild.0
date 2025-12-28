Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDBA2A1BF
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 07:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766905307; cv=none; b=Cq7smTIjjH3/q1mmsQxtLTTHGorsT1Cc2v20OC+wpokxwb0QSEFn3uw/GU+ip/wVJH0qKXe9w3Q1sPwv0B5ngwDqQbMKP6A6f1wSU5EdwaHJ8mPMRwAL645uyEezmfLJ60c7eJ9SjIDYoL/yP+S9qmTWK524wMVRJzg/cKE8xGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766905307; c=relaxed/simple;
	bh=qm46Kd1gYgKj8ykFBLPD4SxNEyUllIPtntbbGo5130o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=En+xdHiBsRzQ8J0lzxZxaf5GEtfMNvW6cm93AvN8OXAWmYSjgCM/ic+aPHP6o3T4vfa2XKyexAWwXWTrc2RfbHryXpK6V7aHSaFxWJo+rTOfcui6hdrIonm7fFiq14wefmUg8jBkcnn65422UgHsk1r8KR+RR7zHHmRp59ZY1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Acajst+A; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Acajst+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766905306; x=1798441306;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qm46Kd1gYgKj8ykFBLPD4SxNEyUllIPtntbbGo5130o=;
  b=Acajst+AbWvTKn5I8/JNed6lTN1na87yGfLIohm4r8LK/lDUGwjjeacD
   b1ttLslWyoIdhsyhrBRNj7/45RTHycs84WYkzMZpKEkQeuMrfOuhF2XBX
   WuP9UChPn1AUFLMeO5kkDp5ptBWbLKsYS0/zwev7F3fpTiItZQtX0RFg6
   amiARzYGIICYct/l3iFHQU5L2c04eDOhEF5HzE+9Drcs57d5YrYvcX4DV
   ATxbQ4fmB48yMP6Y35e12qQVC8BVQClR7pdR+YMlHt0LqSM7CU0tBtL/C
   v0cHiTryb8jF4iaVHK6KmCW0O6mp901TasU02y4/eGqBiTxHW2yqGPQ3L
   g==;
X-CSE-ConnectionGUID: l9ZBs3LjT3S+Djh9QwTV3Q==
X-CSE-MsgGUID: SmKbmP8TT2eRKu6ei4120Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79289548"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="79289548"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 23:01:45 -0800
X-CSE-ConnectionGUID: Bx0G3LxPQCi2Mvggod4aBQ==
X-CSE-MsgGUID: ERwg2DPfSiCW7CWYsCBoKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="224160332"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Dec 2025 23:01:43 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZkmb-000000006Jh-1H8c;
	Sun, 28 Dec 2025 07:01:41 +0000
Date: Sun, 28 Dec 2025 15:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] power: supply: add battery driver for netronix ec
Message-ID: <202512281431.wqGWLyUM-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/power/supply/ntxec-battery.c:98:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251227-kobo-aura-battery-v1-1-328a90ef5122@jm0.eu>
References: <20251227-kobo-aura-battery-v1-1-328a90ef5122@jm0.eu>
TO: Josua Mayer <josua.mayer@jm0.eu>
TO: "Jonathan Neuschäfer" <j.neuschaefer@gmx.net>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Sebastian Reichel <sre@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: Andreas Kemnade <andreas@kemnade.info>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Josua Mayer <josua.mayer@jm0.eu>

Hi Josua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/power-supply-add-battery-driver-for-netronix-ec/20251228-005512
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251227-kobo-aura-battery-v1-1-328a90ef5122%40jm0.eu
patch subject: [PATCH 1/3] power: supply: add battery driver for netronix ec
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: sparc-randconfig-r112-20251228 (https://download.01.org/0day-ci/archive/20251228/202512281431.wqGWLyUM-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281431.wqGWLyUM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512281431.wqGWLyUM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/power/supply/ntxec-battery.c:98:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/ntxec-battery.c:98:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/power/supply/ntxec-battery.c:99:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/ntxec-battery.c:99:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/power/supply/ntxec-battery.c:100:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/ntxec-battery.c:100:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/power/supply/ntxec-battery.c:100:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/ntxec-battery.c:100:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/power/supply/ntxec-battery.c:101:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/ntxec-battery.c:101:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"

vim +98 drivers/power/supply/ntxec-battery.c

57d7cfa5d39915 Josua Mayer 2025-12-27  97  
57d7cfa5d39915 Josua Mayer 2025-12-27 @98  MODULE_AUTHOR("Josua Mayer <josua.mayer@jm0.eu>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
