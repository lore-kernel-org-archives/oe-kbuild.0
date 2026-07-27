Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C163CC7EB
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Jul 2026 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181699; cv=none; b=eljJNzrJmOBpQZYNG27yjgZd85hc9AqU/oPx5Q/avcxH74phzWwT/i6os8ttg/Ulvi4Pz8V6hOse0TRogQkL0h97QKGC9SrJUUHGa+Rpis3F+ZM6u0ng6o9CX9v57xSTd2B9Dc2dnptOsa/+SAaU1PsESrSdHs1uA/d38HOj8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181699; c=relaxed/simple;
	bh=5ndmeWs359PBJhWFRSBEpQOUWxcV1DEbnnhVhK5/prA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UqAPnWJvv22hRllWuHwG0GIfce87kuq7WCnuJpoI2KzKdVwwZAN/t1/i9aE/38/2CkkI3wKVTG9+S4/KydegOEvgM424pZxIpc1gEjssp0octzmRd8OWRLiGj3dALmtxv/oZ2ukRR8vcrAZ5SM+sH1A46LuVbHTZptjvQHelNwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAeEO1Sq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAeEO1Sq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785181697; x=1816717697;
  h=date:from:to:cc:subject:message-id;
  bh=5ndmeWs359PBJhWFRSBEpQOUWxcV1DEbnnhVhK5/prA=;
  b=UAeEO1SqnSJqqsXL8ixeWJdyn8TfF5GpxGlgkpcfistAY0+DxDAKPspL
   9opjtOnAijOjSlGHAWDZfkzBdppvnk9Am71rfhVMVZAWv/k13B8+9DsJ+
   LMtY8UVnOQ+Q4iiKk5FowVMoLoC3f1H+Hgh9TY9X76eEUX/7a2QiDVemp
   qeqUzimzkjhOtlw2EtPgJua8CdkbUpiYYiyX+QduET7Jsu/H3BnOa2L/U
   r85wkRVXmDrvQ7TsrDAqXTi8A2nd2QiBbjVGtrXkntZQbOvxLSuZQVV40
   otXKzPHxwDC+RasSJVUlL4t5mxJzgmRrPGuWeUnY+Wj5G548loKYeBP1v
   A==;
X-CSE-ConnectionGUID: gwpq4BXQTxakH7eEldr8pg==
X-CSE-MsgGUID: p0jn2RNKRauctRKAv0oFJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103300096"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="103300096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 12:48:17 -0700
X-CSE-ConnectionGUID: dqeVRId6S5i3HbygLzrZnw==
X-CSE-MsgGUID: 9j8vcWdpTDel6e4t5wbzAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="263280261"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Jul 2026 12:48:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woRJ6-00000000dRn-40km;
	Mon, 27 Jul 2026 19:48:13 +0000
Date: Tue, 28 Jul 2026 03:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/rxrpc/peer_object.o: error: objtool:
 rxrpc_init_peer.isra.0+0x48: can't find jump dest instruction at
 .text.rxrpc_init_peer.isra.0+0xbc
Message-ID: <202607280314.xLkX7q06-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5098b6bae761e346ebcd9da7f95622c04733cff
commit: 1fd1dc41724319406b0aff221a352a400b0ddfc5 objtool: Fix ERROR_INSN() error message
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: powerpc-randconfig-r063-20260727 (https://download.01.org/0day-ci/archive/20260728/202607280314.xLkX7q06-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280314.xLkX7q06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1fd1dc417243 ("objtool: Fix ERROR_INSN() error message")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607280314.xLkX7q06-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/rxrpc/peer_object.o: error: objtool: rxrpc_init_peer.isra.0+0x48: can't find jump dest instruction at .text.rxrpc_init_peer.isra.0+0xbc
--
>> drivers/pinctrl/uniphier/pinctrl-uniphier-core.o: error: objtool: uniphier_pctl_pin_dbg_show+0x60: can't find jump dest instruction at .text.uniphier_pctl_pin_dbg_show+0x90

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
