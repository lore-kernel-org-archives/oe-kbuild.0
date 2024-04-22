Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0588515099A
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713792677; cv=none; b=q0BhJ3QbAFLZQTxYKMtyV64vwD+bMvKW2qtbmV7NbGpdjrsBgZc7xD2jZC7shMWnnNTjZJBmNael56ZVAlJPLkEi3KiN+G5jE2YkRBW2rMN8veRTcViuXSzRJ4+JcZHuCpH60y0kgM3aa4XECWU9ZszSmsHys21iWEBvXIt3yxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713792677; c=relaxed/simple;
	bh=f84hpgEjuj/YsRlhrMTCln8uksiGh8i2kTsoD6BSguQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uGYURoL1jA/tZ96XYpbHdb0/6Qv/YAyDts0RmA1zoZyQYQ0BzXVDJoBR0FkyNbZQ+aYELkKjYJJEChtB9tUKpKbkDwe7B8kewqbYH/4vdOB1b9xHJV02uWrsPoYrS6qjOW4B37o3t2AMwQrQ34iShwsRXe5z3zXPdEczZ75DHKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UywNwlt1; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UywNwlt1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56e56ee8d5cso5552955a12.2
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713792673; x=1714397473; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3QuxldsAC6tZNwoIGSTGcKuTEWWFXOxujPjyRgEXFQ=;
        b=UywNwlt1wNpSE47WjuoSooCEkfhwWLp1SaSTsLi2mF9NFXI1o+Z20JKMVR5hoHnUIm
         I/Xuq+8lck+9WG7Kz19JbI7IWcaJVAstNHC/MGOwnKtlrpUEIlJRYOnHw3UtIlDBCETg
         5ygR7JV3DErRDC6r07DQ3k+CgU+hd+46xSMTK/8Ehg/UXQWLv8SiecL6CD2pjDSn6axf
         zrQrHExNg7T6jZ0hzeimLvAfSIopFhmd+YmGEwkT6VqPOQFLUZmIHIX8/cLMYODCO+di
         sEWssz9kmwjfIOnRXKK89XXN6FcvXB8uQXY/7UaIdgWDCtKpg+I2W75Vp6pSSUIcpji9
         zADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792673; x=1714397473;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3QuxldsAC6tZNwoIGSTGcKuTEWWFXOxujPjyRgEXFQ=;
        b=pnD8nYtlh7JgMYKPWJ6MlvLDTFL4kqbG7uB/xvyuykKikk1OTqNSt47akyuNwjtIac
         qYaQtPk4vT+LxeMLFAzMNwr75Hs5vK/4uB0zqtk0sqdqM/KWW5NsAvM4p8VWZR4x0NuJ
         X8SBLAU/EplP7q+BxpVy2OBor/AkLgU4Ct6j7SiVfCcm+EyOjZT2hd9Jd55QadOA+BBP
         naZSbQVw7wKqZsylRlQcelzKB5c5FOzHsliEpJa+TiMvmFvZLbg8/adKeGwzcSP12R49
         XdM57Rxx321Yg2QKsQxS4yf2rUMcVswcfRIaIkIqCWvDfnzfQNB6v+PM/ijch6PiuCCq
         7ieg==
X-Gm-Message-State: AOJu0YyWUMMdxjzHq+PTtPzNMSAKvFksYJOUs/6CY2Tg9xnef4i0iyMb
	miO/iY83GnPWUGuXwRM9Fl34cPLWdJScyJ693DRnnPKLfxfK330Qs5cEkJUZ/iDw93IPWy4SpBd
	j
X-Google-Smtp-Source: AGHT+IHaaJ30nGDvNux6hqwIz3kteIy8ncL3HpyuoET7P0ye90fDq2rQ2dr8uFDp831b4+ciUYt28w==
X-Received: by 2002:a17:907:98d:b0:a55:aea4:fdff with SMTP id bf13-20020a170907098d00b00a55aea4fdffmr4017561ejc.69.1713792672266;
        Mon, 22 Apr 2024 06:31:12 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bk4-20020a170907360400b00a55b2f9a2e2sm1525011ejc.105.2024.04.22.06.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:31:11 -0700 (PDT)
Date: Mon, 22 Apr 2024 16:31:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alexander Aring <aahringo@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Teigland <teigland@redhat.com>
Subject: [linux-next:master 5836/7122] fs/dlm/lockspace.c:566 new_lockspace()
 warn: missing error code 'error'
Message-ID: <ea8de937-9252-4ac2-bf9a-815bcc4018e4@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a35e92ef04c07bd473404b9b73d489aea19a60a8
commit: 6c648035cbe75d78836f6d7d2fdd9d996048a66b [5836/7122] dlm: switch to use rhashtable for rsbs
config: i386-randconfig-141-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200536.jGi6052v-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404200536.jGi6052v-lkp@intel.com/

New smatch warnings:
fs/dlm/lockspace.c:566 new_lockspace() warn: missing error code 'error'

vim +/error +566 fs/dlm/lockspace.c

60f98d1839376d David Teigland       2011-11-02  407  static int new_lockspace(const char *name, const char *cluster,
60f98d1839376d David Teigland       2011-11-02  408  			 uint32_t flags, int lvblen,
60f98d1839376d David Teigland       2011-11-02  409  			 const struct dlm_lockspace_ops *ops, void *ops_arg,
60f98d1839376d David Teigland       2011-11-02  410  			 int *ops_result, dlm_lockspace_t **lockspace)
e7fd41792fc0ee David Teigland       2006-01-18  411  {
e7fd41792fc0ee David Teigland       2006-01-18  412  	struct dlm_ls *ls;
79d72b54483bf8 David Teigland       2007-05-18  413  	int do_unreg = 0;
60f98d1839376d David Teigland       2011-11-02  414  	int namelen = strlen(name);
6c648035cbe75d Alexander Aring      2024-04-15  415  	int i, error;
e7fd41792fc0ee David Teigland       2006-01-18  416  
3f0806d2596de0 Tycho Andersen       2018-11-02  417  	if (namelen > DLM_LOCKSPACE_LEN || namelen == 0)
e7fd41792fc0ee David Teigland       2006-01-18  418  		return -EINVAL;
e7fd41792fc0ee David Teigland       2006-01-18  419  
b5c9d37c7f6051 Alexander Aring      2022-08-15  420  	if (lvblen % 8)
e7fd41792fc0ee David Teigland       2006-01-18  421  		return -EINVAL;
e7fd41792fc0ee David Teigland       2006-01-18  422  
e7fd41792fc0ee David Teigland       2006-01-18  423  	if (!try_module_get(THIS_MODULE))
e7fd41792fc0ee David Teigland       2006-01-18  424  		return -EINVAL;
e7fd41792fc0ee David Teigland       2006-01-18  425  
dc68c7ed362a00 David Teigland       2008-08-18  426  	if (!dlm_user_daemon_available()) {
60f98d1839376d David Teigland       2011-11-02  427  		log_print("dlm user daemon not available");
60f98d1839376d David Teigland       2011-11-02  428  		error = -EUNATCH;
60f98d1839376d David Teigland       2011-11-02  429  		goto out;
60f98d1839376d David Teigland       2011-11-02  430  	}
60f98d1839376d David Teigland       2011-11-02  431  
60f98d1839376d David Teigland       2011-11-02  432  	if (ops && ops_result) {
60f98d1839376d David Teigland       2011-11-02  433  	       	if (!dlm_config.ci_recover_callbacks)
60f98d1839376d David Teigland       2011-11-02  434  			*ops_result = -EOPNOTSUPP;
60f98d1839376d David Teigland       2011-11-02  435  		else
60f98d1839376d David Teigland       2011-11-02  436  			*ops_result = 0;
60f98d1839376d David Teigland       2011-11-02  437  	}
60f98d1839376d David Teigland       2011-11-02  438  
3b0e761ba83cb0 Zhu Lingshan         2017-07-11  439  	if (!cluster)
3b0e761ba83cb0 Zhu Lingshan         2017-07-11  440  		log_print("dlm cluster name '%s' is being used without an application provided cluster name",
3b0e761ba83cb0 Zhu Lingshan         2017-07-11  441  			  dlm_config.ci_cluster_name);
3b0e761ba83cb0 Zhu Lingshan         2017-07-11  442  
60f98d1839376d David Teigland       2011-11-02  443  	if (dlm_config.ci_recover_callbacks && cluster &&
60f98d1839376d David Teigland       2011-11-02  444  	    strncmp(cluster, dlm_config.ci_cluster_name, DLM_LOCKSPACE_LEN)) {
8e1743748b7e96 Gang He              2017-05-18  445  		log_print("dlm cluster name '%s' does not match "
8e1743748b7e96 Gang He              2017-05-18  446  			  "the application cluster name '%s'",
60f98d1839376d David Teigland       2011-11-02  447  			  dlm_config.ci_cluster_name, cluster);
60f98d1839376d David Teigland       2011-11-02  448  		error = -EBADR;
60f98d1839376d David Teigland       2011-11-02  449  		goto out;
dc68c7ed362a00 David Teigland       2008-08-18  450  	}
dc68c7ed362a00 David Teigland       2008-08-18  451  
0f8e0d9a317406 David Teigland       2008-08-06  452  	error = 0;
0f8e0d9a317406 David Teigland       2008-08-06  453  
578acf9a87a875 Alexander Aring      2024-04-02  454  	spin_lock_bh(&lslist_lock);
0f8e0d9a317406 David Teigland       2008-08-06  455  	list_for_each_entry(ls, &lslist, ls_list) {
0f8e0d9a317406 David Teigland       2008-08-06  456  		WARN_ON(ls->ls_create_count <= 0);
0f8e0d9a317406 David Teigland       2008-08-06  457  		if (ls->ls_namelen != namelen)
0f8e0d9a317406 David Teigland       2008-08-06  458  			continue;
0f8e0d9a317406 David Teigland       2008-08-06  459  		if (memcmp(ls->ls_name, name, namelen))
0f8e0d9a317406 David Teigland       2008-08-06  460  			continue;
0f8e0d9a317406 David Teigland       2008-08-06  461  		if (flags & DLM_LSFL_NEWEXCL) {
0f8e0d9a317406 David Teigland       2008-08-06  462  			error = -EEXIST;
0f8e0d9a317406 David Teigland       2008-08-06  463  			break;
0f8e0d9a317406 David Teigland       2008-08-06  464  		}
0f8e0d9a317406 David Teigland       2008-08-06  465  		ls->ls_create_count++;
8511a2728ab82c David Teigland       2009-04-08  466  		*lockspace = ls;
8511a2728ab82c David Teigland       2009-04-08  467  		error = 1;
0f8e0d9a317406 David Teigland       2008-08-06  468  		break;
e7fd41792fc0ee David Teigland       2006-01-18  469  	}
578acf9a87a875 Alexander Aring      2024-04-02  470  	spin_unlock_bh(&lslist_lock);
0f8e0d9a317406 David Teigland       2008-08-06  471  
0f8e0d9a317406 David Teigland       2008-08-06  472  	if (error)
8511a2728ab82c David Teigland       2009-04-08  473  		goto out;
0f8e0d9a317406 David Teigland       2008-08-06  474  
0f8e0d9a317406 David Teigland       2008-08-06  475  	error = -ENOMEM;
e7fd41792fc0ee David Teigland       2006-01-18  476  
d96d0f9617793b Paulo Miguel Almeida 2022-10-12  477  	ls = kzalloc(sizeof(*ls), GFP_NOFS);
e7fd41792fc0ee David Teigland       2006-01-18  478  	if (!ls)
e7fd41792fc0ee David Teigland       2006-01-18  479  		goto out;
e7fd41792fc0ee David Teigland       2006-01-18  480  	memcpy(ls->ls_name, name, namelen);
e7fd41792fc0ee David Teigland       2006-01-18  481  	ls->ls_namelen = namelen;
e7fd41792fc0ee David Teigland       2006-01-18  482  	ls->ls_lvblen = lvblen;
3cb5977c5214c2 Alexander Aring      2021-11-02  483  	atomic_set(&ls->ls_count, 0);
3cb5977c5214c2 Alexander Aring      2021-11-02  484  	init_waitqueue_head(&ls->ls_count_wait);
e7fd41792fc0ee David Teigland       2006-01-18  485  	ls->ls_flags = 0;
c1dcf65ffc5796 David Teigland       2008-08-18  486  	ls->ls_scan_time = jiffies;
e7fd41792fc0ee David Teigland       2006-01-18  487  
60f98d1839376d David Teigland       2011-11-02  488  	if (ops && dlm_config.ci_recover_callbacks) {
60f98d1839376d David Teigland       2011-11-02  489  		ls->ls_ops = ops;
60f98d1839376d David Teigland       2011-11-02  490  		ls->ls_ops_arg = ops_arg;
60f98d1839376d David Teigland       2011-11-02  491  	}
60f98d1839376d David Teigland       2011-11-02  492  
6b0afc0cc3e9a9 Alexander Aring      2022-06-22  493  	/* ls_exflags are forced to match among nodes, and we don't
6b0afc0cc3e9a9 Alexander Aring      2022-06-22  494  	 * need to require all nodes to have some flags set
6b0afc0cc3e9a9 Alexander Aring      2022-06-22  495  	 */
6b0afc0cc3e9a9 Alexander Aring      2022-06-22  496  	ls->ls_exflags = (flags & ~(DLM_LSFL_FS | DLM_LSFL_NEWEXCL));
fad59c1390045b David Teigland       2007-06-11  497  
93a693d19d2a4a Alexander Aring      2024-04-15  498  	INIT_LIST_HEAD(&ls->ls_toss);
93a693d19d2a4a Alexander Aring      2024-04-15  499  	INIT_LIST_HEAD(&ls->ls_keep);
dcdaad05ca1515 Alexander Aring      2024-04-15  500  	spin_lock_init(&ls->ls_rsbtbl_lock);
e7fd41792fc0ee David Teigland       2006-01-18  501  
6c648035cbe75d Alexander Aring      2024-04-15  502  	error = rhashtable_init(&ls->ls_rsbtbl, &dlm_rhash_rsb_params);
6c648035cbe75d Alexander Aring      2024-04-15  503  	if (error)
e7fd41792fc0ee David Teigland       2006-01-18  504  		goto out_lsfree;
e7fd41792fc0ee David Teigland       2006-01-18  505  
05c32f47bfae74 David Teigland       2012-06-14  506  	for (i = 0; i < DLM_REMOVE_NAMES_MAX; i++) {
05c32f47bfae74 David Teigland       2012-06-14  507  		ls->ls_remove_names[i] = kzalloc(DLM_RESNAME_MAXLEN+1,
05c32f47bfae74 David Teigland       2012-06-14  508  						 GFP_KERNEL);
05c32f47bfae74 David Teigland       2012-06-14  509  		if (!ls->ls_remove_names[i])
05c32f47bfae74 David Teigland       2012-06-14  510  			goto out_rsbtbl;
                                                                        ^^^^^^^^^^^^^^^
No error code.

05c32f47bfae74 David Teigland       2012-06-14  511  	}
05c32f47bfae74 David Teigland       2012-06-14  512  
3d6aa675fff9ee David Teigland       2011-07-06  513  	idr_init(&ls->ls_lkbidr);
3d6aa675fff9ee David Teigland       2011-07-06  514  	spin_lock_init(&ls->ls_lkbidr_spin);
e7fd41792fc0ee David Teigland       2006-01-18  515  
e7fd41792fc0ee David Teigland       2006-01-18  516  	INIT_LIST_HEAD(&ls->ls_waiters);
097691dbadcdca Alexander Aring      2024-04-02  517  	spin_lock_init(&ls->ls_waiters_lock);
ef0c2bb05f40f9 David Teigland       2007-03-28  518  	INIT_LIST_HEAD(&ls->ls_orphans);
ef0c2bb05f40f9 David Teigland       2007-03-28  519  	mutex_init(&ls->ls_orphans_mutex);
e7fd41792fc0ee David Teigland       2006-01-18  520  
3881ac04ebf942 David Teigland       2011-07-07  521  	INIT_LIST_HEAD(&ls->ls_new_rsb);
3881ac04ebf942 David Teigland       2011-07-07  522  	spin_lock_init(&ls->ls_new_rsb_spin);
3881ac04ebf942 David Teigland       2011-07-07  523  
e7fd41792fc0ee David Teigland       2006-01-18  524  	INIT_LIST_HEAD(&ls->ls_nodes);
e7fd41792fc0ee David Teigland       2006-01-18  525  	INIT_LIST_HEAD(&ls->ls_nodes_gone);
e7fd41792fc0ee David Teigland       2006-01-18  526  	ls->ls_num_nodes = 0;
e7fd41792fc0ee David Teigland       2006-01-18  527  	ls->ls_low_nodeid = 0;
e7fd41792fc0ee David Teigland       2006-01-18  528  	ls->ls_total_weight = 0;
e7fd41792fc0ee David Teigland       2006-01-18  529  	ls->ls_node_array = NULL;
e7fd41792fc0ee David Teigland       2006-01-18  530  
a7e7ffacad7b9b Alexander Aring      2023-03-06  531  	memset(&ls->ls_local_rsb, 0, sizeof(struct dlm_rsb));
a7e7ffacad7b9b Alexander Aring      2023-03-06  532  	ls->ls_local_rsb.res_ls = ls;
e7fd41792fc0ee David Teigland       2006-01-18  533  
5de6319b183930 David Teigland       2006-07-25  534  	ls->ls_debug_rsb_dentry = NULL;
5de6319b183930 David Teigland       2006-07-25  535  	ls->ls_debug_waiters_dentry = NULL;
e7fd41792fc0ee David Teigland       2006-01-18  536  
e7fd41792fc0ee David Teigland       2006-01-18  537  	init_waitqueue_head(&ls->ls_uevent_wait);
e7fd41792fc0ee David Teigland       2006-01-18  538  	ls->ls_uevent_result = 0;
682bb91b6ba829 Alexander Aring      2022-06-22  539  	init_completion(&ls->ls_recovery_done);
682bb91b6ba829 Alexander Aring      2022-06-22  540  	ls->ls_recovery_result = -1;
e7fd41792fc0ee David Teigland       2006-01-18  541  
a4c0352bb1094c Alexander Aring      2022-10-27  542  	spin_lock_init(&ls->ls_cb_lock);
23e8e1aaacb10d David Teigland       2011-04-05  543  	INIT_LIST_HEAD(&ls->ls_cb_delay);
23e8e1aaacb10d David Teigland       2011-04-05  544  
e7fd41792fc0ee David Teigland       2006-01-18  545  	ls->ls_recoverd_task = NULL;
901359256b2666 David Teigland       2006-01-20  546  	mutex_init(&ls->ls_recoverd_active);
e7fd41792fc0ee David Teigland       2006-01-18  547  	spin_lock_init(&ls->ls_recover_lock);
98f176fb32f337 David Teigland       2006-11-27  548  	spin_lock_init(&ls->ls_rcom_spin);
98f176fb32f337 David Teigland       2006-11-27  549  	get_random_bytes(&ls->ls_rcom_seq, sizeof(uint64_t));
e7fd41792fc0ee David Teigland       2006-01-18  550  	ls->ls_recover_status = 0;
317dd6ba6ccaa5 Alexander Aring      2023-01-12  551  	ls->ls_recover_seq = get_random_u64();
e7fd41792fc0ee David Teigland       2006-01-18  552  	ls->ls_recover_args = NULL;
e7fd41792fc0ee David Teigland       2006-01-18  553  	init_rwsem(&ls->ls_in_recovery);
d52c9b8fefa3ed Alexander Aring      2024-04-02  554  	rwlock_init(&ls->ls_recv_active);
e7fd41792fc0ee David Teigland       2006-01-18  555  	INIT_LIST_HEAD(&ls->ls_requestqueue);
c288745f1d4a2e Alexander Aring      2024-04-02  556  	rwlock_init(&ls->ls_requestqueue_lock);
296d9d1e989083 Alexander Aring      2022-08-15  557  	spin_lock_init(&ls->ls_clear_proc_locks);
e7fd41792fc0ee David Teigland       2006-01-18  558  
489d8e559c6596 Alexander Aring      2021-05-21  559  	/* Due backwards compatibility with 3.1 we need to use maximum
489d8e559c6596 Alexander Aring      2021-05-21  560  	 * possible dlm message size to be sure the message will fit and
489d8e559c6596 Alexander Aring      2021-05-21  561  	 * not having out of bounds issues. However on sending side 3.2
489d8e559c6596 Alexander Aring      2021-05-21  562  	 * might send less.
489d8e559c6596 Alexander Aring      2021-05-21  563  	 */
d10a0b88751a09 Alexander Aring      2021-06-02  564  	ls->ls_recover_buf = kmalloc(DLM_MAX_SOCKET_BUFSIZE, GFP_NOFS);
e7fd41792fc0ee David Teigland       2006-01-18  565  	if (!ls->ls_recover_buf)
05c32f47bfae74 David Teigland       2012-06-14 @566  		goto out_lkbidr;

Here too.

e7fd41792fc0ee David Teigland       2006-01-18  567  
757a4271963549 David Teigland       2011-10-20  568  	ls->ls_slot = 0;
757a4271963549 David Teigland       2011-10-20  569  	ls->ls_num_slots = 0;
757a4271963549 David Teigland       2011-10-20  570  	ls->ls_slots_size = 0;
757a4271963549 David Teigland       2011-10-20  571  	ls->ls_slots = NULL;
757a4271963549 David Teigland       2011-10-20  572  
e7fd41792fc0ee David Teigland       2006-01-18  573  	INIT_LIST_HEAD(&ls->ls_recover_list);
e7fd41792fc0ee David Teigland       2006-01-18  574  	spin_lock_init(&ls->ls_recover_list_lock);
1d7c484eeb167f David Teigland       2012-05-15  575  	idr_init(&ls->ls_recover_idr);
1d7c484eeb167f David Teigland       2012-05-15  576  	spin_lock_init(&ls->ls_recover_idr_lock);
e7fd41792fc0ee David Teigland       2006-01-18  577  	ls->ls_recover_list_count = 0;
597d0cae0f99f6 David Teigland       2006-07-12  578  	ls->ls_local_handle = ls;
e7fd41792fc0ee David Teigland       2006-01-18  579  	init_waitqueue_head(&ls->ls_wait_general);
aff46e0f24cd3a Alexander Aring      2024-04-02  580  	INIT_LIST_HEAD(&ls->ls_masters_list);
aff46e0f24cd3a Alexander Aring      2024-04-02  581  	rwlock_init(&ls->ls_masters_lock);
3ae67760567438 Alexander Aring      2024-04-02  582  	INIT_LIST_HEAD(&ls->ls_dir_dump_list);
3ae67760567438 Alexander Aring      2024-04-02  583  	rwlock_init(&ls->ls_dir_dump_lock);
e7fd41792fc0ee David Teigland       2006-01-18  584  
578acf9a87a875 Alexander Aring      2024-04-02  585  	spin_lock_bh(&lslist_lock);
0f8e0d9a317406 David Teigland       2008-08-06  586  	ls->ls_create_count = 1;
5f88f1ea16a2fb David Teigland       2006-08-24  587  	list_add(&ls->ls_list, &lslist);
578acf9a87a875 Alexander Aring      2024-04-02  588  	spin_unlock_bh(&lslist_lock);
5f88f1ea16a2fb David Teigland       2006-08-24  589  
23e8e1aaacb10d David Teigland       2011-04-05  590  	if (flags & DLM_LSFL_FS) {
23e8e1aaacb10d David Teigland       2011-04-05  591  		error = dlm_callback_start(ls);
23e8e1aaacb10d David Teigland       2011-04-05  592  		if (error) {
23e8e1aaacb10d David Teigland       2011-04-05  593  			log_error(ls, "can't start dlm_callback %d", error);
23e8e1aaacb10d David Teigland       2011-04-05  594  			goto out_delist;
23e8e1aaacb10d David Teigland       2011-04-05  595  		}
23e8e1aaacb10d David Teigland       2011-04-05  596  	}
23e8e1aaacb10d David Teigland       2011-04-05  597  
475f230c6072fb David Teigland       2012-08-02  598  	init_waitqueue_head(&ls->ls_recover_lock_wait);
475f230c6072fb David Teigland       2012-08-02  599  
475f230c6072fb David Teigland       2012-08-02  600  	/*
475f230c6072fb David Teigland       2012-08-02  601  	 * Once started, dlm_recoverd first looks for ls in lslist, then
475f230c6072fb David Teigland       2012-08-02  602  	 * initializes ls_in_recovery as locked in "down" mode.  We need
475f230c6072fb David Teigland       2012-08-02  603  	 * to wait for the wakeup from dlm_recoverd because in_recovery
475f230c6072fb David Teigland       2012-08-02  604  	 * has to start out in down mode.
475f230c6072fb David Teigland       2012-08-02  605  	 */
475f230c6072fb David Teigland       2012-08-02  606  
e7fd41792fc0ee David Teigland       2006-01-18  607  	error = dlm_recoverd_start(ls);
e7fd41792fc0ee David Teigland       2006-01-18  608  	if (error) {
e7fd41792fc0ee David Teigland       2006-01-18  609  		log_error(ls, "can't start dlm_recoverd %d", error);
23e8e1aaacb10d David Teigland       2011-04-05  610  		goto out_callback;
e7fd41792fc0ee David Teigland       2006-01-18  611  	}
e7fd41792fc0ee David Teigland       2006-01-18  612  
475f230c6072fb David Teigland       2012-08-02  613  	wait_event(ls->ls_recover_lock_wait,
475f230c6072fb David Teigland       2012-08-02  614  		   test_bit(LSFL_RECOVER_LOCK, &ls->ls_flags));
475f230c6072fb David Teigland       2012-08-02  615  
0ffddafc3a3970 Wang Hai             2020-06-15  616  	/* let kobject handle freeing of ls if there's an error */
0ffddafc3a3970 Wang Hai             2020-06-15  617  	do_unreg = 1;
0ffddafc3a3970 Wang Hai             2020-06-15  618  
901195ed7f4b2f Greg Kroah-Hartman   2007-12-17  619  	ls->ls_kobj.kset = dlm_kset;
901195ed7f4b2f Greg Kroah-Hartman   2007-12-17  620  	error = kobject_init_and_add(&ls->ls_kobj, &dlm_ktype, NULL,
901195ed7f4b2f Greg Kroah-Hartman   2007-12-17  621  				     "%s", ls->ls_name);
e7fd41792fc0ee David Teigland       2006-01-18  622  	if (error)
23e8e1aaacb10d David Teigland       2011-04-05  623  		goto out_recoverd;
901195ed7f4b2f Greg Kroah-Hartman   2007-12-17  624  	kobject_uevent(&ls->ls_kobj, KOBJ_ADD);
79d72b54483bf8 David Teigland       2007-05-18  625  
8b0e7b2cf35aa8 David Teigland       2007-05-18  626  	/* This uevent triggers dlm_controld in userspace to add us to the
8b0e7b2cf35aa8 David Teigland       2007-05-18  627  	   group of nodes that are members of this lockspace (managed by the
8b0e7b2cf35aa8 David Teigland       2007-05-18  628  	   cluster infrastructure.)  Once it's done that, it tells us who the
8b0e7b2cf35aa8 David Teigland       2007-05-18  629  	   current lockspace members are (via configfs) and then tells the
8b0e7b2cf35aa8 David Teigland       2007-05-18  630  	   lockspace to start running (via sysfs) in dlm_ls_start(). */
8b0e7b2cf35aa8 David Teigland       2007-05-18  631  
e7fd41792fc0ee David Teigland       2006-01-18  632  	error = do_uevent(ls, 1);
e7fd41792fc0ee David Teigland       2006-01-18  633  	if (error)
23e8e1aaacb10d David Teigland       2011-04-05  634  		goto out_recoverd;
79d72b54483bf8 David Teigland       2007-05-18  635  
682bb91b6ba829 Alexander Aring      2022-06-22  636  	/* wait until recovery is successful or failed */
682bb91b6ba829 Alexander Aring      2022-06-22  637  	wait_for_completion(&ls->ls_recovery_done);
682bb91b6ba829 Alexander Aring      2022-06-22  638  	error = ls->ls_recovery_result;
8b0e7b2cf35aa8 David Teigland       2007-05-18  639  	if (error)
8b0e7b2cf35aa8 David Teigland       2007-05-18  640  		goto out_members;
8b0e7b2cf35aa8 David Teigland       2007-05-18  641  
79d72b54483bf8 David Teigland       2007-05-18  642  	dlm_create_debug_file(ls);
79d72b54483bf8 David Teigland       2007-05-18  643  
075f01775f5364 David Teigland       2014-02-14  644  	log_rinfo(ls, "join complete");
e7fd41792fc0ee David Teigland       2006-01-18  645  	*lockspace = ls;
e7fd41792fc0ee David Teigland       2006-01-18  646  	return 0;
e7fd41792fc0ee David Teigland       2006-01-18  647  
8b0e7b2cf35aa8 David Teigland       2007-05-18  648   out_members:
8b0e7b2cf35aa8 David Teigland       2007-05-18  649  	do_uevent(ls, 0);
8b0e7b2cf35aa8 David Teigland       2007-05-18  650  	dlm_clear_members(ls);
8b0e7b2cf35aa8 David Teigland       2007-05-18  651  	kfree(ls->ls_node_array);
23e8e1aaacb10d David Teigland       2011-04-05  652   out_recoverd:
5f88f1ea16a2fb David Teigland       2006-08-24  653  	dlm_recoverd_stop(ls);
23e8e1aaacb10d David Teigland       2011-04-05  654   out_callback:
23e8e1aaacb10d David Teigland       2011-04-05  655  	dlm_callback_stop(ls);
79d72b54483bf8 David Teigland       2007-05-18  656   out_delist:
578acf9a87a875 Alexander Aring      2024-04-02  657  	spin_lock_bh(&lslist_lock);
e7fd41792fc0ee David Teigland       2006-01-18  658  	list_del(&ls->ls_list);
578acf9a87a875 Alexander Aring      2024-04-02  659  	spin_unlock_bh(&lslist_lock);
1d7c484eeb167f David Teigland       2012-05-15  660  	idr_destroy(&ls->ls_recover_idr);
e7fd41792fc0ee David Teigland       2006-01-18  661  	kfree(ls->ls_recover_buf);
05c32f47bfae74 David Teigland       2012-06-14  662   out_lkbidr:
3d6aa675fff9ee David Teigland       2011-07-06  663  	idr_destroy(&ls->ls_lkbidr);
b982896cdb6e6a Vasily Averin        2018-11-15  664   out_rsbtbl:
3456880ff39f76 Thomas Meyer         2018-12-03  665  	for (i = 0; i < DLM_REMOVE_NAMES_MAX; i++)
05c32f47bfae74 David Teigland       2012-06-14  666  		kfree(ls->ls_remove_names[i]);
6c648035cbe75d Alexander Aring      2024-04-15  667  	rhashtable_destroy(&ls->ls_rsbtbl);
e7fd41792fc0ee David Teigland       2006-01-18  668   out_lsfree:
79d72b54483bf8 David Teigland       2007-05-18  669  	if (do_unreg)
197b12d6796a3b Greg Kroah-Hartman   2007-12-20  670  		kobject_put(&ls->ls_kobj);
79d72b54483bf8 David Teigland       2007-05-18  671  	else
e7fd41792fc0ee David Teigland       2006-01-18  672  		kfree(ls);
e7fd41792fc0ee David Teigland       2006-01-18  673   out:
e7fd41792fc0ee David Teigland       2006-01-18  674  	module_put(THIS_MODULE);
e7fd41792fc0ee David Teigland       2006-01-18  675  	return error;
e7fd41792fc0ee David Teigland       2006-01-18  676  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

