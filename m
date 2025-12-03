Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75C3126BF1
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 12:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764766115; cv=none; b=r8QdAYC7zT+0BB6Ez4dGvHhuUhCq2Uaq1XnCTg45B4cv5Y/Yd5DRXl+na7DNRky5Dg/3PI+ntoDqxnQxAD6itmfRWuBAivaZ4L6JoGrr2MY739Hc1LP5mo16J+IXCvuQwhnSsEo4BkFDyYq2sxHqUUve+67SmC+JdQSHt/1bwg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764766115; c=relaxed/simple;
	bh=hYpNfTscIxzymwujMi6Qgs1g6zlWpvu7Cldohawvors=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PSvkMA1Oy3aOsz85uK2fqiyfIsI0QhhetI3U/il3nVSZMKn2cdp3y/+k3KBmZh9VXwcGzktaZWOIeMf0iaBTJcavd5YpL6YMirwn7i5RIIKy+N7eJOdn9+inh/swVCESCj3iH14B3VMDy1qfb+pwc+h8b2Xe1weuex13EgwVVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3GZ+p2n; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3GZ+p2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764766113; x=1796302113;
  h=date:from:to:subject:message-id:mime-version;
  bh=hYpNfTscIxzymwujMi6Qgs1g6zlWpvu7Cldohawvors=;
  b=a3GZ+p2ngbk26uOShXapbxEQkoIqk6MiHQNCRtdH5cAQ/yXk7Lkx4oOu
   NQybB9yJuOTQZnximEw6z4cjq1zzpOzNXtKzvuTRUE1IphGIaux0CKEtH
   LRsC846+wgqBoUohcUf8DMXKa1IZhTkH4Bng2vHmst8JPvn6thDTr8jwD
   rwajjrRQZGJ1UaeC9M1Yq/Yu2PJVorlE4r+mVIXtRsG4fAyehJoOf/DAF
   NyeXghDgAmwU1yPFZk66mrqSynGA+FYP1ZApeeBAb8tdcl0vsGDmMh2YN
   Vk+24QHfcf2B9LG8Dr/9DUeU6ww31/gLBdgazz+jil1upcmyERMP+DV+o
   w==;
X-CSE-ConnectionGUID: 8pP+agohQzSwnhoB4TRWTw==
X-CSE-MsgGUID: acI1+LnZSpai9XdVp0g0gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54305707"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="54305707"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 04:48:31 -0800
X-CSE-ConnectionGUID: /V6R8+QaQ8+DB8Pqd4zYCg==
X-CSE-MsgGUID: g2mmjnyMTqCTEfuUKwC/UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194764184"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Dec 2025 04:48:31 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQmHU-000000000RR-07Mq
	for oe-kbuild@lists.linux.dev;
	Wed, 03 Dec 2025 12:48:28 +0000
Date: Wed, 3 Dec 2025 13:47:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [device-mapper-dm:for-next 16/23] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'could'
Message-ID: <202512031136.8h34YbUC-lkp@intel.com>
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
TO: Mikulas Patocka <mpatocka@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
head:   8f591d86bc0f12857ed390fce8f16a7133471fed
commit: 7f75a7c9213aa5233310b20b8a5b3fd590c4948a [16/23] dm: test for REQ_ATOMIC in dm_accept_partial_bio()
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251203/202512031136.8h34YbUC-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'could'
#11: 
otherwise this BUG could could be triggered by stray bios that have the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
