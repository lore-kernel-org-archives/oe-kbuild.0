Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF02415098A
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713793828; cv=none; b=j4yC5r9cUAYtoQOXqFnYqRXvzqiOVl9LqAkorGPhZML35nsnTGwYdnXoeF6sUTT5XJwZWb3lQN3gxOOeSfb31qkMZ2LCturj0y/PwuYQHeFyrt+cfcXsE80UtaixrY0LmraicFvHDUN54JbfrGp/2/SVgFB2443Pv6gCQlnspBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713793828; c=relaxed/simple;
	bh=N1mA+5fsguG+ioRCPboVIPK4PwAC2RoUL3HsSldrYsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VvGocU+y9cFczL1c6p3wOSWOqtM0fIAA+kZ8mvarjFBN2UhLZXTYmH1MN1VyouoQWIb1K3yyvRECrtOdbVNT/Ih8A84olu6Wo6QCgIjXeOn48MkEVFRzrxKhYmr92FSwMwckSpbPM2ZjhznQAFEmblzgVycC6SavI90YSz5T2fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ml/s4HU0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ml/s4HU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713793825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePT7cc/aNJu9XoRcC0vjX12uSyiKribwraAl/sl33xA=;
	b=Ml/s4HU0ZtTK9/xjiT86kF8HsoIRp5WF2QMlYTvAMtu+R1D3q75gLPy0q2kJbMqAChZ2Hz
	lt9ajiqgNAyVU37GxlVSqR3Q+kr9g/x6Na1cDgr16lwe+Us3Imnx3/UUmKiYCPEcwFWPyV
	+Squ9/CfzF7y4SK6CgvzH4G2p6QgeJw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-RIQ5cGZUOEeakUXMA-0_Ig-1; Mon, 22 Apr 2024 09:50:24 -0400
X-MC-Unique: RIQ5cGZUOEeakUXMA-0_Ig-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2d865b3b04cso27036591fa.0
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 06:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793822; x=1714398622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePT7cc/aNJu9XoRcC0vjX12uSyiKribwraAl/sl33xA=;
        b=taIOED1rVbCNSrsfzAKcsSwosE1uNRz9PUkdQG2GhfK2EAWCniKIkxCTRBCulwz21y
         B45/lX3NmfCYF2PMk3XB+Vq8DfKtrz+h5z4hW1WwwLP+b3LpQ5Xu4e+jqIi+ADsM5RrT
         E8vMlNLw11ItN043+OmHcQRDnLApzw4hPpxuHx0wk/LJbS3pSRoO2Ln7Ul829+EL7lzC
         cBByMq3c9wwLQlM7i8nPsSDS++ZiViLFFCxBWOV9Pu1eWXXKh8+bY/EnSLAD9XtMk2yQ
         DQ3rAu1ZgZ42i1bmMWphM/1Hj8dZ24yDHdnAr8KzMqB8zuC+nSRTaO29jreXnEdwb4aI
         wmHw==
X-Gm-Message-State: AOJu0YywtnGUq8hFg8j1fSWxUWmBNlUnHPZDrvYG3ZzqEhddE/mOY/Xp
	rFHj1GVWm2jkDdW2Wmy94iQminxCcHG70PdbRa+yiY7r1y+B39kVNfSWCCF1apyF91SE0njgNrT
	QnbOabcuOGk8c8OXLBv/cAFF2TQb9cRrgAmi+x0/bz+wA+B8Rc9shZ3j7PIy8DJPCDuHBlnjed7
	LsZXhhkaBeRfj7KoydtCRCLMMGByiPsE2T
X-Received: by 2002:a2e:98ce:0:b0:2db:2385:d02a with SMTP id s14-20020a2e98ce000000b002db2385d02amr2808492ljj.22.1713793822485;
        Mon, 22 Apr 2024 06:50:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZYR8Zh/oxxhfcKpxYxLO0px3lM2ejr/cz+74VqOsz3y3mlUkQPIxIIcQ1hd/q6nUrMdg+RsBCDN4mTPvA4N0=
X-Received: by 2002:a2e:98ce:0:b0:2db:2385:d02a with SMTP id
 s14-20020a2e98ce000000b002db2385d02amr2808480ljj.22.1713793822036; Mon, 22
 Apr 2024 06:50:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ea8de937-9252-4ac2-bf9a-815bcc4018e4@moroto.mountain>
In-Reply-To: <ea8de937-9252-4ac2-bf9a-815bcc4018e4@moroto.mountain>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 22 Apr 2024 09:50:10 -0400
Message-ID: <CAK-6q+gJ5Y+G5K=3YXFZdWin5N3rqjjcAiC6sWtwo_bq+VywdQ@mail.gmail.com>
Subject: Re: [linux-next:master 5836/7122] fs/dlm/lockspace.c:566
 new_lockspace() warn: missing error code 'error'
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, David Teigland <teigland@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 22, 2024 at 9:31=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   a35e92ef04c07bd473404b9b73d489aea19a60a8
> commit: 6c648035cbe75d78836f6d7d2fdd9d996048a66b [5836/7122] dlm: switch =
to use rhashtable for rsbs
> config: i386-randconfig-141-20240420 (https://download.01.org/0day-ci/arc=
hive/20240420/202404200536.jGi6052v-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202404200536.jGi6052v-lkp@intel.com/
>
> New smatch warnings:
> fs/dlm/lockspace.c:566 new_lockspace() warn: missing error code 'error'
>
> vim +/error +566 fs/dlm/lockspace.c
>
> 60f98d1839376d David Teigland       2011-11-02  407  static int new_locks=
pace(const char *name, const char *cluster,
> 60f98d1839376d David Teigland       2011-11-02  408                      =
uint32_t flags, int lvblen,
> 60f98d1839376d David Teigland       2011-11-02  409                      =
const struct dlm_lockspace_ops *ops, void *ops_arg,
> 60f98d1839376d David Teigland       2011-11-02  410                      =
int *ops_result, dlm_lockspace_t **lockspace)
> e7fd41792fc0ee David Teigland       2006-01-18  411  {
> e7fd41792fc0ee David Teigland       2006-01-18  412     struct dlm_ls *ls=
;
> 79d72b54483bf8 David Teigland       2007-05-18  413     int do_unreg =3D =
0;
> 60f98d1839376d David Teigland       2011-11-02  414     int namelen =3D s=
trlen(name);
> 6c648035cbe75d Alexander Aring      2024-04-15  415     int i, error;
> e7fd41792fc0ee David Teigland       2006-01-18  416
> 3f0806d2596de0 Tycho Andersen       2018-11-02  417     if (namelen > DLM=
_LOCKSPACE_LEN || namelen =3D=3D 0)
> e7fd41792fc0ee David Teigland       2006-01-18  418             return -E=
INVAL;
> e7fd41792fc0ee David Teigland       2006-01-18  419
> b5c9d37c7f6051 Alexander Aring      2022-08-15  420     if (lvblen % 8)
> e7fd41792fc0ee David Teigland       2006-01-18  421             return -E=
INVAL;
> e7fd41792fc0ee David Teigland       2006-01-18  422
> e7fd41792fc0ee David Teigland       2006-01-18  423     if (!try_module_g=
et(THIS_MODULE))
> e7fd41792fc0ee David Teigland       2006-01-18  424             return -E=
INVAL;
> e7fd41792fc0ee David Teigland       2006-01-18  425
> dc68c7ed362a00 David Teigland       2008-08-18  426     if (!dlm_user_dae=
mon_available()) {
> 60f98d1839376d David Teigland       2011-11-02  427             log_print=
("dlm user daemon not available");
> 60f98d1839376d David Teigland       2011-11-02  428             error =3D=
 -EUNATCH;
> 60f98d1839376d David Teigland       2011-11-02  429             goto out;
> 60f98d1839376d David Teigland       2011-11-02  430     }
> 60f98d1839376d David Teigland       2011-11-02  431
> 60f98d1839376d David Teigland       2011-11-02  432     if (ops && ops_re=
sult) {
> 60f98d1839376d David Teigland       2011-11-02  433             if (!dlm_=
config.ci_recover_callbacks)
> 60f98d1839376d David Teigland       2011-11-02  434                     *=
ops_result =3D -EOPNOTSUPP;
> 60f98d1839376d David Teigland       2011-11-02  435             else
> 60f98d1839376d David Teigland       2011-11-02  436                     *=
ops_result =3D 0;
> 60f98d1839376d David Teigland       2011-11-02  437     }
> 60f98d1839376d David Teigland       2011-11-02  438
> 3b0e761ba83cb0 Zhu Lingshan         2017-07-11  439     if (!cluster)
> 3b0e761ba83cb0 Zhu Lingshan         2017-07-11  440             log_print=
("dlm cluster name '%s' is being used without an application provided clust=
er name",
> 3b0e761ba83cb0 Zhu Lingshan         2017-07-11  441                      =
 dlm_config.ci_cluster_name);
> 3b0e761ba83cb0 Zhu Lingshan         2017-07-11  442
> 60f98d1839376d David Teigland       2011-11-02  443     if (dlm_config.ci=
_recover_callbacks && cluster &&
> 60f98d1839376d David Teigland       2011-11-02  444         strncmp(clust=
er, dlm_config.ci_cluster_name, DLM_LOCKSPACE_LEN)) {
> 8e1743748b7e96 Gang He              2017-05-18  445             log_print=
("dlm cluster name '%s' does not match "
> 8e1743748b7e96 Gang He              2017-05-18  446                      =
 "the application cluster name '%s'",
> 60f98d1839376d David Teigland       2011-11-02  447                      =
 dlm_config.ci_cluster_name, cluster);
> 60f98d1839376d David Teigland       2011-11-02  448             error =3D=
 -EBADR;
> 60f98d1839376d David Teigland       2011-11-02  449             goto out;
> dc68c7ed362a00 David Teigland       2008-08-18  450     }
> dc68c7ed362a00 David Teigland       2008-08-18  451
> 0f8e0d9a317406 David Teigland       2008-08-06  452     error =3D 0;
> 0f8e0d9a317406 David Teigland       2008-08-06  453
> 578acf9a87a875 Alexander Aring      2024-04-02  454     spin_lock_bh(&lsl=
ist_lock);
> 0f8e0d9a317406 David Teigland       2008-08-06  455     list_for_each_ent=
ry(ls, &lslist, ls_list) {
> 0f8e0d9a317406 David Teigland       2008-08-06  456             WARN_ON(l=
s->ls_create_count <=3D 0);
> 0f8e0d9a317406 David Teigland       2008-08-06  457             if (ls->l=
s_namelen !=3D namelen)
> 0f8e0d9a317406 David Teigland       2008-08-06  458                     c=
ontinue;
> 0f8e0d9a317406 David Teigland       2008-08-06  459             if (memcm=
p(ls->ls_name, name, namelen))
> 0f8e0d9a317406 David Teigland       2008-08-06  460                     c=
ontinue;
> 0f8e0d9a317406 David Teigland       2008-08-06  461             if (flags=
 & DLM_LSFL_NEWEXCL) {
> 0f8e0d9a317406 David Teigland       2008-08-06  462                     e=
rror =3D -EEXIST;
> 0f8e0d9a317406 David Teigland       2008-08-06  463                     b=
reak;
> 0f8e0d9a317406 David Teigland       2008-08-06  464             }
> 0f8e0d9a317406 David Teigland       2008-08-06  465             ls->ls_cr=
eate_count++;
> 8511a2728ab82c David Teigland       2009-04-08  466             *lockspac=
e =3D ls;
> 8511a2728ab82c David Teigland       2009-04-08  467             error =3D=
 1;
> 0f8e0d9a317406 David Teigland       2008-08-06  468             break;
> e7fd41792fc0ee David Teigland       2006-01-18  469     }
> 578acf9a87a875 Alexander Aring      2024-04-02  470     spin_unlock_bh(&l=
slist_lock);
> 0f8e0d9a317406 David Teigland       2008-08-06  471
> 0f8e0d9a317406 David Teigland       2008-08-06  472     if (error)
> 8511a2728ab82c David Teigland       2009-04-08  473             goto out;
> 0f8e0d9a317406 David Teigland       2008-08-06  474
> 0f8e0d9a317406 David Teigland       2008-08-06  475     error =3D -ENOMEM=
;
> e7fd41792fc0ee David Teigland       2006-01-18  476
> d96d0f9617793b Paulo Miguel Almeida 2022-10-12  477     ls =3D kzalloc(si=
zeof(*ls), GFP_NOFS);
> e7fd41792fc0ee David Teigland       2006-01-18  478     if (!ls)
> e7fd41792fc0ee David Teigland       2006-01-18  479             goto out;
> e7fd41792fc0ee David Teigland       2006-01-18  480     memcpy(ls->ls_nam=
e, name, namelen);
> e7fd41792fc0ee David Teigland       2006-01-18  481     ls->ls_namelen =
=3D namelen;
> e7fd41792fc0ee David Teigland       2006-01-18  482     ls->ls_lvblen =3D=
 lvblen;
> 3cb5977c5214c2 Alexander Aring      2021-11-02  483     atomic_set(&ls->l=
s_count, 0);
> 3cb5977c5214c2 Alexander Aring      2021-11-02  484     init_waitqueue_he=
ad(&ls->ls_count_wait);
> e7fd41792fc0ee David Teigland       2006-01-18  485     ls->ls_flags =3D =
0;
> c1dcf65ffc5796 David Teigland       2008-08-18  486     ls->ls_scan_time =
=3D jiffies;
> e7fd41792fc0ee David Teigland       2006-01-18  487
> 60f98d1839376d David Teigland       2011-11-02  488     if (ops && dlm_co=
nfig.ci_recover_callbacks) {
> 60f98d1839376d David Teigland       2011-11-02  489             ls->ls_op=
s =3D ops;
> 60f98d1839376d David Teigland       2011-11-02  490             ls->ls_op=
s_arg =3D ops_arg;
> 60f98d1839376d David Teigland       2011-11-02  491     }
> 60f98d1839376d David Teigland       2011-11-02  492
> 6b0afc0cc3e9a9 Alexander Aring      2022-06-22  493     /* ls_exflags are=
 forced to match among nodes, and we don't
> 6b0afc0cc3e9a9 Alexander Aring      2022-06-22  494      * need to requir=
e all nodes to have some flags set
> 6b0afc0cc3e9a9 Alexander Aring      2022-06-22  495      */
> 6b0afc0cc3e9a9 Alexander Aring      2022-06-22  496     ls->ls_exflags =
=3D (flags & ~(DLM_LSFL_FS | DLM_LSFL_NEWEXCL));
> fad59c1390045b David Teigland       2007-06-11  497
> 93a693d19d2a4a Alexander Aring      2024-04-15  498     INIT_LIST_HEAD(&l=
s->ls_toss);
> 93a693d19d2a4a Alexander Aring      2024-04-15  499     INIT_LIST_HEAD(&l=
s->ls_keep);
> dcdaad05ca1515 Alexander Aring      2024-04-15  500     spin_lock_init(&l=
s->ls_rsbtbl_lock);
> e7fd41792fc0ee David Teigland       2006-01-18  501
> 6c648035cbe75d Alexander Aring      2024-04-15  502     error =3D rhashta=
ble_init(&ls->ls_rsbtbl, &dlm_rhash_rsb_params);
> 6c648035cbe75d Alexander Aring      2024-04-15  503     if (error)
> e7fd41792fc0ee David Teigland       2006-01-18  504             goto out_=
lsfree;
> e7fd41792fc0ee David Teigland       2006-01-18  505
> 05c32f47bfae74 David Teigland       2012-06-14  506     for (i =3D 0; i <=
 DLM_REMOVE_NAMES_MAX; i++) {
> 05c32f47bfae74 David Teigland       2012-06-14  507             ls->ls_re=
move_names[i] =3D kzalloc(DLM_RESNAME_MAXLEN+1,
> 05c32f47bfae74 David Teigland       2012-06-14  508                      =
                        GFP_KERNEL);
> 05c32f47bfae74 David Teigland       2012-06-14  509             if (!ls->=
ls_remove_names[i])
> 05c32f47bfae74 David Teigland       2012-06-14  510                     g=
oto out_rsbtbl;
>                                                                         ^=
^^^^^^^^^^^^^^
> No error code.

yes, later patch removes that allocation.

> 05c32f47bfae74 David Teigland       2012-06-14  511     }
> 05c32f47bfae74 David Teigland       2012-06-14  512
> 3d6aa675fff9ee David Teigland       2011-07-06  513     idr_init(&ls->ls_=
lkbidr);
> 3d6aa675fff9ee David Teigland       2011-07-06  514     spin_lock_init(&l=
s->ls_lkbidr_spin);
> e7fd41792fc0ee David Teigland       2006-01-18  515
> e7fd41792fc0ee David Teigland       2006-01-18  516     INIT_LIST_HEAD(&l=
s->ls_waiters);
> 097691dbadcdca Alexander Aring      2024-04-02  517     spin_lock_init(&l=
s->ls_waiters_lock);
> ef0c2bb05f40f9 David Teigland       2007-03-28  518     INIT_LIST_HEAD(&l=
s->ls_orphans);
> ef0c2bb05f40f9 David Teigland       2007-03-28  519     mutex_init(&ls->l=
s_orphans_mutex);
> e7fd41792fc0ee David Teigland       2006-01-18  520
> 3881ac04ebf942 David Teigland       2011-07-07  521     INIT_LIST_HEAD(&l=
s->ls_new_rsb);
> 3881ac04ebf942 David Teigland       2011-07-07  522     spin_lock_init(&l=
s->ls_new_rsb_spin);
> 3881ac04ebf942 David Teigland       2011-07-07  523
> e7fd41792fc0ee David Teigland       2006-01-18  524     INIT_LIST_HEAD(&l=
s->ls_nodes);
> e7fd41792fc0ee David Teigland       2006-01-18  525     INIT_LIST_HEAD(&l=
s->ls_nodes_gone);
> e7fd41792fc0ee David Teigland       2006-01-18  526     ls->ls_num_nodes =
=3D 0;
> e7fd41792fc0ee David Teigland       2006-01-18  527     ls->ls_low_nodeid=
 =3D 0;
> e7fd41792fc0ee David Teigland       2006-01-18  528     ls->ls_total_weig=
ht =3D 0;
> e7fd41792fc0ee David Teigland       2006-01-18  529     ls->ls_node_array=
 =3D NULL;
> e7fd41792fc0ee David Teigland       2006-01-18  530
> a7e7ffacad7b9b Alexander Aring      2023-03-06  531     memset(&ls->ls_lo=
cal_rsb, 0, sizeof(struct dlm_rsb));
> a7e7ffacad7b9b Alexander Aring      2023-03-06  532     ls->ls_local_rsb.=
res_ls =3D ls;
> e7fd41792fc0ee David Teigland       2006-01-18  533
> 5de6319b183930 David Teigland       2006-07-25  534     ls->ls_debug_rsb_=
dentry =3D NULL;
> 5de6319b183930 David Teigland       2006-07-25  535     ls->ls_debug_wait=
ers_dentry =3D NULL;
> e7fd41792fc0ee David Teigland       2006-01-18  536
> e7fd41792fc0ee David Teigland       2006-01-18  537     init_waitqueue_he=
ad(&ls->ls_uevent_wait);
> e7fd41792fc0ee David Teigland       2006-01-18  538     ls->ls_uevent_res=
ult =3D 0;
> 682bb91b6ba829 Alexander Aring      2022-06-22  539     init_completion(&=
ls->ls_recovery_done);
> 682bb91b6ba829 Alexander Aring      2022-06-22  540     ls->ls_recovery_r=
esult =3D -1;
> e7fd41792fc0ee David Teigland       2006-01-18  541
> a4c0352bb1094c Alexander Aring      2022-10-27  542     spin_lock_init(&l=
s->ls_cb_lock);
> 23e8e1aaacb10d David Teigland       2011-04-05  543     INIT_LIST_HEAD(&l=
s->ls_cb_delay);
> 23e8e1aaacb10d David Teigland       2011-04-05  544
> e7fd41792fc0ee David Teigland       2006-01-18  545     ls->ls_recoverd_t=
ask =3D NULL;
> 901359256b2666 David Teigland       2006-01-20  546     mutex_init(&ls->l=
s_recoverd_active);
> e7fd41792fc0ee David Teigland       2006-01-18  547     spin_lock_init(&l=
s->ls_recover_lock);
> 98f176fb32f337 David Teigland       2006-11-27  548     spin_lock_init(&l=
s->ls_rcom_spin);
> 98f176fb32f337 David Teigland       2006-11-27  549     get_random_bytes(=
&ls->ls_rcom_seq, sizeof(uint64_t));
> e7fd41792fc0ee David Teigland       2006-01-18  550     ls->ls_recover_st=
atus =3D 0;
> 317dd6ba6ccaa5 Alexander Aring      2023-01-12  551     ls->ls_recover_se=
q =3D get_random_u64();
> e7fd41792fc0ee David Teigland       2006-01-18  552     ls->ls_recover_ar=
gs =3D NULL;
> e7fd41792fc0ee David Teigland       2006-01-18  553     init_rwsem(&ls->l=
s_in_recovery);
> d52c9b8fefa3ed Alexander Aring      2024-04-02  554     rwlock_init(&ls->=
ls_recv_active);
> e7fd41792fc0ee David Teigland       2006-01-18  555     INIT_LIST_HEAD(&l=
s->ls_requestqueue);
> c288745f1d4a2e Alexander Aring      2024-04-02  556     rwlock_init(&ls->=
ls_requestqueue_lock);
> 296d9d1e989083 Alexander Aring      2022-08-15  557     spin_lock_init(&l=
s->ls_clear_proc_locks);
> e7fd41792fc0ee David Teigland       2006-01-18  558
> 489d8e559c6596 Alexander Aring      2021-05-21  559     /* Due backwards =
compatibility with 3.1 we need to use maximum
> 489d8e559c6596 Alexander Aring      2021-05-21  560      * possible dlm m=
essage size to be sure the message will fit and
> 489d8e559c6596 Alexander Aring      2021-05-21  561      * not having out=
 of bounds issues. However on sending side 3.2
> 489d8e559c6596 Alexander Aring      2021-05-21  562      * might send les=
s.
> 489d8e559c6596 Alexander Aring      2021-05-21  563      */
> d10a0b88751a09 Alexander Aring      2021-06-02  564     ls->ls_recover_bu=
f =3D kmalloc(DLM_MAX_SOCKET_BUFSIZE, GFP_NOFS);
> e7fd41792fc0ee David Teigland       2006-01-18  565     if (!ls->ls_recov=
er_buf)
> 05c32f47bfae74 David Teigland       2012-06-14 @566             goto out_=
lkbidr;
>
> Here too.
>

This is still in dlm/next and needs an error code, yes.

Thanks.

- Alex

