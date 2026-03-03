Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15219386C21
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 08:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527156; cv=none; b=gTm51cJNmLW9hhdeVPwiW7fKpNHQ212627MNotnkkladr9rSkomtOC3kJzyTgynOefjjUrYmBFBJedg8Dtn992HLw4wrcMnRyhcjdS4t483xsqYdOc6A8tpqgK3Dq64IGyxMNvks0qFAeakNhNAsk8XWouBoNbI6lW9zl3NAtAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527156; c=relaxed/simple;
	bh=pXzHK6Gk1jOy/D4BZ0ZjjJtepOk0WRsIBQhcpv1t4EI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=E3g+v5DmdYjclJ4vBtjC7RCx6I/Wm7lNXMe5yL7fq/ve5dnK9fU0BkIxOhh1oY0Nz64Avcl0G5Gr2+rW04Wy6wb2vejiv1DNFnT0K6jMWvxaNnuuwEOlNnuLQXWCZs/aEmcJbpsZyNHpr54N0+00Kuejy9j3FLSWNZJszQNEKd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgVopbEN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgVopbEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772527155; x=1804063155;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pXzHK6Gk1jOy/D4BZ0ZjjJtepOk0WRsIBQhcpv1t4EI=;
  b=AgVopbEN8GAE5pUn7rCR7CHRU4beOsWHPjuRWmXVJZ/XSZF1CYS8Pp7P
   rWAXbsZwBAC8pkn2t0dKIcvEm/abcCB4K0k4obkDSXlGdU7X0VnllmQA5
   S6O6U0tN0gJOgFSUMVBxx6cVyBsOvNhi4lTQTPB/Xj+3voqVV05sh/gnJ
   BaypD9wFooRVS1403XXMhzZv8ETyAwnsrpuR/NhVMRTsxwPoDAsULK4Nu
   QH0I1lV+u3OkOLEGoRQL3+yM436VHBTsCumfrSlbSZXWbgxmfjuUbEL+d
   2gX77RzRFEVNTFwI578XOcfTN+KSWokvjaMQP+wz9V6pcmHx+vEzGaayX
   Q==;
X-CSE-ConnectionGUID: i5RJ8kG5SracW0LZeplLtg==
X-CSE-MsgGUID: rlEGYdB7TTaZ1xmYF24HNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73599844"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73599844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 00:39:14 -0800
X-CSE-ConnectionGUID: +xnJ11AMQp2HF+tlfExBkw==
X-CSE-MsgGUID: niTByBS0RJqjXe+FJ12hWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="222908990"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 03 Mar 2026 00:39:14 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxLHc-000000001Of-04DC
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 08:39:12 +0000
Date: Tue, 03 Mar 2026 09:38:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2 7/18]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'pages'
Message-ID: <202603030949.SN0qJvUI-lkp@intel.com>
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
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-sparc64-generic-2
head:   7788f7db2b88493f82543de3af21b5d3d223e0be
commit: 4913225615248709a1d72c2ab230349f344281da [7/18] vdso/datastore: All=
ocate data pages dynamically
:::::: branch date: 9 minutes ago
:::::: commit date: 9 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603030949.S=
N0qJvUI-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'pages'
#22:=20
The data pages pages need to be order-0, non-compound pages so that the

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
