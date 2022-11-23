Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D87E;
	Wed, 23 Nov 2022 15:55:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p16so13384922wmc.3;
        Wed, 23 Nov 2022 07:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cqQwr0m9vsgRGWQkqT5HY/5sL0NEZk15+anbWvGYk8A=;
        b=jcNLOu53GEOdPCEQwgoG3MFFPrQxC2Rc/OeekhjZtfxENu1xfJDao4u59+j7Rc2EAN
         d/1y+6xkmPb39nSOtLQNlFbp7rqHsOCrmhHZvxSd6C+cyass31U5DT3v3JahNiN+hIwX
         dmT/mNHZsznmzWKShZi6z9HBjrqglNSHvmRG8SVsI5MpyrRR/r+3rNgJ6yiLIBVBtjPS
         9xzrsrkJxTOToeJ1n2uYnZtaEQoOjDySvfa/8eJUYOUzByezFoB6hWgZauTky4RrgWoT
         ixGbz6lzzg/Uy4R1iUzwaEi4S2/lL7jClX9TXNHxC72t6NPauNyXpjxm5p9Mik80UY7Y
         xjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cqQwr0m9vsgRGWQkqT5HY/5sL0NEZk15+anbWvGYk8A=;
        b=diX2tYGEJc7+61Tydf1hINck/y1iiNregrBJmgCop903iJTlB8Wx5n81wDwCr9P9zI
         kOnhPd9ARfj/uRq+t8TtJ37ruXJIromkjTE5ImXnj+e0f3Y3SbYagmOawwW+H32YfF3y
         Dyb5kR8JVQBAn9Rte6UWFnrRNyKvOAlxA+NRRcBboHddlzqFSkUvBprXzTPW4Rnl+Kyp
         Oyyj4VA+G6fHyvBZQ4lGACFZWpwI4Y3V8ZHSG6bBOwmSsmwHczKX0Ak8yNo4mABJhrLc
         ibHjrwng2RHXPifRbMT7jX70CkRivezqXE2ZDs1BN0aFkZx1jyAdBZ27vUl8fL3Fi0KE
         CUUw==
X-Gm-Message-State: ANoB5plrE+6MO8ZKJJ0vqFJCQwEPETMQxVli2+QfqWc7WyktsxQfqQw9
	g2q9d2gJBt1QgXiED/t3IY1dAOrkHue2UCm5
X-Google-Smtp-Source: AA0mqf7RchWFXvISv/rFWIleRWrs0etB5mxLKfZyHFS8xiodrcdTtjBO4EXAm3O400Fd9lS8zjdmWw==
X-Received: by 2002:a1c:4b12:0:b0:3cf:5237:c0be with SMTP id y18-20020a1c4b12000000b003cf5237c0bemr20076034wma.163.1669218911048;
        Wed, 23 Nov 2022 07:55:11 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c3-20020a5d4cc3000000b00241c4bd6c09sm14363510wrt.33.2022.11.23.07.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:55:10 -0800 (PST)
Date: Wed, 23 Nov 2022 18:55:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-next 9/31]
 net/rxrpc/local_object.c:366 rxrpc_unuse_local() warn: variable dereferenced
 before check 'local' (see line 363)
Message-ID: <202211232302.L36aJblr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221123155507.2RAg0GK187ZspTo2rRryqhLIp1I2P9lzjQ9uWxjnib4@z>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-next
head:   8b3d8f13ccbe35c57860620d82b12e1179a36fae
commit: fb083146ad0e0db772a6d3bab9401ac568df1d21 [9/31] rxrpc: trace: Don't use __builtin_return_address for rxrpc_local tracing
config: loongarch-randconfig-m041-20221120
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
net/rxrpc/local_object.c:366 rxrpc_unuse_local() warn: variable dereferenced before check 'local' (see line 363)

vim +/local +366 net/rxrpc/local_object.c

fb083146ad0e0d David Howells 2022-10-21  361  void rxrpc_unuse_local(struct rxrpc_local *local, enum rxrpc_local_trace why)
730c5fd42c1e36 David Howells 2019-08-09  362  {
fb083146ad0e0d David Howells 2022-10-21 @363  	unsigned int debug_id = local->debug_id;
                                                                        ^^^^^^^^^^^^^^^
Dereference

fb083146ad0e0d David Howells 2022-10-21  364  	int r, u;
fb083146ad0e0d David Howells 2022-10-21  365  
68553f1a6f746b David Howells 2019-08-09 @366  	if (local) {
                                                    ^^^^^
Too late.

fb083146ad0e0d David Howells 2022-10-21  367  		r = refcount_read(&local->ref);
fb083146ad0e0d David Howells 2022-10-21  368  		u = atomic_dec_return(&local->active_users);
fb083146ad0e0d David Howells 2022-10-21  369  		trace_rxrpc_local(debug_id, why, r, u);
fb083146ad0e0d David Howells 2022-10-21  370  		if (u == 0) {
fb083146ad0e0d David Howells 2022-10-21  371  			rxrpc_get_local(local, rxrpc_local_get_queue);
730c5fd42c1e36 David Howells 2019-08-09  372  			rxrpc_queue_local(local);
04d36d748fac34 David Howells 2020-01-30  373  		}
730c5fd42c1e36 David Howells 2019-08-09  374  	}
68553f1a6f746b David Howells 2019-08-09  375  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

