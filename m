Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4735C3FB03
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="jXV6PV28"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5d95a3562faso30517937b3.2
        for <oe-kbuild@lists.linux.dev>; Wed, 06 Dec 2023 07:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1701875314; x=1702480114; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI4+87OmuedWYZowFLyZTVA/u3jp6SGb1EP0gsJn5OY=;
        b=jXV6PV28De8VyXESgxjbBCMzlwpy/KJ61GCVmQh8IN3mohoZisIC4tcqrSpqbu7Sra
         S4Uj0uKqR6pGcJxER7X83wjQmYoiTlorZCuB6rCwXKnf2VgqF4sl22W9DrgQzHyADVIj
         W7Ob3LfVfQCs6K184s8LorGhmSIksejVa7/5tyIXRjU4xk3PhJzl0JfHWARIataNLDRO
         Rtrba4+X7cD7tRHKZbQiBhN09vixZQpsFdMYSOr2Lh9wyxaKKZqFX0lbazkKqovMMM2P
         f7Kn1Rxut6/j23RquriZc4sTB1rlM+zK5p+diM6rXWfUTLaqt1m5DBIa2E2SNzIY3WUu
         rpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701875314; x=1702480114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI4+87OmuedWYZowFLyZTVA/u3jp6SGb1EP0gsJn5OY=;
        b=d19BwODvHh1hoNG+Ts2W7aJE4WfEn7I4XwFprNI5hDu21WNwvNjZ9CxoPOBqrgI5EP
         oJ1alX1AbXyKEkShikPAUcSwjIVXp02Jay8uKwwoGLWnlVx9qpdgRS9hz37jl4HPY6M+
         /lGJUerK92F0H2++tcxAy4/Z1J8vr3jgP5xJtSwfuz07XlQtYRcjN5ocsowsZGLhfE3y
         /D+LQuj+dI6iKF/c/6fdeYDe2UcniUQNtgMKIO7hfgs/zA8FzuCSHVuN5WLBskUWtz7r
         3sDUfZ/wDm+3RWxjVpTsl7luVMGx8gYFVlFixSLr6oYa2v24ZirZNmQyH3Dp9VHsBnC+
         W55Q==
X-Gm-Message-State: AOJu0YwKYfJpLc6ARI9x5LXa5D/vrrxEqd3aRcbAs2rdNNNqVXbdQLHZ
	UbGNguNHwJnWCKk5QxIkY4SzdvABQSB8mXUU3bwjUA==
X-Google-Smtp-Source: AGHT+IHF9CzT8VrghpajIXOI4MLzZ24JXy9q27f+k6JJ8gWMSKwgFRPeOQuAl95Vk0Cb7Kg8XGZRY9Z+ZKYjtmmKU1M=
X-Received: by 2002:a0d:e60b:0:b0:5d7:1940:f3e9 with SMTP id
 p11-20020a0de60b000000b005d71940f3e9mr760885ywe.81.1701875313870; Wed, 06 Dec
 2023 07:08:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231201182904.532825-14-jhs@mojatatu.com> <9dc10258-a370-4c8f-8099-36edf40b6f80@suswa.mountain>
In-Reply-To: <9dc10258-a370-4c8f-8099-36edf40b6f80@suswa.mountain>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Wed, 6 Dec 2023 10:08:22 -0500
Message-ID: <CAM0EoMnnXNxtzDqtC96rbKjy1qfebtBTPpGj7MR7j4uzqXjEWA@mail.gmail.com>
Subject: Re: [PATCH net-next v9 13/15] p4tc: add runtime table entry create,
 update, get, delete, flush and dump
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, netdev@vger.kernel.org, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, deb.chatterjee@intel.com, 
	anjali.singhai@intel.com, namrata.limaye@intel.com, mleitner@redhat.com, 
	Mahesh.Shirshyad@amd.com, tomasz.osinski@intel.com, jiri@resnulli.us, 
	xiyou.wangcong@gmail.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, vladbu@nvidia.com, horms@kernel.org, 
	khalidm@nvidia.com, toke@redhat.com, daniel@iogearbox.net, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, Dec 6, 2023 at 12:34=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi Jamal,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/n=
et-sched-act_api-increase-action-kind-string-length/20231202-032940
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20231201182904.532825-14-jhs%40m=
ojatatu.com
> patch subject: [PATCH net-next v9 13/15] p4tc: add runtime table entry cr=
eate, update, get, delete, flush and dump
> config: powerpc64-randconfig-r081-20231204 (https://download.01.org/0day-=
ci/archive/20231205/202312052121.NV57fCuG-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231205/202312052121=
.NV57fCuG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202312052121.NV57fCuG-lkp@intel.com/

Thanks - Will do (it will be a new version not separate fix commit).

> smatch warnings:
> net/sched/p4tc/p4tc_tbl_entry.c:2555 p4tc_tbl_entry_dumpit() warn: can 'n=
l_path_attrs.pname' even be NULL?

We need to update our smatch i suppose because we didnt catch this one.

cheers,
jamal

> vim +2555 net/sched/p4tc/p4tc_tbl_entry.c
>
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2529        pnatt =3D nla_res=
erve(skb, P4TC_ROOT_PNAME, P4TC_PIPELINE_NAMSIZ);
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2530        if (!pnatt)
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2531                return -E=
NOMEM;
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2532
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2533        ids[P4TC_PID_IDX]=
 =3D t_new->pipeid;
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2534        arg_ids =3D nla_d=
ata(tb[P4TC_PATH]);
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2535        memcpy(&ids[P4TC_=
TBLID_IDX], arg_ids, nla_len(tb[P4TC_PATH]));
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2536        nl_path_attrs.ids=
 =3D ids;
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2537
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2538        nl_path_attrs.pna=
me =3D nla_data(pnatt);
>
> nla_data() can't be NULL
>
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2539        if (!p_name) {
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2540                /* Filled=
 up by the operation or forced failure */
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2541                memset(nl=
_path_attrs.pname, 0, P4TC_PIPELINE_NAMSIZ);
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2542                nl_path_a=
ttrs.pname_passed =3D false;
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2543        } else {
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2544                strscpy(n=
l_path_attrs.pname, p_name, P4TC_PIPELINE_NAMSIZ);
>
> And we dereference it
>
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2545                nl_path_a=
ttrs.pname_passed =3D true;
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2546        }
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2547
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2548        root =3D nla_nest=
_start(skb, P4TC_ROOT);
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2549        ret =3D p4tc_tabl=
e_entry_dump(net, skb, tb[P4TC_PARAMS], &nl_path_attrs,
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2550                         =
           cb, extack);
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2551        if (ret <=3D 0)
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2552                goto out;
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2553        nla_nest_end(skb,=
 root);
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2554
> 0d5bbed1381e54 Jamal Hadi Salim 2023-12-01 @2555        if (nl_path_attrs=
.pname) {
>                                                             ^^^^^^^^^^^^^=
^^^^^^
> This NULL check can be removed.
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
