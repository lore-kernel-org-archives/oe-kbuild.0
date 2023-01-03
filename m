Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1618F625;
	Tue,  3 Jan 2023 07:58:34 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id ja17so22054493wmb.3;
        Mon, 02 Jan 2023 23:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tef2h4At6Od0/4qBFtcLwWNqGgypPq3hD4gWqH/494o=;
        b=oE36qJ+7N/5AZ1I1bJkvcXgrCSI5zd7lAWzPhupzq7cf6xq6EQYm+vgzCHo1TYIN7C
         DyVgc85d/BYvBMmOAQzp19dpA9oZ9MQUOPjnupZBAZy0qw1L/NxR6ZlrxtpKBcixiYHN
         RQ1YtiVEUuuwAAuoi3oK49Ojus8+vHMHOVqQlI5pSDTU9oZ6P6+wJ/NIZ6wCjqu8fDlw
         F4OePDHggIVMfaPHTw2CItJKr/1A8HtDUQeOkuGAnhNTRPsVVc+HJrcJDbsI4aFg9g7m
         xJErF4q1zdcVXdZs1bOukfkiMfi6fXegxM9sRCYm/O6jfikJvc0L92OVsq6c+JEed3+w
         ty9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tef2h4At6Od0/4qBFtcLwWNqGgypPq3hD4gWqH/494o=;
        b=pdQ2ipPxTXvuPJAvnnkDmrPGa/+7IRpJKnMIu3/BN7dHt7bwCp0JSgVgM9uR3WlPMH
         5g2Xy7Lf+GpWGyshllDXkESOOlI48c65DqHVItz+7/O1MxXWIj+Dvw691x6SkHvQfkLj
         NngZ0kKMOgSkBwuUzDyMQgWGc68KFSyXuG3ixA7XDonznnVHi9GWpW0xGsedEuBVGDbM
         42Zbb5uwRDiGChEc2KpUaXQiL5PPVIBdOBVnhzyWepSdOSBduwjvcLz4pz5GgCvyf/w3
         b+maZseS/6rA0aZypieN/4xwcvdRYd9NHhAGee08hnZBSfGyOWorhKsZ0v4LBozQiaf+
         tqOA==
X-Gm-Message-State: AFqh2kp7xUwcO72Fo8CDm5RUYYFRvwpkI0s1IXRs3dcojrTKBrzoaYWn
	AdjEvOTAX0ZMfEI68trW1YCXXDs+sGtXvw==
X-Google-Smtp-Source: AMrXdXvvXPf/pu50cJz/SQLGWuVppG6BV1pHKdmm5jHF5EVxrZOYjdaHnDWvenaKOypIVu2c+9KMHg==
X-Received: by 2002:a05:600c:19c7:b0:3d9:7096:262a with SMTP id u7-20020a05600c19c700b003d97096262amr24640983wmq.27.1672732712072;
        Mon, 02 Jan 2023 23:58:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bg40-20020a05600c3ca800b003b4cba4ef71sm50843707wmb.41.2023.01.02.23.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 23:58:31 -0800 (PST)
Date: Tue, 3 Jan 2023 10:58:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Kees Cook <keescook@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: lib/memcpy_kunit.c:299 init_large() warn: calling memset(x, y,
 ARRAY_SIZE());
Message-ID: <202212311919.oZKZmewP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230103075828.3F9tH8uCBLYFUta-DqlRUYfMU3ayV9OLH2w2z94zuws@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8451c141e07a8d05693f6c8d0e418fbb4b68bb7
commit: 96fce387d58fa8eae6e8d9b1ecdfbc18292d7a68 kunit/memcpy: Add dynamic size and window tests
config: ia64-randconfig-m031-20221229
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
lib/memcpy_kunit.c:299 init_large() warn: calling memset(x, y, ARRAY_SIZE());

vim +299 lib/memcpy_kunit.c

96fce387d58fa8 Kees Cook 2022-09-28  290  
96fce387d58fa8 Kees Cook 2022-09-28  291  	/* Get many bit patterns. */
96fce387d58fa8 Kees Cook 2022-09-28  292  	get_random_bytes(large_src, ARRAY_SIZE(large_src));
                                                                            ^^^^^^^^^^^^^^^^^^^^^

96fce387d58fa8 Kees Cook 2022-09-28  293  
96fce387d58fa8 Kees Cook 2022-09-28  294  	/* Make sure we have non-zero edges. */
96fce387d58fa8 Kees Cook 2022-09-28  295  	set_random_nonzero(test, &large_src[0]);
96fce387d58fa8 Kees Cook 2022-09-28  296  	set_random_nonzero(test, &large_src[ARRAY_SIZE(large_src) - 1]);
96fce387d58fa8 Kees Cook 2022-09-28  297  
96fce387d58fa8 Kees Cook 2022-09-28  298  	/* Explicitly zero the entire destination. */
96fce387d58fa8 Kees Cook 2022-09-28 @299  	memset(large_dst, 0, ARRAY_SIZE(large_dst));

ARRAY_SIZE() is the number of elements.  You want sizeof().  My guess is
that probably large_dst has the 1 byte elements, but you know...

96fce387d58fa8 Kees Cook 2022-09-28  300  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

