Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C6279C3;
	Mon, 21 Nov 2022 19:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D199FC433D6;
	Mon, 21 Nov 2022 19:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1669059866;
	bh=yV333rdvas8aVbEoj2o47UGPxrKsM0GiaX8E1F7PwN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N8Zd9zCXLb0M/uBN6yWIEnagnPn2ZFeUcamBt5DWm1IM5s+LqIZ+86LubO13+Zs0a
	 TUoZFKOrpJckqzcjAkDDsX9UqcXDjR0tJUh5eLPLcRNTJg2s9/s8xKARAhxj2julHW
	 0jpOJA6GRex/ufc1sS6OaSgH6v/l3ylyTOzNLK2U=
Date: Mon, 21 Nov 2022 11:44:25 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Hugh Dickins <hughd@google.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, Ammar Faizi
 <ammarfaizi2@gnuweeb.org>, GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 160/254] mm/rmap.c:1325
 page_add_anon_rmap() error: uninitialized symbol 'first'.
Message-Id: <20221121114425.9e2ad183c7e24f158ecc10e5@linux-foundation.org>
In-Reply-To: <202211200135.BVP3jPRS-lkp@intel.com>
References: <202211200135.BVP3jPRS-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Nov 2022 13:47:02 +0300 Dan Carpenter <error27@gmail.com> wrote:

> tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> head:   a8da2493d983a10242e6c9d71c6e828aafa5baf8
> commit: d68dde0dc6f8b8d09357a32473db8881173b10b0 [160/254] mm,thp,rmap: subpages_mapcount of PTE-mapped subpages
> config: i386-randconfig-m021
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> mm/rmap.c:1325 page_add_anon_rmap() error: uninitialized symbol 'first'.
> 

Thanks.  Hugh's looking into this. 
https://lkml.kernel.org/r/759077a6-a08-5bb0-a0b6-53be2fe8b56a@google.com
