Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999215662
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 13:08:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 82AF15C006B;
	Fri, 24 Mar 2023 09:08:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 24 Mar 2023 09:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1679663321; x=
	1679749721; bh=jxJ++YGw8O/SOLqdKtIkYiNTVCrk4xp0rmWLDpv64BA=; b=g
	bfgBJsoqDjqhMfqq2g/0k9lVJRmtDzMpWRLCZ7kiWj6lHwtmvlLDPafw3KgfowSp
	+wQz9U27zgTVMpMYkJt80EpbR0zM0xQ56a26qj6evuQk/4dxpS93a5z6gqBnI46M
	DRAg0wpYxlSqtAWvYesjUGxuVJ58f2WMTlCi65Xe+VNCDoIRN3CsY8PpB2IoQfkM
	2Akf7g75J/r0FBbm7uth0D6OYHWcPo9q8N2A8EXUQWIZVWcj8CwmKNm4FEH/ecal
	hONSTCow9gBesOBeCJYLGeBlILfIK08hcDOQynAs4nQEOc8YwCpXRdGeTN5ofRcr
	6KRae9WgIMUjIckBJcZWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679663321; x=1679749721; bh=jxJ++YGw8O/SO
	LqdKtIkYiNTVCrk4xp0rmWLDpv64BA=; b=arQU5l8c3bD1fug0RyBbIn7q93MU2
	YCz4UzB6aGbBBNpNhfxkh8QoCvO4Qrdurk5pWHDVNSnZniLjMLZa3Nw79XMW0qXV
	8h0USRBd5ZnauF7zzTTLlUp+1ZctQ1xAl/9GvAQJO71z9hFCbYezI1QcKAwGzUS5
	34heFsv6YGMKw1cYUoG8MilU5oNQBrYxNdpA67Vxay8wLlVKqBtLBA4+fgryeEtv
	3vhIcGUXXQmxEwUuiuFnikmYiZLDt6/twlAekYMbQNQ4NywsbayRWDyuoqTEC7l0
	wmTMDKOuBrcrSfz6/MgxbtHPfYMyrPJ4NKIpGA6hoiDJKGqN3v41GaiXw==
X-ME-Sender: <xms:2aAdZLbm92pZdb-Q5Y17fLxbXiy41OawHyzdflqCoiEEihORe-sO-A>
    <xme:2aAdZKbbkhAj5Ai7jFxmd7J12zbHrGudzEc8G9eYZ7916VS-3Gwu2JVzVXBrC26xC
    se1ypJvoZmxxk7xdY0>
X-ME-Received: <xmr:2aAdZN8BR2j6QClRkXrZIU5-FvswodYwvTC6Q0tQfcKkYCjA6adCxBoAJmj7d3YG-Feq_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegiedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    dttddttddvnecuhfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehk
    ihhrihhllhesshhhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepvefgke
    dvudetkefguedvgeejkeekveeiudejleegtdduiedvgedvvdehjefhhfehnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgr
    mhgv
X-ME-Proxy: <xmx:2aAdZBqSYZKtYdDTnWMq2YxOGgVIUxrNFE_Tku0UBaChBBeWfrGN5A>
    <xmx:2aAdZGpVCnUPpjYsFjJQFaAg9p_PnGD6hBJQshlKNOPtOq7cLOvRlg>
    <xmx:2aAdZHQ2wkho9-VzKmEzlLMurSsMg_A0Y8qv8NYiHWy1pfELOUiwnQ>
    <xmx:2aAdZNTb2Hn2l_Z5QGgT9wJhCGFfl8EljPBd-wZCiMsFbA4BggMQ7A>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Mar 2023 09:08:41 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 721CF10A607; Fri, 24 Mar 2023 16:08:39 +0300 (+03)
Date: Fri, 24 Mar 2023 16:08:39 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev
Subject: Re: [akpm-mm:mm-unstable 220/293] mm/vmstat.c:1556:53: sparse:
 sparse: shift too big (4294967295) for type unsigned long
Message-ID: <20230324130839.nyk4q5o6fjf272xr@box.shutemov.name>
References: <202303240107.qf5g0qKq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303240107.qf5g0qKq-lkp@intel.com>

On Fri, Mar 24, 2023 at 01:11:38AM +0800, kernel test robot wrote:
> :::::: 
> :::::: Manual check reason: "low confidence static check warning: mm/vmstat.c:1556:53: sparse: sparse: shift too big (4294967295) for type unsigned long"
> :::::: 
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> CC: Andrew Morton <akpm@linux-foundation.org>
> CC: Linux Memory Management List <linux-mm@kvack.org>
> CC: Michael Ellerman <mpe@ellerman.id.au>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   51551d71edbc998fd8c8afa7312db3d270f5998e
> commit: 98d56389a5e38b3801f2762d6db67dab6536032a [220/293] mm, treewide: redefine MAX_ORDER sanely
> :::::: branch date: 17 hours ago
> :::::: commit date: 17 hours ago
> config: sparc-randconfig-s052-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240107.qf5g0qKq-lkp@intel.com/config)

CONFIG_ARCH_FORCE_MAX_ORDER=-1

WAT?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
