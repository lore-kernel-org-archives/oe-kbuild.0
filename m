Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BC21E51E0
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857087; cv=none; b=nGzUwor27JcPWsHHdxDH8htbfbETGIZIab6XSLmxOoXpo+4VgELKjcM7r2b0TuwyfniY0gZqDKc0J1ImwmOqBUOUzogMNxdYVURitO5t1jRe/qEO4D3XNCQkb17U8ucD7aC+heyJx3FL2DKvTdM9U2V2lWSSL2bnOiSlJsFLcAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857087; c=relaxed/simple;
	bh=4dirk4D3FHONs8T99lnBXwKuuFHRfVytdC/UHUDK8ww=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=fVunpupw28itbJPpK8c4e8Gsa97T2R2av1jXpK9UtBfweatYk57hz423ZW5LG5F0KYp63tIDuNMNV6DnQ+9DwrIIrjJMp6wF0i09vZatOMp+UO5w1MwN9uk0nmuMRawIFNCSRXzoI8jsbw+iUAfvyOMmniHV2l9Tf2F1xT/Nj8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZWQfumb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZWQfumb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771857086; x=1803393086;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4dirk4D3FHONs8T99lnBXwKuuFHRfVytdC/UHUDK8ww=;
  b=nZWQfumbWB84zUyedJSyX61THWgZiNMdbN3KHSwKFZQWnuCEIHixvVS/
   dEJXhuHU2wMgmBckB+qx2c1IlSToHXPj0YyU0Ot081TbaFL51sfMpemmd
   3RlwT6+hFUGV3iARvFfgl05oi7DgyKH9QV6fIkapwl+2iJ159wWK0D4B4
   B1pctO5y0ZKXBqG6b9XmG9aqPHHUREzL4hFxIm8YcT+Q2D3Dx7AbNGG6t
   /7pYt+T4y1Fp4OCaSKUnalr9JTltSwBTH/QG2ti6Pp5i/L9L+AvjUv5Pg
   QJE9PIqPEqYQIG8Zy3YQCQQWmEintrsJgqJpqt+h47yzrmiHWsvMX8NYl
   g==;
X-CSE-ConnectionGUID: ZdXx1OAxQjKo1W621bY1DA==
X-CSE-MsgGUID: xCJG4j1FR2SURxKLA/7AgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83563393"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="83563393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:31:25 -0800
X-CSE-ConnectionGUID: MjKuRPp1TbSWaA8Q2nAHoA==
X-CSE-MsgGUID: xiZ4ae+MT2+UC8VJb9p8OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="243719564"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2026 06:31:25 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuWy3-000000004tr-04pq
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Feb 2026 14:31:23 +0000
Date: Mon, 23 Feb 2026 15:31:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rw-misc:rw/drbd9 5/17] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'that'
Message-ID: <202602231551.br3WUSvE-lkp@intel.com>
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
commit: 85638c5cfc5ec9cd3e512fc806d658bcff69b3ad [5/17] drbd: add RDMA tran=
sport implementation
:::::: branch date: 23 minutes ago
:::::: commit date: 23 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260223/202602231551.b=
r3WUSvE-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#2325: FILE: drivers/block/drbd/drbd_transport_rdma.c:2290:
+	   use that that was used longest ago */

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
