Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8A2565;
	Mon,  7 Nov 2022 08:02:32 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id z14so14917462wrn.7;
        Mon, 07 Nov 2022 00:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLFXXeJQalHOtiJfGLbWfBN0AQbnvJ6LnCPg8PG/XjA=;
        b=FV662BMmYxbFtvjiEkjRuqjJrtOFBIQHXKf8tcE59ZJOJg8Di/R4ISDqBUdUObKMOS
         ZQN8QVk+fjLFuyOCZhmlY7RNxukTSVALvtAptOgrkfCQ9XmdpYRhbk009ZcRpVvpJtnb
         SscANdJFv6k2X/G8YJYA8k+FUn1ejgrn+h456fFeqcZegNDrZtYd+XxFoXNMy3ivjYj7
         MSP3wD6YWtLSc/rYaVoiX17b2YJGeCI7tySTLds7exnVoQUZGZuvL2Mqfxfk2mTIwPtg
         CsH2JMajsdYmyfKfa+ZDzQFNC/QJiR6g28lzx7jKexdLtw4vDxzm7/Pr5Nkyt/837/UU
         zcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLFXXeJQalHOtiJfGLbWfBN0AQbnvJ6LnCPg8PG/XjA=;
        b=xJZZ5y5WqXw8fnzi3K5g6/Wz9HcU58StuBgFNoPY/oD35nrRND0To2gZeqPht70HVB
         tGsSMldVbwqXi7OVnuPNZEmu2kyiqmWw+uUPtPu9HDbueTjG8dg53478ywObfMDYKnKH
         YnzdbDWjq6NebrfKFvXVeMiialEcE0FUEZnFBt07f6L9jvoT/LIr0ExQMuQ3LyRYlCLj
         zSSyJ+tUlx1tp5s8mdmAxzWXYFPK9U7DULYzzPcbJPwSzOtIgWe9W6gAjzRQumurdEfB
         ilYkBJ/JP8Loby8jWY2nx0iof0U2+b62dbKKJlpWgnFpnMxt2efq6/JAjNSnWAVXAGgj
         3ABw==
X-Gm-Message-State: ACrzQf2QarFQujDBfbX69J2z4h6MaFSQxlxtBP+lKLdZMbT0wIaOdxQC
	WnNKX1AxHgaeFeJKqaVvyD7k+y+Ep8Y=
X-Google-Smtp-Source: AMsMyM6U3ZECmOV22fEfrSpQBDzHIGf7UaBBUmd/OEUsoBH10DKXcqKPH3S905pT/suHUmRH0vjoiw==
X-Received: by 2002:a05:6000:1f16:b0:238:3fc8:1f11 with SMTP id bv22-20020a0560001f1600b002383fc81f11mr13790120wrb.9.1667808150079;
        Mon, 07 Nov 2022 00:02:30 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q2-20020a7bce82000000b003cf7292c553sm7318317wmj.13.2022.11.07.00.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 00:02:29 -0800 (PST)
Date: Mon, 7 Nov 2022 11:02:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-ringless-5 29/79]
 net/rxrpc/io_thread.c:52 rxrpc_error_report() error: uninitialized symbol
 'skb'.
Message-ID: <202211071354.ANknPOk9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221107080226.3LMCFEIIJ0nJ7wCuwfvocOMOs4mJdJSzGH7Ud5N1iro@z>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-ringless-5
head:   ae32660a904fd27bf548d6bb4a3fc340645da2ca
commit: ea8a55f838fb351b99eb2558a82492dc41246871 [29/79] rxrpc: Move error processing into the local endpoint I/O thread
config: openrisc-randconfig-m031-20221106
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
net/rxrpc/io_thread.c:52 rxrpc_error_report() error: uninitialized symbol 'skb'.

Old smatch warnings:
net/rxrpc/io_thread.c:210 rxrpc_input_packet() warn: passing freed memory 'skb'

vim +/skb +52 net/rxrpc/io_thread.c

ea8a55f838fb35 David Howells 2022-10-10  43  void rxrpc_error_report(struct sock *sk)
ea8a55f838fb35 David Howells 2022-10-10  44  {
ea8a55f838fb35 David Howells 2022-10-10  45  	struct rxrpc_local *local;
ea8a55f838fb35 David Howells 2022-10-10  46  	struct sk_buff *skb;
ea8a55f838fb35 David Howells 2022-10-10  47  
ea8a55f838fb35 David Howells 2022-10-10  48  	rcu_read_lock();
ea8a55f838fb35 David Howells 2022-10-10  49  	local = rcu_dereference_sk_user_data(sk);
ea8a55f838fb35 David Howells 2022-10-10  50  	if (unlikely(!local)) {
ea8a55f838fb35 David Howells 2022-10-10  51  		rcu_read_unlock();
ea8a55f838fb35 David Howells 2022-10-10 @52  		kfree_skb(skb);

"skb" is uninitialized.

ea8a55f838fb35 David Howells 2022-10-10  53  		return;
ea8a55f838fb35 David Howells 2022-10-10  54  	}
ea8a55f838fb35 David Howells 2022-10-10  55  
ea8a55f838fb35 David Howells 2022-10-10  56  	while ((skb = skb_dequeue(&sk->sk_error_queue))) {
ea8a55f838fb35 David Howells 2022-10-10  57  		skb->mark = RXRPC_SKB_MARK_ERROR;
ea8a55f838fb35 David Howells 2022-10-10  58  		rxrpc_new_skb(skb, rxrpc_skb_received);
ea8a55f838fb35 David Howells 2022-10-10  59  		skb_queue_tail(&local->rx_queue, skb);
ea8a55f838fb35 David Howells 2022-10-10  60  	}
ea8a55f838fb35 David Howells 2022-10-10  61  
ea8a55f838fb35 David Howells 2022-10-10  62  	rxrpc_wake_up_io_thread(local);
ea8a55f838fb35 David Howells 2022-10-10  63  	rcu_read_unlock();
ea8a55f838fb35 David Howells 2022-10-10  64  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

