Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272223;
	b=IzWEfz+UC78bhOu3MnpbE9fTOcv7zZFw+3KX3eI6eFbrcZWVRd6vPacZLF4L/dBZKpCm
	 6RNjpqdqbJX5bXjjizI1GQcTV5MN5vdPqK+9VeInJYBHnKkbKV9SALRaaIx3j4P8pccpf
	 cyO2OzKMIjTAJpBMaz1J1Xu08ATBaaMezjepeUpYHOqGxOFQKK/3qzbsFK+NVzqnd5U3y
	 oW4fFCYrbWbajiNJ7JOCzZBz3mhyZJLC5BUqEDzOKsStrQAvUtYW0A0BkHTqIMtzQ9iwI
	 OwsGfw11Cq4v+my6r4MIxMKRPRoDKTdttPI2ghRO7G8KSQt91xeBpB5vss0O+e0N7AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272223;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=d+UO98CS6aHWukfgAgJBl+tplL3iSkcMvMDHetqaG2U=;
	b=jy64+dr50KzoDCDwWPqcpxENi0rHQF6QERuWdS4chgr/Q+uZvtCLK3cvw6b/zw7EWd0m
	 O89SEPkbLX/05uNJmMTqaImbd3n66Vv/lEzyJkknxhXgP256yeRnSqtSyDy+p5HilFA1h
	 y8rAtMA1YIDrVFZPbq1rxcZ8h6og6uqo3kva6jzEktG87mTKjgSkMmASvYzVbi4ZQ9XxQ
	 EEMjj6rmc8HmigGnVEtRInbtWNSJpJsz8FpKH8uTcXlcvr9CcdIY9yUWfQNtemBGwPVj3
	 uuE/+7or2pDczd5NTrOB4lgMRV5VyNoOjCGCHf3/83q7ly8TagtyvMYsJ/JHFusBvDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tyyjy5iP;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AAC606A31D
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Oct 2026 11:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AAC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tyyjy5iP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793272220; x=1824808220;
  h=date:from:to:cc:subject:message-id;
  bh=Ti+TcqFBIswGyT8nD303CuBo0uMhf5t98PeNAJqEtMw=;
  b=Tyyjy5iPnwbKaWrJPLE6ndlcvkbktRFCOCX37oyg1gNu/Y2I/tABgimK
   leEkZgvH2hAfd9jN9inxk+q/1rWYMi5YCH9F0TmuoDv1+rVtIMF0wDGar
   ISecu/hQHx9l3JT05XF5hc/n9xkJLuyZ6CDTZJPGsij2AYVgNT89bM9ai
   WI+rUBvV4J12QMq/FBIAjeneMSAjzq3uEK2bIYOJs3s2ZlwxjFEaWmQSm
   xUtqbJZqbJZrmPVxMjWEZm3Vu+v2qBKS0NrT5kHqgPpLWc9PFm1l040PD
   hl55VzTlbHIURA5e/NlhmEhOunKM2IcBsIweVWn1dCJEQXB0s2AGJVksb
   A==;
X-CSE-ConnectionGUID: 8JC0uvsLQuOM9f1ur68BFw==
X-CSE-MsgGUID: OSx9VeyES4yp1WrdhQN27A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1923781"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1923781"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 04:10:20 -0700
X-CSE-ConnectionGUID: 5TmFZlnIRjKz4n824VIkVQ==
X-CSE-MsgGUID: Bft2f3M8SOeXvFa5Wb6PcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5124426"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 29 Oct 2026 04:10:20 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMO1R-000000005EF-1nz9;
	Thu, 29 Oct 2026 11:10:17 +0000
Date: Thu, 29 Oct 2026 12:09:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [liam:dense_ulong 2/80]
 ../shared/linux/../../../../include/linux/maple_tree.h:346:1: error: static
 assertion failed
Message-ID: <202610291258.hR9ndwFc-lkp@intel.com>
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
TO: "Liam R. Howlett (Google)" <liam@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git dense_ulong
head:   05d6e5c4cab7c4912959bf9ea5f797e6bc55eca5
commit: 02b16ccaeab9ace765973a2fb9f473e84982b58b [2/80] maple_tree: assert the node size
:::::: branch date: 9 hours ago
:::::: commit date: 10 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261029/202610291258.hR9ndwFc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291258.hR9ndwFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610291258.hR9ndwFc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from /usr/include/x86_64-linux-gnu/urcu/assert.h:26,
                    from /usr/include/x86_64-linux-gnu/urcu/debug.h:12,
                    from /usr/include/x86_64-linux-gnu/urcu/static/urcu-memb.h:24,
                    from /usr/include/x86_64-linux-gnu/urcu/urcu-memb.h:47,
                    from /usr/include/x86_64-linux-gnu/urcu/urcu.h:25,
                    from /usr/include/x86_64-linux-gnu/urcu.h:6,
                    from ../shared/linux/rcupdate.h:5,
                    from ../shared/shared.h:11,
                    from ../shared/maple-shared.h:8,
                    from ../shared/maple-shim.c:5:
>> ../shared/linux/../../../../include/linux/maple_tree.h:346:1: error: static assertion failed
     346 | static_assert(sizeof(struct maple_node) == 256);
         | ^~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
