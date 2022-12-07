Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2861963E;
	Wed,  7 Dec 2022 06:52:30 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so361731wmb.2;
        Tue, 06 Dec 2022 22:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KrgPaWpSiWfbgkib36PHrrNJFFJqDZKPMYP3jnPykck=;
        b=S9Ld4ogH/ezFMOweMznaOq3kncJUiI0+ZnuB26UsO6ds6UzpoFcXEK5bh4wlk524wV
         OWy3M2Rx8dSTnAhY4tJIoYMCfcTmjBHnPUCnfion6fEQS8o6IVZzc7irY98WHdNflHSA
         tNqX1F69mG/R6AtrrpCDSc8nmIbjHDDXxwANQ0+d6RvIQvwoVxKW6yKJ8pbrvQiZOM00
         Awpyk/x3cKHCiIPf20MKjSbxTbkB8Hm9rXAYNeT6fXBBPYwfouC7qRDbDuqjns3bqrvG
         qPrSC0XDYolMw+vroAI53ubb/e9Gr8EKtKm7wCPxTDrJXn9obTSejbX8XKG4vkSAOv1q
         engg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KrgPaWpSiWfbgkib36PHrrNJFFJqDZKPMYP3jnPykck=;
        b=sKWCwsymGuGJVuT5EDLmojPPc9F+6NdEZgK6ZJE12tdlHkkeUcH9shLdH9cGB4V4U+
         vU7+q8S5Jps4qCaiuzrWCpszVZOAf1r7KM+pU0OkbKBH+fm7uhtx7Ce2DbtehIv99a36
         7EZIFI2RYpYosoiktHWtgMyDqnw6l+m5VSIe2QH+9FWlkWYI4DDuHBT8bz9eXcQsbTFq
         QZJvvx1WIORvBnx/TYDIRELGg79gi5dLX8hSH1GV1vu9aY6gBhffQX5rM+GJzjNlLvAQ
         cvjl4nvVPA54bziQ5RxnJWXqhROCoRDPyk28o/NIJcX3Ban4LGcN9JHh+WCeFiEQ7q9b
         q03g==
X-Gm-Message-State: ANoB5pl00xPdUHNS0WDBNsorsZed5g3zhOYDkzFVF5hGXNVSFNamdVcG
	6t8s+N5GtJEBWTPamzfZN8m5Dr7XaBU=
X-Google-Smtp-Source: AA0mqf6T7QUHrXNoiBVrw2zq5mDP/QdEqV8LDjlnhlVOKbLpGKD5GvliZXhurz9o3X2CWjv0/8MXQw==
X-Received: by 2002:a05:600c:2e0c:b0:3d1:fa2f:b279 with SMTP id o12-20020a05600c2e0c00b003d1fa2fb279mr296865wmf.130.1670395948051;
        Tue, 06 Dec 2022 22:52:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003b4868eb71bsm634392wmq.25.2022.12.06.22.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 22:52:27 -0800 (PST)
Date: Wed, 7 Dec 2022 09:52:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11514/13282] net/rxrpc/local_object.c:365
 rxrpc_unuse_local() warn: variable dereferenced before check 'local' (see
 line 362)
Message-ID: <202212071248.8BB84G9K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221207065224.REvHetUQxrxN1aLq6GH0ep2lz8fCxu7a3x5rQ_uC5xk@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5d562c48a21eeb029a8fd3f18e1b31fd83660474
commit: a2cf3264f331acfeb7e463ad7b7fe1ac647a829d [11514/13282] rxrpc: Fold __rxrpc_unuse_local() into rxrpc_unuse_local()
config: arm64-randconfig-m041-20221206
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
net/rxrpc/local_object.c:365 rxrpc_unuse_local() warn: variable dereferenced before check 'local' (see line 362)

vim +/local +365 net/rxrpc/local_object.c

0fde882fc9ee9c David Howells 2022-10-21  360  void rxrpc_unuse_local(struct rxrpc_local *local, enum rxrpc_local_trace why)
730c5fd42c1e36 David Howells 2019-08-09  361  {
a2cf3264f331ac David Howells 2022-11-16 @362  	unsigned int debug_id = local->debug_id;
                                                                        ^^^^^^^^^^^^^^^
Dereference

a2cf3264f331ac David Howells 2022-11-16  363  	int r, u;
a2cf3264f331ac David Howells 2022-11-16  364  
a2cf3264f331ac David Howells 2022-11-16 @365  	if (local) {
                                                    ^^^^^
Checked too late.

a2cf3264f331ac David Howells 2022-11-16  366  		r = refcount_read(&local->ref);
a2cf3264f331ac David Howells 2022-11-16  367  		u = atomic_dec_return(&local->active_users);
a2cf3264f331ac David Howells 2022-11-16  368  		trace_rxrpc_local(debug_id, why, r, u);
a2cf3264f331ac David Howells 2022-11-16  369  		if (u == 0)
a275da62e8c111 David Howells 2022-10-10  370  			kthread_stop(local->io_thread);
68553f1a6f746b David Howells 2019-08-09  371  	}
a2cf3264f331ac David Howells 2022-11-16  372  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

