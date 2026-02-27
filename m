Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABC3349B00
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 04:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772166034; cv=none; b=F4KqkQw9dOMIEQf22/Knqm3ZsROR1VOMwlorl9pq+xhVgoeiRqMQeeBQDYcUE3QaWXYG1Ka66u9w1pfKxJ8ltt51ksghN3Ylr0WLNzyH/lGvkT/obu71mUmvaeEbfsmQm3NHdyI5aBIcHqybKSsrxCnoSjPrVs+D+CX4I3CIg+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772166034; c=relaxed/simple;
	bh=zTIkOVceCkJW2gRj8xhLSyX110niuvHz+gi4USRrkrE=;
	h=Date:From:To:Subject:Message-ID; b=SYWbeZxLPC/8rY7ivjccF/gU8yVVucH+S02pW4G89ABH058hwHN5nBxZQpdiyn1Ftch5D7nmHVTZO8J4JmziXw9kGkLdJ+6jXbyQAHYhA3oXQSsx5dIT5nAVkrFfwYYviDt+s4E1WjQVgxrKYWR5IgCRtEMOd34lKR5gKAfSiYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TR6EEWhK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TR6EEWhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772166032; x=1803702032;
  h=date:from:to:subject:message-id;
  bh=zTIkOVceCkJW2gRj8xhLSyX110niuvHz+gi4USRrkrE=;
  b=TR6EEWhKKU3KzGcK0S6gbGI03mh5YtR5OFGavODncO5OHCFI0WLubklH
   6hoKRd0Oh4g6gzSZ0EgtsJincreFMqJPmv5vxWSi6Y8D00jv/TfeG/3nX
   8agGQNsXx9cJr3U2KTMieXPMNvfnsqsgsFs3QkWKXJJP92M+RgDupAP6C
   CRhRqi/FK3SPPqNZ61JX/lLJm4nOJ2THZD7d1+7Fs8z6RACITbhw80H8Y
   fZgVwUjLJ4CxsOA7bgctDGceMS6kunBm29CwlcNCy1CZcpyQgXjOKlc26
   23XIb2i1h4EG8G+jY8gFhBz3u23Im6ex+ZdUn/uIFLBA+fYhxp0rnNGJ2
   A==;
X-CSE-ConnectionGUID: GeoLlOjfSFOCPiyvqXtiwQ==
X-CSE-MsgGUID: wf846zb0TjCVOQXSY7YKhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73428632"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73428632"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 20:20:26 -0800
X-CSE-ConnectionGUID: n7Hev8/CSaW6v1iwBxihdA==
X-CSE-MsgGUID: dWAnvaewQkOz1DClfv2+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214980455"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 20:20:25 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvpKx-000000000Sn-2Q1Y
	for oe-kbuild@lists.linux.dev;
	Fri, 27 Feb 2026 04:20:23 +0000
Date: Fri, 27 Feb 2026 05:19:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [acrn:6.17/linux 4/8] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202602270517.6O7Ql9pl-lkp@intel.com>
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
TO: Conghui <conghui.chen@intel.com>

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
commit: 293fd159f5b3709147ae3ef5a79d4994c19bae53 [4/8] virt: acrn: Introduce acrntrace
:::::: branch date: 54 minutes ago
:::::: commit date: 54 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602270517.6O7Ql9pl-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#75: FILE: drivers/virt/acrn/hvtrace.c:2:
+/*
+*

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#261: FILE: drivers/virt/acrn/hvtrace.c:188:
+	pcpu_num = total_cpus;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
