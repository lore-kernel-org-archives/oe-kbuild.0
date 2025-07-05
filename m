Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4522E3707
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Jul 2025 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751724965; cv=none; b=ABKwWuxK2GpVGvRlm/cao9L73X86MOaktRoj2X9+g/LN8UrSBD8VT8PhAfsUhNn1pdp6LaM7p8KlF3jSv+uQ2oNsYPSueC99o6maoRdGSYS6ejrSMh3/MWGuPxwOoHgYPyOYWiedIFBLhxb4uwJAbFmvrfgZZ036g3OIfvGu13w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751724965; c=relaxed/simple;
	bh=j8nhuA++e8+au6M9h6PwT1OIX2ttMRwa7YtGY1kg024=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=agFF/7GLx/VenrG5vpYLg2/Tnw41j94pay3ikCzQWBG5IDNVOxJKyZ0AdufNyw6EtFpBVgO2nPcw/j1PGCDxM+YNRusUnFXKZxvXAUA5OjIWRUmSVIGXwYog7W3tHTaB5icmXxsbhpsPXcZLk/arUOjEqcFO/etcpRTrib4glgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6YYn1Z6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6YYn1Z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751724963; x=1783260963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j8nhuA++e8+au6M9h6PwT1OIX2ttMRwa7YtGY1kg024=;
  b=I6YYn1Z6uxhmea31bndmOqYMc8+rPalheo4Yz2TQMco+xeOjqjaItuKf
   oAQpiei9ft8+u+DOpfotGdo6nTgxnRTRoTENQfrbfiejEzjVGLp5UyOVh
   gR+25r6Z9fZcVfAlCRFo5Dm479Wgl+svrjr240NTDL/1JAa8VmfO3aS1v
   AS2CP12W7QWEAExi0ZATa9NumFDDR0+Wrs+zxyDCTPzlD/IJTS3jFIuR+
   fTLUPe3K0NuDxZPV47Y9YJFWWyqlzYUMoDQv+gxVtmURaErEE/yWDm1rv
   NGo9AGCVsk9wFwOk/nNIzLQJplKCrmjlGzdvXR5Y2biW76X9nulVX5uoH
   A==;
X-CSE-ConnectionGUID: UzbvrdIkTcqrg++vQGysCg==
X-CSE-MsgGUID: tknPcD/VThOnHoOYeksAlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53891980"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="53891980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 07:16:02 -0700
X-CSE-ConnectionGUID: bat9p3lhTBCGNRQTa8uttg==
X-CSE-MsgGUID: r5xKtv5sTDi9/6ZYb7Oaqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="155309794"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jul 2025 07:16:02 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY3gN-0004XO-0t;
	Sat, 05 Jul 2025 14:15:59 +0000
Date: Sat, 5 Jul 2025 22:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/dmabuf_iter.c:109:7-15: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202507052244.abG9LXBW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "T.J. Mercier" <tjmercier@google.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a79a588fc1761dc12a3064fc2f648ae66cea3c5a
commit: 6eab7ac7c5eea7628b92cd5f9427bbd963a954ec bpf: Add open coded dmabuf iterator
date:   6 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 weeks ago
config: powerpc-randconfig-r051-20250705 (https://download.01.org/0day-ci/archive/20250705/202507052244.abG9LXBW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507052244.abG9LXBW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/dmabuf_iter.c:109:7-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +109 kernel/bpf/dmabuf_iter.c

6eab7ac7c5eea7 T.J. Mercier 2025-05-22  103  
6eab7ac7c5eea7 T.J. Mercier 2025-05-22  104  struct bpf_iter_dmabuf {
6eab7ac7c5eea7 T.J. Mercier 2025-05-22  105  	/*
6eab7ac7c5eea7 T.J. Mercier 2025-05-22  106  	 * opaque iterator state; having __u64 here allows to preserve correct
6eab7ac7c5eea7 T.J. Mercier 2025-05-22  107  	 * alignment requirements in vmlinux.h, generated from BTF
6eab7ac7c5eea7 T.J. Mercier 2025-05-22  108  	 */
6eab7ac7c5eea7 T.J. Mercier 2025-05-22 @109  	__u64 __opaque[1];
6eab7ac7c5eea7 T.J. Mercier 2025-05-22  110  } __aligned(8);
6eab7ac7c5eea7 T.J. Mercier 2025-05-22  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
