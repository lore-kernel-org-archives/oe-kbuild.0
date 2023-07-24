Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE161C39
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 08:22:23 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so30760135e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186941; x=1690791741;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w2+VUqJtyd/w3GfH8mvUNPvMT12jE1tBR6ud/MPqXew=;
        b=qlIkEs8LqOcRVJ3NDcjFhiZtTreJGhBElRggyWIYyD6RKPzKHIhJX7xRbjrgfaXkui
         wyDMuKn7fygcRtd3DRe+Gb4w8J8g+UFF65rA5LEhJy8icmdLCAzlBSMRVfW/tS/PW4eQ
         PfJX0WuKVakmb0obAgkYECL8yYV88rY2iMA8xtb7GhBWgfI71cqY/D99Et4vQ6RteWi8
         E/o6FCUZYlZ6TSy7KWMv0g8V34PjffDc01I6W0hFwoO5SRJYzjTqhQpZVVoncx/ryY8J
         fWMf7pOheOzhceebidcb6EcRhXNV5vb81YyfNnBw1Ie3oxZsZvqsUydTdk9nBZTsAvif
         2WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186941; x=1690791741;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2+VUqJtyd/w3GfH8mvUNPvMT12jE1tBR6ud/MPqXew=;
        b=FPqoDfMiUUsXSyjhYqGKahjQy9Hg7aFkWic0bTELowQD6CwtosiigIBkSHmepmy4k2
         FL1WCImCnnT6Zg0WOnmhWQRP/swkxH4+lb8qAfbIZZun54+4Off5EKRtuwkd6jTDVxVt
         CHk8hf0KxrN1Hj+HHzDqtusCuu5LkELdV1CR099cBEqs4f9qDv0HuNiaUzFlyq+5YA7k
         cwO81VkgxkNCY4Uo/cM9bah0Jc5Jdf8nZ/nsTvAw/dE1Fi+m54AGg6G+2wIkiu1ZDXEy
         ACwG03LSo2XwILqxdGw3Ojs+3mFDBM8OWou5Euke91c8jVh5xu0jq7oBqFyXCT0+Oyoq
         LdEA==
X-Gm-Message-State: ABy/qLaJ/XtuWTEvEg9WNUld2sC1r3O47Wqqw+cipGKeBeEAj7PVCwRV
	PCUcpeagag1BeJ48kitmgE/X4DfDGEgIJ1CBK3U=
X-Google-Smtp-Source: APBJJlG799j3jx6GBChiLoMBbfL06GaU4jVrUjTFq97xnFgsO0AHFWiebwHliwISuR9i3QmkuvOUrw==
X-Received: by 2002:a7b:cd91:0:b0:3f7:f584:579b with SMTP id y17-20020a7bcd91000000b003f7f584579bmr5869491wmj.9.1690186941543;
        Mon, 24 Jul 2023 01:22:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q21-20020a1ce915000000b003fba6709c68sm9638511wmc.47.2023.07.24.01.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:22:21 -0700 (PDT)
Date: Mon, 24 Jul 2023 11:22:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alexander Aring <aahringo@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v6.5-rc2 2/3] fs: lockd: fix race in async lock request
 handling
Message-ID: <41e30f88-b065-44b4-8536-dca47f02aa63@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720125806.1385279-2-aahringo@redhat.com>

Hi Alexander,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Aring/fs-lockd-fix-race-in-async-lock-request-handling/20230720-210010
base:   v6.5-rc2
patch link:    https://lore.kernel.org/r/20230720125806.1385279-2-aahringo%40redhat.com
patch subject: [RFC v6.5-rc2 2/3] fs: lockd: fix race in async lock request handling
config: x86_64-randconfig-m001-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220225.DeAIaATn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220225.DeAIaATn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307220225.DeAIaATn-lkp@intel.com/

smatch warnings:
fs/lockd/svclock.c:798 nlmsvc_grant_deferred() warn: iterator used outside loop: 'block'

vim +/block +798 fs/lockd/svclock.c

385d3265c23730 Alexander Aring 2023-07-20  778  static int nlmsvc_grant_deferred(struct file_lock *fl, int result)
385d3265c23730 Alexander Aring 2023-07-20  779  {
385d3265c23730 Alexander Aring 2023-07-20  780  	struct nlm_block *block = NULL;

No need.

385d3265c23730 Alexander Aring 2023-07-20  781  	int rc;
385d3265c23730 Alexander Aring 2023-07-20  782  
385d3265c23730 Alexander Aring 2023-07-20  783  	spin_lock(&nlm_blocked_lock);
385d3265c23730 Alexander Aring 2023-07-20  784  	list_for_each_entry(block, &nlm_blocked, b_list) {
385d3265c23730 Alexander Aring 2023-07-20  785  		if (nlm_compare_locks(&block->b_call->a_args.lock.fl, fl)) {
385d3265c23730 Alexander Aring 2023-07-20  786  			kref_get(&block->b_count);
0e4ac9d93515b2 Marc Eshel      2006-11-28  787  			break;
0e4ac9d93515b2 Marc Eshel      2006-11-28  788  		}
0e4ac9d93515b2 Marc Eshel      2006-11-28  789  	}
f904be9cc77f36 Bryan Schumaker 2010-09-21  790  	spin_unlock(&nlm_blocked_lock);
385d3265c23730 Alexander Aring 2023-07-20  791  
385d3265c23730 Alexander Aring 2023-07-20  792  	if (!block) {

The list iterator is never NULL.  The old way to check was something
list if list_entry_is_head() but now we just say:

	bool found = false;

	list_for_each() {
		if (whatever) {
			found = true;
			break;
		}
	}

	if (!found)
		return -ENOENT;

385d3265c23730 Alexander Aring 2023-07-20  793  		pr_warn("lockd: grant for unknown pending block\n");
385d3265c23730 Alexander Aring 2023-07-20  794  		return -ENOENT;
385d3265c23730 Alexander Aring 2023-07-20  795  	}
385d3265c23730 Alexander Aring 2023-07-20  796  
385d3265c23730 Alexander Aring 2023-07-20  797  	/* don't interfere with nlmsvc_lock() */
385d3265c23730 Alexander Aring 2023-07-20 @798  	mutex_lock(&block->b_file->f_mutex);
385d3265c23730 Alexander Aring 2023-07-20  799  	block->b_flags &= ~B_PENDING_CALLBACK;
385d3265c23730 Alexander Aring 2023-07-20  800  
385d3265c23730 Alexander Aring 2023-07-20  801  	spin_lock(&nlm_blocked_lock);
385d3265c23730 Alexander Aring 2023-07-20  802  	WARN_ON_ONCE(list_empty(&block->b_list));
385d3265c23730 Alexander Aring 2023-07-20  803  	rc = __nlmsvc_grant_deferred(block, fl, result);
385d3265c23730 Alexander Aring 2023-07-20  804  	spin_unlock(&nlm_blocked_lock);
385d3265c23730 Alexander Aring 2023-07-20  805  	mutex_unlock(&block->b_file->f_mutex);
385d3265c23730 Alexander Aring 2023-07-20  806  
385d3265c23730 Alexander Aring 2023-07-20  807  	nlmsvc_release_block(block);
0e4ac9d93515b2 Marc Eshel      2006-11-28  808  	return rc;
0e4ac9d93515b2 Marc Eshel      2006-11-28  809  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

