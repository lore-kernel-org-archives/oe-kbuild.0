Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850204;
	b=bZ23BJR4lkaiMqcVFIi8B8uNLqAY5OjoRudoPlLQ5iYx007dXu4sEYWJrRcIUCHT29ue
	 VB6K6OQKL4B8kiOtm3Z7YQDF5KnQCoOOcWvVrhUmQnJDno7bgbMWAgtaPYq/zP9FuwKEs
	 b6QbfhGKnls6vThznqnGOUlALCuoTPGX0/tdziQKREtVzNyWUekjXXbkTXpUxpC1Jex2x
	 qbIqPia6j7D8Q24VGcz8NjCoChMkdMJNLLvZW8SM4hcmA9yk1zYV12jxyRGzL1Xhw0lcM
	 aE0w/RomXjngkhprLDW8ykVuUOU6P4tMdA9kBLd+6ojrYE36FA0Hch9niMmbMpPIOcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850204;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=j6VTwdyrowKsiltXxZyTFToG5oX4X6FvzbTa72rg1xI=;
	b=Y75EFgz63Qqwwob30soGlNjFkr6KvCjTYLJXJUDim+OANckTk/0pgueoS3VwQS4VLkpZ
	 ZR8UwJa1nvy6kfgWhXNPYh6wJkYb/TP8pb8cf9DrwYUpFl1o2v3MB7aB3gq2yBotMPVn2
	 SmBeWoosXJIX+RHG2pMm71rWWROAf4RGrTZf+Awh6eKcAZlUQDfctdvHt5yKpb8UL42nw
	 jJ1QiBWhN24Xq3diBl+VTZ91mRSOwE5EKK6OR8ILjyKSHuf6T3VzPjX9Qzxc3eUk43Aw3
	 pLPKY0Qp300lfhvr7e/h2qdqlRerBSdi+C02JpweDcEChyJkNSQ6coX3DXEDA0niBqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DjWpnefh;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAADB606A31B
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 03:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAADB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DjWpnefh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793850202; x=1825386202;
  h=date:from:to:cc:subject:message-id;
  bh=Mgs2R8x35kZPKIZcCgriu2gjBbKm4zaJf3uV+wUveaY=;
  b=DjWpnefhbVQGB2mKvuZCtGOHlIaUI3YPHtIQnWrjuEn5PZ5mp6iPevYH
   apeTB1poihZwvdEg5ZFgqM3vlsihal7lUWYBEP00u90hGRnWIvOUNdu3H
   XIcDxXoT8Msw5kYny5fpBBd4PCmTnBJST/fYIz16QKCeiQf7up7JaakyY
   qzVjZZKBwuAykv5C34CIibcKGg3esWFWpnTiUc4zz/W9uF4kvbh4s565c
   QAghfJpMsekjBVkQqIIViVqnrkL02iwOfTtt18erPl7iEItD5TCcyGSod
   FUPtLd7dl0mc04h7NKsxQr7DH5MLWmVRS7eOMtzTVE7fJttSPXZSw5eIS
   g==;
X-CSE-ConnectionGUID: w9w0B4XtRautPPLZO+bIww==
X-CSE-MsgGUID: K2cwWqg+SVGKzRAsZgRq1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2501780"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2501780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:43:22 -0800
X-CSE-ConnectionGUID: pCbhNNI2SCyf1EqMo1jAiw==
X-CSE-MsgGUID: NndnBl0xRLeu7Mx3IyjGUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7197454"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2026 19:43:19 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOoNg-000000009UX-3Cih;
	Thu, 05 Nov 2026 03:43:16 +0000
Date: Thu, 05 Nov 2026 04:43:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cel:nfsd-testing 104/186] fs/nfsd/nfs4proc.c:2397
 nfsd4_copy() error: we previously assumed 'copy->nf_src' could be null (see
 line 2331)
Message-ID: <202611050423.a7Z4V7Uw-lkp@intel.com>
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
TO: Daejun Park <daejun7.park@samsung.com>
CC: Chuck Lever <cel@kernel.org>
CC: Benjamin Coddington <bcodding@hammerspace.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   d692f252c52b8d1b4bc7481554f314df31ed8249
commit: 662ee656ddfd1cd5d49e51c99dedd0960be693f0 [104/186] nfsd: answer NFS4ERR_DELAY instead of waiting for a layout recall
:::::: branch date: 6 hours ago
:::::: commit date: 3 days ago
config: hexagon-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261105/202611050423.a7Z4V7Uw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611050423.a7Z4V7Uw-lkp@intel.com/

smatch warnings:
fs/nfsd/nfs4proc.c:2397 nfsd4_copy() error: we previously assumed 'copy->nf_src' could be null (see line 2331)

vim +2397 fs/nfsd/nfs4proc.c

e0639dc5805a9d Olga Kornievskaia 2018-07-20  2292  
29ae7f9dc21a7d Anna Schumaker    2016-09-07  2293  static __be32
29ae7f9dc21a7d Anna Schumaker    2016-09-07  2294  nfsd4_copy(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
eb69853da94592 Christoph Hellwig 2017-05-08  2295  		union nfsd4_op_u *u)
29ae7f9dc21a7d Anna Schumaker    2016-09-07  2296  {
9ed666eba4e0a2 Chuck Lever       2024-08-28  2297  	struct nfsd_net *nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
f307b4f7ed174a Jeff Layton       2026-07-10  2298  	struct nfsd4_async_copy *async_copy = NULL;
eb69853da94592 Christoph Hellwig 2017-05-08  2299  	struct nfsd4_copy *copy = &u->copy;
9ed666eba4e0a2 Chuck Lever       2024-08-28  2300  	struct nfsd42_write_res *result;
662ee656ddfd1c Daejun Park       2026-10-15  2301  	struct inode *src, *dst;
29ae7f9dc21a7d Anna Schumaker    2016-09-07  2302  	__be32 status;
29ae7f9dc21a7d Anna Schumaker    2016-09-07  2303  
9ed666eba4e0a2 Chuck Lever       2024-08-28  2304  	result = &copy->cp_res;
9ed666eba4e0a2 Chuck Lever       2024-08-28  2305  	nfsd_copy_write_verifier((__be32 *)&result->wr_verifier.data, nn);
9ed666eba4e0a2 Chuck Lever       2024-08-28  2306  
15d1975b727969 Dai Ngo           2023-08-30  2307  	copy->cp_clp = cstate->clp;
1913cdf56cb5bf Chuck Lever       2022-07-27  2308  	if (nfsd4_ssc_is_inter(copy)) {
5896a870546105 Dai Ngo           2023-08-31  2309  		trace_nfsd_copy_inter(copy);
1913cdf56cb5bf Chuck Lever       2022-07-27  2310  		if (!inter_copy_offload_enable || nfsd4_copy_is_sync(copy)) {
ce0887ac96d35c Olga Kornievskaia 2019-10-09  2311  			status = nfserr_notsupp;
29ae7f9dc21a7d Anna Schumaker    2016-09-07  2312  			goto out;
ce0887ac96d35c Olga Kornievskaia 2019-10-09  2313  		}
df24ac7a2e3a9d Dai Ngo           2022-12-18  2314  		status = nfsd4_setup_inter_ssc(rqstp, cstate, copy);
5896a870546105 Dai Ngo           2023-08-31  2315  		if (status) {
88a76145451d70 Jeff Layton       2026-05-31  2316  			status = nfserr_offload_denied;
88a76145451d70 Jeff Layton       2026-05-31  2317  			goto out;
5896a870546105 Dai Ngo           2023-08-31  2318  		}
ce0887ac96d35c Olga Kornievskaia 2019-10-09  2319  	} else {
5896a870546105 Dai Ngo           2023-08-31  2320  		trace_nfsd_copy_intra(copy);
ce0887ac96d35c Olga Kornievskaia 2019-10-09  2321  		status = nfsd4_setup_intra_ssc(rqstp, cstate, copy);
88a76145451d70 Jeff Layton       2026-05-31  2322  		if (status)
88a76145451d70 Jeff Layton       2026-05-31  2323  			goto out;
5896a870546105 Dai Ngo           2023-08-31  2324  	}
29ae7f9dc21a7d Anna Schumaker    2016-09-07  2325  
662ee656ddfd1c Daejun Park       2026-10-15  2326  	/*
662ee656ddfd1c Daejun Park       2026-10-15  2327  	 * A copy can be done as a clone, which breaks both files. The source
662ee656ddfd1c Daejun Park       2026-10-15  2328  	 * of an inter-server copy is not local.
662ee656ddfd1c Daejun Park       2026-10-15  2329  	 */
662ee656ddfd1c Daejun Park       2026-10-15  2330  	dst = file_inode(copy->nf_dst->nf_file);
662ee656ddfd1c Daejun Park       2026-10-15 @2331  	src = copy->nf_src ? file_inode(copy->nf_src->nf_file) : dst;
662ee656ddfd1c Daejun Park       2026-10-15  2332  	if (nfsd_break_layouts(dst, src != dst ? src : NULL))
662ee656ddfd1c Daejun Park       2026-10-15  2333  		goto out_err;
662ee656ddfd1c Daejun Park       2026-10-15  2334  
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2335  	memcpy(&copy->fh, &cstate->current_fh.fh_handle,
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2336  		sizeof(struct knfsd_fh));
1913cdf56cb5bf Chuck Lever       2022-07-27  2337  	if (nfsd4_copy_is_async(copy)) {
62c0f6eaf050bb Jeff Layton       2026-07-10  2338  		struct task_struct *task;
62c0f6eaf050bb Jeff Layton       2026-07-10  2339  
80c37618341130 Jeff Layton       2026-07-10  2340  		/*
80c37618341130 Jeff Layton       2026-07-10  2341  		 * Allocate the durable async copy. Its offload stateid is a
80c37618341130 Jeff Layton       2026-07-10  2342  		 * first-class nfs4_stid in clp->cl_stateids, returned to the
80c37618341130 Jeff Layton       2026-07-10  2343  		 * client and freed only when the background copy is torn down.
80c37618341130 Jeff Layton       2026-07-10  2344  		 */
80c37618341130 Jeff Layton       2026-07-10  2345  		async_copy = nfs4_alloc_copy_stid(cstate->clp);
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2346  		if (!async_copy)
ce0887ac96d35c Olga Kornievskaia 2019-10-09  2347  			goto out_err;
f307b4f7ed174a Jeff Layton       2026-07-10  2348  		async_copy->cp_copy.cp_nn = nn;
63fab04cbd0f96 Chuck Lever       2024-10-26  2349  		INIT_LIST_HEAD(&async_copy->copies);
63fab04cbd0f96 Chuck Lever       2024-10-26  2350  		refcount_set(&async_copy->refcount, 1);
aa0ebd21df9c90 Chuck Lever       2024-10-31  2351  		async_copy->cp_ttl = NFSD_COPY_INITIAL_TTL;
aadc3bbea163b6 Chuck Lever       2024-08-28  2352  		/* Arbitrary cap on number of pending async copy operations */
aadc3bbea163b6 Chuck Lever       2024-08-28  2353  		if (atomic_inc_return(&nn->pending_async_copies) >
8286f8b6229901 Chuck Lever       2024-10-29  2354  				(int)rqstp->rq_pool->sp_nrthreads)
9048cf05a17a7b Olga Kornievskaia 2024-12-17  2355  			goto out_dec_async_copy_err;
f307b4f7ed174a Jeff Layton       2026-07-10  2356  		async_copy->cp_copy.cp_src = kmalloc_obj(*async_copy->cp_copy.cp_src);
f307b4f7ed174a Jeff Layton       2026-07-10  2357  		if (!async_copy->cp_copy.cp_src)
9048cf05a17a7b Olga Kornievskaia 2024-12-17  2358  			goto out_dec_async_copy_err;
80c37618341130 Jeff Layton       2026-07-10  2359  		memcpy(&result->cb_stateid, &async_copy->cp_stid.sc_stateid,
9ed666eba4e0a2 Chuck Lever       2024-08-28  2360  			sizeof(result->cb_stateid));
f307b4f7ed174a Jeff Layton       2026-07-10  2361  		/*
f307b4f7ed174a Jeff Layton       2026-07-10  2362  		 * dup after writing cb_stateid; duplicating first would leave
f307b4f7ed174a Jeff Layton       2026-07-10  2363  		 * the callback stateid zeroed.
f307b4f7ed174a Jeff Layton       2026-07-10  2364  		 */
f307b4f7ed174a Jeff Layton       2026-07-10  2365  		dup_copy_fields(copy, &async_copy->cp_copy);
4183cf383b6fae Olga Kornievskaia 2026-04-10  2366  		if ((READ_ONCE(copy->nf_dst->nf_file->f_mode) &
4183cf383b6fae Olga Kornievskaia 2026-04-10  2367  			       FMODE_NOCMTIME) != 0)
f307b4f7ed174a Jeff Layton       2026-07-10  2368  			async_copy->cp_copy.attr_update = true;
b53a42970fa484 Chuck Lever       2025-03-01  2369  		memcpy(async_copy->cp_cb_offload.co_referring_sessionid.data,
b53a42970fa484 Chuck Lever       2025-03-01  2370  		       cstate->session->se_sessionid.data,
b53a42970fa484 Chuck Lever       2025-03-01  2371  		       NFS4_MAX_SESSIONID_LEN);
b53a42970fa484 Chuck Lever       2025-03-01  2372  		async_copy->cp_cb_offload.co_referring_slotid = cstate->slot->sl_index;
b53a42970fa484 Chuck Lever       2025-03-01  2373  		async_copy->cp_cb_offload.co_referring_seqno = cstate->slot->sl_seqid;
62c0f6eaf050bb Jeff Layton       2026-07-10  2374  		task = kthread_create(nfsd4_do_async_copy, async_copy,
62c0f6eaf050bb Jeff Layton       2026-07-10  2375  				      "%s", "copy thread");
62c0f6eaf050bb Jeff Layton       2026-07-10  2376  		if (IS_ERR(task))
9048cf05a17a7b Olga Kornievskaia 2024-12-17  2377  			goto out_dec_async_copy_err;
62c0f6eaf050bb Jeff Layton       2026-07-10  2378  		/*
62c0f6eaf050bb Jeff Layton       2026-07-10  2379  		 * Pin the task_struct so kthread_stop() is safe after this
62c0f6eaf050bb Jeff Layton       2026-07-10  2380  		 * one-shot kthread exits. Released by nfs4_put_copy().
62c0f6eaf050bb Jeff Layton       2026-07-10  2381  		 */
62c0f6eaf050bb Jeff Layton       2026-07-10  2382  		get_task_struct(task);
62c0f6eaf050bb Jeff Layton       2026-07-10  2383  		async_copy->copy_task = task;
62c0f6eaf050bb Jeff Layton       2026-07-10  2384  		/*
62c0f6eaf050bb Jeff Layton       2026-07-10  2385  		 * Take the kthread's ref and wake it before publishing, so the
62c0f6eaf050bb Jeff Layton       2026-07-10  2386  		 * publisher touches async_copy no further and teardown can
62c0f6eaf050bb Jeff Layton       2026-07-10  2387  		 * drain it.
62c0f6eaf050bb Jeff Layton       2026-07-10  2388  		 */
62c0f6eaf050bb Jeff Layton       2026-07-10  2389  		refcount_inc(&async_copy->refcount);
62c0f6eaf050bb Jeff Layton       2026-07-10  2390  		wake_up_process(async_copy->copy_task);
f307b4f7ed174a Jeff Layton       2026-07-10  2391  		spin_lock(&async_copy->cp_copy.cp_clp->async_lock);
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2392  		list_add(&async_copy->copies,
f307b4f7ed174a Jeff Layton       2026-07-10  2393  				&async_copy->cp_copy.cp_clp->async_copies);
f307b4f7ed174a Jeff Layton       2026-07-10  2394  		spin_unlock(&async_copy->cp_copy.cp_clp->async_lock);
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2395  		status = nfs_ok;
ce0887ac96d35c Olga Kornievskaia 2019-10-09  2396  	} else {
3b7bf5933cada7 Chuck Lever       2022-07-27 @2397  		status = nfsd4_do_copy(copy, copy->nf_src->nf_file,
3b7bf5933cada7 Chuck Lever       2022-07-27  2398  				       copy->nf_dst->nf_file, true);
4183cf383b6fae Olga Kornievskaia 2026-04-10  2399  		if ((READ_ONCE(copy->nf_dst->nf_file->f_mode) &
4183cf383b6fae Olga Kornievskaia 2026-04-10  2400  			       FMODE_NOCMTIME) != 0 &&
4183cf383b6fae Olga Kornievskaia 2026-04-10  2401  				copy->cp_res.wr_bytes_written > 0)
4183cf383b6fae Olga Kornievskaia 2026-04-10  2402  			nfsd_update_cmtime_attr(copy->nf_dst->nf_file, 0);
ce0887ac96d35c Olga Kornievskaia 2019-10-09  2403  	}
29ae7f9dc21a7d Anna Schumaker    2016-09-07  2404  out:
5896a870546105 Dai Ngo           2023-08-31  2405  	trace_nfsd_copy_done(copy, status);
6ba434cb1a8d40 Jeff Layton       2023-01-17  2406  	release_copy_files(copy);
29ae7f9dc21a7d Anna Schumaker    2016-09-07  2407  	return status;
9048cf05a17a7b Olga Kornievskaia 2024-12-17  2408  out_dec_async_copy_err:
9048cf05a17a7b Olga Kornievskaia 2024-12-17  2409  	if (async_copy)
9048cf05a17a7b Olga Kornievskaia 2024-12-17  2410  		atomic_dec(&nn->pending_async_copies);
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2411  out_err:
34e8f9ec4c9ac2 Dai Ngo           2023-01-23  2412  	if (nfsd4_ssc_is_inter(copy)) {
34e8f9ec4c9ac2 Dai Ngo           2023-01-23  2413  		/*
34e8f9ec4c9ac2 Dai Ngo           2023-01-23  2414  		 * Source's vfsmount of inter-copy will be unmounted
34e8f9ec4c9ac2 Dai Ngo           2023-01-23  2415  		 * by the laundromat. Use copy instead of async_copy
34e8f9ec4c9ac2 Dai Ngo           2023-01-23  2416  		 * since async_copy->ss_nsui might not be set yet.
34e8f9ec4c9ac2 Dai Ngo           2023-01-23  2417  		 */
34e8f9ec4c9ac2 Dai Ngo           2023-01-23  2418  		refcount_dec(&copy->ss_nsui->nsui_refcnt);
34e8f9ec4c9ac2 Dai Ngo           2023-01-23  2419  	}
18f428d4e2f7ef Olga Kornievskaia 2019-12-04  2420  	if (async_copy)
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2421  		cleanup_async_copy(async_copy);
aadc3bbea163b6 Chuck Lever       2024-08-28  2422  	status = nfserr_jukebox;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2423  	goto out;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2424  }
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2425  

:::::: The code at line 2397 was first introduced by commit
:::::: 3b7bf5933cada732783554edf0dc61283551c6cf NFSD: Refactor nfsd4_do_copy()

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
