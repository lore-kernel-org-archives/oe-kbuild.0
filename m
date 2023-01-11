Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E694517D0;
	Wed, 11 Jan 2023 04:29:39 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t5so9448257wrq.1;
        Tue, 10 Jan 2023 20:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ActnDnEMNIJcjx6Fcc4BvA+ksPG0xbjSPfDABpliDI0=;
        b=OKBEjY/bn+xjPermKEeUaqLp/DXKKvGIF3vK0zJystn+Rp0dPWImUNfTtmmM3pS+AG
         rR9sLB7h1zkQUopoJ9wzUan+zXiiujLnjuZ/5YRAIcrI5oH6wSbKEAjTuF35IVTwvntY
         tc82pRamtNzOHdAVmxFvJf/df9u1g+cAQgnEkTrGsNit6XLoTS7LjNcwX0OuqkgdMsyl
         ELECvyUuFVJav0HBLiqE6Co7bG5yy2kRA8tyaOt2URmzPgUBdARfu5AZ8ONDmil1hils
         EysqhvKQg4ybylYiZINIcujBPTS5SbzmPL2vlkcHq37N8n/3jKwc+ddve+avwkZ4uoky
         avmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ActnDnEMNIJcjx6Fcc4BvA+ksPG0xbjSPfDABpliDI0=;
        b=C1HJPJ7jRyB/97Z71pnjW8dozdXl2LnonkZSSCuIza/MxhgBVnTw0Wr2YYAFgofvy2
         bPrf1Y2t5DijThVsdzWKtdZdkrD6M1vHSz2mMG2HLN5OGz6+qUtug59NETBtbKwFyFUx
         m91lochimBBgUvr2xR5C+LaIvsOt4gFAekpWYep8tViEYFNEOnM+8C9fppLf/2gi1L9p
         hnKvGwSMjoovOB72mwKLnR3HW1VaciNUQkwkj/ma4uYdKcizDfqy0K/S3pg6ADS9YUiQ
         UkI1P2BBiLKxZ4ALqUXvL/7wOyFNmn48My/5epMEWdOhEy5l6Ib3BZq/26+1yCjT/5zR
         pf/Q==
X-Gm-Message-State: AFqh2koHR/8ol/+iootj9dJOB3hKbkZdG7bLyzgvO2H5nTtxMjQJSCFp
	yZZpATQo3k9Llk9DKqTN1euc1vvWkJ0=
X-Google-Smtp-Source: AMrXdXtecgQRGjTyuOiuOgaJtePQEqMUWk7VW2nMFUQVtmEvmMSD/Do1XBBi5drfYAMbccCj/UARoA==
X-Received: by 2002:a05:6000:1e1a:b0:290:968:f1ac with SMTP id bj26-20020a0560001e1a00b002900968f1acmr29698592wrb.33.1673411377966;
        Tue, 10 Jan 2023 20:29:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bt19-20020a056000081300b002bdc3f5945dsm325237wrb.89.2023.01.10.20.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 20:29:37 -0800 (PST)
Date: Wed, 11 Jan 2023 07:29:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes 135/296] net/rxrpc/call_object.c:303
 rxrpc_connect_call() warn: missing error code 'ret'
Message-ID: <202301111153.9eZRYLf1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230111042934.cvUK9zZ_UBCo0EgWMEdTzvIonSq_B5E4Q_ujSZD6-f8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   79fa898551af3fa16837f16294fdc8724b405762
commit: 9d35d880e0e4a3ab32d8c12f9e4d76198aadd42d [135/296] rxrpc: Move client call connection to the I/O thread
config: x86_64-randconfig-m001-20230109
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
net/rxrpc/call_object.c:303 rxrpc_connect_call() warn: missing error code 'ret'

vim +/ret +303 net/rxrpc/call_object.c

9d35d880e0e4a3 David Howells 2022-10-19  294  static int rxrpc_connect_call(struct rxrpc_call *call, gfp_t gfp)
9d35d880e0e4a3 David Howells 2022-10-19  295  {
9d35d880e0e4a3 David Howells 2022-10-19  296  	struct rxrpc_local *local = call->local;
9d35d880e0e4a3 David Howells 2022-10-19  297  	int ret = 0;
9d35d880e0e4a3 David Howells 2022-10-19  298  
9d35d880e0e4a3 David Howells 2022-10-19  299  	_enter("{%d,%lx},", call->debug_id, call->user_call_ID);
9d35d880e0e4a3 David Howells 2022-10-19  300  
9d35d880e0e4a3 David Howells 2022-10-19  301  	call->peer = rxrpc_lookup_peer(local, &call->dest_srx, gfp);
9d35d880e0e4a3 David Howells 2022-10-19  302  	if (!call->peer)
9d35d880e0e4a3 David Howells 2022-10-19 @303  		goto error;

It looks like returning zero is intentional here, but I'm not 100%
sure.

9d35d880e0e4a3 David Howells 2022-10-19  304  
9d35d880e0e4a3 David Howells 2022-10-19  305  	ret = rxrpc_look_up_bundle(call, gfp);
9d35d880e0e4a3 David Howells 2022-10-19  306  	if (ret < 0)
9d35d880e0e4a3 David Howells 2022-10-19  307  		goto error;
9d35d880e0e4a3 David Howells 2022-10-19  308  
9d35d880e0e4a3 David Howells 2022-10-19  309  	trace_rxrpc_client(NULL, -1, rxrpc_client_queue_new_call);
9d35d880e0e4a3 David Howells 2022-10-19  310  	rxrpc_get_call(call, rxrpc_call_get_io_thread);
9d35d880e0e4a3 David Howells 2022-10-19  311  	spin_lock(&local->client_call_lock);
9d35d880e0e4a3 David Howells 2022-10-19  312  	list_add_tail(&call->wait_link, &local->new_client_calls);
9d35d880e0e4a3 David Howells 2022-10-19  313  	spin_unlock(&local->client_call_lock);
9d35d880e0e4a3 David Howells 2022-10-19  314  	rxrpc_wake_up_io_thread(local);
9d35d880e0e4a3 David Howells 2022-10-19  315  	return 0;
9d35d880e0e4a3 David Howells 2022-10-19  316  
9d35d880e0e4a3 David Howells 2022-10-19  317  error:
9d35d880e0e4a3 David Howells 2022-10-19  318  	__set_bit(RXRPC_CALL_DISCONNECTED, &call->flags);
9d35d880e0e4a3 David Howells 2022-10-19  319  	return ret;
9d35d880e0e4a3 David Howells 2022-10-19  320  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

