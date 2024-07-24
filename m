Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03DC77F15
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jul 2024 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721851540; cv=none; b=t2AOs+fSjrVoiMjD3ncROLoLkq3KnoV8i/WIWsOI3+QzEJeKnn9uW3FRK26QBOnOFlCwddWApt3R5tO90/B5jSNduPQubVw21OdFYnaWjJAq0XNhIqLMaJEl9P+m2Fs3vqtzTxxGe/RIRUWGBAWKS3HbWqtQ3NuO+xYsJR3NxiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721851540; c=relaxed/simple;
	bh=P9KzCGHxMc47gG5iKqwf5XxGCDCjHOwoTI6hT55e6A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JrfWeUj/zD6d/fNJcZlPqZ4j+NgMdzBzlnJRO4YenFVqLVAHCK4ZXvhYVl17HhWjVxfrjxqYIF4OryuidsSxvBkHOpaCgn8PdOetQF/PC72kqcBwrLaSgjpF4O36J/OdUYjBlBBhBzPoLgiNJuGgNHHrQC7960GeRP6Lj5kPhrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXd3mGef; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXd3mGef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721851537; x=1753387537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9KzCGHxMc47gG5iKqwf5XxGCDCjHOwoTI6hT55e6A0=;
  b=hXd3mGefVCclZJfXhNYszVfNSoc6fcD8IhzkUhM+RkNvhJWEMvO2+aHh
   7bdAXlU/ju9jU4anxjgXKjdNTVDXUASTOArj6//CbNZQHEamEEr4nvcCZ
   HsDvEIuRiaHkZ+A9eWo6OvOqkm9B5k0bN0mPHdPmaxRj0jF8r8R3t4mFP
   giPTxWKPyk9UArSoYfds9tE9lnmg5C1H4ZGsasZMYWRaPfQ0mmn4tkEo1
   JERoT8eG94r6k/eF6owZpRlLWFpJi1cbHvLgUsFWzOA6EpqLODmZg1W15
   ViXspHdfZvhNdJKbNJuM8xsF/1CZW5HguoHAFJGV9OEB6E5PAFGBSHwHo
   A==;
X-CSE-ConnectionGUID: gIjYQPRVTqOJCgSSm727RA==
X-CSE-MsgGUID: PaqFducKRA+qE6Qma1dxiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30222498"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="30222498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 13:05:36 -0700
X-CSE-ConnectionGUID: yxyNjJGcRd2AWo4YDKMsrg==
X-CSE-MsgGUID: 0pXAdIbvRMOQpMPEg8UdRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="57498625"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jul 2024 13:05:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWiEv-000nOS-21;
	Wed, 24 Jul 2024 20:05:33 +0000
Date: Thu, 25 Jul 2024 04:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 19/30] tools/testing/shared/shared.h:
 linux/types.h is included more than once.
Message-ID: <202407250430.jTMy1BCJ-lkp@intel.com>
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
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   d8492982371a2b1c9354de924b82c7b4f24210d6
commit: 04645ade70e31fd918bfe616e391ee74c325cbf9 [19/30] tools: separate out shared radix-tree components
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407250430.jTMy1BCJ-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/shared/shared.h: linux/types.h is included more than once.

vim +3 tools/testing/shared/shared.h

     2	
   > 3	#include <linux/types.h>
     4	#include <linux/bug.h>
     5	#include <linux/kernel.h>
     6	#include <linux/bitops.h>
     7	
     8	#include <linux/gfp.h>
   > 9	#include <linux/types.h>
    10	#include <linux/rcupdate.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
