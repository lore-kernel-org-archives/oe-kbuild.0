Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481734D934
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857748; cv=none; b=ogU23TddkyYWkSPN36L4H+TDXh6DXSXoXImEL9dk5bo5tF9bG07a57s5qMAA3wEoczHgAsT7ff49MMM7fWRBWErVerUtLxpqQTXx1mHNDJpDd3PNzBkw93+gDMABNLqeISN0HkoR7GarODSnxPfj4Jdp556z25SGP2PQ39/iGcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857748; c=relaxed/simple;
	bh=C7IPYlsSxyA80PeiF+MFpPk1rfObkkxEFsdNM4bQ58E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=pQEzylDslohPmCV7GXlRyzNspuUUpmhtr3I1wmPAN02U1vxl6PH+lzcxjo4XJgLzSuNsDxvJXjnKjTCGfQl6a2jvE/Ghcv8uw1Q+yaC8V2rxh5sD2mZPA6BtArRqaKIu80d3NglMwgusV6N+m6dsUHpixtrdKGozzmLd5sp44hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+dyareT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+dyareT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771857747; x=1803393747;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C7IPYlsSxyA80PeiF+MFpPk1rfObkkxEFsdNM4bQ58E=;
  b=m+dyareTjCGpbAQ+MJooDYPSqk8QmEaYCsgi019tTLi1mln9G0aTxre/
   K8t6lHag1z7fQReEiMS1pvWNXczc2aUa+GP4O5yfQoKsTc6Cq0/1EInyG
   CO2wQN+4wfuYtndnW6Ajx+T0GVmfhDqWN1JsadcSq3C0cIi4ncZibKLHS
   l+Sx96f5CClsriEThneLIhWeHx3F6lZLDwbqCdLXwGyRTwh0j2zBxkSwH
   DoyXXzf9BH5XCvYb/8OjXV+feiIW17GcJ83VZr3BjTbAYMk0rkG0rdlPM
   N6M2UB0cWUFlJkGgzwOg0oOwZ4oIa03uQnclMzKu+nwL6QuvmU8x5KhAo
   Q==;
X-CSE-ConnectionGUID: py/yOL3XQPGbmk34VmIsbQ==
X-CSE-MsgGUID: 2Rk+SeslSW29ujSkQNBy7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72952730"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72952730"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:42:26 -0800
X-CSE-ConnectionGUID: 5T4FN4BWRNGI8Zppn/IaPQ==
X-CSE-MsgGUID: cblIMipqQw6iP3VOL+ng8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="220129141"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2026 06:42:26 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuX8h-000000004uf-2B3Y
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Feb 2026 14:42:23 +0000
Date: Mon, 23 Feb 2026 15:42:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rw-misc:rw/drbd9 13/17] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'ok'
Message-ID: <202602231549.q7F27GBa-lkp@intel.com>
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
commit: 28fe477ef279a0db54bf7a45ed6355c898c922c5 [13/17] drbd: rework reque=
st processing for DRBD 9 multi-peer IO
:::::: branch date: 34 minutes ago
:::::: commit date: 34 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260223/202602231549.q=
7F27GBa-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'ok'
#754: FILE: drivers/block/drbd/drbd_req.c:612:
+		/* any net ok ok local ok is good enough to complete this bio as OK */

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
