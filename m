Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9219463
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cp58hdKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697631158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PE/mHe/CAbrLfzX0O2jV2/dAhOsU7rUS7AFT41iKams=;
	b=cp58hdKRZ0zrkoNJs4+tVgaAzAbhZfYe0iUaUafEZ37tWrQ8RneGLeHBeNPLn8JIRe+Tcu
	wcljtWcrXWZ3rU+DLxrgbo3GhFbLO8efHel2uiyx8Knd7br9adq2Wycvqez/NgiluyBAtp
	q+w3qxpCuFfDZegyHgGCINRnin6CCl4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-yQuChPbGOM6sbMwZL2EhpA-1; Wed, 18 Oct 2023 08:12:34 -0400
X-MC-Unique: yQuChPbGOM6sbMwZL2EhpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4660688B7A7;
	Wed, 18 Oct 2023 12:12:34 +0000 (UTC)
Received: from localhost (unknown [10.72.112.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ECD720268CB;
	Wed, 18 Oct 2023 12:12:33 +0000 (UTC)
Date: Wed, 18 Oct 2023 20:12:30 +0800
From: Baoquan He <bhe@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Lorenzo Stoakes <lstoakes@gmail.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm'
 could be null (see line 3667)
Message-ID: <ZS/LrhcxcMOgiiX5@MiWiFi-R3L-srv>
References: <f82be227-bfde-439a-b339-1b4ee370d59a@kadam.mountain>
 <ZS+dSd9Z6/2wU0Eg@MiWiFi-R3L-srv>
 <89caf59a-d3b9-409d-b1ae-9e370cb9ee7d@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89caf59a-d3b9-409d-b1ae-9e370cb9ee7d@kadam.mountain>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Hi Dan,

On 10/18/23 at 01:32pm, Dan Carpenter wrote:
> On Wed, Oct 18, 2023 at 04:54:33PM +0800, Baoquan He wrote:
> > Hi,
> > 
> > On 10/17/23 at 05:26pm, Dan Carpenter wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
> > > commit: 4c91c07c93bbbdd7f2d9de2beb7ee5c2a48ad8e7 mm: vmalloc: convert vread() to vread_iter()
> > > config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310171600.WCrsOwFj-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171600.WCrsOwFj-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > | Closes: https://lore.kernel.org/r/202310171600.WCrsOwFj-lkp@intel.com/
> > > 
> > > smatch warnings:
> > > mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm' could be null (see line 3667)
> > 
> > I see the code deficit, while the reproduce link seems to be unavilable.
> > Could you double check the link and provide a good one so that I can
> > verify the code fix?
> 
> Here's a link.  :)
> 
> https://repo.or.cz/smatch.git/blob/HEAD:/Documentation/smatch.txt
> 
> Just build it and run:
> 
> ~/smatch/smatch_scripts/kchecker drivers/whatever/file.c

I don't know smatch and lkp well, and have no idea on how to use above
smatch.txt to build the target file.c. I meant in this lkp report, the
config file is available, however, the reproduce file is empty. Could
you help add an available reproduce file link? or give a little more
detail guiding me how to make use of above smatch file to build .c file?
Thanks a lot in advance.

config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310171600.WCrsOwFj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171600.WCrsOwFj-lkp@intel.com/reproduce)

Thanks
Baoquan

