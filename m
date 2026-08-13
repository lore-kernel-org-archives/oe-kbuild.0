Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316C63B3BF5
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 18:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786644532; cv=none; b=fvljRihVoQzDfrmf0ILxW703Ide0CmdisEhQzZXrCOG/hWh5+YBLYgbFRlg5r9iFewuAn8f+r1+M5o+Om6wAVxBhLvGtseyys3jUy1+p7zJ8/YHWF0tuTuZiopI08UhtArUlYb0+lwZ/wYJWZQfLp/AKfS4/r7Y3ibrAjK4XRa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786644532; c=relaxed/simple;
	bh=umTpxRFT289e3gnC8tYtjfSVNn+wsUcYng7Dd5YRbHA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kJ4E0S5fhIjcEEIjkJbhPaOirj2RlFooRRATqiZz2LPya75c4fPspvKggg/i2lDES3jWZbIf1BoGpxl9K7RdkHp9Lhs2LFhJt12Ho9RFNRAVbYCHI/PFZpgDaEaDlGKD9eSZqeVbW+zGtok9eVyzXuaQLkd3u7gzwLlOLfVwSWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ew0dndSE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ew0dndSE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786644530; x=1818180530;
  h=date:from:to:cc:subject:message-id;
  bh=umTpxRFT289e3gnC8tYtjfSVNn+wsUcYng7Dd5YRbHA=;
  b=ew0dndSE4bn8TlcSQ9gj6G94+Kcmx7CCIF/r5vhZ2BAtsU/OjarC7mDq
   rfjtXjCmMh0GG+/HIlu3pwzXZDHU1wYWVfFRZjObRNeBCNoY9i7i4bAJC
   Tl7ffITY+L0UqWTBkVtcxAEOQPgHYj6+eM+XxLH5SWK8sp8TKRjq5h11H
   3SAFBfWlnA1VLpAtx5V+bpi4EGekOzHeqC7y6r5ABmTXF3fLcogwkhRuX
   u1LczM5ObGUc2z5uZDmjX9GdemfMI06VMDECEy5eV+Xf8IjlxBzEv1SnP
   95uN6BweOxSoa2YsSgKB8HSP6zYtiv3HpNZWJny13ASB3vyaLm11HOsmg
   Q==;
X-CSE-ConnectionGUID: mfX3WCi4T/a4pznrKQH8Tw==
X-CSE-MsgGUID: 34G0gzsoTsu/Ru/TImhMCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87087469"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87087469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:08:46 -0700
X-CSE-ConnectionGUID: MjfnTQkCRPGIigdG/xaHFw==
X-CSE-MsgGUID: Fn9Dj7/wTrqTPu6CvDCLbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="302257083"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2026 11:08:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuZr9-00000000W8K-0lC4;
	Thu, 13 Aug 2026 18:08:43 +0000
Date: Fri, 14 Aug 2026 02:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/raid/xor/arm64/xor-eor3.c:19:9: sparse: sparse: Trying
 to use reserved word 'return' as identifier
Message-ID: <202608140110.h38XV0IH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/xor/arm64/xor-eor3.c:19:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: 4d3c5cbfe2b55c12ad1d866ddf0928d13d775816 xor/arm64: Use shared NEON intrinsics implementation from 32-bit ARM
date:   3 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r112-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140110.h38XV0IH-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea395e4fe4db26920d57779ddae98eac6ba945d)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140110.h38XV0IH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4d3c5cbfe2b5 ("xor/arm64: Use shared NEON intrinsics implementation from 32-bit ARM")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608140110.h38XV0IH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid/xor/arm64/xor-eor3.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   /opt/cross/clang-844a18e753/lib/clang/24/include/arm_neon.h:30:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid/xor/arm64/xor-eor3.c:12:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:12:26: sparse: sparse: got eor3
>> lib/raid/xor/arm64/xor-eor3.c:19:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/xor/arm64/xor-eor3.c:19:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:19:16: sparse: sparse: got res
   lib/raid/xor/arm64/xor-eor3.c:20:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-eor3.c:20:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-eor3.c:30:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:30:29: sparse: sparse: got v0
>> lib/raid/xor/arm64/xor-eor3.c:33:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-eor3.c:33:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:33:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-eor3.c:45:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:45:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:46:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:46:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:47:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:47:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:48:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:48:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:50:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:50:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:51:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:51:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:52:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:52:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:53:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-eor3.c:53:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-eor3.c:54:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-eor3.c:54:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-eor3.c:66:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:66:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-eor3.c:69:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-eor3.c:69:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:69:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-eor3.c:87:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:87:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:88:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:88:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:89:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:89:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:90:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:90:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:92:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:92:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:93:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:93:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:94:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:94:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:95:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:95:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:96:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-eor3.c:96:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-eor3.c:97:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-eor3.c:97:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-eor3.c:111:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:111:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-eor3.c:114:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-eor3.c:114:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:114:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-eor3.c:132:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:132:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:133:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:133:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:134:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:134:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:135:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:135:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-eor3.c:137:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:137:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:138:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:138:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:139:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:139:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:140:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:140:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:141:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:141:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:142:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-eor3.c:142:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-eor3.c:143:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-eor3.c:143:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got >
>> lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got {
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got !
>> lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ) in nested declarator
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got <
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got ==
>> lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Trying to use reserved word 'if' as identifier
>> lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got if
>> lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got if
>> lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got __xor_eor3_5
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got -=
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-eor3.c:145:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-eor3.c:27:37: sparse: sparse: undefined identifier 'p2'
   lib/raid/xor/arm64/xor-eor3.c:28:37: sparse: sparse: undefined identifier 'p3'
   lib/raid/xor/arm64/xor-eor3.c:31:22: sparse: sparse: undefined identifier 'bytes'
   lib/raid/xor/arm64/xor-eor3.c:37:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:39:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:41:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:51:17: sparse: sparse: symbol 'dp2' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:51:17: sparse:    int [addressable] [toplevel] dp2
   lib/raid/xor/arm64/xor-eor3.c:27:18: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:27:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp2
   lib/raid/xor/arm64/xor-eor3.c:52:17: sparse: sparse: symbol 'dp3' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:52:17: sparse:    int [addressable] [toplevel] dp3
   lib/raid/xor/arm64/xor-eor3.c:28:18: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:28:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp3
   lib/raid/xor/arm64/xor-eor3.c:62:37: sparse: sparse: undefined identifier 'p2'
   lib/raid/xor/arm64/xor-eor3.c:62:18: sparse: sparse: symbol 'dp2' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:62:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp2
   lib/raid/xor/arm64/xor-eor3.c:51:17: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:51:17: sparse:    int [addressable] [toplevel] dp2
   lib/raid/xor/arm64/xor-eor3.c:63:37: sparse: sparse: undefined identifier 'p3'
   lib/raid/xor/arm64/xor-eor3.c:63:18: sparse: sparse: symbol 'dp3' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:63:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp3
   lib/raid/xor/arm64/xor-eor3.c:52:17: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:52:17: sparse:    int [addressable] [toplevel] dp3
   lib/raid/xor/arm64/xor-eor3.c:64:37: sparse: sparse: undefined identifier 'p4'
   lib/raid/xor/arm64/xor-eor3.c:67:22: sparse: sparse: undefined identifier 'bytes'
   lib/raid/xor/arm64/xor-eor3.c:67:14: sparse: sparse: symbol 'lines' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:31)
   lib/raid/xor/arm64/xor-eor3.c:73:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:73:17: sparse: sparse: symbol 'v1' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:37)
   lib/raid/xor/arm64/xor-eor3.c:75:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:75:17: sparse: sparse: symbol 'v2' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:39)
   lib/raid/xor/arm64/xor-eor3.c:77:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:77:17: sparse: sparse: symbol 'v3' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:41)
   lib/raid/xor/arm64/xor-eor3.c:81:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/arm64/xor-eor3.c:82:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/arm64/xor-eor3.c:82:17: sparse: sparse: symbol 'v1' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:73)
   lib/raid/xor/arm64/xor-eor3.c:83:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/arm64/xor-eor3.c:83:17: sparse: sparse: symbol 'v2' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:75)
   lib/raid/xor/arm64/xor-eor3.c:84:22: sparse: sparse: undefined identifier 'veorq_u64'
   lib/raid/xor/arm64/xor-eor3.c:84:17: sparse: sparse: symbol 'v3' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:77)
   lib/raid/xor/arm64/xor-eor3.c:93:17: sparse: sparse: symbol 'dp2' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:93:17: sparse:    int [addressable] [toplevel] dp2
   lib/raid/xor/arm64/xor-eor3.c:62:18: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:62:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp2
   lib/raid/xor/arm64/xor-eor3.c:94:17: sparse: sparse: symbol 'dp3' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:94:17: sparse:    int [addressable] [toplevel] dp3
   lib/raid/xor/arm64/xor-eor3.c:63:18: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:63:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp3
   lib/raid/xor/arm64/xor-eor3.c:95:17: sparse: sparse: symbol 'dp4' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:95:17: sparse:    int [addressable] [toplevel] dp4
   lib/raid/xor/arm64/xor-eor3.c:64:18: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:64:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp4
   lib/raid/xor/arm64/xor-eor3.c:106:37: sparse: sparse: undefined identifier 'p2'
   lib/raid/xor/arm64/xor-eor3.c:106:18: sparse: sparse: symbol 'dp2' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:106:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp2
   lib/raid/xor/arm64/xor-eor3.c:93:17: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:93:17: sparse:    int [addressable] [toplevel] dp2
   lib/raid/xor/arm64/xor-eor3.c:107:37: sparse: sparse: undefined identifier 'p3'
   lib/raid/xor/arm64/xor-eor3.c:107:18: sparse: sparse: symbol 'dp3' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:107:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp3
   lib/raid/xor/arm64/xor-eor3.c:94:17: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:94:17: sparse:    int [addressable] [toplevel] dp3
   lib/raid/xor/arm64/xor-eor3.c:108:37: sparse: sparse: undefined identifier 'p4'
   lib/raid/xor/arm64/xor-eor3.c:108:18: sparse: sparse: symbol 'dp4' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:108:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp4
   lib/raid/xor/arm64/xor-eor3.c:95:17: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:95:17: sparse:    int [addressable] [toplevel] dp4
   lib/raid/xor/arm64/xor-eor3.c:109:37: sparse: sparse: undefined identifier 'p5'
   lib/raid/xor/arm64/xor-eor3.c:112:22: sparse: sparse: undefined identifier 'bytes'
   lib/raid/xor/arm64/xor-eor3.c:112:14: sparse: sparse: symbol 'lines' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:67)
   lib/raid/xor/arm64/xor-eor3.c:118:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:118:17: sparse: sparse: symbol 'v1' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:82)
   lib/raid/xor/arm64/xor-eor3.c:120:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:120:17: sparse: sparse: symbol 'v2' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:83)
   lib/raid/xor/arm64/xor-eor3.c:122:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:122:17: sparse: sparse: symbol 'v3' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:84)
   lib/raid/xor/arm64/xor-eor3.c:126:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:126:17: sparse: sparse: symbol 'v0' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:81)
   lib/raid/xor/arm64/xor-eor3.c:127:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:127:17: sparse: sparse: symbol 'v1' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:118)
   lib/raid/xor/arm64/xor-eor3.c:128:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:128:17: sparse: sparse: symbol 'v2' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:120)
   lib/raid/xor/arm64/xor-eor3.c:129:22: sparse: sparse: undefined identifier 'eor3'
   lib/raid/xor/arm64/xor-eor3.c:129:17: sparse: sparse: symbol 'v3' has multiple initializers (originally initialized at lib/raid/xor/arm64/xor-eor3.c:122)
   lib/raid/xor/arm64/xor-eor3.c:138:17: sparse: sparse: symbol 'dp2' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:138:17: sparse:    int [addressable] [toplevel] dp2
   lib/raid/xor/arm64/xor-eor3.c:106:18: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:106:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp2
   lib/raid/xor/arm64/xor-eor3.c:139:17: sparse: sparse: symbol 'dp3' redeclared with different type (different base types):
   lib/raid/xor/arm64/xor-eor3.c:139:17: sparse:    int [addressable] [toplevel] dp3
   lib/raid/xor/arm64/xor-eor3.c:107:18: sparse: note: previously declared as:
   lib/raid/xor/arm64/xor-eor3.c:107:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp3

vim +/return +19 lib/raid/xor/arm64/xor-eor3.c

4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22    8  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22    9  extern void __xor_eor3_2(unsigned long bytes, unsigned long * __restrict p1,
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   10  		const unsigned long * __restrict p2);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   11  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   12  static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   13  {
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   14  	uint64x2_t res;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   15  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   16  	asm(ARM64_ASM_PREAMBLE ".arch_extension sha3\n"
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   17  	    "eor3 %0.16b, %1.16b, %2.16b, %3.16b"
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   18  	    : "=w"(res) : "w"(p), "w"(q), "w"(r));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  @19  	return res;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   20  }
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   21  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   22  static void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   23  		const unsigned long * __restrict p2,
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   24  		const unsigned long * __restrict p3)
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   25  {
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   26  	uint64_t *dp1 = (uint64_t *)p1;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   27  	uint64_t *dp2 = (uint64_t *)p2;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   28  	uint64_t *dp3 = (uint64_t *)p3;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   29  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   30  	register uint64x2_t v0, v1, v2, v3;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   31  	long lines = bytes / (sizeof(uint64x2_t) * 4);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   32  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  @33  	do {
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   34  		/* p1 ^= p2 ^ p3 */
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   35  		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   36  			  vld1q_u64(dp3 + 0));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   37  		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   38  			  vld1q_u64(dp3 + 2));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   39  		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   40  			  vld1q_u64(dp3 + 4));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   41  		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   42  			  vld1q_u64(dp3 + 6));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   43  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   44  		/* store */
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   45  		vst1q_u64(dp1 + 0, v0);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   46  		vst1q_u64(dp1 + 2, v1);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   47  		vst1q_u64(dp1 + 4, v2);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   48  		vst1q_u64(dp1 + 6, v3);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   49  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   50  		dp1 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   51  		dp2 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   52  		dp3 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   53  	} while (--lines > 0);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   54  }
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   55  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   56  static void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   57  		const unsigned long * __restrict p2,
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   58  		const unsigned long * __restrict p3,
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   59  		const unsigned long * __restrict p4)
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   60  {
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   61  	uint64_t *dp1 = (uint64_t *)p1;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   62  	uint64_t *dp2 = (uint64_t *)p2;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   63  	uint64_t *dp3 = (uint64_t *)p3;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   64  	uint64_t *dp4 = (uint64_t *)p4;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   65  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   66  	register uint64x2_t v0, v1, v2, v3;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   67  	long lines = bytes / (sizeof(uint64x2_t) * 4);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   68  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   69  	do {
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   70  		/* p1 ^= p2 ^ p3 */
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   71  		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   72  			  vld1q_u64(dp3 + 0));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   73  		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   74  			  vld1q_u64(dp3 + 2));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   75  		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   76  			  vld1q_u64(dp3 + 4));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   77  		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   78  			  vld1q_u64(dp3 + 6));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   79  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   80  		/* p1 ^= p4 */
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   81  		v0 = veorq_u64(v0, vld1q_u64(dp4 + 0));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   82  		v1 = veorq_u64(v1, vld1q_u64(dp4 + 2));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   83  		v2 = veorq_u64(v2, vld1q_u64(dp4 + 4));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   84  		v3 = veorq_u64(v3, vld1q_u64(dp4 + 6));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   85  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   86  		/* store */
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   87  		vst1q_u64(dp1 + 0, v0);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   88  		vst1q_u64(dp1 + 2, v1);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   89  		vst1q_u64(dp1 + 4, v2);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   90  		vst1q_u64(dp1 + 6, v3);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   91  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   92  		dp1 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   93  		dp2 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   94  		dp3 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   95  		dp4 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   96  	} while (--lines > 0);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   97  }
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   98  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22   99  static void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  100  		const unsigned long * __restrict p2,
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  101  		const unsigned long * __restrict p3,
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  102  		const unsigned long * __restrict p4,
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  103  		const unsigned long * __restrict p5)
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  104  {
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  105  	uint64_t *dp1 = (uint64_t *)p1;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  106  	uint64_t *dp2 = (uint64_t *)p2;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  107  	uint64_t *dp3 = (uint64_t *)p3;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  108  	uint64_t *dp4 = (uint64_t *)p4;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  109  	uint64_t *dp5 = (uint64_t *)p5;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  110  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  111  	register uint64x2_t v0, v1, v2, v3;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  112  	long lines = bytes / (sizeof(uint64x2_t) * 4);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  113  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  114  	do {
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  115  		/* p1 ^= p2 ^ p3 */
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  116  		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  117  			  vld1q_u64(dp3 + 0));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  118  		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  119  			  vld1q_u64(dp3 + 2));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  120  		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  121  			  vld1q_u64(dp3 + 4));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  122  		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  123  			  vld1q_u64(dp3 + 6));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  124  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  125  		/* p1 ^= p4 ^ p5 */
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  126  		v0 = eor3(v0, vld1q_u64(dp4 + 0), vld1q_u64(dp5 + 0));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  127  		v1 = eor3(v1, vld1q_u64(dp4 + 2), vld1q_u64(dp5 + 2));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  128  		v2 = eor3(v2, vld1q_u64(dp4 + 4), vld1q_u64(dp5 + 4));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  129  		v3 = eor3(v3, vld1q_u64(dp4 + 6), vld1q_u64(dp5 + 6));
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  130  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  131  		/* store */
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  132  		vst1q_u64(dp1 + 0, v0);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  133  		vst1q_u64(dp1 + 2, v1);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  134  		vst1q_u64(dp1 + 4, v2);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  135  		vst1q_u64(dp1 + 6, v3);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  136  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  137  		dp1 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  138  		dp2 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  139  		dp3 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  140  		dp4 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  141  		dp5 += 8;
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  142  	} while (--lines > 0);
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  143  }
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22  144  
4d3c5cbfe2b55c1 Ard Biesheuvel 2026-04-22 @145  __DO_XOR_BLOCKS(eor3_inner, __xor_eor3_2, __xor_eor3_3, __xor_eor3_4,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
