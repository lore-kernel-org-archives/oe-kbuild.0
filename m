Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E665256C8B
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jul 2026 11:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497662; cv=none; b=shndq00iNYp4LWemFy/zkI0LkLap5GXP6X4kAgZhV8TCq96hrtbiXjzR/rLoAWOFFc2ZAav8EWhO7AlNMuYZZPujc5FUEHp0bImBHfY7ykLpqeZohutLMIXNgw2Vd04JL0Hx8oG0V8iSlGbPm7BP7/OeYsPEuMbb+bO4q+vzBJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497662; c=relaxed/simple;
	bh=rp5r9qHKRo2LjbQWKG1sOH4NMIlKLp+FOqtqAedptqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S5keurzNgBL0ssoTeg12TlziLZ9Oq3+XO598DznvsxZ/F7D/PRm8OT7FLKPYGovjld2/T8sjtKqTFE1drqB9n6ohF6fuA7zMZzmTJ1Y9C0Y1KZJOM2C/+V+yTB+zsglFGKByFhb6dkSQMtWWAgnQ6pPh0xNyqFJ7ZuOpMfvmv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBUQ+NGV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBUQ+NGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785497660; x=1817033660;
  h=date:from:to:cc:subject:message-id;
  bh=rp5r9qHKRo2LjbQWKG1sOH4NMIlKLp+FOqtqAedptqM=;
  b=YBUQ+NGVdLpnCELfo2zGQjOGfBrUxxZK+XCnpYsGy7vwOJtI/J+qeFrm
   Jcgl3HaoI278Tgwxk1343HtzbPF/B1YiDkqjBu8J0pTl6ARhDntJqWZ6E
   aT6XACdnjuydm7hjN1gHywaBUBbuynYShX+zmE1FZJky++p2MHWNkRLxA
   MVhvtZoz9MNOsnnoG/8U9JrD6Kf4dhXunxP9r2y6jIkP1+s0c3CK0W1T0
   oNjDZ7RrBp/1KIj1zQRm9Lg337FGRoE3skJCMro5siK5YUJSQFgkTl84L
   /gtfZ5/28OTsuivcHIXkUFE+2BJvORvoZU/ynDLObXI/hjYZqwffEvjZr
   A==;
X-CSE-ConnectionGUID: o98Ip6JnSfuN914jyLJHqQ==
X-CSE-MsgGUID: U/upFi3wTMGJg/+2UCzJTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85250119"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="85250119"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 04:34:19 -0700
X-CSE-ConnectionGUID: ZxawQ2mdQvSA5vLqKu8zSg==
X-CSE-MsgGUID: hPf+YLkwQ9iOSb2FlxC/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="298758622"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2026 04:34:19 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wplVI-000000002sw-2U9o;
	Fri, 31 Jul 2026 11:34:16 +0000
Date: Fri, 31 Jul 2026 13:33:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ./linux/scatterlist.h:185:34: error: invalid use of
 undefined type 'struct folio'
Message-ID: <202607311316.elGoAGfd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: Hans Verkuil <hverkuil@kernel.org>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
commit: 374e55cf087613663440719b08166b6686b36bcc media: i2c: gc2145: Use the v4l2 helper for obtaining the clock
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260731/202607311316.elGoAGfd-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311316.elGoAGfd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 374e55cf0876 ("media: i2c: gc2145: Use the v4l2 helper for obtaining the clock")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607311316.elGoAGfd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from main.c:4:
   ./linux/scatterlist.h:180:64: warning: 'struct folio' declared inside parameter list will not be visible outside of this definition or declaration
     180 | static inline void sg_set_folio(struct scatterlist *sg, struct folio *folio,
         |                                                                ^~~~~
   ./linux/scatterlist.h: In function 'sg_set_folio':
>> ./linux/scatterlist.h:185:34: error: invalid use of undefined type 'struct folio'
     185 |         sg_assign_page(sg, &folio->page);
         |                                  ^~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
