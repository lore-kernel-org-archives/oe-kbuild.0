Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0EA1F951;
	Sun,  9 Jun 2024 20:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717966433; cv=none; b=ua2vWMzo7oAOOaAlfrTuhyb92k86xLUHXrU1LmJeNGa9G7tP3mNGbefcbHRt5sxGxomDC0y/Mnix4cz1z0TR0gSaFoZV/lOPdC+XrZqkT1eSdjlzVWrUeKzs3u/kH9TpkhAon0pbWWvrWtKvRzcmL7X8RWRfXme5AI1SUDPQ5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717966433; c=relaxed/simple;
	bh=ToftjlcN9kvh6HvM9WTsUh93baAvLBXLmNhj/Kmx+Tc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fQdefUY4g1WKPGIWGoVNK6goZ2D5w+X1vyXYYbRuOB5dIHLb60dvkP/oblF56fJgSoYlWnRzYrdxoZOademx9JqQNR4ciiCmyoA5w558KY55oYIMulSawk9jHVCYJRA332vscre7+TNE+XDaI97qEusuZjG5IuRp4MC8oHQmhEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vp+ALyC5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vp+ALyC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE116C2BD10;
	Sun,  9 Jun 2024 20:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1717966433;
	bh=ToftjlcN9kvh6HvM9WTsUh93baAvLBXLmNhj/Kmx+Tc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vp+ALyC56nzllPrgzXfRXsWVRuz1Hkly7/JrAz78nUmXxa+gsthLlzPMZwReIGryq
	 yHxlF/tIP32eXrnrGJIzafqhkOAaWT+OtJOFAzan3Ceqqgn1JkT32LnSSEU3xXo+Ja
	 VHERZ2y1bxY+tRLIzx9SrZArKRPmi7gK7mHdrYLI=
Date: Sun, 9 Jun 2024 13:53:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Kefeng Wang <wangkefeng.wang@huawei.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, ying.huang@intel.com, Baolin Wang
 <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@redhat.com>, John
 Hubbard <jhubbard@nvidia.com>, Mel Gorman <mgorman@suse.de>, Ryan Roberts
 <ryan.roberts@arm.com>, liushixin2@huawei.com
Subject: Re: [PATCH] mm: fix possible OOB in numa_rebuild_large_mapping()
Message-Id: <20240609135352.6e2c1b9e1d0605079ecb142e@linux-foundation.org>
In-Reply-To: <100add53-aa58-44ce-a15d-8438001fb2b9@moroto.mountain>
References: <20240607103241.1298388-1-wangkefeng.wang@huawei.com>
	<100add53-aa58-44ce-a15d-8438001fb2b9@moroto.mountain>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 9 Jun 2024 19:03:50 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Hi Kefeng,
> 
> kernel test robot noticed the following build warnings:
> 
> smatch warnings:
> mm/memory.c:5370 do_numa_page() error: uninitialized symbol 'nr_pages'.
> 

Yes, thanks, I dropped this version of the patch.
