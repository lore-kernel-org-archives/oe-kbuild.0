Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A822068F
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767595230; cv=none; b=aY1GHvozr93cYmQKHaXJEOytoONYz1O+2UeupWJfJxo1kr2oDmhAWp3/xBeBUkFJIOB57ZNOBc3ySmIZHqELd+fYno+wGuZtjwp/323D98Y1XuWV1sa8szAOoOerFHtJSY+iP4hTamJcSl3bxH+kA1FILQ/guzQ6HAwrlO3pVBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767595230; c=relaxed/simple;
	bh=+Ja7ThQuvJp09tCrTzOLly5DhZQSBs8OCDz9tmN6fPw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eN+lZQAEn+1ejpXnnBaiU1gH0E98xZ9JBp+3CE94Zf3b5uZifo/GMNAWHoa7z/M/Kv4XIOJUbxwQarGK/JyY7e8IGLtbv0jneOe/BNDcJ3K8nfJQWBxaonCtGKTa3P6S7t6paKDg6R0nRK99N1d5Y3lb1+BaLBvbYTYRpCQi8CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7NF97i5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7NF97i5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767595228; x=1799131228;
  h=date:from:to:cc:subject:message-id;
  bh=+Ja7ThQuvJp09tCrTzOLly5DhZQSBs8OCDz9tmN6fPw=;
  b=W7NF97i5FLn77CCsQaBomtnqw3fZ+po4FqvDN4k6h71qW8UoNpEqLU/T
   SWgk23b6hsgMNGAfMzgfAMLYw9ViEBt6viB4a9yHy2FMdiIN0nq6fDkmi
   plO11YHNR9/LxfpyQmYqB5dMI+FSowxFVIl2ACMQxfHJYx5lTtcNWNidG
   lFgfRy+WbIRGoPLD2UUP3RJqqbLWN0DGtAO5qK/q42Mp8saecSZfFwKvL
   y/10hL2rYLzZxvP1N7Urr4y38+JsrCnkk86fFb5O/WJZkjY/ObR82xdOZ
   qN1u9vUaiKsmBNYh1p9qZ1eEtp2uA3nqq/Z0X5LH8fy89Y9lGvxQXYoNg
   A==;
X-CSE-ConnectionGUID: qgeWrfYaQPaEIBd6Z2qKvw==
X-CSE-MsgGUID: 5lIFp4uSTeKh39RPqwu9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72817890"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="72817890"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 22:40:27 -0800
X-CSE-ConnectionGUID: QWryfrwsRk+LgN5zgKC0VA==
X-CSE-MsgGUID: ZoeP6IRiTOGbXV0oqN62WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="201953173"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jan 2026 22:40:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vceGO-000000000yL-11dR;
	Mon, 05 Jan 2026 06:40:24 +0000
Date: Mon, 05 Jan 2026 14:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ebiggers:wip-aes 23/50] crypto/aes.c:61:1: sparse: sparse:
 bad integer constant expression
Message-ID: <202601051412.nVH5hIhJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/aes.c:61:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   d267b9a1525bb945f8936382fd66bd3dc810616d
commit: 6aba2c451c91c2165856c31a61d582a1eabbc41e [23/50] crypto: aes - Replace aes-generic with wrapper around lib
:::::: branch date: 26 hours ago
:::::: commit date: 28 hours ago
config: csky-randconfig-r131-20260105 (https://download.01.org/0day-ci/archive/20260105/202601051412.nVH5hIhJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601051412.nVH5hIhJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601051412.nVH5hIhJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/aes.c:61:1: sparse: sparse: bad integer constant expression
   crypto/aes.c:61:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   crypto/aes.c:62:1: sparse: sparse: bad integer constant expression
   crypto/aes.c:62:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   crypto/aes.c:62:1: sparse: sparse: bad integer constant expression
   crypto/aes.c:62:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   crypto/aes.c:63:1: sparse: sparse: bad integer constant expression
   crypto/aes.c:63:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   crypto/aes.c:63:1: sparse: sparse: bad integer constant expression
   crypto/aes.c:63:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   crypto/aes.c:64:1: sparse: sparse: bad integer constant expression
   crypto/aes.c:64:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   crypto/aes.c:64:1: sparse: sparse: bad integer constant expression
   crypto/aes.c:64:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"

vim +61 crypto/aes.c

6aba2c451c91c2 Eric Biggers 2026-01-03  60  
6aba2c451c91c2 Eric Biggers 2026-01-03 @61  MODULE_DESCRIPTION("Crypto API support for AES block cipher");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
