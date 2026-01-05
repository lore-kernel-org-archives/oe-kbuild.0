Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D8314B62
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 03:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767584136; cv=none; b=JKmWgtiYFr7Aimtz8El4x9twbbCdnHwewUy2okz03oyp00ReXw8qNHXJNLXoDLnGDqjOgU8UQgRh12wwp5LGODdqYFjPs7h5r/WVMmZxTPepSx5EkyPDcvug0se84F1o5lueQYpP4w2xXryfGEZ+dDTLi0C5o5quxuiipO1a/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767584136; c=relaxed/simple;
	bh=97mfkJDhHA38FghMoxkdXQswttxv43MPWrL/lKULdSk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=No23iyjYgFOONnHJw5Vk2DbZ3jz0G1+c4OIYnbCBcNj8mDUl1INv8cuawYs5Mv5lgncI9tH4iOgPxuIXpJJAzJg+2Mm5fY4YHX2oEnNklou2a1XLs6Rr70CR7G5Gq/ZfCaQRwY5FTXeg/iAXYDJDjNhvZIa70llLn56WZ10h+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esVUlfsB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esVUlfsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767584135; x=1799120135;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=97mfkJDhHA38FghMoxkdXQswttxv43MPWrL/lKULdSk=;
  b=esVUlfsBB1WoNkK1C/Yezpwv6Dcq+qeZrp8GTOCYFb3M4flSPkPeRAHi
   jXdo8KAebra67dACQCFFvxo9yDYBO0KEfC8mLPPh1MnFjCZT0xjZNqF/K
   tHd6CrrPEWwUv+apcmX2RwFpBQQZTNlcbL8B6DDK4RWuFd9j9sHGY0EYs
   Trrbl4OJru5p4mECs35/usXJKzGsTmriUax7lcav3Mbir8RwUU0pAxMCx
   1c+u8XfNftZzUePzsbKerT0Wgy05Yjcyyx7OG9pz/5rELk5F3ecGQpAg0
   BKJF82MByw0YCjPqir/ih9jJzMwZkM4kOCASK2zgKu+qAmXACC/lNjxC7
   Q==;
X-CSE-ConnectionGUID: g7ThMudAS3O5iA7I3pT/RQ==
X-CSE-MsgGUID: s4HSbIbqTEKquGLkM4ZS/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="56512121"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="56512121"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 19:35:34 -0800
X-CSE-ConnectionGUID: x/OG3l/VQR+1Hgl0+T1eAA==
X-CSE-MsgGUID: PwYGqZwmSdqe3UO6MNFBhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="202313212"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Jan 2026 19:35:33 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcbNS-0000000011Z-3wgX
	for oe-kbuild@lists.linux.dev;
	Mon, 05 Jan 2026 03:35:30 +0000
Date: Mon, 05 Jan 2026 04:35:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jimc:dd-shrink-maple-2 35/42] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202601050403.kizdDAyW-lkp@intel.com>
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
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-shrink-maple-2
head:   b590674df2f53249be82017d0e451232395dfc12
commit: 74fd2eee24370845937e0d8e3a5810b509757b1b [35/42] dyndbg: save _ddeb=
ug_site mod,file,func fields into maple-trees
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601050403.k=
izdDAyW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#86: FILE: lib/dynamic_debug.c:202:
+static const char * desc_##name(struct _ddebug const *dp)	\

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#94: FILE: lib/dynamic_debug.c:210:
+		       (unsigned long)dp, (char*)ret, dref_##name(dp)); \

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#116: FILE: lib/dynamic_debug.c:1467:
+	rc =3D mtree_store_range(mt, first, last, (void*)name, GFP_KERNEL);

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
