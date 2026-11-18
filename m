Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018025;
	b=KJZKbZZFtRVr6I07oBR3uaQ0/obJ3erJMng7/xyutoTaKJLNtbsjTevQIcjpsRbZ2ifI
	 0cNsAEx9Mq4f3fev3PpiR2lD0G084smZQb/JGgQDY63af1N5fk0CWP61HKVDhv89PfVcf
	 gM3lk0xRfL9/c32ADhMSSRZpoGwkqDB/yZIhMMO50NePoXEstjvMK5cR4/gKl6w6DLY/0
	 sOtXcr+BiHGIOcOXiVs82qPAbdbqHNu5eiKxk1dXPJR7et0tl/OxoPsbqz90ihNXmsxQw
	 wQc3qfn4vwItr7R/bJeEHb1oZQytsP3Gp9U8urQV4sppXG9Xvd9JeSmuxKSxwJ0NuWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018025;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LesvFPDOMJkogO8vD9Ovs6hVU6eAVhoWM7AtlQVo4qs=;
	b=Z2p3+yg2uEQFnB8nocD0khUVScWesEdUNk8UByrkroXGuBB/7tNixTGPNpbQ8AZkEVld
	 oHfExnlIpaPb2wF4bhf0Ft+VCXQz4cFHiCHudlR0LC4JZddA5zpenJl7f2xsNgQ/iYPsU
	 e//0GAiLDAPwXccadErKWT9jdgInimd1sLNYWsACNUsdof7gWPwFlayHIWn76GTooA1mY
	 X9/DtsM7CwAxXW94hixCOAqjHXU7PWZJB9IU6CuxOkuSevYZ9zlDydlk/v+JYBVLOeMai
	 61o0L8NkPLGVfsy+P9MsdjbztPZR7tpBd5GDJLvCNGFDCNiXkQ+RVP6aieQwyIUOf6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q1AneJlQ;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B66606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 16:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q1AneJlQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795018024; x=1826554024;
  h=date:from:to:cc:subject:message-id;
  bh=EDbm9S6Ie/0YJ6/DI+hLKmoFp/xGU0lzjY5jEXXxHVA=;
  b=Q1AneJlQd5O8DddwmSOupjHnne3hHFGpvuP7y7H5vv4ODAE9yOpZQIAy
   hNJbz+d3hpYiIOfFNn7IG9sZWGdKcMaCKxD/0N8OnAl8ykqYTHZnCoUKe
   jZfFpEV/fjpJMbR3TA9gNzf/GQuLW2hA7B4Lis34u20te4F7oJ3AtfG+d
   FqRn1QW07DbYRv05HwGJrPaTPq3wDD0I+Tk1+MO+1VnfF4caaCcda6/Pr
   dSwLHTC/ePjDmDvJcbpuQNH44yW+3jc5DDafrMtmqNHM9TcxBtA4YT0YI
   Ok8rRwKett6T5FdNYL0Ny4qcZxGd9qwtU8ykmw7YVztQltIL/5AQUSPPr
   Q==;
X-CSE-ConnectionGUID: IINKom8/SCGcTDlOMEdp9A==
X-CSE-MsgGUID: fstfrcUiQ7KNB8p3Ery4wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3826076"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3826076"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:06:19 -0800
X-CSE-ConnectionGUID: Fr0udkNRTviMirHAkAE65g==
X-CSE-MsgGUID: QVNqTqZiT3upXR7zcLkoaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10576888"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 08:06:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTiAq-00000001Dlp-14mG;
	Wed, 18 Nov 2026 16:06:16 +0000
Date: Thu, 19 Nov 2026 00:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: {standard input}:191: Error: Insn b has an instruction mpyuw
 with limm in its delay slot.
Message-ID: <202611182309.z6dHQb1a-lkp@intel.com>
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
TO: Lachlan Hodges <lachlan.hodges@morsemicro.com>
CC: Andrew Pope <andrew.pope@morsemicro.com>
CC: Arien Judge <arien.judge@morsemicro.com>
CC: Ayman Grais <ayman.grais@morsemicro.com>
CC: Bassem Dawood <bassem@morsemicro.com>
CC: Chetan Mistry <chetan.mistry@morsemicro.com>
CC: Dan Callaghan <dan.callaghan@morsemicro.com>
CC: James Herbert <james.herbert@morsemicro.com>
CC: Sahand Maleki <sahand.maleki@morsemicro.com>
CC: Simon Wadsworth <simon@morsemicro.com>

Hi Lachlan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63fdb511c27afcebce797e3db580b3534ddfa639
commit: b1906cea00b021acea22460225401d5b27bc7c36 wifi: mm81x: add mm81x Wi-Fi HaLow driver
date:   4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20261118/202611182309.z6dHQb1a-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/202611182309.z6dHQb1a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611182309.z6dHQb1a-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:191: Error: Insn b has an instruction mpyuw with limm in its delay slot.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
