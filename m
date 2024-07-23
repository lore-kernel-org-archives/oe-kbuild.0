Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6CF13C8EE
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jul 2024 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721760773; cv=none; b=eKNRioHzqEb7o/k1vvkHHItOxqRTpjQYmGYRtU2oPXAoa3CktVRdobRAEXK8O6i+J0uxtjgQzIkLwY9v3xclqYtG1uvdPIhwS86j89noTkHFMt4dUYGkmXxqwTh781uSE7E3G+86X+v03/APCdtuGyBFrNejpdIpDTyzTlBk/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721760773; c=relaxed/simple;
	bh=I3qqzIPcOVttR4KO0h/TVx8/bAKPo+aIaT43yxRciYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=theZHLT6872YJb+1gD1JhQsvwkqdign9CC72IEs5Klu8RXCnkNZzf4N9VpNIa+b0S/n6TbkXuW5SctL3FaqN4HYPkCgn6vL3H/rykdydFeJMT6RA1GEY4oMWpzHPQX9Iq2gy5FasflQGGkyzloPP9VZPHAntia+xFSRQmIC5O7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=abBOfY5v; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="abBOfY5v"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7044c085338so3325426a34.2
        for <oe-kbuild@lists.linux.dev>; Tue, 23 Jul 2024 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721760770; x=1722365570; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+1U6RJ2NItPVIrD/Ztovzd5skJgdRj4cfCS6MVn2qs=;
        b=abBOfY5vYeMTjJu9vcxBOLgm2rK4/M8vYuKZVnQVwKk/i6nn+nfWhVRQdOiZfS269Y
         ryM+CT84fMRF27LaXvxcKGrhWH5AptmQQlu7jc08uw2Q9AOta1z1d70hhKDz8ACPxbQW
         Lg4KqyR0xd6m80Yqs7bvTA5+D4pa+PCsoe/mmrMLzra+y1GaunNd+sjR2uC4Dtbaajs0
         5pVbkpr3FO/s602mX+pztv3fAFuL1mhz/ih/BwDlanAS9P73KJWtYVrQ5972gPkSdb4L
         Esht7iG86TRMDF9pMn91Wi89BmTd1rdiAq56kN9lKvCFmtX9cH0LBrVzIDdjmHHCLsdI
         hPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721760770; x=1722365570;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+1U6RJ2NItPVIrD/Ztovzd5skJgdRj4cfCS6MVn2qs=;
        b=cSlrJEkLIhCUy7rzFAgp+uYy4pGQ3S1VRiD1wNCYgIR0Fx1c6DQwIgdHZxs79RJmAO
         au1jeBRwK1Azc8AgQeH86GRARShEWTZOLZi0EJH4FDdafpaucqTDcxDTevZePAu/pXLH
         YdMlSlzotCfDPF0HDLzpqHnRSNze50EtvYa7s2A0Z7FVWIZIWBoJlOcBQJtgBRiMJJbd
         b5wlwxxeliBcJ1KzNZY5GpATl+nMpP6w4SpFAfNm9C4iX4m5qPQzSVVEq4Rp+SklMXkn
         CoxDJcQ6qgCBREnE/gKKXGKFhrNSarLSBo5e6degZbqw0oafcCL9Mx4th5feqnrxMKmG
         mntw==
X-Gm-Message-State: AOJu0YyFu4PqQIJxhJb2b45eDWDOZSZeRhAD5A0cADQmk5ia+EexgioZ
	yAycqE+0R23NW0LMFlexwcoBRj75HX5BjzGNXLUnRrMhzF9nNWCHbrFckqcqfpKbtRcNRsHfvQc
	M
X-Google-Smtp-Source: AGHT+IGNMEVlXB+5zF7wMl4AQKl28uLYFF74Cz7JAMAkx3CgLRP/W1EKqF1VK3V37/dX1OppY8KC/A==
X-Received: by 2002:a05:6870:891f:b0:261:e19:4587 with SMTP id 586e51a60fabf-264876023demr605282fac.6.1721760769894;
        Tue, 23 Jul 2024 11:52:49 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eca3:bb93:d28d:1005])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2642ca952d0sm1730446fac.37.2024.07.23.11.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 11:52:48 -0700 (PDT)
Date: Tue, 23 Jul 2024 13:52:46 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nirmoy Das <nirmoy.das@intel.com>
Subject: [linux-next:master 13298/13495]
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:183 send_tlb_invalidation()
 warn: variable dereferenced before check 'fence' (see line 178)
Message-ID: <c8d58c8d-4e89-471b-853c-49d365d7f4d4@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dee7f101b64219f512bb2f842227bd04c14efe30
commit: 61ac035361ae555ee5a17a7667fe96afdde3d59a [13298/13495] drm/xe: Drop xe_gt_tlb_invalidation_wait
config: i386-randconfig-141-20240722 (https://download.01.org/0day-ci/archive/20240723/202407231049.esig0Fkb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407231049.esig0Fkb-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:183 send_tlb_invalidation() warn: variable dereferenced before check 'fence' (see line 178)

vim +/fence +183 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c

fc108a8b759f52 Matthew Brost        2023-01-17  159  static int send_tlb_invalidation(struct xe_guc *guc,
332dd0116c82a7 Matthew Brost        2023-01-24  160  				 struct xe_gt_tlb_invalidation_fence *fence,
332dd0116c82a7 Matthew Brost        2023-01-24  161  				 u32 *action, int len)
a9351846d94568 Matthew Brost        2023-01-17  162  {
a9351846d94568 Matthew Brost        2023-01-17  163  	struct xe_gt *gt = guc_to_gt(guc);
501c4255c40935 Radhakrishna Sripada 2024-06-07  164  	struct xe_device *xe = gt_to_xe(gt);
a9351846d94568 Matthew Brost        2023-01-17  165  	int seqno;
a9351846d94568 Matthew Brost        2023-01-17  166  	int ret;
a9351846d94568 Matthew Brost        2023-01-17  167  
61ac035361ae55 Matthew Brost        2024-07-19  168  	xe_gt_assert(gt, fence);
61ac035361ae55 Matthew Brost        2024-07-19  169  
a9351846d94568 Matthew Brost        2023-01-17  170  	/*
a9351846d94568 Matthew Brost        2023-01-17  171  	 * XXX: The seqno algorithm relies on TLB invalidation being processed
a9351846d94568 Matthew Brost        2023-01-17  172  	 * in order which they currently are, if that changes the algorithm will
a9351846d94568 Matthew Brost        2023-01-17  173  	 * need to be updated.
a9351846d94568 Matthew Brost        2023-01-17  174  	 */
565ce72e1c2d54 Matthew Auld         2023-05-24  175  
a9351846d94568 Matthew Brost        2023-01-17  176  	mutex_lock(&guc->ct.lock);
62ad062150c2ab Matthew Brost        2023-01-17  177  	seqno = gt->tlb_invalidation.seqno;
fc108a8b759f52 Matthew Brost        2023-01-17 @178  	fence->seqno = seqno;
                                                        ^^^^^^^^^^^^^^^^^^^^
Dereference

501c4255c40935 Radhakrishna Sripada 2024-06-07  179  	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
a9351846d94568 Matthew Brost        2023-01-17  180  	action[1] = seqno;
332dd0116c82a7 Matthew Brost        2023-01-24  181  	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
a9351846d94568 Matthew Brost        2023-01-17  182  				    G2H_LEN_DW_TLB_INVALIDATE, 1);
38224c00d9c284 Matthew Brost        2023-01-24 @183  	if (!ret && fence) {
                                                                    ^^^^^
Checked too late

35c8a964398e1c Matthew Auld         2023-07-10  184  		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
35c8a964398e1c Matthew Auld         2023-07-10  185  		/*
35c8a964398e1c Matthew Auld         2023-07-10  186  		 * We haven't actually published the TLB fence as per
35c8a964398e1c Matthew Auld         2023-07-10  187  		 * pending_fences, but in theory our seqno could have already
35c8a964398e1c Matthew Auld         2023-07-10  188  		 * been written as we acquired the pending_lock. In such a case
35c8a964398e1c Matthew Auld         2023-07-10  189  		 * we can just go ahead and signal the fence here.
35c8a964398e1c Matthew Auld         2023-07-10  190  		 */
35c8a964398e1c Matthew Auld         2023-07-10  191  		if (tlb_invalidation_seqno_past(gt, seqno)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

