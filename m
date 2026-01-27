Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3339E2E6CD5
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504553; cv=none; b=bophZM1UexyMkQN0QCnXCmV92CCJYMVePFc+huFokkxJv4sHN0ICs+YC+akezxDs/lavxMTp/qvb53y2oahGEwaDfUBRcFNNIn6J427CdNeoTXQ5FF+8y5+h+b4rzkz8E+H37xgk97TE1ReADXSiodXBBTncCjYhupfN+E4qyOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504553; c=relaxed/simple;
	bh=F9HG85sziSMnK4UWeM2Q+GP878AYIgHxUPBq72EW6Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P5ulR3jRCMzrBxpkLWugvKAJHntmeeLYEsc3a47ScjwHJ0X1XoWMlTBGN3PARAYpTztX95igzzJj18rSLo9AQyH+1Y2L3uKm7N/4WxTbcOB1hCQQAs0sujUEIBqCbZ+oDbBWo5Alz2S0PJHrAmtVB5HuC/Rmnwy+XXe8oxkogcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKiJTyVG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKiJTyVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769504552; x=1801040552;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F9HG85sziSMnK4UWeM2Q+GP878AYIgHxUPBq72EW6Vo=;
  b=TKiJTyVGakr1FZ6pnRyxOEA6sBxmtTnxHJ9teYyaiC0cAamKgpeuB2NJ
   3KV4Z++X2/O3kYEE3VW6W8qjk1kifYukE3baG68/9Jyxrh5nVIp7ISbyM
   49TEx3oY8T+drT6D+0pk7b0gTXLFLsuXmEuIgE3yoSpBvHrGxp31OMbTl
   ui7A+bioy9K7bgqQQ9dTijI7tqV4lyC+NwfLePPzoKFaXdP9GxwRCZoqx
   P9pzST+w2uIreZGR40CRJABrq7Tn3bX+uci/qUMkEwqBt5DbopACcTlm1
   svjuP20gpd7H3SX7VwkNahCmu+13xLx3pZm62Xcd1pMinDvL5aVVGW1UT
   A==;
X-CSE-ConnectionGUID: XE6ELMRGRbWeoBkbGab4JQ==
X-CSE-MsgGUID: QpZfB3+cTT6AQJOsvW+iMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74538298"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="74538298"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:02:31 -0800
X-CSE-ConnectionGUID: R7dNUfo8SaSbL6TGNIEmyQ==
X-CSE-MsgGUID: FgNpFHzxSQeuiAKRDKo8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212780549"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2026 01:02:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkexw-000000001kP-2Vz1;
	Tue, 27 Jan 2026 09:02:28 +0000
Date: Tue, 27 Jan 2026 10:01:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net v2 4/4] selftests/net: add no NDP b/mcast,null poison
 test
Message-ID: <202601271016.wlWFeNUI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <606dba34fb962b5ec2694053e1eb080e381dce55.1769464405.git.marcdevel@gmail.com>
References: <606dba34fb962b5ec2694053e1eb080e381dce55.1769464405.git.marcdevel@gmail.com>
TO: "Marc Suñé" <marcdevel@gmail.com>
TO: kuba@kernel.org
TO: willemdebruijn.kernel@gmail.com
TO: pabeni@redhat.com
CC: netdev@vger.kernel.org
CC: dborkman@kernel.org
CC: vadim.fedorenko@linux.dev
CC: "Marc Suñé" <marcdevel@gmail.com>

Hi Marc,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Su/arp-discard-invalid-sha-addr-b-mcast-ARP-poison/20260127-075649
base:   net/main
patch link:    https://lore.kernel.org/r/606dba34fb962b5ec2694053e1eb080e381dce55.1769464405.git.marcdevel%40gmail.com
patch subject: [PATCH net v2 4/4] selftests/net: add no NDP b/mcast,null poison test
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260127/202601271016.wlWFeNUI-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271016.wlWFeNUI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601271016.wlWFeNUI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ndisc_send.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
