Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600981;
	b=o8UL5PCjdEhKuEWWY8PK4Ff/M++KbsVgEsKqthDNEQ56E97dnvYAxqs9Cfy/UbypJKHO
	 zLd6TtIFTm6fxy3JJU/7y4oelNEMlraQ/XWzQo0q295/VToMvmAr2Dc+dt4nbhiQJlvH+
	 32drVouU0pdcfBNJK3T2aDCDMixbemdbBEz0Uk0YuOhR0j5y7oo59z/Q6pE13F/xNpviX
	 3ET6pY8yY4LV1BPjdnkYp8x1uEgtOJtrzbur+jISr3M0/rmiKwbvaBRHveZkKjm/r1s9K
	 XOzsqphswwncFVb7HZzBhLk0EiPM6L1Nnh6blmkHlfdMVUo/bRc19VdGqpbHJTSskqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600981;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EzlSnJ1dpSit82xeAz1r9+bSBPbI93uZ+XqwBJLcFew=;
	b=UTtNrPgIP/FtcG1KsI30NLGSDQLoyfytJdRDRIddiM9S3KX9p9I0gRc/lXOIyy2TbuPj
	 jybZVuUnJyHf0fUrfa5kYDBRMcPvsS8gwfJOXasnTfGSAPFutEG+wPh4fEnpwqP/z47fv
	 ZIEWbAPYUJ+4wVBmxSZMZMzNpwH0oC/Jt+ev34fHUfTFXfRSrFVxNHybQxNelylYMk3IN
	 P6mBCxijj1pxWE5ECOxzz4q5qpELyIGOcb88tvqeVgn4yNh8hm4zBgdRUuxOTPtAeUHpp
	 VPHT7DI/GPdouPNsuXFA4Ni99odxvdpkxdwjSlvmMLWmde8thwb6RObJdQHdQt4I+Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VfxEV7Nc;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702AB606A321
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 10:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 702AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VfxEV7Nc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795600981; x=1827136981;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G4teWzOL/xze5636ImP29c2rYif/nJU5gYcSkKseDcY=;
  b=VfxEV7Nc6qluuZ5+hbiH2cNhjf2zGzK5rAIzOgG7VfaMVFqBxwPd7SKc
   JscjplQyrcP2VYMHvYpwioaMse2J3UBf24qM+7n4rbNeGEPtQnS9/6r5o
   vJ8JzncTCuN//mQ5ksXZ905PRk5+vIMPEbTWGstfIvSzSyTyZaz9YYf4/
   AzR762HnB3vBgAOlAaPwuR80ECR3xzXFMFv6gsPZc/QGGH4FrzH9c78lO
   HQKqwUuhCHYbj5LlBVjhN21jUwGNyfDtSeql/HcMta/mCyxqG92N8tqX+
   84M9tYVILBrtPSgySshoy4y4B6k+8Oux315wIyAplu2rWHhjXObWl3ox5
   Q==;
X-CSE-ConnectionGUID: tMj5M9zARsu4ej0PvYP7uA==
X-CSE-MsgGUID: V0HOZgG8Ry6Fk04VXVdtwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4532670"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4532670"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 01:56:54 -0800
X-CSE-ConnectionGUID: 5/L7NNCsSsiPS/SPsylirA==
X-CSE-MsgGUID: SvM3v6iKSTaTlkSs/Ecl6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11802522"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 01:56:35 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW9jr-0000000006Z-1Cyx;
	Wed, 25 Nov 2026 09:56:31 +0000
Date: Wed, 25 Nov 2026 10:55:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: {standard input}: Error: open CFI at the end of file;
 missing .cfi_endproc directive
Message-ID: <20261125104958.PWmWlqW7-lkp@intel.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "too many reports for this commit"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

Hi Marco,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4dce97c6c265544342e716e62fd24bbb232590c5
commit: 0fc1bd38a19c108395d8338fb034f90c2d3fbe55 slab: improve KMALLOC_PART=
ITION_RANDOM randomness
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: csky-randconfig-2000-20261125 (https://download.01.org/0day-ci/arch=
ive/20261125/20261125104958.PWmWlqW7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261125/20261125104958.PWmWlqW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 0fc1bd38a19c ("slab: improve KMALLOC_PARTITION_RANDOM randomness")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261125104958.PWmWlqW7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/regmap/regmap-debugfs.c: In function 'regmap_debugfs_get_du=
mp_start':
   drivers/base/regmap/regmap-debugfs.c:180:1: error: could not split insn
     180 | }
         | ^
   (insn 107 354 543 (set (reg:SI 3 a3 [orig:275 _109 ] [275])
           (xor:SI (reg:SI 2 a2 [orig:276 random_kmalloc_seed ] [276])
               (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x18=
2])
                       (const_int 1 [0x1]))))) "include/linux/slab.h":698:5=
2 288 {cskyv2_xorsi3}
        (expr_list:REG_DEAD (reg:SI 2 a2 [orig:276 random_kmalloc_seed ] [2=
76])
           (nil)))
   during RTL pass: final
   drivers/base/regmap/regmap-debugfs.c:180:1: internal compiler error: in =
final_scan_insn_1, at final.cc:2823
   0x7f7c825b4d64 __libc_start_main
   	???:0
   ../lib/gcc/csky-linux/16.2.0/ -D __KERNEL__ -D KBUILD_EXTRA_WARN1 -D CSK=
YCPU_DEF_NAME=3D"ck807f" -D KBUILD_MODFILE=3D"drivers/base/regmap/regmap-de=
bugfs" -D KBUILD_BASENAME=3D"regmap_debugfs" -D KBUILD_MODNAME=3D"regmap_de=
bugfs" -D __KBUILD_MODNAME=3Dregmap_debugfs -include include/linux/compiler=
-version.h -include include/linux/kconfig.h -include include/linux/compiler=
_types.h -MMD drivers/base/regmap/.regmap-debugfs.o.d drivers/base/regmap/r=
egmap-debugfs.c -quiet -dumpdir drivers/base/regmap/ -dumpbase regmap-debug=
fs.c -dumpbase-ext .c -mlittle-endian -mcpu=3Dck807 -mfloat-abi=3Dsoft -mdi=
v -mno-stack-size -g -gdwarf-5 -gz=3Dzlib -Os -Wall -Wextra -Werror=3Dimpli=
cit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werr=
or=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-addre=
ss -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototype=
s -Wno-main -Wno-type-limits -Wdangling-pointer=3D0 -Wvla-larger-than=3D1 -=
Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initializati=
on -Warray-bounds=3D0 -Wstringop-overflow=3D0 -Walloc-size-larger-than=3D18=
446744073709551615EiB -Wimplicit-fallthrough=3D5 -Werror=3Ddate-time -Werro=
r=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wenum-conversion =
-Wunused -Wsuggest-attribute=3Dformat -Wmissing-include-dirs -Wunused-const=
-variable=3D2 -Wno-missing-field-initializers -Wno-shift-negative-value -Wn=
o-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -Wno-error=3Dr=
eturn-type -Wreturn-type -Wundef -std=3Dgnu11 -fmacro-prefix-map=3D=3D -fsh=
ort-wchar -fno-common -fno-PIE -fno-strict-aliasing -fms-extensions -fno-tr=
ee-vectorize -fno-delete-null-pointer-checks -fno-allow-store-data-races -f=
no-reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining -fno-stack-protec=
tor -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fzero-init-padding=
-bits=3Dall -fno-stack-clash-protection -fdiagnostics-show-context=3D2 -fno=
-inline-functions-called-once -fstrict-flex-arrays=3D3 -fno-strict-overflow=
 -fstack-check=3Dno -fconserve-stack -fno-builtin-wcslen -fno-var-tracking =
-femit-struct-debug-baseonly -funsigned-char -falign-functions=3D64 -o -
   Please submit a full bug report, with preprocessed source (by using -fre=
port-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
   Assembler messages:
>> {standard input}: Error: open CFI at the end of file; missing .cfi_endpr=
oc directive

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
