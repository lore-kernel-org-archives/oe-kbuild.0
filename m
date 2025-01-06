Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083E1D935E
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736158125; cv=none; b=kQ+lOp+ouvPWAbULb1MZ7ybJ5FHG8dZSGN1/AVjPdZARHMRZdY8FiSiIEVSncMpHoNtaVYrcI4GwtVhpaDmGSaneDmQFXKkVsFlUR9kh1grqdFiJoucdM1tmcrGvJdZkMTRl66dIqNmY8oL3C1PDq8PmLOc9kqrGhIaVsnLtUow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736158125; c=relaxed/simple;
	bh=bK2ZK6YEoiVpV6s0bXqetQps2Vmy4XXLJAdQvoOYHUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GwYGh7tmrEnW1BywUHxzP9LOgHQHf+K33GQXTDMZrqSuDB4AZN2G2MF2SafjhjWlHpPluEFjBeRUiPcjsCCw4DD0DTkjLLeTSI50mJ0gINl7vjritBnAs79y2+heVWGQQonhU4sBRM2Rt2G2gc9sLI7FCGEOl1uiGRK2nwuEgc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uIVHBC8J; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uIVHBC8J"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385e06af753so7086574f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 02:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736158121; x=1736762921; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bekk/anIftJhofyqeEGu2AFER2kwDSN5jrdmfvpEwLo=;
        b=uIVHBC8JxgG6DutIDG/sMUAvN5v6pw3Pe7UVjzCsAYSpxCfWYigIXh3/b3tXy2cqlb
         umILRfskUKA0gM4qdKa0pbIQxMEblE2eOR17OetFZahbcwQMIwc9l6AhVIyx/3QQdNeU
         FK4CKI1KyMVqAMh5BS+1x9mz4LxZJSCeHoFmz1sn3yORuOP3zRlfDcGjq9fxuHd10sAo
         y+6e+quKnbqzXdo0oK2I5YV59/PJ9Vru72nCnzqCVfh+uQOePcsz2zCK4zIwbJr8uGFC
         /VEVgt2jHCITxShpdUat3RYlomU+g6Kk4eNzJygaEGFv/BfnShenQs2jjtjtLSMkoOtI
         jvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158121; x=1736762921;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bekk/anIftJhofyqeEGu2AFER2kwDSN5jrdmfvpEwLo=;
        b=KmlSP8BAt4oZ2tud8jnyk0EDFxCGmWdrLuERZkPIdlpiRqXA56UOMbTepLT04k7oEa
         0jiJ5Qn4Kb89ycPH6QEz7pln6wnlAwlfpah3P6Y5vKsOMMjX9TAdrdjxp6iR1eNxVROT
         TgTWFbCLkjmXyFbn2UQF+iCmAvpfdsi7EGQi9cMP3NeGKGQYSYhzQ8OxQibNinMNGL0R
         8yW65nMfFZaxBaQfevf54YQ2hK2SgYe8aDNRAV0U0dTK75j1HUXPJibp8WrwgTVIY8bd
         W5YYkyVuUuMpXzCDGzBL37/cEQc1zoHS28RQPAXmjqXrdsHvqx8jvSG2EmGqp1Yx9T3L
         rgJw==
X-Gm-Message-State: AOJu0YyvyEb+d9hxdcwdmr3Qery7EhGWUwO58/se9dcguhZ3XlHzsv8W
	FE86JVpEn4jfiUXbpruQl8VML/LyAsIQ/cBpi+uMLUTbDKU45LkkooqUUGV6ulNSN2uD9K3RGk4
	O
X-Gm-Gg: ASbGnctH58LVym+nSqXKHZQT4RwH8yC0ZA3opeGo3VKjpGL18zq29zp+cAuaJvFNevT
	0A9flkY6yJ7hzeCMZPg/VNSnUHUD1gBy86BaJqOP6Kwq5teIiFCf7AmK2oRCig0CdC1iDp0j+MM
	jERaV5AKFj7dQ3so9QaYdjPhPCMSLgSEJE/YPzOh23TIC8+vYAvWXcc9jES4mCWeAf22sSN3EDq
	ktxCpmuKAiN8KxITVY/YYP5KW9cL+Xc3W8yE6b7BjHlHJ16htwU1epBYuaz2A==
X-Google-Smtp-Source: AGHT+IFWKbvVq56Omm8+5+8ZoLA1h9dHpLgve5GyrzGmZnD7EJzk2gUUM6zr8C/Du29FRrdAJFhTJw==
X-Received: by 2002:a05:6000:1ac8:b0:385:faad:bfb9 with SMTP id ffacd0b85a97d-38a221e1827mr48904080f8f.8.1736158121091;
        Mon, 06 Jan 2025 02:08:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c848a47sm46931364f8f.62.2025.01.06.02.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:08:40 -0800 (PST)
Date: Mon, 6 Jan 2025 13:08:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 197/197] mm/hugetlb.c:6589
 hugetlb_reserve_pages() error: uninitialized symbol 'chg'.
Message-ID: <95626efa-8178-4b40-97e5-2149f9cdce5f@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   1e9745a1ca80aa1eaa5db90d17ed4dbbf6ef1bbb
commit: 8d9bfb2608145cf3e408428c224099e1585471af [197/197] hugetlb: add vma based lock for pmd sharing
config: i386-randconfig-141-20241219 (https://download.01.org/0day-ci/archive/20241224/202412241840.BySsKCf0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412241840.BySsKCf0-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:6589 hugetlb_reserve_pages() error: uninitialized symbol 'chg'.

vim +/chg +6589 mm/hugetlb.c

33b8f84a4ee784 Mike Kravetz    2021-02-24  6438  /* Return true if reservation was successful, false otherwise.  */
33b8f84a4ee784 Mike Kravetz    2021-02-24  6439  bool hugetlb_reserve_pages(struct inode *inode,
a1e78772d72b26 Mel Gorman      2008-07-23  6440  					long from, long to,
5a6fe125950676 Mel Gorman      2009-02-10  6441  					struct vm_area_struct *vma,
ca16d140af91fe KOSAKI Motohiro 2011-05-26  6442  					vm_flags_t vm_flags)
e4e574b767ba63 Adam Litke      2007-10-16  6443  {
33b8f84a4ee784 Mike Kravetz    2021-02-24  6444  	long chg, add = -1;
a5516438959d90 Andi Kleen      2008-07-23  6445  	struct hstate *h = hstate_inode(inode);
90481622d75715 David Gibson    2012-03-21  6446  	struct hugepage_subpool *spool = subpool_inode(inode);
9119a41e9091fb Joonsoo Kim     2014-04-03  6447  	struct resv_map *resv_map;
075a61d07a8eca Mina Almasry    2020-04-01  6448  	struct hugetlb_cgroup *h_cg = NULL;
0db9d74ed8845a Mina Almasry    2020-04-01  6449  	long gbl_reserve, regions_needed = 0;
e4e574b767ba63 Adam Litke      2007-10-16  6450  
63489f8e821144 Mike Kravetz    2018-03-22  6451  	/* This should never happen */
63489f8e821144 Mike Kravetz    2018-03-22  6452  	if (from > to) {
63489f8e821144 Mike Kravetz    2018-03-22  6453  		VM_WARN(1, "%s called with a negative range\n", __func__);
33b8f84a4ee784 Mike Kravetz    2021-02-24  6454  		return false;
63489f8e821144 Mike Kravetz    2018-03-22  6455  	}
63489f8e821144 Mike Kravetz    2018-03-22  6456  
8d9bfb2608145c Mike Kravetz    2022-09-14  6457  	/*
8d9bfb2608145c Mike Kravetz    2022-09-14  6458  	 * vma specific semaphore used for pmd sharing synchronization
8d9bfb2608145c Mike Kravetz    2022-09-14  6459  	 */
8d9bfb2608145c Mike Kravetz    2022-09-14  6460  	hugetlb_vma_lock_alloc(vma);
8d9bfb2608145c Mike Kravetz    2022-09-14  6461  
17c9d12e126cb0 Mel Gorman      2009-02-11  6462  	/*
17c9d12e126cb0 Mel Gorman      2009-02-11  6463  	 * Only apply hugepage reservation if asked. At fault time, an
17c9d12e126cb0 Mel Gorman      2009-02-11  6464  	 * attempt will be made for VM_NORESERVE to allocate a page
90481622d75715 David Gibson    2012-03-21  6465  	 * without using reserves
17c9d12e126cb0 Mel Gorman      2009-02-11  6466  	 */
ca16d140af91fe KOSAKI Motohiro 2011-05-26  6467  	if (vm_flags & VM_NORESERVE)
33b8f84a4ee784 Mike Kravetz    2021-02-24  6468  		return true;
17c9d12e126cb0 Mel Gorman      2009-02-11  6469  
a1e78772d72b26 Mel Gorman      2008-07-23  6470  	/*
a1e78772d72b26 Mel Gorman      2008-07-23  6471  	 * Shared mappings base their reservation on the number of pages that
a1e78772d72b26 Mel Gorman      2008-07-23  6472  	 * are already allocated on behalf of the file. Private mappings need
a1e78772d72b26 Mel Gorman      2008-07-23  6473  	 * to reserve the full area even if read-only as mprotect() may be
a1e78772d72b26 Mel Gorman      2008-07-23  6474  	 * called to make the mapping read-write. Assume !vma is a shm mapping
a1e78772d72b26 Mel Gorman      2008-07-23  6475  	 */
9119a41e9091fb Joonsoo Kim     2014-04-03  6476  	if (!vma || vma->vm_flags & VM_MAYSHARE) {
f27a5136f70a8c Mike Kravetz    2019-05-13  6477  		/*
f27a5136f70a8c Mike Kravetz    2019-05-13  6478  		 * resv_map can not be NULL as hugetlb_reserve_pages is only
f27a5136f70a8c Mike Kravetz    2019-05-13  6479  		 * called for inodes for which resv_maps were created (see
f27a5136f70a8c Mike Kravetz    2019-05-13  6480  		 * hugetlbfs_get_inode).
f27a5136f70a8c Mike Kravetz    2019-05-13  6481  		 */
4e35f483850ba4 Joonsoo Kim     2014-04-03  6482  		resv_map = inode_resv_map(inode);
9119a41e9091fb Joonsoo Kim     2014-04-03  6483  
0db9d74ed8845a Mina Almasry    2020-04-01  6484  		chg = region_chg(resv_map, from, to, &regions_needed);
9119a41e9091fb Joonsoo Kim     2014-04-03  6485  	} else {
e9fe92ae0cd28a Mina Almasry    2020-04-01  6486  		/* Private mapping. */
9119a41e9091fb Joonsoo Kim     2014-04-03  6487  		resv_map = resv_map_alloc();
17c9d12e126cb0 Mel Gorman      2009-02-11  6488  		if (!resv_map)
8d9bfb2608145c Mike Kravetz    2022-09-14  6489  			goto out_err;

chg is uninitialized on this goto.

17c9d12e126cb0 Mel Gorman      2009-02-11  6490  
a1e78772d72b26 Mel Gorman      2008-07-23  6491  		chg = to - from;
84afd99b8398c9 Andy Whitcroft  2008-07-23  6492  
17c9d12e126cb0 Mel Gorman      2009-02-11  6493  		set_vma_resv_map(vma, resv_map);
17c9d12e126cb0 Mel Gorman      2009-02-11  6494  		set_vma_resv_flags(vma, HPAGE_RESV_OWNER);
17c9d12e126cb0 Mel Gorman      2009-02-11  6495  	}
17c9d12e126cb0 Mel Gorman      2009-02-11  6496  
33b8f84a4ee784 Mike Kravetz    2021-02-24  6497  	if (chg < 0)
c50ac050811d64 Dave Hansen     2012-05-29  6498  		goto out_err;
075a61d07a8eca Mina Almasry    2020-04-01  6499  
33b8f84a4ee784 Mike Kravetz    2021-02-24  6500  	if (hugetlb_cgroup_charge_cgroup_rsvd(hstate_index(h),
33b8f84a4ee784 Mike Kravetz    2021-02-24  6501  				chg * pages_per_huge_page(h), &h_cg) < 0)
075a61d07a8eca Mina Almasry    2020-04-01  6502  		goto out_err;
075a61d07a8eca Mina Almasry    2020-04-01  6503  
075a61d07a8eca Mina Almasry    2020-04-01  6504  	if (vma && !(vma->vm_flags & VM_MAYSHARE) && h_cg) {
075a61d07a8eca Mina Almasry    2020-04-01  6505  		/* For private mappings, the hugetlb_cgroup uncharge info hangs
075a61d07a8eca Mina Almasry    2020-04-01  6506  		 * of the resv_map.
075a61d07a8eca Mina Almasry    2020-04-01  6507  		 */
075a61d07a8eca Mina Almasry    2020-04-01  6508  		resv_map_set_hugetlb_cgroup_uncharge_info(resv_map, h_cg, h);
075a61d07a8eca Mina Almasry    2020-04-01  6509  	}
075a61d07a8eca Mina Almasry    2020-04-01  6510  
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6511  	/*
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6512  	 * There must be enough pages in the subpool for the mapping. If
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6513  	 * the subpool has a minimum size, there may be some global
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6514  	 * reservations already in place (gbl_reserve).
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6515  	 */
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6516  	gbl_reserve = hugepage_subpool_get_pages(spool, chg);
33b8f84a4ee784 Mike Kravetz    2021-02-24  6517  	if (gbl_reserve < 0)
075a61d07a8eca Mina Almasry    2020-04-01  6518  		goto out_uncharge_cgroup;
5a6fe125950676 Mel Gorman      2009-02-10  6519  
5a6fe125950676 Mel Gorman      2009-02-10  6520  	/*
17c9d12e126cb0 Mel Gorman      2009-02-11  6521  	 * Check enough hugepages are available for the reservation.
90481622d75715 David Gibson    2012-03-21  6522  	 * Hand the pages back to the subpool if there are not
5a6fe125950676 Mel Gorman      2009-02-10  6523  	 */
33b8f84a4ee784 Mike Kravetz    2021-02-24  6524  	if (hugetlb_acct_memory(h, gbl_reserve) < 0)
075a61d07a8eca Mina Almasry    2020-04-01  6525  		goto out_put_pages;
17c9d12e126cb0 Mel Gorman      2009-02-11  6526  
17c9d12e126cb0 Mel Gorman      2009-02-11  6527  	/*
17c9d12e126cb0 Mel Gorman      2009-02-11  6528  	 * Account for the reservations made. Shared mappings record regions
17c9d12e126cb0 Mel Gorman      2009-02-11  6529  	 * that have reservations as they are shared by multiple VMAs.
17c9d12e126cb0 Mel Gorman      2009-02-11  6530  	 * When the last VMA disappears, the region map says how much
17c9d12e126cb0 Mel Gorman      2009-02-11  6531  	 * the reservation was and the page cache tells how much of
17c9d12e126cb0 Mel Gorman      2009-02-11  6532  	 * the reservation was consumed. Private mappings are per-VMA and
17c9d12e126cb0 Mel Gorman      2009-02-11  6533  	 * only the consumed reservations are tracked. When the VMA
17c9d12e126cb0 Mel Gorman      2009-02-11  6534  	 * disappears, the original reservation is the VMA size and the
17c9d12e126cb0 Mel Gorman      2009-02-11  6535  	 * consumed reservations are stored in the map. Hence, nothing
17c9d12e126cb0 Mel Gorman      2009-02-11  6536  	 * else has to be done for private mappings here
17c9d12e126cb0 Mel Gorman      2009-02-11  6537  	 */
33039678c8da81 Mike Kravetz    2015-06-24  6538  	if (!vma || vma->vm_flags & VM_MAYSHARE) {
075a61d07a8eca Mina Almasry    2020-04-01  6539  		add = region_add(resv_map, from, to, regions_needed, h, h_cg);
33039678c8da81 Mike Kravetz    2015-06-24  6540  
0db9d74ed8845a Mina Almasry    2020-04-01  6541  		if (unlikely(add < 0)) {
0db9d74ed8845a Mina Almasry    2020-04-01  6542  			hugetlb_acct_memory(h, -gbl_reserve);
075a61d07a8eca Mina Almasry    2020-04-01  6543  			goto out_put_pages;
0db9d74ed8845a Mina Almasry    2020-04-01  6544  		} else if (unlikely(chg > add)) {
33039678c8da81 Mike Kravetz    2015-06-24  6545  			/*
33039678c8da81 Mike Kravetz    2015-06-24  6546  			 * pages in this range were added to the reserve
33039678c8da81 Mike Kravetz    2015-06-24  6547  			 * map between region_chg and region_add.  This
33039678c8da81 Mike Kravetz    2015-06-24  6548  			 * indicates a race with alloc_huge_page.  Adjust
33039678c8da81 Mike Kravetz    2015-06-24  6549  			 * the subpool and reserve counts modified above
33039678c8da81 Mike Kravetz    2015-06-24  6550  			 * based on the difference.
33039678c8da81 Mike Kravetz    2015-06-24  6551  			 */
33039678c8da81 Mike Kravetz    2015-06-24  6552  			long rsv_adjust;
33039678c8da81 Mike Kravetz    2015-06-24  6553  
d85aecf2844ff0 Miaohe Lin      2021-03-24  6554  			/*
d85aecf2844ff0 Miaohe Lin      2021-03-24  6555  			 * hugetlb_cgroup_uncharge_cgroup_rsvd() will put the
d85aecf2844ff0 Miaohe Lin      2021-03-24  6556  			 * reference to h_cg->css. See comment below for detail.
d85aecf2844ff0 Miaohe Lin      2021-03-24  6557  			 */
075a61d07a8eca Mina Almasry    2020-04-01  6558  			hugetlb_cgroup_uncharge_cgroup_rsvd(
075a61d07a8eca Mina Almasry    2020-04-01  6559  				hstate_index(h),
075a61d07a8eca Mina Almasry    2020-04-01  6560  				(chg - add) * pages_per_huge_page(h), h_cg);
075a61d07a8eca Mina Almasry    2020-04-01  6561  
33039678c8da81 Mike Kravetz    2015-06-24  6562  			rsv_adjust = hugepage_subpool_put_pages(spool,
33039678c8da81 Mike Kravetz    2015-06-24  6563  								chg - add);
33039678c8da81 Mike Kravetz    2015-06-24  6564  			hugetlb_acct_memory(h, -rsv_adjust);
d85aecf2844ff0 Miaohe Lin      2021-03-24  6565  		} else if (h_cg) {
d85aecf2844ff0 Miaohe Lin      2021-03-24  6566  			/*
d85aecf2844ff0 Miaohe Lin      2021-03-24  6567  			 * The file_regions will hold their own reference to
d85aecf2844ff0 Miaohe Lin      2021-03-24  6568  			 * h_cg->css. So we should release the reference held
d85aecf2844ff0 Miaohe Lin      2021-03-24  6569  			 * via hugetlb_cgroup_charge_cgroup_rsvd() when we are
d85aecf2844ff0 Miaohe Lin      2021-03-24  6570  			 * done.
d85aecf2844ff0 Miaohe Lin      2021-03-24  6571  			 */
d85aecf2844ff0 Miaohe Lin      2021-03-24  6572  			hugetlb_cgroup_put_rsvd_cgroup(h_cg);
33039678c8da81 Mike Kravetz    2015-06-24  6573  		}
33039678c8da81 Mike Kravetz    2015-06-24  6574  	}
33b8f84a4ee784 Mike Kravetz    2021-02-24  6575  	return true;
33b8f84a4ee784 Mike Kravetz    2021-02-24  6576  
075a61d07a8eca Mina Almasry    2020-04-01  6577  out_put_pages:
075a61d07a8eca Mina Almasry    2020-04-01  6578  	/* put back original number of pages, chg */
075a61d07a8eca Mina Almasry    2020-04-01  6579  	(void)hugepage_subpool_put_pages(spool, chg);
075a61d07a8eca Mina Almasry    2020-04-01  6580  out_uncharge_cgroup:
075a61d07a8eca Mina Almasry    2020-04-01  6581  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
075a61d07a8eca Mina Almasry    2020-04-01  6582  					    chg * pages_per_huge_page(h), h_cg);
c50ac050811d64 Dave Hansen     2012-05-29  6583  out_err:
8d9bfb2608145c Mike Kravetz    2022-09-14  6584  	hugetlb_vma_lock_free(vma);
5e9113731a3ce6 Mike Kravetz    2015-09-08  6585  	if (!vma || vma->vm_flags & VM_MAYSHARE)
0db9d74ed8845a Mina Almasry    2020-04-01  6586  		/* Only call region_abort if the region_chg succeeded but the
0db9d74ed8845a Mina Almasry    2020-04-01  6587  		 * region_add failed or didn't run.
0db9d74ed8845a Mina Almasry    2020-04-01  6588  		 */
0db9d74ed8845a Mina Almasry    2020-04-01 @6589  		if (chg >= 0 && add < 0)
                                                                    ^^^^^^^^
warning here

0db9d74ed8845a Mina Almasry    2020-04-01  6590  			region_abort(resv_map, from, to, regions_needed);
f031dd274ccb70 Joonsoo Kim     2014-04-03  6591  	if (vma && is_vma_resv_set(vma, HPAGE_RESV_OWNER))
f031dd274ccb70 Joonsoo Kim     2014-04-03  6592  		kref_put(&resv_map->refs, resv_map_release);
33b8f84a4ee784 Mike Kravetz    2021-02-24  6593  	return false;
a43a8c39bbb493 Kenneth W Chen  2006-06-23  6594  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

