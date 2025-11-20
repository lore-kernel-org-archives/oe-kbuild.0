Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D62FE59C
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 05:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763616373; cv=none; b=ghhmgl0RFmZQqkO7TBG8b/wO6b3C5xspseeUAAO/56kbAzOVEqHaQ2IjtfXueh+b6UnN3cc7vnRoaz7HSCF4fD0saA66H2diPx4bnJXOw+Ueyr9l0J8ldSfgorIpsWgOl4ncqq2vmHq3Eu8M8Rl0YEVnKfGK7yUhtf/gOcz9tLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763616373; c=relaxed/simple;
	bh=EruOZqd2KoR3uN2cg7AV2xYzHReBsphHSgRk39GWG88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwELDng+X3BtHTl/i9jWQVXM6Yhij6drp/j3bjGvnNk+K6aF5tqi5TZFz396J/WeIMIdVNcVdCtapMZzQHgXtMsoHRuZPsTz7Gw8EYlbGmw9wST3IVzEZFSALM4eTnJriTLK8cnzdpwtAw+CBIxYJv8XdujeNM0XPEjFWIAsgys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dDeRmh+R; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dDeRmh+R"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47796a837c7so2745115e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 21:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763616367; x=1764221167; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vUqeS6K4g0hUxh5GcRzYb7k8IKeXwg6G9epDSLnS8mY=;
        b=dDeRmh+RTwMY28KjAou1RH3dW+XSDGNoQKiCYsw/tn5LvHMn0UCWERI0ODnsDspCmf
         KBcDekwtmpcuEooMxquYwNpjqHbnJdmZuZwcvdPLh7Lso9wXykAA3gGXLrGd5lkMUk46
         sfBUphr0UDto+XEvLGL3aVNVb3NDZqSDu2AbqwQo/ob1AhHFund19hgRnztlL05yxr9O
         JEtseUy1J/3n57tpTOueqMgCQKXQi6+bOqSjUQLdMl45id8DXEbZywA2TWcu7Nh8g6Qc
         R0kjvUt0nZS7/QQH1PsqediqXXByyHUNvIqTMzbsTSk5SiUnwDH0S5YXOQ8Uh+/LY3eG
         y/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763616367; x=1764221167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUqeS6K4g0hUxh5GcRzYb7k8IKeXwg6G9epDSLnS8mY=;
        b=ZsP6nF6UtMwUJQLSy7OO0lGdBVtU0ffOeDMj+Q2SzdkFuggCRjuuGdlByvrnYABGwE
         8FAW/mCtuasQ3XnIYwHNbI4kPdrfGHz5AN6EegoVPjpbDJyIrvFizBGBcRlUhc6LSs4N
         s7azNb42v9BQYCaVxdtWqMl9GOK6qUImtRUS9Vem5uVslCrmDQ93w5TbGZyuOc3+eIsC
         b8VWh7O9wJo1m3ce4q8OLX2TJMlEA8YpOr2opu7uQ1b3L4/4IcUhI3ay7hQ95Tw4+/FX
         Co7+VvDN/913Cnf56yR4//3UvJpanGPWJKcvVABqbzwxkyu3oEf0B7rNqBEr6XP46M0y
         Ygaw==
X-Gm-Message-State: AOJu0YyAZvZk6oGtBg6g2urrPeWxIXYdaOyJx6fmiuLWXhoFpDiZkR2T
	QdnqD4FrD+AzWseTcIH+7D01ECXlyqC1OcD7J1bgHLD9/pWReRecRR8VJArIDZjiF5A=
X-Gm-Gg: ASbGncsP5gTS/G/xP17kmx5l7FqYISr1Q7IBepzKZ5qR/tcaweW+fP12pp4NBvIgUZH
	7mGkPZ3IjbayyfIjmISKdhA7lXzp1GHd/SFWLfGtaFOSCT1vRj9pPIEFzA3PobIZovNgtzUd1MI
	lVepoSVQKza25OQy7n1MhDVWZP0PVgltII0jB5ciObmo2pzGvlv32CozhXcw4spw1M7ghPeUKWr
	TRILcKc39z0Nm0Fod4HCqQKzX18FJNnXusK+3LUfUgKsC+eD2hRJHSVjob/SNYhnskM2U7uYDt1
	N2xFlkpGqbzmC5LIuvAgVJWi+m4Js7uTf3J1Rd17WxJ2yM5Fo1Vz/f27Rk472981JfhgNpJ/Mqw
	E0W2veC8/PZ9+GYXEumysjEqnbKDKX99kJR1gVBFJlgk5uyn3zsA4Fx9yBTb8jFi4l6AqFZ3oL/
	7idp2NAC53rKloxZTr
X-Google-Smtp-Source: AGHT+IFWWOupAlmioPPlt+riq99upzqU3hX3m2vpY2Y33m3pRyb3Gi9KlUndDLVMEA6CzkdsEjgEWg==
X-Received: by 2002:a05:600c:4746:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-477bac1d90bmr5158065e9.29.1763616367195;
        Wed, 19 Nov 2025 21:26:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9df8db3sm53497665e9.11.2025.11.19.21.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 21:26:06 -0800 (PST)
Date: Thu, 20 Nov 2025 08:26:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: oe-kbuild@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, dri-devel@lists.freedesktop.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Ralph Campbell <rcampbell@nvidia.com>,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
Message-ID: <aR6max8N4djU5OVB@stanley.mountain>
References: <202511151216.rhK2ItOb-lkp@intel.com>
 <661d1f3b-0f04-43fc-85ef-d29d492a2b06@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <661d1f3b-0f04-43fc-85ef-d29d492a2b06@nvidia.com>

On Thu, Nov 20, 2025 at 10:58:07AM +1100, Balbir Singh wrote:
> On 11/19/25 23:32, Dan Carpenter wrote:
> > Hi Balbir,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-huge_memory-c-introduce-folio_split_unmapped/20251114-093541
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20251114012228.2634882-1-balbirs%40nvidia.com
> > patch subject: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
> > config: i386-randconfig-141-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151216.rhK2ItOb-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202511151216.rhK2ItOb-lkp@intel.com/
> > 
> > smatch warnings:
> > mm/huge_memory.c:4044 __folio_split() error: uninitialized symbol 'end'.
> > mm/huge_memory.c:4052 __folio_split() error: we previously assumed 'mapping' could be null (see line 4046)
> > 
> 
> Thanks for the report!
> 
> If mapping is not NULL, end is initialized. More comments on UBSan below
> 
> > vim +/end +4044 mm/huge_memory.c
> > 
> > 6384dd1d18de7b Zi Yan                  2025-03-07  3908  static int __folio_split(struct folio *folio, unsigned int new_order,
> > 58729c04cf1092 Zi Yan                  2025-03-07  3909  		struct page *split_at, struct page *lock_at,
> > f6b1f167ffe29f Balbir Singh            2025-11-14  3910  		struct list_head *list, enum split_type split_type)
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3911  {
> > 58729c04cf1092 Zi Yan                  2025-03-07  3912  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
> > 6c7de9c83be68b Zi Yan                  2025-07-18  3913  	struct folio *end_folio = folio_next(folio);
> > 5d65c8d758f259 Barry Song              2024-08-24  3914  	bool is_anon = folio_test_anon(folio);
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3915  	struct address_space *mapping = NULL;
> > 5d65c8d758f259 Barry Song              2024-08-24  3916  	struct anon_vma *anon_vma = NULL;
> > 8ec26327c18e1d Wei Yang                2025-10-10  3917  	int old_order = folio_order(folio);
> > 6c7de9c83be68b Zi Yan                  2025-07-18  3918  	struct folio *new_folio, *next;
> > 391dc7f40590d7 Zi Yan                  2025-07-18  3919  	int nr_shmem_dropped = 0;
> > 391dc7f40590d7 Zi Yan                  2025-07-18  3920  	int remap_flags = 0;
> > 504e070dc08f75 Yang Shi                2021-06-15  3921  	int extra_pins, ret;
> > 006d3ff27e884f Hugh Dickins            2018-11-30  3922  	pgoff_t end;
> > 478d134e9506c7 Xu Yu                   2022-04-28  3923  	bool is_hzp;
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3924  
> > 714b056c832106 Zi Yan                  2025-07-17  3925  	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
> > 714b056c832106 Zi Yan                  2025-07-17  3926  	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3927  
> > 58729c04cf1092 Zi Yan                  2025-03-07  3928  	if (folio != page_folio(split_at) || folio != page_folio(lock_at))
> > 1412ecb3d256e5 Zi Yan                  2024-03-07  3929  		return -EINVAL;
> > 1412ecb3d256e5 Zi Yan                  2024-03-07  3930  
> > 8ec26327c18e1d Wei Yang                2025-10-10  3931  	if (new_order >= old_order)
> > c010d47f107f60 Zi Yan                  2024-02-26  3932  		return -EINVAL;
> > 58729c04cf1092 Zi Yan                  2025-03-07  3933  
> > aa27253af32c74 Wei Yang                2025-11-06  3934  	if (!folio_split_supported(folio, new_order, split_type, /* warn = */ true))
> > 6a50c9b512f773 Ran Xiaokai             2024-06-07  3935  		return -EINVAL;
> > c010d47f107f60 Zi Yan                  2024-02-26  3936  
> > 5beaee54a324ba Matthew Wilcox (Oracle  2024-03-26  3937) 	is_hzp = is_huge_zero_folio(folio);
> > 4737edbbdd4958 Naoya Horiguchi         2023-04-06  3938  	if (is_hzp) {
> > 4737edbbdd4958 Naoya Horiguchi         2023-04-06  3939  		pr_warn_ratelimited("Called split_huge_page for huge zero page\n");
> > 478d134e9506c7 Xu Yu                   2022-04-28  3940  		return -EBUSY;
> > 4737edbbdd4958 Naoya Horiguchi         2023-04-06  3941  	}
> > 478d134e9506c7 Xu Yu                   2022-04-28  3942  
> > 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3943) 	if (folio_test_writeback(folio))
> > 59807685a7e77e Ying Huang              2017-09-06  3944  		return -EBUSY;
> > 59807685a7e77e Ying Huang              2017-09-06  3945  
> > 5d65c8d758f259 Barry Song              2024-08-24  3946  	if (is_anon) {
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3947  		/*
> > c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  3948  		 * The caller does not necessarily hold an mmap_lock that would
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3949  		 * prevent the anon_vma disappearing so we first we take a
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3950  		 * reference to it and then lock the anon_vma for write. This
> > 2f031c6f042cb8 Matthew Wilcox (Oracle  2022-01-29  3951) 		 * is similar to folio_lock_anon_vma_read except the write lock
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3952  		 * is taken to serialise against parallel split or collapse
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3953  		 * operations.
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3954  		 */
> > 29eea9b5a9c9ec Matthew Wilcox (Oracle  2022-09-02  3955) 		anon_vma = folio_get_anon_vma(folio);
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3956  		if (!anon_vma) {
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3957  			ret = -EBUSY;
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3958  			goto out;
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3959  		}
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3960  		anon_vma_lock_write(anon_vma);
> > 3d4c0d98eb8572 Balbir Singh            2025-10-01  3961  		mapping = NULL;
> > 
> > end is not initialized for anonymous folios.
> > 
> 
> Yes
> 
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3962  	} else {
> > e220917fa50774 Luis Chamberlain        2024-08-22  3963  		unsigned int min_order;
> > 6a3edd29395631 Yin Fengwei             2022-08-10  3964  		gfp_t gfp;
> > 6a3edd29395631 Yin Fengwei             2022-08-10  3965  
> > 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3966) 		mapping = folio->mapping;
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3967  
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3968  		/* Truncated ? */
> > 6384dd1d18de7b Zi Yan                  2025-03-07  3969  		/*
> > 6384dd1d18de7b Zi Yan                  2025-03-07  3970  		 * TODO: add support for large shmem folio in swap cache.
> > 6384dd1d18de7b Zi Yan                  2025-03-07  3971  		 * When shmem is in swap cache, mapping is NULL and
> > 6384dd1d18de7b Zi Yan                  2025-03-07  3972  		 * folio_test_swapcache() is true.
> > 6384dd1d18de7b Zi Yan                  2025-03-07  3973  		 */
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3974  		if (!mapping) {
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3975  			ret = -EBUSY;
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3976  			goto out;
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3977  		}
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  3978  
> > e220917fa50774 Luis Chamberlain        2024-08-22  3979  		min_order = mapping_min_folio_order(folio->mapping);
> > e220917fa50774 Luis Chamberlain        2024-08-22  3980  		if (new_order < min_order) {
> > e220917fa50774 Luis Chamberlain        2024-08-22  3981  			ret = -EINVAL;
> > e220917fa50774 Luis Chamberlain        2024-08-22  3982  			goto out;
> > e220917fa50774 Luis Chamberlain        2024-08-22  3983  		}
> > e220917fa50774 Luis Chamberlain        2024-08-22  3984  
> > 6a3edd29395631 Yin Fengwei             2022-08-10  3985  		gfp = current_gfp_context(mapping_gfp_mask(mapping) &
> > 6a3edd29395631 Yin Fengwei             2022-08-10  3986  							GFP_RECLAIM_MASK);
> > 6a3edd29395631 Yin Fengwei             2022-08-10  3987  
> > 0201ebf274a306 David Howells           2023-06-28  3988  		if (!filemap_release_folio(folio, gfp)) {
> > 6a3edd29395631 Yin Fengwei             2022-08-10  3989  			ret = -EBUSY;
> > 6a3edd29395631 Yin Fengwei             2022-08-10  3990  			goto out;
> > 6a3edd29395631 Yin Fengwei             2022-08-10  3991  		}
> > 6a3edd29395631 Yin Fengwei             2022-08-10  3992  
> > 3c844d850e4486 Wei Yang                2025-11-06  3993  		if (split_type == SPLIT_TYPE_UNIFORM) {
> > 58729c04cf1092 Zi Yan                  2025-03-07  3994  			xas_set_order(&xas, folio->index, new_order);
> > 8ec26327c18e1d Wei Yang                2025-10-10  3995  			xas_split_alloc(&xas, folio, old_order, gfp);
> > 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3996) 			if (xas_error(&xas)) {
> > 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3997) 				ret = xas_error(&xas);
> > 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3998) 				goto out;
> > 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3999) 			}
> > 58729c04cf1092 Zi Yan                  2025-03-07  4000  		}
> > 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4001) 
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  4002  		anon_vma = NULL;
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  4003  		i_mmap_lock_read(mapping);
> > 006d3ff27e884f Hugh Dickins            2018-11-30  4004  
> > 006d3ff27e884f Hugh Dickins            2018-11-30  4005  		/*
> > 58729c04cf1092 Zi Yan                  2025-03-07  4006  		 *__split_unmapped_folio() may need to trim off pages beyond
> > 58729c04cf1092 Zi Yan                  2025-03-07  4007  		 * EOF: but on 32-bit, i_size_read() takes an irq-unsafe
> > 58729c04cf1092 Zi Yan                  2025-03-07  4008  		 * seqlock, which cannot be nested inside the page tree lock.
> > 58729c04cf1092 Zi Yan                  2025-03-07  4009  		 * So note end now: i_size itself may be changed at any moment,
> > 58729c04cf1092 Zi Yan                  2025-03-07  4010  		 * but folio lock is good enough to serialize the trimming.
> > 006d3ff27e884f Hugh Dickins            2018-11-30  4011  		 */
> > 006d3ff27e884f Hugh Dickins            2018-11-30  4012  		end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
> > d144bf6205342a Hugh Dickins            2021-09-02  4013  		if (shmem_mapping(mapping))
> > d144bf6205342a Hugh Dickins            2021-09-02  4014  			end = shmem_fallocend(mapping->host, end);
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  4015  	}
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4016  
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4017  	/*
> > 684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4018) 	 * Racy check if we can split the page, before unmap_folio() will
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4019  	 * split PMDs
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4020  	 */
> > 8710f6ed34e7bc David Hildenbrand       2024-08-02  4021  	if (!can_split_folio(folio, 1, &extra_pins)) {
> > fd4a7ac32918d3 Baolin Wang             2022-10-24  4022  		ret = -EAGAIN;
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4023  		goto out_unlock;
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4024  	}
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4025  
> > 684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4026) 	unmap_folio(folio);
> > e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4027  
> > b6769834aac1d4 Alex Shi                2020-12-15  4028  	/* block interrupt reentry in xa_lock and spinlock */
> > b6769834aac1d4 Alex Shi                2020-12-15  4029  	local_irq_disable();
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  4030  	if (mapping) {
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  4031  		/*
> > 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4032) 		 * Check if the folio is present in page cache.
> > 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4033) 		 * We assume all tail are present too, if folio is there.
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  4034  		 */
> > 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4035) 		xas_lock(&xas);
> > 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4036) 		xas_reset(&xas);
> > 391dc7f40590d7 Zi Yan                  2025-07-18  4037  		if (xas_load(&xas) != folio) {
> > 391dc7f40590d7 Zi Yan                  2025-07-18  4038  			ret = -EAGAIN;
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  4039  			goto fail;
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  4040  		}
> > 391dc7f40590d7 Zi Yan                  2025-07-18  4041  	}
> > baa355fd331424 Kirill A. Shutemov      2016-07-26  4042  
> > f6b1f167ffe29f Balbir Singh            2025-11-14  4043  	ret = __folio_freeze_and_split_unmapped(folio, new_order, split_at, &xas, mapping,
> > f6b1f167ffe29f Balbir Singh            2025-11-14 @4044  						true, list, split_type, end, extra_pins);
> >                                                                                                                                 ^^^
> > Passing uninitialized variables isn't allowed unless the function is
> > inlined.  It triggers a UBSan warning at runtime as well.
> 
> end is expected to be unused when uninitialized, are you suggesting we need to have a default value even if unused inside the function.
> My daily build has UBSan enabled, I'll try again
> 
> CONFIG_UBSAN=y
> CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
> # CONFIG_UBSAN_BOUNDS is not set
> CONFIG_UBSAN_SHIFT=y
> # CONFIG_UBSAN_UNREACHABLE is not set
> # CONFIG_UBSAN_BOOL is not set
> # CONFIG_UBSAN_ENUM is not set
> 

Huh.  It's interesting that UBSan doesn't complain.  Potentially, the
function is inlined?

Technically, passing uninitialized variables to a function is undefined
behavior in C.  But in practical terms (and it make Linus cross that
the C standard doesn't account for this), when a function is inlined
then that shouldn't really be undefined.  But otherwise, yes, passing
uninitialized variables is not allowed, even when they're not used.

Everyone sensible is going to set CONFIG_INIT_STACK_ALL_ZERO for
production systems so initializing variables to zero doesn't affect
anything.

regards,
dan carpenter

