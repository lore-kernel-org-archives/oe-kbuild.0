Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA94225A35
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 03:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768188111; cv=none; b=rQPe5mzlhnoHi11BTGrlcDea3C2n2gaGGiOLc/k2s1sYgLhYitSIYTGx8L1ftyzf51aqo3Ae5L2WoG7K/SJWCJx8bpplAG96BR54x36rN6j5SMVVVKr7Jn5ajuqHFIq1WP5Rc7qVsLTDvuTVBLzFyvqvys+B5gLZZQbNeoLstFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768188111; c=relaxed/simple;
	bh=kpN7duzPkWAFoIV8PZRjTfnpiwKCb3k1jHVNwVu7Ytw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LkyyNXGHKVPVDxXNVPl5rSi3SL3ti12n29cu7r4IE0glPtWdZMgnNQ1Iy2r/NE0vPvomOQrcMJE/csidP3/pvac0o46wKhr0cya3e/1PhOwaRPpgHrEnlyE6bDartIODVyrq+esRIqP7Lc3/vT7bp85Qsk/YoD6ssp9VnrSIc/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUoAChZT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUoAChZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768188109; x=1799724109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpN7duzPkWAFoIV8PZRjTfnpiwKCb3k1jHVNwVu7Ytw=;
  b=WUoAChZT36+KDcFRn6hkfRpXXzOkSPcl5adrdHCqlxImJQX9E3DfW/3U
   fgg+TpH8xfyHeqpsI4tMotmXHcHrnd58l7v3Cj/0Q8mqzDRrma0LK0gVk
   VaixcdVurYu9KJvHtuBphXVNi7zoz0YLGO/+42C4FLRdjOE84NQ1P3H80
   vfiyfT5qCNeTI+kTLzOQU/+KOowuwJeeFijhGoiSUPJbHlMu1c6gKp0Qr
   3Oy25+ZkrqArWURY/Lg0zdwF0gEdRD1tv+FBBTIizHlEBVX9sIl2FwvP3
   b5PW5mat8K754LJR8BaGkQyhYUZRMEl/pq0Iu0Au377qexl8ifYR6lUvg
   g==;
X-CSE-ConnectionGUID: CpdH5iroTu6g/qJ6lXcLzQ==
X-CSE-MsgGUID: hYIg+dBkTd2DOE9fCX9BXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="87047540"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="87047540"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 19:21:49 -0800
X-CSE-ConnectionGUID: vy4OXEX4TWyNZmiDSKERhw==
X-CSE-MsgGUID: gtjtN0bHQza6kcY7rHocmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234683242"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2026 19:21:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf8Uz-00000000CwK-1wt1;
	Mon, 12 Jan 2026 03:21:45 +0000
Date: Mon, 12 Jan 2026 11:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
Message-ID: <202601121117.rRSEQtI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/input/touchscreen/touchnetix_axiom.c:2973:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260111-v6-10-topic-touchscreen-axiom-v5-4-f94e0ae266cb@pengutronix.de>
References: <20260111-v6-10-topic-touchscreen-axiom-v5-4-f94e0ae266cb@pengutronix.de>
TO: Marco Felsch <m.felsch@pengutronix.de>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/firmware_loader-expand-firmware-error-codes-with-up-to-date-error/20260111-231146
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260111-v6-10-topic-touchscreen-axiom-v5-4-f94e0ae266cb%40pengutronix.de
patch subject: [PATCH v5 4/4] Input: Add TouchNetix aXiom I2C Touchscreen support
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm-randconfig-r134-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121117.rRSEQtI0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121117.rRSEQtI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601121117.rRSEQtI0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/touchnetix_axiom.c:2973:1: sparse: sparse: bad integer constant expression
   drivers/input/touchscreen/touchnetix_axiom.c:2973:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/touchscreen/touchnetix_axiom.c:2974:1: sparse: sparse: bad integer constant expression
   drivers/input/touchscreen/touchnetix_axiom.c:2974:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/touchscreen/touchnetix_axiom.c:2974:1: sparse: sparse: bad integer constant expression
   drivers/input/touchscreen/touchnetix_axiom.c:2974:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +2973 drivers/input/touchscreen/touchnetix_axiom.c

479f045f318bf9 Marco Felsch 2026-01-11  2972  
479f045f318bf9 Marco Felsch 2026-01-11 @2973  MODULE_DESCRIPTION("TouchNetix aXiom touchscreen I2C bus driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
