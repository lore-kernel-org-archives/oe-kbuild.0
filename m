Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265D22045AD
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763733830; cv=none; b=JV/VRYGRLi4zKai++p94YPisQqySc/50rBDVOjkrAAtFPUNnnKeEJKO2W8gDK9RvlsNlu41mbbhsPQRjEJ6tHFzuZhaMR7zggn/dLBHiD8q+nrcleunwDezfleNi6/7FJusuA8QwYbs8AWGdD5G+h5HNg+AQgcX4afdPCgonFTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763733830; c=relaxed/simple;
	bh=HeIsAIk7uHCNBEwcGw8TXpgZtlT2sW0e8oyMZ99RC+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c/gbhJxkBQiMYXuOyAKFWTB3cqJYoRbrydWrhpGpIqV29ObXJMRlwO7ThoJZA9/LSuPLtYIg6tLlxT2lNcsv5nVJUVfiX3FSehpjuEhIBC160mhJuPGaXThBa0Eu7l67jCV/HW+OPDV1GkNZxAgfr84l7X7glUaRWw/lB1xLU0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5d3fkGP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5d3fkGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763733829; x=1795269829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HeIsAIk7uHCNBEwcGw8TXpgZtlT2sW0e8oyMZ99RC+A=;
  b=A5d3fkGPKd9dj/HbLLmNUpdeyOqEL+ig5B6PeAIgO/bG4mUsDPUK8DQH
   PYfYEUSGoHba+PxCUDdPOKJh/aVrS2RLgy/sRRnvp6ckDzRnTXTsT+fWH
   ZNwXU2CY3XrHQb0cjg3sd57fwrTkQQBqM/zsIk8FGc14nSdHpyNbtwoml
   MhOOGdWAUP5apK7/dLnV4mFL4X7BbkXq6KCQ0neQc8Je+fTdqIefmdw3h
   mnVOXf3IIAcTQN4cWu6OXUCXDzPi2TUb+LK/UNKDlmpaoLYkjXJURELtZ
   bR8uhx5eUGzu9nS9Nel5m3aF0WkIkwC6zaMZ8/hwz0wemhbXVjved5tNW
   w==;
X-CSE-ConnectionGUID: ifAtPxCSRweX5ycpW0qozA==
X-CSE-MsgGUID: ZDqMajYYREqHEqES+07LCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65718451"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65718451"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 06:03:48 -0800
X-CSE-ConnectionGUID: 6skm+BR1RYaZGJXMaHcWmA==
X-CSE-MsgGUID: Z/yBqduiRwW58msj1nQs0A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2025 06:03:47 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMRjh-0006IM-2T;
	Fri, 21 Nov 2025 14:03:41 +0000
Date: Fri, 21 Nov 2025 22:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0609]: no field `status` on type `bindings::kunit`
Message-ID: <202511212130.Z9dyhGyw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um-randconfig-001-20251121 results in a lot of rust failure"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kaibo Ma <ent3rm4n@gmail.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: c652dc44192d96820d73a7ecd89d275ca7e4355d rust: kunit: allow `cfg` on `test`s
date:   9 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 weeks ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511212130.Z9dyhGyw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212130.Z9dyhGyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511212130.Z9dyhGyw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `status` on type `bindings::kunit`
   --> rust/kernel/kunit.rs:351:1
   |
   351 | #[kunit_tests(rust_kernel_kunit)]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unknown field
   |
   = note: this error originates in the attribute macro `kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0609]: no field `status` on type `bindings::kunit`
   --> rust/kernel/str.rs:606:1
   |
   606 | #[kunit_tests(rust_kernel_str)]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unknown field
   |
   = note: this error originates in the attribute macro `kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0609]: no field `status` on type `bindings::kunit`
   --> rust/kernel/alloc/kvec.rs:1297:1
   |
   1297 | #[macros::kunit_tests(rust_kvec_kunit)]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unknown field
   |
   = note: this error originates in the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
