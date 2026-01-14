Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADDB4A3E
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395646; cv=none; b=WT4kmBAaCbH2GBzTsUZ/NPp/lBM4hcsTw7nqjs4j63wVj/ZOaGlkKVmN/Go7BQslLcpDNbiOJJLb1xXTk4Sn3Z0h7q0NwGqDnt1lwOzWWJ0UPosKmPWvDk1GgrltzpIOEDl5pldFaOoVmVt+wNksPNpaW7k4YhtQvXujTUcItKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395646; c=relaxed/simple;
	bh=VNK0cgLax+axyWHnD5VEHGJcpukyGrAHcjjqqSmN7w0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PHcGUFYlGmRDhoHxCE5H3StBdSkqHN6UNbst3D1E64Ff2gKMrMgIrnmS1EUMK+Ox7LNVY64Iwb58OHF8kLCS2pg/ENZfT5txVuO2hHs81lCEWte1k+6R3rpi4UQ79G7wtzvFLq6eHRUI2aHMwl/eRfc8bb0uqku7sGbgZzXjre0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9a7Rt60; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9a7Rt60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768395644; x=1799931644;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VNK0cgLax+axyWHnD5VEHGJcpukyGrAHcjjqqSmN7w0=;
  b=l9a7Rt60D44AEeTbsL9COKLq7o2AmXCT9GWJs0wGhChKVEL+CezpnItI
   gUIT5W3qL5ZVnUunq3VD4BhMBxVLLDUpsKsMnsXwMO81p7I1UlIJnXHqq
   lanpBdzm0nLXX6mgDoj0yBYciCBVdTOPYcqkzAnoeUpPunLQHgRt730pe
   CDHGoH873tPbMWcIKPWq9MD0rwi8DNep0SaSy3lPck6yFlSGVOQ31NI6I
   dhvELSwLVMeqyDoafCJ+bQqOpys0PhFwlMF8ndgFKiHzf4IlSMr2etNqE
   MJN5ewLErbVMf4Fan2lbZlDu5ZrZuC5u2IlQFzDCx1/NS7Jp5X1ZZUqoE
   A==;
X-CSE-ConnectionGUID: B6gpuN+BQO2sMox7r9Z6Zg==
X-CSE-MsgGUID: sN0fRdJMTSOCPgmlyVPDVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81055575"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="81055575"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 05:00:44 -0800
X-CSE-ConnectionGUID: MCcDOjGdQHi5Mh2zCSSKjA==
X-CSE-MsgGUID: Nh/DzD5PT0ybMLCfeySG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="205097677"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 05:00:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg0UK-00000000GOy-2uB2;
	Wed, 14 Jan 2026 13:00:40 +0000
Date: Wed, 14 Jan 2026 21:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/vlv_iosf_sb.c:93:3-10: opportunity for
 str_read_write(is_read)
Message-ID: <202601142027.qMbpvzj0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>

Hi Jani,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c537e12daeecaecdcd322c56a5f70659d2de7bde
commit: 6819b5a67e7014352906f82ddedafb602ac8d45d drm/i915: rename vlv_sideb=
and*.[ch] to vlv_iosf_sb*.[ch]
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/arc=
hive/20260114/202601142027.qMbpvzj0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601142027.qMbpvzj0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/vlv_iosf_sb.c:93:3-10: opportunity for str_read_wri=
te(is_read)
   drivers/gpu/drm/i915/vlv_iosf_sb.c:117:3-10: opportunity for str_read_wr=
ite(is_read)

vim +93 drivers/gpu/drm/i915/vlv_iosf_sb.c

1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 75 =20
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 76  static int vlv_sideband_rw(struct drm_i915_private *i915,
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 77  			   u32 devfn, u32 port, u32 opcode,
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 78  			   u32 addr, u32 *val)
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 79  {
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 80  	struct intel_uncore *uncore =3D &i915->uncore;
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 81  	const bool is_read =3D (opcode =3D=3D SB_MRD_NP || opcode =3D=3D SB_C=
RRDDA_NP);
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 82  	int err;
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 83 =20
a72e1c139194a5 drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2024-10-29  =
 84  	lockdep_assert_held(&i915->vlv_iosf_sb.lock);
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 85  	if (port =3D=3D IOSF_PORT_PUNIT)
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 86  		iosf_mbi_assert_punit_acquired();
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 87 =20
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 88  	/* Flush the previous comms, just in case it failed last time. */
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 89  	if (intel_wait_for_register(uncore,
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 90  				    VLV_IOSF_DOORBELL_REQ, IOSF_SB_BUSY, 0,
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 91  				    5)) {
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 92  		drm_dbg(&i915->drm, "IOSF sideband idle wait (%s) timed out\n",
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
@93  			is_read ? "read" : "write");
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 94  		return -EAGAIN;
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 95  	}
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 96 =20
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 97  	preempt_disable();
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 98 =20
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
 99  	intel_uncore_write_fw(uncore, VLV_IOSF_ADDR, addr);
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
100  	intel_uncore_write_fw(uncore, VLV_IOSF_DATA, is_read ? 0 : *val);
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
101  	intel_uncore_write_fw(uncore, VLV_IOSF_DOORBELL_REQ,
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
102  			      (devfn << IOSF_DEVFN_SHIFT) |
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
103  			      (opcode << IOSF_OPCODE_SHIFT) |
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
104  			      (port << IOSF_PORT_SHIFT) |
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
105  			      (0xf << IOSF_BYTE_ENABLES_SHIFT) |
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
106  			      (0 << IOSF_BAR_SHIFT) |
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
107  			      IOSF_SB_BUSY);
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
108 =20
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
109  	if (__intel_wait_for_register_fw(uncore,
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
110  					 VLV_IOSF_DOORBELL_REQ, IOSF_SB_BUSY, 0,
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
111  					 10000, 0, NULL) =3D=3D 0) {
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
112  		if (is_read)
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
113  			*val =3D intel_uncore_read_fw(uncore, VLV_IOSF_DATA);
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
114  		err =3D 0;
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
115  	} else {
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
116  		drm_dbg(&i915->drm, "IOSF sideband finish wait (%s) timed out\n",
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
117  			is_read ? "read" : "write");
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
118  		err =3D -ETIMEDOUT;
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
119  	}
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
120 =20
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
121  	preempt_enable();
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
122 =20
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
123  	return err;
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
124  }
1eecf31e3c962a drivers/gpu/drm/i915/vlv_sideband.c Jani Nikula 2021-10-13  =
125 =20

:::::: The code at line 93 was first introduced by commit
:::::: 1eecf31e3c962aabc1e9c5a469cfa2d161e5254d drm/i915: split out vlv sid=
eband to a separate file

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
