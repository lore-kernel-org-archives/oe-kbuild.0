Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD26F514
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mh1iHDOc"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50aab3bf71fso1391792e87.3
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 00:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700470503; x=1701075303; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fy+1mN1JURxGkFdikha5Vmh+lSHC6OOSWhmLP+px5PU=;
        b=mh1iHDOcMV/h6LaItXwdW1lF1DnlJtycBXRuKdoDKxIU768KcXCCJoRuYjeeqf1R9D
         hhQM/Qr1bwtow+WOHTg6h1jLm9yUTJfsHdVBqZcNzsK/oVjpHvmHFQJDeHvoqg/fp7wo
         ydwXAALKwpgoWJRy/lqye9BVbnADKsJ/tdn+N3GWy6E88AxPBCQNRxlWR9Af+O/QErr1
         crCWzqH1NlF2QH6C3xnjxgaQA6ikjiOXmbGp1LAPT1W/0EfTz20+/WzP+Ps2tCUAVZfs
         pmYgHSszKvVC7sgIsR+9oswHj+bYkSjY0SGdUqzZNP2qa9N4auF1/Xm4WXKQLarFHaCa
         VOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700470503; x=1701075303;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fy+1mN1JURxGkFdikha5Vmh+lSHC6OOSWhmLP+px5PU=;
        b=S4kY6Pva0aSzJv1HQJjPmQFcTeDnqGxq377FgcsrRmEjkHxr8fA6cSE0Fn+n3gJo3i
         G6ehix+iqXGkxZ6OS1ZtBGjiTPTpHQ2Q1I9UwHh1o8106IXO3ri28qZ6UVEMaKgFv4sb
         bXXAqj851sZXfIMrOQBTaYQgdatPly/0xgqU/nD4RrzJ0WHiY4oh13NWs5rFiYUV25nH
         eXM3w2wBlu+ankqB4H1nAILIShDvEKfdzH3Ne5i/bSBCzNYHVOpNFp5V4EWBppmI7kEx
         QMmR3kAhDc3rbxmiOq0EHEIlq3G+nrcr/+v93lFTr9ssUNVhDU87KAOiDuM4RFYGhjig
         kE9g==
X-Gm-Message-State: AOJu0YxW8nmcCfEr7Rz5pQIwtUl6BkVBLffH8qgMxlRt+cawiOgi1/Ma
	Po0nXqq1v9HRBJVYzBPsjVesTiOmg5votWu29lU=
X-Google-Smtp-Source: AGHT+IGKKjF1LV0qlPxktUq9SEpMGkiV4eJgkmIn+nNGDyKTGo5RKPCRZIRX7Fpgc2rc0/8jcBXZbg==
X-Received: by 2002:ac2:59c9:0:b0:509:860e:debf with SMTP id x9-20020ac259c9000000b00509860edebfmr5297010lfn.27.1700470502813;
        Mon, 20 Nov 2023 00:55:02 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020adff94a000000b003317796e0e3sm6521707wrr.65.2023.11.20.00.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:55:02 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 03:55:00 -0500
To: oe-kbuild@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [tglx-devel:queue/core 1/1] lib/debugobjects.c:730
 debug_object_activate() error: 'obj' dereferencing possible ERR_PTR()
Message-ID: <2999d03c-4002-474f-9654-e9eded9af8c3@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git queue/core
head:   265c43c4e983edc38cb9b0b75fc82eda0808512d
commit: 265c43c4e983edc38cb9b0b75fc82eda0808512d [1/1] debugobjects: Stop accessing objects after releasing hash bucket lock
config: i386-randconfig-141-20231107 (https://download.01.org/0day-ci/archive/20231109/202311092147.YQefKK78-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231109/202311092147.YQefKK78-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311092147.YQefKK78-lkp@intel.com/

smatch warnings:
lib/debugobjects.c:730 debug_object_activate() error: 'obj' dereferencing possible ERR_PTR()

vim +/obj +730 lib/debugobjects.c

aedcade6f4fa9a Stephen Boyd     2020-08-14  694  int debug_object_activate(void *addr, const struct debug_obj_descr *descr)
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  695  {
63a759694eed61 Thomas Gleixner  2023-04-12  696  	struct debug_obj o = { .object = addr, .state = ODEBUG_STATE_NOTAVAILABLE, .descr = descr };
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  697  	struct debug_bucket *db;
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  698  	struct debug_obj *obj;
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  699  	unsigned long flags;
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  700  
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  701  	if (!debug_objects_enabled)
b778ae25366e6f Paul E. McKenney 2013-04-23  702  		return 0;
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  703  
0af462f19e635a Thomas Gleixner  2023-05-01  704  	debug_objects_fill_pool();
0af462f19e635a Thomas Gleixner  2023-05-01  705  
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  706  	db = get_bucket((unsigned long) addr);
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  707  
aef9cb05247df3 Thomas Gleixner  2009-11-17  708  	raw_spin_lock_irqsave(&db->lock, flags);
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  709  
63a759694eed61 Thomas Gleixner  2023-04-12  710  	obj = lookup_object_or_alloc(addr, db, descr, false, true);
265c43c4e983ed Andrzej Hajda    2023-10-25  711  	if (unlikely(!obj)) {
265c43c4e983ed Andrzej Hajda    2023-10-25  712  		raw_spin_unlock_irqrestore(&db->lock, flags);
265c43c4e983ed Andrzej Hajda    2023-10-25  713  		debug_objects_oom();
265c43c4e983ed Andrzej Hajda    2023-10-25  714  		return 0;
265c43c4e983ed Andrzej Hajda    2023-10-25  715  	} else if (likely(!IS_ERR(obj))) {
                                                                          ^^^^^^^^^^^^
obj is an error pointer

3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  716  		switch (obj->state) {
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  717  		case ODEBUG_STATE_ACTIVE:
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  718  		case ODEBUG_STATE_DESTROYED:
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  719  			break;
265c43c4e983ed Andrzej Hajda    2023-10-25  720  		case ODEBUG_STATE_INIT:
265c43c4e983ed Andrzej Hajda    2023-10-25  721  		case ODEBUG_STATE_INACTIVE:
265c43c4e983ed Andrzej Hajda    2023-10-25  722  			obj->state = ODEBUG_STATE_ACTIVE;
265c43c4e983ed Andrzej Hajda    2023-10-25  723  			fallthrough;
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  724  		default:
aef9cb05247df3 Thomas Gleixner  2009-11-17  725  			raw_spin_unlock_irqrestore(&db->lock, flags);
265c43c4e983ed Andrzej Hajda    2023-10-25  726  			return 0;
265c43c4e983ed Andrzej Hajda    2023-10-25  727  		}
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  728  	}
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  729  
265c43c4e983ed Andrzej Hajda    2023-10-25 @730  	o = *obj;
                                                            ^^^^^
Unchecked dereference

aef9cb05247df3 Thomas Gleixner  2009-11-17  731  	raw_spin_unlock_irqrestore(&db->lock, flags);
265c43c4e983ed Andrzej Hajda    2023-10-25  732  	debug_print_object(&o, "activate");
d5f34153e52690 Waiman Long      2019-05-20  733  
265c43c4e983ed Andrzej Hajda    2023-10-25  734  	switch (o.state) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

