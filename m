Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A98224FA
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Aug 2024 14:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724510049; cv=none; b=SSG8rU4uMBBXC0tq4XbSumDMdGj7CN+5UOlV5iljs7SCMrFkxnFhU21QLMBasW/DISS64jUy0CjeFV51JIeABubbPWM4QGsMvV/xcM8OovOH2NqWzTEzK5Le7osLw5VlPvjBT1LNVgX+x/daymOazDNg97+pD5B1YQVijJLkC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724510049; c=relaxed/simple;
	bh=nTSHQCTC4QpWxD3H/IyZ1jf9iq3h2hsYxB+FLbzStyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VlPI5xkn/kS6j4ea2Box8Sm0J2hma5imgWkwy1q0hKEcbzJJGulIyHEfjMzHTaJeyej3omM3sVFM8vlEmpO7Mlv3QvQDIX5RA/Z/r3dDSTraBGDgAAKuJWlMb0E+ejdejzZ1n00bVIezv70EB7rUvdSx+PbmoV+Slx2SctqTZ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKiCuMqC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKiCuMqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724510048; x=1756046048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nTSHQCTC4QpWxD3H/IyZ1jf9iq3h2hsYxB+FLbzStyU=;
  b=SKiCuMqCB2HVQrCMYQYs8dqA1d5QYQ+ejMLuYmF6b6uWHEAxwcawYh/2
   yviAQtGfcbe8rmLb13RtjD+boevXsGMhHonOig7MjKmU6JrFetEq+JeZb
   zgUZ5WhbBVknDX8H1170Ik7Y5wqBf6Hjom9L2TV/PsK/bNi2glVUW73xh
   M4aOrqH+blD57uymmQZMzwMTM85j4XBSQeGTr+LCVnmEe2Pkmk5h+Y7fB
   0kKeq3guJIFv9GY/x0YAJgfRMzNvHiH8G66QCXdlN39Pm3SjL+7V+BmFo
   ElZ0zzKqYw+8o75aLFEmgMmopfmI1qbj4F39RZE3CSTfM2Hbd8RIgs9dJ
   w==;
X-CSE-ConnectionGUID: pzJdwQmuRlyDwUvRKYectw==
X-CSE-MsgGUID: AZ491+GnQfm6sQFgdPQy9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="25872017"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="25872017"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 07:34:07 -0700
X-CSE-ConnectionGUID: Fd/wtrIMTCGLKX0HjZvB0A==
X-CSE-MsgGUID: tO522Bw+Qp+p+YLbJz6nlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="62138050"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Aug 2024 07:34:06 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shrq7-000EXg-2b;
	Sat, 24 Aug 2024 14:34:03 +0000
Date: Sat, 24 Aug 2024 22:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paragon-software-group-ntfs3:master 2/16]
 fs/ntfs3/lib/lzx_decompress.c:555 lzx_decompress_block() error:
 uninitialized symbol 'match_offset'.
Message-ID: <202408242247.tSSqBPqy-lkp@intel.com>
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
CC: ntfs3@lists.linux.dev
TO: Thorsten Blum <thorsten.blum@toblux.com>
CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   7529036a025ad8bbd664f3aad8bd726e664a6db7
commit: 7495ce846bbe4f38d7ea5e023e44ad864b6348ad [2/16] fs/ntfs3: Use swap() to improve code
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20240824 (https://download.01.org/0day-ci/archive/20240824/202408242247.tSSqBPqy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408242247.tSSqBPqy-lkp@intel.com/

smatch warnings:
fs/ntfs3/lib/lzx_decompress.c:555 lzx_decompress_block() error: uninitialized symbol 'match_offset'.

vim +/match_offset +555 fs/ntfs3/lib/lzx_decompress.c

522e010b58379f Konstantin Komarov 2021-08-13  469  
522e010b58379f Konstantin Komarov 2021-08-13  470  /* Decompress a block of LZX-compressed data.  */
522e010b58379f Konstantin Komarov 2021-08-13  471  static int lzx_decompress_block(const struct lzx_decompressor *d,
522e010b58379f Konstantin Komarov 2021-08-13  472  				struct input_bitstream *is,
522e010b58379f Konstantin Komarov 2021-08-13  473  				int block_type, u32 block_size,
522e010b58379f Konstantin Komarov 2021-08-13  474  				u8 * const out_begin, u8 *out_next,
522e010b58379f Konstantin Komarov 2021-08-13  475  				u32 recent_offsets[])
522e010b58379f Konstantin Komarov 2021-08-13  476  {
522e010b58379f Konstantin Komarov 2021-08-13  477  	u8 * const block_end = out_next + block_size;
522e010b58379f Konstantin Komarov 2021-08-13  478  	u32 ones_if_aligned = 0U - (block_type == LZX_BLOCKTYPE_ALIGNED);
522e010b58379f Konstantin Komarov 2021-08-13  479  
522e010b58379f Konstantin Komarov 2021-08-13  480  	do {
522e010b58379f Konstantin Komarov 2021-08-13  481  		u32 mainsym;
522e010b58379f Konstantin Komarov 2021-08-13  482  		u32 match_len;
522e010b58379f Konstantin Komarov 2021-08-13  483  		u32 match_offset;
522e010b58379f Konstantin Komarov 2021-08-13  484  		u32 offset_slot;
522e010b58379f Konstantin Komarov 2021-08-13  485  		u32 num_extra_bits;
522e010b58379f Konstantin Komarov 2021-08-13  486  
522e010b58379f Konstantin Komarov 2021-08-13  487  		mainsym = read_mainsym(d, is);
522e010b58379f Konstantin Komarov 2021-08-13  488  		if (mainsym < LZX_NUM_CHARS) {
522e010b58379f Konstantin Komarov 2021-08-13  489  			/* Literal  */
522e010b58379f Konstantin Komarov 2021-08-13  490  			*out_next++ = mainsym;
522e010b58379f Konstantin Komarov 2021-08-13  491  			continue;
522e010b58379f Konstantin Komarov 2021-08-13  492  		}
522e010b58379f Konstantin Komarov 2021-08-13  493  
522e010b58379f Konstantin Komarov 2021-08-13  494  		/* Match  */
522e010b58379f Konstantin Komarov 2021-08-13  495  
522e010b58379f Konstantin Komarov 2021-08-13  496  		/* Decode the length header and offset slot.  */
522e010b58379f Konstantin Komarov 2021-08-13  497  		mainsym -= LZX_NUM_CHARS;
522e010b58379f Konstantin Komarov 2021-08-13  498  		match_len = mainsym % LZX_NUM_LEN_HEADERS;
522e010b58379f Konstantin Komarov 2021-08-13  499  		offset_slot = mainsym / LZX_NUM_LEN_HEADERS;
522e010b58379f Konstantin Komarov 2021-08-13  500  
522e010b58379f Konstantin Komarov 2021-08-13  501  		/* If needed, read a length symbol to decode the full length. */
522e010b58379f Konstantin Komarov 2021-08-13  502  		if (match_len == LZX_NUM_PRIMARY_LENS)
522e010b58379f Konstantin Komarov 2021-08-13  503  			match_len += read_lensym(d, is);
522e010b58379f Konstantin Komarov 2021-08-13  504  		match_len += LZX_MIN_MATCH_LEN;
522e010b58379f Konstantin Komarov 2021-08-13  505  
522e010b58379f Konstantin Komarov 2021-08-13  506  		if (offset_slot < LZX_NUM_RECENT_OFFSETS) {
522e010b58379f Konstantin Komarov 2021-08-13  507  			/* Repeat offset  */
522e010b58379f Konstantin Komarov 2021-08-13  508  
522e010b58379f Konstantin Komarov 2021-08-13  509  			/* Note: This isn't a real LRU queue, since using the R2
522e010b58379f Konstantin Komarov 2021-08-13  510  			 * offset doesn't bump the R1 offset down to R2.  This
522e010b58379f Konstantin Komarov 2021-08-13  511  			 * quirk allows all 3 recent offsets to be handled by
522e010b58379f Konstantin Komarov 2021-08-13  512  			 * the same code.  (For R0, the swap is a no-op.)
522e010b58379f Konstantin Komarov 2021-08-13  513  			 */
7495ce846bbe4f Thorsten Blum      2024-07-31  514  			swap(recent_offsets[offset_slot], recent_offsets[0]);
522e010b58379f Konstantin Komarov 2021-08-13  515  		} else {
522e010b58379f Konstantin Komarov 2021-08-13  516  			/* Explicit offset  */
522e010b58379f Konstantin Komarov 2021-08-13  517  
522e010b58379f Konstantin Komarov 2021-08-13  518  			/* Look up the number of extra bits that need to be read
522e010b58379f Konstantin Komarov 2021-08-13  519  			 * to decode offsets with this offset slot.
522e010b58379f Konstantin Komarov 2021-08-13  520  			 */
522e010b58379f Konstantin Komarov 2021-08-13  521  			num_extra_bits = lzx_extra_offset_bits[offset_slot];
522e010b58379f Konstantin Komarov 2021-08-13  522  
522e010b58379f Konstantin Komarov 2021-08-13  523  			/* Start with the offset slot base value.  */
522e010b58379f Konstantin Komarov 2021-08-13  524  			match_offset = lzx_offset_slot_base[offset_slot];
522e010b58379f Konstantin Komarov 2021-08-13  525  
522e010b58379f Konstantin Komarov 2021-08-13  526  			/* In aligned offset blocks, the low-order 3 bits of
522e010b58379f Konstantin Komarov 2021-08-13  527  			 * each offset are encoded using the aligned offset
522e010b58379f Konstantin Komarov 2021-08-13  528  			 * code.  Otherwise, all the extra bits are literal.
522e010b58379f Konstantin Komarov 2021-08-13  529  			 */
522e010b58379f Konstantin Komarov 2021-08-13  530  
522e010b58379f Konstantin Komarov 2021-08-13  531  			if ((num_extra_bits & ones_if_aligned) >= LZX_NUM_ALIGNED_OFFSET_BITS) {
522e010b58379f Konstantin Komarov 2021-08-13  532  				match_offset +=
522e010b58379f Konstantin Komarov 2021-08-13  533  					bitstream_read_bits(is, num_extra_bits -
522e010b58379f Konstantin Komarov 2021-08-13  534  								LZX_NUM_ALIGNED_OFFSET_BITS)
522e010b58379f Konstantin Komarov 2021-08-13  535  							<< LZX_NUM_ALIGNED_OFFSET_BITS;
522e010b58379f Konstantin Komarov 2021-08-13  536  				match_offset += read_alignedsym(d, is);
522e010b58379f Konstantin Komarov 2021-08-13  537  			} else {
522e010b58379f Konstantin Komarov 2021-08-13  538  				match_offset += bitstream_read_bits(is, num_extra_bits);
522e010b58379f Konstantin Komarov 2021-08-13  539  			}
522e010b58379f Konstantin Komarov 2021-08-13  540  
522e010b58379f Konstantin Komarov 2021-08-13  541  			/* Adjust the offset.  */
522e010b58379f Konstantin Komarov 2021-08-13  542  			match_offset -= (LZX_NUM_RECENT_OFFSETS - 1);
522e010b58379f Konstantin Komarov 2021-08-13  543  
522e010b58379f Konstantin Komarov 2021-08-13  544  			/* Update the recent offsets.  */
522e010b58379f Konstantin Komarov 2021-08-13  545  			recent_offsets[2] = recent_offsets[1];
522e010b58379f Konstantin Komarov 2021-08-13  546  			recent_offsets[1] = recent_offsets[0];
522e010b58379f Konstantin Komarov 2021-08-13  547  			recent_offsets[0] = match_offset;
522e010b58379f Konstantin Komarov 2021-08-13  548  		}
522e010b58379f Konstantin Komarov 2021-08-13  549  
522e010b58379f Konstantin Komarov 2021-08-13  550  		/* Validate the match, then copy it to the current position.  */
522e010b58379f Konstantin Komarov 2021-08-13  551  
522e010b58379f Konstantin Komarov 2021-08-13  552  		if (match_len > (size_t)(block_end - out_next))
522e010b58379f Konstantin Komarov 2021-08-13  553  			return -1;
522e010b58379f Konstantin Komarov 2021-08-13  554  
522e010b58379f Konstantin Komarov 2021-08-13 @555  		if (match_offset > (size_t)(out_next - out_begin))
522e010b58379f Konstantin Komarov 2021-08-13  556  			return -1;
522e010b58379f Konstantin Komarov 2021-08-13  557  
522e010b58379f Konstantin Komarov 2021-08-13  558  		out_next = lz_copy(out_next, match_len, match_offset,
522e010b58379f Konstantin Komarov 2021-08-13  559  				   block_end, LZX_MIN_MATCH_LEN);
522e010b58379f Konstantin Komarov 2021-08-13  560  
522e010b58379f Konstantin Komarov 2021-08-13  561  	} while (out_next != block_end);
522e010b58379f Konstantin Komarov 2021-08-13  562  
522e010b58379f Konstantin Komarov 2021-08-13  563  	return 0;
522e010b58379f Konstantin Komarov 2021-08-13  564  }
522e010b58379f Konstantin Komarov 2021-08-13  565  

:::::: The code at line 555 was first introduced by commit
:::::: 522e010b58379fbe19b38fdef5016bca0c3cf405 fs/ntfs3: Add compression

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
