Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA3F1E8826
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 18:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781287633; cv=none; b=GobuuOk/8cMYtC95aSuJfUBdt1oS9boDEB7knTR6fnmmu3nf8EYSpLj86jHI4Vb3GLx7KKPhdKJgm1tMfO63OcWHfdBeqpjrjlBKWR3lYcOtx/NExr6UMvsv8ZWocUXAPVQIiu0xVmp27beMWpHjs+BiHZuQUwQUkT+EaEhFZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781287633; c=relaxed/simple;
	bh=/ni1O6FN+QkNJ98GdDaWP7ghIwjKTyP1DFNMnTkuut0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c6bxArkL8iqzVfP74OpxJ8SdK+YStlOXNmBWatIZhQi8zZYjtDsFR+V9DSbfQwXzraDrGSiNug9t3e/74/2Cr9GEQjpD5AcBZ93XSjNYwqi8CXL+xgQAW9cWYzS7kc54IRqEvgXfW7yiBqERDhwWlWTe6YkGs3kg1jW43lATGko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6c4qV1E; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6c4qV1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781287632; x=1812823632;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/ni1O6FN+QkNJ98GdDaWP7ghIwjKTyP1DFNMnTkuut0=;
  b=I6c4qV1EFoFQ4QebrlWlA1FW/01h9PaehhLIeiCekSJXBU/icwDCZXQ6
   0uPgTBfY//uIdFhSIsA8Bto0K/8uxuFIeQo55x2PXCTbbuj4IZm6Csqs5
   RRScKaJc+cnlGNbD0GPBv0fy8U+M8cvJqLshrCY3L1XMBIi4co5qd6sZH
   J0jqzZDbNAJW5QBbIWPWdroioWCZ3TNxbdFgY9gDcsueVe4IrAE5Nh7pL
   WcoKoofd5Th8qws7QRIE93jZ1vlTrDXlb3S5m3BSydPpme0VrS9xh+V3M
   pvfWJSRhgHNB/goQr0Aim1v0tYZCDHs+dussg2HYbDWI5TjyPs/sjRjgN
   Q==;
X-CSE-ConnectionGUID: /Xcrod8WR62uA1vphy4lGA==
X-CSE-MsgGUID: JkAN+b5pQLmQ+j4lC4ovpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82185904"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="82185904"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 11:07:12 -0700
X-CSE-ConnectionGUID: CAkyebKUTQKF0tK+DG9N2w==
X-CSE-MsgGUID: y9x5NZxnQm6o0ijcTFaQLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="243956628"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jun 2026 11:07:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY6Hc-00000000PB1-0soB;
	Fri, 12 Jun 2026 18:07:08 +0000
Date: Sat, 13 Jun 2026 02:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/veth.c:1051:31: error: no member named 'dql' in
 'struct netdev_queue'
Message-ID: <202606130214.MS4ybkwg-lkp@intel.com>
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
:::::: Manual check reason: "bisect to a FBC not belonging to original linu=
x-review patches: branch: linux-review/hawk-kernel-org/net-add-dev-bql-flag=
-to-allow-BQL-sysfs-for-IFF_NO_QUEUE-devices/20260612-164112, commit: 0b32f=
89b62f44ff3c25a5745be17a7362adb4ab7"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Simon Schippers <simon.schippers@tu-dortmund.de>
CC: 0day robot <lkp@intel.com>
CC: Jesper Dangaard Brouer <hawk@kernel.org>
CC: "Jonas K=C3=B6ppeler" <j.koeppeler@tu-berlin.de>

tree:   https://github.com/intel-lab-lkp/linux/commits/hawk-kernel-org/net-=
add-dev-bql-flag-to-allow-BQL-sysfs-for-IFF_NO_QUEUE-devices/20260612-164112
head:   0b32f89b62f44ff3c25a5745be17a7362adb4ab7
commit: 0b32f89b62f44ff3c25a5745be17a7362adb4ab7 veth: time-based BQL compl=
etion coalescing via ethtool tx-usecs
date:   9 hours ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-013-20260612 (https://download.01.org/0day-ci/arc=
hive/20260613/202606130214.MS4ybkwg-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260613/202606130214.MS4ybkwg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606130214.MS4ybkwg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/veth.c:1051:31: error: no member named 'dql' in 'struct netd=
ev_queue'
    1051 |             state->n_bql > peer_txq->dql.limit) {
         |                            ~~~~~~~~  ^
   1 error generated.


vim +1051 drivers/net/veth.c

948d4f214fde43 Toshiaki Makita 2018-08-03  1031 =20
0b32f89b62f44f Simon Schippers 2026-06-12  1032  static void veth_bql_maybe=
_complete(struct veth_bql_state *state,
0b32f89b62f44f Simon Schippers 2026-06-12  1033  				    struct netdev_queu=
e *peer_txq,
0b32f89b62f44f Simon Schippers 2026-06-12  1034  				    u64 bql_flush_ns)
0b32f89b62f44f Simon Schippers 2026-06-12  1035  {
0b32f89b62f44f Simon Schippers 2026-06-12  1036  	u64 current_time;
0b32f89b62f44f Simon Schippers 2026-06-12  1037 =20
0b32f89b62f44f Simon Schippers 2026-06-12  1038  	/* There is no reason to =
complete with 0 and
0b32f89b62f44f Simon Schippers 2026-06-12  1039  	 * peer_txq could go away.
0b32f89b62f44f Simon Schippers 2026-06-12  1040  	 */
0b32f89b62f44f Simon Schippers 2026-06-12  1041  	if (!state->n_bql || !pee=
r_txq)
0b32f89b62f44f Simon Schippers 2026-06-12  1042  		return;
0b32f89b62f44f Simon Schippers 2026-06-12  1043 =20
0b32f89b62f44f Simon Schippers 2026-06-12  1044  	current_time =3D sched_cl=
ock();
0b32f89b62f44f Simon Schippers 2026-06-12  1045 =20
0b32f89b62f44f Simon Schippers 2026-06-12  1046  	/* We complete if:
0b32f89b62f44f Simon Schippers 2026-06-12  1047  	 * 1. We reach bql_flush_=
ns.
0b32f89b62f44f Simon Schippers 2026-06-12  1048  	 * 2. We potentially have=
 BQL starvation.
0b32f89b62f44f Simon Schippers 2026-06-12  1049  	 */
0b32f89b62f44f Simon Schippers 2026-06-12  1050  	if (state->time + bql_flu=
sh_ns <=3D current_time ||
0b32f89b62f44f Simon Schippers 2026-06-12 @1051  	    state->n_bql > peer_t=
xq->dql.limit) {
0b32f89b62f44f Simon Schippers 2026-06-12  1052  		netdev_tx_completed_queu=
e(peer_txq, state->n_bql,
0b32f89b62f44f Simon Schippers 2026-06-12  1053  					  state->n_bql * VETH=
_BQL_UNIT);
0b32f89b62f44f Simon Schippers 2026-06-12  1054  		state->time =3D current_=
time;
0b32f89b62f44f Simon Schippers 2026-06-12  1055  		state->n_bql =3D 0;
0b32f89b62f44f Simon Schippers 2026-06-12  1056  	}
0b32f89b62f44f Simon Schippers 2026-06-12  1057  }
0b32f89b62f44f Simon Schippers 2026-06-12  1058 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
