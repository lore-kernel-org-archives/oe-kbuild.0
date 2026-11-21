Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245256;
	b=jBe+LQaiUR+V+ItVIIFtobxqWRKF9DvlF6ZZN8oY6iHJiDDZ1Z31BTLHbFhjQ8Tzo5Q5
	 gz3TemcPTgFm3xxqDQrt00c7TSlK1QlAH9h3Q4TUdWEDwZWCD9aZMxH6zXxEVog8y9mP5
	 T5vfVzImO27K4epJfmx8IAizRNZFP0BPqeFEdy0922rBtDBJWl56QjQJMV/U6r95OEbhD
	 Of5gINsZKZSEwMaqKcCpe4/brhGXdrlT7Zrjrn5FN1gN57I1KeO/PFnShHY/xIPdgB4Uy
	 MkujxuoUt4CdA+cKfd+27fvzLjeTOybszaYdC2oevHI+dyZfAmdnpXJ/WCmq7wDg9Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245256;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IRxuznqdyrbIdek5MarmWf2blsZ4zK6PKWKcJQamziI=;
	b=VIpZJj5K+f4PcM8N/o+nlruCZV0VBeYjBVsZdTnjuVA42p3yu593Ff/f+hmKMgV2dsX5
	 sH2/5RkhMByV15Co34kSW61P1Vsa+Daxer+dIViS2TYKB2Et9ldCx98FAG92sHLUi43L7
	 CSjNoIriTHukwLlm16/7xmkJ5ReqqXQxILfd/Qp63xNVVJN1zbAA5E9N54iRnX4/+gzzF
	 sFvX/r8SE/199B0Na6FkUJpP6YRFk6TYhj6FpBaNoNUVuxk/dsBULc655C4vJjVGXIQXi
	 E2X539einLn8czd04ycWToneQVxPM6PGX4WsAMxznOIrdW3eeTpY3tkzep4Xrico4Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crfhZNsE;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4924A606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 07:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4924A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crfhZNsE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795245255; x=1826781255;
  h=date:from:to:cc:subject:message-id;
  bh=onwJRS0GEqS7bwnqmYPCVRWqb2Bh8mpqwIC0HTfITGw=;
  b=crfhZNsEMOr6Cf/r4Uc3hpehCmC1Z04/9P+7fQ2H0GFX5U7HWSi327pm
   s9Sy29ScznK5qa81JZ9KYdHAlIscxAc0pJKSUc/siB1lRyaLo3GmQrTeg
   2pUIQaDyf7+6YUofWtTGjn2LeKRCPEgLDIsjFlai1UIw8KP0D41zIfNFp
   dUxI941W3Oucvo/kGpul2dPNjSCsPd1GOU2p1OM8reX5B6Mpl5Dlfg6vJ
   TOpMbCP/hwApthDjs+coa5KvgSZRJ3GU4ZOjwKReafDsyIfprWbFL10o+
   d5H9/1IwJx6wI/pdwJ/cDVV9Q0zDGivyhtCWuvYr398G8My4wOwie5VTF
   A==;
X-CSE-ConnectionGUID: jKgIsFg1SqGLUpo8AMfPXg==
X-CSE-MsgGUID: Dr9ZNqO/RBSGsznIrDbdQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4166006"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4166006"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 23:14:14 -0800
X-CSE-ConnectionGUID: M/BvjJDRRGCcxoshoZt6Kw==
X-CSE-MsgGUID: X5zApiQZTX25gACoblo+Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10952458"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 20 Nov 2026 23:14:14 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUfIZ-000000004Gn-3EhY;
	Sat, 21 Nov 2026 07:14:11 +0000
Date: Sat, 21 Nov 2026 08:14:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 test_perf_kallsyms_lookup_name+0xc8 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <20261121080946.NH0SMQkj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
CC: Steven Rostedt <rostedt@goodmis.org>

Hi Woradorn,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c44104f3642da720164042623e4832836aefdd8e
commit: efdcfd9b4f4f07aa70663ee02a79dbdf980bf582 tracing: Use seq_buf for string concatenation
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: xtensa-randconfig-2000-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121080946.NH0SMQkj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121080946.NH0SMQkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: efdcfd9b4f4f ("tracing: Use seq_buf for string concatenation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121080946.NH0SMQkj-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x60 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: test_perf_kallsyms_lookup_name+0xc8 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
