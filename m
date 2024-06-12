Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62616E881;
	Wed, 12 Jun 2024 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718195555; cv=none; b=SRnUmDyw6HRka0pBkaUDSyPZ/MrE8SvO6u+elvz8vaBu9l31U7KBCyPonr+4UvWJDvXrLmQp6Y0X7mCojxq/Vk3GD4szfGtvAaxh+pX1zCyqRB5R3SlnFS2G5qL9a8LLamQm2HJNmCTrYyy39nVNY1QQN+NvmuS2meJahdP7VDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718195555; c=relaxed/simple;
	bh=14srYhojB1KQr1YOML4Z3Bt5mMzMoitzSzgYnhxbXpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fp9CRdwisbzjVcwMq4YMImVo7NpYFn29hIktjZ9bmUqvjNkH5DbWW6t40hlLE4Ec19CHZkUa1TDRgUBUVnXMKnVh170q7/hGOLcoWLogwVmZwjD8+TWuaQ33RduV8FC2Jy/w81Ua1FvHBB3VMbf2APR3yAQ/azcNuV0IHpM10IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VzlJQ0TJlzddXm;
	Wed, 12 Jun 2024 20:31:02 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id 766671402CA;
	Wed, 12 Jun 2024 20:32:29 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Jun 2024 20:32:28 +0800
Message-ID: <10f01c7a-fb91-478d-97b1-9ec4d8675644@huawei.com>
Date: Wed, 12 Jun 2024 20:32:28 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: fix possible OOB in numa_rebuild_large_mapping()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <oe-kbuild@lists.linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
	<lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Linux Memory Management
 List <linux-mm@kvack.org>, <ying.huang@intel.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, David Hildenbrand <david@redhat.com>, John
 Hubbard <jhubbard@nvidia.com>, Mel Gorman <mgorman@suse.de>, Ryan Roberts
	<ryan.roberts@arm.com>, <liushixin2@huawei.com>
References: <100add53-aa58-44ce-a15d-8438001fb2b9@moroto.mountain>
 <c6df35cc-1331-4255-8ff5-898f6a911bec@huawei.com>
 <81da44d7-e07d-4757-9a67-87c35b62512c@moroto.mountain>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <81da44d7-e07d-4757-9a67-87c35b62512c@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf100008.china.huawei.com (7.185.36.138)



On 2024/6/12 18:06, Dan Carpenter wrote:
> On Wed, Jun 12, 2024 at 10:50:02AM +0800, Kefeng Wang wrote:
>>> b99a342d4f11a5 Huang Ying        2021-04-29  5364  out_map:
>>> b99a342d4f11a5 Huang Ying        2021-04-29  5365  	/*
>>> b99a342d4f11a5 Huang Ying        2021-04-29  5366  	 * Make it present again, depending on how arch implements
>>> b99a342d4f11a5 Huang Ying        2021-04-29  5367  	 * non-accessible ptes, some can allow access by kernel mode.
>>> b99a342d4f11a5 Huang Ying        2021-04-29  5368  	 */
>>> d2136d749d76af Baolin Wang       2024-03-29  5369  	if (folio && folio_test_large(folio))
>>>
>>> Are folio_test_large() and folio_is_zone_device() mutually exclusive?
>>> If so then this is a false positive.  Just ignore the warning in that
>>> case.
>>>
>>
>> The folio in ZONE_DEVICE is not a large folio, so there is no issue for now,
>> but will fix.
>>
> 
> If it's not an issue, then don't feel obligated to do anything.  These
> are a one time email and then I treat it as addressed.  These warnings
> are intended to be useful, not a burden.

The check is great, and the new version avoids to pass the nr_pages, so
there is no more warning, thanks.

> 
> regards,
> dan carpenter
> 
