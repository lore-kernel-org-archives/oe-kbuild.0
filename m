Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A00837F8D3
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 06:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187083; cv=none; b=g6+H6lX2E9ZCsqEGDdtxB5b7zVNlbBplIQn3Zk8mvNrzzyjzQnyYXE7JTu5cUdT/ji6XNJBWZT5JErMkAJuaT1Ar81syb+QL0uUqO4M7oXXfzuQhBPO1UEbdf5X1dfCWAeNWyX18Br3yo5HXj4Ynr5bHy2Zqfbp2av9M0MLj5M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187083; c=relaxed/simple;
	bh=3qq7gNUI3seGz/vDifW8k9AnxVuB3DOhW5kOyEOomZE=;
	h=Date:From:To:Subject:Message-ID; b=S8UWE9IQXpnjHqe01i27oZw/o5TAj+l4QmmvH8OhAAcW04U3moe3kiOjAYRGxtAboCHd/BpSRKWnTujbsjnZkMRi0qBhxO8R/Lf2Emxgz1k78cVT+dxnA7PWZuByO4Ky8g9eG5EMP1Lv7mkdtbN63WLuo7PshC3pis2fr9N3YhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZKq3DNj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZKq3DNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770187083; x=1801723083;
  h=date:from:to:subject:message-id;
  bh=3qq7gNUI3seGz/vDifW8k9AnxVuB3DOhW5kOyEOomZE=;
  b=fZKq3DNjdX+rda/YwJuhwHDHmjTEaQZ2mYtMU9M3MDZlQEJKrzK23+ef
   wn0uxPlTw2GCKE3UgV/wGp5jYYx76A9KMJeUM2JJJVjZpR8TCiTHRJzAy
   6veXaTdWPrk5g5JGG//ns5kS8wh78jzaHCdiJ/qQ6K3oRoJO7ZkMop7t1
   /jaK+IwqjEj78omEsfaUAMoYOSmAz5sv5gRqWfnhw9I20ndvDgnOXIFxJ
   UsOplYgv4d0U5LLPrvmQDMux3lEbTH6XtsmYr1yvT9L/eEi4wGgSlvve8
   TGnBARKdexAaryA/QoEK70psYsTYnSpA6hazmwGAYjLnS+OhZwsmvw8gt
   w==;
X-CSE-ConnectionGUID: Jdx3RjzSQtOBf4pneF46Ew==
X-CSE-MsgGUID: 184Wp4OOTveIv9Ef/icCVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81999882"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="81999882"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 22:38:02 -0800
X-CSE-ConnectionGUID: qp99wHkMRvGKR6pkjO3hdw==
X-CSE-MsgGUID: ylJ56m6QSgS4BU+VBWoZ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="247672303"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2026 22:38:02 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnWWV-000000003eb-0uYx
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Feb 2026 06:37:59 +0000
Date: Wed, 04 Feb 2026 07:37:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [nvdimm:libnvdimm-for-next 1/2] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Dave Jiang
 <dave.jiang@intel.com>> ---', should be: 'Dave Jiang <dave.jiang@intel.com>
 (---)'
Message-ID: <202602040732.LWK13dvj-lkp@intel.com>
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
TO: Davidlohr Bueso <dave@stgolabs.net>

Hi Davidlohr,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git libnvdimm-for-next
head:   c4ae8ec088db09cac842c7766abbb02a01337371
commit: 9c0fc1d37f531fd33abc9b3a009b818ff1bddc22 [1/2] drivers/nvdimm: Use local kmaps
:::::: branch date: 10 hours ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260204/202602040732.LWK13dvj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Dave Jiang <dave.jiang@intel.com>> ---', should be: 'Dave Jiang <dave.jiang@intel.com> (---)'
#17: 
Reviewed-by: Dave Jiang <dave.jiang@intel.com>> ---

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
