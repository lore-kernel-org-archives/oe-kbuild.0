Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC49A59
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 00:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765756916; cv=none; b=NcUurlWWctHWY3Jk08MjEzlrtNugSTP/cPzqqXntdbJ4Qh2I3uZfAPV2ia2SYaRAFqX94TtocFbzgxCyab1af6e0JyyvarPJoflFqzUk+3dLnVbypkkSgOXRK2oglCU1YHDJKyLXjy7wW2Fh5SMfNGYaevCTJ0pp/UcDYlx65TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765756916; c=relaxed/simple;
	bh=YfP2k4hpK00SNsNjiEnn1DfjzXRnK+sZ4mDL6OwWDbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d7cXxAsoZ1lx94gTz0p1Nk3gCPWEwxm+KkemrNedZZ5HS2bNrBHHRXscCP6XJjyFWf33zU1RO+d6h0R5eK/AYVh0zuvBHwIWc8JMYGWmHn81zg4IzmjTgs/uUPtWX+UzD+Wumu2/8Y++r3KseK4yjh0NUTUH5BkkEpZvIhF/o44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTHU4sLO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTHU4sLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765756914; x=1797292914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YfP2k4hpK00SNsNjiEnn1DfjzXRnK+sZ4mDL6OwWDbg=;
  b=gTHU4sLOFeUdpfZYQGxOeOzCcTNp3IyRbsctzpK5wKyeS2L3Dkm+0Kfu
   ru1q8y38p/U9S572WDKWV+bb4D2HVYUFJmlTZRZ2pSpMQKV1KEQ9VEQLE
   OUT9eTNSCzLdONyCJ9faj5pT7+FEEwkqhpLZIwWh/T00KYAJgn1viENni
   ktvTuntKyLCBSFbmVeL+ROQeqWQpauG+axd1VQx6XrsDH9Ae9em4cCrXa
   hUmvpTlIKMZQFCBtsuXZ3tzzp0PWpDXcL48rUoaDBbTwJWzLKJNDxTUj7
   qJkDeuTWhxlQDRXoSmDkphepa2Dqgbcz/I0qoh9LkFVMB0k4cSaLYOlNa
   A==;
X-CSE-ConnectionGUID: V/gKxaiLTfqy7xvyxpsIGw==
X-CSE-MsgGUID: UIg0YqkxR76IP0VqqrP+oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67545058"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67545058"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 16:01:54 -0800
X-CSE-ConnectionGUID: 7CpqHeqSQ7m9RmjtoiVrSA==
X-CSE-MsgGUID: nNjRCEoWRxewjjTE6SJyRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197869174"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Dec 2025 16:01:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUw2A-000000009Vn-1nwi;
	Mon, 15 Dec 2025 00:01:50 +0000
Date: Mon, 15 Dec 2025 08:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/zstd/compress/zstd_double_fast.c:664
 ZSTD_compressBlock_doubleFast_extDict_generic() warn: maybe use && instead
 of &
Message-ID: <202512150714.XULemvYO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nick Terrell <terrelln@meta.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   9 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150714.XULemvYO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512150714.XULemvYO-lkp@intel.com/

New smatch warnings:
lib/zstd/compress/zstd_double_fast.c:664 ZSTD_compressBlock_doubleFast_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_fast.c:944 ZSTD_compressBlock_fast_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_fast.c:944 ZSTD_compressBlock_fast_extDict_generic() warn: maybe use && instead of &

Old smatch warnings:
lib/zstd/compress/zstd_double_fast.c:732 ZSTD_compressBlock_doubleFast_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_fast.c:291 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:316 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:291 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:316 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting

vim +664 lib/zstd/compress/zstd_double_fast.c

e0c1b49f5b674c Nick Terrell 2020-09-11  607  
e0c1b49f5b674c Nick Terrell 2020-09-11  608  
65d1f5507ed2c7 Nick Terrell 2025-03-08  609  static
65d1f5507ed2c7 Nick Terrell 2025-03-08  610  ZSTD_ALLOW_POINTER_OVERFLOW_ATTR
65d1f5507ed2c7 Nick Terrell 2025-03-08  611  size_t ZSTD_compressBlock_doubleFast_extDict_generic(
65d1f5507ed2c7 Nick Terrell 2025-03-08  612          ZSTD_MatchState_t* ms, SeqStore_t* seqStore, U32 rep[ZSTD_REP_NUM],
e0c1b49f5b674c Nick Terrell 2020-09-11  613          void const* src, size_t srcSize,
e0c1b49f5b674c Nick Terrell 2020-09-11  614          U32 const mls /* template */)
e0c1b49f5b674c Nick Terrell 2020-09-11  615  {
e0c1b49f5b674c Nick Terrell 2020-09-11  616      ZSTD_compressionParameters const* cParams = &ms->cParams;
e0c1b49f5b674c Nick Terrell 2020-09-11  617      U32* const hashLong = ms->hashTable;
e0c1b49f5b674c Nick Terrell 2020-09-11  618      U32  const hBitsL = cParams->hashLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  619      U32* const hashSmall = ms->chainTable;
e0c1b49f5b674c Nick Terrell 2020-09-11  620      U32  const hBitsS = cParams->chainLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  621      const BYTE* const istart = (const BYTE*)src;
e0c1b49f5b674c Nick Terrell 2020-09-11  622      const BYTE* ip = istart;
e0c1b49f5b674c Nick Terrell 2020-09-11  623      const BYTE* anchor = istart;
e0c1b49f5b674c Nick Terrell 2020-09-11  624      const BYTE* const iend = istart + srcSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  625      const BYTE* const ilimit = iend - 8;
e0c1b49f5b674c Nick Terrell 2020-09-11  626      const BYTE* const base = ms->window.base;
e0c1b49f5b674c Nick Terrell 2020-09-11  627      const U32   endIndex = (U32)((size_t)(istart - base) + srcSize);
e0c1b49f5b674c Nick Terrell 2020-09-11  628      const U32   lowLimit = ZSTD_getLowestMatchIndex(ms, endIndex, cParams->windowLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  629      const U32   dictStartIndex = lowLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  630      const U32   dictLimit = ms->window.dictLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  631      const U32   prefixStartIndex = (dictLimit > lowLimit) ? dictLimit : lowLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  632      const BYTE* const prefixStart = base + prefixStartIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  633      const BYTE* const dictBase = ms->window.dictBase;
e0c1b49f5b674c Nick Terrell 2020-09-11  634      const BYTE* const dictStart = dictBase + dictStartIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  635      const BYTE* const dictEnd = dictBase + prefixStartIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  636      U32 offset_1=rep[0], offset_2=rep[1];
e0c1b49f5b674c Nick Terrell 2020-09-11  637  
e0c1b49f5b674c Nick Terrell 2020-09-11  638      DEBUGLOG(5, "ZSTD_compressBlock_doubleFast_extDict_generic (srcSize=%zu)", srcSize);
e0c1b49f5b674c Nick Terrell 2020-09-11  639  
e0c1b49f5b674c Nick Terrell 2020-09-11  640      /* if extDict is invalidated due to maxDistance, switch to "regular" variant */
e0c1b49f5b674c Nick Terrell 2020-09-11  641      if (prefixStartIndex == dictStartIndex)
2aa14b1ab2c41a Nick Terrell 2022-10-17  642          return ZSTD_compressBlock_doubleFast(ms, seqStore, rep, src, srcSize);
e0c1b49f5b674c Nick Terrell 2020-09-11  643  
e0c1b49f5b674c Nick Terrell 2020-09-11  644      /* Search Loop */
e0c1b49f5b674c Nick Terrell 2020-09-11  645      while (ip < ilimit) {  /* < instead of <=, because (ip+1) */
e0c1b49f5b674c Nick Terrell 2020-09-11  646          const size_t hSmall = ZSTD_hashPtr(ip, hBitsS, mls);
e0c1b49f5b674c Nick Terrell 2020-09-11  647          const U32 matchIndex = hashSmall[hSmall];
e0c1b49f5b674c Nick Terrell 2020-09-11  648          const BYTE* const matchBase = matchIndex < prefixStartIndex ? dictBase : base;
e0c1b49f5b674c Nick Terrell 2020-09-11  649          const BYTE* match = matchBase + matchIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  650  
e0c1b49f5b674c Nick Terrell 2020-09-11  651          const size_t hLong = ZSTD_hashPtr(ip, hBitsL, 8);
e0c1b49f5b674c Nick Terrell 2020-09-11  652          const U32 matchLongIndex = hashLong[hLong];
e0c1b49f5b674c Nick Terrell 2020-09-11  653          const BYTE* const matchLongBase = matchLongIndex < prefixStartIndex ? dictBase : base;
e0c1b49f5b674c Nick Terrell 2020-09-11  654          const BYTE* matchLong = matchLongBase + matchLongIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  655  
e0c1b49f5b674c Nick Terrell 2020-09-11  656          const U32 curr = (U32)(ip-base);
e0c1b49f5b674c Nick Terrell 2020-09-11  657          const U32 repIndex = curr + 1 - offset_1;   /* offset_1 expected <= curr +1 */
e0c1b49f5b674c Nick Terrell 2020-09-11  658          const BYTE* const repBase = repIndex < prefixStartIndex ? dictBase : base;
e0c1b49f5b674c Nick Terrell 2020-09-11  659          const BYTE* const repMatch = repBase + repIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  660          size_t mLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  661          hashSmall[hSmall] = hashLong[hLong] = curr;   /* update hash table */
e0c1b49f5b674c Nick Terrell 2020-09-11  662  
65d1f5507ed2c7 Nick Terrell 2025-03-08  663          if (((ZSTD_index_overlap_check(prefixStartIndex, repIndex))
2aa14b1ab2c41a Nick Terrell 2022-10-17 @664              & (offset_1 <= curr+1 - dictStartIndex)) /* note: we are searching at curr+1 */
e0c1b49f5b674c Nick Terrell 2020-09-11  665            && (MEM_read32(repMatch) == MEM_read32(ip+1)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  666              const BYTE* repMatchEnd = repIndex < prefixStartIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  667              mLength = ZSTD_count_2segments(ip+1+4, repMatch+4, iend, repMatchEnd, prefixStart) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  668              ip++;
65d1f5507ed2c7 Nick Terrell 2025-03-08  669              ZSTD_storeSeq(seqStore, (size_t)(ip-anchor), anchor, iend, REPCODE1_TO_OFFBASE, mLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  670          } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  671              if ((matchLongIndex > dictStartIndex) && (MEM_read64(matchLong) == MEM_read64(ip))) {
e0c1b49f5b674c Nick Terrell 2020-09-11  672                  const BYTE* const matchEnd = matchLongIndex < prefixStartIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  673                  const BYTE* const lowMatchPtr = matchLongIndex < prefixStartIndex ? dictStart : prefixStart;
e0c1b49f5b674c Nick Terrell 2020-09-11  674                  U32 offset;
e0c1b49f5b674c Nick Terrell 2020-09-11  675                  mLength = ZSTD_count_2segments(ip+8, matchLong+8, iend, matchEnd, prefixStart) + 8;
e0c1b49f5b674c Nick Terrell 2020-09-11  676                  offset = curr - matchLongIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  677                  while (((ip>anchor) & (matchLong>lowMatchPtr)) && (ip[-1] == matchLong[-1])) { ip--; matchLong--; mLength++; }   /* catch up */
e0c1b49f5b674c Nick Terrell 2020-09-11  678                  offset_2 = offset_1;
e0c1b49f5b674c Nick Terrell 2020-09-11  679                  offset_1 = offset;
65d1f5507ed2c7 Nick Terrell 2025-03-08  680                  ZSTD_storeSeq(seqStore, (size_t)(ip-anchor), anchor, iend, OFFSET_TO_OFFBASE(offset), mLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  681  
e0c1b49f5b674c Nick Terrell 2020-09-11  682              } else if ((matchIndex > dictStartIndex) && (MEM_read32(match) == MEM_read32(ip))) {
e0c1b49f5b674c Nick Terrell 2020-09-11  683                  size_t const h3 = ZSTD_hashPtr(ip+1, hBitsL, 8);
e0c1b49f5b674c Nick Terrell 2020-09-11  684                  U32 const matchIndex3 = hashLong[h3];
e0c1b49f5b674c Nick Terrell 2020-09-11  685                  const BYTE* const match3Base = matchIndex3 < prefixStartIndex ? dictBase : base;
e0c1b49f5b674c Nick Terrell 2020-09-11  686                  const BYTE* match3 = match3Base + matchIndex3;
e0c1b49f5b674c Nick Terrell 2020-09-11  687                  U32 offset;
e0c1b49f5b674c Nick Terrell 2020-09-11  688                  hashLong[h3] = curr + 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  689                  if ( (matchIndex3 > dictStartIndex) && (MEM_read64(match3) == MEM_read64(ip+1)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  690                      const BYTE* const matchEnd = matchIndex3 < prefixStartIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  691                      const BYTE* const lowMatchPtr = matchIndex3 < prefixStartIndex ? dictStart : prefixStart;
e0c1b49f5b674c Nick Terrell 2020-09-11  692                      mLength = ZSTD_count_2segments(ip+9, match3+8, iend, matchEnd, prefixStart) + 8;
e0c1b49f5b674c Nick Terrell 2020-09-11  693                      ip++;
e0c1b49f5b674c Nick Terrell 2020-09-11  694                      offset = curr+1 - matchIndex3;
e0c1b49f5b674c Nick Terrell 2020-09-11  695                      while (((ip>anchor) & (match3>lowMatchPtr)) && (ip[-1] == match3[-1])) { ip--; match3--; mLength++; } /* catch up */
e0c1b49f5b674c Nick Terrell 2020-09-11  696                  } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  697                      const BYTE* const matchEnd = matchIndex < prefixStartIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  698                      const BYTE* const lowMatchPtr = matchIndex < prefixStartIndex ? dictStart : prefixStart;
e0c1b49f5b674c Nick Terrell 2020-09-11  699                      mLength = ZSTD_count_2segments(ip+4, match+4, iend, matchEnd, prefixStart) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  700                      offset = curr - matchIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  701                      while (((ip>anchor) & (match>lowMatchPtr)) && (ip[-1] == match[-1])) { ip--; match--; mLength++; }   /* catch up */
e0c1b49f5b674c Nick Terrell 2020-09-11  702                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  703                  offset_2 = offset_1;
e0c1b49f5b674c Nick Terrell 2020-09-11  704                  offset_1 = offset;
65d1f5507ed2c7 Nick Terrell 2025-03-08  705                  ZSTD_storeSeq(seqStore, (size_t)(ip-anchor), anchor, iend, OFFSET_TO_OFFBASE(offset), mLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  706  
e0c1b49f5b674c Nick Terrell 2020-09-11  707              } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  708                  ip += ((ip-anchor) >> kSearchStrength) + 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  709                  continue;
e0c1b49f5b674c Nick Terrell 2020-09-11  710          }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  711  
e0c1b49f5b674c Nick Terrell 2020-09-11  712          /* move to next sequence start */
e0c1b49f5b674c Nick Terrell 2020-09-11  713          ip += mLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  714          anchor = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  715  
e0c1b49f5b674c Nick Terrell 2020-09-11  716          if (ip <= ilimit) {
e0c1b49f5b674c Nick Terrell 2020-09-11  717              /* Complementary insertion */
e0c1b49f5b674c Nick Terrell 2020-09-11  718              /* done after iLimit test, as candidates could be > iend-8 */
e0c1b49f5b674c Nick Terrell 2020-09-11  719              {   U32 const indexToInsert = curr+2;
e0c1b49f5b674c Nick Terrell 2020-09-11  720                  hashLong[ZSTD_hashPtr(base+indexToInsert, hBitsL, 8)] = indexToInsert;
e0c1b49f5b674c Nick Terrell 2020-09-11  721                  hashLong[ZSTD_hashPtr(ip-2, hBitsL, 8)] = (U32)(ip-2-base);
e0c1b49f5b674c Nick Terrell 2020-09-11  722                  hashSmall[ZSTD_hashPtr(base+indexToInsert, hBitsS, mls)] = indexToInsert;
e0c1b49f5b674c Nick Terrell 2020-09-11  723                  hashSmall[ZSTD_hashPtr(ip-1, hBitsS, mls)] = (U32)(ip-1-base);
e0c1b49f5b674c Nick Terrell 2020-09-11  724              }
e0c1b49f5b674c Nick Terrell 2020-09-11  725  
e0c1b49f5b674c Nick Terrell 2020-09-11  726              /* check immediate repcode */
e0c1b49f5b674c Nick Terrell 2020-09-11  727              while (ip <= ilimit) {
e0c1b49f5b674c Nick Terrell 2020-09-11  728                  U32 const current2 = (U32)(ip-base);
e0c1b49f5b674c Nick Terrell 2020-09-11  729                  U32 const repIndex2 = current2 - offset_2;
e0c1b49f5b674c Nick Terrell 2020-09-11  730                  const BYTE* repMatch2 = repIndex2 < prefixStartIndex ? dictBase + repIndex2 : base + repIndex2;
65d1f5507ed2c7 Nick Terrell 2025-03-08  731                  if ( ((ZSTD_index_overlap_check(prefixStartIndex, repIndex2))
2aa14b1ab2c41a Nick Terrell 2022-10-17  732                      & (offset_2 <= current2 - dictStartIndex))
e0c1b49f5b674c Nick Terrell 2020-09-11  733                    && (MEM_read32(repMatch2) == MEM_read32(ip)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  734                      const BYTE* const repEnd2 = repIndex2 < prefixStartIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  735                      size_t const repLength2 = ZSTD_count_2segments(ip+4, repMatch2+4, iend, repEnd2, prefixStart) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  736                      U32 const tmpOffset = offset_2; offset_2 = offset_1; offset_1 = tmpOffset;   /* swap offset_2 <=> offset_1 */
65d1f5507ed2c7 Nick Terrell 2025-03-08  737                      ZSTD_storeSeq(seqStore, 0, anchor, iend, REPCODE1_TO_OFFBASE, repLength2);
e0c1b49f5b674c Nick Terrell 2020-09-11  738                      hashSmall[ZSTD_hashPtr(ip, hBitsS, mls)] = current2;
e0c1b49f5b674c Nick Terrell 2020-09-11  739                      hashLong[ZSTD_hashPtr(ip, hBitsL, 8)] = current2;
e0c1b49f5b674c Nick Terrell 2020-09-11  740                      ip += repLength2;
e0c1b49f5b674c Nick Terrell 2020-09-11  741                      anchor = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  742                      continue;
e0c1b49f5b674c Nick Terrell 2020-09-11  743                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  744                  break;
e0c1b49f5b674c Nick Terrell 2020-09-11  745      }   }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  746  
e0c1b49f5b674c Nick Terrell 2020-09-11  747      /* save reps for next block */
e0c1b49f5b674c Nick Terrell 2020-09-11  748      rep[0] = offset_1;
e0c1b49f5b674c Nick Terrell 2020-09-11  749      rep[1] = offset_2;
e0c1b49f5b674c Nick Terrell 2020-09-11  750  
e0c1b49f5b674c Nick Terrell 2020-09-11  751      /* Return the last literals size */
e0c1b49f5b674c Nick Terrell 2020-09-11  752      return (size_t)(iend - anchor);
e0c1b49f5b674c Nick Terrell 2020-09-11  753  }
e0c1b49f5b674c Nick Terrell 2020-09-11  754  

:::::: The code at line 664 was first introduced by commit
:::::: 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f zstd: import usptream v1.5.2

:::::: TO: Nick Terrell <terrelln@fb.com>
:::::: CC: Nick Terrell <terrelln@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
