Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E7127475;
	Thu, 19 Oct 2023 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BnG+Idv8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B14CC433C7;
	Thu, 19 Oct 2023 16:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1697734231;
	bh=FXh21OoAGR8XHVEBB81BE7UVszOS/EKxof6T4KL6Nl4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BnG+Idv8nNr0gcKnCyQpK3n/ViH2zsIUK+GNsyvYWvaNLLRkuhA3s6xv1G6OP5uEJ
	 z8+9ayy43IEQoWYNVfjdT9j5RzedEbnOiqaC9LsPyfeKYpLo32AhxWtG1lYZdAId81
	 oVxmwWcFznV37Idq+XTw28lf/Vy534RnOGktF4do=
Date: Thu, 19 Oct 2023 09:50:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Philip Li
 <philip.li@intel.com>, oe-kbuild@lists.linux.dev, Lorenzo Stoakes
 <lstoakes@gmail.com>, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: mm/vmalloc.c:3689 vread_iter() error: we previously assumed
 'vm' could be null (see line 3667)
Message-Id: <20231019095030.7a1f3c93bc18511f52524aa8@linux-foundation.org>
In-Reply-To: <ZTCURc8ZQE+KrTvS@MiWiFi-R3L-srv>
References: <f82be227-bfde-439a-b339-1b4ee370d59a@kadam.mountain>
	<ZS+dSd9Z6/2wU0Eg@MiWiFi-R3L-srv>
	<89caf59a-d3b9-409d-b1ae-9e370cb9ee7d@kadam.mountain>
	<ZS/LrhcxcMOgiiX5@MiWiFi-R3L-srv>
	<ZS/TVMT9ed7OdyNy@rli9-mobl>
	<ZS/2k6DIMd0tZRgK@MiWiFi-R3L-srv>
	<20231018085248.6f3f36101cbdfe0990c8b467@linux-foundation.org>
	<ZTCURc8ZQE+KrTvS@MiWiFi-R3L-srv>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Oct 2023 10:28:21 +0800 Baoquan He <bhe@redhat.com> wrote:

> I think this is not a real runtime bug. The only chance it can hapen is
> when (flags == VMAP_BLOCK) is true. That has been warned and could never
> happen. I updated patch log and paste v2 here. 

Thanks, I updated the changelog in-place.
