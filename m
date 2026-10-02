Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26BD361953
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917593; cv=none; b=DUKcSW6qmhlTcE/yvz3gTNyjOZonXn5h2JA49nXnbL89F+vz8ElKVk7/88GLXw2dCVgNOJkCNVmAA81Y7IZFzbm8xXRiJpLFrX0QNRvAtpjsf7KX8YbAtd17wYD1+RWFhr80uKTVfmG76fki9MwlVgXOgf+sLOa0VCchzEjC1s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917593; c=relaxed/simple;
	bh=b2PYffbQu0LiIrlwwgXBVJevEQgfnckMqQ11SN4MLWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZAsaSFyBTJFCmfeJzAMnFhgSAfBkGLgNjMpjNKL9PmT2ml8p7znSZ6KH6qgFcxGhkoSemDInBoTMJo1EC2qT8nC47MiCSLMd0rR7j/tR5nSDFJ3cOHpuDh942S5j1cXotBezSvU4pQDlwzMM9eWEuyELdDulF7HOV68t7SHqEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6GmSuHn; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6GmSuHn"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so2146824f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 01 Oct 2026 22:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790917590; x=1791522390; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTn0Od7NqDwouQEAooTW7xcGRo+VrAdp0mD9BcMogI0=;
        b=I6GmSuHn32VJR31UW6hJ6ym2Nuh6azc0Kap2RrEgjh2Ep8saDt0GpvPDJqMjBHgzt2
         dxilTvETsrEvfCOS+p0bJRVo87PZ8eG7LXb/6VmM780U6S4BWHDMlk5orLbcDZChnVSF
         826BKQoHIbGiN0GohbtlHZe/cvUHSezg0XsSifI9b86Rur43qeoWpPl0cuNeGEGHpojg
         FrtdkpiyyCjah7KsRo1Ty7vj7QKkKNgoGWtwiHcYd2qhDM1t9tQKc8OEZZDRJGLFX7Fx
         3G6PdILqTqf5DWPkI5F9lmcWlvvsioIdA0fmB4BIJR/L8QTINPYOleK1va89Gvj1smyR
         7T1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790917590; x=1791522390;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTn0Od7NqDwouQEAooTW7xcGRo+VrAdp0mD9BcMogI0=;
        b=IGjTxY9xE5yrakQXr/yQHOK9jmSFjB2YEwWWQLrc04O9SXGNEglj2uvOxg5F1anC7h
         HlNKbE7J4+oKWCKToAdX64SiKiXC5SkiKLFK8hwmH11aLeisqrxWTDiTV46DROR2wacB
         vHirRbXe7RyfBdIuy0PFVQT4LYrwOyYS3CeHYVUy5ZZJpCzUI/WhwEKkOSs0Xh3dgX/Q
         SaKNjWZFD60RnoYGa3krdm4ukTA805RbUaBc0aEuP0NLxMXsMAOWv30AF8kSfl7QgWWd
         T6sI3+YRKu6maQtdV+3tRm1G8zJXp2pmSoHz9NbkYgc7wOryke3lK7auWLLJ+7Jc6g9o
         00hw==
X-Gm-Message-State: AFq9FYJ5C3DyVCIOCJIvZJu6T8W8Rm6YZQoDVD4Nh7rrlj+k1SrjDXql
	4xit6WRlCIF/KAJUCJxtqTexf3vQk7FnO0zRQloAqYcWcllN+NpoeDjwt5A0fdVobxbdCw==
X-Gm-Gg: AYBFou1hxwdmOmdXtNiB675Khq3ZXSiGHy0Uoy5VrUo/5SAUlhmcj/r5lQ2qKMLrgM6
	VCdYYG7eAMKyxsW+UjWikewgkDW4w2+EUz/l5PQc9YekyA9OT2PO/ightBDdoX79g3y7l6zpDZ+
	0JmIXdZT+zpPmrH52Ale9OXd2VIpQ2Pw8x5oVRovCJCGzp3el2b8kc9FjWuRvU7PSNIZHw39WiE
	ln2fyTREr2jQWWsDjDZruR5qnpgvag8sfnrUQap4b5+lQF7yfE9yigOgE6XCadzwL6fY9ir8dhE
	5NTflurqvSb1Lu9C5nrFR9Ef3Njdzrs2VvPM0nr2NXp92pS9O1d/pJoB/bnjQE1CCZN5lKvYfQG
	SbKa/tDZOpB8eZlg/MRkrwpJJCvSDvnTKPI8szAmO3PxlCTEjuZ+/9udoq6+SWygXKZ9aan61HV
	KhXfKzUJN/h1RqZJE+3zpB+LzbkoWgyEum9F5LnqpuUo+cbipVfR74NZ7TB5VprQELqJg=
X-Received: by 2002:a05:6000:3112:b0:487:faa:b1e0 with SMTP id ffacd0b85a97d-48b1270fb9amr2477283f8f.12.1790917589467;
        Thu, 01 Oct 2026 22:06:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fa61csm3083895f8f.17.2026.10.01.22.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 22:06:28 -0700 (PDT)
Date: Fri, 2 Oct 2026 08:06:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 18/18] fs/smb/client/sess.c:310
 cifs_disable_secondary_channels() error: dereferencing freed memory 'iface'
 (line 308)
Message-ID: <202610020116.n8KvKthY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261002050623.ktXvq4wO5u_Y6VKblIZloLOH0h-Re8ZS0nCngOOgpn8@z>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   e2d429338ffa976942aba4887d0b8a7e07dc0267
commit: e341b7975bd72d3ebda92b8d747d0aad15ce8717 [18/18] cifs: handle when server stops supporting multichannel
config: x86_64-randconfig-2200-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020116.n8KvKthY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610020116.n8KvKthY-lkp@intel.com/

smatch warnings:
fs/smb/client/sess.c:310 cifs_disable_secondary_channels() error: dereferencing freed memory 'iface' (line 308)

vim +/iface +310 fs/smb/client/sess.c

e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  285  void
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  286  cifs_disable_secondary_channels(struct cifs_ses *ses)
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  287  {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  288  	int i, chan_count;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  289  	struct TCP_Server_Info *server;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  290  	struct cifs_server_iface *iface;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  291  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  292  	spin_lock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  293  	chan_count = ses->chan_count;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  294  	if (chan_count == 1)
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  295  		goto done;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  296  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  297  	ses->chan_count = 1;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  298  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  299  	/* for all secondary channels reset the need reconnect bit */
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  300  	ses->chans_need_reconnect &= 1;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  301  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  302  	for (i = 1; i < chan_count; i++) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  303  		iface = ses->chans[i].iface;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  304  		server = ses->chans[i].server;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  305  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  306  		if (iface) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  307  			spin_lock(&ses->iface_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16 @308  			kref_put(&iface->refcount, release_iface);
                                                                                                                   ^^^^^^^^^^^^^
iface released

e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  309  			ses->chans[i].iface = NULL;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16 @310  			iface->num_channels--;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  311  			if (iface->weight_fulfilled)
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  312  				iface->weight_fulfilled--;

and then dereferenced.  Use after free.

e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  313  			spin_unlock(&ses->iface_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  314  		}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  315  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  316  		spin_unlock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  317  		if (server && !server->terminate) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  318  			server->terminate = true;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  319  			cifs_signal_cifsd_for_reconnect(server, false);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  320  		}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  321  		spin_lock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  322  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  323  		if (server) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  324  			ses->chans[i].server = NULL;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  325  			cifs_put_tcp_session(server, false);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  326  		}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  327  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  328  	}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  329  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  330  done:
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  331  	spin_unlock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  332  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

