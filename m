Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B20125A0
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 01:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764638151; cv=none; b=QcxOCTiTvuKewe1LprDNySWMb+4wpH0FzRpxwxz5KZ0eUGv7MiMnsD8qj1kyVihrDg5vpAxkZ6V4dW0vGsr89ffHBNO+G7GImmpLN2B6RC2EnSMd5wFrYcaADiMp7G6gClkFYu2X+Soe7OmcmuCE/7aVymaOshXWxj9irqXdAkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764638151; c=relaxed/simple;
	bh=YQaw8265EiTJyPbFXdhiQGJvf57LL2YEez5n8OF2xMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/TnyJGnrDI4klS1BxcfKUXoMYuk4mHsQdUU8rwEbb48yraqNIJfCe8cIe0mbEvQPDbCPCKXDKEh0VoMAdY2elAqtuqhnAnOK1PrGTlp6f7GlXhFbHH9g5wRhZXp8C/iBoOg/God/iq1WstAlWyvM7R3Ft/9TSi5R5QbEyTQNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baE+gnBW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baE+gnBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764638148; x=1796174148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YQaw8265EiTJyPbFXdhiQGJvf57LL2YEez5n8OF2xMQ=;
  b=baE+gnBW4YSk5Qs3k+22a8/DPmVI/u57P5zHvrTwpecgRW24S1Lta03B
   NV/Ta8pjl0hc9X/jCz8ja3X7aRQB2K4sLgtuV/W4SAa1jGqucQ4HVMWDb
   P08QvpejyQXfGWwMtRewWugqEMOyQGXvzptOO96qjSpfnTCNfR1F+Sn76
   7gESo1noeQhQfJtNOXhnIiyAyMz7RN/LvjBiVK3iESLWNUT5is46jX/yO
   J3ctkbQqpTVVre559pglTp9okauwInrRv1wzCSa9fCLn7pUjfT3gdlj0+
   AMLd7qZUcAcDOrAfNQ0EXA3qfUQnq8kvN/bHP0eTlSi7Q8wfr02gsRkvo
   g==;
X-CSE-ConnectionGUID: 5tPRnxS4RsyT5pOP42QmdA==
X-CSE-MsgGUID: gGeouoz3R/+pOHnqmlIfHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77942016"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="77942016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:15:48 -0800
X-CSE-ConnectionGUID: SlJ7ijF8R+W1j4fpTzn/jg==
X-CSE-MsgGUID: 1bbTmlVaSCqWRVxPQhmA/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194062831"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 17:15:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQEzZ-000000009Hd-0C6C;
	Tue, 02 Dec 2025 01:15:45 +0000
Date: Tue, 2 Dec 2025 09:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12308/13171] unix_connreset.c:17:10: fatal error:
 string.h: No such file or directory
Message-ID: <202512020931.Av3Qxemh-lkp@intel.com>
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
TO: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 5c9c1e78de1e41b5321583139851797580c077c3 [12308/13171] selftests: af_unix: remove unused stdlib.h include
:::::: branch date: 22 hours ago
:::::: commit date: 5 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020931.Av3Qxemh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020931.Av3Qxemh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020931.Av3Qxemh-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> unix_connreset.c:17:10: fatal error: string.h: No such file or directory
      17 | #include <string.h>
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
