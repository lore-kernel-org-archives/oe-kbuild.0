Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E2C2C859
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721371691; cv=none; b=OsN7J+dw1ZTheUBvU0AIXtYpDyPG8I01pvf3AZvE2yDMSn6AyNzLddfUCqtvj8qrF64EjSzenjW+o2xEiQtgn4BKlaK7MgikxuYgVXv/JuHawTXhEVQYjum2we063it/Ut4CfBFQiXvjC3KpYb7NIuj4RQgJ4l5q+//55k6MEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721371691; c=relaxed/simple;
	bh=YJZ/ZGveBe7YWsUz3VwVYUPjf+K6WSdzABrltPZrF0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DwQ9N940Jc/CNm4Mll2SNydOXyK/dPCTQZPE1TwB0HZgvgztEAXE9rlzGZzKnQ5VKxRzz/7eRDyf2MbDuLqu2jvckbCxKUYf6AIaUbj/zljjwTV3u8frEVXyNrEtHStzr73GPRvIUD8QEGDu9uiNKBC3c7a5m1TSgpMBTTcgp+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDL4JXST; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDL4JXST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721371690; x=1752907690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YJZ/ZGveBe7YWsUz3VwVYUPjf+K6WSdzABrltPZrF0A=;
  b=EDL4JXST4ghKP0f6IuStMLHvigirBwFbSOqdu5UgtviE/FaLT7yfUsKx
   /tv9WVVtcagBvp2FdxSUs8r5pKrqPTv0c5mYketOAZfA7j898en8mVZla
   nVa1TKLRp3aP8Sh8nfqcS3tRxNBM4Kvs+/a57l/1N2+XTYQNUs9fUxY/Q
   dunB9tLb2GF0ghrXq+DkHWktFL0Go+zfmiD54mF2oWIIk8H9oNKYMqJtC
   Ovv/dxBMpqEQfiiq6cWD1CU5qn5gu38gEIfN4VKd6TBam47P2+NufltgW
   J4mft0UPDJTHOnUqRtoOZLjPT2lrlOm+bGyT8BavN4uNqkR0xMAZuzfrt
   A==;
X-CSE-ConnectionGUID: jjnwJAF0Qpi8Qv+0u/Xs7Q==
X-CSE-MsgGUID: ms3OcbaDQomKJ7VBeovwQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18843580"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="18843580"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 23:48:09 -0700
X-CSE-ConnectionGUID: NTohKGtfRVG2Jo9AUULlmw==
X-CSE-MsgGUID: 69OmVVpzStW0j35MNVyh2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="50888004"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jul 2024 23:48:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUhPS-000hwK-0H;
	Fri, 19 Jul 2024 06:48:06 +0000
Date: Fri, 19 Jul 2024 14:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-tdx:tdx_kvm_dev-2024-07-18 89/153] arch/x86/kvm/vmx/tdx.c:
 common.h is included more than once.
Message-ID: <202407191429.EmGN1zNP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Isaku Yamahata <isaku.yamahata@intel.com>
CC: Rick Edgecombe <rick.p.edgecombe@intel.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2024-07-18
head:   ac699aa6b621cfba1f4132b87ad6fdbbc95d034e
commit: b9df6cd5f394b439f83b2237bed0e37c1e67a257 [89/153] KVM: TDX: Implement non-NMI interrupt injection
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407191429.EmGN1zNP-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/tdx.c: common.h is included more than once.

vim +10 arch/x86/kvm/vmx/tdx.c

     7	
     8	#include "capabilities.h"
     9	#include "x86_ops.h"
  > 10	#include "common.h"
    11	#include "mmu.h"
    12	#include "tdx.h"
    13	#include "vmx.h"
    14	#include "x86.h"
    15	#include "mmu/spte.h"
  > 16	#include "common.h"
    17	#include "posted_intr.h"
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
