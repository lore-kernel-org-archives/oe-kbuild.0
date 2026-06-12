Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E67530674B
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280669; cv=none; b=apJYkV+jqF52gBxekCOYc50iunuiwB0BzUcqaRVoW07jTcB0K2K/SPPA3Kc7yxG5KI6Kkhkgpa7cMf/TMBTvtP+7QjM7jE2VxmUQbQ6D7Slcx6OXNVCvmpe9EeRn6tL2JCsthGo25F3/EqG5TiFNSgzB1T9C6GXHs3gVqrBlgB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280669; c=relaxed/simple;
	bh=XXautC3K9YWOI0Bp1M5yxNn0Nc3oSzNu7QouSgv0wFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MTeOJSkxNftXWcQzVtMlflEKlyGagQC9tRjeV+kiboTsJzoOoY0zF/sDyGKgRw+be+TErdSFZqc9gtS52BEXPCDwGDn+BNpzQ36Dq+Glp6hKVJZyj0smGmfexUuMUiyM9Gad+02M/0UMs6/WhPLraYYh0v2091mpLaE9jjj1/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrKgrTkr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrKgrTkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781280667; x=1812816667;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XXautC3K9YWOI0Bp1M5yxNn0Nc3oSzNu7QouSgv0wFo=;
  b=hrKgrTkr/5rSo+RgA9lh/VflcL5VSEvOW8m57G2VxSWM2FpGbQLK3umB
   ayeg8HOXM68BjKlQ57BOhFJQGYUxGFcu1G7F/sd5g83HcvEIU6b21zrFx
   UsMvicWq6YAlzdOFWiRTs/aF1Y3R+lZlQ1KHwbq7qqm6yf9ILBtiNwaoS
   YEJCtk/hSaXGnMKCKkz84JdJ7YY3bk4wxe0zbCBg5+wv6xUmD/UGHhZsJ
   U1+3j4XMwSl0BtH3jHwonK6W7zTs3iX+K46P6rNrxgk2+U/6iu1bEZ5H0
   Dg6BYjn/HUWPHrFkQPCLiRr9dkLC8Yzo+Fz72kaRfgZzR1Drj/kD4I8uV
   g==;
X-CSE-ConnectionGUID: eEFBkGkKQlmGIEDwmVLedQ==
X-CSE-MsgGUID: P6tuJSzVTiqs32H/8Rciuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82303647"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82303647"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 09:11:07 -0700
X-CSE-ConnectionGUID: KhdX88WfQ36gc8vVH3I0MQ==
X-CSE-MsgGUID: zC2yM4n7TS6xK0VuMMgSxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="250779067"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2026 09:11:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY4TC-00000000P21-2jmD;
	Fri, 12 Jun 2026 16:10:58 +0000
Date: Sat, 13 Jun 2026 00:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/veth.c:1051:36: error: 'struct netdev_queue' has
 no member named 'dql'
Message-ID: <202606122322.QNc24eG7-lkp@intel.com>
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
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-015-20260612 (https://download.01.org/0day-ci/archi=
ve/20260612/202606122322.QNc24eG7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260612/202606122322.QNc24eG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606122322.QNc24eG7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/veth.c: In function 'veth_bql_maybe_complete':
>> drivers/net/veth.c:1051:36: error: 'struct netdev_queue' has no member n=
amed 'dql'
    1051 |             state->n_bql > peer_txq->dql.limit) {
         |                                    ^~


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
