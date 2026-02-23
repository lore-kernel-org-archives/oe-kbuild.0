Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1570C1FF1AD
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857028; cv=none; b=ZL7JdlgKEnXovhyuWdZFCSyZvXtXLviTaYP5bFAZ/9darYcR/RcUlcrZ5XjTOx02OAZJRopKOBq954QUPuvBvZnfcfAeEL3o0LHQXK1XEYRZu+IiBuXENTbc8ruhSX2qzETjGqsvp50lb43XiAN8sM4TJ6gLzcTmDHYkexa0WQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857028; c=relaxed/simple;
	bh=I2rQ9EdAzyJuylTD6YpMq3JedDk0hWQ6nKAXCgkE/TU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=GgnXtUhBLv2KJigIUGum/i/dNaly0/YUph9bDa5jbNdJdMwHknd4qppF7GQiJ+2R8+nG/vesrkH3cWB8y84qNOqdDoOR+FM1DsDV4iA623CsN+wvDigWzjcNp4SD0mGDV8pVC2AgPk9xS/QAeoVlWJWb40yd1iZwQtP8tM/jqug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1eRZu0i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1eRZu0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771857026; x=1803393026;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I2rQ9EdAzyJuylTD6YpMq3JedDk0hWQ6nKAXCgkE/TU=;
  b=K1eRZu0iQ9GE0GK6g072GYxgO7OGG0lg7qAjJtx+gdVtzi+P1XM6L3ds
   O6VojxvLX7f5W5ihyAXEZVJf+zbvIjttVkMyEfTdC4oynZpQLNfEjSTk2
   LNzeGiGwsPdTm13GZLVmdwneRMo3paYjkVQ+XPQcEdVxZ1lSAD5RSivmx
   Mve9eHkNf08a1t6J+zpBqQfuWzE3+DpRQhqf8d4QjpDo5amuEATARVZL+
   YSZm7Pi4rZnEazBvkXsdeYu/ONmfiBIzsmEdz18hcIWl4BUgDS2O8ZOQO
   iDsZHK4yqkWAY575jbMv63Ms0qNXyYTu5pP47j5I54paoFSH2SxLhU+fE
   Q==;
X-CSE-ConnectionGUID: TFBkLw3aTfu5qNugG0CnMg==
X-CSE-MsgGUID: MADydTNETH2nRSgfl1vFZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83477984"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="83477984"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:30:25 -0800
X-CSE-ConnectionGUID: /BYmnUMaTg+zqaUdPedzlg==
X-CSE-MsgGUID: ekDheAQgSau2bvkXnPmORA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213934184"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Feb 2026 06:30:25 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuWx4-000000004td-3Qzs
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Feb 2026 14:30:22 +0000
Date: Mon, 23 Feb 2026 15:29:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rw-misc:rw/drbd9 4/17] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202602231512.eTPMytOn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "high confidence checkpatch report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Christoph B=C3=B6hmwalder" <christoph.boehmwalder@linbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git rw/drbd9
head:   bf25dcf596c5e954ec59b0521208f284c3e4ed47
commit: c972d28ccb4069863092cd815745a858b0f1cc1a [4/17] drbd: add TCP trans=
port implementation
:::::: branch date: 22 minutes ago
:::::: commit date: 22 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260223/202602231512.e=
TPMytOn-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#530: FILE: drivers/block/drbd/drbd_transport_tcp.c:491:
+	/* explicitly bind to the configured IP as source IP
+	*  for the outgoing connections.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
