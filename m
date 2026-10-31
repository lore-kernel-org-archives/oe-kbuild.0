Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793475168;
	b=uX5U+yUqMODOVAWup8vdjsJBBLyLsaB0LAmgU8X611g6vkx5GneQ4K3GXF9YaLgzvSDK
	 ETagyAIsx5qhma/+7xJam6QyVbgxLPhQv4KD84Xt0wkd5qJP/0UDKFtx8f42XCGsa4rYc
	 uedmCExk3durWhH4A0zQKt2y63EiLOWZhV5QekzKe27TgFgQSSny1l43RnWPXgoi4QQXe
	 EjdrYKD6McZAoa3TS1zR8sS0QncETxpTpx4AC5gd3yqX7ANSuTUNUU6HrhukqTJNdUXct
	 2VvCkHPGDQavqFsqGPxeH+WwzXd6+dlNqYgLelMCXfeSvPJ5xNFIwiRGXXxTCjdeMIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793475168;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LdXOKX4RgXOsjfJi0y4d6RFtZcPU6FjLORStH9efkUM=;
	b=TY2Gx06j+VTg72XS4ebKmTG6xqL688F5XGuZzvfoI0+EX3FVfK8WhcHtESLRxYA/5hHw
	 VB4cvZQQNOqtdM2wcekgmdffVluycm+kPi9UUUDR1jE6ZLhjIaMMjmSWzMY0pRr7EZ9Ob
	 UvqvVCamejVLz0PHJEfJtkbeVxoLupZYqMuPYg6nNUTcve7yXytOTrwZIrse5tXZ1eASP
	 rP7L85iLBFfdAEfBmqKshMRVLrN5cVssLNZcUCNjBxgvIw/PG+7kas90KpDHeRkcI0TK5
	 XbSqaBUcMpcufRHPNsJLutiF7YVdVtWaE5mGSJEVfwheN0+0R5BIUOtQXGTc4bVorAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GlL11OoL;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6B606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 19:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00E6B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GlL11OoL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793475168; x=1825011168;
  h=date:from:to:cc:subject:message-id;
  bh=jHbBDbV00VzrHA0RFav2u+dO7N6Z4NMMMZjyAlqjeoI=;
  b=GlL11OoL1LXubR7SIlUdTg+GR0smANsWujILwUJp6/ICpMdviaonjcXW
   7+Utu0MjE7btX3OzzvvDHYSocgJ9iBpJQPsLRCNNG8RUc/ewZ8R8XkT1O
   SoDDBVEyj/P6wS8WVeOKEf6TddBloo+WCfKQrWrknMbfLQa+giJeLfnOX
   LkbpPUKrUsB9cs+OsNnR/T2r9CmXuezYLnxLQ2+JpR+A/Y0fdYpBGshVr
   dIa0lsRuoU63FuhYH8LCzYsBktB6bOxtQcvK7+F99rZrli/zXrCSqHh3p
   ZIO1Sg+Vy6OYwe3pxGR3eAzr+ObLRdDHS2mxqObUzjM2PkOcRJV6z4u5U
   Q==;
X-CSE-ConnectionGUID: kev5dFqhSuucRmkXhjKr3A==
X-CSE-MsgGUID: fu/psU9hQQiX9iLlUquwWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2225263"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2225263"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 12:32:47 -0700
X-CSE-ConnectionGUID: 6Mq9O511RKO2W+A88pGzRA==
X-CSE-MsgGUID: WV6EaFUETKiBL8ljH5ob7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5606862"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 31 Oct 2026 12:32:46 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNEok-00000000663-3E6p;
	Sat, 31 Oct 2026 19:32:42 +0000
Date: Sat, 31 Oct 2026 20:32:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-p3s 2/2]
 drivers/md/dm-verity-fec.c:136 fec_decode_bufs() error: buffer overflow
 'par_buf' 24 <= u32max
Message-ID: <202610312038.Un7RLzdP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   cf32e70ca1c409f3b7da2e8d3640dbbb3104be5d
commit: 5e49cda1a1763a2fcf85bff26b21b3ed85b38fd5 [2/2] UPSTREAM: dm-verity FEC: Avoid copying RS parity bytes twice.
:::::: branch date: 21 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-r2200-20261030 (https://download.01.org/0day-ci/archive/20261031/202610312038.Un7RLzdP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610312038.Un7RLzdP-lkp@intel.com/

smatch warnings:
drivers/md/dm-verity-fec.c:136 fec_decode_bufs() error: buffer overflow 'par_buf' 24 <= u32max

vim +/par_buf +136 drivers/md/dm-verity-fec.c

a739ff3f543afbb Sami Tolvanen 2015-12-03  108  
a739ff3f543afbb Sami Tolvanen 2015-12-03  109  /*
a739ff3f543afbb Sami Tolvanen 2015-12-03  110   * Decode all RS blocks from buffers and copy corrected bytes into fio->output
a739ff3f543afbb Sami Tolvanen 2015-12-03  111   * starting from block_offset.
a739ff3f543afbb Sami Tolvanen 2015-12-03  112   */
d95e2c34a3ca768 Hongyu Jin    2024-01-24  113  static int fec_decode_bufs(struct dm_verity *v, struct dm_verity_io *io,
d95e2c34a3ca768 Hongyu Jin    2024-01-24  114  			   struct dm_verity_fec_io *fio, u64 rsb, int byte_index,
d95e2c34a3ca768 Hongyu Jin    2024-01-24  115  			   unsigned int block_offset, int neras)
a739ff3f543afbb Sami Tolvanen 2015-12-03  116  {
a739ff3f543afbb Sami Tolvanen 2015-12-03  117  	int r, corrected = 0, res;
a739ff3f543afbb Sami Tolvanen 2015-12-03  118  	struct dm_buffer *buf;
5e49cda1a1763a2 Milan Broz    2024-12-18  119  	unsigned int n, i, j, offset, par_buf_offset = 0;
5e49cda1a1763a2 Milan Broz    2024-12-18  120  	uint16_t par_buf[DM_VERITY_FEC_RSM - DM_VERITY_FEC_MIN_RSN];
5e49cda1a1763a2 Milan Broz    2024-12-18  121  	u8 *par, *block;
d95e2c34a3ca768 Hongyu Jin    2024-01-24  122  	struct bio *bio = dm_bio_from_per_bio_data(io, v->ti->per_io_data_size);
a739ff3f543afbb Sami Tolvanen 2015-12-03  123  
fc8943886629e26 Milan Broz    2024-12-18  124  	par = fec_read_parity(v, rsb, block_offset, &offset,
fc8943886629e26 Milan Broz    2024-12-18  125  			      par_buf_offset, &buf, bio_prio(bio));
a739ff3f543afbb Sami Tolvanen 2015-12-03  126  	if (IS_ERR(par))
a739ff3f543afbb Sami Tolvanen 2015-12-03  127  		return PTR_ERR(par);
a739ff3f543afbb Sami Tolvanen 2015-12-03  128  
a739ff3f543afbb Sami Tolvanen 2015-12-03  129  	/*
a739ff3f543afbb Sami Tolvanen 2015-12-03  130  	 * Decode the RS blocks we have in bufs. Each RS block results in
a739ff3f543afbb Sami Tolvanen 2015-12-03  131  	 * one corrected target byte and consumes fec->roots parity bytes.
a739ff3f543afbb Sami Tolvanen 2015-12-03  132  	 */
a739ff3f543afbb Sami Tolvanen 2015-12-03  133  	fec_for_each_buffer_rs_block(fio, n, i) {
a739ff3f543afbb Sami Tolvanen 2015-12-03  134  		block = fec_buffer_rs_block(v, fio, n, i);
5e49cda1a1763a2 Milan Broz    2024-12-18  135  		for (j = 0; j < v->fec->roots - par_buf_offset; j++)
5e49cda1a1763a2 Milan Broz    2024-12-18 @136  			par_buf[par_buf_offset + j] = par[offset + j];
5e49cda1a1763a2 Milan Broz    2024-12-18  137  		/* Decode an RS block using Reed-Solomon */
5e49cda1a1763a2 Milan Broz    2024-12-18  138  		res = decode_rs8(fio->rs, block, par_buf, v->fec->rsn,
5e49cda1a1763a2 Milan Broz    2024-12-18  139  				 NULL, neras, fio->erasures, 0, NULL);
a739ff3f543afbb Sami Tolvanen 2015-12-03  140  		if (res < 0) {
a739ff3f543afbb Sami Tolvanen 2015-12-03  141  			r = res;
a739ff3f543afbb Sami Tolvanen 2015-12-03  142  			goto error;
a739ff3f543afbb Sami Tolvanen 2015-12-03  143  		}
a739ff3f543afbb Sami Tolvanen 2015-12-03  144  
a739ff3f543afbb Sami Tolvanen 2015-12-03  145  		corrected += res;
a739ff3f543afbb Sami Tolvanen 2015-12-03  146  		fio->output[block_offset] = block[byte_index];
a739ff3f543afbb Sami Tolvanen 2015-12-03  147  
a739ff3f543afbb Sami Tolvanen 2015-12-03  148  		block_offset++;
a739ff3f543afbb Sami Tolvanen 2015-12-03  149  		if (block_offset >= 1 << v->data_dev_block_bits)
a739ff3f543afbb Sami Tolvanen 2015-12-03  150  			goto done;
a739ff3f543afbb Sami Tolvanen 2015-12-03  151  
fc8943886629e26 Milan Broz    2024-12-18  152  		/* Read the next block when we run out of parity bytes */
fc8943886629e26 Milan Broz    2024-12-18  153  		offset += (v->fec->roots - par_buf_offset);
fc8943886629e26 Milan Broz    2024-12-18  154  		/* Check if parity bytes are split between blocks */
fc8943886629e26 Milan Broz    2024-12-18  155  		if (offset < v->fec->io_size && (offset + v->fec->roots) > v->fec->io_size) {
fc8943886629e26 Milan Broz    2024-12-18  156  			par_buf_offset = v->fec->io_size - offset;
5e49cda1a1763a2 Milan Broz    2024-12-18  157  			for (j = 0; j < par_buf_offset; j++)
5e49cda1a1763a2 Milan Broz    2024-12-18  158  				par_buf[j] = par[offset + j];
fc8943886629e26 Milan Broz    2024-12-18  159  			offset += par_buf_offset;
fc8943886629e26 Milan Broz    2024-12-18  160  		} else
fc8943886629e26 Milan Broz    2024-12-18  161  			par_buf_offset = 0;
fc8943886629e26 Milan Broz    2024-12-18  162  
8ca7cab82bda4eb Jaegeuk Kim   2021-04-14  163  		if (offset >= v->fec->io_size) {
a739ff3f543afbb Sami Tolvanen 2015-12-03  164  			dm_bufio_release(buf);
a739ff3f543afbb Sami Tolvanen 2015-12-03  165  
fc8943886629e26 Milan Broz    2024-12-18  166  			par = fec_read_parity(v, rsb, block_offset, &offset,
fc8943886629e26 Milan Broz    2024-12-18  167  					      par_buf_offset, &buf, bio_prio(bio));
821b40da4d91839 Chengguang Xu 2019-02-13  168  			if (IS_ERR(par))
a739ff3f543afbb Sami Tolvanen 2015-12-03  169  				return PTR_ERR(par);
a739ff3f543afbb Sami Tolvanen 2015-12-03  170  		}
a739ff3f543afbb Sami Tolvanen 2015-12-03  171  	}
a739ff3f543afbb Sami Tolvanen 2015-12-03  172  done:
a739ff3f543afbb Sami Tolvanen 2015-12-03  173  	r = corrected;
a739ff3f543afbb Sami Tolvanen 2015-12-03  174  error:
86e3e83b443669d Sami Tolvanen 2017-03-31  175  	dm_bufio_release(buf);
86e3e83b443669d Sami Tolvanen 2017-03-31  176  
a739ff3f543afbb Sami Tolvanen 2015-12-03  177  	if (r < 0 && neras)
a739ff3f543afbb Sami Tolvanen 2015-12-03  178  		DMERR_LIMIT("%s: FEC %llu: failed to correct: %d",
a739ff3f543afbb Sami Tolvanen 2015-12-03  179  			    v->data_dev->name, (unsigned long long)rsb, r);
a739ff3f543afbb Sami Tolvanen 2015-12-03  180  	else if (r > 0)
a739ff3f543afbb Sami Tolvanen 2015-12-03  181  		DMWARN_LIMIT("%s: FEC %llu: corrected %d errors",
a739ff3f543afbb Sami Tolvanen 2015-12-03  182  			     v->data_dev->name, (unsigned long long)rsb, r);
a739ff3f543afbb Sami Tolvanen 2015-12-03  183  
a739ff3f543afbb Sami Tolvanen 2015-12-03  184  	return r;
a739ff3f543afbb Sami Tolvanen 2015-12-03  185  }
a739ff3f543afbb Sami Tolvanen 2015-12-03  186  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
