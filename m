Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05B1F3FEC
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768668252; cv=none; b=Yf+uE2EI3pcCik5EdHZmf9fzVBA4m/mjRUL9c+AwWttfwbHXrhnQth1x4uMFp6edg9u9D70cWRLqJWnjVbJCUddCavmHvg9wxXpzRRbHgiHg/QshC8+uk7nfWECN3/g6anGHUfiQvZ7OdukxsEud1pAAPajsMoD1y13S94nE3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768668252; c=relaxed/simple;
	bh=1ovgbya3Nrbc6i5eGjJuj80LZV/XChRANrA+z87diFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nf/ynYgjaotGo7Exq8AhCO5bS4m+dBUwlEaCVm7fzQz+lKST6Zx8BvqfDMClWrOjzENCgU805rLU4c0G+l7OWgLuhMDVhhC4PJqWgsrbO1H22CDka2JpX1sls2Ouyi9R1Y/ZEcP+ijf5AfPEgjBns1XsAxXUdE3hXlDSIgE3WtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDNkLmqM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDNkLmqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768668249; x=1800204249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ovgbya3Nrbc6i5eGjJuj80LZV/XChRANrA+z87diFE=;
  b=mDNkLmqMGU2AO3JF/ds+hXjkP7zBG/s1Rjo4N2cyvA/UerOKuhhujNIT
   fxVzyWS2TKej+2ZjAEl3K5/9A0B7kZH5J+8pnBzPg/OnSwOCnEdbv/m/r
   f/d2s/UTwBCIzB3ufffcdo+rvjuVrkjEU7a6gp+c4x94OtZHYg7Oea6JA
   1Ipmuub6u4PCrrmmP7EG/zfpwHzwBmOXgu/PQvg2A4nrr/HfQFWLFygLM
   c3wDAMyOFhXOFwT0nk8orSUrLHA61iXV387ClEeKUiuoEzZlDfikESD5A
   621flZFBpx9XDVbWTFEbvlDem1fMpqpDi6hgMCCUQkdp2fqyvRlrppYd2
   A==;
X-CSE-ConnectionGUID: cAbH3rIlTd21IupRoENmzg==
X-CSE-MsgGUID: o1mIy6GBSK6sY9yuTJLQqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="81396469"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="81396469"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 08:44:09 -0800
X-CSE-ConnectionGUID: 9kKcElAZSxakUV1/A5+v7g==
X-CSE-MsgGUID: BzGaffvCQ3W7NzhH1lT4LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205292889"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jan 2026 08:44:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh9PA-00000000M2y-3odf;
	Sat, 17 Jan 2026 16:44:04 +0000
Date: Sun, 18 Jan 2026 00:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] x86/entry/vdso: fix filtering of vdso compiler
 flags
Message-ID: <202601180025.lLCHWiad-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260116204057.386268-3-hpa@zytor.com>
References: <20260116204057.386268-3-hpa@zytor.com>
TO: "H. Peter Anvin" <hpa@zytor.com>
TO: Thomas Gleixner <tglx@kernel.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Borislav Petkov <bp@alien8.de>
TO: Dave Hansen <dave.hansen@linux.intel.com>
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: x86@kernel.org
CC: Chris Mason <chris.mason@fusionio.com>
CC: Thorsten Leemhuis <linux@leemhuis.info>
CC: linux-kernel@vger.kernel.org

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on next-20260116]
[cannot apply to tip/auto-latest linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/H-Peter-Anvin/x86-entry-vdso-update-the-object-paths-for-make-vdso_install/20260117-044522
base:   tip/master
patch link:    https://lore.kernel.org/r/20260116204057.386268-3-hpa%40zytor.com
patch subject: [PATCH v2 2/3] x86/entry/vdso: fix filtering of vdso compiler flags
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20260118/202601180025.lLCHWiad-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180025.lLCHWiad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601180025.lLCHWiad-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:44,
                    from <command-line>:
   include/linux/compiler-context-analysis.h: In function '_context_unsafe_alias':
>> include/linux/compiler-context-analysis.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     237 | static inline void _context_unsafe_alias(void **p) { }
         | ^~~~~~
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from arch/x86/entry/vdso/vdso64/../common/vclock_gettime.c:11,
                    from arch/x86/entry/vdso/vdso64/vclock_gettime.c:1:
   include/linux/compiler.h: In function 'offset_to_ptr':
   include/linux/compiler.h:272:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     272 | {
         | ^
   In file included from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382:
   include/linux/kasan-checks.h: In function 'kasan_check_read':
   include/linux/kasan-checks.h:41:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
      41 | {
         | ^
   include/linux/kasan-checks.h: In function 'kasan_check_write':
   include/linux/kasan-checks.h:45:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
      45 | {
         | ^
   In file included from include/asm-generic/rwonce.h:27:
   include/linux/kcsan-checks.h: In function '__kcsan_check_access':
   include/linux/kcsan-checks.h:190:41: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     190 |                                         int type) { }
         |                                         ^~~
   include/linux/kcsan-checks.h: In function '__kcsan_mb':
   include/linux/kcsan-checks.h:192:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     192 | static inline void __kcsan_mb(void)                     { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function '__kcsan_wmb':
   include/linux/kcsan-checks.h:193:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     193 | static inline void __kcsan_wmb(void)                    { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function '__kcsan_rmb':
   include/linux/kcsan-checks.h:194:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     194 | static inline void __kcsan_rmb(void)                    { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function '__kcsan_release':
   include/linux/kcsan-checks.h:195:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     195 | static inline void __kcsan_release(void)                { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_disable_current':
   include/linux/kcsan-checks.h:196:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     196 | static inline void kcsan_disable_current(void)          { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_enable_current':
   include/linux/kcsan-checks.h:197:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     197 | static inline void kcsan_enable_current(void)           { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_enable_current_nowarn':
   include/linux/kcsan-checks.h:198:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     198 | static inline void kcsan_enable_current_nowarn(void)    { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_nestable_atomic_begin':
   include/linux/kcsan-checks.h:199:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     199 | static inline void kcsan_nestable_atomic_begin(void)    { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_nestable_atomic_end':
   include/linux/kcsan-checks.h:200:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     200 | static inline void kcsan_nestable_atomic_end(void)      { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_flat_atomic_begin':
   include/linux/kcsan-checks.h:201:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     201 | static inline void kcsan_flat_atomic_begin(void)        { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_flat_atomic_end':
   include/linux/kcsan-checks.h:202:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     202 | static inline void kcsan_flat_atomic_end(void)          { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_atomic_next':
   include/linux/kcsan-checks.h:203:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     203 | static inline void kcsan_atomic_next(int n)             { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_set_access_mask':
   include/linux/kcsan-checks.h:204:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     204 | static inline void kcsan_set_access_mask(unsigned long mask) { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_begin_scoped_access':
   include/linux/kcsan-checks.h:210:34: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     210 |                           struct kcsan_scoped_access *sa) { return sa; }
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_end_scoped_access':
   include/linux/kcsan-checks.h:211:51: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     211 | static inline void kcsan_end_scoped_access(struct kcsan_scoped_access *sa) { }
         |                                                   ^~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_check_access':
   include/linux/kcsan-checks.h:230:39: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     230 |                                       int type) { }
         |                                       ^~~
   include/linux/kcsan-checks.h: In function '__kcsan_enable_current':
   include/linux/kcsan-checks.h:231:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     231 | static inline void __kcsan_enable_current(void)  { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function '__kcsan_disable_current':
   include/linux/kcsan-checks.h:232:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
--
   include/linux/find.h: In function 'find_first_bit':
   include/linux/find.h:207:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     207 | {
         | ^
   include/linux/find.h: In function 'find_nth_bit':
   include/linux/find.h:233:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     233 | {
         | ^
   include/linux/find.h: In function 'find_nth_and_bit':
   include/linux/find.h:259:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     259 | {
         | ^
   include/linux/find.h: In function 'find_nth_and_andnot_bit':
   include/linux/find.h:289:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     289 | {
         | ^
   include/linux/find.h: In function 'find_first_and_bit':
   include/linux/find.h:316:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     316 | {
         | ^
   include/linux/find.h: In function 'find_first_andnot_bit':
   include/linux/find.h:340:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     340 | {
         | ^
   include/linux/find.h: In function 'find_first_and_and_bit':
   include/linux/find.h:365:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     365 | {
         | ^
   include/linux/find.h: In function 'find_first_zero_bit':
   include/linux/find.h:386:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     386 | {
         | ^
   include/linux/find.h: In function 'find_last_bit':
   include/linux/find.h:407:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     407 | {
         | ^
   include/linux/find.h: In function 'find_next_and_bit_wrap':
   include/linux/find.h:432:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     432 | {
         | ^
   include/linux/find.h: In function 'find_next_bit_wrap':
   include/linux/find.h:454:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     454 | {
         | ^
   include/linux/find.h: In function '__for_each_wrap':
   include/linux/find.h:471:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     471 | {
         | ^
   include/linux/find.h: In function 'find_next_zero_bit_le':
   include/linux/find.h:511:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     511 | {
         | ^
   include/linux/find.h: In function 'find_next_bit_le':
   include/linux/find.h:517:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     517 | {
         | ^
   include/linux/find.h: In function 'find_first_zero_bit_le':
   include/linux/find.h:523:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     523 | {
         | ^
   In file included from include/linux/bitmap.h:13:
   include/linux/string.h: In function 'memdup_array_user':
   include/linux/string.h:33:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
      33 | {
         | ^
   include/linux/string.h: In function 'vmemdup_array_user':
   include/linux/string.h:53:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
      53 | {
         | ^
   include/linux/string.h: In function 'strstrip':
   include/linux/string.h:190:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     190 | {
         | ^
   include/linux/string.h: In function 'memset_l':
   include/linux/string.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     237 | {
         | ^
   include/linux/string.h: In function 'memset_p':
   include/linux/string.h:245:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     245 | {
         | ^
   include/linux/string.h: In function 'mem_is_zero':
   include/linux/string.h:295:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     295 | {
         | ^
   include/linux/string.h: In function '__free_argv_free':
   include/linux/string.h:316:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     316 | DEFINE_FREE(argv_free, char **, if (!IS_ERR_OR_NULL(_T)) argv_free(_T))
         | ^~~~~~~~~~~
   include/linux/string.h: In function 'memzero_explicit':
   include/linux/string.h:365:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     365 | {
         | ^
   include/linux/string.h: In function 'kbasename':
   include/linux/string.h:380:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     380 | {
         | ^
   In file included from include/linux/fortify-string.h:5,
                    from include/linux/string.h:386:
   include/linux/bitfield.h: In function 'field_multiplier':
>> include/linux/bitfield.h:202:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     202 | {
         | ^
   include/linux/bitfield.h: In function 'field_mask':
   include/linux/bitfield.h:208:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     208 | {
         | ^
   include/linux/bitfield.h: In function 'u8_encode_bits':
   include/linux/bitfield.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     237 | ____MAKE_OP(u8,u8,,)
         | ^~~~~~~~~~~
   include/linux/bitfield.h: In function 'u8_replace_bits':
   include/linux/bitfield.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u8p_replace_bits':
   include/linux/bitfield.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u8_get_bits':
   include/linux/bitfield.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le16_encode_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     238 | __MAKE_OP(16)
         | ^~~~~~~~~
   include/linux/bitfield.h: In function 'le16_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le16p_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le16_get_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be16_encode_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be16_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be16p_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be16_get_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u16_encode_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u16_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u16p_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u16_get_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le32_encode_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     239 | __MAKE_OP(32)
         | ^~~~~~~~~
   include/linux/bitfield.h: In function 'le32_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le32p_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le32_get_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be32_encode_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be32_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be32p_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be32_get_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u32_encode_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u32_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u32p_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u32_get_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le64_encode_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     240 | __MAKE_OP(64)
         | ^~~~~~~~~
   include/linux/bitfield.h: In function 'le64_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le64p_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le64_get_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be64_encode_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be64_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be64p_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be64_get_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u64_encode_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u64_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u64p_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u64_get_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/fortify-string.h: In function 'strncpy':
   include/linux/fortify-string.h:198:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     198 | {
         | ^
   include/linux/fortify-string.h: In function 'strnlen':
   include/linux/fortify-string.h:220:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
..


vim +237 include/linux/compiler-context-analysis.h

3269701cb25662 Marco Elver 2025-12-19  221  
3269701cb25662 Marco Elver 2025-12-19  222  /**
3269701cb25662 Marco Elver 2025-12-19  223   * context_unsafe_alias() - helper to insert a context lock "alias barrier"
3269701cb25662 Marco Elver 2025-12-19  224   * @p: pointer aliasing a context lock or object containing context locks
3269701cb25662 Marco Elver 2025-12-19  225   *
3269701cb25662 Marco Elver 2025-12-19  226   * No-op function that acts as a "context lock alias barrier", where the
3269701cb25662 Marco Elver 2025-12-19  227   * analysis rightfully detects that we're switching aliases, but the switch is
3269701cb25662 Marco Elver 2025-12-19  228   * considered safe but beyond the analysis reasoning abilities.
3269701cb25662 Marco Elver 2025-12-19  229   *
3269701cb25662 Marco Elver 2025-12-19  230   * This should be inserted before the first use of such an alias.
3269701cb25662 Marco Elver 2025-12-19  231   *
3269701cb25662 Marco Elver 2025-12-19  232   * Implementation Note: The compiler ignores aliases that may be reassigned but
3269701cb25662 Marco Elver 2025-12-19  233   * their value cannot be determined (e.g. when passing a non-const pointer to an
3269701cb25662 Marco Elver 2025-12-19  234   * alias as a function argument).
3269701cb25662 Marco Elver 2025-12-19  235   */
3269701cb25662 Marco Elver 2025-12-19  236  #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
3269701cb25662 Marco Elver 2025-12-19 @237  static inline void _context_unsafe_alias(void **p) { }
3269701cb25662 Marco Elver 2025-12-19  238  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
