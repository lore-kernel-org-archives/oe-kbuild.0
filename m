Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F51322C70
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069124; cv=none; b=HB5QpflF7Tmcr9iOzb9B3h8IQVDsfKS7SlJQwu5OYZL/l91SDiC61bdw3kuW1MPwZ063HVUJ9ePa6cXPNmbdtC+arA1Nm7uzEpdl0YFx6Z5jrMxC57LWctvsbdWeozsMA9aYeWT9u1Y6+vJYXm06i0Cigh63RSBlsKiw1sTFsEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069124; c=relaxed/simple;
	bh=36oP5GH8NpDBw6WRfy6vy0F41JoWPDGbsp6XWnO80AM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nKjrPTdq3Xi7dO/T1hcb65WRreRAgoASLe8bWLuN1hlNsQz9479JdzRjGGQSeMQBOAmZD9tsSpEyv7d2epAxuKtZTnCqmJTd2ML/qzyypE6BWYCzMxustfA4A2fVytEEmblh5b/s49PA9yS85uTHn3SKKhzOjzt4fqkVgouE+zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0CJPQ8U; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0CJPQ8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069122; x=1794605122;
  h=date:from:to:subject:message-id:mime-version;
  bh=36oP5GH8NpDBw6WRfy6vy0F41JoWPDGbsp6XWnO80AM=;
  b=e0CJPQ8UMV1ftFDNs0ow/6dEstKj/8cSOJ+wpegtlG+JIsUDrv70T0+g
   3l6C3rV8SlSq7AiAD8gU51yC9yjCr11KWDbUs3PqXMHQDqkLTtmoyqKQn
   wP3sYftkUvQvxQ9/OH312wHJzDZn4y4LOON8S5V7n4fTSvypwNYtuqX6+
   XVnUL854Lj+1unh0JO9aQjo6/aqgk4mK05B2tao4a0oRgBhWFTLoaWU0p
   PZZnqn8lR/cykvXVfx2jMSCjpQWanKPoZjHaBng2EttB4A/pisGuLq/f4
   3W2pDs4X3gwyC141pgYgBRiyHrkmyYv45qtRgvsljGumatkGqRXYJjV6X
   g==;
X-CSE-ConnectionGUID: 6raoRT3QTBCfd8kIHAKgHg==
X-CSE-MsgGUID: AqmSyPCoRLWKe5pB9iw4uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75842409"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="75842409"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:25:17 -0800
X-CSE-ConnectionGUID: odQiymaWS7e2H9ISEroZUA==
X-CSE-MsgGUID: gSu67WFJQIubnnloJpRAUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="213008642"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 13:25:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeob-0000000018L-27yV
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:25:13 +0000
Date: Thu, 13 Nov 2025 22:25:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 200/867] checkpatch: ERROR:SPACING:
 spaces required around that '?:' (ctx:VxW)
Message-ID: <202511131843.c8APRYw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 9479568b781dc93f367dc7b5c996f6cfdc3e3bcc [200/867] bcachefs: Hook up progress indicators for most recovery passes
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131843.c8APRYw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131843.c8APRYw5-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: spaces required around that '?:' (ctx:VxW)
#67: FILE: fs/bcachefs/alloc_background.c:1754:
+	}))?: bch2_check_stripe_to_lru_refs(trans);
 	   ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
