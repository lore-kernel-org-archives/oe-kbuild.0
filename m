Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F903C24
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Sep 2024 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726931036; cv=none; b=l6uvNQ08CwXxsHDlG4/OjMhOmMhOIZlDJAlrJhYwlvZfboIVGP8abtuCCi7NdbeRwWcQwnsuNgYsEZwq0kNYCK6mbvfO2UWDZwdXw+Hr/qY0DqYrdpnhCLWiC0Z/vH9naYPdawAF47hHL/Nl6+pklEuA8pVdGR4wVx5uQbNFPVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726931036; c=relaxed/simple;
	bh=3LUbFSAyLloqMWYZOmqNwRrIFBIjhaL+60xl9Tlmrjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yn6OV/RqqPRWt7DAdttTcTWDMlt8GkRItlSqAhioNXzrnnFC1mYjGeknErEg4jENqMXi0f3lKD7oFZEsy7C0JA053KCCy7blT0Ur0RpN2Jt3u33t9rxaiNb8qY6T5719/x2YLVRenfLfX/kcUNfzjX2Xkdmqh5sbIkX+RsGkuc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anm2yZsY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anm2yZsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726931033; x=1758467033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3LUbFSAyLloqMWYZOmqNwRrIFBIjhaL+60xl9Tlmrjc=;
  b=anm2yZsYjsNgPWCPs830GxkdAvcm8QPqArKziJnOLNlvTAlZw6HjaeLz
   oUdSayaO7qXGa7pWWsBGZS5dE3WExdoomMBYM0DyG1SyakYIOtVpAZlQJ
   Zx//LSgXzn3rcNwZ0UL8/3o9BtUzDAM2r6Ln3eYdzTRmyq7ZMmOaim6e2
   f1fBdlAAwJqbXgWGFPp+w5hT0jx4EUiPW2A1hAm3SOjYbRUDPZV9puY7u
   wt6+DT5fn6w53uPHed7W56naEmdGE90TBEbMwjUBOsDTAYPTW8tfjzvu8
   9QE9nmVHf/6vd9oZySig841IMGx9PvMzpjB4wF177VMuG8othBxTuzKe5
   w==;
X-CSE-ConnectionGUID: dZOHvzF9SMWVxN67NHz83Q==
X-CSE-MsgGUID: wOccZGiLR+KplLpR+MmQvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36511600"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="36511600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 08:03:53 -0700
X-CSE-ConnectionGUID: vwedQuwWS7aBA6ygytXstw==
X-CSE-MsgGUID: vUQ0n0rnTZ22CzBbUcJpiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="70894867"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Sep 2024 08:03:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss1eH-000FWD-2N;
	Sat, 21 Sep 2024 15:03:49 +0000
Date: Sat, 21 Sep 2024 23:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 2/2] connector/cn_proc: Selftest for threads case
Message-ID: <202409212201.l94GHFkW-lkp@intel.com>
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
In-Reply-To: <20240920000933.185090-3-anjali.k.kulkarni@oracle.com>
References: <20240920000933.185090-3-anjali.k.kulkarni@oracle.com>
TO: Anjali Kulkarni <anjali.k.kulkarni@oracle.com>
TO: davem@davemloft.net
TO: Liam.Howlett@Oracle.com
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: oleg@redhat.com
CC: akpm@linux-foundation.org
CC: axboe@kernel.dk
CC: brauner@kernel.org
CC: mhocko@suse.com
CC: alexjlzheng@tencent.com
CC: willy@infradead.org
CC: michael.christie@oracle.com
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
CC: anjali.k.kulkarni@oracle.com
CC: peili.io@oracle.com

Hi Anjali,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjali-Kulkarni/connector-cn_proc-Handle-threads-for-proc-connector/20240920-081249
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240920000933.185090-3-anjali.k.kulkarni%40oracle.com
patch subject: [PATCH net-next 2/2] connector/cn_proc: Selftest for threads case
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409212201.l94GHFkW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409212201.l94GHFkW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ../../../../include/uapi/linux/netlink.h:7,
                    from proc_filter.c:11:
>> ../../../../include/uapi/linux/types.h:10:2: warning: #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders" [-Wcpp]
      10 | #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders"
         |  ^~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
