Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5011C524C
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 05:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722317966; cv=none; b=LskJV2v6dl5Is05NTj15BjhpLofMnMxNE17tEnKYt1QbpsajPvTeZsD7lgXQp4akle26+u/sh0q5UPX9WJXzZ4HKGu1oph8/yLLNJw7muAlWF8SOWgmLWdM3VHfIpAz9m4cvtE6VXyjzKasPSWU4xWoiYMlxksPAIsxjOPmzxcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722317966; c=relaxed/simple;
	bh=P6wTFK8q+hxtK26BR5UQQpF93B54lQ3T8IvgD6cK5zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmZW+SNOiY38JcQHqn81q9HjA7VKewmDrWfoC47pQGVtv0jep5m2pWUfw1rnQNs22t6Ub7olA8QqYK0lEAv6KCLcgauLwrwbGvFISPYaofEMhZrLuaofCVCqdG8x2F8Yb0yHjkn6g3hdlvH/IETXeCxpcZV89efft2JBP7qs57k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRWHAeAT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRWHAeAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722317964; x=1753853964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6wTFK8q+hxtK26BR5UQQpF93B54lQ3T8IvgD6cK5zg=;
  b=dRWHAeATmZmeBFbc3AIbZkhYjFhGzRgq6WRmES/1jzuuUu1LJbH9XiTp
   YE8aDSrlkLnud001uplIfdLP5TA7s3/EEeO8bi+X75Mz+bO/373lCbUKh
   8wyN1Prikg8W5veUdTNnT23qjwdzy1TvLZguYs4agdaeXZyRZU+QBvTrv
   ZopLfwx7pPlUqt4Xw8SG6sE9/KIadr9YZVLGxRJRH2YCRFIr3zQPN0oPQ
   yfoSiLSK3WhbYqpQmitlSZ7pRquZzzVnfSfMds2SSEcDEncu+qxEHLlb3
   87xOKhS2iWxQPlnmzdCPb/QObwXikl/yddpQYNe0Hw06Pkx9Ltljl8UPS
   g==;
X-CSE-ConnectionGUID: 3TN1UI3CRn6+LSgXAKHouQ==
X-CSE-MsgGUID: uNWZJOyNSsyaKDNmT5DQ5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20241104"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20241104"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 22:39:24 -0700
X-CSE-ConnectionGUID: TmAqN1XuQNODprtdDly5rQ==
X-CSE-MsgGUID: 7QeZFTI0RJmyHAnWArkDew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54113930"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jul 2024 22:39:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYfZw-000sWi-2s;
	Tue, 30 Jul 2024 05:39:20 +0000
Date: Tue, 30 Jul 2024 13:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dhowells-fs:netfs-writeback 18/24] fs/netfs/buffered_read.o:
 warning: objtool: netfs_create_singular_buffer+0x84: unreachable instruction
Message-ID: <202407301324.UYzG0Jiw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   b481ae3cadf4a67589cbe1ecf585498083c5f0b8
commit: 383151c58c85c735c45970bf3cde7f6fc96f958d [18/24] netfs: Speed up buffered reading
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240730/202407301324.UYzG0Jiw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301324.UYzG0Jiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407301324.UYzG0Jiw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/buffered_read.o: warning: objtool: netfs_create_singular_buffer+0x84: unreachable instruction
>> fs/netfs/buffered_read.o: warning: objtool: __readahead_batch.constprop.0+0x6c: unreachable instruction
--
>> fs/netfs/read_collect.o: warning: objtool: netfs_unlock_read_folio+0xc8: unreachable instruction


objdump-func vmlinux.o netfs_create_singular_buffer:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
