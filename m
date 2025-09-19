Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5279230BE9
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758280774; cv=none; b=Eb14WnTTPhYSDEg5sYRNM7UQCSrczk2bnp5+Tsv1adVImgK7rAzvDrdsHatrI8hfZkEjLHE5CYun3QCK+ffIntkAScTOwugUC3b+a4u0OxGH8mNGcXAurxDHHCM++zs6n8p34QfKb4lctWRavmUqeFZIC43zBAPpouW3pHvlVy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758280774; c=relaxed/simple;
	bh=OSpSer7L/Fdwo1tYMGj624Qc1hg8hpEySnn90lrR+5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2pvU+GzGaQv7Nyzd7TWuw5YDmfC05ydDQJDea24Qf3Qh5Z3EqExSGDspNYLu5Z+Y2en/GNn+oyl3tT5aOG2kRbGnmgBDEyoIPt3gawdscEakjhq/hvbU0476bKyM24f9enAPyJVj8kTG20lEeBiyjvRTE/uZTj8DgEvtZk6/ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZkLG/iF1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZkLG/iF1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so15335495e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 04:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758280771; x=1758885571; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vt83PDk7dRWoqywELBSt3rXR8Q/SZZebgA8QDff1daI=;
        b=ZkLG/iF1kbH5jKnHxfoj+UZlY06JgSUNYbA+SX4GmG6RUSyeYqGdzknTxUiEUmH1Ve
         HMhOUJ11XF0g4wBh1rBtLAUy/4G81o0iBUpC4QZ98A1nfx6tlVtdXu5TSr+CbnglFeHi
         ClsHKcwQ2gutvhqcstwSDXH/pM/J+lMgLN3uJ1H1zcUJwQJ7o+Oc3JDk9jeP0ZsOsqpB
         jguxoMTr5Clmy3Tlw10+JdUy7dRo2v2LTBemDb2fXSbETYGBhU5qMe7/aOb6DFlZX/YT
         p0Zw20mNe+EhSOx9TfGDA4WS33CrBl8ALbFnoK3xy90ZNccE8U5JXbWC6B703/gcHrxZ
         ysEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758280771; x=1758885571;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vt83PDk7dRWoqywELBSt3rXR8Q/SZZebgA8QDff1daI=;
        b=vc8lyzY8cURUImOyqIm3JPLhVzOA+zHLtlow3SaQ8YRtV1MX3n7bCRtzxYhlU0FPvD
         pFCTed0LG2yJ/zUmhpZ9Wq8j8MNci56DE7WccWwUR0P2Lqu1a5eA+b43UwM6iGt9JSW8
         nvMz1o9fVg8X0cvSJN82jTDvTRwJRhOjN85Z9CyYtW6BacaufKRehDU2ePSpJxhJI1hS
         wV5w8lVsxSeKbVOYgN2hy3Co55Q7joIdG7cSZ8ghdOVO+S44vyldXOhj/Sdsbnj28BMK
         WzFtMfTm91KUm9OhB3fNODw5rl6x5pKFFpTw0iyXNPu/lnSs106sH5/Z4VMWV8kzwqoA
         lJtQ==
X-Gm-Message-State: AOJu0Yzfmgs0bzqgFmo5az2XHATqdAjyR+2lyY/VNaBJxzCWdQKloKB/
	hcwRsh3cD5NA5JWVs0WBFF1f15Pob9CJWi215lNAXlPxUTZFn38rUWP7TSyWnGUM4vb2wxcEzvD
	CK65c
X-Gm-Gg: ASbGncs/q70qAT21hC2LWd3czvTC7wD5yoMTjlpkOy8GCCEPirsEaHESd11JFCyLr/I
	XjCVGqTWNo006zkdsRhVSJSw/S89srDR/cgCwVcUfUx6Q2ogFzRi64KXS/0jCPCSxgqk33c5qY+
	UD1fu5RnlOUc9rat/4LXcLyteh4sD37Cn3wP906fo72EBdc79Dh/8+dZRIFJTduxEUTqwhFmN6i
	oX4PwKbe305M7RMYJlqs82/PxDvoVleeLDohLzDmTmzGDdWJKkyhGqWrxPa3XG7d+hqKHWDeETk
	2yOOwvRm2yeps6IidEaOGJUIoc+/mhxuy4M1wWLeb1ABcrzOSwaZgRVNB5DUOZWZF4RKczFazks
	7Mgg8RT7mnfC/ZVpaFAYlP20xh/VM
X-Google-Smtp-Source: AGHT+IG897BEsfsXFm/Qto6IyaO1agOOC97axuG1JFS175oEpSD1jqU46H55yBTAlhCtEEiag7KJLw==
X-Received: by 2002:a05:600c:3b1e:b0:45d:dc6c:9e30 with SMTP id 5b1f17b1804b1-467aba7b0f2mr33515745e9.14.1758280770647;
        Fri, 19 Sep 2025 04:19:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464eadd7e11sm86483755e9.0.2025.09.19.04.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 04:19:30 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:19:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, jason.zeng@intel.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [bytedance:6.6-velinux 5959/5959] drivers/block/nbd.c:1298
 nbd_reconnect_socket() warn: inconsistent returns '&nsock->tx_lock'.
Message-ID: <202509191844.UIjeXrdY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250919111926.DX85DQKaGA6eb3HLhLLAvP-dPZ14lf1-qELzX0AbVLU@z>

tree:   https://github.com/bytedance/kernel.git 6.6-velinux
head:   267e33ff5e034d9f9222c229e6967b6ceb65e27a
commit: 454e732aaf9bdba6d2183f14939163e6a37dfbd3 [5959/5959] bytedance: nbd: Don't use workqueue to create recv threads
config: x86_64-randconfig-161-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191844.UIjeXrdY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509191844.UIjeXrdY-lkp@intel.com/

smatch warnings:
drivers/block/nbd.c:1298 nbd_reconnect_socket() warn: inconsistent returns '&nsock->tx_lock'.

vim +1298 drivers/block/nbd.c

b7aa3d39385dc2 Josef Bacik               2017-04-06  1230  static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
b7aa3d39385dc2 Josef Bacik               2017-04-06  1231  {
b7aa3d39385dc2 Josef Bacik               2017-04-06  1232  	struct nbd_config *config = nbd->config;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1233  	struct socket *sock, *old;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1234  	struct recv_thread_args *args;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1235  	int i;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1236  	int err;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1237  
cf1b2326b73489 Mike Christie             2019-10-17  1238  	sock = nbd_get_socket(nbd, arg, &err);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1239  	if (!sock)
b7aa3d39385dc2 Josef Bacik               2017-04-06  1240  		return err;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1241  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1242  	args = kzalloc(sizeof(*args), GFP_KERNEL);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1243  	if (!args) {
b7aa3d39385dc2 Josef Bacik               2017-04-06  1244  		sockfd_put(sock);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1245  		return -ENOMEM;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1246  	}
b7aa3d39385dc2 Josef Bacik               2017-04-06  1247  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1248  	for (i = 0; i < config->num_connections; i++) {
b7aa3d39385dc2 Josef Bacik               2017-04-06  1249  		struct nbd_sock *nsock = config->socks[i];
454e732aaf9bdb Xie Yongji                2021-12-17  1250  		struct task_struct *worker;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1251  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1252  		if (!nsock->dead)
b7aa3d39385dc2 Josef Bacik               2017-04-06  1253  			continue;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1254  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1255  		mutex_lock(&nsock->tx_lock);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1256  		if (!nsock->dead) {
b7aa3d39385dc2 Josef Bacik               2017-04-06  1257  			mutex_unlock(&nsock->tx_lock);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1258  			continue;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1259  		}
454e732aaf9bdb Xie Yongji                2021-12-17  1260  		worker = kthread_create(recv_work, args, "knbd%d.%d-recv",
454e732aaf9bdb Xie Yongji                2021-12-17  1261  					nbd->index, i);
454e732aaf9bdb Xie Yongji                2021-12-17  1262  		if (!worker) {
454e732aaf9bdb Xie Yongji                2021-12-17  1263  			sockfd_put(sock);
454e732aaf9bdb Xie Yongji                2021-12-17  1264  			kfree(args);
454e732aaf9bdb Xie Yongji                2021-12-17  1265  			return -ENOMEM;

Call mutex_unlock(&nsock->tx_lock); before returning.

454e732aaf9bdb Xie Yongji                2021-12-17  1266  		}
454e732aaf9bdb Xie Yongji                2021-12-17  1267  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1268  		sk_set_memalloc(sock->sk);
5eafd64a3bd2ab Hou Pu                    2020-11-06  1269  		if (nbd->tag_set.timeout &&
5eafd64a3bd2ab Hou Pu                    2020-11-06  1270  		    !test_bit(NBD_RT_WAIT_ON_TIMEOUT, &config->runtime_flags))
dc88e34d69d87c Josef Bacik               2017-06-08  1271  			sock->sk->sk_sndtimeo = nbd->tag_set.timeout;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1272  		atomic_inc(&config->recv_threads);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1273  		refcount_inc(&nbd->config_refs);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1274  		old = nsock->sock;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1275  		nsock->fallback_index = -1;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1276  		nsock->sock = sock;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1277  		nsock->dead = false;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1278  		args->index = i;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1279  		args->nbd = nbd;
7e62a555d99f2f Li Nan                    2023-09-11  1280  		args->nsock = nsock;
799f9a38bc9f55 Josef Bacik               2017-04-06  1281  		nsock->cookie++;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1282  		mutex_unlock(&nsock->tx_lock);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1283  		sockfd_put(old);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1284  
ec76a7b922e42d Xiubo Li                  2019-09-17  1285  		clear_bit(NBD_RT_DISCONNECTED, &config->runtime_flags);
7a362ea96d0df8 Josef Bacik               2017-07-25  1286  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1287  		/* We take the tx_mutex in an error path in the recv_work, so we
b7aa3d39385dc2 Josef Bacik               2017-04-06  1288  		 * need to queue_work outside of the tx_mutex.
b7aa3d39385dc2 Josef Bacik               2017-04-06  1289  		 */
454e732aaf9bdb Xie Yongji                2021-12-17  1290  		wake_up_process(worker);
560bc4b39952ed Josef Bacik               2017-04-06  1291  
560bc4b39952ed Josef Bacik               2017-04-06  1292  		atomic_inc(&config->live_connections);
560bc4b39952ed Josef Bacik               2017-04-06  1293  		wake_up(&config->conn_wait);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1294  		return 0;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1295  	}
b7aa3d39385dc2 Josef Bacik               2017-04-06  1296  	sockfd_put(sock);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1297  	kfree(args);
b7aa3d39385dc2 Josef Bacik               2017-04-06 @1298  	return -ENOSPC;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1299  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

