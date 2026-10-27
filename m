Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098146;
	b=ga7kJbAJtQfw1+HrEBa6jQgLY0bM4m7jkJ1QhyjHWAThyWN6NXx084IuzrQlyg3wSYsz
	 pSLoei24yh+kPO5Nqk8EBoFlDP4iwqllD4M6P7gyDLs0gZ7lHm0ZKB+P+cFLl1okra/U7
	 i/a2GcxLSVMUMYfwOOgvEGGq9GFZjn0XsAeXmB2DZ/vCaC7Wo0mG9XBNvdzMZb6hx4dIN
	 mt486u04Y6yzVtolzM676h9e4TIgIrgxK4BLZL/wlf7abjkk02ApC/KwSRTxvg7rmJ6tN
	 EXb6SyYtRRmF1iT46atWJG9qY1w5YbylRs5ux5kJX3eHDEWbiUY4H1dbtW6WGq7bOww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098146;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QOW1cMZMxV7DkzoyR6/qatKpgGwy7exPJprTX9cHDSw=;
	b=4FTWOoGF7iM6b6tgeA0rylS5ARZptA/8HuBlrE9GdIJeCUzMWH3oKH18s+zLhsmGt7Ey
	 bWADAs/2ojsPmfCSbcWCS8jHzZlXSi+ZTIgQqGQRD8qIN006OJQzxGLyYqujOT9tByxnF
	 I2tkABRtNasnpr1U3iUK1YtNwrv84JywdY/r/mFoEG1FGtMuKkbmLONQbaKLt2cARk/OK
	 D+kBve9xa8qbmeWQL/zXm7k7LWFAlVuZ/WwanA6hh3egzBsWP27PkZeaEzvAXrk30zS6+
	 kJAaIJG80h2gy66BzxtvJqfC1E+Yw55NtakzviIleO+r2JwX9TnJPYud9gjfoR37XEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eMwB5gTQ;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04CD606A33D
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Oct 2026 10:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04CD606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eMwB5gTQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793098145; x=1824634145;
  h=date:from:to:cc:subject:message-id;
  bh=68qhNNUH+CdiLadwpPhRLTp77QXOLPfwzXZCeSdM4fM=;
  b=eMwB5gTQG1psBZe1Fxij3Z8QS1+j55/Nm5Xn1ZGNKjB2y5P1LxI5d61y
   i/FqieoK+fJ4Gak8YC+wYON9Ygm2ercuw+5QdSEcwwrCCpVrSTgJ32NQP
   8kHIJmbT4RrFFykiGL/wOHBCgpxnqaNl37oQ9zAu4IW6gOH5VNnHv50pc
   20gpYkOYHLTOHxRkph4Nu7ejNftDadZ2byRBIPNwZb3zq6lCtrBWDVACT
   QSuWq50sA7SzjSs6BZB7maQx9OGutAIUF6FV6plrwS8HN09X1FxBbkB5L
   MFcuyRCmFveGZ0nbHZufx8Udd02n/rJRRwC8q4fWL+hcKbWdHdZb5IoT5
   w==;
X-CSE-ConnectionGUID: rV6H7IxYSCOQOP1bLuZEEQ==
X-CSE-MsgGUID: ToZh897FTEGow1Qpwqiigw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1697531"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1697531"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:49:05 -0700
X-CSE-ConnectionGUID: 2W7ICQHxR7GXx3Ez6IMTzA==
X-CSE-MsgGUID: LQvUjra9Swqfzq3nIexL6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6389255"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 27 Oct 2026 03:49:01 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLejh-000000004U3-2x64;
	Tue, 27 Oct 2026 10:48:57 +0000
Date: Tue, 27 Oct 2026 11:48:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lubaolu-intel-iommu:cr/iommu-liveupdate/phase1-v6 55/56]
 iommufd_utils.h:22:9: warning: "BITS_PER_LONG" redefined
Message-ID: <202610271144.nZEsjIDP-lkp@intel.com>
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
TO: Baolu Lu <baolu.lu@linux.intel.com>

tree:   https://github.com/LuBaolu/intel-iommu.git cr/iommu-liveupdate/phase1-v6
head:   0c951d2dd0e55d5d98c67799bc384ae8d335ef4e
commit: d61010509689cbc2bd39d9b8c6eec696668c0d8e [55/56] iommufd/selftest: Add test to verify iommufd preservation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610271144.nZEsjIDP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271144.nZEsjIDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610271144.nZEsjIDP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from iommufd.c:12:
>> iommufd_utils.h:22:9: warning: "BITS_PER_LONG" redefined
      22 | #define BITS_PER_LONG __BITS_PER_LONG
         |         ^~~~~~~~~~~~~
   In file included from usr/include/asm/bitsperlong.h:11,
                    from usr/include/asm-generic/int-ll64.h:12,
                    from usr/include/asm-generic/types.h:7,
                    from usr/include/asm/types.h:1,
                    from tools/testing/selftests/../../../tools/include/linux/types.h:13,
                    from usr/include/linux/capability.h:18,
                    from /usr/include/sys/capability.h:34,
                    from iommufd.c:5:
   tools/testing/selftests/../../../tools/include/asm-generic/bitsperlong.h:8:9: note: this is the location of the previous definition
       8 | #define BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
         |         ^~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
