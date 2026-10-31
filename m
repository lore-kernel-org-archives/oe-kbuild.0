Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793467115;
	b=QV5uZJoeGzb2OycqEEZQCDQwvd1Tf5VDsFk+Xdu6NdkKLt2kfLFO/c/ychkOnR/t1Hul
	 TWgdgMbg9B9Yz00aYm7nQu0kcgSVGUT0xpTcLuEEcD89V6SDlC+9odFFlbdKz2PGRjk1e
	 CYMVPWnaBU4wp/igwrBWnC7hH3RbBYzgPAc4u1gX7KaHZDWQwkjMvgZQC+u/Dplnmd3iK
	 BCUIjF00MQ1MzmOKp1aaLfBKvL5gSccO2thOpItBlN8i618WNksdTMwLxd2P+9FJnh0Qq
	 lhOez9MNaZEq2W3DWEJXbt+Jfsu3yGTD6j9Z7PtT2kLa4PLK3tkotvT0Sc0WCV+Zmjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793467115;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/Yr6ny+HXWLFMY7Kg7iiwTAriNqMjxZWHVsw/UlatAI=;
	b=MNh8K4zcmSS91EbBU3A7qV+ffEdjoPVj+39WL+hM5/86I8U2ZSynGTMk7/mmMh27kNUU
	 urxZbB2LoM4aOd9tdPpZ3VPCsNUOyrSyFWysVs62sbTzwRDZjIjNOWh+uq+PIEKeacnn/
	 9JwCydFOc6BfSzwMa7cjnRQaGskcMLF6SdArtJ+thG7n+eO1+QVOdYxXeYHPxo92ceOwM
	 CEXXzwBMY9dYSh6esOEqFrtogKIaXvtXl+XKjvFsXOrGkAHQpZuOJI52BkbqGlVw8Oc6l
	 LcF2iox31TKGG2F/nsmt8uYyEb2j2jL7rFYpcszxvwngPJZYObb/hiDQesTVG3qLAaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TYglssfA;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC338606A31C
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 17:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC338606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TYglssfA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793467111; x=1825003111;
  h=date:from:to:cc:subject:message-id;
  bh=CD2oMWYIPGYAE5qUXe1vWaJZ4MM5c8AKxItoiJuitdM=;
  b=TYglssfAC9T7ZIBL+au12rOplVC8g1nwIIAqGOPKzOt9f0FQZjHzsvcm
   bjKZUs2axC4K3lC0q53187pt+TC0iFgsCBiqFgvVz0fQVILO+NZOZ9MRs
   kspM0b2V0CuWYPSeKmV5SJF6uD5pplfyHQEvNGBsmT3QZtZdt2pXO0G2K
   wQnaDhHKWgnf6lnau5rGlfBHzNfbD7mjNNs4YsTOOhKf4prwqy5o8jLwh
   9KHljUL1QiBaMJsORK00pEQG+ztDdrTWH9L5+XnkfW6yUvXgCuGL5e9yv
   MuCYgK6yNdrqHYibt4SE6LH2s6IgFPXZ1khi0ebXg9wYWNPeT8DveWiJ5
   Q==;
X-CSE-ConnectionGUID: W+NDHtVbRSuXMZo2n4alZA==
X-CSE-MsgGUID: icwVSIssQ2KdGobMsW71/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2090094"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2090094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 10:18:30 -0700
X-CSE-ConnectionGUID: BBX9NfJNSru6/iazXR96yA==
X-CSE-MsgGUID: aArlBermQhOxP98Ki35epQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="6031383"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2026 10:18:28 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNCio-0000000063v-1t2q;
	Sat, 31 Oct 2026 17:18:26 +0000
Date: Sat, 31 Oct 2026 18:17:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-p3s 2/2]
 drivers/scsi/mpi3mr/mpi3mr_app.c:2834 mpi3mr_bsg_process_mpt_cmds() warn:
 inconsistent returns '&mrioc->bsg_cmds.mutex'.
Message-ID: <202610311807.nEvEXMQ5-lkp@intel.com>
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
commit: b8ed09e397f8e4277c26ca0dfea3f78b72244557 [2/2] scsi: mpi3mr: Synchronize access to ioctl data buffer
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 10 months ago
config: i386-randconfig-r2200-20261030 (https://download.01.org/0day-ci/archive/20261031/202610311807.nEvEXMQ5-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610311807.nEvEXMQ5-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:2834 mpi3mr_bsg_process_mpt_cmds() warn: inconsistent returns '&mrioc->bsg_cmds.mutex'.

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:1800 mpi3mr_bsg_build_sgl() warn: missing unwind goto?
drivers/scsi/mpi3mr/mpi3mr_app.c:1800 mpi3mr_bsg_build_sgl() warn: missing unwind goto?
drivers/scsi/mpi3mr/mpi3mr_app.c:1800 mpi3mr_bsg_build_sgl() warn: missing unwind goto?
drivers/scsi/mpi3mr/mpi3mr_app.c:2711 mpi3mr_bsg_process_mpt_cmds() warn: inconsistent indenting

vim +2834 drivers/scsi/mpi3mr/mpi3mr_app.c

fb231d7deffb41 Chandrakanth patil   2023-12-06  2223  
fb231d7deffb41 Chandrakanth patil   2023-12-06  2224  /**
fb231d7deffb41 Chandrakanth patil   2023-12-06  2225   * mpi3mr_map_data_buffer_dma - build dma descriptors for data
fb231d7deffb41 Chandrakanth patil   2023-12-06  2226   *                              buffers
fb231d7deffb41 Chandrakanth patil   2023-12-06  2227   * @mrioc: Adapter instance reference
fb231d7deffb41 Chandrakanth patil   2023-12-06  2228   * @drv_buf: buffer map descriptor
fb231d7deffb41 Chandrakanth patil   2023-12-06  2229   * @desc_count: Number of already consumed dma descriptors
fb231d7deffb41 Chandrakanth patil   2023-12-06  2230   *
fb231d7deffb41 Chandrakanth patil   2023-12-06  2231   * This function computes how many pre-allocated DMA descriptors
fb231d7deffb41 Chandrakanth patil   2023-12-06  2232   * are required for the given data buffer and if those number of
fb231d7deffb41 Chandrakanth patil   2023-12-06  2233   * descriptors are free, then setup the mapping of the scattered
fb231d7deffb41 Chandrakanth patil   2023-12-06  2234   * DMA address to the given data buffer, if the data direction
fb231d7deffb41 Chandrakanth patil   2023-12-06  2235   * of the buffer is DMA_TO_DEVICE then the actual data is copied to
fb231d7deffb41 Chandrakanth patil   2023-12-06  2236   * the DMA buffers
fb231d7deffb41 Chandrakanth patil   2023-12-06  2237   *
fb231d7deffb41 Chandrakanth patil   2023-12-06  2238   * Return: 0 on success, -1 on failure
fb231d7deffb41 Chandrakanth patil   2023-12-06  2239   */
fb231d7deffb41 Chandrakanth patil   2023-12-06  2240  static int mpi3mr_map_data_buffer_dma(struct mpi3mr_ioc *mrioc,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2241  				      struct mpi3mr_buf_map *drv_buf,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2242  				      u16 desc_count)
fb231d7deffb41 Chandrakanth patil   2023-12-06  2243  {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2244  	u16 i, needed_desc = drv_buf->kern_buf_len / MPI3MR_IOCTL_SGE_SIZE;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2245  	u32 buf_len = drv_buf->kern_buf_len, copied_len = 0;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2246  
fb231d7deffb41 Chandrakanth patil   2023-12-06  2247  	if (drv_buf->kern_buf_len % MPI3MR_IOCTL_SGE_SIZE)
fb231d7deffb41 Chandrakanth patil   2023-12-06  2248  		needed_desc++;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2249  	if ((needed_desc + desc_count) > MPI3MR_NUM_IOCTL_SGE) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2250  		dprint_bsg_err(mrioc, "%s: DMA descriptor mapping error %d:%d:%d\n",
fb231d7deffb41 Chandrakanth patil   2023-12-06  2251  			       __func__, needed_desc, desc_count, MPI3MR_NUM_IOCTL_SGE);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2252  		return -1;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2253  	}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2254  	drv_buf->dma_desc = kzalloc(sizeof(*drv_buf->dma_desc) * needed_desc,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2255  				    GFP_KERNEL);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2256  	if (!drv_buf->dma_desc)
fb231d7deffb41 Chandrakanth patil   2023-12-06  2257  		return -1;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2258  	for (i = 0; i < needed_desc; i++, desc_count++) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2259  		drv_buf->dma_desc[i].addr = mrioc->ioctl_sge[desc_count].addr;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2260  		drv_buf->dma_desc[i].dma_addr =
fb231d7deffb41 Chandrakanth patil   2023-12-06  2261  		    mrioc->ioctl_sge[desc_count].dma_addr;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2262  		if (buf_len < mrioc->ioctl_sge[desc_count].size)
fb231d7deffb41 Chandrakanth patil   2023-12-06  2263  			drv_buf->dma_desc[i].size = buf_len;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2264  		else
fb231d7deffb41 Chandrakanth patil   2023-12-06  2265  			drv_buf->dma_desc[i].size =
fb231d7deffb41 Chandrakanth patil   2023-12-06  2266  			    mrioc->ioctl_sge[desc_count].size;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2267  		buf_len -= drv_buf->dma_desc[i].size;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2268  		memset(drv_buf->dma_desc[i].addr, 0,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2269  		       mrioc->ioctl_sge[desc_count].size);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2270  		if (drv_buf->data_dir == DMA_TO_DEVICE) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2271  			memcpy(drv_buf->dma_desc[i].addr,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2272  			       drv_buf->bsg_buf + copied_len,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2273  			       drv_buf->dma_desc[i].size);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2274  			copied_len += drv_buf->dma_desc[i].size;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2275  		}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2276  	}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2277  	drv_buf->num_dma_desc = needed_desc;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2278  	return 0;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2279  }
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2280  /**
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2281   * mpi3mr_bsg_process_mpt_cmds - MPI Pass through BSG handler
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2282   * @job: BSG job reference
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2283   *
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2284   * This function is the top level handler for MPI Pass through
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2285   * command, this does basic validation of the input data buffers,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2286   * identifies the given buffer types and MPI command, allocates
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2287   * DMAable memory for user given buffers, construstcs SGL
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2288   * properly and passes the command to the firmware.
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2289   *
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2290   * Once the MPI command is completed the driver copies the data
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2291   * if any and reply, sense information to user provided buffers.
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2292   * If the command is timed out then issues controller reset
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2293   * prior to returning.
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2294   *
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2295   * Return: 0 on success and proper error codes on failure
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2296   */
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2297  
fb231d7deffb41 Chandrakanth patil   2023-12-06  2298  static long mpi3mr_bsg_process_mpt_cmds(struct bsg_job *job)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2299  {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2300  	long rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2301  	struct mpi3mr_ioc *mrioc = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2302  	u8 *mpi_req = NULL, *sense_buff_k = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2303  	u8 mpi_msg_size = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2304  	struct mpi3mr_bsg_packet *bsg_req = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2305  	struct mpi3mr_bsg_mptcmd *karg;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2306  	struct mpi3mr_buf_entry *buf_entries = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2307  	struct mpi3mr_buf_map *drv_bufs = NULL, *drv_buf_iter = NULL;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2308  	u8 count, bufcnt = 0, is_rmcb = 0, is_rmrb = 0;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2309  	u8 din_cnt = 0, dout_cnt = 0;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2310  	u8 invalid_be = 0, erb_offset = 0xFF, mpirep_offset = 0xFF;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2311  	u8 block_io = 0, nvme_fmt = 0, resp_code = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2312  	struct mpi3_request_header *mpi_header = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2313  	struct mpi3_status_reply_descriptor *status_desc;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2314  	struct mpi3_scsi_task_mgmt_request *tm_req;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2315  	u32 erbsz = MPI3MR_SENSE_BUF_SZ, tmplen;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2316  	u16 dev_handle;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2317  	struct mpi3mr_tgt_dev *tgtdev;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2318  	struct mpi3mr_stgt_priv_data *stgt_priv = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2319  	struct mpi3mr_bsg_in_reply_buf *bsg_reply_buf = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2320  	u32 din_size = 0, dout_size = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2321  	u8 *din_buf = NULL, *dout_buf = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2322  	u8 *sgl_iter = NULL, *sgl_din_iter = NULL, *sgl_dout_iter = NULL;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2323  	u16 rmc_size  = 0, desc_count = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2324  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2325  	bsg_req = job->request;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2326  	karg = (struct mpi3mr_bsg_mptcmd *)&bsg_req->cmd.mptcmd;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2327  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2328  	mrioc = mpi3mr_bsg_verify_adapter(karg->mrioc_id);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2329  	if (!mrioc)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2330  		return -ENODEV;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2331  
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2332  	if (mutex_lock_interruptible(&mrioc->bsg_cmds.mutex))
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2333  		return -ERESTARTSYS;
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2334  
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2335  	if (mrioc->bsg_cmds.state & MPI3MR_CMD_PENDING) {
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2336  		dprint_bsg_err(mrioc, "%s: command is in use\n", __func__);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2337  		mutex_unlock(&mrioc->bsg_cmds.mutex);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2338  		return -EAGAIN;
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2339  	}
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2340  
fb231d7deffb41 Chandrakanth patil   2023-12-06  2341  	if (!mrioc->ioctl_sges_allocated) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2342  		dprint_bsg_err(mrioc, "%s: DMA memory was not allocated\n",
fb231d7deffb41 Chandrakanth patil   2023-12-06  2343  			       __func__);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2344  		return -ENOMEM;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2345  	}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2346  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2347  	if (karg->timeout < MPI3MR_APP_DEFAULT_TIMEOUT)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2348  		karg->timeout = MPI3MR_APP_DEFAULT_TIMEOUT;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2349  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2350  	mpi_req = kzalloc(MPI3MR_ADMIN_REQ_FRAME_SZ, GFP_KERNEL);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2351  	if (!mpi_req) {
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2352  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2353  		return -ENOMEM;
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2354  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2355  	mpi_header = (struct mpi3_request_header *)mpi_req;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2356  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2357  	bufcnt = karg->buf_entry_list.num_of_entries;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2358  	drv_bufs = kzalloc((sizeof(*drv_bufs) * bufcnt), GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2359  	if (!drv_bufs) {
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2360  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2361  		rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2362  		goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2363  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2364  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2365  	dout_buf = kzalloc(job->request_payload.payload_len,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2366  				      GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2367  	if (!dout_buf) {
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2368  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2369  		rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2370  		goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2371  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2372  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2373  	din_buf = kzalloc(job->reply_payload.payload_len,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2374  				     GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2375  	if (!din_buf) {
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2376  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2377  		rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2378  		goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2379  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2380  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2381  	sg_copy_to_buffer(job->request_payload.sg_list,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2382  			  job->request_payload.sg_cnt,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2383  			  dout_buf, job->request_payload.payload_len);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2384  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2385  	buf_entries = karg->buf_entry_list.buf_entry;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2386  	sgl_din_iter = din_buf;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2387  	sgl_dout_iter = dout_buf;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2388  	drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2389  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2390  	for (count = 0; count < bufcnt; count++, buf_entries++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2391  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2392  		switch (buf_entries->buf_type) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2393  		case MPI3MR_BSG_BUFTYPE_RAIDMGMT_CMD:
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2394  			sgl_iter = sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2395  			sgl_dout_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2396  			drv_buf_iter->data_dir = DMA_TO_DEVICE;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2397  			is_rmcb = 1;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2398  			if ((count != 0) || !buf_entries->buf_len)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2399  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2400  			break;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2401  		case MPI3MR_BSG_BUFTYPE_RAIDMGMT_RESP:
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2402  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2403  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2404  			drv_buf_iter->data_dir = DMA_FROM_DEVICE;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2405  			is_rmrb = 1;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2406  			if (count != 1 || !is_rmcb || !buf_entries->buf_len)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2407  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2408  			break;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2409  		case MPI3MR_BSG_BUFTYPE_DATA_IN:
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2410  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2411  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2412  			drv_buf_iter->data_dir = DMA_FROM_DEVICE;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2413  			din_cnt++;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2414  			din_size += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2415  			if ((din_cnt > 1) && !is_rmcb)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2416  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2417  			break;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2418  		case MPI3MR_BSG_BUFTYPE_DATA_OUT:
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2419  			sgl_iter = sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2420  			sgl_dout_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2421  			drv_buf_iter->data_dir = DMA_TO_DEVICE;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2422  			dout_cnt++;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2423  			dout_size += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2424  			if ((dout_cnt > 1) && !is_rmcb)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2425  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2426  			break;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2427  		case MPI3MR_BSG_BUFTYPE_MPI_REPLY:
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2428  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2429  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2430  			drv_buf_iter->data_dir = DMA_NONE;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2431  			mpirep_offset = count;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2432  			if (!buf_entries->buf_len)
fb231d7deffb41 Chandrakanth patil   2023-12-06  2433  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2434  			break;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2435  		case MPI3MR_BSG_BUFTYPE_ERR_RESPONSE:
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2436  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2437  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2438  			drv_buf_iter->data_dir = DMA_NONE;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2439  			erb_offset = count;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2440  			if (!buf_entries->buf_len)
fb231d7deffb41 Chandrakanth patil   2023-12-06  2441  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2442  			break;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2443  		case MPI3MR_BSG_BUFTYPE_MPI_REQUEST:
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2444  			sgl_iter = sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2445  			sgl_dout_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2446  			drv_buf_iter->data_dir = DMA_NONE;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2447  			mpi_msg_size = buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2448  			if ((!mpi_msg_size || (mpi_msg_size % 4)) ||
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2449  					(mpi_msg_size > MPI3MR_ADMIN_REQ_FRAME_SZ)) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2450  				dprint_bsg_err(mrioc, "%s: invalid MPI message size\n",
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2451  					__func__);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2452  				mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2453  				rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2454  				goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2455  			}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2456  			memcpy(mpi_req, sgl_iter, buf_entries->buf_len);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2457  			break;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2458  		default:
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2459  			invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2460  			break;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2461  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2462  		if (invalid_be) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2463  			dprint_bsg_err(mrioc, "%s: invalid buffer entries passed\n",
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2464  				__func__);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2465  			mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2466  			rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2467  			goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2468  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2469  
fb231d7deffb41 Chandrakanth patil   2023-12-06  2470  		if (sgl_dout_iter > (dout_buf + job->request_payload.payload_len)) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2471  			dprint_bsg_err(mrioc, "%s: data_out buffer length mismatch\n",
fb231d7deffb41 Chandrakanth patil   2023-12-06  2472  				       __func__);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2473  			mutex_unlock(&mrioc->bsg_cmds.mutex);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2474  			rval = -EINVAL;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2475  			goto out;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2476  		}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2477  		if (sgl_din_iter > (din_buf + job->reply_payload.payload_len)) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2478  			dprint_bsg_err(mrioc, "%s: data_in buffer length mismatch\n",
fb231d7deffb41 Chandrakanth patil   2023-12-06  2479  				       __func__);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2480  			mutex_unlock(&mrioc->bsg_cmds.mutex);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2481  			rval = -EINVAL;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2482  			goto out;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2483  		}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2484  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2485  		drv_buf_iter->bsg_buf = sgl_iter;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2486  		drv_buf_iter->bsg_buf_len = buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2487  	}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2488  
fb231d7deffb41 Chandrakanth patil   2023-12-06  2489  	if (is_rmcb && ((din_size + dout_size) > MPI3MR_MAX_APP_XFER_SIZE)) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2490  		dprint_bsg_err(mrioc, "%s:%d: invalid data transfer size passed for function 0x%x din_size = %d, dout_size = %d\n",
fb231d7deffb41 Chandrakanth patil   2023-12-06  2491  			       __func__, __LINE__, mpi_header->function, din_size,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2492  			       dout_size);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2493  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2494  		rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2495  		goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2496  	}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2497  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2498  	if (din_size > MPI3MR_MAX_APP_XFER_SIZE) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2499  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2500  		    "%s:%d: invalid data transfer size passed for function 0x%x din_size=%d\n",
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2501  		    __func__, __LINE__, mpi_header->function, din_size);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2502  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2503  		rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2504  		goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2505  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2506  	if (dout_size > MPI3MR_MAX_APP_XFER_SIZE) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2507  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2508  		    "%s:%d: invalid data transfer size passed for function 0x%x dout_size = %d\n",
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2509  		    __func__, __LINE__, mpi_header->function, dout_size);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2510  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2511  		rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2512  		goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2513  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2514  
fb231d7deffb41 Chandrakanth patil   2023-12-06  2515  	if (mpi_header->function == MPI3_BSG_FUNCTION_SMP_PASSTHROUGH) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2516  		if (din_size > MPI3MR_IOCTL_SGE_SIZE ||
fb231d7deffb41 Chandrakanth patil   2023-12-06  2517  		    dout_size > MPI3MR_IOCTL_SGE_SIZE) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2518  			dprint_bsg_err(mrioc, "%s:%d: invalid message size passed:%d:%d:%d:%d\n",
fb231d7deffb41 Chandrakanth patil   2023-12-06  2519  				       __func__, __LINE__, din_cnt, dout_cnt, din_size,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2520  			    dout_size);
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2521  			mutex_unlock(&mrioc->bsg_cmds.mutex);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2522  			rval = -EINVAL;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2523  			goto out;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2524  		}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2525  	}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2526  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2527  	drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2528  	for (count = 0; count < bufcnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2529  		if (drv_buf_iter->data_dir == DMA_NONE)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2530  			continue;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2531  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2532  		drv_buf_iter->kern_buf_len = drv_buf_iter->bsg_buf_len;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2533  		if (is_rmcb && !count) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2534  			drv_buf_iter->kern_buf_len =
fb231d7deffb41 Chandrakanth patil   2023-12-06  2535  			    mrioc->ioctl_chain_sge.size;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2536  			drv_buf_iter->kern_buf =
fb231d7deffb41 Chandrakanth patil   2023-12-06  2537  			    mrioc->ioctl_chain_sge.addr;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2538  			drv_buf_iter->kern_buf_dma =
fb231d7deffb41 Chandrakanth patil   2023-12-06  2539  			    mrioc->ioctl_chain_sge.dma_addr;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2540  			drv_buf_iter->dma_desc = NULL;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2541  			drv_buf_iter->num_dma_desc = 0;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2542  			memset(drv_buf_iter->kern_buf, 0,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2543  			       drv_buf_iter->kern_buf_len);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2544  			tmplen = min(drv_buf_iter->kern_buf_len,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2545  				     drv_buf_iter->bsg_buf_len);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2546  			rmc_size = tmplen;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2547  			memcpy(drv_buf_iter->kern_buf, drv_buf_iter->bsg_buf, tmplen);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2548  		} else if (is_rmrb && (count == 1)) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2549  			drv_buf_iter->kern_buf_len =
fb231d7deffb41 Chandrakanth patil   2023-12-06  2550  			    mrioc->ioctl_resp_sge.size;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2551  			drv_buf_iter->kern_buf =
fb231d7deffb41 Chandrakanth patil   2023-12-06  2552  			    mrioc->ioctl_resp_sge.addr;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2553  			drv_buf_iter->kern_buf_dma =
fb231d7deffb41 Chandrakanth patil   2023-12-06  2554  			    mrioc->ioctl_resp_sge.dma_addr;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2555  			drv_buf_iter->dma_desc = NULL;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2556  			drv_buf_iter->num_dma_desc = 0;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2557  			memset(drv_buf_iter->kern_buf, 0,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2558  			       drv_buf_iter->kern_buf_len);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2559  			tmplen = min(drv_buf_iter->kern_buf_len,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2560  				     drv_buf_iter->bsg_buf_len);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2561  			drv_buf_iter->kern_buf_len = tmplen;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2562  			memset(drv_buf_iter->bsg_buf, 0,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2563  			       drv_buf_iter->bsg_buf_len);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2564  		} else {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2565  			if (!drv_buf_iter->kern_buf_len)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2566  				continue;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2567  			if (mpi3mr_map_data_buffer_dma(mrioc, drv_buf_iter, desc_count)) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2568  				rval = -ENOMEM;
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2569  				mutex_unlock(&mrioc->bsg_cmds.mutex);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2570  				dprint_bsg_err(mrioc, "%s:%d: mapping data buffers failed\n",
fb231d7deffb41 Chandrakanth patil   2023-12-06  2571  					       __func__, __LINE__);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2572  			goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2573  		}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2574  			desc_count += drv_buf_iter->num_dma_desc;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2575  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2576  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2577  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2578  	if (erb_offset != 0xFF) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2579  		sense_buff_k = kzalloc(erbsz, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2580  		if (!sense_buff_k) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2581  			rval = -ENOMEM;
b8ed09e397f8e4 Ranjan Kumar         2024-11-11  2582  			mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2583  			goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2584  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2585  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2586  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2587  	if (mrioc->unrecoverable) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2588  		dprint_bsg_err(mrioc, "%s: unrecoverable controller\n",
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2589  		    __func__);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2590  		rval = -EFAULT;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2591  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2592  		goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2593  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2594  	if (mrioc->reset_in_progress) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2595  		dprint_bsg_err(mrioc, "%s: reset in progress\n", __func__);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2596  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2597  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2598  		goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2599  	}
1c342b0548e3f5 Sumit Saxena         2024-06-27  2600  	if (mrioc->stop_bsgs || mrioc->block_on_pci_err) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2601  		dprint_bsg_err(mrioc, "%s: bsgs are blocked\n", __func__);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2602  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2603  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2604  		goto out;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2605  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2606  
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2607  	if (mpi_header->function == MPI3_BSG_FUNCTION_NVME_ENCAPSULATED) {
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2608  		nvme_fmt = mpi3mr_get_nvme_data_fmt(
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2609  			(struct mpi3_nvme_encapsulated_request *)mpi_req);
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2610  		if (nvme_fmt == MPI3MR_NVME_DATA_FORMAT_PRP) {
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2611  			if (mpi3mr_build_nvme_prp(mrioc,
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2612  			    (struct mpi3_nvme_encapsulated_request *)mpi_req,
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2613  			    drv_bufs, bufcnt)) {
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2614  				rval = -ENOMEM;
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2615  				mutex_unlock(&mrioc->bsg_cmds.mutex);
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2616  				goto out;
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2617  			}
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2618  		} else if (nvme_fmt == MPI3MR_NVME_DATA_FORMAT_SGL1 ||
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2619  			nvme_fmt == MPI3MR_NVME_DATA_FORMAT_SGL2) {
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2620  			if (mpi3mr_build_nvme_sgl(mrioc,
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2621  			    (struct mpi3_nvme_encapsulated_request *)mpi_req,
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2622  			    drv_bufs, bufcnt)) {
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2623  				rval = -EINVAL;
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2624  				mutex_unlock(&mrioc->bsg_cmds.mutex);
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2625  				goto out;
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2626  			}
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2627  		} else {
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2628  			dprint_bsg_err(mrioc,
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2629  			    "%s:invalid NVMe command format\n", __func__);
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2630  			rval = -EINVAL;
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2631  			mutex_unlock(&mrioc->bsg_cmds.mutex);
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2632  			goto out;
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2633  		}
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2634  	} else {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2635  		if (mpi3mr_bsg_build_sgl(mrioc, mpi_req, mpi_msg_size,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2636  					 drv_bufs, bufcnt, is_rmcb, is_rmrb,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2637  					 (dout_cnt + din_cnt))) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2638  			dprint_bsg_err(mrioc, "%s: sgl build failed\n", __func__);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2639  			rval = -EAGAIN;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2640  			mutex_unlock(&mrioc->bsg_cmds.mutex);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2641  			goto out;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2642  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2643  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2644  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2645  	if (mpi_header->function == MPI3_BSG_FUNCTION_SCSI_TASK_MGMT) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2646  		tm_req = (struct mpi3_scsi_task_mgmt_request *)mpi_req;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2647  		if (tm_req->task_type !=
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2648  		    MPI3_SCSITASKMGMT_TASKTYPE_ABORT_TASK) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2649  			dev_handle = tm_req->dev_handle;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2650  			block_io = 1;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2651  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2652  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2653  	if (block_io) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2654  		tgtdev = mpi3mr_get_tgtdev_by_handle(mrioc, dev_handle);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2655  		if (tgtdev && tgtdev->starget && tgtdev->starget->hostdata) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2656  			stgt_priv = (struct mpi3mr_stgt_priv_data *)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2657  			    tgtdev->starget->hostdata;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2658  			atomic_inc(&stgt_priv->block_io);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2659  			mpi3mr_tgtdev_put(tgtdev);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2660  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2661  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2662  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2663  	mrioc->bsg_cmds.state = MPI3MR_CMD_PENDING;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2664  	mrioc->bsg_cmds.is_waiting = 1;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2665  	mrioc->bsg_cmds.callback = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2666  	mrioc->bsg_cmds.is_sense = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2667  	mrioc->bsg_cmds.sensebuf = sense_buff_k;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2668  	memset(mrioc->bsg_cmds.reply, 0, mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2669  	mpi_header->host_tag = cpu_to_le16(MPI3MR_HOSTTAG_BSG_CMDS);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2670  	if (mrioc->logging_level & MPI3_DEBUG_BSG_INFO) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2671  		dprint_bsg_info(mrioc,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2672  		    "%s: posting bsg request to the controller\n", __func__);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2673  		dprint_dump(mpi_req, MPI3MR_ADMIN_REQ_FRAME_SZ,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2674  		    "bsg_mpi3_req");
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2675  		if (mpi_header->function == MPI3_BSG_FUNCTION_MGMT_PASSTHROUGH) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2676  			drv_buf_iter = &drv_bufs[0];
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2677  			dprint_dump(drv_buf_iter->kern_buf,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2678  			    rmc_size, "mpi3_mgmt_req");
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2679  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2680  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2681  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2682  	init_completion(&mrioc->bsg_cmds.done);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2683  	rval = mpi3mr_admin_request_post(mrioc, mpi_req,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2684  	    MPI3MR_ADMIN_REQ_FRAME_SZ, 0);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2685  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2686  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2687  	if (rval) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2688  		mrioc->bsg_cmds.is_waiting = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2689  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2690  		    "%s: posting bsg request is failed\n", __func__);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2691  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2692  		goto out_unlock;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2693  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2694  	wait_for_completion_timeout(&mrioc->bsg_cmds.done,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2695  	    (karg->timeout * HZ));
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2696  	if (block_io && stgt_priv)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2697  		atomic_dec(&stgt_priv->block_io);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2698  	if (!(mrioc->bsg_cmds.state & MPI3MR_CMD_COMPLETE)) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2699  		mrioc->bsg_cmds.is_waiting = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2700  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2701  		if (mrioc->bsg_cmds.state & MPI3MR_CMD_RESET)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2702  			goto out_unlock;
0a2714b787b911 Ranjan Kumar         2024-03-13  2703  		if (((mpi_header->function != MPI3_FUNCTION_SCSI_IO) &&
0a2714b787b911 Ranjan Kumar         2024-03-13  2704  		    (mpi_header->function != MPI3_FUNCTION_NVME_ENCAPSULATED))
0a2714b787b911 Ranjan Kumar         2024-03-13  2705  		    || (mrioc->logging_level & MPI3_DEBUG_BSG_ERROR)) {
0a2714b787b911 Ranjan Kumar         2024-03-13  2706  			ioc_info(mrioc, "%s: bsg request timedout after %d seconds\n",
0a2714b787b911 Ranjan Kumar         2024-03-13  2707  			    __func__, karg->timeout);
0a2714b787b911 Ranjan Kumar         2024-03-13  2708  			if (!(mrioc->logging_level & MPI3_DEBUG_BSG_INFO)) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2709  				dprint_dump(mpi_req, MPI3MR_ADMIN_REQ_FRAME_SZ,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2710  			    "bsg_mpi3_req");
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2711  			if (mpi_header->function ==
0a2714b787b911 Ranjan Kumar         2024-03-13  2712  			    MPI3_FUNCTION_MGMT_PASSTHROUGH) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2713  				drv_buf_iter = &drv_bufs[0];
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2714  				dprint_dump(drv_buf_iter->kern_buf,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2715  				    rmc_size, "mpi3_mgmt_req");
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2716  				}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2717  			}
0a2714b787b911 Ranjan Kumar         2024-03-13  2718  		}
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2719  		if ((mpi_header->function == MPI3_BSG_FUNCTION_NVME_ENCAPSULATED) ||
0a2714b787b911 Ranjan Kumar         2024-03-13  2720  			(mpi_header->function == MPI3_BSG_FUNCTION_SCSI_IO)) {
0a2714b787b911 Ranjan Kumar         2024-03-13  2721  			dprint_bsg_err(mrioc, "%s: bsg request timedout after %d seconds,\n"
0a2714b787b911 Ranjan Kumar         2024-03-13  2722  				"issuing target reset to (0x%04x)\n", __func__,
0a2714b787b911 Ranjan Kumar         2024-03-13  2723  				karg->timeout, mpi_header->function_dependent);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2724  			mpi3mr_issue_tm(mrioc,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2725  			    MPI3_SCSITASKMGMT_TASKTYPE_TARGET_RESET,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2726  			    mpi_header->function_dependent, 0,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2727  			    MPI3MR_HOSTTAG_BLK_TMS, MPI3MR_RESETTM_TIMEOUT,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2728  			    &mrioc->host_tm_cmds, &resp_code, NULL);
0a2714b787b911 Ranjan Kumar         2024-03-13  2729  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2730  		if (!(mrioc->bsg_cmds.state & MPI3MR_CMD_COMPLETE) &&
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2731  		    !(mrioc->bsg_cmds.state & MPI3MR_CMD_RESET))
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2732  			mpi3mr_soft_reset_handler(mrioc,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2733  			    MPI3MR_RESET_FROM_APP_TIMEOUT, 1);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2734  		goto out_unlock;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2735  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2736  	dprint_bsg_info(mrioc, "%s: bsg request is completed\n", __func__);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2737  
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2738  	if (mrioc->prp_list_virt) {
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2739  		dma_free_coherent(&mrioc->pdev->dev, mrioc->prp_sz,
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2740  		    mrioc->prp_list_virt, mrioc->prp_list_dma);
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2741  		mrioc->prp_list_virt = NULL;
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2742  	}
7dbd0dd8cde356 Sumit Saxena         2022-04-29  2743  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2744  	if ((mrioc->bsg_cmds.ioc_status & MPI3_IOCSTATUS_STATUS_MASK)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2745  	     != MPI3_IOCSTATUS_SUCCESS) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2746  		dprint_bsg_info(mrioc,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2747  		    "%s: command failed, ioc_status(0x%04x) log_info(0x%08x)\n",
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2748  		    __func__,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2749  		    (mrioc->bsg_cmds.ioc_status & MPI3_IOCSTATUS_STATUS_MASK),
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2750  		    mrioc->bsg_cmds.ioc_loginfo);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2751  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2752  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2753  	if ((mpirep_offset != 0xFF) &&
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2754  	    drv_bufs[mpirep_offset].bsg_buf_len) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2755  		drv_buf_iter = &drv_bufs[mpirep_offset];
429846b4b6ce98 Shin'ichiro Kawasaki 2024-03-23  2756  		drv_buf_iter->kern_buf_len = (sizeof(*bsg_reply_buf) +
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2757  					   mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2758  		bsg_reply_buf = kzalloc(drv_buf_iter->kern_buf_len, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2759  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2760  		if (!bsg_reply_buf) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2761  			rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2762  			goto out_unlock;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2763  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2764  		if (mrioc->bsg_cmds.state & MPI3MR_CMD_REPLY_VALID) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2765  			bsg_reply_buf->mpi_reply_type =
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2766  				MPI3MR_BSG_MPI_REPLY_BUFTYPE_ADDRESS;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2767  			memcpy(bsg_reply_buf->reply_buf,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2768  			    mrioc->bsg_cmds.reply, mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2769  		} else {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2770  			bsg_reply_buf->mpi_reply_type =
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2771  				MPI3MR_BSG_MPI_REPLY_BUFTYPE_STATUS;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2772  			status_desc = (struct mpi3_status_reply_descriptor *)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2773  			    bsg_reply_buf->reply_buf;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2774  			status_desc->ioc_status = mrioc->bsg_cmds.ioc_status;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2775  			status_desc->ioc_log_info = mrioc->bsg_cmds.ioc_loginfo;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2776  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2777  		tmplen = min(drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2778  			drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2779  		memcpy(drv_buf_iter->bsg_buf, bsg_reply_buf, tmplen);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2780  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2781  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2782  	if (erb_offset != 0xFF && mrioc->bsg_cmds.sensebuf &&
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2783  	    mrioc->bsg_cmds.is_sense) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2784  		drv_buf_iter = &drv_bufs[erb_offset];
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2785  		tmplen = min(erbsz, drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2786  		memcpy(drv_buf_iter->bsg_buf, sense_buff_k, tmplen);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2787  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2788  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2789  	drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2790  	for (count = 0; count < bufcnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2791  		if (drv_buf_iter->data_dir == DMA_NONE)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2792  			continue;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2793  		if ((count == 1) && is_rmrb) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2794  			memcpy(drv_buf_iter->bsg_buf,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2795  			    drv_buf_iter->kern_buf,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2796  			    drv_buf_iter->kern_buf_len);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2797  		} else if (drv_buf_iter->data_dir == DMA_FROM_DEVICE) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2798  			tmplen = 0;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2799  			for (desc_count = 0;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2800  			    desc_count < drv_buf_iter->num_dma_desc;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2801  			    desc_count++) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2802  				memcpy(((u8 *)drv_buf_iter->bsg_buf + tmplen),
fb231d7deffb41 Chandrakanth patil   2023-12-06  2803  				       drv_buf_iter->dma_desc[desc_count].addr,
fb231d7deffb41 Chandrakanth patil   2023-12-06  2804  				       drv_buf_iter->dma_desc[desc_count].size);
fb231d7deffb41 Chandrakanth patil   2023-12-06  2805  				tmplen +=
fb231d7deffb41 Chandrakanth patil   2023-12-06  2806  				    drv_buf_iter->dma_desc[desc_count].size;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2807  		}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2808  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2809  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2810  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2811  out_unlock:
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2812  	if (din_buf) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2813  		job->reply_payload_rcv_len =
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2814  			sg_copy_from_buffer(job->reply_payload.sg_list,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2815  					    job->reply_payload.sg_cnt,
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2816  					    din_buf, job->reply_payload.payload_len);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2817  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2818  	mrioc->bsg_cmds.is_sense = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2819  	mrioc->bsg_cmds.sensebuf = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2820  	mrioc->bsg_cmds.state = MPI3MR_CMD_NOTUSED;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2821  	mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2822  out:
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2823  	kfree(sense_buff_k);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2824  	kfree(dout_buf);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2825  	kfree(din_buf);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2826  	kfree(mpi_req);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2827  	if (drv_bufs) {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2828  		drv_buf_iter = drv_bufs;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2829  		for (count = 0; count < bufcnt; count++, drv_buf_iter++)
fb231d7deffb41 Chandrakanth patil   2023-12-06  2830  			kfree(drv_buf_iter->dma_desc);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2831  		kfree(drv_bufs);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2832  	}
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2833  	kfree(bsg_reply_buf);
506bc1a0d6ba62 Sumit Saxena         2022-04-29 @2834  	return rval;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2835  }
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2836  

:::::: The code at line 2834 was first introduced by commit
:::::: 506bc1a0d6ba626492c06e5632a3fbe202770fd2 scsi: mpi3mr: Add support for MPT commands

:::::: TO: Sumit Saxena <sumit.saxena@broadcom.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
