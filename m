Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAE26CE0A
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571585; cv=none; b=KPw/rVK6C5z9VydTD7jZzxLB2VHFbJ0yZdV3r++rBFif6QyJ3JLNnO0bQTBc26d0Z/fwZ0HuawKVvzd/skei2tmcfnqK9eLZrlC8sPrcsKAZLkxWrBKfuldnOfkbI8+cxW/ERVcEOI/slY9uOkfK5R+UdT+/jrpCX2borjkbp3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571585; c=relaxed/simple;
	bh=YsL5/tLEwDnms0yg0Af1K+rqFldPxs2KvtwR25i5VSQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y0W+hhNAYqocFd8t17v08ePFJmjbXJvCV6ognZL5JNSEy+YBMj8fQDXPZUqub+S3Llv7bT3fx1fc9KNHPYPwRZC9XNMQgLavgy0QY6fUqmcCE9/F0FzsQ5RRAibbG1cT3fqeeHf9Ovn2kiliwa2aZ7/77wQ9tup7w/q00R/VoKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGapj2qj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGapj2qj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768571583; x=1800107583;
  h=date:from:to:cc:subject:message-id;
  bh=YsL5/tLEwDnms0yg0Af1K+rqFldPxs2KvtwR25i5VSQ=;
  b=AGapj2qj+leZl7ye3RRCo6zq6Sj8UQOsZ+dP4E6z+8UbS7VlDRn7kncL
   w3rW6M+0icE6P7E/ZuNEBk5lbyB3JzmEgeBCdWdfLQ+yz9Q7oZddKetbG
   xagG1M/ZnvzHqNX7fwoiXsIC3K1NUoOE3/ahR5+NFE+sfbnGgINPWdbEg
   qsEApnHVYKn4KM+7VXd3m6BzdTrGfVf3zLO7WSH2ujU4ueqhsp6I3fned
   ZhUi/c9+ThkZFPAkkEbppfCio67vXUfyXHJC7JQQCcp0jY47Gr5m/y5EL
   q6pvitZgwDVxzakogeOch28QPMLjbZjW45TJrlilzbBwiPOWCOAjuvGrw
   g==;
X-CSE-ConnectionGUID: fvZLGoo4QWqI8S40qxhcag==
X-CSE-MsgGUID: ZhNlVhFOTdm0jBLcgNDK0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69616579"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69616579"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 05:53:03 -0800
X-CSE-ConnectionGUID: Zusvo6llQUqx5GAiwsVdGg==
X-CSE-MsgGUID: 5ZZVHLszSraN1C4QfBQlhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205298346"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jan 2026 05:53:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgkG3-00000000Ktu-0myJ;
	Fri, 16 Jan 2026 13:52:59 +0000
Date: Fri, 16 Jan 2026 21:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dhowells-fs:keys-pqc 1/10] crypto/mldsa.c:197:1: sparse:
 sparse: bad integer constant expression
Message-ID: <202601162155.HdtMhTVy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/mldsa.c:197:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   573904dcb8c349de6c983c50f450c478decd9996
commit: f749807f8054e61092311d31693bd23a099f2821 [1/10] crypto: Add ML-DSA crypto_sig support
:::::: branch date: 16 hours ago
:::::: commit date: 20 hours ago
config: csky-randconfig-r131-20260116 (https://download.01.org/0day-ci/archive/20260116/202601162155.HdtMhTVy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162155.HdtMhTVy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601162155.HdtMhTVy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/mldsa.c:197:1: sparse: sparse: bad integer constant expression
   crypto/mldsa.c:197:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> crypto/mldsa.c:197:1: sparse: sparse: bad integer constant expression
   crypto/mldsa.c:197:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   crypto/mldsa.c:198:1: sparse: sparse: bad integer constant expression
   crypto/mldsa.c:198:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   crypto/mldsa.c:199:1: sparse: sparse: bad integer constant expression
   crypto/mldsa.c:199:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   crypto/mldsa.c:199:1: sparse: sparse: bad integer constant expression
   crypto/mldsa.c:199:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   crypto/mldsa.c:200:1: sparse: sparse: bad integer constant expression
   crypto/mldsa.c:200:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   crypto/mldsa.c:200:1: sparse: sparse: bad integer constant expression
   crypto/mldsa.c:200:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   crypto/mldsa.c:201:1: sparse: sparse: bad integer constant expression
   crypto/mldsa.c:201:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   crypto/mldsa.c:201:1: sparse: sparse: bad integer constant expression
   crypto/mldsa.c:201:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"

vim +197 crypto/mldsa.c

f749807f8054e6 David Howells 2025-11-20  196  
f749807f8054e6 David Howells 2025-11-20 @197  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
