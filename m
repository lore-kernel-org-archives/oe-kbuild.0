Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362216;
	b=SDnLPxJBWF/YM6KskV8kAAjNfTzaDPHsdQNMwKH0cyFIcG8o80ywUfa8Bokt9cSoYneP
	 oxji6w1QztS4Bv7mSioIPuN1qQpMXPgwWfU36kzGBJLxi3M2VSsIPMQqomDG5N08PYfob
	 1ZTIkh3RezG4ev0auYsp4QMRK5A9f4xToY1yF5jmCfTfAZ+UxchSSLNxI4YItrxtuM0tC
	 xvqlAFsDWZHO9e//kjZFWHb52qawP/QVzyownfrk7APXSpF9etsG/CRDt/BcMpInyRYF1
	 Hb3bruDUE30NpwIg+JuzxAz4B+YNNqrgL6vkeDblfnjYwQgu+I3RUMwd9u4zMisEGhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362216;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=O4DXBULDbqA+u+vNP/Xvu/J7UQ7hdz+ZM+QtsckcCrE=;
	b=zxVqinri/4NM6Hcmcxmp8uvdHGobdgCNm5YhWcSQK84gWbU46xbK9GuFk3xkr5r4N4lE
	 SS4CATurD1WeYmkFxohahh3vz9+cTN6VeeJ89M7t1dZsuchfacJ88FpE3L/JJAGumDJHh
	 DFtKJm6wlj34w7BDsdjThKDtWOn2i5obYm+gaQJ9NMGe0sVuRXHLB0wsmGYEsa0WOiZkn
	 r+6c+ijW43tvHpLmkgltdUmUfXmjwRkBVJnp2FSAfSIx4AwE2/gq2uUrD6uEZv31iz/tw
	 YgykwgKwCtAd5KQnhs3DwZ4/tZzRxB67noAKp/IJYqt8oTZaFRt3sVyEno0z2d2N7aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="bY/3Cmog";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61D4606A321
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 01:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61D4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bY/3Cmog
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794362215; x=1825898215;
  h=date:from:to:cc:subject:message-id;
  bh=XJP1bht7xCv/KC30Xyh+Ry1VpSobNPPfAZbJ7iOxiyg=;
  b=bY/3CmogJTROLFkArxkBdM0s04Y5CXC7BkzNBVYvur1ENBsGj9uHidUr
   LgUWe3h804vMQQ9K6PfbmhDIvqaJ2EB53ERs8qYjgA7UOnqq4QJXFYqv0
   lCzD/lcDYByOjAbjg0FS48UwcfibU7thQMQTYFSIj00EqWz3M6SMRcdyO
   GQqB4kRVRQ7STAuCa+xLdlWzQ0hU1pPWrk1fa8xnYe5BKdBv3Fc+OsKiH
   ou+Kxa7WCMY9VpXFmZmN5masot4ILltD8+yft6YmGrhhML2l+4i+fGYal
   oI1mZzU+lYT6iqJdxbh2IF5hTzqlB1xvkb8dNl6HFZMBYS1tOaEkH1fGr
   g==;
X-CSE-ConnectionGUID: GQ3sQm2USJiQm+N8HdBe3g==
X-CSE-MsgGUID: Q/5mhvcHTrev9GKpElxUqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3016804"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3016804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 17:56:54 -0800
X-CSE-ConnectionGUID: YFsZ3jZKQtWjJhuFOm+avg==
X-CSE-MsgGUID: 0nZywJKmTfSqVF5g6eaglA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8460810"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2026 17:56:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQxZz-000000000UR-21zQ;
	Wed, 11 Nov 2026 01:56:51 +0000
Date: Wed, 11 Nov 2026 02:56:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:vfs.all 86/194] ../wrappers.h:116:56: error:
 'O_EXCL' undeclared
Message-ID: <202611110221.YzAZrCXO-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Jori Koolstra <jkoolstra@xs4all.nl>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git vfs.all
head:   13419eff849a88a276dec97fa62a532dc7fff400
commit: b536a4aa16eaeaf2e938899bbb45e42d6fe02a31 [86/194] selftest: add tests for open*(O_CREAT|O_DIRECTORY)
:::::: branch date: 2 hours ago
:::::: commit date: 5 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261111/202611110221.YzAZrCXO-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110221.YzAZrCXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611110221.YzAZrCXO-lkp@intel.com/

Note: the brauner-github/vfs.all HEAD 13419eff849a88a276dec97fa62a532dc7fff400 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from fscontext_ns_test.c:33:
   ../wrappers.h: In function 'openat_o_mkdir':
   ../wrappers.h:116:32: error: 'O_DIRECTORY' undeclared (first use in this function)
     116 |                        flags | O_DIRECTORY | O_CREAT | O_EXCL, mode);
         |                                ^~~~~~~~~~~
   ../wrappers.h:116:32: note: each undeclared identifier is reported only once for each function it appears in
   ../wrappers.h:116:46: error: 'O_CREAT' undeclared (first use in this function)
     116 |                        flags | O_DIRECTORY | O_CREAT | O_EXCL, mode);
         |                                              ^~~~~~~
>> ../wrappers.h:116:56: error: 'O_EXCL' undeclared (first use in this function)
     116 |                        flags | O_DIRECTORY | O_CREAT | O_EXCL, mode);
         |                                                        ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
