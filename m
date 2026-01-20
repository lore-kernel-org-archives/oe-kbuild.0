Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6273D4105
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768897070; cv=none; b=td2dWJ4HJlnyYFOjc+0vQGS4jN+/O7aoqtaG0+QIJwSpV1WYTJWV59GOfxhOslmdqGrnMRoFfDg+Vm52Mx1ZkyPxWdOTh3DJTVojpTZqh9oM5F6yI1hOEEe0qTeAQp7EdAl21b44gNjWNLc1g17ssPuIjhvAqBeWIGrDJWOWQkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768897070; c=relaxed/simple;
	bh=s5WR6fSToXpTmYPw3L6EzwspgDGGjpUOBqbuHLtTp58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mzbY3FsPdeGe5GBPlFIqaesDmmx6w5ld6SPb7cyxj9I/RHb/oa37LyQEuUcs9xhm8TwQhMJ7ogVwXXGPj4FAX9BHSit6xQcNojH8A120ZG66dcV+nGichvllbC8TjBHI3k1/MMFbkY6jmF9gWUpT3Hr+mGFBKE+gm+y9PabYcmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFQPtxKw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFQPtxKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768897069; x=1800433069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s5WR6fSToXpTmYPw3L6EzwspgDGGjpUOBqbuHLtTp58=;
  b=ZFQPtxKwRtSx24c9SBOjBKVrvB2oYvArlrNR/hKhAhkALoNRshgop4gt
   KsG0YQkkf1I+DtIWRg1cJIj2+IswS1CiyeypvNXjv+jfhuefpszmixyyz
   WgZ2KRMMxX7hkgY/HRLfNkevkG4oOnsZuecLSUBx7Wp6WAXDdKDSlkfRp
   /r1fwhPX/nHAfS0MsymYM3nqzre9IvyygucU9qsfq0fOXwHwTk4SdaL0v
   wBKiGSRXt2wfQegkWALRNjZjjzc0B1swXIvBtleipXCuJkcEt7fjT4oMP
   ABBfxk4LisYue4M0DsDJFLP3i3i8UTg4xpchsmgJtxNmuxnNwg+/K1V52
   g==;
X-CSE-ConnectionGUID: VNsRJZyMTYyySISlD1USTQ==
X-CSE-MsgGUID: 25C+kdzRRdy1zt7r1iZ0Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80732084"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="80732084"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 00:17:48 -0800
X-CSE-ConnectionGUID: gNE7KnCTRQOiHi8rgk9lFg==
X-CSE-MsgGUID: ym+rtlNSTkCM1YD308D+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205965637"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2026 00:17:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi6vp-00000000Oif-0sJz;
	Tue, 20 Jan 2026 08:17:45 +0000
Date: Tue, 20 Jan 2026 16:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] revocable: fix missing module license and description
Message-ID: <202601201432.ouoVHvm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/base/revocable_test.c:141:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260119195141.12843-1-dakr@kernel.org>
References: <20260119195141.12843-1-dakr@kernel.org>
TO: Danilo Krummrich <dakr@kernel.org>
TO: gregkh@linuxfoundation.org
TO: rafael@kernel.org
TO: tzungbi@kernel.org
TO: broonie@kernel.org
CC: linux-kernel@vger.kernel.org
CC: Danilo Krummrich <dakr@kernel.org>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 744905705113a6ab4c38127f18cc0d71594cfaec]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/revocable-fix-missing-module-license-and-description/20260120-035657
base:   744905705113a6ab4c38127f18cc0d71594cfaec
patch link:    https://lore.kernel.org/r/20260119195141.12843-1-dakr%40kernel.org
patch subject: [PATCH] revocable: fix missing module license and description
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: openrisc-randconfig-r134-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201432.ouoVHvm5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201432.ouoVHvm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601201432.ouoVHvm5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/revocable_test.c:141:1: sparse: sparse: bad integer constant expression
   drivers/base/revocable_test.c:141:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/base/revocable_test.c:142:1: sparse: sparse: bad integer constant expression
   drivers/base/revocable_test.c:142:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/base/revocable_test.c:142:1: sparse: sparse: bad integer constant expression
   drivers/base/revocable_test.c:142:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +141 drivers/base/revocable_test.c

6a15cba130af06 Danilo Krummrich 2026-01-19  140  
6a15cba130af06 Danilo Krummrich 2026-01-19 @141  MODULE_DESCRIPTION("KUnit tests for the revocable API");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
