Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FDA19E96D
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Mar 2025 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414241; cv=none; b=cbhZ8/DH7gJ7McrdyVspSOtMaeJzBgbNbL8zJjrKhcctSJ55ziD2nJm9tMi486nRzBKDohJMFxOQTwXsuKMBOi9lTCwd2J4fn0T4z1E6nYx3is+tpBf5zwJA2HyhDUj1JPxzlaxG44/ijMrVvbzTe8vs2Xjfpmcaz7vog//HCwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414241; c=relaxed/simple;
	bh=uUjD/JplIhUXWecod63ucSrmW7jQiOn8s98ndmFloPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DKVZdiRPIlY+dhBWCbRIHHpi0bUTZJS8P//B77qqn1JpKTdC7fMIErFjKOv6aKPCdqIZ1Ub62Hdnm1En8Q2Cq2TTIxmle4/bSQ+Cyi24nBIQWss6f/R0Tony1F7lR/wHGvpZXA1UDp4R383xc61vISjmrRldME7XxzgsQ1Rnr7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWKsCN4j; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWKsCN4j"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so35239955e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 31 Mar 2025 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414238; x=1744019038; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GLv/TlK6NwyIX5eMw+b9bXsE/bqtOYXg8Tuj7RGPR8=;
        b=TWKsCN4j/ElBWAkjJKGXWnOb05J9tuLmSF9a0hqO6U53aFikIWYMxGaK11cEqTsihP
         5JPLghkpXcdbzwo9tD7uRwb3diwo1FCQIQGyTOhtIFsFjO9m046QFdVQ89VqDjuQA2sa
         GDDxRAl9QdMrxJvlYQ++Q93xCWInh5nNJ2mUHfOjbNRt1fri3jB8wQfdu61LLVqqfEwa
         ZBy7IlX3Cxd8DtBIgH5nnhgC+++v/USI22/QXZFO/4lxYEdUxgfRQe/NtCq8Wrxouu4Z
         uqHOIrp9QGH+WNQaYOyOcuP9kNm8jPlWNzRDtO/D+s2vKtqgE3OmHLr/6EzOWF22jsrF
         lmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414238; x=1744019038;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GLv/TlK6NwyIX5eMw+b9bXsE/bqtOYXg8Tuj7RGPR8=;
        b=YVg81BD9HVePTttMzX9quHf/S1IyH/OzrFY2uk+pwsMkCQ0PW24dylwnaW2WjWI26L
         qLK6Cwu5cXmCAfY0jTpk+DXuFZ4C2HT00123fwLoO16b0RodfAC3zfBqY3YdMh2to4Gj
         mr8KCdWLzJWFT0Qo/iSTN/R+lHGPNePDnxQ6Sr7sKEfj7ZAPOZbuwUFEclKMEZm915xU
         vCLQgnegvYmpEtjSVdwtE7JieiW22sBuSVur5ia2sclL20/8hi5ColCs9ewDjyDAT/k5
         7e9dtkErXfunPSvsPa4K7KYi9hvPZYxE1EIeZIly5AfbQJlCu7OvGni2EG1GFZ+dcqE9
         nBLg==
X-Gm-Message-State: AOJu0YyW0GGAgU7BAi5a6e+O2xY/zb70W5vdMNx1vuxlM4ugGEQFeBe3
	Yp1u3n0/7S42dzujG5/X5bn6KNE8SmX4RpKLnHbm6XirBabqxKjfzLq6P0c4N8isWTDlyZ2tQ7m
	wNag=
X-Gm-Gg: ASbGncsiYFU2WChxBIst0dbFGfDhba284a6JziNUsnjmnDjGxuoTcXJkgs3f0rHAT6o
	Np1dMAjPluKkrtEJReKW3+LctqrNsCgxTqk27VmuVhj3fuk4PvLiumKwEsIpCFUruGWiwRNAe4F
	n5j4HzS91HOY0+IZZufb2ddRAVdZaQnj9K95DIXVJ7GDj8BpXAPszXriPQ4MULdj8p6+pnyn9Ct
	TGOyGu5oNXAV88yvhFmcy0hBhv2YwBZTSlJGPARjgbSqs3tOeovIuDIKqyAMGCEXFRoyoFsCXaF
	AltTkGI/YaDzsuPH/8n3bYVF8uwt/f/fjH0OqcHvGCd55hBmJg==
X-Google-Smtp-Source: AGHT+IGs/AIKyAlURq/RRfCeu90iBXK3gpoSTRjgemLZoshu9Cg+ZXrGip1/5AfFeNfBa9hppYpv6A==
X-Received: by 2002:a05:6000:2a8:b0:391:3156:6be with SMTP id ffacd0b85a97d-39c11b7dae8mr6990133f8f.7.1743414237995;
        Mon, 31 Mar 2025 02:43:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b79e0afsm10922362f8f.65.2025.03.31.02.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:43:57 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:43:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Gabriele Monaco <gmonaco@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/rv/rv.c:838 rv_register_monitor() warn: inconsistent
 returns 'global &rv_interface_lock'.
Message-ID: <bc1fe7c1-a042-42b2-8d40-7621ef0087b9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7f2ff7b6261742ed52aa973ccdf99151b7cc3a50
commit: cb85c660fcd4b3a03ed993affa0b2d1a8af2f06b rv: Add option for nested monitors and include sched
config: parisc-randconfig-r073-20250331 (https://download.01.org/0day-ci/archive/20250331/202503310539.7BDDOPxq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503310539.7BDDOPxq-lkp@intel.com/

smatch warnings:
kernel/trace/rv/rv.c:838 rv_register_monitor() warn: inconsistent returns 'global &rv_interface_lock'.

vim +838 kernel/trace/rv/rv.c

cb85c660fcd4b3a Gabriele Monaco            2025-03-05  779  int rv_register_monitor(struct rv_monitor *monitor, struct rv_monitor *parent)
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  780  {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  781  	struct rv_monitor_def *r, *p = NULL;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  782  	int retval = 0;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  783  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  784  	if (strlen(monitor->name) >= MAX_RV_MONITOR_NAME_SIZE) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  785  		pr_info("Monitor %s has a name longer than %d\n", monitor->name,
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  786  			MAX_RV_MONITOR_NAME_SIZE);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  787  		return -EINVAL;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  788  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  789  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  790  	mutex_lock(&rv_interface_lock);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  791  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  792  	list_for_each_entry(r, &rv_monitors_list, list) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  793  		if (strcmp(monitor->name, r->monitor->name) == 0) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  794  			pr_info("Monitor %s is already registered\n", monitor->name);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  795  			retval = -EEXIST;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  796  			goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  797  		}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  798  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  799  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  800  	if (parent) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  801  		list_for_each_entry(r, &rv_monitors_list, list) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  802  			if (strcmp(parent->name, r->monitor->name) == 0) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  803  				p = r;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  804  				break;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  805  			}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  806  		}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  807  	}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  808  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  809  	if (p && rv_is_nested_monitor(p)) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  810  		pr_info("Parent monitor %s is already nested, cannot nest further\n",
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  811  			parent->name);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  812  		return -EINVAL;

mutex_unlock(&rv_interface_lock);

cb85c660fcd4b3a Gabriele Monaco            2025-03-05  813  	}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  814  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  815  	r = kzalloc(sizeof(struct rv_monitor_def), GFP_KERNEL);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  816  	if (!r) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  817  		retval = -ENOMEM;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  818  		goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  819  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  820  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  821  	r->monitor = monitor;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  822  	r->parent = parent;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  823  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  824  	retval = create_monitor_dir(r, p);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  825  	if (retval) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  826  		kfree(r);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  827  		goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  828  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  829  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  830  	/* keep children close to the parent for easier visualisation */
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  831  	if (p)
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  832  		list_add(&r->list, &p->list);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  833  	else
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  834  		list_add_tail(&r->list, &rv_monitors_list);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  835  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  836  out_unlock:
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  837  	mutex_unlock(&rv_interface_lock);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29 @838  	return retval;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  839  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

