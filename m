Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482772DF151
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 20:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754520; cv=none; b=XDF63fOr5ait7/syc0CFwUqAMS1DHYNjWJmss0ANAywOxayaYHgXANhFlbbxewBoZl4DxNMb+uNJNleFEDKahx71Nig/bwLKMk9BmorQJC4yHsiQvl12mPu/UJlHBkXBSjFf8uNNt3Q3rXRsHFk5oFzV2YhFLtDAS4VeKX+E+DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754520; c=relaxed/simple;
	bh=1f5jAWS5hO3ukbCfnaq+q+Ptr7q0oAge8nAhrR94iDM=;
	h=Date:From:To:Subject:Message-ID; b=Y+lOBoB4zITIOtdPrLwUolDaf14ltwulDrx7jJvyb5x3/NicJDStyf65aFe0Z/C+Ylwo2it8F+aOICbgIPiDq40aIGa2dWUGs55ay41TQXBXjFFYhItwFKrGXEnP7uTKhANmbH86kYwp4xORineJYC/bl3hq5LR0t3XaoNYTHmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/YYk8it; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/YYk8it"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770754519; x=1802290519;
  h=date:from:to:subject:message-id;
  bh=1f5jAWS5hO3ukbCfnaq+q+Ptr7q0oAge8nAhrR94iDM=;
  b=R/YYk8itUow/LzcotxmXYSNMa6zKDCXrgOb5CnrxwFeyifLPzUajTGDY
   1dU9UaFpiK0tMnP4vr00lZfwhhTXOFWUhpCd3JfFf8dP7UIjUUDxTJLAC
   aciMITRsl8Gv77Qp6J73vH9cj9nHHQO2yanROI4wV4tVIvcnrq3CrROzg
   ch5/vUdKxCgPWhYIIwcZ19oOtlBUfxyxkdMtNA79IvWtfTB2vIuKsDTr0
   ZL+UvRn7nIAtVZVOae/x1tWf6vBIfSsevmPLMsA/u3saA4gJFUpN+ucRI
   dKBwAzq0Cc2cv8J0wr1HZfsizVbH6vPsqNZakg6AexbqLznVAnlXvism8
   g==;
X-CSE-ConnectionGUID: Ugz/2vsORqeYGyzZ0rJFKQ==
X-CSE-MsgGUID: 2ek9Nyc7QZ2hpokC3aAEIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89307972"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89307972"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 12:15:19 -0800
X-CSE-ConnectionGUID: V+tnQ02YTguq4EqLBHH7cQ==
X-CSE-MsgGUID: sbN8KpTDSYWKlaV9qvk5sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212057423"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 12:15:19 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpu8i-000000000u9-0C69
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 20:15:16 +0000
Date: Tue, 10 Feb 2026 21:14:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 15/23] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602102131.C0C1bbkY-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   4977e2e73efc645e38259d70c86d3b8e80dd3ea5
commit: ea37034e6d4e4b729d26830e9995913847a933f0 [15/23] hrtimer: Optimize for local timers
:::::: branch date: 26 minutes ago
:::::: commit date: 26 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602102131.C0C1bbkY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#24: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
