Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AC51E487;
	Thu,  5 Sep 2024 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543104; cv=none; b=n8FGuF1Hoh545GR38kkNp1jH6F8HQULzHo0OnHtDn6uLEJ1ABSChDAad6ZoM74lei7WCbBvihUnhRVrpHCpgqIb+1oD+6kIhfGM7kf0lesDM2ifs6qMvUkvV3DDZnK9JnT60ookbXnyXxPdRGD8Xz0UIDefS8DTUDiB4QuI2ikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543104; c=relaxed/simple;
	bh=AYgkrnLf7jWJv41+MDXPw9aj5ueMdlt1G/LPf/ND1b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LSiP3RvCDF6ehTbhLQ6+XedZ9Fop1TCZdCizgiRgp8/MZTpnnkksV4OnLvWD1cDWvDKMDpDOKvGkw7rABEDm8YxBnDnReKlwbNeuSUmPkA8/IYXuytkABKLWpaZLP5EL9I3m26/OkudVV5fXsHlJyEr+rBaWpCsmNok9FQizp4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4X00Zt2PcCzpVL2;
	Thu,  5 Sep 2024 21:29:42 +0800 (CST)
Received: from dggpeml100021.china.huawei.com (unknown [7.185.36.148])
	by mail.maildlp.com (Postfix) with ESMTPS id A80E81800FE;
	Thu,  5 Sep 2024 21:31:36 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.174) by dggpeml100021.china.huawei.com
 (7.185.36.148) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 5 Sep
 2024 21:31:36 +0800
Message-ID: <2e4f662b-2c52-4148-afea-0f7d09d2776b@huawei.com>
Date: Thu, 5 Sep 2024 21:31:35 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 8348/9291] fs/ext4/extents.c:6155
 ext4_ext_clear_bb() error: double free of 'path'
To: Theodore Ts'o <tytso@mit.edu>
CC: Dan Carpenter <dan.carpenter@linaro.org>, <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, Jan Kara <jack@suse.cz>,
	<oe-kbuild@lists.linux.dev>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, Yang
 Erkun <yangerkun@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <0a03c332-20ff-47ef-8a33-e52b4736d05b@stanley.mountain>
 <c2711f3d-6bee-414c-952f-5c33da315a1a@huawei.com>
 <20240905132335.GT9627@mit.edu>
Content-Language: en-US
From: Baokun Li <libaokun1@huawei.com>
In-Reply-To: <20240905132335.GT9627@mit.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml100021.china.huawei.com (7.185.36.148)

On 2024/9/5 21:23, Theodore Ts'o wrote:
> On Thu, Sep 05, 2024 at 09:30:37AM +0800, Baokun Li wrote:
>> Now Ted has fixed this problem in his branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git/commit/?h=dev&id=2352e3e461926b59f01c1e39fbb0494891cff997
>>
>> Ted, could you please help push the corrected commit to the next branch?
> The next branch gets automatically refreshed every day (Mondays
> through Friday).  In the case of the ext4 tree, it gets picked up from
> the dev branch.  So it should be fixed in the upcoming fs-next and
> linux-next branch.
>
> Cheers,
>
> 					- Ted
>
OK, I didn't know it was pulling automatically, thanks for the explanation!


Cheers,
Baokun


