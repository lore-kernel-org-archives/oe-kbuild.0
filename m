Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ADC4086A
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Apr 2026 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775473704; cv=none; b=Wvlq992GOF2JAzX2D2wf5Khg2TTwxoyt1+wdLkZbLSuE0RyXd7BwkpQRSwzARmzb8PLrCFmJzDopyyUdUrvxpKMxgoLxTeGehxnbQ4yWLRbzCuNRM6f72IRz+Ia5fZaENBJv9nKKVyZ8XRIhN3/6s+yvoaA0mlCDSjkXkr9fqj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775473704; c=relaxed/simple;
	bh=a0HU8hInQxyfDGJz4tVzLvVOuq4VUJrDl9LnTc839vI=;
	h=Date:From:To:Subject:Message-ID; b=RPclIDHfdwRyzCARIG4WmhknGCCtMKTM251Wg66L5Hwe43LJ9pQcSpqvKMEmpLxTrCLDrShjJus/tnYkB4bXp3Q8M37DvTal8fsB5fsC5Fhk4j6yRYaAH+prn4hdk/1QpxE0TiCHr8zpUfxnxtoLpQFAj8ThWMtRxKmLuLr8b7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F47nPcg9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F47nPcg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775473702; x=1807009702;
  h=date:from:to:subject:message-id;
  bh=a0HU8hInQxyfDGJz4tVzLvVOuq4VUJrDl9LnTc839vI=;
  b=F47nPcg9RVJ4apj5e26dy427jRQcLsp6NtHF+q7Od0vlFfydSzjWfcI2
   koE4yVAQWYriyfGLElJ2I28GtlYinvRMT+E2/9bPyDi4iG4ZAcH/VUr8S
   hUTfoIkqj4F6d5GpFA2y6emnqiQcB6YgC3V89lYmKFojSWletX6C4dmlX
   OK2rMdQ+/gcKwWvjpctY02SOhTPBGyWS8VxboO0LFRO9GfgoyDtQCZ0zh
   Yq0f3SN09cxUWB2xS6KFv8f+X7WvEbF/ITEWg41TZXGnrCYE31XTQ5oeq
   c3cMX1XTy8mpLL3nu1rRfrw5QMC0gvlqBYbRXuAM96bNJpF3OXCa5nhx5
   Q==;
X-CSE-ConnectionGUID: sZWY1tEMQC6a8GjHgMxszQ==
X-CSE-MsgGUID: iBdTnl7nT7GhsJhpKHWmdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="94004230"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="94004230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 04:08:22 -0700
X-CSE-ConnectionGUID: 6yEO+rmlRe6wRVACHwtfhw==
X-CSE-MsgGUID: NM8f84YURkK1woW2FAALww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="227024087"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 06 Apr 2026 04:08:21 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9hoY-00000000A1d-3cCa
	for oe-kbuild@lists.linux.dev;
	Mon, 06 Apr 2026 11:08:18 +0000
Date: Mon, 06 Apr 2026 13:07:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [vireshk:virtio/msg-amp 18/22] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202604061314.788KiglQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-amp
head:   41094c3bbcadee8fc24bfca2aad83a02755c5daa
commit: 8ea534e99e119f40ccad56160e9e6d338c79b6f6 [18/22] virtio: msg: Add AMP transport over shared memory
:::::: branch date: 15 minutes ago
:::::: commit date: 39 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260406/202604061314.788KiglQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SIZEOF_PARENTHESIS: sizeof *q should be sizeof(*q)
#199: FILE: drivers/virtio/spsc_queue.h:125:
+    memset(q, 0, sizeof *q);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#201: FILE: drivers/virtio/spsc_queue.h:127:
+    q->shm = (spsc_queue_shared*) mem;

WARNING:SIZEOF_PARENTHESIS: sizeof q->shm->packets[0] should be sizeof(q->shm->packets[0])
#236: FILE: drivers/virtio/spsc_queue.h:162:
+    assert(size <= sizeof q->shm->packets[0]);

WARNING:SIZEOF_PARENTHESIS: sizeof q->shm->packets[0] should be sizeof(q->shm->packets[0])
#264: FILE: drivers/virtio/spsc_queue.h:190:
+    assert(size <= sizeof q->shm->packets[0]);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
