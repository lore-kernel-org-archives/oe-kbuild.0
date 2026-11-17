Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933048;
	b=TbSQ61//CHb/5usALz/4KTo5Y2WINz2D2iyaINanKwxQZU+Ezr1YR86EAr42d049G6jz
	 5jGwcINe+qlIIMXRpml+kL+WJsaJwzzfBqNU0/NTbtQh6n8b8xJs8rBPphR7JzntWGCnK
	 B58bzgdrhKpW0nMNCPJoOEZvDCx/OogYJO1igBfcAb2G8lk1WCywwK0JRNXDOrazgqUTA
	 NopeHJgKCYnDIEhLZf4JM1DAmfcJPWqMePNp+BFLnUgKabN25+0HvPHi5vxxGRMqdANTH
	 3wm6qWm07rozJZd5ozI35VVf7De9HBHLQZ7q3anmTHWJ35IZdulBXjI/uw4nYYM9s3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933048;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9YmyaRu82gzU8g6uz7uvw5mF62kQxbd5RPd7bzcbew4=;
	b=fM00Pm14DqMaQCo6kWdTpUSMn7WY+HGqFJfjfDfB13sdh3lJogvANbSmTO00Wvfz6IuE
	 S0DP8FYO3gukhAIvQSuA+hTLxKalNK7oBTsM/f9o704c84o4E+QAZP0T9z6nEQve8JxyB
	 7cc7C67drYg2lQZc9FMnws+EmqvGT58R9nZowW8RhyQjXk7SJjCOGFCVoslDJgkdMp10k
	 Rx8LfxaUrNNaOSqkHi5HdUmYDJgxEhhOiNC3nw8sn/zWosCKzdfqW1KaMiRjjigBJ14i6
	 pOWzOjp78ke+mV+2x7ZLn/ws5/F9jwHQkorQ1obmz2MdNO4Tm29shdWb19J4QEQS6oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="eIa50fB/";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC9606A331
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 16:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABC9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eIa50fB/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794933048; x=1826469048;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u1HBV6My4ZVdjuHuzDOeT/GNlIpuSUeWJDCPscA8lhU=;
  b=eIa50fB/OBfLaAX6PDtQea5ZCm8iJYsBZHEpLtS2O+RpTKf4LkawQ5oW
   0pB114o4YeYxesRdpxTbHijHEKM2CpANADDW515S2xlp4IcZQKM83eakU
   zzsITKWR2mi7EiR16edSr0wS0CRgEc6foLqcbf9xcajaTwIyuT2qf3diy
   nwhMTWPFnW8MmMKcwRP00uYcbrm7nIHtB6yIA55ss0Pyr30/+vozaslQH
   i7t7YCLpR5mU6slxvT3xDQGOdTMs54G4v7nfYV+inC1oOoW+h/xJgPww+
   j+j43z1ZfpAjVSaYGOz5oKrVwyW7or8Cxx44rE6WXbslCSaW4kIKUQLUS
   w==;
X-CSE-ConnectionGUID: jPPu3YH0Qyq+ti9hSLMwHQ==
X-CSE-MsgGUID: MoPbjBa4S1Ca042bPwTa0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3705928"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3705928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:30:47 -0800
X-CSE-ConnectionGUID: bzDkexYXRKmkmbRT1VRI2A==
X-CSE-MsgGUID: qeWc3i3bTh2rY3sPtAQpgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9940465"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2026 08:30:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTM4w-000000003A0-42Wl;
	Tue, 17 Nov 2026 16:30:42 +0000
Date: Tue, 17 Nov 2026 17:30:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/hfsplus/unicode.c:496:24-25: WARNING opportunity for
 swap()
Message-ID: <20261117172832.VeDFg2Mm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Viacheslav Dubeyko <slava@dubeyko.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: bbe5ebcbc006ac3c7353759fc593fb7cb7de76a1 hfsplus: canonicalize deco=
mposed catalog names like fsck_hfs expects
date:   8 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-r2109-20261116 (https://download.01.org/0day-ci/ar=
chive/20261117/20261117172832.VeDFg2Mm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 563=
7411ce5dc86d0b7f87cde0f7ee47406d29db6)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: bbe5ebcbc006 ("hfsplus: canonicalize decomposed catalog names like=
 fsck_hfs expects")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261117172832.VeDFg2Mm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/hfsplus/unicode.c:496:24-25: WARNING opportunity for swap()

vim +496 fs/hfsplus/unicode.c

afd6c9e1f5287a Ernesto A. Fern=C3=A1ndez 2018-08-21  461 =20
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  462  /*
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  463   * Apply the Unicode C=
anonical Ordering Algorithm to a decomposed name held
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  464   * as plain host-order=
 code units: within each maximal run of characters
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  465   * that have a nonzero=
 combining class, stable-sort the run into ascending
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  466   * combining-class ord=
er. A character with combining class 0 always starts
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  467   * a new run and is ne=
ver itself reordered.
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  468   *
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  469   * hfsplus_decompose_t=
able decomposes each source character on its own; it
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  470   * says nothing about =
how the decompositions of two different source
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  471   * characters should b=
e ordered relative to each other when both produce
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  472   * combining marks tha=
t end up adjacent. Without this pass, such a
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  473   * sequence can be sto=
red in an order that macOS's own fsck_hfs
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  474   * (FixDecomps() in Ca=
talogCheck.c) considers illegal, even though every
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  475   * individual characte=
r was decomposed correctly.
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  476   */
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  477  static void hfsplus_ca=
nonical_reorder(u16 *ustr, int len)
1e96b7ca1e8f17 Duane Griffin        2007-07-15  478  {
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  479  	int i;
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  480 =20
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  481  	for (i =3D 1; i < len=
; i++) {
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  482  		u8 cls =3D hfsplus_c=
ombining_class(ustr[i]);
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  483  		int j =3D i;
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  484 =20
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  485  		if (!cls)
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  486  			continue;
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  487 =20
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  488  		while (j > 0) {
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  489  			u8 prev_cls =3D hfs=
plus_combining_class(ustr[j - 1]);
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  490  			u16 tmp;
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  491 =20
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  492  			if (!prev_cls || pr=
ev_cls <=3D cls)
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  493  				break;
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  494 =20
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  495  			tmp =3D ustr[j];
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18 @496  			ustr[j] =3D ustr[j =
- 1];
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  497  			ustr[j - 1] =3D tmp;
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  498  			j--;
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  499  		}
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  500  	}
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  501  }
bbe5ebcbc006ac Viacheslav Dubeyko   2026-09-18  502 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
