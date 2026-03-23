Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC33C6A4A
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 17:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286482; cv=none; b=tbwd9ttqPPLGJlXaXapGyOm5LZKIHygpWCnLKDHjsrhPjvxKtoAHhkri3OxmxC5RBbwGW8mOXZvb8CVoT2qvaxYvfV1bsYn3KpSCWUUqOsBiqvtLqIs+XNGTfRBmDdHjAz2HmNoMASocHhkB2k80Ati2FpbPg9CnCNwZ671595I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286482; c=relaxed/simple;
	bh=K77Vy5etto5mkiKyvqaS89t42LNWqu3f9JJ0x79CGtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TnNYZ0REJnfJ37TrBBdllIrDMbwhqJzps8ioa6dNTYlvSbbsqhyRT3f6W3LfXHesJlwijL9fpCn3N2i6OykLZYkLxEzgjiTx9k95aNpYzG1RWsjU0agj5llkffipGukUc7IjP2D3XIrcuXN2398BH2p99EdRUWXNC+LpOIiBnUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYweT19w; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYweT19w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774286482; x=1805822482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K77Vy5etto5mkiKyvqaS89t42LNWqu3f9JJ0x79CGtI=;
  b=FYweT19wV89g+cN/61T/XuWe5X6uHMwzhWnZZgyo0p7l2UVlE5beisF/
   PLtx4b0udENzReZbmoAU/M7X67lIDXspr/Q0msye934Ldm1K4EBlx3ZzP
   vPy6CfB98JSMBW0OPd1R5BZOB3DR+f+a6LyzdiburTuEVLbBpltaKwSjq
   3pI5uO0Gw13xC+vJNt6hzR5ATGMwIaFhOi4Rojbhko9JyKCk3xpnVfgFk
   gD+x3G0bkh1KoeXiC2ls16UR2TiIiDUp7YLuXlMWI5r3WMP3ea06GHOXf
   CsHImTCU28PTRFKiH7nLf1Cvet2QdmA91ERH6NATLBc6Kgs60FxQPZ3id
   A==;
X-CSE-ConnectionGUID: qh0GrpAqR32axCZ5Hymq+Q==
X-CSE-MsgGUID: ctVjGiSXQcyvw8GSKW8cFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75262695"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75262695"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 10:21:21 -0700
X-CSE-ConnectionGUID: 7hoWZgJ/RLmVLpjqdsOhJQ==
X-CSE-MsgGUID: Xw/B1UsfS4O6QRPWyWWaGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223155337"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Mar 2026 10:21:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4ixp-000000002pr-0M0X;
	Mon, 23 Mar 2026 17:21:17 +0000
Date: Tue, 24 Mar 2026 01:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/dmabuf_iter.c:109:7-15: WARNING use
 flexible-array member instead
 =?us-ascii?Q?(https://www.kernel.org/doc/html/latest/process/deprecated.?=
 =?us-ascii?Q?html#zero-length-and-one-element-arrays)?=
Message-ID: <202603240106.OB40altv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "T.J. Mercier" <tjmercier@google.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 6eab7ac7c5eea7628b92cd5f9427bbd963a954ec bpf: Add open coded dmabuf iterator
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: s390-randconfig-r051-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240106.OB40altv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603240106.OB40altv-lkp@intel.com/

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
