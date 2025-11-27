Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A5B287507
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764264889; cv=none; b=Hp0S1gz+zC6mbwVpNuAKzBoeXDr8doQJCbfAEJ3/ofwsK56exDLRu2HDWcZDL03qE6C2KkCg7PoklP4p6e3O/2YHNvmS/UZeTW4+NP1ClkpT9el5DZy+MOIt8j4UxPIrw7U+ITy51zvKrhU/YX0XIdbjmuOoo7NPAuS9UySWUYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764264889; c=relaxed/simple;
	bh=ofsr523apXjUMp3yJDu88/c8rywgKBhAY8bgp+jrGNc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLSVRshpBmEqkiSxWMvDGAJxXlfXNOE6oSF/w8BPNKI6XvpF0EC2v6SHCUK3tkIWhq2m974vQ5u6ib45pllRC3scC/AUDQ1av2+3T8qW6DE2LbnlvflzCisMmSLqz8P/6LQ4a0hDJKNLLO50G9aAhjfW6Rf2KIZ15+qxEwOE7GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2sbcpdJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2sbcpdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764264884; x=1795800884;
  h=date:from:to:subject:message-id:mime-version;
  bh=ofsr523apXjUMp3yJDu88/c8rywgKBhAY8bgp+jrGNc=;
  b=j2sbcpdJetTWDSPgFQe2CYIboTsbMhL7qz3D8PBCC9XlLg9oJ0S4DxDU
   mM9bSzehqf4tzfSlim68w0FP13X3HcnRZUqSFScUdwIMYPgEXjWAD9Gd5
   gvM1OBw91fynLD5zCJEp4NWBfXyUqcV18mLDQl9U2M1SWkySjsbIKUlzX
   Wo25T019L70V9h/CwkvV3Ai1Qn3vMsritAoNJvi0wd+iPTlTdr9rEM+Ni
   dnb+lNUjxFYEtrRiGvElwT0jimVxJq3oWS2uZSq61aPLc1l2Ce7NjJE4r
   UGmHzpMVJG6GAvjGUOhnE9jKWEru4C/TkMp8rof4meAIKRsT0V6y60LFl
   w==;
X-CSE-ConnectionGUID: ChoeN7XoQjKBwAMQqRkoRA==
X-CSE-MsgGUID: 1Ya8ipWwSqa4fh0rFLX48A==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70173796"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="70173796"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 09:34:44 -0800
X-CSE-ConnectionGUID: zMjzh33hRUKpjE4ulLQ2tQ==
X-CSE-MsgGUID: mROxnc7LTWmcB/Yh1MV0BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="224235775"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2025 09:34:43 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOftB-000000001o9-1xUO
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 17:34:41 +0000
Date: Thu, 27 Nov 2025 18:34:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Michael-S-Tsirkin/virtio-clean-up-features-qword-dword-terms/20251127-144346
 1/3] checkpatch: WARNING:MINMAX: min() should probably be min_t(u64, count,
 VIRTIO_FEATURES_U64S)
Message-ID: <202511271850.SQoDBU4c-lkp@intel.com>
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
TO: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Michael-S-Tsirkin/virtio-clean-up-features-qword-dword-terms/20251127-144346
head:   b51401de9c5e2e002340a71d92064258b0ba092e
commit: 462ddc66d8b0f9a5ca1dd45b2c8cf67592e3f524 [1/3] virtio: clean up features qword/dword terms
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511271850.SQoDBU4c-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(u64, count, VIRTIO_FEATURES_U64S)
#54: FILE: drivers/vhost/net.c:1755:
+		copied = min(count, (u64)VIRTIO_FEATURES_U64S);

WARNING:MINMAX: min() should probably be min_t(u64, count, VIRTIO_FEATURES_U64S)
#63: FILE: drivers/vhost/net.c:1770:
+		copied = min(count, (u64)VIRTIO_FEATURES_U64S);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
