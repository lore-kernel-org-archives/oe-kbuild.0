Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1320ED
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 03:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776052481; cv=none; b=pE0rpqtxA7AwQgiLcadu/uKRrHMsWOmHqtRM/25b6heqBlsiDEWkbAe95cuI2D49nFqOqyISG5tptjbl14wW+fP9n1qUA9zmJA6OGfDvdG1+Cl9Xxzxcb5DEEFRJ7ClK8lo1jqGbsLCYOjvTkzO9aT4e+c3zDPwD0emCpRraVKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776052481; c=relaxed/simple;
	bh=w8L81Ggz6a6L757CHacDDcxMoKvMOoh6X1F9aSdCGr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jLxFCAOQ3wLQyFLjWm6yaJv8UUcEIbhx1pPLzbO7mNRWXe3M3ySjxRPE39DOYVe9Fk03Bj8r5ekQErfPM1/u3Yby1MfJa9qEH6n3xYcbRPXJpL+qafWOYKd9wrKQ7tuFPXc76n023j1th+zMnetg7Qo4dfUnG2x1XcE0lOeEqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYv9UXKB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYv9UXKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776052480; x=1807588480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w8L81Ggz6a6L757CHacDDcxMoKvMOoh6X1F9aSdCGr0=;
  b=lYv9UXKBzbFIWhyTO8EV/WV3qwXlkuBQKl9kmVV7CiMSUhOp8JpR5f0w
   zaVJNmGj5i7k2WVobR06q4cfizQSVy9H3NGMtw0ZOwMPDTFBxXHvOUZdN
   8drOR2lW4r+/Sql2YKppWIk478UF+hsTZR47Ck6MVavjw7U2iRuPx9BL6
   TyOceGe+qbfjEkQvMJZR16sop4sWqgU4nUvEUSuUnrD2ZND4tFby3K48s
   8hopV1Bsx2bpEZHR/CrYOQ90fOCr2S+Ez2heL92dr+BmDBI6JG/hd3ton
   hv9axhSbvb1f8hSlfZfZm4G4S7b/mMNOvhMLN75mqiyFd0+cLWG38JkV9
   w==;
X-CSE-ConnectionGUID: xrW6rh/uQquV0p+VqeEujw==
X-CSE-MsgGUID: 9PxtPzYLTfuVRrBfDe6biA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="64510419"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="64510419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 20:54:39 -0700
X-CSE-ConnectionGUID: k68VWMO/RzmMyzBcuuVJ/Q==
X-CSE-MsgGUID: 4qOo9DZqQICCWlYcvj/Brg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="229577702"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 Apr 2026 20:54:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wC8Ng-00000000BQ5-0skR;
	Mon, 13 Apr 2026 03:54:36 +0000
Date: Mon, 13 Apr 2026 05:54:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ACPI: block AML access to confidential VM private memory
Message-ID: <202604130505.f6zSZ1Qa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260411224412.2236817-1-40759640+bfoing@users.noreply.github.com>
References: <20260411224412.2236817-1-40759640+bfoing@users.noreply.github.com>
TO: bfoing <bertrand.foing@gmail.com>
TO: linux-acpi@vger.kernel.org
CC: rafael@kernel.org
CC: lenb@kernel.org
CC: thomas.lendacky@amd.com
CC: linux-coco@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Bertrand Foing <40759640+bfoing@users.noreply.github.com>

Hi bfoing,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v7.0 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/bfoing/ACPI-block-AML-access-to-confidential-VM-private-memory/20260412-165348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260411224412.2236817-1-40759640%2Bbfoing%40users.noreply.github.com
patch subject: [PATCH] ACPI: block AML access to confidential VM private memory
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260413/202604130505.f6zSZ1Qa-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130505.f6zSZ1Qa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604130505.f6zSZ1Qa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/cvm_guard.c:22:10: fatal error: asm/coco.h: No such file or directory
      22 | #include <asm/coco.h>
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +22 drivers/acpi/cvm_guard.c

73612929ff8460 Bertrand Foing 2026-04-11 @22  #include <asm/coco.h>
73612929ff8460 Bertrand Foing 2026-04-11  23  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
