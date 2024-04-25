Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3A1E492
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Apr 2024 06:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714027309; cv=none; b=Y9WWfV+4DcvpQX42geGm4GbhaBH/x6bvKstYw8/Nm7Oh8SV78v/Z+2wK9/dhqbcNXhIo0zFMmolK0PHq8kWmegdnXvE/OQQMsZHR7ignX5vG7sEpOmxCFyPyTKqQjgImP+BkoSSpsuuF1exhw1mqgMF0IWrzTEWkOPfeX0zzqYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714027309; c=relaxed/simple;
	bh=F94I3s4TblIxOAMtOgm5QgzCQghJGzCpaX0Sr/y/uaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=We7hjfk7+3la3i5XTts3V5oRhPyfkI6G9FjhR0HBn0638sQuGAccOBK201McMcFMP97QgUFR21M8CxILG8r92AZ+lWwkPlGgmOHzgyk+zF9x8WwJG9ci78MFSwEahybb2E6u9I2yXP/ZyBWvaMWsgZFHssPmI5Wvo/tEslpN9N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cp1mzv9Z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cp1mzv9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714027308; x=1745563308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F94I3s4TblIxOAMtOgm5QgzCQghJGzCpaX0Sr/y/uaw=;
  b=Cp1mzv9Z0XwrmlpMjQLIo/XKXyDSs37ReR66xWt+gazPjuYtXehcN9Rx
   VgrzVded8kkvxODeuQBlLcVgxX3ATOKcOQG2P5PDKA0ppkDHyeysug047
   xGitdF1xSgZz2gz4FptnZ4t6yeRFhvl6G0Sknm/MLoaNLDeMuZ9FfqKqC
   C0Dn0uWPIUr53OoOZ0q0ZXADUl5+Bo0xzRSKvTlOfrZg4MxDmzpUbOXw1
   bAAPY0ji0GcO2r/T3ILfxOo3bqptB4GmEzw87K8BJWpYI39K7oXMsF8Vz
   qdU5U7/YJpQJ7e2UJ2Iz/y2B3XqhdR+COIXX5w+Ig76ASr9750bsHdjDz
   Q==;
X-CSE-ConnectionGUID: LNlFIusWTUKyU5kJThgcPg==
X-CSE-MsgGUID: nUHdHhgGRL2PBjZfAAvfMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21103351"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="21103351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 23:41:47 -0700
X-CSE-ConnectionGUID: bAA4icI/S8S69QNOzr0fRg==
X-CSE-MsgGUID: cJmhAPpLTQWiYZbSZUsxmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25033808"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Apr 2024 23:41:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzsng-00025U-0v;
	Thu, 25 Apr 2024 06:41:44 +0000
Date: Thu, 25 Apr 2024 14:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [konis-nilfs2:for-akpm 4/4] fs/nilfs2/super.c: linux/fs_context.h is
 included more than once.
Message-ID: <202404251450.rttcxC1o-lkp@intel.com>
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
CC: linux-nilfs@vger.kernel.org
TO: Eric Sandeen <sandeen@redhat.com>
CC: Ryusuke Konishi <konishi.ryusuke@gmail.com>

tree:   https://github.com/konis/nilfs2 for-akpm
head:   69812977939c7895ede256e122284c19d4d83aef
commit: 69812977939c7895ede256e122284c19d4d83aef [4/4] nilfs2: convert to use the new mount API
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404251450.rttcxC1o-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/nilfs2/super.c: linux/fs_context.h is included more than once.

vim +32 fs/nilfs2/super.c

  > 32	#include <linux/fs_context.h>
    33	#include <linux/fs_parser.h>
    34	#include <linux/crc32.h>
    35	#include <linux/vfs.h>
    36	#include <linux/writeback.h>
    37	#include <linux/seq_file.h>
    38	#include <linux/mount.h>
  > 39	#include <linux/fs_context.h>
    40	#include "nilfs.h"
    41	#include "export.h"
    42	#include "mdt.h"
    43	#include "alloc.h"
    44	#include "btree.h"
    45	#include "btnode.h"
    46	#include "page.h"
    47	#include "cpfile.h"
    48	#include "sufile.h" /* nilfs_sufile_resize(), nilfs_sufile_set_alloc_range() */
    49	#include "ifile.h"
    50	#include "dat.h"
    51	#include "segment.h"
    52	#include "segbuf.h"
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
