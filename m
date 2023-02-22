Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C8B2F3F;
	Wed, 22 Feb 2023 15:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37564C433D2;
	Wed, 22 Feb 2023 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677080694;
	bh=5KG/bO3FwXE7MwINidb/z6aocMlM+Az6F+yh2Lw8lCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISGojwM4hwZnoeRuyx8l09fusSKGCIC2/X9zB3ORXKaoyCP1PIxtfi58rmZCo87FD
	 zCR4y1zUXMMGAikoTYLVo+2eG85K/GsyjJhNWefHjONeCmeCLwAbM7pZw7YxXyE2Ap
	 f3zOi/ZLHjAGY3cK2VAr+zfwvBtaFijRwwOX3YryMfEGCA5rH0f34rUrofFCzuwV+S
	 s8agEtobia0gQdkLCzHx6KTblfFIlZG39YQIr4HhG3iPOaedyPEmmSVkQAg4+BL6iT
	 ZR6AD14/Q2BL8Q0/R8q25N6HRMOlrsVVoceXXXoI6bQcQEMZi7EKIpQeHZmJaXAnJf
	 DRcVM86UJ+kgg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pUrIh-0007ZF-Mn; Wed, 22 Feb 2023 16:45:00 +0100
Date: Wed, 22 Feb 2023 16:44:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Johan Hovold <johan+linaro@kernel.org>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Steev Klimaszewski <steev@kali.org>
Subject: Re: [steev:lenovo-x13s-v6.2 114/188] drivers/interconnect/core.c:853
 icc_node_destroy() error: we previously assumed 'node' could be null (see
 line 846)
Message-ID: <Y/Y4e0ia3kYU1Hfn@hovoldconsulting.com>
References: <202302222118.nGz1F0oJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302222118.nGz1F0oJ-lkp@intel.com>

On Wed, Feb 22, 2023 at 05:25:01PM +0300, Dan Carpenter wrote:
> tree:   https://github.com/steev/linux lenovo-x13s-v6.2
> head:   b9925baa3e5cf7919e9736257505a214b66dcdd2
> commit: f89ce4d6ffc2c5e73c476d0d264951feef193f17 [114/188] interconnect: fix mem leak when freeing nodes
> config: microblaze-randconfig-m031-20230222 (https://download.01.org/0day-ci/archive/20230222/202302222118.nGz1F0oJ-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202302222118.nGz1F0oJ-lkp@intel.com/
> 
> smatch warnings:
> drivers/interconnect/core.c:853 icc_node_destroy() error: we previously assumed 'node' could be null (see line 846)
> 
> vim +/node +853 drivers/interconnect/core.c
> 
> 11f1ceca7031de Georgi Djakov 2019-01-16  839  void icc_node_destroy(int id)
> 11f1ceca7031de Georgi Djakov 2019-01-16  840  {
> 11f1ceca7031de Georgi Djakov 2019-01-16  841  	struct icc_node *node;
> 11f1ceca7031de Georgi Djakov 2019-01-16  842  
> 11f1ceca7031de Georgi Djakov 2019-01-16  843  	mutex_lock(&icc_lock);
> 11f1ceca7031de Georgi Djakov 2019-01-16  844  
> 11f1ceca7031de Georgi Djakov 2019-01-16  845  	node = node_find(id);
> 11f1ceca7031de Georgi Djakov 2019-01-16 @846  	if (node) {
> 
> If node is NULL
> 
> 11f1ceca7031de Georgi Djakov 2019-01-16  847  		idr_remove(&icc_idr, node->id);
> 11f1ceca7031de Georgi Djakov 2019-01-16  848  		WARN_ON(!hlist_empty(&node->req_list));
> 11f1ceca7031de Georgi Djakov 2019-01-16  849  	}
> 11f1ceca7031de Georgi Djakov 2019-01-16  850  
> 11f1ceca7031de Georgi Djakov 2019-01-16  851  	mutex_unlock(&icc_lock);
> 11f1ceca7031de Georgi Djakov 2019-01-16  852  
> f89ce4d6ffc2c5 Johan Hovold  2023-01-31 @853  	kfree(node->links);
> 
> then this will crash
> 
> 11f1ceca7031de Georgi Djakov 2019-01-16  854  	kfree(node);
> 11f1ceca7031de Georgi Djakov 2019-01-16  855  }

Thanks, Dan. There are no in-tree users that should be affected by this,
but the patch is definitely missing a NULL check. I'll send a v2.

Johan
