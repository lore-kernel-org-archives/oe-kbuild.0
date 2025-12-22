Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A0E330668
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 10:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399167; cv=none; b=A9pw9wgRvVrH8/2Hx3gDoY7IY98n8dA7k2fP9eaEGvX8aKO7V7+865psrYwQ7ccOAEG3xOvAT9jg/6EgoGZGhTg7CML+IN1uh4hXBLyqtLMYvhnKNoReZFrdQS351eiQeGew8l3buJI3NlKYozv9zf4DWIFS8kUL9sN9qMYCWWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399167; c=relaxed/simple;
	bh=MD/AMDJOQ6TWK8vqdhrUgoWi01H7BHKUsSQwYUr+C+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O0fq1F6cRQUVpbBmVFwq4tnKin/+OC7eSxtEmVWbGyoWSCTTQ1kuKVrkterK6ie4BhUJfKF7r8oQRWtbJlrgmSVUvvSSUAMHiexqW08blfBYpTtalY7SwD4g99cMbOqFwXVflwZtB1teto6v+P89Dma2X6+abPk/PagoW9kzl4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRAw9BOO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRAw9BOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766399162; x=1797935162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MD/AMDJOQ6TWK8vqdhrUgoWi01H7BHKUsSQwYUr+C+c=;
  b=CRAw9BOO0EOY/ovhQBxFWUQI3u12yYIArmWnwGDY1PTUvMjHh9bdX2/G
   C0Q+7EbvL9rbYfaV2SzBHNSiWli7YPmVtvkwsVzQJ39BqeIL9M62TEWDh
   McbcsKaRV5pSTzIv1QQb+Kb5vRVJG/YgVkIRWV88VlDDzwi5FywMQWYRb
   Xmskzqo8gleNJDRg4YEmMN/6IAOAVWQbjmHR9kHGIevMKk5kDHia5Kv7/
   9j0kkckCFYIbXMD6tUoXIskr1Zak4+GAex+7Lt+DE+q+dWLnA2ArJEN1u
   A7bjS37pwV4AdsEWUT+xaJF1aoSXa9HF9EebWd8uqNDUh6eRHDO/+kalP
   A==;
X-CSE-ConnectionGUID: ffBCI7I/QZOUUrClgapO6A==
X-CSE-MsgGUID: zAyO1+9RRbWHaoZW8GOH5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78971822"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="78971822"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:26:00 -0800
X-CSE-ConnectionGUID: zc7HMBoORNqNVeQ4rmj30w==
X-CSE-MsgGUID: VKmfKYOpTQmp+wJxWYINMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199405186"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 02:25:59 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXd6r-000000000Nv-0QQO;
	Mon, 22 Dec 2025 10:25:57 +0000
Date: Mon, 22 Dec 2025 18:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/9] platform/wmi: Add kunit test for the marshalling
 code
Message-ID: <202512221832.isjk7Trr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/platform/wmi/tests/marshalling_kunit.c:445:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251220204622.3541-3-W_Armin@gmx.de>
References: <20251220204622.3541-3-W_Armin@gmx.de>
TO: Armin Wolf <W_Armin@gmx.de>
TO: hansg@kernel.org
TO: ilpo.jarvinen@linux.intel.com
CC: platform-driver-x86@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux@weissschuh.net
CC: Dell.Client.Kernel@dell.com
CC: corbet@lwn.net
CC: linux-doc@vger.kernel.org

Hi Armin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Armin-Wolf/platform-wmi-Introduce-marshalling-support/20251221-045132
base:   linus/master
patch link:    https://lore.kernel.org/r/20251220204622.3541-3-W_Armin%40gmx.de
patch subject: [PATCH v2 2/9] platform/wmi: Add kunit test for the marshalling code
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r132-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221832.isjk7Trr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221832.isjk7Trr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512221832.isjk7Trr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/wmi/tests/marshalling_kunit.c:445:1: sparse: sparse: bad integer constant expression
   drivers/platform/wmi/tests/marshalling_kunit.c:445:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/wmi/tests/marshalling_kunit.c:446:1: sparse: sparse: bad integer constant expression
   drivers/platform/wmi/tests/marshalling_kunit.c:446:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/wmi/tests/marshalling_kunit.c:447:1: sparse: sparse: bad integer constant expression
   drivers/platform/wmi/tests/marshalling_kunit.c:447:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   drivers/platform/wmi/tests/marshalling_kunit.c:448:1: sparse: sparse: bad integer constant expression
   drivers/platform/wmi/tests/marshalling_kunit.c:448:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +445 drivers/platform/wmi/tests/marshalling_kunit.c

3b74e5be7800d6 Armin Wolf 2025-12-20  444  
3b74e5be7800d6 Armin Wolf 2025-12-20 @445  MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
