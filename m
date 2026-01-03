Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815452248A5
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jan 2026 03:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767411375; cv=none; b=IpiHTlmj3F+hJtNgJQ5869ag2vC15b/MJLVxZdQwL+JGmF8CFxSlgJ0OkvJRVtx0hRb9o0gg4C+Sm5MTvI8lFTxEK4gutV6g1xK/ebGmA61Ta/5Ru6x8x251IwjkCM7JXzZLjwjer+asQ45BK9X7Cv4HOCW6nZG3E6o11Bk8pDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767411375; c=relaxed/simple;
	bh=KTNRL21j4EsosV3OeszUIWpqCeUnwbvF4mNAaFxhTb4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=u62IAn6yXvvjMRe4BC2mqq2XhQ1wx8qg+Q6bKiGW+mQ45su2M/AvrKaXAUU6UJE6f0ey/+tO0mj8sO4Hx0t0GCewmOHHg9M7OmgqRJgGaSP6jE1VoM2eoTvBuNschyJ1mhZSl09hwtNtQvUXiPqjhemNkyIlpCC6RTu2lqKCNys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X48WxbPV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X48WxbPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767411374; x=1798947374;
  h=date:from:to:subject:message-id:mime-version;
  bh=KTNRL21j4EsosV3OeszUIWpqCeUnwbvF4mNAaFxhTb4=;
  b=X48WxbPVjJ29ylOSoGaSRy+Jy0+6TolXDx4UOQ88XWZV+cJfEFMGW79z
   Me8/PnNQuv+w/sIkuWeZUUzzLfDtwoDb0b0HI1+zQsv7S4DpH6jEx+T14
   qiibm39/KyyX31SP5qmAAtCLt7fb1B2hovy6mEmUrzrjpQB3baBjbPw6R
   wYvJCtnsxcOzsbnCDmAUUZmnG3ONaWXpyKlfBk6u/MotStTwq3JBjY4KR
   iiXmYPDDKOQI/dQmPZg/NCMrzTBJUy9YAEuTBq/K74KjcKV6ywr+yVxuD
   tsjLNW7UfZt0+e4LaKTe+mlpnuYy39H20Xku4v5HCz8SFmj7sZeoLD7Bv
   g==;
X-CSE-ConnectionGUID: UhXoYpFwQyKPIzJhBCPHJA==
X-CSE-MsgGUID: O4+vUVO9Rembb+tXTshIUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68923612"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68923612"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 19:36:14 -0800
X-CSE-ConnectionGUID: FKHTeF95Q7y5hgnH848qeg==
X-CSE-MsgGUID: 9LtNjrITQ52h6VMGNA7I3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="206422746"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jan 2026 19:36:13 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbsR1-000000000b7-1fnG
	for oe-kbuild@lists.linux.dev;
	Sat, 03 Jan 2026 03:36:11 +0000
Date: Sat, 03 Jan 2026 04:35:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Caleb-Sander-Mateos/blk-integrity-take-const?=
 =?us-ascii?Q?-pointer-in-blk=5Fintegrity=5Frq/20260103-084738?= 4/19]
 checkpatch: ERROR:OPEN_BRACE: open brace '{' following struct go on the
 same line
Message-ID: <202601030417.G9Sn0I8W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Caleb Sander Mateos <csander@purestorage.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Caleb-Sander-Mateos/blk-integrity-take-const-pointer-in-blk_integrity_rq/20260103-084738
head:   8aef29b4fb653057c431a56ad8eaa40d7784d33f
commit: 09454ae8542875807856b895dc74b98acbcbaf0f [4/19] ublk: set request integrity params in ublksrv_io_desc
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260103/202601030417.G9Sn0I8W-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#136: FILE: include/uapi/linux/ublk_cmd.h:427:
+struct ublksrv_io_integrity
+{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
