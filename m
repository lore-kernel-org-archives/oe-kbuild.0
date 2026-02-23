Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E763E155757
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856907; cv=none; b=jwf4NZD9MJmJU7hj0O2nFWg+AdeoMZr2VAFFpylhk6+skadMcahCQ6PNei6COOIFAl15X6cICZ7hk6NR3pzFiDcFjWDwoTwGbh4iP9gfl8JZgNlB5VKQuPJ9IQzrzVJhm0ZFpKuZhFz766H5LEOhD/+SugkVSFyymbsQF7FRjFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856907; c=relaxed/simple;
	bh=dkKSr4Ip7t1Rj9zF8+r2QUnPWc7DIMhc/krc91Lhr9Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=aHO4yB+ubzIxM/Krm4MyODSJCyYXkYISPAN5GyztWXvOEJXJNik362JO9emy6Ohl+lAdIAOEU6iLeH2wKK5ntHhTcU8px1fax4poaebHyt1nI4gBv6ihvhgHDSG/hDwOstPFDPg3wshxQ3Tx6FOebuodNivYDcpo3ALEzLy/w8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZP5QoUKn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZP5QoUKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771856906; x=1803392906;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dkKSr4Ip7t1Rj9zF8+r2QUnPWc7DIMhc/krc91Lhr9Y=;
  b=ZP5QoUKnvW71TLBhXhOXFLracrd9sRjyg7+q8cN558Xko4UFmpAHID8W
   hu0AQYo4BdH66s2cBMGHBVF6nzFuvJbWVRO5Gf63U37odZYQ5BLILcRuT
   65W0oVOfZaUbfwYyHnpJLTwqJQyQ9YiKydk767urmIegVvg/8V8ZQEuCg
   jdwl0uuhYsmzWeY3cRRJR4OL6TZRAOH9gslxjiZVF1mxKXo+pW/lKQUEA
   OfKdu5zOi9Kc9dR/KbVDhwQVFHzZgAT2le0KspfXrqdc2eHHXYTJ4Ks2P
   qskJTtmHVzJ8tRzN58wvxtGwRrKeg/nD5uO5xerJ31g5Oy9DkwoHsiyzZ
   Q==;
X-CSE-ConnectionGUID: /okbPO9dRVKqmRi3a8xzBQ==
X-CSE-MsgGUID: d2lGKBe1QFelQwiDMIy2HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83477822"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="83477822"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:28:26 -0800
X-CSE-ConnectionGUID: ih+SfiLrRkOvNNk95a92PQ==
X-CSE-MsgGUID: 7LsJzncZQ5qrbha2HsxFnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213933904"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Feb 2026 06:28:25 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuWv8-000000004tR-2wZQ
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Feb 2026 14:28:22 +0000
Date: Mon, 23 Feb 2026 15:28:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rw-misc:rw/drbd9 1/17] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202602231548.psVhGRmF-lkp@intel.com>
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
commit: 74f7f59454a4b34556dd35d9dedb2fdd7097eaef [1/17] drbd: update and mo=
ve protocol definitions
:::::: branch date: 20 minutes ago
:::::: commit date: 20 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260223/202602231548.p=
sVhGRmF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#581: FILE: include/linux/drbd_protocol.h:104:
+	P_RS_CANCEL_AHEAD     =3D 0x4a, /* protocol version 115,
+		 * meta: cancel RS_DATA_REQUEST packet if already Ahead again,

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
