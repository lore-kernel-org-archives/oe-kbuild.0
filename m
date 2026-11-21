Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795232691;
	b=yvG1Vo2JRoIAqlk2IJc9x0bo3UYg5PwCFpLduhyQcEK5qWQs1nXTXeOe4Ilo3T3q17uG
	 y1xOTV6XPc2wNe4+twrx4CMCMaP+wfkv/YORn1jyTD+046ehP14XrRlpyXlBfms7fPijD
	 A1LQYjYcfcQM72jvv7kaAG2/SBQsSdJxLPZq/ZlrqzlcQC3qcU9LpKFFTHrrYQBPGNgN4
	 ep3ezBJ0szn9OnHdIzA8LBfb7A7byxkL9h59RSlf+2xpiGBoG6XfjupYo9ijhu0nITjGm
	 jCtN7MwpnF9w3h/5H2tCmp0daGOlVHv/Xx7htWd5J2ACfKOMa0CwGKkDYvzq8W2Bemg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232691;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=xaRowZKnbKwnqsOFqCSsUoC7KdF+PliMHNF8e1LZdL8=;
	b=uggWrFKnenorIDCxGiuAr7kjA09stB/fOkXAfqv32jurPyWj53/UybVKt8qmgGH1etqM
	 rVO+I4OZRfTc1/tZtFoEuSEUREAFSZr0seJyhfje6NxomL7DdEEe4hb6kM81ccp70B4CQ
	 i8Dk/iOX4xhkHMlU2BsgHXe511l4tUGqFWSpSRtRgmUARjRhBSPS8Um8HBeGkO5ZHY+HZ
	 LOdk+kRLrRG0D+4ekOvIZkWmi3EIp+nPVSizSNxhLy83jroOKbn/SXSNQZqhgSIs2nDaa
	 27IK3wrxqCPSi2P1tjn2emeKKHRPdhqSTivUeNPFx/xB8hL0Yekj0sFhFFmHn1x6g/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I2hXDeJp;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E803606A6B7
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 03:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E803606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I2hXDeJp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795232686; x=1826768686;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GT03nTh52knH/0SOJ9KQP7BpmyVdd7NuFK16PA1FAEo=;
  b=I2hXDeJpQdp/+mZE0sQYs/UP3M0sJS76VVv2ZHam2KGfUzQIQEqr0s4n
   x9V9hARPxcqb5WQLlADBCJY14Cg/hvwFfPTjTwLbBt6lvp6f3e//Eo5p3
   GJZJR/h4C/dFCSQoqwtBdf9yqW5CUl3rtk3oq2KJnBJ/U3NLlu4ZNKaLL
   6B8UBqfkwJbs7bayQf4ydu0kW1Vh8YpkAaCgZ63TbKitsKZEcy741LE9S
   Jdiap48+2ayHb6pO14igifXW+2d9BPVF+LO2D2Jorm1qyZJBx19DLp32F
   vyHfOe7JVZwDzUHHnCE2ZeSiiQMpv6H93lMinIoX1YHKvAUP4SpvIX9A2
   g==;
X-CSE-ConnectionGUID: Bj0Q4wt9SzqRXniduBt2Ag==
X-CSE-MsgGUID: zf3FPLJXSG+5E5iOjdYHUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4111239"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4111239"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 19:44:45 -0800
X-CSE-ConnectionGUID: +HqxlAeAQyukOyrBP2Ew8g==
X-CSE-MsgGUID: H0Zq/tVKR0OKpsPjtFtL2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10926780"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 Nov 2026 19:44:44 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUc1o-000000004E1-0xbp;
	Sat, 21 Nov 2026 03:44:40 +0000
Date: Sat, 21 Nov 2026 04:43:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 08/10] selftests/futex: Expand for set_robust_list2()
Message-ID: <20261121043449.n6kV1P6H-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "same reports for this branch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261115-tonyk-robust_futex-v8-8-a4fe47333a28@igalia.com>
References: <20261115-tonyk-robust_futex-v8-8-a4fe47333a28@igalia.com>
TO: "André Almeida" <andrealmeid@igalia.com>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Darren Hart <dvhart@infradead.org>
TO: Davidlohr Bueso <dave@stgolabs.net>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
TO: Waiman Long <longman@redhat.com>
TO: Ryan Houdek <Sonicadvance1@gmail.com>
TO: Thomas Gleixner <tglx@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: linux-api@vger.kernel.org
CC: kernel-dev@igalia.com
CC: "André Almeida" <andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9f74092fda91ef93c2b07585785c1dc83cd7971f]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-Skip-test_futex_robust_unlock-if-not-supported/20261115-143110
base:   9f74092fda91ef93c2b07585785c1dc83cd7971f
patch link:    https://lore.kernel.org/r/20261115-tonyk-robust_futex-v8-8-a4fe47333a28%40igalia.com
patch subject: [PATCH v8 08/10] selftests/futex: Expand for set_robust_list2()
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261121/20261121043449.n6kV1P6H-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121043449.n6kV1P6H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121043449.n6kV1P6H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> robust_list.c:56:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_CREATE_64'
      56 |         FUTEX_ROBUST_LIST_CMD_CREATE_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from ../include/futextest.h:23,
                    from robust_list.c:27:
   usr/include/linux/futex.h:196:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_CREATE_64' with type 'enum robust_list2_cmd'
     196 |         FUTEX_ROBUST_LIST_CMD_CREATE_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:57:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_CREATE_32'
      57 |         FUTEX_ROBUST_LIST_CMD_CREATE_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:197:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_CREATE_32' with type 'enum robust_list2_cmd'
     197 |         FUTEX_ROBUST_LIST_CMD_CREATE_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:58:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_MODIFY_64'
      58 |         FUTEX_ROBUST_LIST_CMD_MODIFY_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:198:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_MODIFY_64' with type 'enum robust_list2_cmd'
     198 |         FUTEX_ROBUST_LIST_CMD_MODIFY_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:59:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_MODIFY_32'
      59 |         FUTEX_ROBUST_LIST_CMD_MODIFY_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:199:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_MODIFY_32' with type 'enum robust_list2_cmd'
     199 |         FUTEX_ROBUST_LIST_CMD_MODIFY_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:60:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_LIST_LIMIT'
      60 |         FUTEX_ROBUST_LIST_CMD_LIST_LIMIT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:200:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_LIST_LIMIT' with type 'enum robust_list2_cmd'
     200 |         FUTEX_ROBUST_LIST_CMD_LIST_LIMIT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:61:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_USER_MAX'
      61 |         FUTEX_ROBUST_LIST_CMD_USER_MAX,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:201:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_USER_MAX' with type 'enum robust_list2_cmd'
     201 |         FUTEX_ROBUST_LIST_CMD_USER_MAX,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:66:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_SET_NATIVE'
      66 |         FUTEX_ROBUST_LIST_SET_NATIVE = 128,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:206:9: note: previous definition of 'FUTEX_ROBUST_LIST_SET_NATIVE' with type 'enum robust_list2_cmd'
     206 |         FUTEX_ROBUST_LIST_SET_NATIVE = 128,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:67:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_SET_COMPAT'
      67 |         FUTEX_ROBUST_LIST_SET_COMPAT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:207:9: note: previous definition of 'FUTEX_ROBUST_LIST_SET_COMPAT' with type 'enum robust_list2_cmd'
     207 |         FUTEX_ROBUST_LIST_SET_COMPAT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:70:8: error: redefinition of 'struct robust_list32'
      70 | struct robust_list32 {
         |        ^~~~~~~~~~~~~
   usr/include/linux/futex.h:182:8: note: originally defined here
     182 | struct robust_list32 {
         |        ^~~~~~~~~~~~~
>> robust_list.c:74:8: error: redefinition of 'struct robust_list_head32'
      74 | struct robust_list_head32 {
         |        ^~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:186:8: note: originally defined here
     186 | struct robust_list_head32 {
         |        ^~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
