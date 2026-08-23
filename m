Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F98525524C
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787517745; cv=none; b=BdluK5lygVH7MDmJk5MVOR8pXJCATkslYmReNKY9LK/JQCMSgUDvRvSGJGi5zPoGgm4Vxdt4dCwOcUjvuPn0TjNRnFHmDs7MmZxtqdlHoCiKVSTmID8R6A20tR+F7di3w2trz/PGH+aDL+Ch9VUflWYgckb8J/Ovw6lgX2dWEaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787517745; c=relaxed/simple;
	bh=vKoGYx02yUp02Fqx1Q+rUvb2y7vn6u8WMxdUGNWmMEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQX4Nhi6W6zmTM/4C0/bDsSHSOpNL1WDsPm8YdyjV7/+GtgHAC6IphbtZucE420qBYr0GFtCjk0mGJyX5+CTFSiWg8m2mRxqMqCU0HCZNHijC4xlsTRPSJsWbsyvU86podQh68YFSQDVU6lI3ynFn7rsxljY5kOwksY8/PvzWI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YruGxbw3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YruGxbw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787517742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SFDV+7W8DGFkHuzF8rYKzLPJzOVSHo8h0lJMwZdjIRY=;
	b=YruGxbw3d9C6d48qjKwm+Tvbg1b2y1Q2GDqqd5DiGU/FzkeEnZJhF8NPMBILRIQh/phpJF
	tbPIrdTSl6DKe7nHgvm//6JzV+2wx+8eftm0t4AVaxNon6Vhf4bZ6vY5gKizGlD0SjnYRz
	faqXno+Z1Ybhpqz5ZoKcJdABm5VruBA=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-ykcBsIV8P2aL9yTQr6fu1g-1; Sun, 23 Aug 2026 16:42:20 -0400
X-MC-Unique: ykcBsIV8P2aL9yTQr6fu1g-1
X-Mimecast-MFC-AGG-ID: ykcBsIV8P2aL9yTQr6fu1g_1787517739
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66c7115a286so3384653d50.2
        for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 13:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787517739; x=1788122539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFDV+7W8DGFkHuzF8rYKzLPJzOVSHo8h0lJMwZdjIRY=;
        b=UpbgNS6pOVwACm6qqTi23WuBwtiqShNs+GPMUTvGjU8KPvrXuqhozVa2x9ZW0P+IDx
         65kaTCTA25w19DzErgrcKI1Wljwa+KNWhhLRo3+2bujm3FNmDIUM6itlvR6pI6X2O2RM
         udSM+67gulhl89t+F/uH5XjPGi7ypVCrNiCLVTtpyRA53QkXSxayv8KNFaOale4IwfJH
         BgSl8k5uI3e/3sWzQUD9F959z1QxX37Slh31Iw8hui4ZOBva4tDKvp+6QOS4KIwSJbCi
         7tJ+InFJcYUHLNJIn+OVFT5qhWYhC9m/d4W497z+0yZrmMvy02RPlriaIr7A1+UBqF2k
         07XA==
X-Gm-Message-State: AFuF++kymdcOPDvZWGaL5ZoNH6+ExWlrGb8pZpD+/6vRKjWRIMoILTdY
	QrVrygPr2G5TnEjFB7PSWMrNfV/ACRrdPpXIaSY6DXSTYAwH7I1PbcpDoVApa6ZoG7D3SjpGIz+
	FkfTM3SbkMd5Kjhe6a/lP9RDlXinKSnD2A0PChttYIz72Ai6rvKmlMPi/V/PW4kNVzwtAV6XWms
	Q49q/jcOMPpIgk1voK9j5aWH6JCazR2zzq75iO
X-Gm-Gg: AR+sD12VjhPc+2qzoIp1TZwkeMAM1BrWZP805WtHXXSJzgAMec749oP7DmUcgwb/4Oj
	5GeNgFlWcXWa4au4Dg39/HCje/y2+j0Vjefvn8iPhPxRToG3Jau0QGW8Nm9X4JAF8k8qUSixmzR
	z6rfSmHW1fExVjzZfbYyHMHxNCTq3e+ncDnGiY+Z+YH9GpSlbOn2X0A2An7j4bTILz6+az7ckIw
	5rfvayY5z/V980Bi+IBMqpNZKYnfCc+yCt+ETNVTDKQ
X-Received: by 2002:a05:690e:12:b0:667:e855:ecdb with SMTP id 956f58d0204a3-66ce49d4b1fmr5604257d50.3.1787517739053;
        Sun, 23 Aug 2026 13:42:19 -0700 (PDT)
X-Received: by 2002:a05:690e:12:b0:667:e855:ecdb with SMTP id
 956f58d0204a3-66ce49d4b1fmr5604246d50.3.1787517738603; Sun, 23 Aug 2026
 13:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a74d41a.f3f7def5.e164f.560e@mx.google.com> <202608240109.e8n1gQMm-lkp@intel.com>
In-Reply-To: <202608240109.e8n1gQMm-lkp@intel.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 23 Aug 2026 22:42:07 +0200
X-Gm-Features: AcwNN1UeCLf-8yi08Yx6qdKDCYCeST64r39VmSBwQ5AuetcO8mC9dd_i8vStyuY
Message-ID: <CAHc6FU6Z=LbnW2UNTgORQKV2e7=sFiOzv3+0qLkULxiEKdz+Aw@mail.gmail.com>
Subject: Re: [PATCH v2] gfs2: annotate i_gl with __rcu and convert to accessor helpers
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, 
	Adrian Garcia Casado <adriangarciacasado42@gmail.com>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, gfs2@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EhaQlbp-_LsNTSBNyKQDah_bK2jVNn7_KFSS0PQxhvM_1787517739
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dan,

On Sun, Aug 23, 2026 at 9:02=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
> Hi Adrian,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Garcia-Casa=
do/gfs2-annotate-i_gl-with-__rcu-and-convert-to-accessor-helpers/20260806-1=
13610
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.g=
it for-next
> patch link:    https://lore.kernel.org/r/6a74d41a.f3f7def5.e164f.560e%40m=
x.google.com
> patch subject: [PATCH v2] gfs2: annotate i_gl with __rcu and convert to a=
ccessor helpers
> config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20=
260824/202608240109.e8n1gQMm-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> smatch: v0.5.0-9187-g5189e3fb
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202608240109.e8n1gQMm-lkp@intel.com/
>
> New smatch warnings:
> fs/gfs2/inode.c:150 gfs2_inode_lookup() warn: inconsistent indenting
>
> vim +150 fs/gfs2/inode.c
>
> 194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  127  =
struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
> 3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  128  =
                               u64 no_addr, u64 no_formal_ino,
> 3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  129  =
                               unsigned int blktype)
> 194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  130  =
{
> 194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  131  =
       struct inode *inode;
> 194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  132  =
       struct gfs2_inode *ip;
> 3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  133  =
       struct gfs2_holder i_gh;
> 194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  134  =
       int error;
> 194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  135
> 6df9f9a253c7dc fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-17  136  =
       gfs2_holder_mark_uninitialized(&i_gh);
> 5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  137  =
       inode =3D iget5_locked(sb, no_addr, iget_test, iget_set, &no_addr);
> 194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  138  =
       if (!inode)
> ac3beb6a5de048 fs/gfs2/inode.c     Steven Whitehouse    2014-01-16  139  =
               return ERR_PTR(-ENOMEM);
> 194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  140
> e97321fa095f1e fs/gfs2/inode.c     Bob Peterson         2016-04-12  141  =
       ip =3D GFS2_I(inode);
> e97321fa095f1e fs/gfs2/inode.c     Bob Peterson         2016-04-12  142
> 40a4c512ad2564 fs/gfs2/inode.c     Mateusz Guzik        2025-10-09  143  =
       if (inode_state_read_once(inode) & I_NEW) {
> 194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  144  =
               struct gfs2_sbd *sdp =3D GFS2_SB(inode);
> 5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  145  =
               struct gfs2_glock *io_gl;
> c412a97cf6c525 fs/gfs2/inode.c     Bob Peterson         2022-08-22  146  =
               int extra_flags =3D 0;
> 194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  147
> 2c5f4a53476e3c fs/gfs2/inode.c     Andreas Gruenbacher  2025-11-13  148  =
               gfs2_setup_inode(inode);
> f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  149  =
               { struct gfs2_glock *gl;
> f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06 @150  =
               error =3D gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CR=
EATE, &gl);
> f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  151  =
               if (!error)
> f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  152  =
                       rcu_assign_pointer(ip->i_gl, gl); }
>
> What's going with the indenting?  This looks like debug code
> accidentlly escaped?

this patch can be ignored; it has been superseded by the following patch se=
t:

https://lore.kernel.org/gfs2/20260820142129.1327413-1-agruenba@redhat.com

Thanks,
Andreas

> 29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  153  =
               if (unlikely(error))
> 29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  154  =
                       goto fail;
> 29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  155
> 29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  156  =
               error =3D gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CR=
EATE,
> 29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  157  =
                                      &io_gl);
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

