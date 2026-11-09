Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202170;
	b=rgKRQZG5lgoUfTgL/cHfH8CSxEJ0td/9XZGMn8vQL1LfcvidZAbzbFkjBA5NkaT/ez+Q
	 bpUFKJSXM4/pQvUdA25IKLHl9AFcLFAMhsQHcwBsmBogp1YiJGforY6xEebIbqG5OekRA
	 /BPUGSNHh845xTgcJxtyy4zFZT4hUca5VQxBx1c2Q1QCAkFdfyojB/D/a9iQ2Oy96bVSx
	 e6VNu0aAB1iTp6Led4nMVAjaC9pDBsxwIzwUMKe8QRBdebKGXp7Py7lnozR2FZfigKcgc
	 UmV+MN1WqvGnrTvH4L5+lFHvnRWPyLV1wpZpUIVea24ZVcqd/Sq0SC2cQzgRmO6ZYJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=HZtw4LLKwVCjVpJ8oCRSNP25Jrr+H/ycvRzjHFYTTiA=;
	b=yGpbGEJo8wvkKJDAMMXa3VDByG1bej19S0j+nTbsFnz6vNCLm69HZznOqGLLWJNFVm0M
	 8nDoajvkpUnHZNHZuPjPPvzfKZKOJoDl6KACBFWO3ybF5BYcBFFyjJ4TYFK4DUAZfxE+z
	 KCp3Kk+/GXsbrjbNDBdk6jrWivtUg/gL7cMVxEZ68W/SbLTrVYNQwZauz/k43+AC51Rhd
	 +fs6l3fN+2y3YbDwZZo3CNjxWLoBZsWXu8NaeRctH0QpQbxY20mAG8Np5crZOMjJu6lmE
	 s9oPDkqUVNxk6BeaDyhNIa8wQGsd8saZDn3vXkuxO6TuqrzY0m7gIcGRgqXVCTpcqWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGoCwbkh;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCB4606EE9C
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 05:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BCB4606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGoCwbkh
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so4863195e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 08 Nov 2026 21:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202168; x=1794806968; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZtw4LLKwVCjVpJ8oCRSNP25Jrr+H/ycvRzjHFYTTiA=;
        b=kGoCwbkh0S2MnMS7vQc33Lzu5tYkk8nU9uLS5cvtbXhiAo82IIcKzdq8A5h5vt/ksf
         zCeocyYhKB63kT9J9wBWrt74WDxjcF8W2nHRqeXanq3aG4/6n+yQ+ibrlswb6ZDPA232
         SWdj75fCy7aaGOFAWr7vsCuR0gLxgoeUJ2WGaehpd/ogVn2JdArqY4UT8F44+Kx1IJqI
         pIX3Inqwd5ytDJ4NnhE1UZMzWrI6N8XXXrjEgpPi7ZE3fVVnZMCZlx1ii+jBOT0/dpnc
         uXWIm2DbMfG/RfBbOKHT+CalbI9LwiFXZg9kQYAwCk0/F7EFkORg0RXmN61vrP3bNPUf
         VToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202168; x=1794806968;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZtw4LLKwVCjVpJ8oCRSNP25Jrr+H/ycvRzjHFYTTiA=;
        b=iWyFunaqgwIp2EioH6NcxMwnNDVVvdL99zrqxMnGDUm0Ne+RzvAJzLw7Dk7NakMlyr
         ACXOcgMwv3r2OqK0WOE3l992WIbsNv+gSpPx2tXpdMO+OJuR6T8hYmiHP0RBzZIv7q+e
         MJJ42wDSpX5J+zBBoiqXYnrAmpJMk8q+X+DfERaS6SuucRrYBYZwNUKuNoXhbsL45vGy
         j+3uZe3DguUGPuLVLgFbCAKPfXPPh+hxXXv2HM+AWMHALb7CLQVN14tL0X6tNIIcVo8n
         fKWP1vgU76Y5u5ImLXVwb1N+Efj+9mKRurYFruuN8wl84QQXOn8G1eYIOxiQBhqdFIov
         iYdg==
X-Gm-Message-State: APuU4Z82m5XEVweTajx7dpHmKzHPReXEy9YROTu9tjFGagJrS+pScEwI
	TBkdarYroQuAmeDp61M/pwofphQ3qy8ojAgk7LwH7nFp8t7mVKM8KKmuo29+njcucQqFj/Bl
X-Gm-Gg: AYBFou2Qje6ssUEMPm586JN53Qf0GBVJ6cAYo2WAGIn5MjgVy+ReWUBwR7ROvS2FXd3
	ePthA89Fjdk4l88U8RDykCZEKwk4DUXYQDQ6zb2ufcmmpxVYPrWaK0+RY4WaZMv8/qbjK7mo0H4
	NtueiHhWamvQGu7pgSx3adXfAatI+SAYqOMe38bP+SXib3/ewIynrwjpYXXSWt+FSx1MAFe8XC5
	Rt4WTzyPbk9oY0ouDFjN6aCzQwMxAlhW8sHHPl49ZlNLi5DMZWJvJy/QGwfHMrWQaRT1aUE1u+q
	lTQw/PJCs1HtEFvBNgAtaVPkkn8sbRe8uBtTMsDO+JODrw/OgK5/ki6MWKzf4IMiGVH/2nlvaXp
	fLNXHS1huYQPuG4kS3BvwLY3u1JQEsbDdKjXdXF1VNXE7f6ng9eZ5lS7q6bTrTsqoj8gYdMcaQ7
	J17Pl8alcasKD6dBszLZYOI2ZdntLqb1mj+Ub+35w0BUJhhdvsmaepnCrQ82o2AyMWKU9cYgoqI
	FVKVwGXdqikIYLQhu88h6Qhi0+/uvKkw9T/dftkKK4Ii2u+8UeaSo9TMhvm/+qEPVtV8t38ue6P
	D9gPg/bjaQGbC12QfrfQT0CHYG9DDjlf9e6LcLuUJa8CQgsojkqaIQ48gZNZr+YKJcWUuQe1BJJ
	BEKAR7ChcENwCXxvK8s9xR0eB4OhNp9ExqNb64RhGy5t1J4LW7gHDyRLB9VQTti+BVA==
X-Received: by 2002:a05:600c:4f89:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4b963c97d7cmr60145445e9.26.1794202168374;
        Sun, 08 Nov 2026 21:29:28 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm127646105e9.13.2026.11.08.21.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:29:27 -0800 (PST)
Date: Mon, 9 Nov 2026 08:29:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [wsa:i2c/for-andi 13/16] drivers/i2c/busses/i2c-nomadik.c:737
 nmk_i2c_xfer() warn: pm_runtime_get_sync() also returns 1 on success
Message-ID: <202611081308.P8lYvNIg-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20261109052924.ElujUqbohhwuAPXhPL2HBa2LFvp6DSVpytA0TL9eQIY@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-andi
head:   f3adfdab5e653345b7a520776ef9c7885e87de92
commit: e3e199d44d27ceb2f4a104fff8330025823e9e85 [13/16] i2c: nomadik: handle pm_runtime errors
config: alpha-randconfig-2200-20261108 (https://download.01.org/0day-ci/archive/20261108/202611081308.P8lYvNIg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611081308.P8lYvNIg-lkp@intel.com/

New smatch warnings:
drivers/i2c/busses/i2c-nomadik.c:737 nmk_i2c_xfer() warn: pm_runtime_get_sync() also returns 1 on success

vim +737 drivers/i2c/busses/i2c-nomadik.c

3f9900f17cdb03 srinidhi kasagar         2010-02-01  730  static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
3f9900f17cdb03 srinidhi kasagar         2010-02-01  731  		struct i2c_msg msgs[], int num_msgs)
3f9900f17cdb03 srinidhi kasagar         2010-02-01  732  {
e3e199d44d27ce Dmitry Guzman            2026-11-03  733  	int status, i;
ae9977eefc4a1e Théo Lebrun              2024-03-06  734  	struct nmk_i2c_dev *priv = i2c_get_adapdata(i2c_adap);
3f9900f17cdb03 srinidhi kasagar         2010-02-01  735  
e3e199d44d27ce Dmitry Guzman            2026-11-03  736  	status = pm_runtime_get_sync(&priv->adev->dev);
e3e199d44d27ce Dmitry Guzman            2026-11-03 @737  	if (status)
e3e199d44d27ce Dmitry Guzman            2026-11-03  738  		return status;

Use pm_runtime_resume_and_get() instead per the comments to
pm_runtime_get_sync().

a20d23945f30ec Jonas Aberg              2011-05-13  739  
3f9900f17cdb03 srinidhi kasagar         2010-02-01  740  	/* setup the i2c controller */
ae9977eefc4a1e Théo Lebrun              2024-03-06  741  	setup_i2c_controller(priv);
3f9900f17cdb03 srinidhi kasagar         2010-02-01  742  
3f9900f17cdb03 srinidhi kasagar         2010-02-01  743  	for (i = 0; i < num_msgs; i++) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

