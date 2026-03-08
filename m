Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E42A336892
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773014008; cv=none; b=FEXGB1ZU0F/u0SHXUbpFksL+AIVrhh6RfKqMFLRlhst19YHYpnehfhFhCdCt2dZ5Ysmojooa3yjdtpTKzZ8NVL+RBSxWQRiIva6NkCpg70erSOh7AVNXf6d6/MKKHcOoMY0Y7/SlJa07tb+eTpYMEgv1JivrEBiwXDy/kfnyQ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773014008; c=relaxed/simple;
	bh=krO1SDSt9nsqAssEWIcrQ3vvthtLWs85evxGEcOgLcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xuk+SuI6MG4RjusyAtn7cnzTSl+kTxcflsOeyD+OWg4D1R1029h80ZOO2jxP12THGLazjhKq3oJnCwAuJD1UsjBlRHCll7kxT/UQOD6NNLp8Vjh2vBDr27tD8CZhMNFf+Q4Y56NkS1oke4Fuuy8Al+RFD+bYw7fh3s/DPTk7tWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfER3nOy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfER3nOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773014006; x=1804550006;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=krO1SDSt9nsqAssEWIcrQ3vvthtLWs85evxGEcOgLcM=;
  b=YfER3nOyOhm9qebuFLePmty8dZA6G2o+s5gJ83NSVqhwQIu0oHuy3mNn
   PpPH4WUkp6JJXd/OdApcM0VoWuMRLd7InUgmW8MoIB8Y+mNp++N6fgiKj
   ZPRUyHpJeqj3Vhi784D3tTYhHlQ8yYq4USc+PG5ma1WoYbbgqnbXJUct4
   e/Buah4cmkPSvANHoEF/HIRjsTH0FoPESiZzY9D1GTMYMEEj1KbNH+BM9
   o08DzT9y3uq64sjB8XWRXNTcjFGhV87FLKyfPeDRCNv3il96fk3YoWNmD
   +X+836qIaY1uLK8prrPdzUD+zVHA3H4/ocv4RtI7judXcTf0L0ppkVPz1
   Q==;
X-CSE-ConnectionGUID: bqsdA9xBR1Kf/UUH7XPeeg==
X-CSE-MsgGUID: iZJCnP7SS+G2TGOEsQkW0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73954023"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73954023"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 16:53:26 -0700
X-CSE-ConnectionGUID: wvpOD6mWTByJUCvrLdSPGQ==
X-CSE-MsgGUID: SSV9svgnSTWkiaF8fZkz4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218778506"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2026 16:53:24 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzNw2-000000002lx-0wyT;
	Sun, 08 Mar 2026 23:53:22 +0000
Date: Mon, 09 Mar 2026 00:53:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 286/330] include/dup.h:354:25: error: stray
 '\302' in program
Message-ID: <202603090023.npem8cfw-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Anthony Yznaga <anthony.yznaga@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   167400fd4c51f9e5ea8fc9d33c89c938799be4be
commit: 84cd8de2b92a1ccf493c43da8b31bb983d320ca7 [286/330] mm-prevent-dropp=
able-mappings-from-being-locked-fix
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/202=
60309/202603090023.npem8cfw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260309/202603090023.npem8cfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603090023.npem8cfw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from vma_internal.h:55,
                    from shared.h:11,
                    from main.c:3:
>> include/dup.h:354:9: warning: ISO C99 requires whitespace after the macr=
o name
     354 | #define VM_NO_MLOCK_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(VM_SPECIAL |=
 VM_DROPPABLE)
         |         ^~~~~~~~~~~~~~~~
   ../../../mm/vma.c: In function '__mmap_complete':
>> include/dup.h:354:25: error: stray '\302' in program
     354 | #define VM_NO_MLOCK_MASK<U+00A0> <U+00A0> <U+00A0> <U+00A0>(VM_S=
PECIAL | VM_DROPPABLE)
         |                         ^~~~~~~~
   ../../../mm/vma.c:2592:33: note: in expansion of macro 'VM_NO_MLOCK_MASK'
    2592 |                 if ((vm_flags & VM_NO_MLOCK_MASK) || vma_is_dax(=
vma) ||
         |                                 ^~~~~~~~~~~~~~~~
   include/dup.h:354:27: error: stray '\302' in program
     354 | #define VM_NO_MLOCK_MASK<U+00A0> <U+00A0> <U+00A0> <U+00A0>(VM_S=
PECIAL | VM_DROPPABLE)
         |                                  ^~~~~~~~
   ../../../mm/vma.c:2592:33: note: in expansion of macro 'VM_NO_MLOCK_MASK'
    2592 |                 if ((vm_flags & VM_NO_MLOCK_MASK) || vma_is_dax(=
vma) ||
         |                                 ^~~~~~~~~~~~~~~~
   include/dup.h:354:29: error: stray '\302' in program
     354 | #define VM_NO_MLOCK_MASK<U+00A0> <U+00A0> <U+00A0> <U+00A0>(VM_S=
PECIAL | VM_DROPPABLE)
         |                                           ^~~~~~~~
   ../../../mm/vma.c:2592:33: note: in expansion of macro 'VM_NO_MLOCK_MASK'
    2592 |                 if ((vm_flags & VM_NO_MLOCK_MASK) || vma_is_dax(=
vma) ||
         |                                 ^~~~~~~~~~~~~~~~
   include/dup.h:354:31: error: stray '\302' in program
     354 | #define VM_NO_MLOCK_MASK<U+00A0> <U+00A0> <U+00A0> <U+00A0>(VM_S=
PECIAL | VM_DROPPABLE)
         |                                                    ^~~~~~~~
   ../../../mm/vma.c:2592:33: note: in expansion of macro 'VM_NO_MLOCK_MASK'
    2592 |                 if ((vm_flags & VM_NO_MLOCK_MASK) || vma_is_dax(=
vma) ||
         |                                 ^~~~~~~~~~~~~~~~
--
   In file included from vma_internal.h:55,
                    from shared.h:11,
                    from shared.c:3:
>> include/dup.h:354:9: warning: ISO C99 requires whitespace after the macr=
o name
     354 | #define VM_NO_MLOCK_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(VM_SPECIAL |=
 VM_DROPPABLE)
         |         ^~~~~~~~~~~~~~~~

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
